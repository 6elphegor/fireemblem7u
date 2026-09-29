#!/usr/bin/env python3
"""Apply symbol rename lists to the whole tree (re-runnable, e.g. after a merge).

Usage: tools/apply_renames.py [--dry-run] [LIST...]    (default: tools/renames/*.txt)

A list has one rename per line, "OLD NEW", with "#" comments.  Every
occurrence of OLD as a whole identifier is replaced in all files git tracks
(sources, headers, asm, data/, symbols.ld, manifests, tools, docs) except the
lists themselves, and in the generated files that are not in git but are
edited in place: banim/*.s (a script file named after its label is renamed
along), sound/**/*.s, and graphics/ (when a data/graphics.txt NAME equal to a
label is renamed, its extracted files are renamed too).  tools/fe7u.cfg gets
the new name for a renamed sub_XXXXXXXX.

A rename is skipped (and reported) when NEW is already defined by the
sources (an assembly label, a C definition, a symbols.ld or sound manifest name) or
claimed by another line; lines whose OLD no longer occurs anywhere are
already applied (or renamed on another branch) and are skipped silently.
Afterwards: rm -rf build (make 3.81 misses same-second edits) and make.
"""
import argparse
import re
import subprocess
import sys
from pathlib import Path

IDENT = re.compile(r"[A-Za-z_][A-Za-z0-9_]*")
LISTS = Path("tools/renames")


def tracked_files():
    try:
        out = subprocess.run(["git", "ls-files", "-z"], capture_output=True, text=True, check=True).stdout
        files = [Path(p) for p in out.split("\0") if p]
    except (OSError, subprocess.CalledProcessError):
        files = [p for d in ("asm", "src", "include", "data", "tools", "tests", "sound") for p in Path(d).rglob("*") if p.is_file()]
        files += [Path(p) for p in ("symbols.ld", "fe7u.lds", "Makefile", "README.md", "CONTRIBUTING.md")]
    out = []
    for p in files:
        if not p.is_file() or LISTS in p.parents or p.suffix in (".gba", ".png", ".bin", ".lz", ".patch"):
            continue
        out.append(p)
    return out


def generated_files():
    files = list(Path("banim").glob("*.s")) if Path("banim").is_dir() else []
    if Path("sound").is_dir():
        files += [p for p in Path("sound").rglob("*.s")]
    return files


def read_lists(paths):
    pairs = []
    for path in paths:
        for n, line in enumerate(Path(path).read_text().splitlines(), 1):
            line = line.split("#", 1)[0].split()
            if not line:
                continue
            if len(line) != 2 or not all(IDENT.fullmatch(x) for x in line):
                sys.exit(f"{path}:{n}: expected 'OLD NEW'")
            pairs.append((line[0], line[1], f"{path}:{n}"))
    return pairs


C_COMMENT = re.compile(r"/\*.*?\*/|//[^\n]*", re.S)
C_FUNC = re.compile(r"^[A-Za-z_][\w \t\*]*?\b([A-Za-z_]\w*)\s*\([^;{]*?\)\s*\{", re.M | re.S)
C_DATA = re.compile(r"^(?!typedef\b|extern\b|return\b)[A-Za-z_][\w \t\*]*?\b([A-Za-z_]\w*)\s*(?:\[[^\]\n]*\]\s*)*[=;]", re.M)


def defined_names(texts):
    """Names defined by the sources (not by a possibly stale build): assembly
    labels and .set, symbols.ld, the sound manifest, and C file-scope
    function and variable definitions."""
    names = set()
    for p, t in texts.items():
        if p.suffix == ".s":
            names.update(re.findall(r"^\s*(\w+):", t, re.M))
            names.update(re.findall(r"^\s*\.set\s+(\w+)\s*,", t, re.M))
        elif p.suffix == ".c":
            t = C_COMMENT.sub("", t)
            names.update(C_FUNC.findall(t))
            names.update(C_DATA.findall(t))
        elif p.name == "symbols.ld":
            names.update(re.findall(r"^\s*(\w+)\s*=", t, re.M))
        elif p.name == "manifest.txt":
            names.update(re.findall(r"^\s*(?:label|mplaytable|songtable)\s+\S+\s+(?:\S+\s+)?(\w+)\s*$", t, re.M))
    return names


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("lists", nargs="*")
    args = ap.parse_args()
    lists = args.lists or sorted(LISTS.glob("*.txt"))
    pairs = read_lists(lists)

    files = tracked_files() + generated_files()
    texts = {}
    for p in files:
        try:
            texts[p] = p.read_text()
        except (UnicodeDecodeError, OSError):
            pass
    present = set()
    for t in texts.values():
        present.update(IDENT.findall(t))
    defined = defined_names(texts)

    renames, claimed, skipped = {}, set(), 0
    olds = {o for o, _, _ in pairs}
    for old, new, where in pairs:
        if old == new or old not in present:
            continue  # already applied
        if old in renames:
            if renames[old] != new:
                print(f"{where}: {old} renamed twice ({renames[old]}, {new}); keeping the first", file=sys.stderr)
            continue
        if new in olds and new != old:
            print(f"{where}: {new} is also renamed; chains are not supported", file=sys.stderr)
            skipped += 1
            continue
        if new in defined or new in claimed:
            print(f"{where}: skip {old} -> {new}: {new} already in use", file=sys.stderr)
            skipped += 1
            continue
        renames[old] = new
        claimed.add(new)
    if not renames:
        print("nothing to rename", file=sys.stderr)
        return

    changed = 0
    sub = lambda m: renames.get(m.group(0), m.group(0))
    for p, t in texts.items():
        if p.as_posix() == "tools/ref_rewrites.txt":
            # "reference-name our-name": only our names (the second column) change
            nt = "".join(re.sub(r"^(\s*\S+\s+)(\w+)", lambda m: m.group(1) + renames.get(m.group(2), m.group(2)), l)
                         for l in t.splitlines(keepends=True))
        else:
            nt = IDENT.sub(sub, t)
        if nt != t:
            changed += 1
            if not args.dry_run:
                p.write_text(nt)

    # generated files named after a label
    moves = []
    for p in list(Path("banim").glob("*.s")) if Path("banim").is_dir() else []:
        if p.stem in renames:
            moves.append((p, p.with_name(renames[p.stem] + ".s")))
    gfx = Path("data/graphics.txt")
    if gfx.exists() and Path("graphics").is_dir():
        for line in texts.get(gfx, "").splitlines():
            f = line.split()
            if len(f) >= 4 and not line.startswith("#") and f[3] in renames:
                for q in Path("graphics").glob(f[3] + ".*"):
                    moves.append((q, q.with_name(renames[f[3]] + q.suffix)))
    for a, b in moves:
        if not args.dry_run and not b.exists():
            a.rename(b)

    cfg = Path("tools/fe7u.cfg")
    if cfg.exists() and not args.dry_run:
        by_addr = {int(o[4:], 16): n for o, n in renames.items() if re.fullmatch(r"sub_[0-9A-F]{8}", o)}
        lines = cfg.read_text().splitlines()
        for i, line in enumerate(lines):
            f = line.split()
            if len(f) == 2 and f[0] in ("thumb_func", "arm_func") and int(f[1], 16) in by_addr:
                lines[i] = f"{f[0]} {f[1]} {by_addr[int(f[1], 16)]}"
        cfg.write_text("\n".join(lines) + "\n")

    print(f"{'would rename' if args.dry_run else 'renamed'} {len(renames)} symbols in {changed} files"
          f" ({len(moves)} generated files moved, {skipped} skipped)", file=sys.stderr)


if __name__ == "__main__":
    main()
