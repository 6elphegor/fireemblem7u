#!/usr/bin/env python3
"""Recover function names by matching machine code against another decomp.

Usage: tools/match_names.py REF_OBJ_DIR [OUR_OBJ...] > names.txt

REF_OBJ_DIR holds unlinked .o files built from a reference project (e.g.
FireEmblem7J or fireemblem8u); OUR_OBJ defaults to build/**/*.o.  Each
function is fingerprinted by its bytes with version-dependent parts masked
(BL targets, literal-pool words, relocated words).  Pairs whose fingerprint
is unique on both sides are matched; matches are then propagated through the
call graph (the Nth call in matched functions calls the same callee).

Output lines: "<our name> <ref name> <how>" for our sub_XXXXXXXX functions.
"""
import hashlib
import struct
import sys
from collections import defaultdict
from pathlib import Path

SHT_SYMTAB, SHT_REL = 2, 9
STT_FUNC = 2


class Func:
    def __init__(self, name, data, relocs):
        self.name = name
        self.data = data
        # offset -> symbol name for call relocations (or None if resolved)
        self.calls = {}
        self.masked = mask(data, relocs)
        self.key = hashlib.sha1(self.masked.rstrip(b"\0")).hexdigest()


def mask(data, relocs):
    """Zero out bytes that legitimately differ between builds/versions."""
    out = bytearray(data)
    kill = set()
    for off in relocs:
        kill.update(range(off, off + 4))
    i = 0
    while i + 1 < len(data):
        h = data[i] | data[i + 1] << 8
        if (h & 0xF800) == 0xF000 and i + 3 < len(data):
            h2 = data[i + 2] | data[i + 3] << 8
            if (h2 & 0xF800) in (0xF800, 0xE800):
                kill.update(range(i, i + 4))
                i += 4
                continue
        if (h & 0xF800) == 0x4800:  # ldr rX, [pc, #imm]
            t = ((i + 4) & ~3) + (h & 0xFF) * 4
            kill.update(range(t, t + 4))
        i += 2
    for k in kill:
        if k < len(out):
            out[k] = 0
    return bytes(out)


def bl_target(data, off):
    h = data[off] | data[off + 1] << 8
    h2 = data[off + 2] | data[off + 3] << 8
    if (h & 0xF800) != 0xF000 or (h2 & 0xF800) != 0xF800:
        return None
    imm = ((h & 0x7FF) << 12) | ((h2 & 0x7FF) << 1)
    if imm & 0x400000:
        imm -= 0x800000
    return off + 4 + imm


def read_obj(path):
    """Yield Func objects for every STT_FUNC symbol in an ELF32 .o."""
    b = path.read_bytes()
    if b[:4] != b"\x7fELF":
        return []
    shoff, = struct.unpack_from("<I", b, 0x20)
    shentsize, shnum, shstrndx = struct.unpack_from("<HHH", b, 0x2E)
    secs = [struct.unpack_from("<IIIIIIIIII", b, shoff + i * shentsize) for i in range(shnum)]

    def strat(tab, off):
        base = secs[tab][4] + off
        return b[base:b.index(b"\0", base)].decode()

    symtab = next((i for i, s in enumerate(secs) if s[1] == SHT_SYMTAB), None)
    if symtab is None:
        return []
    _, _, _, _, off, size, link, _, _, entsize = secs[symtab]
    syms = []
    for k in range(size // entsize):
        name, value, sz, info, other, shndx = struct.unpack_from("<IIIBBH", b, off + k * entsize)
        syms.append((strat(link, name) if name else "", value & ~1, info & 0xF, shndx))

    relocs = defaultdict(dict)  # section -> {offset: symbol name}
    for s in secs:
        if s[1] == SHT_REL:
            target, off, size = s[7], s[4], s[5]
            for k in range(size // 8):
                r_off, r_info = struct.unpack_from("<II", b, off + k * 8)
                relocs[target][r_off] = syms[r_info >> 8][0]

    by_sec = defaultdict(list)
    for name, value, typ, shndx in syms:
        if typ == STT_FUNC and 0 < shndx < len(secs):
            by_sec[shndx].append((value, name))
    funcs = []
    for shndx, lst in by_sec.items():
        sec = secs[shndx]
        data = b[sec[4]:sec[4] + sec[5]]
        lst.sort()
        # function symbol at each section offset, for resolved local BLs
        at = {v: n for v, n in lst}
        ends = [v for v, _ in lst[1:]] + [len(data)]
        for (start, name), end in zip(lst, ends):
            if end <= start:
                continue
            rel = {o - start: s for o, s in relocs[shndx].items() if start <= o < end}
            f = Func(name, data[start:end], rel)
            for o in range(0, end - start - 3, 2):
                if o in rel:
                    f.calls[o] = rel[o]
                else:
                    t = bl_target(data, start + o)
                    if t is not None and t in at:
                        f.calls[o] = at[t]
            funcs.append(f)
    return funcs


def load(paths):
    funcs = {}
    for p in paths:
        for f in read_obj(p):
            funcs.setdefault(f.name, f)
    return funcs


def main():
    ref = load(sorted(Path(sys.argv[1]).rglob("*.o")))
    ours_paths = [Path(p) for p in sys.argv[2:]] or sorted(Path("build").rglob("*.o"))
    ours = load(ours_paths)

    by_key_ref, by_key_ours = defaultdict(list), defaultdict(list)
    for f in ref.values():
        by_key_ref[f.key].append(f.name)
    for f in ours.values():
        by_key_ours[f.key].append(f.name)

    match = {}  # our name -> (ref name, how)
    for key, names in by_key_ours.items():
        if len(names) == 1 and len(by_key_ref.get(key, ())) == 1:
            match[names[0]] = (by_key_ref[key][0], "bytes")

    # Propagate through calls: identical call sites in matched pairs.
    changed = True
    while changed:
        changed = False
        taken = {r for r, _ in match.values()}
        for our_name, (ref_name, _) in list(match.items()):
            a, b = ours[our_name], ref[ref_name]
            if a.masked.rstrip(b"\0") != b.masked.rstrip(b"\0"):
                continue
            for off, callee in a.calls.items():
                rc = b.calls.get(off)
                if not rc or rc not in ref or callee in match or rc in taken or callee not in ours:
                    continue
                match[callee] = (rc, "call")
                taken.add(rc)
                changed = True

    # A reference name used for two of our functions is ambiguous: drop both.
    count = defaultdict(int)
    for r, _ in match.values():
        count[r] += 1
    for our_name in sorted(match, key=lambda n: n):
        r, how = match[our_name]
        if count[r] == 1 and our_name != r:
            print(our_name, r, how)


if __name__ == "__main__":
    main()
