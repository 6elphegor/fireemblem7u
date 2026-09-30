#!/usr/bin/env python3
"""Sources and layout for the modern (non-matching) build.

Usage: tools/modern.py OUT_DIR      (make MODERN=1 runs it as build/modern)

The matching build pins every data-region section to its original address
(tools/gen_layout.py: an ASSERT on each one's address and size).  The
modern build places the same sections in the same order with no fixed
addresses, so an edited asset may change size and everything after it
moves (every pointer to it is a symbol).  This tool writes:

  OUT_DIR/data/rom/*.s   data/rom/*.s, with a new section started right
                         after every extracted asset (`.incbin` of a file
                         other than baserom.gba: graphics, palettes), so
                         that an asset whose size changes is always at the
                         end of its section;
  OUT_DIR/layout.txt     data/layout.txt (the battle animation object from
                         OUT_DIR/banim) plus those sections, each with its
                         original address and size, for
                         `tools/gen_layout.py --modern`, which places them
                         in ROM order, keeping each section's original
                         address modulo 4 (see there).

Alignment rule: every section starts at an address congruent to its
original one modulo 4, and nothing inside a section moves relative to its
start except after a resized object (the last thing in a data/rom section;
the music, text and event objects align their own contents with .align).
So all data keeps the alignment it had, up to 4 bytes, and with unchanged
sizes the result is the original ROM byte for byte.

Streams stored cut short.  Three LZ77 palettes are stored 2 bytes short:
their last token is the first bytes of the next blob.  That only works
while those bytes agree, so the full stream is used whenever the built
files no longer overlap that way (it then takes 4 more bytes).
"""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
import gfx  # noqa: E402

ROM_BASE = 0x08000000
SRC_DIR = Path("data/rom")
LAYOUT = Path("data/layout.txt")
MOD_LAYOUT = Path("mod/layout.txt")
BANIM_OBJ = "build/banim/banim.o"

SECTION = re.compile(r"\.section\s+\.rodata\.([0-9A-F]{8})")
INCBIN_ROM = re.compile(r'\.incbin\s+"baserom\.gba",\s*(\w+),\s*(\w+)')
INCBIN_FILE = re.compile(r'\.incbin\s+"([^"]+)"(?:\s*,\s*0\s*,\s*(\w+))?$')


def write_if_changed(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists() and path.read_text() == text:
        return
    path.write_text(text)


def item_bytes(code, rom, n):
    """The first n bytes an incbin line emits (None if not an incbin)."""
    if m := INCBIN_ROM.match(code):
        off = int(m.group(1), 0)
        return rom[off:off + n]
    if m := INCBIN_FILE.match(code):
        return Path(m.group(1)).read_bytes()[:n]
    return None


def cut_short_ok(path, size, following, rom):
    """Can the stream in path still be stored cut to size bytes: are the
    bytes it reads past size the ones that follow it?"""
    data = Path(path).read_bytes()
    _, used = gfx.lz77_decompress(data)
    if used <= size:
        return True
    nxt = next((b for b in (item_bytes(c, rom, used - size) for c in following) if b is not None), None)
    return nxt is not None and data[size:used] == nxt


def split_file(src, rom, manifest):
    """(text, [(orig addr, orig size, section name)]) of one data/rom file."""
    lines = src.read_text().splitlines(True)
    codes = [line.split("@")[0].strip() for line in lines]
    out, sections = [], []
    pos = None
    split = False  # start a new section before the next content
    for i, (line, code) in enumerate(zip(lines, codes)):
        if m := SECTION.match(code):
            pos, split = int(m.group(1), 16), False
            sections.append([pos, pos, m.group(1)])
            out.append(line)
            continue
        content = code.startswith((".incbin", ".4byte", ".global")) or code.endswith(":")
        if split and content:
            name = f"{pos:08X}"
            out.append(f'\n\t@ modern build: new section after a resizable asset\n'
                       f'\t.section .rodata.{name}, "a"\n')
            sections.append([pos, pos, name])
            split = False
        if m := INCBIN_ROM.match(code):
            pos += int(m.group(2), 0)
        elif m := INCBIN_FILE.match(code):
            if m.group(2):  # stored cut short
                size = int(m.group(2), 0)
                following = [c for c in codes[i + 1:] if c.startswith(".incbin") or c.startswith(".4byte")][:1]
                if not cut_short_ok(m.group(1), size, following, rom):
                    line = f'\t.incbin "{m.group(1)}"  @ modern build: stored whole (no longer overlaps)\n'
            elif pos in manifest:
                size = manifest[pos].size
            else:
                sys.exit(f"{src}: {m.group(1)} at {pos:#x} is not in {gfx.MANIFEST}")
            pos += size
            split = True
        elif code.startswith(".4byte"):
            pos += 4
        out.append(line)
        if sections:
            sections[-1][1] = pos
    return "".join(out), [(s, e - s, n) for s, e, n in sections]


def main():
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    out = Path(sys.argv[1])
    rom = Path("baserom.gba").read_bytes()
    manifest = gfx.read_manifest()
    layout = ["# rom|ram ADDR SIZE OBJECT(SECTION) -- generated by tools/modern.py\n"]
    lines = LAYOUT.read_text().splitlines(True)
    if MOD_LAYOUT.exists():  # objects appended after the ROM (tools/gen_layout.py)
        lines += MOD_LAYOUT.read_text().splitlines(True)
    for line in lines:
        if line.startswith(("rom ", "ram ")):
            layout.append(line.replace(BANIM_OBJ, (out / "banim/banim.o").as_posix()))
    nsec = 0
    for src in sorted(SRC_DIR.glob("*.s")):
        text, sections = split_file(src, rom, manifest)
        obj = (out / "data/rom" / src.with_suffix(".o").name).as_posix()
        for addr, size, name in sections:
            layout.append(f"rom 0x{addr:08X} 0x{size:X} {obj}(.rodata.{name})\n")
        nsec += len(sections)
        write_if_changed(out / "data/rom" / src.name, text)
    write_if_changed(out / "layout.txt", "".join(layout))
    (out / "rom.stamp").touch()


if __name__ == "__main__":
    main()
