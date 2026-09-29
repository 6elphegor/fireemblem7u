#!/usr/bin/env python3
"""Calls and data declarations whose width differs from the definition's.

    tools/hostsigs.py [-j 4]                                  (make hostsigs)

On the GBA every argument and result is a 32-bit register, so a local
prototype `void F(int)` for a function defined as `void F(u8 const *)`, an
implicit declaration (result `int`) of a function returning a pointer, or
an old-style declaration called with `0` for a pointer, all work.  On a
64-bit host the pointer loses its upper half.  This compiles every C file
of the host game (tools/hostgame.py's list and flags) to LLVM IR and
compares each call's argument and result types, as the caller's
declaration makes them, with the definition's: a pointer or 64-bit integer
on one side and a narrower value on the other is reported.

It also compares each `extern` object's type with the C definition's: a
local struct that views a table (`struct SpellAssocEnt` for gSpellAssocData)
is the same size on the GBA but not on a host when one of them holds a
pointer.  Reported: an element (of an array) or object whose size differs
when either side holds a pointer.  Objects defined in assembly or by
tools/hostram.py are not checked.
"""

import argparse
import concurrent.futures
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, 'tools'))
import hostgame  # noqa: E402

DEFINE = re.compile(r'^define\s+(?:[a-z_]+\s+)*?(\S+)\s+@("?[\w.$]+"?)\((.*)\)[^(]*$')
CALL = re.compile(r'\bcall\s+(?:[a-z_]+\s+)*?(\S+?)(?:\s+\([^)]*\))?\s+@("?[\w.$]+"?)\((.*)$')


def wide(t):
    return t in ('ptr', 'i64')


def split_args(s):
    """Top-level comma split of an IR argument list, up to its closing ')'."""
    out, depth, cur = [], 0, ''
    for ch in s:
        if ch in '([{<':
            depth += 1
        elif ch in ')]}>':
            if depth == 0:
                break
            depth -= 1
        if ch == ',' and depth == 0:
            out.append(cur.strip())
            cur = ''
        else:
            cur += ch
    if cur.strip():
        out.append(cur.strip())
    return out


class Types:
    """Sizes of LLVM IR types (one file's named struct types)."""

    def __init__(self):
        self.named = {}
        self.text = {}

    def parse(self, s, i=0):
        """(size, align, has_ptr, element type text or None, end index)."""
        while s[i] == ' ':
            i += 1
        if s.startswith('ptr', i):
            return 8, 8, True, None, i + 3
        m = re.match(r'i(\d+)', s[i:])
        if m:
            n = (int(m.group(1)) + 7) // 8
            return n, min(n, 8) or 1, False, None, i + len(m.group(0))
        if s.startswith('float', i):
            return 4, 4, False, None, i + 5
        if s.startswith('double', i):
            return 8, 8, False, None, i + 6
        if s[i] == '[':
            m = re.match(r'\[(\d+) x ', s[i:])
            n = int(m.group(1))
            j = i + len(m.group(0))
            size, al, ptr, _, k = self.parse(s, j)
            return n * size, al, ptr, s[j:k], k + 1
        if s[i] == '%':
            m = re.match(r'%("[^"]+"|[\w.$]+)', s[i:])
            name = m.group(1)
            if name not in self.named and name in self.text:
                self.named[name] = (0, 1, False)  # (recursion guard)
                self.named[name] = self.parse(self.text[name])[:3]
            size, al, ptr = self.named.get(name, (0, 1, False))
            return size, al, ptr, None, i + len(m.group(0))
        packed = s.startswith('<{', i)
        if packed or s[i] == '{':
            i += 2 if packed else 1
            off, al, ptr = 0, 1, False
            while True:
                while s[i] == ' ':
                    i += 1
                if s[i] == '}':
                    i += 1
                    break
                size, a, p, _, i = self.parse(s, i)
                if not packed:
                    off = (off + a - 1) // a * a
                    al = max(al, a)
                off += size
                ptr = ptr or p
                while s[i] == ' ':
                    i += 1
                if s[i] == ',':
                    i += 1
            if packed:
                i += 1  # '>'
            size = (off + al - 1) // al * al
            return size, al, ptr, None, i
        raise ValueError(s[i:i + 20])

    def define(self, line):
        m = re.match(r'^%("[^"]+"|[\w.$]+) = type (.*)$', line)
        if m and m.group(2) != 'opaque':
            self.text[m.group(1)] = m.group(2)

    def elements(self, s):
        """For a literal struct: the sizes of its top-level members."""
        out, i = [], 1 if s.startswith('{') else 2
        while True:
            while s[i] == ' ':
                i += 1
            if s[i] == '}':
                return out
            size, _, p, _, i = self.parse(s, i)
            out.append((size, p))
            while s[i] == ' ':
                i += 1
            if s[i] == ',':
                i += 1


GLOBAL = re.compile(r'^@("?[\w.$]+"?) = (.*?)\b(global|constant) (.*)$')


def arg_type(a):
    return a.split()[0] if a else ''


def ir_of(src, flags):
    pp = subprocess.run([hostgame.CLANG] + flags + ['-E', src], capture_output=True)
    if pp.returncode:
        return src, None
    conv = subprocess.run(['iconv', '-f', 'UTF-8', '-t', 'CP932'], input=pp.stdout,
                          capture_output=True)
    cc = subprocess.run([hostgame.CLANG] + flags + ['-O0', '-x', 'cpp-output', '-S',
                         '-emit-llvm', '-w', '-', '-o', '-'], input=conv.stdout,
                        capture_output=True)
    if cc.returncode:
        return src, None
    defs, calls = {}, []
    externs, objs = {}, {}
    types = Types()
    fn = None
    lines = cc.stdout.decode(errors='replace').splitlines()
    for line in lines:
        if line.startswith('%'):
            types.define(line)
    for line in lines:
        m = GLOBAL.match(line)
        if m:
            name = m.group(1).strip('"')
            try:
                size, _, ptr, elem, end = types.parse(m.group(4))
            except (ValueError, AttributeError, IndexError):
                continue
            t = m.group(4)[:end]
            esize = eptr = None
            if elem is not None:
                esize, _, eptr, _, _ = types.parse(elem)
            elif t.startswith('{') or t.startswith('<{'):
                el = types.elements(t)
                if len(el) > 1 and len(set(e[0] for e in el)) == 1:
                    esize, eptr = el[0][0], any(e[1] for e in el)
            rec = (size, ptr, esize, eptr, t[:60])
            if 'external' in m.group(2):
                externs[name] = rec
            else:
                objs[name] = rec
            continue
        m = DEFINE.match(line)
        if m:
            fn = m.group(2).strip('"')
            defs[fn] = (m.group(1), [arg_type(a) for a in split_args(m.group(3))])
            continue
        m = CALL.search(line)
        if m and fn:
            name = m.group(2).strip('"')
            if name.startswith('llvm.'):
                continue
            calls.append((fn, name, m.group(1), [arg_type(a) for a in split_args(m.group(3))]))
    return src, (defs, calls, externs, objs)


def main():
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('-j', type=int, default=4)
    args = ap.parse_args()
    os.chdir(ROOT)
    target = ['-target', hostgame.run([hostgame.CLANG, '-print-target-triple']).strip()]
    flags = target + hostgame.CFLAGS + hostgame.include_flags()
    srcs = [s for s in hostgame.c_sources() if os.path.exists(s)]
    defs, calls = {}, []
    externs, objs = [], {}
    with concurrent.futures.ThreadPoolExecutor(args.j) as ex:
        for src, r in ex.map(lambda s: ir_of(s, flags), srcs):
            if r is None:
                print('%s: did not compile' % src)
                continue
            for k, v in r[0].items():
                defs[k] = (v[0], v[1], src)
            calls += [(src,) + c for c in r[1]]
            externs += [(src, k, v) for k, v in r[2].items()]
            for k, v in r[3].items():
                objs[k] = v + (src,)
    found = set()
    for src, caller, name, ret, targs in calls:
        if name not in defs:
            continue
        dret, dargs, dsrc = defs[name]
        why = []
        if wide(ret) != wide(dret) and ret != 'void':
            why.append('result %s, defined %s' % (ret, dret))
        for i, (a, d) in enumerate(zip(targs, dargs)):
            if wide(a) != wide(d):
                why.append('arg %d %s, defined %s' % (i + 1, a, d))
        if why:
            key = (src, caller, name, tuple(why))
            if key not in found:
                found.add(key)
                print('%s: %s calls %s (%s): %s' % (src, caller, name, dsrc, '; '.join(why)))
    print('%d mismatched calls' % len(found))
    bad = 0
    for src, name, (size, ptr, esize, eptr, t) in externs:
        if name not in objs:
            continue
        dsize, dptr, desize, deptr, dt, dsrc = objs[name]
        if esize is not None and desize is not None:
            if esize != desize and (eptr or deptr):
                bad += 1
                print('%s: %s element %s (%d bytes), defined %s (%d bytes) in %s'
                      % (src, name, t, esize, dt, desize, dsrc))
        elif esize is None and desize is None and size > dsize and (ptr or dptr):
            bad += 1
            print('%s: %s is %s (%d bytes), defined %s (%d bytes) in %s'
                  % (src, name, t, size, dt, dsize, dsrc))
    print('%d mismatched objects' % bad)
    sys.exit(1 if found or bad else 0)


if __name__ == '__main__':
    main()
