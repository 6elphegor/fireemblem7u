#!/usr/bin/env python3
"""Shift test: relink with SHIFT bytes of padding in front of the data region
and check every data word.  Run from the repo root after `make`.

  tools/shifttest.py [SHIFT]    (or: make shifttest)

The battle animation scripts are compressed after linking (tools/banim.py),
so in the shifted build their contents -- and possibly their compressed
sizes -- change.  Everything is therefore compared through the placement the
shifted link actually used (its map file): each layout entry's new address,
not a uniform +SHIFT.  The scripts themselves are decompressed from both
ROMs and compared word by word.
"""
import bisect
import collections
import re
import shlex
import struct
import subprocess
import sys
from pathlib import Path
sys.path.insert(0, "tools")
import banim, dataptrs, datasplit as ds, elf32, gfx

SHIFT = int(sys.argv[1], 0) if len(sys.argv) > 1 else 0x100
out = Path("build/shift"); out.mkdir(exist_ok=True)
lay = Path("build/layout.ld").read_text()
lay = "\n".join(l for l in lay.splitlines() if not l.startswith("ASSERT"))
(out / "layout.ld").write_text(f". += {SHIFT:#x};\n" + lay + "\n")
ld = Path("build/fe7u.ld").read_text().replace("INCLUDE build/layout.ld", f"INCLUDE {out}/layout.ld")
(out / "fe7u.ld").write_text(ld)
# same link command as the Makefile, with the shifted script; the battle
# animation scripts are compressed again for it, in build/shift/banim
mk = subprocess.run(["make", "-n", "fe7u.elf", "-W", "build/fe7u.ld"], capture_output=True, text=True).stdout
line = next(l for l in mk.splitlines() if "tools/banim.py link" in l)
args = shlex.split(line)
cmd = args[args.index("--") + 1:]
for flag, val in (("-T", f"{out}/fe7u.ld"), ("-Map", f"{out}/s.map"), ("-o", f"{out}/s.elf")):
    cmd[cmd.index(flag) + 1] = val
banim.link(out / "banim", cmd, strict=False)
subprocess.run(["arm-none-eabi-objcopy", "-O", "binary", f"{out}/s.elf", f"{out}/s.gba"], check=True)

orig = Path("baserom.gba").read_bytes()
sh = Path(f"{out}/s.gba").read_bytes()
assert sh[:0x100] == orig[:0x100]

# --- where each layout entry went: the shifted link's map file
placed = ds.read_layout("data/layout.txt")
entries = sorted(placed + ds.read_layout("data/rom/layout.txt"))
new_addr, new_size = {}, {}
lines = (out / "s.map").read_text().split("Linker script and memory map", 1)[1].splitlines()
for i, l in enumerate(lines):
    f = l.split()
    if l.startswith(" .") and len(f) in (1, 4):
        if len(f) == 1:
            if i + 1 >= len(lines) or len(g := lines[i + 1].split()) != 3 or not g[0].startswith("0x"):
                continue
            f = f + g
        if f[1].startswith("0x"):
            o = f[3].replace(f"{out}/banim/", "build/banim/")
            if m := re.fullmatch(r"(?:.*/)?([^/]+\.a)\((.*)\)", o):  # archive member
                o = f"*{m.group(1)}:{m.group(2)}"
            new_addr.setdefault(f"{o}({f[0]})", int(f[1], 16))
            new_size.setdefault(f"{o}({f[0]})", int(f[2], 16))
starts = [e[0] for e in entries]
for a, size, obj in entries:
    if obj not in new_addr:
        sys.exit(f"{obj} not found in {out}/s.map")


# a battle animation script's entry: compressed script (whose size may have
# changed), then its mode table
script_pad = {}  # entry start -> (original, new) size of the compressed script
for s, size, obj in entries:
    if obj.startswith(ds.BANIM_OBJ):
        _, olen = gfx.lz77_decompress(orig, s - ds.ROM_BASE)
        opad = (olen + 3) & ~3
        script_pad[s] = (opad, new_size[obj] - (size - opad))


def mv(a):
    """Where the data at original address a ended up (end addresses of an
    entry map to the start of the next)."""
    i = bisect.bisect_right(starts, a) - 1
    if i < 0:
        return a
    s, size, obj = entries[i]
    if not (a < s + size or i == len(entries) - 1):
        return a + SHIFT
    if s in script_pad and a - s >= script_pad[s][0]:  # in the mode table
        return new_addr[obj] + script_pad[s][1] + (a - s - script_pad[s][0])
    return new_addr[obj] + (a - s)


last = entries[-1]
print(f"shifted ROM ends {len(sh) - len(orig):#x} bytes later "
      f"(padding {SHIFT:#x}, compressed battle animation size changes {len(sh) - len(orig) - SHIFT:+#x})")
assert ds.ROM_BASE + len(sh) == new_addr[last[2]] + last[1]


def ow(a): return struct.unpack_from("<I", orig, a - ds.ROM_BASE)[0]
def sw(a): return struct.unpack_from("<I", sh, a - ds.ROM_BASE)[0]

# expected pointer words in data/rom: parse .4byte lines
ptrs = {a: e for kind, a, e, _ in ds.walk_rom_files() if kind == "ptr"}


def moves(v):  # does the value's target lie in the shifted region?
    t = v & 0x0FFFFFFF if (v >> 28) and (v & 0x0F000000) == 0x08000000 else v
    return ds.DATA_START <= (t & ~1) < ds.ROM_END


def moved(v):
    """v with its target moved (AnimScr high bits and Thumb bit kept)."""
    t = v & 0x0FFFFFFF if (v >> 28) and (v & 0x0F000000) == 0x08000000 else v
    base = t & ~1
    return (v - base + mv(base)) & 0xFFFFFFFF


bad_ptr, ok_moved, ok_fixed = [], 0, 0
for a, e in ptrs.items():
    o, s = ow(a), sw(mv(a))
    want = moved(o) if moves(o) else o
    if s != want:
        bad_ptr.append((a, o, s, e))
    elif s != o:
        ok_moved += 1
    else:
        ok_fixed += 1
print(f"data/rom pointer words: {len(ptrs)}; moved: {ok_moved}; unchanged (code/RAM targets): {ok_fixed}; WRONG: {len(bad_ptr)}")
for x in bad_ptr[:20]:
    print("  wrong %08X %08X -> %08X  %s" % x)

# Objects placed whole whose pointer fields need not be aligned (music track
# data, tools/m4adis.py): every R_ARM_ABS32 relocation is a pointer field.
RELOC_OBJS = {"build/sound/sound.o(.rodata)"}
def ou(a): return struct.unpack_from("<I", orig, a - ds.ROM_BASE)[0]
def su(a): return struct.unpack_from("<I", sh, a - ds.ROM_BASE)[0]
rel_ptrs, rel_bytes, rel_ranges = {}, set(), []
for addr, size, obj in placed:
    if obj in RELOC_OBJS:
        path, sec = obj[:-1].split("(")
        rel_ranges.append((addr, size, obj))
        for off, typ, sym in elf32.Elf(path).section(sec).relocs:
            if typ == elf32.R_ARM_ABS32:
                rel_ptrs[addr + off] = sym.name
                rel_bytes.update(range(addr + off, addr + off + 4))
bad_rel, rel_moved, rel_fixed = [], 0, 0
for a, e in rel_ptrs.items():
    o, s_ = ou(a), su(mv(a))
    want = moved(o) if moves(o) else o
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
print(f"relocated pointer fields: {len(rel_ptrs)}; moved: {rel_moved}; unchanged (RAM targets): {rel_fixed}; WRONG: {len(bad_rel)}")
for x in bad_rel[:20]:
    print("  wrong %08X %08X -> %08X  %s" % x)

# Battle animation scripts: decompress both, compare word by word; every
# sprite sheet pointer must point at the sheet's new address.
scripts = banim.scripts()
sheet_n = sheet_moved = 0
bad_sheet, bad_other, bad_modes, resized = [], [], [], 0
for addr, size, name in scripts:
    od, olen = gfx.lz77_decompress(orig, addr - ds.ROM_BASE)
    na = mv(addr)
    nd, nlen = gfx.lz77_decompress(sh, na - ds.ROM_BASE)
    opad, npad = script_pad[addr]
    resized += opad != npad
    if sh[na + nlen - ds.ROM_BASE:na + npad - ds.ROM_BASE].strip(b"\0"):
        bad_other.append((name, "padding"))
    # the mode table follows the compressed script
    nmodes = size - opad
    if orig[addr + opad - ds.ROM_BASE:][:nmodes] != sh[na + npad - ds.ROM_BASE:][:nmodes]:
        bad_modes.append(name)
    if len(od) != len(nd):
        bad_other.append((name, "length", len(od), len(nd)))
        continue
    sheets = banim.sheet_words(od)
    for off in range(0, len(od), 4):
        o, n = struct.unpack_from("<I", od, off)[0], struct.unpack_from("<I", nd, off)[0]
        if off in sheets:
            sheet_n += 1
            if n != mv(o):
                bad_sheet.append((name, off, o, n))
            elif n != o:
                sheet_moved += 1
        elif o != n:
            bad_other.append((name, off, o, n))
print(f"battle animation scripts: {len(scripts)} (compressed size changed: {resized}); "
      f"sheet pointers {sheet_n}, moved: {sheet_moved}; WRONG: {len(bad_sheet)}; "
      f"other words changed: {len(bad_other)}; mode tables changed: {len(bad_modes)}")
for s, (o, n) in script_pad.items():
    if o != n:
        print(f"  {s:#010x} compressed {o:#x} -> {n:#x} bytes")
for x in bad_sheet[:10]:
    print("  wrong %s+%#x %08X -> %08X" % x)
for x in bad_other[:10]:
    print("  changed", x)

# every other byte of the data region must be the original byte, moved along
diff_words = collections.Counter()
other = []
BANIM = {obj for _, _, obj in entries if obj.startswith(ds.BANIM_OBJ)}
for s, size, obj in entries:
    if obj in BANIM:
        continue
    n = new_addr[obj]
    ob = orig[s - ds.ROM_BASE:s - ds.ROM_BASE + size]
    sb = sh[n - ds.ROM_BASE:n - ds.ROM_BASE + size]
    if ob == sb:
        continue
    for k in range(0, size, 1 << 12):
        if ob[k:k + 4096] == sb[k:k + 4096]:
            continue
        for j in range(k, min(size, k + 4096)):
            if ob[j] != sb[j]:
                a = s + j
                if a & ~3 in ptrs or a in rel_bytes:
                    continue
                other.append(a)


def owner(a):
    i = bisect.bisect_right(starts, a) - 1
    if i >= 0 and entries[i][0] <= a < entries[i][0] + entries[i][1]:
        o = entries[i][2]
        return "data/rom" if o.startswith("build/data/rom/") else o
    return "data/rom"


ow_ = sorted({a & ~3 for a in other})
by = collections.Counter(owner(a) for a in ow_)
print(f"other changed words in the data region: {len(ow_)}")
for k, v in by.most_common(40):
    print(f"  {v:6d} {k}")
bad_src = [a for a in ow_ if owner(a) != "data/rom" and sw(mv(a)) != moved(ow(a))]
print(f"source-section words changed by something other than their target's move: {len(bad_src)}")
for a in bad_src[:20]:
    print("  %08X %08X -> %08X %s" % (a, ow(a), sw(mv(a)), owner(a)))
dr = [a for a in ow_ if owner(a) == "data/rom"]
print(f"data/rom words changed but not symbolized: {len(dr)}", [hex(a) for a in dr[:10]])

# raw data-region-looking words in placed (source) sections that did not move
stale = collections.Counter()
for addr, size, obj in placed:
    if ds.excluded(obj):
        continue
    for a in range((addr + 3) & ~3, addr + size - 3, 4):
        v = ow(a)
        if ds.DATA_START <= v < ds.ROM_END and sw(mv(a)) == v:
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

# Regression checks for tools/dataptrs.py's structure knowledge: data known
# to hold no pointer (map change tiles, NOT_POINTERS -- words there that look
# like pointers, e.g. 0x08CE3110 or 0x08CE605C) must keep its bytes and have
# no .4byte word, and the structure pointer fields it finds (map change data
# pointers, e.g. 0x08CE27F8) must be symbolized.
dsyms = dataptrs.Symbols("fe7u.elf", lambda a: False)
fields, _ = dataptrs.structures(orig, dsyms)
raw = dataptrs.raw_ranges(orig, dsyms)
bad_raw = [a for s, e in raw for a in range(s, e)
           if orig[a - ds.ROM_BASE] != sh[mv(a) - ds.ROM_BASE]]
bad_raw += [p for p in ptrs if any(s < p + 4 and p < e for s, e in raw)]
# (a field in a source section is a relocation, checked above)
missed = sorted(f for f in fields if f not in ptrs and owner(f) == "data/rom")
print(f"raw ranges (no pointers): {len(raw)}, {sum(e - s for s, e in raw)} bytes; "
      f"changed or symbolized: {len(bad_raw)}; structure pointer fields: {len(fields)}, "
      f"not symbolized: {len(missed)}")
for a in sorted(set(bad_raw))[:10]:
    print("  raw data changed %08X" % a)
for a in missed[:10]:
    print("  pointer field left raw %08X" % a)

wrong = (len(bad_ptr) + len(bad_rel) + len(bad_sheet) + len(bad_other) + len(bad_modes) + len(bad_src)
         + len(bad_raw) + len(missed))
print(f"WRONG: {wrong}")
