#!/usr/bin/env python3
"""Rewrite the game's GBA data assembly for the host's assembler (Mach-O or ELF).

    tools/hostasm.py [--macho|--elf] IN.s OUT.s

The data sources (data/rom/*.s, sound/sound.s and the songs it includes,
build/msg_bits.s) are written for arm-none-eabi-as.  They only hold labels,
bytes, `.incbin` chunks and a few directives, so a line-by-line rewrite makes
them portable (docs/port-notes.md, "Host link"):

* `.include` is inlined (searched in the file's directory, asm/, include/ and
  the repository root), so one output file stands for the whole input.
* `@` comments are dropped (on AArch64 `@` is not a comment).
* `.section NAME, ...` becomes the host's read-only data section
  (`__DATA,__const` on Mach-O, `.rodata` on ELF), started at the GBA address
  in NAME modulo 4 (`.rodata.083FC9FB`: 4-aligned, then 3 bytes), so what
  is aligned on the GBA is aligned on the host; the sections keep their order
  in the file.
* Symbols get the C prefix of the target (`_` on Mach-O): label definitions,
  `.global`, `.set` names and every symbol in an expression, but not the
  `.equ` constants (MPlayDef.s' command names).
* `.align N` is `.p2align N` (what it means on ARM ELF).
* symbols.ld's aliases (`NAME = LABEL [+ N];`) of a label the file defines
  are added as `.set` (the host link has no linker script; hostgame.py
  passes the ones of C symbols to the linker as `-alias`).
* `.4byte` / `.word` / `.long` with a plain number stay 4-byte numbers.  A
  4-byte word that names a symbol would be a GBA pointer: in the music track
  streams (sound/) it is a GOTO / PATT / REPT / MEMACC / xWAVE address and is
  written as its **offset from gHostSoundBase**, a label at the start of the
  file's data: `.long TARGET - _gHostSoundBase` (both in the one data section
  of the file, so the assembler computes it).  The engine's M4aReadAddr
  passes the 32-bit value to M4aHostRomAddr (src/host/hostglue.c), which
  returns gHostSoundBase + value (docs/port-data.md, "Music and text").
  Anywhere else it is an error: the object must be converted to C
  (docs/port-data.md).
"""

import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

IDENT = re.compile(r'(?<![\w.$])([A-Za-z_.$][\w.$]*)')
NUMBER_ONLY = re.compile(r'^[\s0-9a-fA-FxX+\-*/()<>|&~^,]*$')


def strip_comment(line):
    out, q = [], False
    for ch in line:
        if ch == '"':
            q = not q
        elif ch == '@' and not q:
            break
        out.append(ch)
    return ''.join(out).rstrip()


def find_include(name, cur_dir):
    for d in (cur_dir, os.path.join(ROOT, 'asm'), os.path.join(ROOT, 'include'), ROOT):
        p = os.path.join(d, name)
        if os.path.exists(p):
            return p
    sys.exit('hostasm: include %s not found' % name)


def read_lines(path, seen=None):
    """The file's lines with .include inlined, comments dropped."""
    out = []
    cur_dir = os.path.dirname(os.path.abspath(path))
    for raw in open(path, encoding='utf-8'):
        line = strip_comment(raw.rstrip('\n'))
        m = re.match(r'^\s*\.include\s+"([^"]+)"', line)
        if m:
            out.extend(read_lines(find_include(m.group(1), cur_dir)))
            continue
        out.append(line)
    return out


def section_offset(name):
    """The GBA address a section name carries, modulo 4 (0 without one)."""
    m = re.search(r'([0-9A-Fa-f]{7,8})$', name)
    return int(m.group(1), 16) & 3 if m else 0


def convert(lines, macho, stream_words):
    prefix = '_' if macho else ''
    # .equ / numeric .set names are assembler constants: not symbols
    consts = set()
    for line in lines:
        m = re.match(r'^\s*\.(equ|set)\s+([\w.$]+)\s*,\s*(.*)$', line)
        if m and (m.group(1) == 'equ' or
                  not re.search(r'[A-Za-z_]', re.sub(r'0[xX][0-9a-fA-F]+', '', m.group(3)))):
            consts.add(m.group(2))

    def sym(expr):
        def rep(m):
            t = m.group(1)
            if t in consts or t.startswith('.') or re.match(r'^[0-9]', t):
                return t
            return prefix + t
        # hex digits after 0x are not identifiers
        parts = re.split(r'(0[xX][0-9a-fA-F]+|"[^"]*")', expr)
        return ''.join(p if i % 2 else IDENT.sub(rep, p) for i, p in enumerate(parts))

    section = '__DATA,__const' if macho else '.rodata'
    out = []
    if stream_words:
        # the base of the stored stream addresses (M4aHostRomAddr)
        out += ['\t.section %s' % section, '\t.p2align 2',
                '\t.globl %sgHostSoundBase' % prefix, '%sgHostSoundBase:' % prefix]
    last_label = None
    here = set()   # labels defined at the current position
    for line in lines:
        s = line.strip()
        if not s:
            continue
        if not re.match(r'^([A-Za-z_.$][\w.$]*):\s*$', s) and not s.startswith(('.global', '.globl')):
            here = set()
        m = re.match(r'^\.section\s+([^\s,]+)', s)
        if m:
            out.append('\t.section %s' % section)
            # every section starts at its GBA address modulo 4, so the
            # objects in it are as aligned as on the GBA (sections are
            # contiguous in one host section, and C objects of data/layout.txt
            # sit between them on the GBA)
            out.append('\t.p2align 2')
            if section_offset(m.group(1)):
                out.append('\t.space %d' % section_offset(m.group(1)))
            continue
        m = re.match(r'^\.(?:global|globl)\s+(\S+)$', s)
        if m:
            out.append('\t.globl %s' % sym(m.group(1)))
            continue
        m = re.match(r'^([A-Za-z_.$][\w.$]*):(.*)$', s)
        if m:
            last_label = m.group(1)
            # GNU as accepts a label defined twice at the same place (some
            # generated files repeat them); the host assemblers do not
            if m.group(1) not in here or m.group(2).strip():
                if relayout_rule(m.group(1)):
                    out.append('\t.p2align 3')
                out.append('%s:' % sym(m.group(1)))
            here.add(m.group(1))
            if m.group(2).strip():
                out.append('\t' + m.group(2).strip())
            continue
        m = re.match(r'^\.(equ|set)\s+([\w.$]+)\s*,\s*(.*)$', s)
        if m:
            name = m.group(2)
            if name in consts:
                out.append('\t.%s %s, %s' % (m.group(1), name, m.group(3)))
            else:
                out.append('\t.set %s, %s' % (sym(name), sym(m.group(3))))
            continue
        m = re.match(r'^\.align\s+(.*)$', s)
        if m:
            out.append('\t.p2align ' + m.group(1))
            continue
        m = re.match(r'^\.(4byte|word|long|int)\s+(.*)$', s)
        if m:
            words = [w.strip() for w in m.group(2).split(',')]
            res = []
            for w in words:
                if re.search(r'[A-Za-z_]', re.sub(r'0[xX][0-9a-fA-F]+', '', w)) and \
                        any(t not in consts for t in IDENT.findall(w)):
                    if not stream_words:
                        sys.exit('hostasm: a 4-byte pointer word (%s) cannot hold a host '
                                 'address; convert its object to C' % s)
                    res.append('(%s) - %sgHostSoundBase' % (sym(w), prefix))
                else:
                    res.append(w)
            # one word per line: `.` is the address of the word itself
            for r in res:
                out.append('\t.long ' + r)
            continue
        m = re.match(r'^\.incbin\s+"([^"]+)"\s*(?:,\s*([^,]+?)\s*(?:,\s*(.+?)\s*)?)?$', s)
        if m and last_label and relayout_rule(last_label):
            out.extend(relayout(last_label, incbin_data(m.group(1), m.group(2), m.group(3))))
            continue
        if m:
            # inlined: LLVM's assembler maps the whole file again for every
            # `.incbin`, so the thousands of baserom.gba chunks in data/rom
            # took gigabytes per file and froze the machine
            out.extend(incbin_bytes(m.group(1), m.group(2), m.group(3)))
            continue
        if re.match(r'^\.(byte|2byte|hword|short|space|skip|fill|zero|ascii|asciz|string)\b', s):
            out.append('\t' + (sym(s) if s.startswith(('.byte', '.2byte', '.hword', '.short'))
                               else s))
            continue
        if re.match(r'^\.(text|data|arm|thumb|syntax|end)\b', s):
            continue
        if s.startswith('.macro') or s.startswith('.endm'):
            sys.exit('hostasm: macros are not handled: %s' % s)
        out.append('\t' + s)
    return out


_files = {}


# Objects left as bytes whose C type holds a pointer the ROM stores as 0
# (docs/port-notes.md, "Host link"): each record is re-laid out for the host,
# the 4-byte words at the given offsets becoming 8-byte pointers (8-aligned),
# the record padded to 8.  label regex: (GBA record size, pointer offsets).
RELAYOUT = [
    (r'^Glyph_', 0x48, [0]),   # struct Glyph (include/gbafe/text.h): next, all NULL
]


def relayout_rule(label):
    for rx, size, ptrs in RELAYOUT:
        if re.match(rx, label):
            return size, ptrs
    return None


def relayout(label, data):
    size, ptrs = relayout_rule(label)
    if len(data) % size:
        sys.exit('hostasm: %s is not a whole number of 0x%X-byte records' % (label, size))
    out = []
    for r in range(0, len(data), size):
        rec = data[r:r + size]
        pos, hpos = 0, 0
        for p in sorted(ptrs) + [size]:
            chunk = rec[pos:p]
            for i in range(0, len(chunk), 32):
                out.append('\t.byte ' + ','.join(str(b) for b in chunk[i:i + 32]))
            hpos += len(chunk)
            if p == size:
                break
            if int.from_bytes(rec[p:p + 4], 'little') != 0:
                sys.exit('hostasm: %s+0x%X: a pointer the host cannot relocate' % (label, r + p))
            if hpos % 8:
                out.append('\t.space %d' % (8 - hpos % 8))
                hpos += 8 - hpos % 8
            out.append('\t.quad 0')
            hpos += 8
            pos = p + 4
        if hpos % 8:
            out.append('\t.space %d' % (8 - hpos % 8))
    return out


def incbin_data(path, offset, length):
    if path not in _files:
        with open(os.path.join(ROOT, path), 'rb') as f:
            _files[path] = f.read()
    data = _files[path]
    start = int(offset, 0) if offset else 0
    end = start + int(length, 0) if length else len(data)
    if end > len(data):
        sys.exit('hostasm: .incbin "%s" past the end of the file' % path)
    return data[start:end]


def incbin_bytes(path, offset, length):
    """`.incbin PATH[, OFFSET[, LENGTH]]` as `.byte` lines (paths are relative
    to the repository root, as for arm-none-eabi-as run by make)."""
    if path not in _files:
        with open(os.path.join(ROOT, path), 'rb') as f:
            _files[path] = f.read()
    data = _files[path]
    start = int(offset, 0) if offset else 0
    end = start + int(length, 0) if length else len(data)
    if end > len(data):
        sys.exit('hostasm: .incbin "%s" past the end of the file' % path)
    return ['\t.byte ' + ','.join(str(b) for b in data[i:min(i + 32, end)])
            for i in range(start, end, 32)]


def ld_aliases(lines, macho):
    """symbols.ld's `NAME = LABEL [+ N];` for the labels this file defines:
    the host has no linker script, so the alias is set here."""
    prefix = '_' if macho else ''
    labels = set()
    for line in lines:
        m = re.match(r'^\s*([A-Za-z_.$][\w.$]*):', line)
        if m:
            labels.add(m.group(1))
    out = []
    for line in open(os.path.join(ROOT, 'symbols.ld')):
        m = re.match(r'^\s*([A-Za-z_]\w*)\s*=\s*([A-Za-z_]\w*)\s*(?:\+\s*(0[xX][0-9a-fA-F]+|\d+))?\s*;', line)
        if m and m.group(2) in labels:
            out.append('\t.globl %s%s' % (prefix, m.group(1)))
            out.append('\t.set %s%s, %s%s + %s' % (prefix, m.group(1), prefix, m.group(2),
                                                   m.group(3) or '0'))
    return out


def main():
    args = sys.argv[1:]
    macho = sys.platform == 'darwin'
    if args and args[0] in ('--macho', '--elf'):
        macho = args.pop(0) == '--macho'
    if len(args) != 2:
        sys.exit(__doc__)
    src, dst = args
    lines = read_lines(src)
    stream = os.path.relpath(os.path.abspath(src), ROOT).startswith('sound' + os.sep)
    out = convert(lines, macho, stream)
    out += ld_aliases(lines, macho)
    os.makedirs(os.path.dirname(dst) or '.', exist_ok=True)
    with open(dst, 'w') as f:
        f.write('/* generated by tools/hostasm.py from %s */\n' % src)
        f.write('\n'.join(out) + '\n')


if __name__ == '__main__':
    main()
