#!/usr/bin/env python3
"""Run every input script on the native game and report the frames reached.

    tools/hostrun.py [--exe build/host-game/fe7u] [--time 600] [SCRIPT...]
                                                            (make hostrun)

Each script (default: tests/inputs/*.txt) runs headless, without a save
file, one at a time, to its last frame.  A crash prints "fe7u: signal N in
frame F" (src/host/hostglue.c), which gives the frame reached; a run that
passes --time seconds is stopped.  The exit status is 1 unless every script
ran to its end.
"""

import argparse
import glob
import os
import re
import subprocess
import sys
import time

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, 'tools'))
from emutest import compile_script  # noqa: E402


def run_one(exe, script, limit):
    frames = compile_script(script)[0]
    t0 = time.time()
    try:
        r = subprocess.run([exe, '--headless', '--no-save', '--input', script],
                           capture_output=True, text=True, timeout=limit)
    except subprocess.TimeoutExpired:
        return frames, None, 'timeout after %ds' % limit, time.time() - t0
    dt = time.time() - t0
    m = re.search(r'fe7u: signal (\d+) in frame (\d+)', r.stderr)
    if r.returncode == 0:
        return frames, frames, 'ok', dt
    if m:
        return frames, int(m.group(2)), 'signal %s' % m.group(1), dt
    last = (r.stderr.strip().splitlines() or ['?'])[-1]
    return frames, None, 'exit %d: %s' % (r.returncode, last[:80]), dt


def main():
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--exe', default='build/host-game/fe7u')
    ap.add_argument('--time', type=int, default=600, help='seconds per script')
    ap.add_argument('scripts', nargs='*')
    args = ap.parse_args()
    os.chdir(ROOT)
    scripts = args.scripts or sorted(glob.glob('tests/inputs/*.txt'))
    bad = 0
    print('%-10s %8s %8s  %6s  %s' % ('script', 'reached', 'frames', 'time', 'result'))
    for s in scripts:
        frames, reached, what, dt = run_one(args.exe, s, args.time)
        name = os.path.splitext(os.path.basename(s))[0]
        print('%-10s %8s %8d  %5.1fs  %s' % (name, '?' if reached is None else reached,
                                             frames, dt, what), flush=True)
        bad += what != 'ok'
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
