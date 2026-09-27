#!/usr/bin/env python3
"""Port reference-decomp C files into this project using a port_ref.py plan.

Usage: tools/apply_port.py REF_REPO PLAN.json [STEM...]

REF_REPO is the reference checkout (its include/ and src/ are copied);
PLAN.json comes from tools/port_ref.py; STEMs (e.g. src_icon) limit which
files are ported (default: every portable file).

For each file:
  * our asm for its code range is carved out and replaced by the C object;
  * its ROM sections are placed at their FE7U addresses (data/layout.txt);
  * its RAM sections are placed at their FE7U addresses (data/layout.txt);
  * reference names become ours where the reference name encodes a JP
    address, and ours become the reference's elsewhere;
  * data symbols it uses from elsewhere get FE7U addresses in symbols.ld.
"""
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from elf32 import Elf, SHN_COMMON, SHN_UNDEF, STT_FUNC, STT_SECTION  # noqa: E402

ADDR_NAME = re.compile(r"^(.*?_)([0-9A-Fa-f]{7,8})$")
IDENT = re.compile(r"\b[A-Za-z_]\w*\b")


def addr_style(name):
    return bool(ADDR_NAME.match(name))


def us_name(name, addr):
    """Re-address an address-style name, keeping its width and case."""
    m = ADDR_NAME.match(name)
    width = len(m.group(2))
    s = f"{addr:0{width}X}" if width == 8 else f"{addr:07X}"
    if m.group(2).islower():
        s = s.lower()
    return m.group(1) + s


def run(*cmd):
    subprocess.run(cmd, check=True)


def main():
    ref = Path(sys.argv[1])
    plan = json.loads(Path(sys.argv[2]).read_text())
    objdir = ref / "objs"  # unlinked objects built from REF_REPO
    stems = sys.argv[3:] or sorted(plan["files"])
    files = {s: plan["files"][s] for s in stems if (ref / "src" / f"{s[4:]}.c").exists()}
    ported = {s: Elf(objdir / f"{s}.o") for s in files}

    # ---- names ----------------------------------------------------------
    our_names = set()
    for p in Path("asm").glob("*.s"):
        our_names.update(re.findall(r"func_start (\w+)", p.read_text()))

    rewrite = {}       # reference identifier -> identifier used here
    renames = []       # (our name, reference name)
    used_ref = set()
    for rname, oname in sorted(plan["fmap"].items()):
        if addr_style(rname) or rname.startswith(("sub_", "func_")):
            rewrite[rname] = oname
        elif rname != oname:
            if rname in our_names or rname in used_ref:
                rewrite[rname] = oname
            else:
                renames.append((oname, rname))
                used_ref.add(rname)

    # Data symbols with known FE7U addresses.
    defined_here = {}  # name -> FE7U address, for symbols the ported objects define
    for stem, e in ported.items():
        f = files[stem]
        for s in e.symbols:
            if s.shndx in (SHN_UNDEF, SHN_COMMON) or s.type in (STT_SECTION, STT_FUNC) or not s.name:
                continue
            sec = e.sections[s.shndx].name
            base = f["sections"].get(sec, {}).get("addr")
            if base is not None:
                defined_here[s.name] = base + s.value
    sym_addr = dict(plan["sym_addr"])
    sym_addr.update(defined_here)
    for name, a in sym_addr.items():
        if addr_style(name) and name not in rewrite:
            new = us_name(name, a)
            if new != name:
                rewrite[name] = new

    # Rename before the reference headers land.
    rn = Path("build/renames.txt")
    rn.parent.mkdir(exist_ok=True)
    rn.write_text("".join(f"{o} {r}\n" for o, r in renames))
    run(sys.executable, "tools/rename.py", str(rn))

    # ---- sources --------------------------------------------------------
    if Path("include").exists():
        shutil.rmtree("include")
    shutil.copytree(ref / "include", "include", ignore=shutil.ignore_patterns("*.inc"))
    sysutil = Path("include/gbafe/sysutil.h")
    sysutil.write_text(sysutil.read_text().replace("} BITPACKED;", "};"))
    targets = list(Path("include").rglob("*.h"))
    Path("src").mkdir(exist_ok=True)
    for stem in files:
        dst = Path("src") / f"{stem[4:]}.c"
        shutil.copy(ref / "src" / f"{stem[4:]}.c", dst)
        targets.append(dst)
    pat = re.compile(r"\b(" + "|".join(map(re.escape, sorted(rewrite, key=len, reverse=True))) + r")\b")
    for t in targets:
        text = t.read_text(encoding="utf-8")
        new = pat.sub(lambda m: rewrite[m.group(1)], text)
        if new != text:
            t.write_text(new, encoding="utf-8")

    # ---- code -----------------------------------------------------------
    # Functions still in asm, by address, as named after renaming.
    asm_addr = {}
    for p in Path("asm").glob("*.s"):
        for name, a in re.findall(r"^(\w+): @ 0x([0-9A-F]{8})$", p.read_text(), re.M):
            asm_addr[int(a, 16)] = name
    lds = Path("fe7u.lds")
    for stem, f in sorted(files.items(), key=lambda kv: kv[1]["text"] or 0):
        if not f["text"]:
            continue
        start, end = f["text"], f["text"] + f["text_size"]
        first = asm_addr[start]
        cut = [first]
        if end in asm_addr:  # else: end of code, or the next function is C
            cut.append(asm_addr[end])
        run(sys.executable, "tools/carve.py", *cut)
        # Every asm file now lying wholly inside [start, end) gives way to the C.
        inside = []
        for p in Path("asm").glob("*.s"):
            m = re.search(r"^\w+: @ 0x([0-9A-F]{8})$", p.read_text(), re.M)
            if m and start <= int(m.group(1), 16) < end:
                inside.append((int(m.group(1), 16), p))
        inside.sort()
        if not inside or inside[0][0] != start:
            sys.exit(f"{stem}: no asm file starts at {start:#x}")
        text_lds = lds.read_text()
        for i, (_, asm) in enumerate(inside):
            if "\t.global _" in asm.read_text():
                sys.exit(f"{stem}: labels in {asm} are referenced from elsewhere")
            entry = f"build/asm/{asm.stem}.o(.text);"
            if i == 0:
                text_lds = text_lds.replace(entry, f"build/src/{stem[4:]}.o(.text);")
            else:
                text_lds = re.sub(rf"^\s*{re.escape(entry)}\n", "", text_lds, flags=re.M)
            asm.unlink()
        lds.write_text(text_lds)

    # ---- data layout ------------------------------------------------------
    layout = Path("data/layout.txt")
    lines = layout.read_text().splitlines() if layout.exists() else []
    for stem, f in files.items():
        for sec, v in f["sections"].items():
            if v["addr"] is None:
                print(f"warning: {stem} {sec} has no FE7U address; not placed", file=sys.stderr)
                continue
            kind = "ram" if v["ram"] else "rom"
            lines.append(f"{kind} 0x{v['addr']:08X} 0x{v['size']:X} build/src/{stem[4:]}.o({sec})")
    layout.write_text("\n".join(sorted(set(lines))) + "\n")

    # ---- external data symbols --------------------------------------------
    need = set()
    for stem, e in ported.items():
        for s in e.symbols:
            if s.shndx == SHN_UNDEF and s.name and s.name in plan["sym_addr"]:
                need.add(s.name)
    syms = Path("symbols.ld")
    have = dict(re.findall(r"^(\w+) = (0x[0-9A-F]+);", syms.read_text(), re.M)) if syms.exists() else {}
    for name in need:
        if name in defined_here:
            continue
        have[rewrite.get(name, name)] = f"0x{plan['sym_addr'][name]:08X}"
    syms.write_text("".join(f"{n} = {a};\n" for n, a in sorted(have.items(), key=lambda kv: int(kv[1], 16))))
    print(f"ported {len(files)} files", file=sys.stderr)


if __name__ == "__main__":
    main()
