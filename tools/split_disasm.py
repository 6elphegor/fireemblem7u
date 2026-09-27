#!/usr/bin/env python3
"""Split a whole-ROM gbadisasm listing into asm/*.s files.

Usage: tools/split_disasm.py <full.s>

Region boundaries are ROM addresses; the game-code region is further cut into
chunks of roughly CHUNK functions at function boundaries.  Everything from
CODE_END onward is left to data/ (incbin'd from baserom.gba for now).
"""
import re
import sys

CODE_END = 0x080C57DC
CHUNK = 400

# (start address, file stem); a stem of None means "chunk this region".
REGIONS = [
    (0x08000000, "crt0"),
    (0x08000A50, None),
    (0x080BD850, "m4a"),
    (0x080BFA0C, "libagb"),
    (0x080BFC4C, "libgcc"),
    (0x080BFF98, "libc"),
    (0x080C57AC, "veneers"),
]

HEADER = '\t.include "macro.inc"\n\n\t.syntax unified\n\n'
label_re = re.compile(r"^(\w+):(?: @ 0x([0-9A-F]{8}))?")


def line_addr(line):
    """Address a line begins, if it is a label we can place."""
    m = label_re.match(line)
    if not m:
        return None
    if m.group(2):
        return int(m.group(2), 16)
    name = m.group(1)
    if re.fullmatch(r"_0[89][0-9A-F]{6}", name):
        return int(name[1:], 16)
    return None


def main():
    lines = open(sys.argv[1]).read().splitlines(keepends=True)

    # Cut points: index of the first line belonging to each region.  A
    # region starts at its label, or at the func_start macro just above it.
    cuts = []
    for start, stem in REGIONS:
        for i, line in enumerate(lines):
            if line_addr(line) == start:
                if i and "func_start" in lines[i - 1]:
                    i -= 1
                cuts.append((i, start, stem))
                break
        else:
            sys.exit(f"no label at {start:#x}")
    cuts.append((len(lines), CODE_END, "end"))

    for (i, start, stem), (j, _, _) in zip(cuts, cuts[1:]):
        body = lines[i:j]
        if stem:
            write(f"asm/{stem}.s", body)
            continue
        funcs = [k for k, l in enumerate(body) if "thumb_func_start" in l or "arm_func_start" in l]
        bounds = funcs[::CHUNK] + [len(body)]
        bounds[0] = 0
        for a, b in zip(bounds, bounds[1:]):
            addr = next(line_addr(l) for l in body[a:b] if line_addr(l) is not None)
            write(f"asm/code_{addr:08X}.s", body[a:b])
    flush()


def write(path, body):
    OUTPUTS[path] = body


def flush():
    """Write every file, exporting local labels referenced from other files."""
    defined, used = {}, {}
    for path, body in OUTPUTS.items():
        text = "".join(body)
        for name in re.findall(r"^(_[0-9A-F]{8}):", text, re.M):
            defined[name] = path
        used[path] = set(re.findall(r"\b(_[0-9A-F]{8})\b", text))
    exports = {path: set() for path in OUTPUTS}
    for path, names in used.items():
        for name in names:
            if defined.get(name, path) != path:
                exports[defined[name]].add(name)
    for path, body in OUTPUTS.items():
        with open(path, "w") as f:
            f.write(HEADER)
            for name in sorted(exports[path]):
                f.write(f"\t.global {name}\n")
            if exports[path]:
                f.write("\n")
            f.writelines(body)
        print(path)


OUTPUTS = {}


if __name__ == "__main__":
    main()
