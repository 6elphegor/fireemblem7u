#!/usr/bin/env python3
"""Extracted graphics (and other LZ77-compressed data): manifest and extraction.

Usage: tools/gfx.py extract     write graphics/NAME.bin for every manifest
                                entry that has none (never overwrites)
       tools/gfx.py scan        add manifest entries for the LZ77 blobs that
                                data/rom still incbins from baserom.gba
       tools/gfx.py classify    fill in FORMAT for `unknown` entries where
                                the data's users tell what it is
       tools/gfx.py check       decompress + recompress every entry with
                                build/tools/lz77 (`make build/tools/lz77`)
                                and compare with baserom.gba

The manifest, data/graphics.txt, holds one line per blob:

    ADDR SIZE FORMAT NAME

ADDR is the ROM address, SIZE the number of ROM bytes the compressed stream
occupies (the stream padded with zeros to a multiple of 4, as the compressor
writes it; see "overlap" below), FORMAT what the decompressed data is
(informational for now; see FORMATS) and NAME a path under graphics/
without extension.  graphics/ is not in git: `make` runs `extract` the
first time (like texts/texts.txt), and from then on graphics/NAME.bin (the
decompressed bytes) is the source.  The build compresses it with
tools/lz77.c to build/graphics/NAME.lz, which tools/datasplit.py's
data/rom/*.s files incbin at ADDR.  NAME is initially the blob's label;
entries may be renamed (and moved into subdirectories) freely -- delete
the old graphics/NAME.bin or rename it along.

Overlap: a few streams are stored cut short, their last token sharing bytes
with the data that follows (the next blob's header).  For those SIZE is
smaller than the compressed stream; the .s file incbins only SIZE bytes.

After editing the manifest (or `scan`), rerun tools/datasplit.py.
"""
import bisect
import os
import subprocess
import sys
import tempfile
from pathlib import Path

ROM_BASE = 0x08000000

# FORMAT values.  `classify` derives them from the tables that use the data
# (battle animations, battle terrains) and from label names.
FORMATS = {
    "unknown": "not identified yet",
    "4bpp": "4bpp tiles (8x8, 32 bytes each)",
    "tsa": "tile map (BG screen entries, or a TSA with a size header)",
    "palette": "BGR555 colors",
    "banim_script": "battle animation script (u32 commands; each frame command "
                    "0x86xxxxxx is followed by an absolute sprite sheet pointer)",
    "banim_oam": "battle animation OAM frame data",
}
MANIFEST = Path("data/graphics.txt")
GFX_DIR = Path("graphics")
LZ_DIR = Path("build/graphics")
LZ77 = Path("build/tools/lz77")
HEADER = """\
# LZ77-compressed data extracted from baserom.gba to graphics/NAME.bin at
# build time and recompressed into the ROM (see tools/gfx.py).
# ADDR SIZE FORMAT NAME
"""


class Entry:
    def __init__(self, addr, size, fmt, name):
        self.addr, self.size, self.fmt, self.name = addr, size, fmt, name

    @property
    def bin(self):
        return GFX_DIR / f"{self.name}.bin"

    @property
    def lz(self):
        return LZ_DIR / f"{self.name}.lz"

    def line(self):
        return f"0x{self.addr:08X} 0x{self.size:X} {self.fmt} {self.name}\n"


def read_manifest(path=MANIFEST):
    """{addr: Entry} from the manifest (empty if it does not exist)."""
    entries = {}
    if not Path(path).exists():
        return entries
    for n, line in enumerate(Path(path).read_text().splitlines(), 1):
        line = line.split("#")[0].strip()
        if not line:
            continue
        f = line.split()
        if len(f) != 4:
            sys.exit(f"{path}:{n}: expected ADDR SIZE FORMAT NAME")
        e = Entry(int(f[0], 16), int(f[1], 16), f[2], f[3])
        if e.addr in entries:
            sys.exit(f"{path}:{n}: duplicate address {e.addr:#x}")
        entries[e.addr] = e
    return entries


def write_manifest(entries, path=MANIFEST):
    Path(path).write_text(HEADER + "".join(e.line() for e in sorted(entries.values(), key=lambda e: e.addr)))


def lz77_decompress(data, off=0):
    """(decompressed bytes, compressed stream length) of the stream at off."""
    if data[off] != 0x10:
        raise ValueError(f"no LZ77 stream at {off:#x}")
    size = int.from_bytes(data[off + 1:off + 4], "little")
    out = bytearray()
    p = off + 4
    while len(out) < size:
        flags = data[p]
        p += 1
        for bit in range(8):
            if len(out) >= size:
                break
            if flags & (0x80 >> bit):
                n = (data[p] >> 4) + 3
                d = ((data[p] & 0xF) << 8 | data[p + 1]) + 1
                p += 2
                if d > len(out):
                    raise ValueError(f"bad back reference in stream at {off:#x}")
                if d >= n:
                    out += out[-d:len(out) - d + n]
                else:
                    for _ in range(n):
                        out.append(out[-d])
            else:
                out.append(data[p])
                p += 1
    if len(out) != size:
        raise ValueError(f"stream at {off:#x} overruns its size")
    return bytes(out), p - off


def extract():
    rom = Path("baserom.gba").read_bytes()
    count = 0
    for e in read_manifest().values():
        if e.bin.exists():
            continue
        data, _ = lz77_decompress(rom, e.addr - ROM_BASE)
        e.bin.parent.mkdir(parents=True, exist_ok=True)
        fd, tmp = tempfile.mkstemp(dir=e.bin.parent, prefix=".tmp")
        with os.fdopen(fd, "wb") as f:
            f.write(data)
        os.replace(tmp, e.bin)
        count += 1
    GFX_DIR.mkdir(exist_ok=True)
    (GFX_DIR / ".extracted").touch()
    print(f"extracted {count} files to {GFX_DIR}/")


def expected_bytes(rom, e):
    off = e.addr - ROM_BASE
    return rom[off:off + e.size]


def check():
    """Recompress every entry's ROM data; report the ones that don't match."""
    rom = Path("baserom.gba").read_bytes()
    bad = 0
    entries = read_manifest()
    with tempfile.TemporaryDirectory() as tmp:
        raw, lz = Path(tmp) / "raw", Path(tmp) / "lz"
        for e in entries.values():
            data, _ = lz77_decompress(rom, e.addr - ROM_BASE)
            raw.write_bytes(data)
            subprocess.run([str(LZ77), "-c", str(raw), str(lz)], check=True)
            got = lz.read_bytes()
            if got[:e.size] != expected_bytes(rom, e) or len(got) < e.size:
                bad += 1
                print(f"mismatch: {e.name} at {e.addr:#x}")
    print(f"{len(entries) - bad} of {len(entries)} entries round-trip exactly")
    return bad == 0


def scan():
    """Add entries for LZ77 blobs that data/rom still incbins from the ROM."""
    sys.path.insert(0, str(Path(__file__).parent))
    import datasplit
    rom = Path("baserom.gba").read_bytes()
    entries = read_manifest()
    items = list(datasplit.walk_rom_files(entries))
    # boundaries: labels, pointer words, section starts/ends
    labels = {}
    bounds = set()
    lz_labels = []
    for kind, addr, arg, extra in items:
        if kind == "label":
            labels.setdefault(addr, []).append(arg)
            bounds.add(addr)
            if extra and addr not in entries:
                lz_labels.append(addr)
        elif kind == "ptr":
            bounds.add(addr)
        elif kind == "section":
            bounds.update((addr, extra))
    ptr_addrs = {addr for kind, addr, *_ in items if kind == "ptr"}
    lz_starts = {a for kind, a, _, extra in items if kind == "label" and extra} | set(entries)
    bl = sorted(bounds)
    added = skipped = 0
    for a in sorted(set(lz_labels)):
        off = a - ROM_BASE
        _, length = lz77_decompress(rom, off)
        size = (length + 3) & ~3
        if rom[off + length:off + size] != bytes(size - length):
            size = length
        end = a + size
        nxt = bl[bisect.bisect_right(bl, a)]
        if nxt < end and nxt in lz_starts:
            size = nxt - a  # overlap: cut short where the next blob starts
        elif any(a < p < end for p in ptr_addrs) or not in_one_section(items, a, end):
            print(f"skipped {labels[a][0]} at {a:#x}: pointer word or section end inside", file=sys.stderr)
            skipped += 1
            continue
        entries[a] = Entry(a, size, "unknown", labels[a][0])
        added += 1
    write_manifest(entries)
    print(f"added {added} entries ({skipped} skipped); {len(entries)} in {MANIFEST}")


def classify():
    """Set FORMAT of `unknown` entries from the structures that point at them."""
    sys.path.insert(0, str(Path(__file__).parent))
    import datasplit
    rom = Path("baserom.gba").read_bytes()
    entries = read_manifest()
    labels = {n: a for kind, a, n, _ in datasplit.walk_rom_files(entries) if kind == "label"}
    found = {}

    def word(a):
        return int.from_bytes(rom[a - ROM_BASE:a - ROM_BASE + 4], "little")

    def mark(a, fmt):
        if a in entries and entries[a].fmt == "unknown":
            found.setdefault(a, fmt)

    def table(name, stride, fields):
        """Struct array starting with a 12-byte ASCII name, up to the first
        entry whose name is not text."""
        a = labels[name]
        while 0x20 < rom[a - ROM_BASE] < 0x7F:
            for off, fmt in fields.items():
                mark(word(a + off), fmt)
            a += stride

    # struct BattleAnim / BattleAnimCharaPal / BattleAnimTerrain (gbafe/banim.h)
    table("banim_data", 0x20, {0x10: "banim_script", 0x14: "banim_oam", 0x18: "banim_oam", 0x1C: "palette"})
    table("character_battle_animation_palette_table", 0x10, {0xC: "palette"})
    table("battle_terrain_table", 0x18, {0xC: "4bpp", 0x10: "palette"})
    # sprite sheets: the image pointers inside (compressed) animation scripts
    for a, e in entries.items():
        if found.get(a, e.fmt) == "banim_script":
            for sheet in datasplit.banim_sheets(rom, a):
                mark(sheet, "4bpp")
    # label names
    for a, e in entries.items():
        n = e.name
        if n.startswith(("Img_", "Gfx_", "gGfx")) or n.endswith("_sheet"):
            mark(a, "4bpp")
        elif n.startswith(("Tsa_", "Tm_")):
            mark(a, "tsa")
        elif n.startswith("Pal_"):
            mark(a, "palette")
    for a, fmt in found.items():
        entries[a].fmt = fmt
    write_manifest(entries)
    counts = {}
    for e in entries.values():
        counts[e.fmt] = counts.get(e.fmt, 0) + 1
    print(f"classified {len(found)}; formats: {counts}")


def in_one_section(items, start, end):
    return any(kind == "section" and addr <= start and end <= extra
               for kind, addr, _, extra in items)


def main():
    cmd = sys.argv[1] if len(sys.argv) > 1 else ""
    if cmd == "extract":
        extract()
    elif cmd == "scan":
        scan()
    elif cmd == "classify":
        classify()
    elif cmd == "check":
        sys.exit(0 if check() else 1)
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main()
