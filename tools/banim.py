#!/usr/bin/env python3
"""Battle animation scripts: extraction and the compressing link.

Usage: tools/banim.py extract           write banim/NAME.s for every script
                                        that has none (never overwrites)
       tools/banim.py link DIR -- LD... run the link command LD... with the
                                        scripts compressed from the linked
                                        addresses (see below); DIR holds the
                                        generated files (build/banim)

Format.  struct BattleAnim (include/gbafe/banim.h) points at an
LZ77-compressed script and, right after it in the ROM, its mode table.
The decompressed script is a list of u32 commands in three forms:

  0x86NNDDDD SHEET OAM   frame: sprite sheet SHEET (absolute pointer to a
                         compressed 4bpp image), OAM data at byte offset OAM
                         in the animation's (compressed) OAM data, shown for
                         DDDD ticks; NN is a frame number
  0x850000CC             command CC (attack start, hit, sound, effect...)
  0x80000000             end of a mode

and modes (enum banim_mode_index) follow each other.  The mode table is
the byte offset of modes 1..N in the script (0 if missing), then N zero
words; N is 12, or 11 for three animations without mode 12.  The only pointers are the SHEET words (25,329 in 162 scripts); the
OAM offsets and mode offsets are relative.

Source.  banim/NAME.s (not in git, like graphics/ and sound/) is the
script as include/banim_script.inc macros, with the sheets by label:

    banim_script BanimScr_001_erlm_sw1
    banim_mode 1
    banim_cmd 0x3
    banim_frame 1, 0, gUnk_08E0A5B8, 0x0
    ...
    banim_end_mode
    ...
    banim_modes BanimModes_001_erlm_sw1

`extract` writes it from baserom.gba for every script placed in
data/layout.txt (lines `rom ADDR SIZE build/banim/banim.o(.rodata.NAME)`;
SIZE covers the compressed script and the mode table), taking label names
from data/rom/*.s (the banim_data table names the script and mode table,
sheets have labels).  The build assembles it to build/banim/NAME.script.o:
section .banim.script holds the uncompressed script with an R_ARM_ABS32
relocation per sheet word, .banim.modes the mode table.

The compressing link.  The compressed bytes depend on the sheet addresses,
which depend on where everything before the sheets ends up, including other
compressed scripts.  `link` solves this with a fixpoint:

  1. for every script, take the decompressed contents of the previous
     build (DIR/NAME.bin) or, the first time, resolve the relocations with
     the addresses the data/rom labels have in the layout;
  2. compress each (build/tools/lz77) to DIR/NAME.lz and write DIR/banim.s,
     one section .rodata.NAME per script: the label, the .lz, the mode
     table label and words; assemble it to DIR/banim.o (the object the
     layout places);
  3. link with the layout's ASSERTs removed (sizes may be off while
     iterating), read the symbol values from the result, resolve every
     script's relocations with them; if any script's contents changed,
     back to 2;
  4. link with the real command (with the ASSERTs: the layout still has to
     match, as for any data) to produce the output.

A normal build converges at once (one extra link); moved data (tools/
shifttest.py) takes a few rounds.  Should the sizes oscillate (a script's
size moving its own sheets), .lz files are padded with zeros to the largest
size seen after a few rounds, which makes sizes monotonic.
"""
import os
import re
import struct
import subprocess
import sys
import tempfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
import elf32  # noqa: E402

ROM_BASE = 0x08000000
SRC_DIR = Path("banim")
OBJ_DIR = Path("build/banim")
LAYOUT = Path("data/layout.txt")
LZ77 = Path("build/tools/lz77")
AS = "arm-none-eabi-as"
PLACED = re.compile(r"^rom\s+(0x[0-9A-Fa-f]+)\s+(0x[0-9A-Fa-f]+)\s+build/banim/banim\.o\(\.rodata\.(\w+)\)\s*$")
MODE_NAMES = [
    "NORMAL_ATK", "NORMAL_ATK_PRIORITY_L", "CRIT_ATK", "CRIT_ATK_PRIORITY_L",
    "RANGED_ATK", "RANGED_CRIT_ATK", "CLOSE_DODGE", "RANGED_DODGE",
    "STANDING", "STANDING2", "RANGED_STANDING", "MISSED_ATK"]


def scripts():
    """[(addr, size, name)] of the scripts placed by data/layout.txt."""
    out = []
    for line in LAYOUT.read_text().splitlines():
        if m := PLACED.match(line):
            out.append((int(m.group(1), 16), int(m.group(2), 16), m.group(3)))
    return sorted(out)


def decode(data):
    """Commands of a decompressed script: [(offset, words)]."""
    ws = struct.unpack_from(f"<{len(data) // 4}I", data)
    out, i = [], 0
    while i < len(ws):
        n = 3 if ws[i] >> 24 == 0x86 else 1
        if ws[i] >> 24 not in (0x80, 0x85, 0x86) or i + n > len(ws):
            raise ValueError(f"unknown command {ws[i]:#010x} at {4 * i:#x}")
        out.append((4 * i, ws[i:i + n]))
        i += n
    return out


def sheet_words(data):
    """{offset: value} of the sprite sheet pointer words of a script."""
    return {off + 4: w[1] for off, w in decode(data) if len(w) == 3}


# --- extract ------------------------------------------------------------------

def extract():
    import datasplit
    import gfx
    rom = Path("baserom.gba").read_bytes()
    todo = [s for s in scripts() if not (SRC_DIR / f"{s[2]}.s").exists()]
    if todo:
        items = datasplit.walk_rom_files()
        labels, ptrs = {}, {}
        for kind, addr, arg, _ in items:
            if kind == "label":
                labels.setdefault(addr, arg)
            elif kind == "ptr":
                ptrs[addr] = arg
        # banim_data: which entry uses which script, and its mode table's name
        users = {}
        table = next(a for a, n in labels.items() if n == "banim_data")
        a, i = table, 0
        while 0x20 < rom[a - ROM_BASE] < 0x7F:
            abbr = rom[a - ROM_BASE:a - ROM_BASE + 12].rstrip(b"\0").decode("ascii")
            users.setdefault(ptrs[a + 0x10], []).append((i, abbr, ptrs[a + 0xC]))
            a, i = a + 0x20, i + 1
    for addr, size, name in todo:
        data, length = gfx.lz77_decompress(rom, addr - ROM_BASE)
        modes_at = addr + ((length + 3) & ~3)
        nmodes = (addr + size - modes_at) // 8
        if not 0 < nmodes <= 12 or addr + size - modes_at != 8 * nmodes:
            sys.exit(f"{name}: {addr + size - modes_at:#x} bytes after the script are not a mode table")
        modes = struct.unpack_from(f"<{2 * nmodes}I", rom, modes_at - ROM_BASE)
        if name not in users:
            sys.exit(f"{name}: not in banim_data (data/rom/*.s), so its mode table has no name")
        modes_names = {u[2] for u in users[name]}
        if len(modes_names) != 1:
            sys.exit(f"{name}: used with different mode tables {sorted(modes_names)}")
        cmds = decode(data)
        starts = [0] + [off + 4 for off, w in cmds if w[0] == 0x80000000]
        mode_at = {}
        for k, off in enumerate(modes[:nmodes]):
            if k and off == 0:
                continue
            if off not in starts or off >= len(data) or off in mode_at:
                sys.exit(f"{name}: mode {k + 1} offset {off:#x} is not the start of a mode")
            mode_at[off] = k + 1
        if any(modes[nmodes:]):
            sys.exit(f"{name}: mode table: nonzero words after the {nmodes} offsets")
        if max(mode_at.values()) != nmodes:
            sys.exit(f"{name}: mode table: last mode is not {nmodes}")
        out = [f"@ Battle animation script, LZ77-compressed in the ROM (tools/banim.py).\n"]
        for i, abbr, _ in users[name]:
            out.append(f"@ banim_data[{i:#x}] \"{abbr}\"\n")
        out.append('\n\t.include "banim_script.inc"\n\n')
        out.append(f"\tbanim_script {name}\n")
        for off, w in cmds:
            if off in mode_at:
                k = mode_at[off]
                out.append(f"\n\tbanim_mode {k}  @ {MODE_NAMES[k - 1]}\n")
            if w[0] == 0x80000000:
                out.append("\tbanim_end_mode\n")
            elif w[0] >> 24 == 0x85:
                if w[0] & 0x00FFFF00:
                    out.append(f"\t.4byte {w[0]:#010x}\n")
                else:
                    out.append(f"\tbanim_cmd {w[0] & 0xFF:#x}\n")
            else:
                sheet = labels.get(w[1])
                if sheet is None:
                    sys.exit(f"{name}: sheet {w[1]:#x} at {off + 4:#x} has no label in data/rom")
                out.append(f"\tbanim_frame {w[0] & 0xFFFF}, {w[0] >> 16 & 0xFF}, {sheet}, {w[2]:#x}\n")
        out.append(f"\n\tbanim_modes {modes_names.pop()}\n")
        path = SRC_DIR / f"{name}.s"
        path.parent.mkdir(parents=True, exist_ok=True)
        fd, tmp = tempfile.mkstemp(dir=path.parent, prefix=".tmp")
        with os.fdopen(fd, "w") as f:
            f.write("".join(out))
        os.replace(tmp, path)
    SRC_DIR.mkdir(exist_ok=True)
    (SRC_DIR / ".extracted").touch()
    print(f"extracted {len(todo)} battle animation scripts to {SRC_DIR}/")


# --- link ---------------------------------------------------------------------

class Script:
    """A script object (build/banim/NAME.script.o)."""

    def __init__(self, name):
        self.name = name
        elf = elf32.Elf(OBJ_DIR / f"{name}.script.o")
        sec, modes = elf.section(".banim.script"), elf.section(".banim.modes")
        if sec is None or modes is None:
            sys.exit(f"{elf.path}: needs banim_script and banim_modes")
        if modes.relocs:
            sys.exit(f"{elf.path}: the mode table must not hold pointers")
        self.data, self.modes = sec.data, modes.data
        glob = lambda s: [x.name for x in elf.symbols if x.bind == 1 and x.shndx == s.index and x.value == 0]
        self.label, self.modes_label = glob(sec)[0], glob(modes)[0]
        self.relocs = []  # (offset, symbol name)
        for off, typ, sym in sec.relocs:
            if typ != elf32.R_ARM_ABS32 or sym.shndx != elf32.SHN_UNDEF:
                sys.exit(f"{elf.path}: offset {off:#x}: only pointers to outside symbols (.4byte NAME) are supported")
            self.relocs.append((off, sym.name))

    def resolve(self, value):
        """Contents with each relocated word + value(symbol name)."""
        b = bytearray(self.data)
        for off, sym in self.relocs:
            v = value(sym)
            if v is None:
                raise KeyError(sym)
            add, = struct.unpack_from("<I", b, off)
            struct.pack_into("<I", b, off, (add + v) & 0xFFFFFFFF)
        return bytes(b)


def nominal_addresses():
    """Label addresses as laid out in data/rom/*.s (used to start the fixpoint)."""
    import datasplit
    return {n: a for kind, a, n, _ in datasplit.walk_rom_files() if kind == "label"}


def elf_symbols(path):
    return {s.name: s.value for s in elf32.Elf(path).symbols
            if s.bind == 1 and s.shndx != elf32.SHN_UNDEF and s.name}


def write_if_changed(path, data):
    if path.exists() and path.read_bytes() == data:
        return False
    path.write_bytes(data)
    return True


def compress(workdir, s, contents, minsize):
    """DIR/NAME.lz: the script compressed (cached in NAME.lz0), padded with
    zeros to minsize.  Returns its size."""
    raw, lz0, lz = (workdir / f"{s.name}{ext}" for ext in (".bin", ".lz0", ".lz"))
    if write_if_changed(raw, contents) or not lz0.exists():
        subprocess.run([str(LZ77), "-c", str(raw), str(lz0)], check=True)
    data = lz0.read_bytes()
    data += bytes(max(0, minsize - len(data)))
    write_if_changed(lz, data)
    return len(data)


def assemble(workdir, objs):
    out = ["@ Generated by tools/banim.py link: compressed battle animation scripts\n"]
    for s in objs:
        words = ", ".join(f"{w:#x}" for w in struct.unpack(f"<{len(s.modes) // 4}I", s.modes))
        out.append(f'\n\t.section .rodata.{s.name}, "a"\n\t.balign 4\n'
                   f"\t.global {s.label}\n{s.label}:\n"
                   f'\t.incbin "{(workdir / s.name).as_posix()}.lz"\n'
                   f"\t.global {s.modes_label}\n{s.modes_label}:\n\t.4byte {words}\n")
    src = workdir / "banim.s"
    write_if_changed(src, "".join(out).encode())
    subprocess.run([AS, "-mcpu=arm7tdmi", "-o", str(workdir / "banim.o"), str(src)], check=True)


def link(workdir, cmd, strict=True):
    """Run the link command cmd (a list) with the compressed scripts in
    workdir.  strict: the final link uses cmd's own linker script (with the
    layout ASSERTs); otherwise the ASSERT-free one used while iterating."""
    workdir = Path(workdir)
    workdir.mkdir(parents=True, exist_ok=True)
    obj = (OBJ_DIR / "banim.o").as_posix()
    new_obj = (workdir / "banim.o").as_posix()
    cmd = [new_obj if a == obj else a for a in cmd]
    # the linker script for the iterations: ASSERTs out, banim.o from workdir
    t = cmd.index("-T") + 1
    lds = Path(cmd[t]).read_text()
    m = re.search(r"INCLUDE\s+(\S*layout\.ld)", lds)
    lay = Path(m.group(1)).read_text().replace(obj, new_obj)
    lay = "".join(l for l in lay.splitlines(True) if not l.lstrip().startswith("ASSERT"))
    (workdir / "layout.ld").write_text(lay)
    (workdir / "iter.ld").write_text(lds[:m.start(1)] + (workdir / "layout.ld").as_posix() + lds[m.end(1):])
    it = list(cmd)
    it[t] = (workdir / "iter.ld").as_posix()
    for flag, name in (("-o", "iter.elf"), ("-Map", "iter.map")):
        if flag in it:
            it[it.index(flag) + 1] = (workdir / name).as_posix()

    objs = [Script(name) for _, _, name in scripts()]
    nominal = None
    contents = {}
    for s in objs:
        raw = workdir / f"{s.name}.bin"
        if raw.exists() and len(raw.read_bytes()) == len(s.data):
            contents[s.name] = raw.read_bytes()
        else:
            nominal = nominal or nominal_addresses()
            contents[s.name] = s.resolve(lambda n: nominal.get(n, 0))
    minsize = {s.name: 0 for s in objs}
    for rounds in range(1, 31):
        sizes = {s.name: compress(workdir, s, contents[s.name], minsize[s.name]) for s in objs}
        assemble(workdir, objs)
        subprocess.run(it, check=True)
        syms = elf_symbols(workdir / "iter.elf")
        try:
            new = {s.name: s.resolve(syms.get) for s in objs}
        except KeyError as e:
            sys.exit(f"tools/banim.py: undefined symbol {e} in a battle animation script")
        changed = [n for n in new if new[n] != contents[n]]
        if not changed:
            break
        contents = new
        if rounds >= 4:  # sizes oscillating: only let them grow
            minsize = {n: max(minsize[n], sizes[n]) for n in minsize}
    else:
        sys.exit("tools/banim.py: battle animation script sizes did not converge")
    if rounds > 1:
        print(f"banim: {len(objs)} scripts converged after {rounds} links")
    final = cmd if strict else it[:t] + [it[t]] + cmd[t + 1:]
    subprocess.run(final, check=True)
    out = final[final.index("-o") + 1]
    syms = elf_symbols(out)
    if any(s.resolve(syms.get) != contents[s.name] for s in objs):
        sys.exit(f"tools/banim.py: {out} does not match the iterated layout")


def main():
    cmd = sys.argv[1] if len(sys.argv) > 1 else ""
    if cmd == "extract":
        extract()
    elif cmd == "link" and len(sys.argv) > 4 and sys.argv[3] == "--":
        link(sys.argv[2], sys.argv[4:])
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main()
