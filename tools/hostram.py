#!/usr/bin/env python3
"""Define the RAM symbols that only symbols.ld names, for the host build.

    tools/hostram.py OUT.s OBJ...          (run by tools/hostgame.py)

symbols.ld gives about 500 EWRAM / IWRAM objects an address and nothing else;
no C file defines them.  On the GBA many of them overlap: the screens of the
game reuse the same RAM (gAnims, gWmSt, gMinimapWinBuf and others all start
at 0x02000000), and some names point inside another object.  The host keeps
that sharing by laying these objects out in two images at their GBA offsets
(docs/port-notes.md, "Host link"):

    _gHostRamEwram  0x02000000 + off  ->  _gHostRamEwram + off
    _gHostRamIwram  0x03000000 + off  ->  _gHostRamIwram + off

Sizes: every name the host objects OBJ... refer to is measured with the
headers' declaration.  For each C file that refers to such names, its
preprocessed text gets `const unsigned long __hs_NAME[3] = { sizeof NAME,
__alignof__ NAME, sizeof NAME[0] }` lines appended and is compiled to
assembly twice: for the host (the host size) and for armv4t-none-eabi (the
GBA size, 4-byte pointers).  An incomplete array (`extern u8 gFoo[];`) has no
sizeof: its GBA size is the gap to the next RAM symbol of fe7u.elf, scaled by
the element's host/GBA size ratio for the host.

An object whose host size is bigger than its GBA size may run into the
objects after it; each such overlap that the GBA does not have is listed (as
a warning) with the names involved.  If the image would end past the GBA
memory's size, it is extended; the extension is not visible at the GBA
addresses (EWRAM_START still points at the platform's gHostEwram).

Unnamed addresses: the code's RAM_ADDR(0x0203A98C) refers to HostRam_0x0203A98C
on the host (include/gbafe/global.h); each such name the objects use gets a
label at that GBA offset's place in the image.

Output: OUT.s (the images, a label per name) and OUT.txt (the layout, one
line per name: region, GBA address, host offset, GBA size, host size).
"""

import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, 'tools'))
import hostgame  # noqa: E402

REGIONS = {0x02: ('Ewram', 0x02000000, 0x40000), 0x03: ('Iwram', 0x03000000, 0x8000)}
NM = os.environ.get('HOSTRAM_NM', 'arm-none-eabi-nm')


def ld_ram_symbols():
    syms = {}
    for line in open(os.path.join(ROOT, 'symbols.ld')):
        m = re.match(r'^\s*([A-Za-z_]\w*)\s*=\s*0x(0[23][0-9A-Fa-f]{6})\s*;', line)
        if m:
            syms[m.group(1)] = int(m.group(2), 16)
    return syms


def elf_ram_symbols():
    """(addr, size or None, name) of every RAM symbol of fe7u.elf."""
    out = []
    for line in hostgame.run([NM, '-S', '-n', 'fe7u.elf']).splitlines():
        f = line.split()
        if len(f) == 4:
            addr, size, _, name = f
            size = int(size, 16)
        elif len(f) == 3:
            addr, _, name = f
            size = None
        else:
            continue
        addr = int(addr, 16)
        if addr >> 24 in REGIONS and name not in ('EWRAM_START', 'IWRAM_START'):
            out.append((addr, size, name))
    return out


def nm_host(obj):
    """(defined, undefined) C names of a host object."""
    d, u = set(), set()
    for line in hostgame.run(['nm', '-P', obj]).splitlines():
        f = line.split()
        if len(f) < 2:
            continue
        name = f[0][1:] if sys.platform == 'darwin' else f[0]
        (u if f[1] == 'U' else d).add(name)
    return d, u


def hostgame_obj_dir():
    return os.path.join(hostgame.OUT, 'obj')


def hostgame_src(obj):
    rel = os.path.relpath(obj, hostgame_obj_dir())
    src = os.path.splitext(rel)[0] + '.c'
    return src if os.path.exists(src) else os.path.join('build', src)


def gba_preprocess(src):
    """src preprocessed as the GBA build does (NONMATCHING, CP932 text)."""
    cpp = subprocess.run(['arm-none-eabi-cpp', '-I', 'tools/agbcc/include', '-iquote', 'include',
                          '-iquote', '.', '-nostdinc', '-undef', '-DPLATFORM_GBA=1',
                          '-DNONMATCHING=1', src], capture_output=True, check=True)
    return subprocess.run(['iconv', '-f', 'UTF-8', '-t', 'CP932'], input=cpp.stdout,
                          capture_output=True, check=True).stdout


def probe(src, names, flags):
    """{name: (hostsize, hostalign, hostelem, gbasize, gbaalign, gbaelem)}, a
    size 0 for an incomplete array (then the element sizes are set).  The
    host's numbers come from clang, the GBA's from agbcc."""
    pps = {'host': subprocess.run([hostgame.CLANG] + flags + ['-E', src],
                                  capture_output=True, check=True).stdout,
           'gba': gba_preprocess(src)}
    cmds = {'host': [hostgame.CLANG, '-x', 'cpp-output', '-S', '-o', '-', '-', '-w',
                     '-std=gnu89', '-funsigned-char', '-fno-common'] + flags[:2],
            'gba': ['tools/agbcc/bin/old_agbcc', '-mthumb-interwork', '-O2', '-fhex-asm',
                    '-o', '-']}
    mode = {n: 0 for n in names}   # 0: sizeof; 1: element size only; 2: skip
    forms = ['{ sizeof(%s), __alignof__(%s), 0 }', '{ 0, __alignof__(%s), sizeof(%s[0]) }']
    while True:
        live = sorted(n for n in mode if mode[n] < 2)
        lines = ['const unsigned long __hs_%s[3] = %s;' % (n, forms[mode[n]] % (n, n)) for n in live]
        tail = ('\n#line 1 "hsprobe"\n' + '\n'.join(lines) + '\n').encode()
        vals, errs = {}, set()
        for arch in ('host', 'gba'):
            r = subprocess.run(cmds[arch], input=pps[arch] + tail, capture_output=True)
            err = r.stderr.decode(errors='replace')
            if r.returncode != 0:
                for m in re.finditer(r'hsprobe:(\d+):', err):
                    i = int(m.group(1)) - 1
                    if 0 <= i < len(live):
                        errs.add(live[i])
                if not errs:
                    sys.exit('hostram: probe of %s (%s) failed:\n%s' % (src, arch, err[:2000]))
                break
            cur = None
            for line in r.stdout.decode(errors='replace').splitlines():
                m = re.match(r'^_*hs_(\w+):', line)
                if m:
                    cur = m.group(1)
                    vals[(arch, cur)] = []
                    continue
                m = re.match(r'^\s*\.(quad|long|word)\s+(0x[0-9a-fA-F]+|\d+)', line)
                if m and cur:
                    vals[(arch, cur)].append(int(m.group(2), 0))
        if errs:
            for n in errs:
                mode[n] += 1
            continue
        return {n: tuple(vals[('host', n)] + vals[('gba', n)]) for n in live}


def main():
    if len(sys.argv) < 3:
        sys.exit(__doc__)
    out, objs = sys.argv[1], sys.argv[2:]
    os.chdir(ROOT)
    ldsyms = ld_ram_symbols()
    defined, refs = set(), {}
    for o in objs:
        d, u = nm_host(o)
        defined |= d
        for n in u:
            refs.setdefault(n, o)
    wanted = sorted(n for n in ldsyms if n in refs and n not in defined)

    flags = (['-target', hostgame.run([hostgame.CLANG, '-print-target-triple']).strip()] +
             hostgame.CFLAGS + hostgame.include_flags())
    by_src = {}
    for n in wanted:
        by_src.setdefault(hostgame_src(refs[n]), []).append(n)
    info = {}
    for src, names in sorted(by_src.items()):
        info.update(probe(src, names, flags))

    elf = elf_ram_symbols()
    addrs = sorted(set(a for a, _, _ in elf) | set(ldsyms.values()))

    def gap(a):
        nxt = [b for b in addrs if b > a and b >> 24 == a >> 24]
        region = REGIONS[a >> 24]
        return (min(nxt) if nxt else region[1] + region[2]) - a

    layout = {}   # name -> (region, off, gbasize, hostsize, align)
    notes = []
    for n in wanted:
        a = ldsyms[n]
        region = REGIONS[a >> 24]
        if n not in info:
            notes.append('%s: no declaration found; sized by the gap' % n)
            hs, ha, he, gs, ga, ge = None, 1, 1, None, 1, 1
        else:
            hs, ha, he, gs, ga, ge = info[n]
        if not gs:
            gs = gap(a)
            hs = gs * he // ge if ge else gs
        layout[n] = (region, a - region[1], gs, hs, ha)
    # RAM_ADDR(0x0203A98C) (include/gbafe/global.h): an unnamed address, a
    # zero-size label at the same place in the image
    for n in sorted(refs):
        m = re.match(r'^HostRam_0x(0[23][0-9A-Fa-f]{6})$', n)
        if m and n not in defined:
            a = int(m.group(1), 16)
            region = REGIONS[a >> 24]
            layout[n] = (region, a - region[1], 0, 0, 1)

    # host offsets: f(GBA offset), monotonic, f(x + d) >= f(x) + d, and an
    # object that ends (on the GBA) at or before another's start ends on the
    # host before that start too; objects that overlap on the GBA keep their
    # distance unless something between them grew
    warnings = []
    hostoff = {}
    ends = {}
    for rname in ('Ewram', 'Iwram'):
        names = [n for n, v in layout.items() if v[0][0] == rname]
        points = sorted(set(layout[n][1] for n in names))
        f = {}
        prev = None
        for p in points:
            v = 0 if prev is None else f[prev] + (p - prev)
            for n in names:
                o, gs, hs = layout[n][1], layout[n][2], layout[n][3]
                if o + gs <= p and o in f:
                    v = max(v, f[o] + hs)
            al = max(layout[n][4] for n in names if layout[n][1] == p)
            v = (v + al - 1) // al * al
            f[p] = v
            prev = p
        for n in names:
            hostoff[n] = f[layout[n][1]]
        ends[rname] = max([0] + [hostoff[n] + layout[n][3] for n in names])
        # a name inside another object (on the GBA) that moved relative to it
        for n in names:
            o = layout[n][1]
            for m in names:
                om, gm = layout[m][1], layout[m][2]
                if om < o < om + gm and hostoff[n] - hostoff[m] != o - om:
                    warnings.append('%s is inside %s at +0x%X on the GBA, +0x%X on the host'
                                    % (n, m, o - om, hostoff[n] - hostoff[m]))
    prefix = '_' if sys.platform == 'darwin' else ''
    lines = ['/* generated by tools/hostram.py: the RAM objects symbols.ld names, at',
             '   their GBA offsets in the host images (docs/port-notes.md, "Host link") */']
    report = []
    for rname, base, size in sorted(REGIONS.values(), key=lambda r: r[1]):
        items = sorted((hostoff[n], n) for n, v in layout.items() if v[0][0] == rname)
        end = max(size, ends[rname])
        end = (end + 15) & ~15
        if sys.platform == 'darwin':
            lines.append('\t.section __DATA,__bss')
        else:
            lines.append('\t.bss')
        lines.append('\t.p2align 4')
        lines.append('\t.globl %sgHostRam%s' % (prefix, rname))
        lines.append('%sgHostRam%s:' % (prefix, rname))
        pos = 0
        for off, n in items:
            if off > pos:
                lines.append('\t.space 0x%X' % (off - pos))
                pos = off
            lines.append('\t.globl %s%s' % (prefix, n))
            lines.append('%s%s:' % (prefix, n))
            _, _, gs, hs, ha = layout[n]
            gba = base + layout[n][1]
            report.append('%s 0x%08X +0x%05X gba 0x%X host 0x%X %s' % (rname, gba, off, gs, hs, n))
        if end > pos:
            lines.append('\t.space 0x%X' % (end - pos))
        lines.append('\t.globl %sgHostRam%sEnd' % (prefix, rname))
        lines.append('%sgHostRam%sEnd:' % (prefix, rname))
    with open(out, 'w') as f:
        f.write('\n'.join(lines) + '\n')
    with open(os.path.splitext(out)[0] + '.txt', 'w') as f:
        f.write('\n'.join(sorted(report) + [''] + ['note: ' + x for x in notes] +
                          ['warning: ' + w for w in warnings]) + '\n')
    print('hostram: %d names, %d without a size, %d host overlaps (%s)'
          % (len(layout), len(notes), len(warnings), os.path.splitext(out)[0] + '.txt'))


if __name__ == '__main__':
    main()
