#!/usr/bin/env python3
"""Find reference-decomp C files (e.g. FireEmblem7J) that port to FE7U as-is.

Usage: tools/port_ref.py REF_OBJ_DIR [--json plan.json]

REF_OBJ_DIR holds the reference project's unlinked objects; C objects are
those named src_*.o.  Needs a current `make` (reads fe7u.elf/fe7u.gba and
build/**/*.o).

A C file is portable when each of its functions matches one of ours
byte-for-byte (relocated words excepted), the functions sit contiguously in
the same order, and every relocation resolves consistently:
  * calls/pointers to functions must hit the matching function of ours;
  * references to data give that symbol's FE7U address;
  * references into the file's own sections give each section's FE7U base.
ROM sections (.data/.rodata) must also match the ROM bytes at their base.
"""
import json
import struct
import sys
from collections import defaultdict
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
import match_names  # noqa: E402
from elf32 import (Elf, R_ARM_ABS32, R_ARM_THM_CALL, SHF_ALLOC, SHN_COMMON,  # noqa: E402
                   SHN_UNDEF, SHT_NOBITS, STT_FUNC, STT_SECTION)

ROM_BASE = 0x08000000
RAM_PREFIXES = ("ewram", "iwram", ".bss", "COMMON")


def is_ram(name):
    return name.startswith(RAM_PREFIXES)


class Conflict(Exception):
    pass


class Ours:
    def __init__(self):
        self.rom = Path("fe7u.gba").read_bytes()
        elf = Elf("fe7u.elf")
        self.addr, self.thumb = {}, {}
        for s in elf.symbols:
            if s.type == STT_FUNC:
                self.addr[s.name] = s.value & ~1
                self.thumb[s.name] = s.value & 1
        self.by_addr = {a: n for n, a in self.addr.items()}
        self.sorted = sorted(self.by_addr)

    def word(self, a):
        return struct.unpack_from("<I", self.rom, a - ROM_BASE)[0]

    def bytes(self, a, n):
        return self.rom[a - ROM_BASE:a - ROM_BASE + n]

    def next_func(self, a):
        import bisect
        i = bisect.bisect_right(self.sorted, a)
        return self.sorted[i] if i < len(self.sorted) else 0x080C57DC

    def bl_target(self, a):
        h, h2 = struct.unpack_from("<HH", self.rom, a - ROM_BASE)
        if (h & 0xF800) != 0xF000 or (h2 & 0xF800) != 0xF800:
            return None
        imm = ((h & 0x7FF) << 12) | ((h2 & 0x7FF) << 1)
        if imm & 0x400000:
            imm -= 0x800000
        return a + 4 + imm


class Analysis:
    def __init__(self, ref_dir):
        self.ours = Ours()
        ref_objs = sorted(Path(ref_dir).glob("*.o"))
        pairs = match_names.match(match_names.load(ref_objs),
                                  match_names.load(sorted(Path("build").rglob("*.o"))))
        self.fmap = {r: o for o, (r, _) in pairs.items()}  # ref func -> our func
        self.objs = {p.stem: Elf(p) for p in ref_objs}
        # ref symbol name -> (obj stem, Symbol) for global definitions
        self.defs = {}
        for stem, e in self.objs.items():
            for s in e.symbols:
                if s.bind == 1 and s.shndx != SHN_UNDEF and s.type != STT_SECTION:
                    self.defs.setdefault(s.name, (stem, s))
        self.sym_addr = {}         # ref data symbol -> FE7U address
        self.sym_src = {}
        self.learned = {}          # ref func -> our func, from calls
        self.call_alias = {}       # (obj, ref veneer) -> our copy actually called
        self.base = {}             # (obj stem, section name) -> FE7U address
        self.orphans = {}          # obj stem -> our functions with no ref counterpart
        self.problems = defaultdict(list)

    # -- constraint recording ------------------------------------------
    def set_sym(self, name, addr, where):
        old = self.sym_addr.get(name)
        if old is not None and old != addr:
            raise Conflict(f"{name}: {old:#x} vs {addr:#x} ({self.sym_src[name]} / {where})")
        self.sym_addr[name] = addr
        self.sym_src.setdefault(name, where)

    def set_base(self, key, addr, where):
        old = self.base.get(key)
        if old is not None and old != addr:
            raise Conflict(f"{key[0]}:{key[1]} base {old:#x} vs {addr:#x} ({where})")
        self.base[key] = addr

    def our_func(self, ref_name):
        return self.fmap.get(ref_name) or self.learned.get(ref_name)

    def resolve(self, stem, e, sec_addr, off, rtype, sym, where):
        """Check one relocation at FE7U address sec_addr+off."""
        a = sec_addr + off
        if rtype == R_ARM_THM_CALL:
            t = self.ours.bl_target(a)
            if t is None:
                raise Conflict(f"{where}: no BL at {a:#x}")
            if sym.shndx != SHN_UNDEF:
                key = (stem, e.sections[sym.shndx].name)
                self.set_base(key, t - (sym.value & ~1), where)
                return
            f = self.our_func(sym.name)
            if f is None:
                if t not in self.ours.by_addr:
                    raise Conflict(f"{where}: call to {sym.name} -> {t:#x}, not a function")
                self.learned[sym.name] = self.ours.by_addr[t]
            elif self.ours.addr[f] != t:
                d = self.defs.get(sym.name)
                if not (d and d[1].size and d[1].size <= 8) or t not in self.ours.by_addr:
                    raise Conflict(f"{where}: call to {sym.name} hits {t:#x}, expected {f}")
                self.call_alias[(where.split(':')[0], sym.name)] = self.ours.by_addr[t]
            return
        if rtype != R_ARM_ABS32:
            raise Conflict(f"{where}: unsupported reloc type {rtype}")
        addend = struct.unpack_from("<I", e.sections[self._cur_shndx].data, off)[0] if self._cur_data else 0
        w = self.ours.word(a)
        if sym.shndx not in (SHN_UNDEF, SHN_COMMON):
            key = (stem, e.sections[sym.shndx].name)
            self.set_base(key, (w - addend - sym.value) & 0xFFFFFFFF, where)
            return
        d = self.defs.get(sym.name)
        if d and d[1].type == STT_FUNC or self.our_func(sym.name):
            f = self.our_func(sym.name)
            if f is None:
                if (w - addend) & ~1 not in self.ours.by_addr:
                    raise Conflict(f"{where}: pointer to {sym.name} = {w:#x}, not a function")
                self.learned[sym.name] = self.ours.by_addr[(w - addend) & ~1]
            elif (self.ours.addr[f] | self.ours.thumb[f]) + addend != w:
                raise Conflict(f"{where}: pointer to {sym.name} = {w:#x}, expected {f}")
            return
        self.set_sym(sym.name, (w - addend) & 0xFFFFFFFF, where)

    def check_section(self, stem, e, sec, addr, where):
        """Compare a section's bytes with ours at addr, resolving relocations."""
        self._cur_shndx, self._cur_data = sec.index, True
        ours = self.ours.bytes(addr, sec.size)
        skip = set()
        for off, rtype, sym in sec.relocs:
            skip.update(range(off, off + 4))
        for i, (x, y) in enumerate(zip(sec.data, ours)):
            if i not in skip and x != y:
                raise Conflict(f"{where}: byte mismatch at +{i:#x} ({addr + i:#x})")
        for off, rtype, sym in sorted(sec.relocs, key=lambda r: r[0]):
            self.resolve(stem, e, addr, off, rtype, sym, f"{where}+{off:#x}")

    # -- per-object analysis --------------------------------------------
    def analyze_text(self, stem):
        """Map a C object's .text onto ours; return its FE7U address.

        Any matched function anchors the file; the rest are placed by
        offset and then verified byte-for-byte by check_section.
        """
        e = self.objs[stem]
        text = e.section(".text")
        if text is None or not text.size:
            return None
        funcs = e.functions(text.index)
        if not funcs or funcs[0].value & ~1:
            raise Conflict("text does not start with a function")
        anchors = {}
        for f in funcs:
            o = self.our_func(f.name)
            if o is not None:
                start = self.ours.addr[o] - (f.value & ~1)
                anchors[start] = anchors.get(start, 0) + 1
        if not anchors:
            raise Conflict("no function matches FE7U")
        start = max(anchors, key=anchors.get)
        end = start + text.size
        if start not in self.ours.by_addr:
            raise Conflict(f"start {start:#x} is not a function in FE7U")
        if end not in self.ours.by_addr and end != 0x080C57DC:
            raise Conflict(f"end {end:#x} is not a function boundary in FE7U")
        offsets = {start + (f.value & ~1) for f in funcs}
        orphans = [self.ours.by_addr[a] for a in self.ours.sorted if start <= a < end and a not in offsets]
        self.set_base((stem, ".text"), start, stem)
        self.check_section(stem, e, text, start, f"{stem}:.text")
        for f in funcs:
            a = start + (f.value & ~1)
            if a in self.ours.by_addr:
                self.fmap.setdefault(f.name, self.ours.by_addr[a])
        self.orphans[stem] = orphans
        return start

    def run(self):
        c_objs = [s for s in self.objs if s.startswith("src_")]
        # Pass 1: code, which pins down most data symbols and section bases.
        text_ok = {}
        for stem in c_objs:
            try:
                text_ok[stem] = self.analyze_text(stem)
            except Conflict as ex:
                self.problems[stem].append(str(ex))
        # Pass 2: section bases from global symbols pinned by other files.
        for stem in c_objs:
            e = self.objs[stem]
            for s in e.symbols:
                if s.name in self.sym_addr and s.shndx not in (SHN_UNDEF, SHN_COMMON) and s.type != STT_SECTION:
                    try:
                        self.set_base((stem, e.sections[s.shndx].name), self.sym_addr[s.name] - s.value, s.name)
                    except Conflict as ex:
                        self.problems[stem].append(str(ex))
        # Pass 3: ROM data sections.
        plan = {}
        for stem in c_objs:
            if self.problems[stem]:
                continue
            e = self.objs[stem]
            secs = {}
            try:
                for sec in e.sections:
                    if not (sec.flags & SHF_ALLOC) or not sec.size or sec.name == ".text":
                        continue
                    key = (stem, sec.name)
                    if sec.type == SHT_NOBITS or is_ram(sec.name):
                        secs[sec.name] = {"addr": self.base.get(key), "size": sec.size, "ram": True}
                        continue
                    if key not in self.base:
                        found = self.search(sec)
                        if found is None:
                            raise Conflict(f"{sec.name}: FE7U location unknown")
                        self.base[key] = found
                    self.check_section(stem, e, sec, self.base[key], f"{stem}:{sec.name}")
                    secs[sec.name] = {"addr": self.base[key], "size": sec.size, "ram": False}
                commons = [s.name for s in e.symbols if s.shndx == SHN_COMMON]
                plan[stem] = {"text": text_ok.get(stem), "orphans": self.orphans.get(stem, []), "text_size": (e.section(".text").size if e.section(".text") else 0),
                              "sections": secs, "commons": commons}
            except Conflict as ex:
                self.problems[stem].append(str(ex))
        return plan

    def search(self, sec):
        """Locate a ROM section by its bytes (relocated words wildcarded)."""
        skip = set()
        for off, _, _ in sec.relocs:
            skip.update(range(off, off + 4))
        # anchor on the longest run of fixed bytes
        best, cur, start = (0, 0), 0, 0
        for i in range(sec.size + 1):
            if i < sec.size and i not in skip:
                if not cur:
                    start = i
                cur += 1
            else:
                if cur > best[1]:
                    best = (start, cur)
                cur = 0
        a0, n = best
        if n < 8:
            return None
        needle = sec.data[a0:a0 + n]
        rom, hits, pos = self.ours.rom, [], 0
        while len(hits) < 2:
            pos = rom.find(needle, pos)
            if pos < 0:
                break
            cand = pos - a0
            if cand >= 0 and cand % 4 == 0 and all(
                    i in skip or rom[cand + i] == sec.data[i] for i in range(sec.size)):
                hits.append(cand + ROM_BASE)
            pos += 1
        return hits[0] if len(hits) == 1 else None


def main():
    a = Analysis(sys.argv[1])
    plan = a.run()
    ok = sorted(plan)
    print(f"portable: {len(ok)} / {len([s for s in a.objs if s.startswith('src_')])}")
    for stem in ok:
        p = plan[stem]
        t = f"{p['text']:#x}+{p['text_size']:#x}" if p["text"] else "-"
        extra = " ".join(f"{n}@{v['addr']:#x}" if v["addr"] else f"{n}@?" for n, v in p["sections"].items())
        orph = f" orphans={','.join(p['orphans'])}" if p["orphans"] else ""
        print(f"  {stem:40} {t:22} {extra}{orph}")
    print("not portable:")
    for stem, probs in sorted(a.problems.items()):
        if probs:
            print(f"  {stem}: {probs[0]}")
    if "--json" in sys.argv:
        out = {
            "files": plan,
            "sym_addr": a.sym_addr,
            "fmap": {**a.fmap, **a.learned},
            "call_alias": {f"{k[0]}:{k[1]}": v for k, v in a.call_alias.items()},
        }
        Path(sys.argv[sys.argv.index("--json") + 1]).write_text(json.dumps(out, indent=1, sort_keys=True))


if __name__ == "__main__":
    main()
