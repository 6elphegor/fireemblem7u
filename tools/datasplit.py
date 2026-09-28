#!/usr/bin/env python3
"""Split the not-yet-decompiled data region into labeled incbin chunks.

Usage: tools/datasplit.py [--stats]

Covers every byte of 0x080C57DC..0x09000000 that data/layout.txt does not
already place with data/rom/data_<ADDR>.s files made only of labels,
`.incbin "baserom.gba", off, size` directives and `.4byte` pointer words
(see below), and writes data/rom/layout.txt
(same "rom ADDR SIZE OBJECT(SECTION)" format, read by tools/gen_layout.py).

Labels (a chunk boundary is placed at each one):
  * every label already defined in data/rom/*.s (names are kept, so labels
    may be renamed there by hand and survive regeneration);
  * every `NAME = 0xADDR;` in symbols.ld that lies in a gap -- the line is
    moved out of symbols.ld and becomes a .global label;
  * pointer targets referenced from code: a Thumb `ldr rX, [pc, #n]` or ARM
    `ldr rX, [pc, #n]` whose literal is a data-region address;
  * even pointer targets referenced from 4-aligned words in sections that
    are already in source (data/layout.txt entries, except EXCLUDE_SCAN: the
    Huffman text bitstream and the music data); odd ones there were all
    packed halfwords;
  * pointer targets referenced from 4-aligned words inside the gaps, only if
    the target is 4-aligned, the word is not inside an LZ77 blob, and the
    word sits next to another plausible pointer (a word within +-16 bytes,
    not in an LZ77 blob, holding a 4-aligned data-region address or an odd
    Thumb code address) or the target is itself an LZ77 blob, so isolated
    pointer-looking words in graphics are skipped.
Also labeled: the sprite sheets that battle animation scripts point at from
inside their compressed data (the scripts are placed from source by
data/layout.txt, see tools/banim.py).
Targets strictly inside an LZ77 blob get no new label (only an existing
name can split a blob, e.g. FaceInfoTable, which code addresses one entry
before the table).
LZ77 blobs are 4-aligned pointer targets whose stream (0x10, 24-bit size,
flag bytes, literals and 2-byte back references) decodes to exactly the
header's size without referring before the output start; their compressed
extent is what the pointer-in-blob check uses.  New labels are gUnk_<ADDR>.

Pointer targets inside placed sections are ignored (source defines them).
A label that falls inside a newly placed section is reported: define it in
that section's source.  Files are ~256 KiB, split at label boundaries.

Extracted LZ77 data: every data/graphics.txt entry (tools/gfx.py) inside a
gap is written as `.incbin "build/graphics/NAME.lz"` (with `, 0, SIZE` for
the few streams stored cut short) instead of baserom bytes; a label strictly
inside one is defined as `.set NAME, BLOB + offset`.

Pointer words: 4-aligned words that tools/dataptrs.py recognizes as real
pointers (see its docstring for the rules) are written as
`.4byte NAME [+ ADDEND]` between the incbins, and their targets get labels
(gUnk_<ADDR>) where they have none.  Names of functions, source data and RAM
symbols come from fe7u.elf, so run `make` before this tool.
"""
import bisect
import re
import struct
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
import dataptrs  # noqa: E402

ROM_BASE = 0x08000000
DATA_START = 0x080C57DC
ROM_END = 0x09000000
FILE_SIZE = 0x40000
OUT_DIR = Path("data/rom")
GFX_MANIFEST = Path("data/graphics.txt")
ELF = "fe7u.elf"
# Placed sections whose words are not scanned for pointer targets: the Huffman
# text bitstream, and the music data (tools/m4adis.py; samples look like
# anything, and its real pointers stay inside it).
EXCLUDE_SCAN = {"build/msg_data.o(.rodata)", "build/sound/sound.o(.rodata)"}
# Compressed battle animation scripts (tools/banim.py), one section each:
# also not scanned (their pointers are inside the compressed data).
BANIM_OBJ = "build/banim/banim.o("


def excluded(obj):
    return obj in EXCLUDE_SCAN or obj.startswith(BANIM_OBJ)
SYM_RE = re.compile(r"\s*([A-Za-z_]\w*)\s*=\s*(0x[0-9A-Fa-f]+)\s*;")


def read_layout(path):
    rows = []
    for line in Path(path).read_text().splitlines():
        if line.startswith("rom "):
            _, addr, size, obj = line.split()
            rows.append((int(addr, 16), int(size, 16), obj))
    return sorted(rows)


def walk_rom_files(gfx=None):
    """Parse data/rom/*.s into a list of (kind, addr, arg, extra):
    ("section", start, None, end), ("label", addr, name, is_lz77),
    ("ptr", addr, expr, None), ("incbin", addr, size, path).
    gfx is tools/gfx.py's manifest ({addr: Entry}), giving the size of
    `.incbin "build/graphics/NAME.lz"` lines that have no explicit size."""
    if gfx is None:
        gfx = gfx_manifest()
    items, addr_of = [], {}
    for f in sorted(OUT_DIR.glob("*.s")):
        pos, sec = None, None
        for line in f.read_text().splitlines():
            code = line.split("@")[0].strip()
            if m := re.match(r"\.section\s+\.rodata\.([0-9A-F]{8})", code):
                if sec is not None:
                    items[sec] = items[sec][:3] + (pos,)
                pos = int(m.group(1), 16)
                sec = len(items)
                items.append(("section", pos, None, None))
            elif m := re.match(r"([A-Za-z_]\w*):$", code):
                items.append(("label", pos, m.group(1), "@ LZ77" in line))
                addr_of[m.group(1)] = pos
            elif m := re.match(r"\.set\s+([A-Za-z_]\w*)\s*,\s*([A-Za-z_]\w*)\s*\+\s*(\w+)$", code):
                a = addr_of[m.group(2)] + int(m.group(3), 0)
                items.append(("label", a, m.group(1), False))
                addr_of[m.group(1)] = a
            elif m := re.match(r'\.incbin\s+"baserom\.gba",\s*(\w+),\s*(\w+)', code):
                off, size = int(m.group(1), 0), int(m.group(2), 0)
                assert ROM_BASE + off == pos, f"{f}: incbin at {off:#x} expected {pos:#x}"
                items.append(("incbin", pos, size, "baserom.gba"))
                pos += size
            elif m := re.match(r'\.incbin\s+"([^"]+)"(?:\s*,\s*0\s*,\s*(\w+))?$', code):
                if m.group(2):
                    size = int(m.group(2), 0)
                elif pos in gfx:
                    size = gfx[pos].size
                else:
                    sys.exit(f"{f}: {m.group(1)} at {pos:#x} is not in {GFX_MANIFEST}; rerun tools/datasplit.py")
                items.append(("incbin", pos, size, m.group(1)))
                pos += size
            elif code.startswith(".4byte"):
                items.append(("ptr", pos, code.split(None, 1)[1], None))
                pos += 4
        if sec is not None:
            items[sec] = items[sec][:3] + (pos,)
    return items


def read_existing_labels():
    """(name, addr) for every label in data/rom/*.s."""
    return [(name, addr) for kind, addr, name, _ in walk_rom_files() if kind == "label"]


def gfx_manifest():
    import gfx
    return gfx.read_manifest(GFX_MANIFEST)


def lz77_length(rom, off):
    """Compressed length of a valid LZ77 stream at off, else None."""
    if off + 4 > len(rom) or rom[off] != 0x10:
        return None
    size = rom[off + 1] | rom[off + 2] << 8 | rom[off + 3] << 16
    if not 0 < size <= 0x40000:
        return None
    p, out = off + 4, 0
    while out < size:
        if p >= len(rom):
            return None
        flags = rom[p]
        p += 1
        for bit in range(8):
            if out >= size:
                break
            if flags & (0x80 >> bit):
                if p + 2 > len(rom):
                    return None
                disp = ((rom[p] & 0xF) << 8 | rom[p + 1]) + 1
                if disp > out:
                    return None
                out += (rom[p] >> 4) + 3
                p += 2
            else:
                out += 1
                p += 1
    return p - off if out == size else None


def banim_sheets(rom, addr):
    """Sprite sheet addresses in the LZ77-compressed battle animation script
    at addr: the word after each frame command (0x86xxxxxx)."""
    import gfx
    data, _ = gfx.lz77_decompress(rom, addr - ROM_BASE)
    return {w for i in range(4, len(data) - 3, 4)
            if data[i - 1] == 0x86 and ROM_BASE <= (w := int.from_bytes(data[i:i + 4], "little")) < ROM_END}


def in_ranges(starts, ranges, addr):
    """ranges sorted non-overlapping (start, end); bisect lookup."""
    i = bisect.bisect_right(starts, addr) - 1
    return i >= 0 and ranges[i][0] <= addr < ranges[i][1]


def blob_ranges(blobs):
    """Sorted (start, end) extents of LZ77 blobs, clipped not to overlap."""
    starts = sorted(blobs)
    ranges = [(a, min([a + blobs[a]] + starts[i + 1:i + 2])) for i, a in enumerate(starts)]
    return starts, ranges


def main():
    stats = "--stats" in sys.argv
    rom = Path("baserom.gba").read_bytes()
    assert len(rom) == ROM_END - ROM_BASE
    placed = read_layout("data/layout.txt")

    gaps, pos = [], DATA_START
    for addr, size, obj in placed + [(ROM_END, 0, None)]:
        if addr < pos:
            sys.exit(f"{obj} at {addr:#x} overlaps previous data (ends {pos:#x})")
        if addr > pos:
            gaps.append((pos, addr))
        pos = addr + size
    gap_starts = [g[0] for g in gaps]

    def in_gap(a):
        return in_ranges(gap_starts, gaps, a)

    def word(a):
        return struct.unpack_from("<I", rom, a - ROM_BASE)[0]

    def is_data(v):
        return DATA_START <= v < ROM_END

    # --- labels from existing files and symbols.ld
    names = {}  # addr -> [names]
    lost = []
    for name, addr in read_existing_labels():
        if in_gap(addr):
            names.setdefault(addr, []).append(name)
        else:
            lost.append((name, addr))
    sym_lines = Path("symbols.ld").read_text().splitlines(keepends=True)
    keep_lines, moved = [], 0
    for line in sym_lines:
        m = SYM_RE.match(line)
        if m and in_gap(int(m.group(2), 16)):
            addr = int(m.group(2), 16)
            if m.group(1) not in names.get(addr, []):
                names.setdefault(addr, []).append(m.group(1))
            moved += 1
            continue
        keep_lines.append(line)
    for name, addr in lost:
        print(f"warning: {name} ({addr:#x}) is now inside a placed section; define it there",
              file=sys.stderr)
    all_names = {n for ns in names.values() for n in ns}
    for line in keep_lines:
        if m := SYM_RE.match(line):
            all_names.add(m.group(1))

    # --- pointer targets from code literal pools
    code_targets = set()
    for a in range(ROM_BASE, DATA_START, 2):
        hw = rom[a - ROM_BASE] | rom[a - ROM_BASE + 1] << 8
        if hw & 0xF800 == 0x4800:
            lit = ((a + 4) & ~3) + (hw & 0xFF) * 4
            if lit + 4 <= DATA_START and is_data(word(lit)):
                code_targets.add(word(lit))
        if a % 4 == 0:
            w = word(a)
            if w & 0x0F7F0000 == 0x051F0000:
                lit = a + 8 + ((w & 0xFFF) if w & 0x00800000 else -(w & 0xFFF))
                if lit % 4 == 0 and ROM_BASE <= lit + 4 <= DATA_START and is_data(word(lit)):
                    code_targets.add(word(lit))

    # --- pointer targets from data already in source
    src_targets = set()
    for addr, size, obj in placed:
        if excluded(obj):
            continue
        for a in range((addr + 3) & ~3, addr + size - 3, 4):
            if is_data(word(a)) and word(a) % 2 == 0:
                src_targets.add(word(a))

    # --- pointer targets inside compressed data: the sprite sheets named by
    # battle animation scripts (placed from banim/*.s, tools/banim.py)
    lz_targets = set()
    for addr, size, obj in placed:
        if obj.startswith(BANIM_OBJ):
            lz_targets |= banim_sheets(rom, addr)

    # --- pointer words inside the gaps
    gap_words = []  # (addr, value) for every 4-aligned word pointing into ROM
    for start, end in gaps:
        for a in range((start + 3) & ~3, end - 3, 4):
            v = word(a)
            if ROM_BASE <= v < ROM_END:
                gap_words.append((a, v))

    # --- LZ77 blobs at 4-aligned pointer targets, to a fixpoint
    lz_cache = {}

    def lz(a):
        if a not in lz_cache:
            lz_cache[a] = lz77_length(rom, a - ROM_BASE) if a % 4 == 0 else None
        return lz_cache[a]

    trusted = code_targets | src_targets | lz_targets
    blobs = {}
    for _ in range(20):
        rs, ranges = blob_ranges(blobs)
        cand = set(trusted)
        cand.update(v for a, v in gap_words if is_data(v) and not in_ranges(rs, ranges, a))
        new = {a: lz(a) for a in cand if in_gap(a) and lz(a)}
        if new == blobs:
            break
        blobs = new
    else:
        print("warning: LZ77 blob set did not converge", file=sys.stderr)
    rs, ranges = blob_ranges(blobs)

    # --- confident pointers from inside the gaps
    def plausible(v):  # 4-aligned data pointer or Thumb function pointer
        return v % 4 == 0 if is_data(v) else v & 1
    ptr_at = {a for a, v in gap_words if plausible(v) and not in_ranges(rs, ranges, a)}
    data_targets = set()
    for a, v in gap_words:
        if not is_data(v) or a not in ptr_at or v % 4:
            continue
        near = any(a + d in ptr_at for d in (-16, -12, -8, -4, 4, 8, 12, 16))
        if near or v in blobs:
            data_targets.add(v)

    def inside_blob(t):
        return in_ranges(rs, ranges, t) and t not in blobs

    new_labels = 0
    for t in code_targets | src_targets | data_targets | lz_targets:
        if in_gap(t) and t not in names and not inside_blob(t):
            name = f"gUnk_{t:08X}"
            while name in all_names:
                name += "_"
            names[t] = [name]
            all_names.add(name)
            new_labels += 1

    # --- symbolic pointer words (tools/dataptrs.py)
    if not Path(ELF).exists():
        sys.exit(f"{ELF} is needed for symbol names: run make first")
    syms = dataptrs.Symbols(ELF, in_gap)
    trusted = code_targets | src_targets | set(blobs) | {
        a for a, ns in names.items() if any(not n.startswith("gUnk_") for n in ns)}
    ptrs, ptr_labels = dataptrs.find_pointers(
        rom, gaps, placed, names, trusted, blobs, lambda a: in_ranges(rs, ranges, a), syms)
    for t in ptr_labels:
        name = f"gUnk_{t:08X}"
        while name in all_names:
            name += "_"
        names[t] = [name]
        all_names.add(name)
    exprs = {}
    for a, (kind, base, add, _) in ptrs.items():
        name = {"label": lambda: names[base][0], "func": lambda: syms.funcs[base],
                "code": lambda: syms.code[base],
                "sym": lambda: syms.data[base] if base in syms.data else syms.ram[base][0]}[kind]()
        exprs[a] = f"{name} + {add:#x}" if add else name

    if stats:
        gt = lambda s: len({t for t in s if in_gap(t)})
        print(f"gaps {len(gaps)} bytes {sum(e - s for s, e in gaps):#x}")
        print(f"code targets {len(code_targets)} (in gaps {gt(code_targets)})")
        print(f"source targets {len(src_targets)} (in gaps {gt(src_targets)})")
        print(f"gap pointer words {len(gap_words)}; data targets {len(data_targets)} "
              f"(in gaps {gt(data_targets)})")
        print(f"lz77 blobs {len(blobs)}")
        print(f"symbols.ld lines moved {moved}; labels {sum(map(len, names.values()))} "
              f"at {len(names)} addresses; new gUnk {new_labels}")
        count = lambda i: {k: [p[i] for p in ptrs.values()].count(k) for k in sorted({p[i] for p in ptrs.values()})}
        print(f"pointer words {len(ptrs)}: by target {count(0)}, by rule {count(3)}; "
              f"new labels at pointer targets {len(ptr_labels)}")
        return

    # --- extracted LZ77 data (data/graphics.txt, tools/gfx.py)
    gfx = {}
    for a, e in gfx_manifest().items():
        i = bisect.bisect_right(gap_starts, a) - 1
        if i < 0 or not gaps[i][0] <= a < a + e.size <= gaps[i][1]:
            print(f"warning: {GFX_MANIFEST}: {e.name} ({a:#x}) is not inside one gap; left incbin'd",
                  file=sys.stderr)
            continue
        if inside := [p for p in exprs if a <= p < a + e.size]:
            sys.exit(f"{GFX_MANIFEST}: pointer word at {inside[0]:#x} inside {e.name}")
        if a not in names:
            names[a] = [f"gUnk_{a:08X}"]
        gfx[a] = e

    write_files(gaps, names, blobs, exprs, gfx)
    Path("symbols.ld").write_text("".join(keep_lines))


def write_files(gaps, names, blobs, exprs, gfx):
    label_addrs = sorted(names)
    ptr_addrs = sorted(exprs)
    gfx_starts, gfx_ranges = blob_ranges({a: e.size for a, e in gfx.items()})

    def labels_in(lo, hi):  # label addresses in [lo, hi)
        return label_addrs[bisect.bisect_left(label_addrs, lo):bisect.bisect_left(label_addrs, hi)]

    def cuttable(lo, hi):  # labels in [lo, hi) not strictly inside extracted data
        return [a for a in labels_in(lo, hi)
                if a in gfx or not in_ranges(gfx_starts, gfx_ranges, a)]

    # Cut each gap into pieces of at most ~FILE_SIZE, only at labels.
    pieces = []
    for s, end in gaps:
        while end - s > FILE_SIZE:
            inside = cuttable(s + 1, end)
            before = [a for a in inside if a <= s + FILE_SIZE]
            if not inside:
                break
            cut = before[-1] if before else inside[0]
            pieces.append((s, cut))
            s = cut
        pieces.append((s, end))
    # Pack consecutive pieces into files of at most ~FILE_SIZE.
    files = []
    for s, e in pieces:
        if files and sum(b - a for a, b in files[-1]) + e - s <= FILE_SIZE:
            files[-1].append((s, e))
        else:
            files.append([(s, e)])

    for old in OUT_DIR.glob("*.s"):
        old.unlink()
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    layout = ["# rom ADDR SIZE OBJECT(SECTION) -- generated by tools/datasplit.py\n"]
    for pieces in files:
        fname = f"data_{pieces[0][0]:08X}"
        first, last = pieces[0][0], pieces[-1][1]
        out = [f"@ ROM data {first:#010x}-{last:#010x} (not yet in source)\n"
               "@ Generated by tools/datasplit.py: labels, incbin and .4byte pointers.\n"
               "@ Labels may be renamed here; rerun the tool then (it rewrites the\n"
               "@ .4byte references) and after changing data/layout.txt.\n"]
        for s, e in pieces:
            out.append(f'\n\t.section .rodata.{s:08X}, "a"\n')
            layout.append(f"rom 0x{s:08X} 0x{e - s:X} build/data/rom/{fname}.o(.rodata.{s:08X})\n")
            cuts = labels_in(s, e)
            bounds = ([s] if not cuts or cuts[0] != s else []) + cuts + [e]
            gfx_end, gfx_label = s, None
            for a, b in zip(bounds, bounds[1:]):
                if a in names and a < gfx_end:
                    # a name inside extracted data: defined relative to its start
                    for n in names[a]:
                        out.append(f"\t.global {n}\n")
                    for n in names[a]:
                        out.append(f"\t.set {n}, {gfx_label} + {a - gfx_start:#x}\n")
                elif a in names:
                    lz_note = "  @ LZ77" if a in blobs else ""
                    out.append("\n")
                    for n in names[a]:
                        out.append(f"\t.global {n}\n")
                    for n in names[a]:
                        out.append(f"{n}:{lz_note}\n")
                if a in gfx:
                    g = gfx[a]
                    # a stream cut short (overlapping what follows): only SIZE bytes
                    padded = (blobs[a] + 3) & ~3 if a in blobs else g.size
                    size = f", 0, {g.size:#x}" if g.size < padded else ""
                    out.append(f'\t.incbin "{g.lz.as_posix()}"{size}\n')
                    gfx_start, gfx_end, gfx_label = a, a + g.size, names[a][0]
                    assert gfx_end <= e, f"{g.name} crosses the end of its section"
                pos = max(a, gfx_end)
                for p in ptr_addrs[bisect.bisect_left(ptr_addrs, pos):bisect.bisect_left(ptr_addrs, b)]:
                    if p > pos:
                        out.append(f'\t.incbin "baserom.gba", {pos - ROM_BASE:#x}, {p - pos:#x}\n')
                    out.append(f"\t.4byte {exprs[p]}\n")
                    pos = p + 4
                if pos < b:
                    out.append(f'\t.incbin "baserom.gba", {pos - ROM_BASE:#x}, {b - pos:#x}\n')
        (OUT_DIR / f"{fname}.s").write_text("".join(out))
    (OUT_DIR / "layout.txt").write_text("".join(layout))
    print(f"{len(files)} files, {sum(len(p) for p in files)} sections, "
          f"{sum(map(len, names.values()))} labels")


if __name__ == "__main__":
    main()
