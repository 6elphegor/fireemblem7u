#!/usr/bin/env python3
"""Shift test: relink with SHIFT bytes of padding in front of the data region
and check every data word.  Run from the repo root after `make`.

  tools/shifttest.py [SHIFT]    (or: make shifttest)
"""
import re, subprocess, sys, struct, bisect, collections
from pathlib import Path
sys.path.insert(0, "tools")
import datasplit as ds, dataptrs, elf32

SHIFT = int(sys.argv[1], 0) if len(sys.argv) > 1 else 0x100
out = Path("build/shift"); out.mkdir(exist_ok=True)
lay = Path("build/layout.ld").read_text()
lay = "\n".join(l for l in lay.splitlines() if not l.startswith("ASSERT"))
(out / "layout.ld").write_text(f". += {SHIFT:#x};\n" + lay + "\n")
ld = Path("build/fe7u.ld").read_text().replace("INCLUDE build/layout.ld", f"INCLUDE {out}/layout.ld")
(out / "fe7u.ld").write_text(ld)
# same link command as the Makefile, with the shifted script
mk = subprocess.run(["make", "-n", "fe7u.elf", "-W", "build/fe7u.ld"], capture_output=True, text=True).stdout
cmd = next(l for l in mk.splitlines() if l.startswith("arm-none-eabi-ld"))
cmd = cmd.replace("-T build/fe7u.ld", f"-T {out}/fe7u.ld").replace("-Map fe7u.map", f"-Map {out}/s.map").replace("-o fe7u.elf", f"-o {out}/s.elf")
subprocess.run(cmd, shell=True, check=True)
subprocess.run(["arm-none-eabi-objcopy", "-O", "binary", f"{out}/s.elf", f"{out}/s.gba"], check=True)

orig = Path("baserom.gba").read_bytes()
sh = Path(f"{out}/s.gba").read_bytes()
assert len(sh) == len(orig) + SHIFT, (hex(len(sh)), hex(len(orig)))
assert sh[:ds.DATA_START - ds.ROM_BASE - 0] [:0x100] == orig[:0x100]

def ow(a): return struct.unpack_from("<I", orig, a - ds.ROM_BASE)[0]
def sw(a): return struct.unpack_from("<I", sh, a - ds.ROM_BASE)[0]

# expected pointer words in data/rom: parse .4byte lines
ptrs = {a: e for kind, a, e, _ in ds.walk_rom_files() if kind == "ptr"}

def moves(v):  # does the value's target lie in the shifted region?
    t = v & 0x0FFFFFFF if (v >> 28) and (v & 0x0F000000) == 0x08000000 else v
    return ds.DATA_START <= (t & ~1) < ds.ROM_END

bad_ptr, ok_moved, ok_fixed = [], 0, 0
for a, e in ptrs.items():
    o, s = ow(a), sw(a + SHIFT)
    want = (o + SHIFT) & 0xFFFFFFFF if moves(o) else o
    if s != want:
        bad_ptr.append((a, o, s, e))
    elif s != o:
        ok_moved += 1
    else:
        ok_fixed += 1
print(f"data/rom pointer words: {len(ptrs)}; moved by {SHIFT:#x}: {ok_moved}; unchanged (code/RAM targets): {ok_fixed}; WRONG: {len(bad_ptr)}")
for x in bad_ptr[:20]:
    print("  wrong %08X %08X -> %08X  %s" % x)

# Objects placed whole whose pointer fields need not be aligned (music track
# data, tools/m4adis.py): every R_ARM_ABS32 relocation is a pointer field.
RELOC_OBJS = {"build/sound/sound.o(.rodata)"}
def ou(a): return struct.unpack_from("<I", orig, a - ds.ROM_BASE)[0]
def su(a): return struct.unpack_from("<I", sh, a - ds.ROM_BASE)[0]
rel_ptrs, rel_bytes, rel_ranges = {}, set(), []
for addr, size, obj in ds.read_layout("data/layout.txt"):
    if obj in RELOC_OBJS:
        path, sec = obj[:-1].split("(")
        rel_ranges.append((addr, size, obj))
        for off, typ, sym in elf32.Elf(path).section(sec).relocs:
            if typ == elf32.R_ARM_ABS32:
                rel_ptrs[addr + off] = sym.name
                rel_bytes.update(range(addr + off, addr + off + 4))
bad_rel, rel_moved, rel_fixed = [], 0, 0
for a, e in rel_ptrs.items():
    o, s_ = ou(a), su(a + SHIFT)
    want = (o + SHIFT) & 0xFFFFFFFF if moves(o) else o
    if s_ != want:
        bad_rel.append((a, o, s_, e))
    elif s_ != o:
        rel_moved += 1
    else:
        rel_fixed += 1
for addr, size, obj in rel_ranges:
    n = sum(addr <= a < addr + size for a in rel_ptrs)
    una = sum(addr <= a < addr + size and a % 4 != 0 for a in rel_ptrs)
    raw_data = raw_rom = 0
    for a in range((addr + 3) & ~3, addr + size - 3, 4):
        if a in rel_bytes or a + 3 in rel_bytes:
            continue
        v = ow(a)
        raw_rom += ds.ROM_BASE <= v < ds.ROM_END
        raw_data += ds.DATA_START <= v < ds.ROM_END
    print(f"{obj} {addr:#010x}-{addr + size:#010x}: pointer fields {n} (unaligned {una}); "
          f"4-aligned words left raw holding a data-region address {raw_data} (any ROM address {raw_rom})")
print(f"relocated pointer fields: {len(rel_ptrs)}; moved by {SHIFT:#x}: {rel_moved}; unchanged (RAM targets): {rel_fixed}; WRONG: {len(bad_rel)}")
for x in bad_rel[:20]:
    print("  wrong %08X %08X -> %08X  %s" % x)

# every other byte of the data region must be the original byte, shifted
diff_words = collections.Counter()
other = []
placed = ds.read_layout("data/layout.txt")
pstarts = [p[0] for p in placed]
def owner(a):
    i = bisect.bisect_right(pstarts, a) - 1
    if i >= 0 and placed[i][0] <= a < placed[i][0] + placed[i][1]:
        return placed[i][2]
    return "data/rom"
ob = memoryview(orig)[ds.DATA_START - ds.ROM_BASE:]
sb = memoryview(sh)[ds.DATA_START - ds.ROM_BASE + SHIFT:]
i, n = 0, len(ob)
chunk = 1 << 16
while i < n:
    j = min(n, i + chunk)
    if ob[i:j] != sb[i:j]:
        for k in range(i, j):
            if ob[k] != sb[k]:
                a = ds.DATA_START + k
                w = a & ~3
                if w in ptrs or a in rel_bytes:
                    continue
                other.append(a)
    i = j
ow_ = sorted({a & ~3 for a in other})
by = collections.Counter(owner(a) for a in ow_)
print(f"other changed words in the data region: {len(ow_)}")
for k, v in by.most_common(40):
    print(f"  {v:6d} {k}")
bad_src = [a for a in ow_ if owner(a) != "data/rom" and sw(a + SHIFT) != (ow(a) + SHIFT) & 0xFFFFFFFF]
print(f"source-section words changed by something other than +{SHIFT:#x}: {len(bad_src)}")
for a in bad_src[:20]:
    print("  %08X %08X -> %08X %s" % (a, ow(a), sw(a + SHIFT), owner(a)))
dr = [a for a in ow_ if owner(a) == "data/rom"]
print(f"data/rom words changed but not symbolized: {len(dr)}", [hex(a) for a in dr[:10]])

# raw data-region-looking words in placed (source) sections that did not move
stale = collections.Counter()
for addr, size, obj in placed:
    if obj in ds.EXCLUDE_SCAN:
        continue
    for a in range((addr + 3) & ~3, addr + size - 3, 4):
        v = ow(a)
        if ds.DATA_START <= v < ds.ROM_END and sw(a + SHIFT) == v:
            stale[obj] += 1
print(f"source-section words holding data-region addresses that did not move: {sum(stale.values())}")
for k, v in stale.most_common(40):
    print(f"  {v:6d} {k}")
# code literal pools: data addresses that did not move
lit = 0
for a in range(ds.ROM_BASE, ds.DATA_START, 4):
    v = ow(a)
    if ds.DATA_START <= v < ds.ROM_END and sw(a) == v:
        lit += 1
print(f"code-region words holding data-region addresses that did not move: {lit}")
