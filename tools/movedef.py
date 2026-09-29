#!/usr/bin/env python3
"""Move data objects that tools/datac.py defined in a module to src/data/<topic>.c.

    tools/movedef.py SRC.c DEST.c OBJ...

Cuts each `SECTION(".rodata.ADDR")` definition of OBJ out of SRC.c, appends
them to DEST.c with `extern` declarations of what they point at (copied from
SRC.c's), and points their data/layout.txt lines at DEST's object file.  The
old `extern` of OBJ that datac rewrote to the const type stays in SRC.c:
restore it by hand when the module must keep reading the object through its
old declaration (a `const` declaration in the reader can change its code;
CONTRIBUTING, "Data objects converted to C").
"""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def wrap(line):
    """Break a long `extern T a[], b[];` after a comma, continuation lines indented."""
    out, cur = [], ""
    for i, w in enumerate(line.split(" ")):
        if cur and len(cur) + len(w) + 1 > 100:
            out.append(cur)
            cur = "    " + w
        else:
            cur = cur + (" " if cur else "") + w
    return "\n".join(out + [cur])


def main():
    src, dest, objs = Path(sys.argv[1]), Path(sys.argv[2]), sys.argv[3:]
    text = src.read_text()
    blocks, addrs = [], []
    for o in objs:
        m = re.search(r'SECTION\("\.rodata\.([0-9A-F]{8})"\)\n[^\n]*\b' + re.escape(o) + r'\[\][^\n]*=[^;]*?\n\};\n\n?', text)
        if not m:
            sys.exit(f"{o}: no definition in {src}")
        blocks.append(m[0].rstrip("\n") + "\n")
        addrs.append(m[1])
        text = text.replace(m[0], "", 1)
    used = set(re.findall(r"\b\w+\b", "\n".join(blocks))) - set(objs)
    # the type each symbol is declared with in SRC (`extern TYPE a[], b[];`)
    types = {}
    for m in re.finditer(r"^extern ([^;()=]*?);", text, re.M | re.S):
        stmt = " ".join(m[1].split())
        head = re.match(r"((?:const |u8|u16|u32|struct \w+)[\w ]*?) (\w+\[\])(?:,|$)", stmt)
        if not head:
            continue
        ty = head[1]
        for d in stmt[len(ty):].split(","):
            n = re.match(r"\s*(\w+)\[\]\s*$", d)
            if n:
                types.setdefault(n[1], ty)
    by_ty = {}
    for n in sorted(used):
        if n in types:
            by_ty.setdefault(types[n], []).append(n)
    decl = ""
    for ty, ns in by_ty.items():
        decl += wrap("extern " + ty + " " + ", ".join(n + "[]" for n in ns) + ";") + "\n"
    dtext = dest.read_text() if dest.exists() else '#include "gbafe.h"\n'
    dest.write_text(dtext.rstrip("\n") + "\n\n" + (decl + "\n" if decl else "") + "\n".join(blocks))
    src.write_text(text)
    lay = ROOT / "data/layout.txt"
    t = lay.read_text()
    new = f"build/src/{dest.parent.name}/{dest.stem}.o" if dest.parent.name != "src" else f"build/src/{dest.stem}.o"
    for a in addrs:
        t = t.replace(f"build/src/{src.stem}.o(.rodata.{a})", f"{new}(.rodata.{a})")
    lay.write_text(t)


if __name__ == "__main__":
    main()
