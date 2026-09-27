#!/usr/bin/env python3
"""Split the asm file containing FUNC so that FUNC begins a new file.

Usage: tools/carve.py FUNC [FUNC...]

The new file is named asm/code_<ADDR>.s after FUNC's address and is
inserted into fe7u.lds right after the file it came from.  Local labels
referenced across the new boundary are exported with .global.

To decompile a function: carve it and the function after it, then replace
the resulting single-function asm file with a C file (and its lds entry).
"""
import re
import sys
from pathlib import Path

LDS = Path("fe7u.lds")
HEADER = '\t.include "macro.inc"\n\n\t.syntax unified\n\n'
LOCAL = re.compile(r"\b(_[0-9A-F]{8})\b")
DEF = re.compile(r"^(_[0-9A-F]{8}):", re.M)


def split_body(text):
    """Separate the header/.global preamble from the code body."""
    lines = text.splitlines(keepends=True)
    i = 0
    while i < len(lines) and (not lines[i].strip() or lines[i].startswith(("\t.include", "\t.syntax", "\t.global"))):
        i += 1
    exports = {l.split()[1] for l in lines[:i] if l.startswith("\t.global")}
    return exports, "".join(lines[i:])


def render(exports, body):
    out = HEADER
    if exports:
        out += "".join(f"\t.global {n}\n" for n in sorted(exports)) + "\n"
    return out + body


def carve(func):
    pat = re.compile(rf"^\t(thumb|arm|non_word_aligned_thumb)_func_start {re.escape(func)}\n{re.escape(func)}: @ 0x([0-9A-F]{{8}})", re.M)
    for path in sorted(Path("asm").glob("*.s")):
        text = path.read_text()
        m = pat.search(text)
        if m:
            break
    else:
        sys.exit(f"{func}: not found in asm/")

    exports, body = split_body(text)
    m = pat.search(body)
    if not body[: m.start()].strip():
        print(f"{func}: already starts {path}")
        return
    head, tail = body[: m.start()], body[m.start():]
    new = path.with_name(f"code_{m.group(2)}.s")
    if new.exists():
        sys.exit(f"{new} already exists")

    head_defs, tail_defs = set(DEF.findall(head)), set(DEF.findall(tail))
    head_exp = (exports & head_defs) | (set(LOCAL.findall(tail)) & head_defs)
    tail_exp = (exports & tail_defs) | (set(LOCAL.findall(head)) & tail_defs)

    path.write_text(render(head_exp, head.rstrip("\n") + "\n"))
    new.write_text(render(tail_exp, tail))

    old_obj = f"build/asm/{path.stem}.o(.text);"
    lds = LDS.read_text()
    if old_obj not in lds:
        sys.exit(f"{old_obj} not in {LDS}")
    indent = re.search(rf"^(\s*){re.escape(old_obj)}", lds, re.M).group(1)
    lds = lds.replace(old_obj, f"{old_obj}\n{indent}build/asm/{new.stem}.o(.text);")
    LDS.write_text(lds)
    print(f"{func}: {path} -> {new}")


if __name__ == "__main__":
    for f in sys.argv[1:]:
        carve(f)
