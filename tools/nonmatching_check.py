#!/usr/bin/env python3
"""Fail if the link of ELF dropped a non-empty section.

Usage: tools/nonmatching_check.py ELF

The linker script places every section by name (fe7u.lds; the data
sections of C objects by data/layout.txt) and discards the rest
(`/DISCARD/ : { *(*) }`).  A plain C version (NONMATCHING) that needs a
section its matching version didn't have (e.g. a new `.rodata` table in a
module that had none) would be dropped silently and leave dangling
references; this reads the map's "Discarded input sections" and lists
every such section with a size.
"""
import re
import sys
from pathlib import Path

IGNORED = {".ARM.attributes", ".comment", ".note.GNU-stack"}


def main():
    elf = Path(sys.argv[1])
    text = elf.with_suffix(".map").read_text()
    part = text[text.index("Discarded input sections"):text.index("Memory Configuration")]
    part = re.sub(r"\n\s{10,}", " ", part)  # long section names wrap
    bad = [(sec, obj, int(size, 16))
           for sec, size, obj in re.findall(r"^ (\S+)\s+0x[0-9a-f]+\s+(0x[0-9a-f]+)\s+(\S+)$", part, re.M)
           if int(size, 16) and sec not in IGNORED and not sec.startswith(".debug")]
    for sec, obj, size in bad:
        print(f"{elf}: {obj}({sec}), {size:#x} bytes, is not placed by the linker script "
              f"(add it to data/layout.txt)", file=sys.stderr)
    sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
