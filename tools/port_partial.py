#!/usr/bin/env python3
"""Plan partial ports: reference C files where only some functions match FE7U.

Usage: tools/port_partial.py REF_OBJ_DIR --json plan.json [STEM...]

Extends tools/port_ref.py.  Reference functions are paired with FE7U
functions (matches from match_names, then same-count gaps between matches
paired in order); each pair is checked on its own.  Pairs that match stay
C; everything else in the FE7U range becomes ASM_FUNC.  The file's ROM
data sections must still match as a whole.

The plan's "files" entries gain "funcs": [[FE7U addr, ref name or null,
"c" | "asm"], ...] in FE7U order; tools/apply_port.py reads it.
"""
import json
import struct
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from elf32 import R_ARM_ABS32, R_ARM_THM_CALL, SHF_ALLOC, SHN_COMMON, SHN_UNDEF, SHT_NOBITS, STT_FUNC  # noqa: E402
from port_ref import Analysis, Conflict, is_ram  # noqa: E402

CODE_END = 0x080C57DC


def bl_offset(data, off):
    h, h2 = struct.unpack_from("<HH", data, off)
    if (h & 0xF800) != 0xF000 or (h2 & 0xF800) != 0xF800:
        return None
    imm = ((h & 0x7FF) << 12) | ((h2 & 0x7FF) << 1)
    if imm & 0x400000:
        imm -= 0x800000
    return off + 4 + imm


class Partial(Analysis):
    def pair(self, stem):
        """Pair the object's functions with FE7U functions, in order."""
        e = self.objs[stem]
        text = e.section(".text")
        funcs = e.functions(text.index)
        offs = [f.value & ~1 for f in funcs] + [text.size]
        jf = [(f.name, offs[i], offs[i + 1] - offs[i]) for i, f in enumerate(funcs)]
        us = [self.ours.addr[self.our_func(n)] if self.our_func(n) else None for n, _, _ in jf]
        anchors = [i for i, a in enumerate(us) if a is not None]
        if not anchors:
            raise Conflict("no function matches FE7U")
        seq = [us[i] for i in anchors]
        if seq != sorted(seq) or len(set(seq)) != len(seq):
            raise Conflict("matched functions are out of order in FE7U")
        order = self.ours.sorted

        def us_between(lo, hi):  # FE7U functions strictly between two addresses
            import bisect
            return order[bisect.bisect_right(order, lo):bisect.bisect_left(order, hi)]

        paired = dict(zip(anchors, seq))
        # gaps between anchors
        for a, b in zip(anchors, anchors[1:]):
            gap_j = list(range(a + 1, b))
            gap_u = us_between(us[a], us[b])
            if gap_j and len(gap_j) == len(gap_u):
                paired.update(zip(gap_j, gap_u))
        # leading / trailing functions: take as many FE7U neighbours
        first, last = anchors[0], anchors[-1]
        import bisect
        i0 = order.index(us[first])
        if first:
            if i0 - first < 0:
                raise Conflict("leading functions run past start of code")
            paired.update(zip(range(first), order[i0 - first:i0]))
        i1 = order.index(us[last])
        tail = len(jf) - 1 - last
        if tail:
            if i1 + tail >= len(order):
                raise Conflict("trailing functions run past end of code")
            paired.update(zip(range(last + 1, len(jf)), order[i1 + 1:i1 + 1 + tail]))
        start = min(paired.values())
        end_fn = max(paired.values())
        end = self.ours.next_func(end_fn)
        return e, text, jf, paired, start, end

    def check_func(self, stem, e, text, jf, paired, k):
        """True if reference function k matches its FE7U partner."""
        name, off, size = jf[k]
        u = paired[k]
        if self.ours.next_func(u) - u != size:
            return False
        at = {o: i for i, (_, o, _) in enumerate(jf)}
        relocs = [(o, t, s) for o, t, s in text.relocs if off <= o < off + size]
        skip = set()
        for o, _, _ in relocs:
            skip.update(range(o, o + 4))
        jb, ub = text.data[off:off + size], self.ours.bytes(u, size)
        # local BLs resolved at assembly time: compare targets, not bytes
        local_calls = []
        o = 0
        while o + 3 < size:
            if off + o not in skip:
                t = bl_offset(text.data, off + o)
                if t is not None and t in at:
                    local_calls.append((o, at[t]))
                    skip.update(range(off + o, off + o + 4))
                    o += 4
                    continue
            o += 2
        for i in range(size):
            if off + i not in skip and jb[i] != ub[i]:
                return False
        for o, callee in local_calls:
            tgt = self.ours.bl_target(u + o)
            if callee not in paired or tgt != paired[callee]:
                return False
        self._cur_shndx, self._cur_data = text.index, True
        for o, rtype, sym in relocs:
            where = f"{stem}:{name}+{o - off:#x}"
            if sym.shndx == text.index:  # into this .text: must be a paired function
                if rtype == R_ARM_THM_CALL:
                    tgt_off = sym.value & ~1
                    addend = 0
                else:
                    addend = struct.unpack_from("<I", text.data, o)[0]
                    tgt_off = (sym.value + addend) & ~1
                callee = at.get(tgt_off)
                if callee is None or callee not in paired:
                    return False
                a = u + (o - off)
                got = self.ours.bl_target(a) if rtype == R_ARM_THM_CALL else self.ours.word(a) & ~1
                if got != paired[callee]:
                    return False
                continue
            try:
                self.resolve(stem, e, u - off, o, rtype, sym, where)
            except Conflict:
                return False
        return True

    def resolve(self, stem, e, sec_addr, off, rtype, sym, where):
        """As Analysis.resolve, but references into a partially ported .text
        are checked against the function pairing, not a single base."""
        ctx = getattr(self, "_ctx", None)
        text = e.section(".text")
        if ctx and ctx[0] == stem and text is not None and sym.shndx == text.index:
            _, jf, paired = ctx
            at = {o: i for i, (_, o, _) in enumerate(jf)}
            a = sec_addr + off
            if rtype == R_ARM_THM_CALL:
                tgt_off, got = sym.value & ~1, self.ours.bl_target(a)
            else:
                addend = struct.unpack_from("<I", e.sections[self._cur_shndx].data, off)[0]
                tgt_off, got = (sym.value + addend) & ~1, self.ours.word(a) & ~1
            k = at.get(tgt_off)
            if k is None or k not in paired or paired[k] != got:
                raise Conflict(f"{where}: reference into .text does not match the pairing")
            return
        return super().resolve(stem, e, sec_addr, off, rtype, sym, where)

    def partial(self, stem):
        e, text, jf, paired, start, end = self.pair(stem)
        self._ctx = (stem, jf, paired)
        status = {k: self.check_func(stem, e, text, jf, paired, k) for k in paired}
        if not any(status.values()):
            raise Conflict("no function matches individually")
        for k, ok in status.items():
            if ok or k in paired:
                self.fmap.setdefault(jf[k][0], self.ours.by_addr[paired[k]])
        by_us = {paired[k]: k for k in paired}
        funcs = []
        for a in self.ours.sorted:
            if start <= a < end:
                k = by_us.get(a)
                funcs.append([a, jf[k][0] if k is not None else None, "c" if k is not None and status[k] else "asm"])
        # data sections must match as a whole
        secs = {}
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
        dropped = [jf[k][0] for k in range(len(jf)) if k not in paired]
        return {"text": start, "text_size": end - start, "sections": secs,
                "commons": [s.name for s in e.symbols if s.shndx == SHN_COMMON],
                "orphans": [], "funcs": funcs, "dropped": dropped}


def main():
    a = Partial(sys.argv[1])
    full = a.run()
    want = [s for s in sys.argv[2:] if s.startswith("src_")]
    todo = want or [s for s in a.objs if s.startswith("src_") and s not in full]
    plan = {}
    for stem in sorted(todo):
        try:
            if a.objs[stem].section(".text") is None or not a.objs[stem].section(".text").size:
                raise Conflict("no code")
            plan[stem] = a.partial(stem)
            f = plan[stem]["funcs"]
            nc = sum(1 for x in f if x[2] == "c")
            print(f"  {stem:40} {plan[stem]['text']:#x}+{plan[stem]['text_size']:#x}  C {nc}/{len(f)}"
                  + (f"  dropped {plan[stem]['dropped']}" if plan[stem]["dropped"] else ""))
        except Conflict as ex:
            print(f"  {stem:40} FAILED: {ex}")
    if "--json" in sys.argv:
        out = {"files": plan, "sym_addr": a.sym_addr, "fmap": {**a.fmap, **a.learned}}
        Path(sys.argv[sys.argv.index("--json") + 1]).write_text(json.dumps(out, indent=1, sort_keys=True))


if __name__ == "__main__":
    main()
