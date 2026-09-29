#!/usr/bin/env python3
"""Check platform/ppu.c against mGBA on the runtime test scripts.

  platform/tools/ppucompare.py [SCRIPT...] [-a ROM] [--every N] [--dump] [--hardware]

Runs each tests/inputs/*.txt script (all of them by default) in mGBA through
build/platform/ppucapture, which renders every Nth frame with the platform
PPU twice (line by line during mGBA's frame, and from one dump of the frame)
and compares both with mGBA's picture.  Output: build/platform/ppucompare/
SCRIPT/ (PNGs of the first differing frames: mGBA | platform | diff; with
--dump, a .ppu dump at every `shot` for platform/tools/ppurender).
The exit status is 1 if a live (line by line) render differs.
"""
import argparse
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "tools"))
import emutest  # noqa: E402  (plan compiler, library path set-up)

BIN = Path("build/platform/ppucapture")
OUT = Path("build/platform/ppucompare")


def run(script, rom, every, dump, hardware, pngs):
    name = Path(script).stem
    out = OUT / name
    out.mkdir(parents=True, exist_ok=True)
    emutest.write_plan(script, out)
    args = [str(BIN), "-p", str(out / "plan.txt"), "-o", str(out), "-e", str(every), "-d", str(pngs)]
    if dump:
        args.append("-D")
    if hardware:
        args.append("-m")
    p = subprocess.run(args + [rom], capture_output=True, text=True, env=emutest.environment())
    if p.returncode:
        sys.stderr.write(p.stderr)
        raise SystemExit(f"ppucapture failed on {script}")
    (out / "log.txt").write_text(p.stdout)
    summary = {}
    diffs = {"live": [], "frame": []}
    for line in p.stdout.splitlines():
        f = line.split()
        if f[0] == "summary":
            summary = {f[i]: int(f[i + 1]) for i in range(1, len(f) - 1, 2)}
        elif f[0] == "diff":
            diffs[f[1]].append((int(f[2]), int(f[3]), "perline" in f))
    return name, summary, diffs


def ranges(frames):
    out, start, prev = [], None, None
    for fr in frames:
        if start is None:
            start = prev = fr
        elif fr == prev + 1:
            prev = fr
        else:
            out.append((start, prev))
            start = prev = fr
    if start is not None:
        out.append((start, prev))
    return ", ".join(f"{a}" if a == b else f"{a}-{b}" for a, b in out[:12]) + (" ..." if len(out) > 12 else "")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("scripts", nargs="*")
    ap.add_argument("-a", "--rom", default="fe7u.gba")
    ap.add_argument("--every", type=int, default=1)
    ap.add_argument("--dump", action="store_true")
    ap.add_argument("--hardware", action="store_true", help="hardware color math (differs from mGBA by design)")
    ap.add_argument("--pngs", type=int, default=4)
    a = ap.parse_args()
    scripts = a.scripts or sorted(str(p) for p in Path("tests/inputs").glob("*.txt"))
    total = {}
    bad = False
    print(f"{'script':10} {'frames':>7} {'live same':>10} {'dump same':>10} {'per-line':>9} {'static, dump same':>18}")
    for s in scripts:
        name, sm, diffs = run(s, a.rom, a.every, a.dump, a.hardware, a.pngs)
        for k, v in sm.items():
            total[k] = total.get(k, 0) + v
        print(f"{name:10} {sm['frames']:7} {sm['live_same']:10} {sm['frame_same']:10} "
              f"{sm['perline_frames']:9} {sm['static_frame_same']:8} / {sm['static_frames']}")
        if diffs["live"]:
            bad = True
            print(f"  live differs: {len(diffs['live'])} frames: {ranges([d[0] for d in diffs['live']])}")
        static = [d for d in diffs["frame"] if not d[2]]
        if static:
            print(f"  dump differs without per-line changes: {len(static)} frames: {ranges([d[0] for d in static])}")
    t = total
    if t:
        pct = lambda n, d: f"{100.0 * n / d:.3f}%" if d else "-"
        print(f"\nall: {t['frames']} frames compared ({t['forced_blank']} in forced blank)")
        print(f"  line by line: {t['live_same']} identical ({pct(t['live_same'], t['frames'])}), "
              f"{t['live_pixels']} pixels differ in all")
        print(f"  from one dump: {t['frame_same']} identical ({pct(t['frame_same'], t['frames'])}); "
              f"frames without mid-frame changes: {t['static_frame_same']} / {t['static_frames']} "
              f"({pct(t['static_frame_same'], t['static_frames'])}); with: {t['perline_frame_same']} / "
              f"{t['perline_frames']}")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
