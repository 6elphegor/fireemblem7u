#!/usr/bin/env python3
"""Split every asm/code_*.s into one file per function (asm/code_<ADDR>.s).

Usage: tools/split_funcs.py

fe7u.lds is updated in place; local labels referenced from another file are
exported with .global.  A function that is not word-aligned stays with the
function before it, since each object's .text starts word-aligned.
"""
import re
from pathlib import Path

HEADER = '\t.include "macro.inc"\n\n\t.syntax unified\n\n'
START = re.compile(r"^\t(thumb|arm)_func_start (\w+)\n(\w+): @ 0x([0-9A-F]{8})\n", re.M)
LOCAL_DEF = re.compile(r"^(_[0-9A-F]{8}):", re.M)
LOCAL_USE = re.compile(r"\b(_[0-9A-F]{8})\b")


def body_of(text):
    lines = text.splitlines(keepends=True)
    i = 0
    while i < len(lines) and (not lines[i].strip() or lines[i].startswith(("\t.include", "\t.syntax", "\t.global"))):
        i += 1
    return "".join(lines[i:])


def main():
    lds = Path("fe7u.lds").read_text()
    pieces = {}   # path -> body
    order = {}    # old object entry -> [new object entries]
    for path in sorted(Path("asm").glob("code_*.s")):
        body = body_of(path.read_text())
        cuts = [m for m in START.finditer(body)]
        if not cuts:
            continue
        bounds = [0] + [m.start() for m in cuts[1:]] + [len(body)]
        names = [f"code_{cuts[0].group(4)}"] + [f"code_{m.group(4)}" for m in cuts[1:]]
        entries = []
        for name, a, b in zip(names, bounds, bounds[1:]):
            pieces[Path("asm") / f"{name}.s"] = body[a:b]
            entries.append(f"build/asm/{name}.o(.text);")
        order[f"build/asm/{path.stem}.o(.text);"] = entries
        path.unlink()

    defined = {}
    for p, b in pieces.items():
        for n in LOCAL_DEF.findall(b):
            defined[n] = p
    exports = {p: set() for p in pieces}
    for p, b in pieces.items():
        for n in set(LOCAL_USE.findall(b)):
            if n in defined and defined[n] != p:
                exports[defined[n]].add(n)
    for p, b in pieces.items():
        glob = "".join(f"\t.global {n}\n" for n in sorted(exports[p]))
        p.write_text(HEADER + (glob + "\n" if glob else "") + b.rstrip("\n") + "\n")

    for old, new in order.items():
        m = re.search(rf"^(\s*){re.escape(old)}\n", lds, re.M)
        indent = m.group(1)
        lds = lds.replace(m.group(0), "".join(f"{indent}{e}\n" for e in new))
    Path("fe7u.lds").write_text(lds)
    print(f"{len(pieces)} files")


if __name__ == "__main__":
    main()
