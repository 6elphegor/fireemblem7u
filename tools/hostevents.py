#!/usr/bin/env python3
"""Run the event list readers on the host and compare with a 32-bit walk.

    tools/hostevents.py [--rom fe7u.gba] [--elf fe7u.elf]      (make hostevents)

Builds tests/host/events.c with the host's clang (LP64: an event cell is 8 bytes)
and links it with the host objects of src/eventinfo.c, src/data/chapters.c,
src/data/chapterassets.c and the converted chapter event lists (src/events); every
other symbol they refer to is a zeroed stub.  The test prints, for each chapter, the
entries of its turn / character / location / misc event lists and what
SearchAvailableEvent finds for a set of queries.  This script produces the same lines
independently, by walking the lists as 4-byte words in the built ROM (the entry
lengths come from gEventListCmdInfoTable in the ROM, the lists from the ROM's chapter
tables), and fails on any difference.
"""

import glob
import os
import re
import struct
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)

CLANG = os.environ.get('HOSTCHECK_CC', 'clang')
NM = os.environ.get('HOSTEVENTS_NM', 'arm-none-eabi-nm')
OUT = os.path.join('build', 'hostevents')

POS_CMDS = {1, 5, 6, 7, 8, 9, 10}

# the libc functions the game calls; the host provides them
LIBC = {'memcpy', 'memset', 'memmove', 'memcmp', 'strlen', 'strcpy', 'strcmp', 'strncpy',
        'printf', 'sprintf', 'abs', 'rand', 'srand', 'malloc', 'free', 'exit', 'abort'}


def run(cmd, **kw):
    r = subprocess.run(cmd, capture_output=True, text=True, **kw)
    if r.returncode != 0:
        sys.stderr.write(' '.join(cmd) + '\n' + r.stdout + r.stderr)
        sys.exit(1)
    return r.stdout


def build():
    os.makedirs(OUT, exist_ok=True)
    srcs = (['src/eventinfo.c', 'src/data/chapters.c', 'src/data/chapterassets.c',
             'tests/host/events.c'] + sorted(glob.glob('src/events/*.c')))
    run([sys.executable, 'tools/hostcheck.py', '--target', 'native', '-j', '8'] + srcs)
    triple = run([CLANG, '-print-target-triple']).strip()
    triple = re.sub(r'-apple-darwin[0-9.]*$', '-apple-macosx', triple)
    objs = [os.path.join('build', 'host', triple, os.path.splitext(s)[0] + '.o') for s in srcs]
    for o in objs:
        if not os.path.exists(o):
            sys.exit('%s was not built (make hostcheck shows why)' % o)

    defined, undefined = set(), set()
    for o in objs:
        for line in run(['nm', '-P', o]).splitlines():
            f = line.split()
            if len(f) < 2:
                continue
            name = f[0].lstrip('_') if sys.platform == 'darwin' else f[0]
            (undefined if f[1] == 'U' else defined).add(name)
    stubs = os.path.join(OUT, 'stubs.c')
    with open(stubs, 'w') as f:
        for name in sorted(undefined - defined - LIBC):
            if re.match(r'^[A-Za-z_][A-Za-z_0-9]*$', name):
                f.write('char %s[4096] __attribute__((aligned(16)));\n' % name)
    exe = os.path.join(OUT, 'events')
    run([CLANG, '-fno-common', '-Wl,-w', '-o', exe, stubs] + objs)
    return exe


class Rom:
    def __init__(self, rom, elf):
        with open(rom, 'rb') as f:
            self.d = f.read()
        self.sym = {}
        for line in run([NM, elf]).splitlines():
            f = line.split()
            if len(f) == 3:
                self.sym[f[2]] = int(f[0], 16)

    def u32(self, a):
        return struct.unpack_from('<I', self.d, a - 0x08000000)[0]


def flag_set(f, sel):
    # CheckFlag with only flag `sel` set; 0 and 100 are never set
    return f not in (0, 100) and f == sel


def oracle(rom):
    lens = rom.sym['gEventListCmdInfoTable']
    length = lambda cmd: rom.u32(lens + cmd * 8 + 4)
    chapters = rom.sym['gChapterDataTable']
    assets = rom.sym['gChapterDataAssetTable']
    out = ['H 1234 ABCD 5678']
    for ch in range(0x43):
        eid = rom.d[chapters - 0x08000000 + ch * 0x98 + 0x78]
        grp = rom.u32(assets + eid * 4) if eid else 0
        if eid == 0 or grp == 0:
            continue
        out.append('C ch=%02X id=%02X' % (ch, eid))
        for li, name in enumerate(('turn', 'char', 'loc', 'misc')):
            lst = rom.u32(grp + li * 4)
            if lst == 0:
                continue
            ents = []          # (cmd, flag, cells)
            a = lst
            while True:
                w0 = rom.u32(a)
                cmd = w0 & 0xFFFF
                if cmd == 0:
                    break
                n = length(cmd)
                ents.append((cmd, w0 >> 16, [rom.u32(a + 4 * i) for i in range(n)], a))
                a += 4 * n
            for k, (cmd, flag, c, _) in enumerate(ents):
                s = 'E ch=%02X %s %d cmd=%X flag=%X len=%d' % (ch, name, k, cmd, flag, len(c))
                if cmd in (1, 4, 5, 6, 8, 9, 10):
                    s += ' c2=%X' % c[2]
                elif cmd in (2, 3):
                    s += ' c2=%X c3=%X' % (c[2], c[3])
                elif cmd == 7:
                    s += ' c1=%X c2=%X' % (c[1], c[2])
                out.append(s)
            kinds = {e[0] for e in ents}
            if name == 'loc' and kinds <= POS_CMDS:
                for k, (cmd, flag, c, _) in enumerate(ents):
                    if 5 <= cmd <= 9:
                        out.append(query(rom, ch, ents, 'loc from=%d' % k, c[2] & 0xFF, (c[2] >> 8) & 0xFF, None))
            if name == 'misc' and kinds <= {1}:
                for k, (cmd, flag, c, _) in enumerate(ents):
                    out.append(query(rom, ch, ents, 'misc afev=%d' % k, None, None, c[2] & 0xFFFF))
    return out


def query(rom, ch, ents, what, x, y, setflag):
    sel = setflag
    s = 'Q ch=%02X %s ->' % (ch, what)
    for idx, (cmd, flag, c, addr) in enumerate(ents):
        if flag_set(flag, sel):
            continue
        if cmd == 1:
            if not flag_set(c[2] & 0xFFFF, sel):
                continue
            script = c[1]
            cid = None
        else:
            bx, by, cid = c[2] & 0xFF, (c[2] >> 8) & 0xFF, (c[2] >> 16) & 0xFF
            if (bx, by) != (x, y):
                continue
            script = 1 if cmd == 7 else c[1]
        s += ' idx=%d' % idx
        if cmd == 1:
            s += ' flag=%X' % flag
        else:
            s += ' cmd=%X cid=%X flag=%X' % (cmd, cid, flag)
        s += ' script=%s' % ('null' if script == 0 else 'noscript' if script == 1 else 'ptr')
        if script > 1:
            s += ' first=%X' % (rom.u32(script) & 0xFFFF)
        if cmd == 7:
            s += ' item=%X money=%X' % (c[1] & 0xFFFF, c[1] >> 16)
        elif 5 <= cmd <= 9:
            s += ' money=%X' % ((c[2] >> 24) if cmd in (8, 9) else 3 if cmd == 6 else 0)
        return s
    return s + ' none'


def main():
    rom = os.environ.get('HOSTEVENTS_ROM', 'fe7u.gba')
    elf = os.environ.get('HOSTEVENTS_ELF', 'fe7u.elf')
    for a in sys.argv[1:]:
        if a.startswith('--rom='):
            rom = a[6:]
        elif a.startswith('--elf='):
            elf = a[6:]
    exe = build()
    host = run([exe]).splitlines()
    want = oracle(Rom(rom, elf))
    kinds = {}
    for l in host:
        kinds[l[0]] = kinds.get(l[0], 0) + 1
    bad = 0
    for i in range(max(len(host), len(want))):
        h = host[i] if i < len(host) else '<missing>'
        w = want[i] if i < len(want) else '<missing>'
        if h != w:
            bad += 1
            if bad <= 10:
                print('host:   ' + h)
                print('32-bit: ' + w)
    print('chapters %d, list entries %d, queries %d; differences: %d'
          % (kinds.get('C', 0), kinds.get('E', 0), kinds.get('Q', 0), bad))
    sys.exit(1 if bad else 0)


main()
