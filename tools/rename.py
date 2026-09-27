#!/usr/bin/env python3
"""Rename symbols across asm/, src/, include/ and tools/fe7u.cfg.

Usage: tools/rename.py RENAMES.txt      (lines: "old_name new_name")
       tools/rename.py OLD NEW

Refuses renames whose new name already exists or is claimed twice.
sub_XXXXXXXX names also get their tools/fe7u.cfg entry named, so a
regenerated disassembly keeps them.
"""
import re
import sys
from pathlib import Path

FILES = [*Path("asm").glob("*.s"), *Path("src").rglob("*.[chs]"), *Path("include").rglob("*.h"), Path("fe7u.lds")]
CFG = Path("tools/fe7u.cfg")
IDENT = re.compile(r"[A-Za-z_]\w*")


def main():
    if len(sys.argv) == 3:
        pairs = [tuple(sys.argv[1:])]
    else:
        pairs = [tuple(l.split()[:2]) for l in Path(sys.argv[1]).read_text().splitlines() if l.strip() and not l.startswith("#")]

    texts = {p: p.read_text() for p in FILES}
    existing = set()
    for t in texts.values():
        existing.update(IDENT.findall(t))

    renames, claimed = {}, set()
    for old, new in pairs:
        if old == new or old in renames:
            continue
        if new in existing or new in claimed:
            print(f"skip {old} -> {new}: name already in use", file=sys.stderr)
            continue
        renames[old] = new
        claimed.add(new)

    if not renames:
        return
    pat = re.compile(r"\b(" + "|".join(map(re.escape, sorted(renames, key=len, reverse=True))) + r")\b")
    for p, t in texts.items():
        nt = pat.sub(lambda m: renames[m.group(1)], t)
        if nt != t:
            p.write_text(nt)

    cfg = CFG.read_text().splitlines()
    by_addr = {int(o[4:], 16): n for o, n in renames.items() if re.fullmatch(r"sub_[0-9A-F]{8}", o)}
    for i, line in enumerate(cfg):
        f = line.split()
        if len(f) >= 2 and f[0] in ("thumb_func", "arm_func"):
            addr = int(f[1], 16)
            if addr in by_addr:
                cfg[i] = f"{f[0]} {f[1]} {by_addr[addr]}"
            elif len(f) == 3 and f[2] in renames:
                cfg[i] = f"{f[0]} {f[1]} {renames[f[2]]}"
    CFG.write_text("\n".join(cfg) + "\n")
    print(f"renamed {len(renames)} symbols", file=sys.stderr)


if __name__ == "__main__":
    main()
