#!/usr/bin/env python3
"""Decode proc scripts (struct ProcCmd []) from the ROM into C.

Usage:
  tools/procdis.py list [--declared|--undeclared]
        objects labeled in data/rom/*.s that are proc scripts (declared
        `struct ProcCmd` in include/, or decoding cleanly with every pointer
        resolved to a symbol), with problems noted
  tools/procdis.py emit NAME...
        C definitions with the PROC_* macros of include/gbafe/proc.h, each
        under SECTION(".rodata.<ADDR>"); problems go to stderr
  tools/procdis.py layout MODULE NAME...
        the matching data/layout.txt lines for build/src/MODULE.o

Each command is 8 bytes: s16 opcode, s16 dataImm, pointer.  Bytes come from
baserom.gba.  Pointer words come from the `.4byte SYMBOL [+ ADDEND]` lines of
data/rom/*.s (dataptrs.py decided they are pointers); for words the assembly
left raw, from an exact address match in fe7u.elf (`nm`, so `make` first) or
in the labels of data/rom.  A function pointer loses its Thumb bit (C function
pointers carry it).  A `+ ADDEND` on a script pointer (START_CHILD, JUMP...)
becomes `&SYMBOL[ADDEND / 8]`; any other addend is reported.

An object is a run of commands from a label up to the first PROC_END (or, for
a script that has none, is reported).  Objects with other labels inside,
raw pointer words that match no symbol, unknown opcodes and addends are
reported as problems and emitted with a `/* FIXME */` marker.

The definitions are `const struct ProcCmd`: agbcc puts a const object with
SECTION(".rodata.<ADDR>") into a section assembled with the read-only flag,
whereas a non-const one gets "aw", which `as` warns about for a .rodata.* name.
"""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from datac import ROOT, BASE, RomData   # the ROM index and pointer words are shared (tools/datac.py)

# opcode -> (macro, kind)  kind: "none" | "ptr" | "imm" | "imm_ptr"
# "fixed" macros write a constant into dataImm; anything else is emitted raw.
OPS = {
    0x00: ("PROC_END", "none"),
    0x01: ("PROC_NAME", "ptr"),
    0x02: ("PROC_CALL", "ptr"),
    0x03: ("PROC_REPEAT", "ptr"),
    0x04: ("PROC_SET_END_CB", "ptr"),
    0x05: ("PROC_START_CHILD", "ptr"),
    0x06: ("PROC_START_CHILD_BLOCKING", "ptr", 1),
    0x07: ("PROC_START_MAIN_BUGGED", "ptr"),
    0x08: ("PROC_WHILE_EXISTS", "ptr"),
    0x09: ("PROC_END_EACH", "ptr"),
    0x0A: ("PROC_BREAK_EACH", "ptr"),
    0x0B: ("PROC_LABEL", "imm"),
    0x0C: ("PROC_GOTO", "imm"),
    0x0D: ("PROC_JUMP", "ptr"),
    0x0E: ("PROC_SLEEP", "imm"),
    0x0F: ("PROC_MARK", "imm"),
    0x10: ("PROC_BLOCK", "none"),
    0x11: ("PROC_END_IF_DUPLICATE", "none"),
    0x12: ("PROC_SET_BIT4", "none"),
    0x13: ("PROC_13", "none"),
    0x14: ("PROC_WHILE", "ptr"),
    0x15: ("PROC_15", "none"),
    0x16: ("PROC_CALL_2", "ptr"),
    0x17: ("PROC_END_DUPLICATES", "none"),
    0x18: ("PROC_CALL_ARG", "imm_ptr"),
    0x19: ("PROC_19", "none"),
}


class Ctx(RomData):
    def __init__(self):
        super().__init__()
        self.decl = {}
        for path in (ROOT / "include").rglob("*.h"):
            for m in re.finditer(r"extern\s+(?:const\s+)?struct\s+ProcCmd\s+(?:const\s+|CONST_DATA\s+)?(\w+)\s*\[", path.read_text(errors="replace")):
                self.decl[m[1]] = path

    def decode(self, addr):
        """Return (cmds, problems); cmds = [(opcode, imm, ptrexpr|None, value)]."""
        cmds, problems = [], []
        a = addr
        while True:
            op, imm = self.s16(a), self.s16(a + 2)
            val = self.word(a + 4)
            cmds.append((op, imm, val, a))
            a += 8
            if op == 0 and val == 0 and imm == 0:
                break
            if len(cmds) > 4096 or a - BASE >= len(self.rom):
                problems.append("no END")
                break
        return cmds, problems

    def emit_cmd(self, c, problems):
        op, imm, val, a = c
        info = OPS.get(op & 0xFFFF if op >= 0 else op & 0xFFFF)
        raw = lambda: "{ " + f"{op:#04x}, {imm:#06x}, " + (self.ptr_expr(a + 4, val, problems)) + " }"
        if info is None:
            problems.append(f"unknown opcode {op:#x} at {a:#010x}")
            return raw() + "  /* FIXME */"
        name, kind = info[0], info[1]
        fixed = info[2] if len(info) > 2 else 0
        hasptr = val != 0
        if kind == "none":
            if imm == 0 and not hasptr:
                return name
            return raw()
        if kind == "ptr":
            if imm == fixed:
                if op == 1 and hasptr:
                    return f"{name}({self.string_expr(val, a + 4, problems)})"
                if not hasptr:
                    return raw()
                return f"{name}({self.ptr_expr(a + 4, val, problems, op in (5, 6, 7, 8, 9, 10, 13))})"
            return raw()
        if kind == "imm":
            if hasptr:
                return raw()
            return f"{name}({imm})"
        if kind == "imm_ptr":
            return f"{name}({self.ptr_expr(a + 4, val, problems)}, {imm})"

    def string_expr(self, val, a, problems):
        if a in self.ptrs:
            return self.ptr_expr(a, val, problems)
        o = val - BASE
        end = self.rom.index(b"\0", o)
        s = self.rom[o:end]
        if all(32 <= ch < 127 for ch in s) and s:
            return '"' + s.decode().replace("\\", "\\\\").replace('"', '\\"') + '"'
        return self.ptr_expr(a, val, problems)

    def object(self, name):
        if name.startswith("0x"):  # an address: works on unlabeled or converted data too
            self.labels[name] = int(name, 16)
            self.addr_names.setdefault(int(name, 16), name)
        addr = self.labels[name]
        cmds, problems = self.decode(addr)
        end = addr + 8 * len(cmds)
        nxt = self.next_label(addr)
        inner = [self.addr_names[x] for x in self.label_addrs if addr < x < end]
        if inner:
            problems.append(f"labels inside: {', '.join(inner)}")
        lines = [self.emit_cmd(c, problems) for c in cmds]
        return addr, end - addr, lines, problems, nxt


def looks_like_proc(ctx, name):
    """An undeclared object whose bytes decode as a well-formed proc script."""
    addr = ctx.labels[name]
    if addr % 4:
        return False
    cmds, problems = ctx.decode(addr)
    if problems or len(cmds) < 2:
        return False
    nxt = ctx.next_label(addr)
    if nxt is None or nxt != addr + 8 * len(cmds):
        return False
    hasfn = False
    for op, imm, val, a in cmds:
        info = OPS.get(op)
        if info is None or op < 0:
            return False
        kind = info[1]
        if kind == "none" and (imm or val):
            return False
        if kind == "imm" and val:
            return False
        if kind in ("ptr", "imm_ptr"):
            if val == 0 and op != 0x01:
                return False
            if info[1] == "ptr" and imm != (info[2] if len(info) > 2 else 0):
                return False
            if (a + 4) not in ctx.ptrs and val and not (0x02000000 <= val < 0x04000000 or BASE <= val):
                return False
            if (a + 4) not in ctx.ptrs and val:
                return False  # a pointer the assembly left raw: not a proc script we can trust
            hasfn = True
    return hasfn


def c_def(name, addr, lines, decl_hdr=None):
    body = ",\n".join("    " + l for l in lines)
    return f'SECTION(".rodata.{addr - BASE + BASE:08X}")\nconst struct ProcCmd {name}[] = {{\n{body},\n}};\n'


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    cmd, args = sys.argv[1], sys.argv[2:]
    ctx = Ctx()
    if cmd == "list":
        for name in sorted(ctx.labels, key=lambda n: ctx.labels[n]):
            declared = name in ctx.decl
            if "--declared" in args and not declared:
                continue
            if "--undeclared" in args and (declared or not looks_like_proc(ctx, name)):
                continue
            if not args and not declared and not looks_like_proc(ctx, name):
                continue
            addr, size, _, problems, _ = ctx.object(name)
            print(f"{addr:#010x} {size:#x} {name}{'' if declared else ' (undeclared)'}{' ' + '; '.join(problems) if problems else ''}")
    elif cmd == "emit":
        for name in args:
            addr, size, lines, problems, _ = ctx.object(name)
            for p in problems:
                print(f"{name}: {p}", file=sys.stderr)
            print(c_def(f"ProcScr_{addr - BASE + BASE:08X}" if name.startswith("0x") else name, addr, lines))
    elif cmd == "layout":
        module = args[0]
        for name in args[1:]:
            addr, size, _, _, _ = ctx.object(name)
            print(f"rom {addr:#010X} {size:#X} build/src/{module}.o(.rodata.{addr:08X})".replace("0X", "0x"))
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main()
