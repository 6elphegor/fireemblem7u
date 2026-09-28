#!/usr/bin/env python3
"""Build modern ROMs in which assets changed size, check them, restore.

  tools/modernresize.py [neutral|literal|edited]...  (make modern-resizetest:
                                                  neutral and edited)

For each mode (default: both) this backs up the files it changes, edits
them, runs `make MODERN=1`, copies the result to fe7u_modern_MODE.gba (with
its ELF and map, fe7u_modern_MODE.elf/.map), runs tools/moderncheck.py on it,
and restores the files (your own edits in them are kept: the originals are
copied back).  Finally it rebuilds fe7u_modern.gba from the restored files.
A matching build (fe7u.elf) is made first; tools/moderncheck.py needs it.

  neutral   sizes change, behavior doesn't: three LZ77 blobs (a background
            near the start of the data, a portrait, a battle background near
            the end) get unused bytes after the end of their stream (0x3A1,
            0x205 and 0x77: odd sizes, so the alignment rules are exercised),
            and an unreachable FINE is added after a song track (1 byte:
            everything after it in the music moves by an odd amount).  For
            runtime comparison with the original: it should play the same.
  literal   the same three blobs stored with literals only (the same data
            decompressed from a different, 12% larger stream).  Plays the
            same, but decompressing takes longer, so a scene may start a
            frame or two later.
  edited    real edits through the source files: pixels of a background
            and a portrait PNG, a wait added to a song track, a longer
            message in texts/texts.txt.
"""
import shutil
import struct
import subprocess
import sys
import time
import zlib
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
import gfx  # noqa: E402

BACKUP = Path("build/modern/resize-backup")
EARLY, PORTRAIT, LATE = "bg/bg_00", "portrait/002_Eliwood_face", "btl_terrain/68_fune1"
SONG = Path("sound/songs/song001.s")
TEXTS = Path("texts/texts.txt")


def make(*args):
    r = subprocess.run(["make", "-j8", *args], capture_output=True, text=True)
    if r.returncode:
        sys.exit(f"make {' '.join(args)} failed:\n{r.stdout[-3000:]}\n{r.stderr[-3000:]}")
    return r.stdout


def literal_lz77(data):
    """LZ77 stream (BIOS format) of data with no back references, padded to 4."""
    out = bytearray(struct.pack("<I", 0x10 | len(data) << 8))
    for i in range(0, len(data), 8):
        out.append(0)
        out += data[i:i + 8]
    return bytes(out + bytes(-len(out) % 4))


def png_palette(path):
    """The PLTE chunk of a PNG."""
    b = Path(path).read_bytes()
    p = 8
    while p < len(b):
        n, kind = struct.unpack_from(">I4s", b, p)
        if kind == b"PLTE":
            return b[p + 8:p + 8 + n]
        p += 12 + n
    raise ValueError(f"{path}: no PLTE")


def edit_png(name):
    """Change pixels of graphics/NAME.png (a block of noise in the middle)."""
    e = next(e for e in gfx.read_manifest().values() if e.name == name)
    tiles = bytearray(e.tiles_file.read_bytes())  # built from the PNG by the last make
    seed = 1
    for i in range(len(tiles) // 3, len(tiles) // 2):
        seed = (seed * 1103515245 + 12345) & 0x7FFFFFFF
        tiles[i] = seed >> 16 & 0xFF
    e.src.write_bytes(gfx.tiles_to_png(bytes(tiles), e.bpp, int(e.opts["w"]), png_palette(e.src)))
    return [e.src]


def insert_after(path, match, line):
    lines = path.read_text().splitlines(True)
    i = next(i for i, x in enumerate(lines) if x.strip().replace("\t", " ") == match)
    lines.insert(i + 1, line)
    path.write_text("".join(lines))


def neutral(literal=False):
    changed = []
    for name, pad in ((EARLY, 0x3A1), (PORTRAIT, 0x205), (LATE, 0x77)):
        e = next(e for e in gfx.read_manifest().values() if e.name == name)
        data = e.lz.read_bytes()
        data = literal_lz77(gfx.lz77_decompress(data)[0]) if literal else data + bytes(pad)
        e.lz.write_bytes(data)  # newer than its PNG: make keeps it
        changed.append(e.lz)
    if not literal:
        insert_after(SONG, ".byte FINE", "\t.byte\tFINE\t@ modernresize: unreachable\n")
    return changed, [SONG]


def edited():
    files = edit_png(EARLY) + edit_png(PORTRAIT)
    insert_after(SONG, ".byte KEYSH, 0", "\t.byte\tW01\t@ modernresize\n")
    t = TEXTS.read_text()
    old = "## MSG_007\nCome back again.[A][X]\n"
    if old not in t:
        sys.exit(f"{TEXTS}: MSG_007 is not the original one; not editing it")
    TEXTS.write_text(t.replace(old, "## MSG_007\nCome back again soon, friend.[A][X]\n"))
    return [], files + [SONG, TEXTS]


def main():
    modes = sys.argv[1:] or ["neutral", "edited"]
    if any(m not in ("neutral", "literal", "edited") for m in modes):
        sys.exit(__doc__)
    make()  # the matching build: fe7u.elf, and every built file up to date
    make("MODERN=1")
    ok = True
    for mode in modes:
        shutil.rmtree(BACKUP, ignore_errors=True)
        sources = [SONG, TEXTS] + [e.src for e in gfx.read_manifest().values()
                                   if e.name in (EARLY, PORTRAIT, LATE)]
        for f in sources:
            (BACKUP / f).parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(f, BACKUP / f)
        time.sleep(1.1)  # make 3.81 compares whole seconds
        built, _ = edited() if mode == "edited" else neutral(mode == "literal")
        try:
            make("MODERN=1")
            rom = Path(f"fe7u_modern_{mode}.gba")
            shutil.copyfile("fe7u_modern.gba", rom)
            for ext in ("elf", "map"):
                shutil.copyfile(f"fe7u_modern.{ext}", rom.with_suffix(f".{ext}"))
            print(f"== {rom} ({rom.stat().st_size:#x} bytes)")
            r = subprocess.run([sys.executable, "tools/moderncheck.py", str(rom.with_suffix(".elf")), str(rom)])
            ok &= r.returncode == 0
        finally:
            time.sleep(1.1)
            for f in sources:
                shutil.copyfile(BACKUP / f, f)  # a new mtime: make rebuilds from it
            for f in built:
                f.unlink()
            shutil.rmtree(BACKUP, ignore_errors=True)
    make("MODERN=1")
    same = Path("fe7u_modern.gba").read_bytes() == Path("baserom.gba").read_bytes()
    print(f"restored; fe7u_modern.gba {'is identical to' if same else 'DIFFERS from'} baserom.gba")
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
