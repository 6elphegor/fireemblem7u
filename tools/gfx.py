#!/usr/bin/env python3
"""Extracted graphics (and other compressed data): manifest, extraction, checks.

Usage: tools/gfx.py extract     write graphics/NAME.* for every manifest entry
                                that has none (never overwrites)
       tools/gfx.py makefile    print the make variables for the manifest
                                (the Makefile includes them as build/graphics.mk)
       tools/gfx.py check       rebuild every entry from baserom.gba the way the
                                build does (extract to a temporary directory,
                                convert, compress) and compare with the ROM
       tools/gfx.py scan        add manifest entries for the LZ77 blobs that
                                data/rom still incbins from baserom.gba
       tools/gfx.py classify    fill in FORMAT, names, PNG layouts and palette
                                pairings from how code and data use each entry
                                (tools/gfxrefs.py)

The manifest, data/graphics.txt, holds one line per entry:

    ADDR SIZE FORMAT NAME [OPTION...]

ADDR is the ROM address and SIZE the number of ROM bytes the entry occupies:
for LZ77 data the compressed stream padded with zeros to a multiple of 4, as
the compressor writes it (see "overlap" below).  FORMAT is what the
(decompressed) data is, see FORMATS.  NAME is a path under graphics/ without
extension; entries may be renamed and moved into subdirectories freely
(rename the extracted file along, or delete it to extract it again).
OPTIONs:

    raw          stored uncompressed (default: LZ77-compressed)
    w=N          an image: extracted as graphics/NAME.png, N tiles wide
    tiles=N      the image has N tiles (when that is not N = width x height;
                 the rest of the PNG's last row is padding)
    pal=NAME[:B] show the image with 16-color bank B (default 0) of palette
                 entry NAME (PNG only; without it the PNG gets a gray ramp)

Source files (graphics/ is not in git: `make` runs `extract` the first time,
like texts/texts.txt, and from then on these files are the source):

    image entries (w=)   graphics/NAME.png   indexed PNG; the pixel values are
                         the color indices, the PNG's palette is only for show
    FORMAT palette       graphics/NAME.gbapal  raw BGR555 colors
    everything else      graphics/NAME.bin   the (decompressed) bytes

The build converts PNGs with gbagfx (tools/gbagfx, pret's, MIT license) to
build/graphics/NAME.4bpp, compresses LZ77 entries with tools/lz77.c to
build/graphics/NAME.lz, and tools/datasplit.py's data/rom/*.s files incbin
the result at ADDR.

Overlap: a few streams are stored cut short, their last token sharing bytes
with the data that follows (the next blob's header).  For those SIZE is
smaller than the compressed stream; the .s file incbins only SIZE bytes.

After editing the manifest (or `scan`, `classify`), rerun tools/datasplit.py.
"""
import bisect
import concurrent.futures
import os
import re
import struct
import subprocess
import sys
import tempfile
import zlib
from pathlib import Path

ROM_BASE = 0x08000000

FORMATS = {
    "unknown": "not identified yet",
    "4bpp": "4bpp tiles (8x8, 32 bytes each)",
    "8bpp": "8bpp tiles (8x8, 64 bytes each)",
    "palette": "BGR555 colors, 16 per bank",
    "tsa": "FE TSA: u8 width-1, u8 height-1, then BG screen entries (TmApplyTsa)",
    "tilemap": "BG screen entries without a header (a whole or partial screen)",
    "map": "chapter map layout: u8 width, u8 height, then u16 metatile ids",
    "tileconfig": "chapter tileset configuration: 4 screen entries per metatile, "
                  "then one terrain byte per metatile",
    "banim_script": "battle animation script (u32 commands; each frame command "
                    "0x86xxxxxx is followed by an absolute sprite sheet pointer)",
    "banim_oam": "battle animation OAM frame data",
    "data": "other data (tile/palette animation lists, map changes)",
}
IMAGE_FORMATS = {"4bpp": 4, "8bpp": 8}
MANIFEST = Path("data/graphics.txt")
GFX_DIR = Path("graphics")
BUILD_DIR = Path("build/graphics")
LZ77 = Path("build/tools/lz77")
GBAGFX = Path("build/tools/gbagfx")
HEADER = """\
# Data extracted from baserom.gba to graphics/ at build time and rebuilt
# into the ROM (see tools/gfx.py).
# ADDR SIZE FORMAT NAME [raw] [w=TILES] [tiles=N] [pal=NAME[:BANK]]
"""


class Entry:
    def __init__(self, addr, size, fmt, name, opts=None):
        self.addr, self.size, self.fmt, self.name = addr, size, fmt, name
        self.opts = dict(opts or {})

    @property
    def raw(self):
        return "raw" in self.opts

    @property
    def is_image(self):
        return self.fmt in IMAGE_FORMATS and "w" in self.opts

    @property
    def bpp(self):
        return IMAGE_FORMATS[self.fmt]

    @property
    def ext(self):
        if self.is_image:
            return "png"
        return "gbapal" if self.fmt == "palette" else "bin"

    @property
    def src(self):
        return GFX_DIR / f"{self.name}.{self.ext}"

    @property
    def bin(self):  # the extracted file (old name)
        return self.src

    @property
    def tiles_file(self):
        return BUILD_DIR / f"{self.name}.{self.bpp}bpp"

    @property
    def lz(self):
        return BUILD_DIR / f"{self.name}.lz"

    @property
    def data_file(self):
        """The uncompressed bytes as the build makes them."""
        return self.tiles_file if self.is_image else self.src

    @property
    def built(self):
        """What data/rom/*.s incbins at ADDR."""
        return self.data_file if self.raw else self.lz

    @property
    def pal(self):
        """(palette entry name, bank) or None."""
        if "pal" not in self.opts:
            return None
        name, _, bank = self.opts["pal"].partition(":")
        return name, int(bank or 0)

    def line(self):
        opts = []
        for k in ("raw", "w", "tiles", "pal"):
            if k in self.opts:
                opts.append(k if self.opts[k] is True else f"{k}={self.opts[k]}")
        opts += [f"{k}={v}" for k, v in self.opts.items() if k not in ("raw", "w", "tiles", "pal")]
        return " ".join([f"0x{self.addr:08X}", f"0x{self.size:X}", self.fmt, self.name] + opts) + "\n"


def read_manifest(path=MANIFEST):
    """{addr: Entry} from the manifest (empty if it does not exist)."""
    entries = {}
    if not Path(path).exists():
        return entries
    names = set()
    for n, line in enumerate(Path(path).read_text().splitlines(), 1):
        line = line.split("#")[0].strip()
        if not line:
            continue
        f = line.split()
        if len(f) < 4:
            sys.exit(f"{path}:{n}: expected ADDR SIZE FORMAT NAME [OPTION...]")
        opts = {}
        for o in f[4:]:
            k, eq, v = o.partition("=")
            opts[k] = v if eq else True
        e = Entry(int(f[0], 16), int(f[1], 16), f[2], f[3], opts)
        if e.fmt not in FORMATS:
            sys.exit(f"{path}:{n}: unknown FORMAT {e.fmt}")
        if e.addr in entries:
            sys.exit(f"{path}:{n}: duplicate address {e.addr:#x}")
        if e.name in names:
            sys.exit(f"{path}:{n}: duplicate name {e.name}")
        names.add(e.name)
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


def rom_data(rom, e):
    """The entry's (decompressed) bytes in the ROM."""
    off = e.addr - ROM_BASE
    if e.raw:
        return rom[off:off + e.size]
    return lz77_decompress(rom, off)[0]


# --------------------------------------------------------------------------
# PNG

def gba_to_rgb(c):
    # the same 5 -> 8 bit expansion as gbagfx, so gbagfx maps it back exactly
    return bytes(((c >> s) & 0x1F) * 255 // 31 for s in (0, 5, 10))


def png_palette(rom, entries_by_name, e):
    """The PNG palette (bytes, 3 per color) for an image entry."""
    ncolors = 1 << e.bpp
    gray = b"".join(bytes([i * 255 // (ncolors - 1)] * 3) for i in range(ncolors))
    if not e.pal:
        return gray
    pname, bank = e.pal
    p = entries_by_name.get(pname)
    if p is None:
        sys.exit(f"{MANIFEST}: {e.name}: no palette entry {pname}")
    if p.raw:  # (a bank past the entry: the palette goes on after the next label)
        off = p.addr - ROM_BASE + bank * 32
        data = rom[off:off + ncolors * 2]
    else:
        data = rom_data(rom, p)[bank * 32:]
    colors = [struct.unpack_from("<H", data, i)[0] for i in range(0, min(len(data), ncolors * 2) - 1, 2)]
    return b"".join(gba_to_rgb(c) for c in colors) + gray[len(colors) * 3:]


def tiles_to_png(data, bpp, width, palette):
    """PNG bytes of tile data laid out `width` tiles per row (like gbagfx)."""
    tsize = 8 * bpp
    ntiles = len(data) // tsize
    rows = (ntiles + width - 1) // width
    w, h = width * 8, rows * 8
    rowbytes = w * bpp // 8
    pix = bytearray(rowbytes * h)
    for t in range(ntiles):
        tx, ty = t % width, t // width
        for y in range(8):
            src = data[t * tsize + y * bpp:t * tsize + (y + 1) * bpp]
            dst = (ty * 8 + y) * rowbytes + tx * bpp
            if bpp == 4:  # GBA: low nibble is the left pixel; PNG: high nibble
                src = bytes(((b & 0xF) << 4) | (b >> 4) for b in src)
            pix[dst:dst + bpp] = src
    raw = b"".join(b"\0" + bytes(pix[y * rowbytes:(y + 1) * rowbytes]) for y in range(h))

    def chunk(kind, body):
        return struct.pack(">I", len(body)) + kind + body + struct.pack(">I", zlib.crc32(kind + body))
    return (b"\x89PNG\r\n\x1a\n"
            + chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, bpp, 3, 0, 0, 0))
            + chunk(b"PLTE", palette)
            + chunk(b"IDAT", zlib.compress(raw, 9))
            + chunk(b"IEND", b""))


def image_layout(e, nbytes):
    """(width in tiles, tile count) of an image entry."""
    tsize = 8 * e.bpp
    if nbytes % tsize:
        sys.exit(f"{e.name}: {nbytes:#x} bytes is not a whole number of tiles")
    return int(e.opts["w"]), nbytes // tsize


def write_source(rom, entries_by_name, e, path):
    """Write the entry's source file (as extracted) to path."""
    data = rom_data(rom, e)
    if e.is_image:
        width, ntiles = image_layout(e, len(data))
        want = e.opts.get("tiles")
        full = -(-ntiles // width) * width
        if (int(want) if want else full) != ntiles:
            sys.exit(f"{MANIFEST}: {e.name}: has {ntiles} tiles; set tiles={ntiles} (or none if {full})")
        data = tiles_to_png(data, e.bpp, width, png_palette(rom, entries_by_name, e))
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, tmp = tempfile.mkstemp(dir=path.parent, prefix=".tmp")
    with os.fdopen(fd, "wb") as f:
        f.write(data)
    os.replace(tmp, path)


def gbagfx_args(e):
    return ["-num_tiles", e.opts["tiles"]] if "tiles" in e.opts else []


# --------------------------------------------------------------------------
# commands

def extract():
    rom = Path("baserom.gba").read_bytes()
    entries = read_manifest()
    by_name = {e.name: e for e in entries.values()}
    count = 0
    for e in entries.values():
        if not e.src.exists():
            write_source(rom, by_name, e, e.src)
            count += 1
        elif e.raw and not e.is_image and e.src.stat().st_size != e.size:
            print(f"warning: {e.src} is not {e.size:#x} bytes like its manifest entry; "
                  f"delete it to extract it again", file=sys.stderr)
    GFX_DIR.mkdir(exist_ok=True)
    (GFX_DIR / ".extracted").touch()
    print(f"extracted {count} files to {GFX_DIR}/")


def makefile():
    """Make variables: which entries take which build path."""
    groups = {k: [] for k in ("SRC", "BUILT", "LZ_BIN", "LZ_PAL", "LZ_4BPP", "LZ_8BPP", "4BPP", "8BPP")}
    flags = []
    for e in sorted(read_manifest().values(), key=lambda e: e.addr):
        groups["SRC"].append(e.src)
        groups["BUILT"].append(e.built)
        if e.is_image:
            groups[f"{e.bpp}BPP"].append(e.tiles_file)
            if gbagfx_args(e):
                flags.append(f"{e.tiles_file}: GBAGFX_FLAGS := {' '.join(gbagfx_args(e))}\n")
        if not e.raw:
            groups["LZ_" + (f"{e.bpp}BPP" if e.is_image else "PAL" if e.fmt == "palette" else "BIN")].append(e.lz)
    out = ["# Generated by tools/gfx.py makefile from data/graphics.txt.\n"]
    for k, files in groups.items():
        out.append(f"GFX_{k} := \\\n" + "".join(f"\t{f.as_posix()} \\\n" for f in files) + "\n")
    sys.stdout.write("".join(out + flags))


def run(cmd):
    r = subprocess.run(cmd, capture_output=True, text=True)
    if r.returncode:
        raise RuntimeError(f"{' '.join(map(str, cmd))}: {r.stderr.strip()}")


def check():
    """Rebuild every entry from the ROM through the build's conversions."""
    for tool in (LZ77, GBAGFX):
        if not tool.exists():
            sys.exit(f"{tool} is missing: make {tool}")
    rom = Path("baserom.gba").read_bytes()
    entries = read_manifest()
    by_name = {e.name: e for e in entries.values()}
    tmp = Path(tempfile.mkdtemp())

    def one(e):
        d = tmp / f"{e.addr:08X}"
        d.mkdir()
        src = d / f"src.{e.ext}"
        write_source(rom, by_name, e, src)
        data = src
        if e.is_image:
            data = d / f"tiles.{e.bpp}bpp"
            run([str(GBAGFX), str(src), str(data)] + gbagfx_args(e))
        got = data.read_bytes()
        if not e.raw:
            run([str(LZ77), "-c", str(data), str(d / "out.lz")])
            got = (d / "out.lz").read_bytes()
            ok = len(got) >= e.size
        else:
            ok = len(got) == e.size
        off = e.addr - ROM_BASE
        ok = ok and got[:e.size] == rom[off:off + e.size]
        for f in d.iterdir():
            f.unlink()
        d.rmdir()
        return e, ok

    bad = 0
    counts = {}
    with concurrent.futures.ThreadPoolExecutor(os.cpu_count() or 4) as pool:
        for e, ok in pool.map(one, entries.values()):
            kind = "png" if e.is_image else e.ext
            counts[kind] = counts.get(kind, 0) + 1
            if not ok:
                bad += 1
                print(f"mismatch: {e.name} at {e.addr:#x}")
    tmp.rmdir()
    detail = ", ".join(f"{n} {k}" for k, n in sorted(counts.items()))
    print(f"{len(entries) - bad} of {len(entries)} entries round-trip exactly ({detail})")
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


def in_one_section(items, start, end):
    return any(kind == "section" and addr <= start and end <= extra
               for kind, addr, _, extra in items)


def main():
    cmd = sys.argv[1] if len(sys.argv) > 1 else ""
    if cmd == "extract":
        extract()
    elif cmd == "makefile":
        makefile()
    elif cmd == "check":
        sys.exit(0 if check() else 1)
    elif cmd == "scan":
        scan()
    elif cmd == "classify":
        sys.path.insert(0, str(Path(__file__).parent))
        import gfxrefs
        gfxrefs.classify()
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main()
