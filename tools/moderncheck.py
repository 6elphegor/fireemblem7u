#!/usr/bin/env python3
"""Check a modern build against the original ROM.  Run from the repo root.

  tools/moderncheck.py [MODERN_ELF [MODERN_ROM]]      (or: make modern-check)

Defaults: build/modern/fe7u_modern.elf and fe7u_modern.gba.  The original
is baserom.gba, with its symbol addresses from fe7u.elf (the last matching
build: build it before editing assets, since an edited asset makes the
matching link fail).

Every object is matched between the two ROMs through anchors: the data
sections of the modern layout (build/modern/layout.txt has their original
addresses, the modern map their new ones) and every symbol both ELFs define
once.  An original address a maps to anchor + (a - anchor's original
address), using the last anchor at or before a.  Where two neighboring
anchors are not the same distance apart in both ROMs, something between
them changed size (an edited asset, plus alignment padding): those
"resized" ranges are listed and not compared.  Everywhere else:

  * pointers: every R_ARM_ABS32 relocation of the modern link (it is linked
    with --emit-relocs), in code and data, must hold its original value with
    the target moved the way the object it pointed at moved (Thumb bit and
    AnimScr flag bits kept): a pointer points at the same object, at the
    same offset, in both ROMs;
  * the battle animation scripts are decompressed from both ROMs: sheet
    pointers moved with their sheets, everything else equal;
  * every other byte is the original byte;
  * alignment: no anchor lost its alignment (a 4-aligned original address
    is 4-aligned in the modern ROM, and so on for 2).

WRONG (the last line) counts failures of these.  Also reported, as risks
rather than errors: words that are not relocations but hold the original
address of something that moved (a pointer that was left as raw data would
now point at the wrong place; most are graphics or packed values that only
look like addresses).
"""
import bisect
import collections
import re
import struct
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
import banim, elf32, gfx  # noqa: E401,E402

ROM_BASE = 0x08000000
DATA_START = 0x080C57DC
ROM_LIMIT = 0x0A000000
MODERN_DIR = Path("build/modern")


def symbols(path):
    """{name: value} of the symbols defined exactly once in ROM, and the set
    of names defined more than once."""
    seen, dup = {}, set()
    for s in elf32.Elf(path).symbols:
        if (not s.name or s.name.startswith("$") or s.type in (elf32.STT_SECTION, 4)
                or s.shndx == elf32.SHN_UNDEF or not ROM_BASE <= s.value < ROM_LIMIT):
            continue
        v = s.value & ~1 if s.type == elf32.STT_FUNC else s.value
        if s.name in seen and seen[s.name] != v:
            dup.add(s.name)
        seen[s.name] = v
    return seen, dup


def map_sections(path):
    """{'object(section)': (address, size)} of the input sections in a map."""
    out = {}
    lines = Path(path).read_text().split("Linker script and memory map", 1)[1].splitlines()
    for i, line in enumerate(lines):
        f = line.split()
        if not line.startswith(" .") or len(f) not in (1, 4):
            continue
        if len(f) == 1:
            if i + 1 >= len(lines) or len(g := lines[i + 1].split()) != 3 or not g[0].startswith("0x"):
                continue
            f = f + g
        if f[1].startswith("0x"):
            o = f[3]
            if m := re.fullmatch(r"(?:.*/)?([^/]+\.a)\((.*)\)", o):  # archive member
                o = f"*{m.group(1)}:{m.group(2)}"
            out.setdefault(f"{o}({f[0]})", (int(f[1], 16), int(f[2], 16)))
    return out


def main():
    melf = Path(sys.argv[1] if len(sys.argv) > 1 else MODERN_DIR / "fe7u_modern.elf")
    mrom_path = Path(sys.argv[2] if len(sys.argv) > 2 else "fe7u_modern.gba")
    mmap = melf.with_suffix(".map")
    if not Path("fe7u.elf").exists():
        sys.exit("tools/moderncheck.py: needs fe7u.elf from a matching build (run `make` before editing assets)")
    orig = Path("baserom.gba").read_bytes()
    mod = mrom_path.read_bytes()

    def ow(a, rom=orig):
        return struct.unpack_from("<I", rom, a - ROM_BASE)[0]

    def mw(a):
        return ow(a, mod)

    # --- anchors -------------------------------------------------------------
    layout = []
    for line in (MODERN_DIR / "layout.txt").read_text().splitlines():
        if line.startswith("rom "):
            _, addr, size, obj = line.split()
            layout.append((int(addr, 16), int(size, 16), obj))
    layout.sort()
    lstarts = [a for a, _, _ in layout]
    placed = map_sections(mmap)
    sec_anchor = {}
    for addr, size, obj in layout:
        if obj not in placed:
            sys.exit(f"{obj} not found in {mmap}")
        sec_anchor[addr] = placed[obj][0]
    osyms, odup = symbols("fe7u.elf")
    msyms, mdup = symbols(melf)
    anchors = dict(sec_anchor)
    for name, o in osyms.items():
        if name in msyms and name not in odup and name not in mdup and o not in sec_anchor:
            m = msyms[name]
            # two names at one original address: keep the later placement
            # (a name at the end of one object is also the start of the next)
            anchors[o] = max(anchors.get(o, m), m)
    anchors[ROM_BASE] = ROM_BASE
    pairs = sorted(anchors.items())
    # names that moved backwards relative to their neighbors (would be a
    # misplaced label): dropped from the anchors, reported
    keep, bad_order = [], []
    for o, m in pairs:
        if keep and m < keep[-1][1]:
            bad_order.append((o, m))
            continue
        keep.append((o, m))
    olist = [o for o, _ in keep]
    mlist = [m for _, m in keep]
    oname = {v: k for k, v in osyms.items()}

    def mv(a):
        i = bisect.bisect_right(olist, a) - 1
        return mlist[i] + (a - olist[i])

    def back(m):
        i = bisect.bisect_right(mlist, m) - 1
        return olist[i] + (m - mlist[i])

    def name_of(a):
        i = bisect.bisect_right(olist, a) - 1
        o = olist[i]
        return f"{oname.get(o, f'{o:#x}')}+{a - o:#x}"

    # ranges that changed size between neighboring anchors
    end_o, end_m = ROM_BASE + len(orig), ROM_BASE + len(mod)
    resized = []
    for i in range(len(olist)):
        no = olist[i + 1] if i + 1 < len(olist) else end_o
        nm = mlist[i + 1] if i + 1 < len(mlist) else end_m
        if no - olist[i] != nm - mlist[i]:
            if resized and resized[-1][1] == olist[i]:
                resized[-1] = (resized[-1][0], no, resized[-1][2] + (nm - mlist[i]) - (no - olist[i]))
            else:
                resized.append((olist[i], no, (nm - mlist[i]) - (no - olist[i])))
    rstarts = [s for s, _, _ in resized]

    def in_resized(a):
        i = bisect.bisect_right(rstarts, a) - 1
        return i >= 0 and a < resized[i][1]

    def in_rom(v):
        return ROM_BASE <= v < ROM_LIMIT

    def moved(v):
        """v with its target moved (Thumb bit and AnimScr flag bits kept)."""
        t = v & 0x0FFFFFFF if (v >> 28) and in_rom(v & 0x0FFFFFFF) else v
        if not in_rom(t) or in_resized(t & ~1) and t & ~1 not in anchors:
            return None if in_rom(t) else v
        base = t & ~1
        return (v - base + mv(base)) & 0xFFFFFFFF

    print(f"original ROM {len(orig):#x} bytes, modern {len(mod):#x} bytes ({len(mod) - len(orig):+#x}); "
          f"anchors: {len(keep)} ({len(sec_anchor)} sections)")
    print(f"resized ranges: {len(resized)}")
    for s, e, d in resized[:30]:
        print(f"  {s:#010x}-{e:#010x} {name_of(s):40s} {d:+#x} bytes (object and padding)")
    if bad_order:
        print(f"anchors out of order (dropped): {len(bad_order)}")
        for o, m in bad_order[:10]:
            print(f"  {oname.get(o, hex(o))} {o:#x} -> {m:#x}")

    # --- pointers: every ABS32 relocation of the modern link --------------------
    e = elf32.Elf(melf)
    relocs = set()
    for sec in e.sections:
        for off, typ, _ in sec.relocs:
            if typ == elf32.R_ARM_ABS32 and ROM_BASE <= off < end_m:
                relocs.add(off)
    rel_bytes = set()
    for m in relocs:
        rel_bytes.update(range(m, m + 4))
    bad_ptr, n_moved, n_same, n_resized, n_interior = [], 0, 0, 0, 0
    for m in sorted(relocs):
        o = back(m)
        if in_resized(o):
            n_resized += 1
            continue
        ov, nv = ow(o), mw(m)
        want = moved(ov)
        if want is None:  # points inside an object that changed size
            n_interior += 1
            continue
        if nv != want:
            bad_ptr.append((o, m, ov, nv, want))
        elif nv != ov:
            n_moved += 1
        else:
            n_same += 1
    print(f"pointers (relocations): {len(relocs)}; moved with their target: {n_moved}; "
          f"unchanged: {n_same}; in resized ranges: {n_resized}; into a resized object: {n_interior}; "
          f"WRONG: {len(bad_ptr)}")
    for o, m, ov, nv, want in bad_ptr[:20]:
        print(f"  {name_of(o)} ({o:#x} -> {m:#x}): {ov:08X} -> {nv:08X}, expected {want:08X} ({name_of(ov & 0x0FFFFFFE)})")

    # --- battle animation scripts --------------------------------------------------
    scripts = banim.scripts()
    banim_ranges = []
    bad_sheet, bad_other, sheets_moved, nsheets = [], [], 0, 0
    for addr, size, name in scripts:
        na = mv(addr)
        od, olen = gfx.lz77_decompress(orig, addr - ROM_BASE)
        nd, nlen = gfx.lz77_decompress(mod, na - ROM_BASE)
        banim_ranges.append((addr, size))
        if len(od) != len(nd):
            bad_other.append((name, "length", len(od), len(nd)))
            continue
        sheet_offs = banim.sheet_words(od)
        for off in range(0, len(od), 4):
            o, n = struct.unpack_from("<I", od, off)[0], struct.unpack_from("<I", nd, off)[0]
            if off in sheet_offs:
                nsheets += 1
                if n != moved(o):
                    bad_sheet.append((name, off, o, n))
                elif n != o:
                    sheets_moved += 1
            elif o != n:
                bad_other.append((name, off, o, n))
        # the mode table after the compressed script
        opad, npad = (olen + 3) & ~3, (nlen + 3) & ~3
        if orig[addr + opad - ROM_BASE:addr + size - ROM_BASE] != mod[na + npad - ROM_BASE:na + npad + size - opad - ROM_BASE]:
            bad_other.append((name, "mode table"))
    print(f"battle animation scripts: {len(scripts)}; sheet pointers {nsheets}, moved: {sheets_moved}; "
          f"WRONG: {len(bad_sheet) + len(bad_other)}")
    for x in (bad_sheet + bad_other)[:10]:
        print("  ", x)
    bstarts = [a for a, _ in banim_ranges]

    def in_banim(a):
        i = bisect.bisect_right(bstarts, a) - 1
        return i >= 0 and a < banim_ranges[i][0] + banim_ranges[i][1]

    # --- every other byte -------------------------------------------------------
    bad_bytes = []
    for i, o in enumerate(olist):
        no = olist[i + 1] if i + 1 < len(olist) else end_o
        if in_resized(o) or in_banim(o) or no <= o:
            continue
        m = mlist[i]
        ob, mb = orig[o - ROM_BASE:no - ROM_BASE], mod[m - ROM_BASE:m + no - o - ROM_BASE]
        if ob == mb:
            continue
        for k in range(len(ob)):
            if k >= len(mb) or ob[k] != mb[k]:
                if m + k not in rel_bytes:
                    bad_bytes.append(o + k)
    print(f"other bytes changed: {len(bad_bytes)}")
    for a in sorted(set(x & ~3 for x in bad_bytes))[:20]:
        print(f"  {name_of(a)} ({a:#x}): {ow(a):08X} -> {mw(mv(a)):08X}")

    # --- alignment ----------------------------------------------------------------
    # (byte streams are exempt: music tracks and messages, which may start at
    # any address)
    stream = re.compile(r"song\d+_\d+(_[0-9A-F]{8})?|MSG_\w+")
    bad_align = [(o, m) for o, m in keep if ((o % 4 == 0 and m % 4) or (o % 2 == 0 and m % 2))
                 and not stream.fullmatch(oname.get(o, ""))]
    print(f"anchors that lost their alignment: {len(bad_align)}")
    for o, m in bad_align[:20]:
        print(f"  {oname.get(o, hex(o))} {o:#x} -> {m:#x}")

    # --- risks: raw words holding the old address of something that moved ----------
    # Where a pointer could hide: the code, the C/event data, and the baserom
    # incbins of data/rom (not extracted graphics, music or text, whose
    # pointers are all found structurally).  Words that hit a label exactly
    # are the likelier pointers.
    import datasplit
    raw_ranges = sorted((a, a + n) for k, a, n, path in datasplit.walk_rom_files()
                        if k == "incbin" and path == "baserom.gba")
    raw_ranges += [(a, a + n) for a, n, obj in layout
                   if not obj.startswith(("build/modern/", "build/sound/", "build/msg_data.o"))]
    raw_ranges = [(ROM_BASE, DATA_START)] + sorted(raw_ranges)
    risk, exact = collections.Counter(), collections.Counter()
    examples = collections.defaultdict(list)
    for s0, e0 in raw_ranges:
        for a in range((s0 + 3) & ~3, e0 - 3, 4):
            if in_resized(a) or mv(a) in rel_bytes:
                continue
            v = ow(a)
            if DATA_START <= v < ROM_BASE + len(orig) and mv(v) != v:
                own = "code"
                if a >= DATA_START:
                    own = re.sub(r"\(.*", "", layout[bisect.bisect_right(lstarts, a) - 1][2])
                    if own.startswith("build/modern/"):
                        own = "data/rom (baserom incbins)"
                risk[own] += 1
                if v in anchors:
                    exact[own] += 1
                    if len(examples[own]) < 4:
                        examples[own].append(f"{a:#x}={v:08X} ({name_of(v)})")
    print(f"risk: raw words holding the original address of moved data: {sum(risk.values())}, "
          f"{sum(exact.values())} of them exactly at a label")
    for k, v in risk.most_common(15):
        print(f"  {v:6d} ({exact[k]} at a label) {k}  e.g. {', '.join(examples[k])}")

    wrong = len(bad_ptr) + len(bad_sheet) + len(bad_other) + len(bad_bytes) + len(bad_align) + len(bad_order)
    print(f"WRONG: {wrong}")
    sys.exit(1 if wrong else 0)


if __name__ == "__main__":
    main()
