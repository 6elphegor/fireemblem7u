#!/usr/bin/env python3
"""Compile every C file with the host's clang, as a PC port would, and report.

    tools/hostcheck.py [-j N] [--target TRIPLE ...] [--list CATEGORY] [FILE.c ...]

Each file in src/ and src/data/ (or the ones given) is compiled with
-DNONMATCHING=1 for every target (default: x86_64-linux-gnu, an ELF/LP64
target, and the host's own, e.g. arm64-apple-macosx: Mach-O/LP64) into
build/host/TRIPLE/src/NAME.o; the compiler's messages go to NAME.log next to
it.  A file is only compiled again when it, a header it includes (from the
.d file clang writes) or the flags changed, so a rerun takes a second.

The report lists, per target, the files that failed, every error, and the
warnings counted by category (clang's -W option name), each warning counted
once however many files include the header it is in.  `--list CATEGORY`
prints the file:line of each warning in that category (e.g.
`--list int-to-pointer-cast`, `--list error`).  Exit status: 1 if any file
has an error.

No libc for the targets is needed: the headers are clang's own freestanding
ones (stddef.h, stdint.h, limits.h: LP64 sizes) and, for the few libc
functions the game declares through <stdlib.h>/<string.h>, agbcc's newlib
headers.  The source is compiled as it is (UTF-8), without the CP932
conversion the GBA build applies.
"""

import argparse
import concurrent.futures
import glob
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join('build', 'host')
CLANG = os.environ.get('HOSTCHECK_CC', 'clang')
DEFAULT_TARGETS = ['x86_64-linux-gnu', 'native']

# gnu89: the dialect the game is written in (implicit int, old-style
# definitions); PLATFORM_GBA is not defined, so the GBA-only attributes
# (link sections) compile away (include/gbafe/global.h).
FLAGS = ['-std=gnu89', '-O0', '-ffreestanding', '-fno-common', '-nostdinc',
         '-DNONMATCHING=1', '-fdiagnostics-show-option',
         '-fno-caret-diagnostics', '-fno-color-diagnostics',
         '-ferror-limit=0', '-Wno-unknown-pragmas']


def native_triple():
    out = subprocess.run([CLANG, '-print-target-triple'], capture_output=True,
                         text=True).stdout.strip()
    # arm64-apple-darwin25.5.0 -> arm64-apple-macosx (a stable directory name)
    return re.sub(r'-apple-darwin[0-9.]*$', '-apple-macosx', out) or 'native'


def include_flags():
    res = subprocess.run([CLANG, '-print-resource-dir'], capture_output=True,
                         text=True).stdout.strip()
    return ['-isystem', os.path.join(res, 'include'),
            '-isystem', 'tools/agbcc/include', '-iquote', 'include',
            '-iquote', '.']


def sources(args):
    if args:
        return [os.path.relpath(os.path.abspath(a), ROOT) for a in args]
    return sorted(glob.glob('src/*.c')) + sorted(glob.glob('src/data/*.c'))


def paths(triple, src):
    base = os.path.join(OUT, triple, os.path.splitext(src)[0])
    return base + '.o', base + '.log', base + '.d', base + '.flags'


def up_to_date(log, dep, flagfile, flagsig):
    try:
        t = os.path.getmtime(log)
        with open(flagfile) as f:
            if f.read() != flagsig:
                return False
        with open(dep) as f:
            deps = f.read().replace('\\\n', ' ').split(':', 1)[1].split()
    except (OSError, IndexError):
        return False
    for d in deps:
        try:
            if os.path.getmtime(d) > t:
                return False
        except OSError:
            return False
    return True


def compile_one(triple, src, cmdbase, flagsig):
    obj, log, dep, flagfile = paths(triple, src)
    if up_to_date(log, dep, flagfile, flagsig):
        return False
    os.makedirs(os.path.dirname(obj), exist_ok=True)
    for p in (obj, dep):
        if os.path.exists(p):
            os.remove(p)
    cmd = cmdbase + ['-c', src, '-o', obj, '-MMD', '-MF', dep]
    r = subprocess.run(cmd, capture_output=True, text=True)
    with open(log, 'w') as f:
        f.write(r.stderr)
    if not os.path.exists(dep):
        # Failed before writing dependencies: keep the source as the only one.
        with open(dep, 'w') as f:
            f.write('%s: %s\n' % (log, src))
    with open(flagfile, 'w') as f:
        f.write(flagsig)
    return True


DIAG = re.compile(r'^(?P<loc>[^:\s][^:]*:\d+:\d+): (?P<kind>warning|error): '
                  r'(?P<msg>.*?)(?: \[(?P<opt>-W[^\],]+)[^\]]*\])?$')


def error_category(msg):
    """A short, stable name for an error message (errors have no -W name)."""
    m = msg
    m = re.sub(r"'[^']*'", "'X'", m)
    m = re.sub(r'"[^"]*"', '"X"', m)
    m = re.sub(r'\b\d+\b', 'N', m)
    return m


def parse(triple, srcs):
    """{(loc, kind, cat, msg)} across all logs, plus the files with errors."""
    diags = {}
    failed = []
    for src in srcs:
        obj, log, _, _ = paths(triple, src)
        try:
            text = open(log).read()
        except OSError:
            continue
        bad = False
        for line in text.splitlines():
            m = DIAG.match(line)
            if not m:
                continue
            kind = m.group('kind')
            if kind == 'error':
                bad = True
                cat = 'error: ' + error_category(m.group('msg'))
            else:
                # clang's option name; the message pattern if it has none
                cat = m.group('opt') or error_category(m.group('msg'))
            key = (m.group('loc'), kind, cat)
            diags.setdefault(key, m.group('msg'))
        if bad or not os.path.exists(obj):
            failed.append(src)
    return diags, failed


def main():
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('-j', type=int, default=os.cpu_count() or 4)
    ap.add_argument('--target', action='append',
                    help='clang target triple (repeatable); "native" = the host')
    ap.add_argument('--list', metavar='CATEGORY',
                    help='print each warning of a category (or "error")')
    ap.add_argument('--flags', default=os.environ.get('HOSTCHECK_FLAGS', ''),
                    help='extra compiler flags, e.g. "-Wall"')
    ap.add_argument('files', nargs='*')
    args = ap.parse_args()
    os.chdir(ROOT)

    targets = [native_triple() if t == 'native' else t
               for t in (args.target or DEFAULT_TARGETS)]
    targets = list(dict.fromkeys(targets))
    srcs = sources(args.files)
    incs = include_flags()
    status = 0
    for triple in targets:
        cmdbase = [CLANG, '-target', triple] + FLAGS + incs + args.flags.split()
        flagsig = ' '.join(cmdbase)
        with concurrent.futures.ThreadPoolExecutor(args.j) as ex:
            built = sum(ex.map(lambda s: compile_one(triple, s, cmdbase, flagsig),
                               srcs))
        diags, failed = parse(triple, srcs)
        errors = sorted(k for k in diags if k[1] == 'error')
        warns = [k for k in diags if k[1] == 'warning']
        cats = {}
        for k in warns:
            cats[k[2]] = cats.get(k[2], 0) + 1

        print('== %s: %d files (%d compiled now), %d with errors, '
              '%d errors, %d warnings' % (triple, len(srcs), built,
                                           len(failed), len(errors), len(warns)))
        if args.list:
            want = args.list
            if want != 'error' and not want.startswith('-W') and ' ' not in want:
                want = '-W' + want
            for k in sorted(diags, key=lambda k: loc_key(k[0])):
                if (want == 'error' and k[1] == 'error') or k[2] == want:
                    print('  %s: %s' % (k[0], diags[k]))
            continue
        for k in errors:
            print('  %s: error: %s' % (k[0], diags[k]))
        for cat, n in sorted(cats.items(), key=lambda x: (-x[1], x[0])):
            print('  %5d  %s' % (n, cat))
        if failed:
            print('  failed (%d): %s' % (len(failed), ' '.join(failed[:20])
                                          + (' ...' if len(failed) > 20 else '')))
            status = 1
    return status


def loc_key(loc):
    f, l, c = loc.rsplit(':', 2)
    return (f, int(l), int(c))


if __name__ == '__main__':
    sys.exit(main())
