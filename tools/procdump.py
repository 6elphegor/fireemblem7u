#!/usr/bin/env python3
"""Dump ROM data as C initializers, to help move data out of the baserom.

Usage: tools/procdump.py START END

Walks [START, END) in baserom.gba, splitting it at the symbols of a built
fe7u.elf.  Objects named ProcScr_* (or that decode cleanly as proc code) are
printed as struct ProcCmd arrays using the PROC_* macros; everything else as
commented words with pointers named.  The output is a starting point: check
types and names, and let `make` prove the bytes.
"""
import struct
import subprocess
import sys

ROM = open("baserom.gba", "rb").read()


def rd16(a): return struct.unpack_from("<h", ROM, a - 0x08000000)[0]
def rd32(a): return struct.unpack_from("<I", ROM, a - 0x08000000)[0]


def load_symbols():
    syms, funcs = {}, set()
    out = subprocess.run(["arm-none-eabi-nm", "-n", "fe7u.elf"], capture_output=True, text=True).stdout
    for line in out.splitlines():
        parts = line.split()
        if len(parts) != 3 or parts[2].startswith(("$", ".")):
            continue
        addr = int(parts[0], 16)
        syms.setdefault(addr, parts[2])
        if parts[1] in "tT":
            funcs.add(addr & ~1)
    return syms, funcs


SYMS, FUNCS = load_symbols()


def ptr(v, want_func=False):
    if v == 0:
        return "NULL"
    if v & 1 and (v & ~1) in FUNCS and (v & ~1) in SYMS:
        return SYMS[v & ~1]
    if v in SYMS:
        return SYMS[v]
    if v & 1 and (v & ~1) in SYMS:
        return SYMS[v & ~1] + " + 1"
    return f"(void *) 0x{v:08X}"


def cstr(v):
    o = v - 0x08000000
    if not 0 <= o < len(ROM):
        return None
    e = ROM.find(b"\0", o)
    s = ROM[o:e]
    if 0 < len(s) < 64 and all(0x20 <= c < 0x7F for c in s):
        return '"' + s.decode().replace("\\", "\\\\").replace('"', '\\"') + '"'
    return None


FUNC_OPS = {2: "PROC_CALL", 3: "PROC_REPEAT", 4: "PROC_SET_END_CB", 0x14: "PROC_WHILE",
            0x16: "PROC_CALL_2"}
PROC_OPS = {5: "PROC_START_CHILD", 6: "PROC_START_CHILD_BLOCKING", 7: "PROC_START_MAIN_BUGGED",
            8: "PROC_WHILE_EXISTS", 9: "PROC_END_EACH", 0xA: "PROC_BREAK_EACH", 0xD: "PROC_JUMP"}
IMM_OPS = {0xB: "PROC_LABEL", 0xC: "PROC_GOTO", 0xE: "PROC_SLEEP", 0xF: "PROC_MARK"}
BARE_OPS = {0: "PROC_END", 0x10: "PROC_BLOCK", 0x11: "PROC_END_IF_DUPLICATE",
            0x12: "PROC_SET_BIT4", 0x13: "PROC_13", 0x15: "PROC_15",
            0x17: "PROC_END_DUPLICATES", 0x19: "PROC_19"}


def proc_cmd(a):
    op, imm, p = rd16(a), rd16(a + 2), rd32(a + 4)
    if op in FUNC_OPS and imm == 0:
        return f"{FUNC_OPS[op]}({ptr(p)}),"
    if op in PROC_OPS and imm == (1 if op == 6 else 0):
        return f"{PROC_OPS[op]}({ptr(p)}),"
    if op == 1 and imm == 0:
        return f"PROC_NAME({cstr(p) or ptr(p)}),"
    if op in IMM_OPS and p == 0:
        if op == 0xE and imm == 0:
            return "PROC_YIELD,"
        return f"{IMM_OPS[op]}({imm}),"
    if op in BARE_OPS and imm == 0 and p == 0:
        return BARE_OPS[op] + ","
    if op == 0x18:
        return f"PROC_CALL_ARG({ptr(p)}, {imm}),"
    return None


def main():
    start, end = int(sys.argv[1], 16), int(sys.argv[2], 16)
    bounds = sorted({a for a in SYMS if start <= a < end} | {start, end})
    for a, b in zip(bounds, bounds[1:]):
        name = SYMS.get(a, f"gUnk_{a:08X}")
        cmds = [proc_cmd(x) for x in range(a, b - (b - a) % 8, 8)] if (b - a) >= 8 else [None]
        if (b - a) % 8 == 0 and all(cmds) and (name.startswith("ProcScr") or cmds[-1] == "PROC_END,"):
            print(f"struct ProcCmd CONST_DATA {name}[] = {{")
            for c in cmds:
                print("    " + c)
            print("};\n")
            continue
        print(f"// {name}: 0x{a:08X}, 0x{b - a:X} bytes")
        for x in range(a, b, 16):
            words = []
            for y in range(x, min(x + 16, b) - 3, 4):
                v = rd32(y)
                words.append(ptr(v) if 0x08000000 <= v < 0x0A000000 or v & 0xFF000000 in (0x02000000, 0x03000000) else f"0x{v:08X}")
            tail = ROM[x - 0x08000000 + 4 * len(words):min(x + 16, b) - 0x08000000]
            print("//   " + ", ".join(words) + ("  " + tail.hex() if tail else ""))
        print()


if __name__ == "__main__":
    main()
