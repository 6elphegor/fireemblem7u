#!/usr/bin/env python3
"""The host build against mGBA: pictures at the checkpoints, and the sound.

    tools/hosttest.py [SCRIPT...] [--window N] [--keep]          (make hosttest)

For each script (default: tests/inputs/opening.txt and lyn.txt) it plays
fe7u.gba in mGBA (build/tools/emutest, as `tools/emutest.py record`, with
a per-frame log, the sound and the m4a mixer's output; kept in
build/hosttest/NAME/ref/ and reused while fe7u.gba and the script are
unchanged) and the host build (build/host-game/fe7u --headless, `make
host`) with the same keys, and compares:

* **Checkpoints.**  The host runs the game's logic between frames in no
  time, so where the GBA spends several frames on one step (decompressing,
  loading a map) the host is ahead: its picture of a scene comes some
  frames earlier, more as the run goes on (about 180 frames by the end of
  the opening).  So a checkpoint (`shot` in the script) counts as matched
  when mGBA's picture at that frame is, pixel for pixel, one of the host's
  pictures within --window frames of it (default 400); the offset is
  printed.  The checkpoints in EXPECTED must match: a checkpoint of them
  that doesn't fails the test (a regression).  The others are listed with
  the closest host picture's share of differing pixels, when the host's
  shot is in range; they differ by animation phase (sprites, palette
  cycles that run on their own clock) or by what is still wrong.
* **Mixer output.**  The part of the DirectSound buffer SoundMain mixed in
  each frame (emutest -P, host --mix): the share of the host's non-silent
  frames found identical in mGBA's, at an offset tracked through the run.
  Music is driven by the VBlank interrupt, so it keeps time with mGBA;
  only the moments songs and sounds start follow the game's logic.
* **Sound.**  What each plays (16-bit stereo, 32768 Hz; host --wav): the
  loudness per frame (RMS), in blocks of 300 frames, each at its best
  offset: the correlation of the two envelopes and the ratio of their
  levels.  Bit-exact isn't expected (the CGB channels are emulated per
  frame, mGBA's cycle by cycle), close is.

Output (pictures, WAV files) goes to build/hosttest/NAME/ and is ROM-derived:
never commit it.  --keep keeps the WAV and mix files (deleted otherwise:
~40 MB per script).  Exit status 1 if an expected checkpoint doesn't
match, or the mixer output or the envelope correlation is below the
script's minimum (MINIMA).
"""
import argparse
import array
import hashlib
import math
import os
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import emutest  # noqa: E402

OUT = Path("build/hosttest")
HOST = Path("build/host-game/fe7u")
ROM = Path("fe7u.gba")
SCRIPTS = ["tests/inputs/opening.txt", "tests/inputs/lyn.txt"]

# Checkpoints whose picture the host must reproduce exactly (within the
# window).  The rest differ by animation phase or are known problems (see
# docs/port-platform.md, "Test against mGBA").
EXPECTED = {
    "opening": ["boot_nintendo_presents", "opening_dragons", "opening_islands",
                "title_logo", "title_press_start", "reel_lord", "reel_cavalier",
                "reel_pegasus_knight", "reel_archer", "reel_fighter", "reel_cleric",
                "opening_again", "title_again", "opening_third", "end"],
    "lyn": ["main_menu", "file_select", "l_2", "l_3", "l_8", "l_9", "l2", "l2_2",
            "l2_3", "l2_5", "l2_6", "l2_7", "l2_8", "lyn_map", "turn_end",
            "enemy_phase_2", "enemy_phase_9", "enemy_phase_10"],
}
# Least share of the host's non-silent mixer frames found in mGBA's, and
# least median correlation of the loudness envelopes, per script (measured
# 2026-09-29: opening 97.2% and 0.955, lyn 80.3% and 0.81; lyn's sound
# effects overlap the music at other moments than in mGBA, since the host
# runs ahead, and its CGB channels are emulated per frame).
MINIMA = {"opening": (0.95, 0.92), "lyn": (0.75, 0.75)}
MINIMA_OTHER = (0.5, 0.5)
FRAME = 32768 * 280896 / 16777216   # output samples per frame (548.6)


def sha1(path):
    return hashlib.sha1(Path(path).read_bytes()).hexdigest()


def reference(script, ref):
    """mGBA's run: frames.log, shot PNGs, sound_A.wav/.mix (cached)."""
    key = f"{sha1(ROM)} {sha1(script)}\n"
    stamp = ref / "key.txt"
    if stamp.exists() and stamp.read_text() == key and (ref / "sound_A.wav").exists():
        return
    emutest.fresh_dir(ref)
    emutest.write_plan(script, ref)
    print(f"  mGBA: {ROM} (reference, cached in {ref})")
    text = emutest.run_bin(["-p", str(ref / "plan.txt"), "-o", str(ref), "-l", str(ref / "frames.log"),
                            "-w", str(ref / "sound"), "-c", "3F", "-P", emutest.sound_info(ROM), str(ROM)])
    (ref / "result.txt").write_text(text)
    stamp.write_text(key)


def read_log(path):
    return [l.split()[2] for l in open(path)]


def plan_shots(plan):
    shots = []
    for l in open(plan):
        f = l.split()
        if f and f[0] == "shot":
            shots.append((int(f[1]), f[2]))
    return shots


def diff_share(a, b):
    try:
        w, h, ra = emutest.read_png(a)
        _, _, rb = emutest.read_png(b)
    except FileNotFoundError:
        return None
    d = 0
    for y in range(h):
        if ra[y] != rb[y]:
            x, z = ra[y], rb[y]
            d += sum(1 for i in range(0, 3 * w, 3) if x[i:i + 3] != z[i:i + 3])
    return d / (w * h)


def check_pictures(name, ref, run, window):
    m, h = read_log(ref / "frames.log"), read_log(run / "host.log")
    ok, bad, report = 0, [], []
    for f, shot in plan_shots(ref / "plan.txt"):
        off = None
        for d in range(window + 1):
            for g in (f - d, f + d):
                if 0 <= g < len(h) and f < len(m) and h[g] == m[f]:
                    off = g - f
                    break
            if off is not None:
                break
        if off is not None:
            ok += 1
            report.append(f"    {shot:24s} frame {f:6d}: matched, host {off:+d}")
            continue
        share = diff_share(ref / f"{shot}.png", run / f"{shot}.png")
        note = f"same frame: {100 * share:.1f}% of pixels differ" if share is not None else ""
        exp = shot in EXPECTED.get(name, [])
        report.append(f"    {shot:24s} frame {f:6d}: {'FAIL, expected to match' if exp else 'no match'} {note}")
        if exp:
            bad.append(shot)
    print(f"  checkpoints: {ok} of {ok + len(bad) + sum(1 for r in report if 'no match' in r)} matched")
    for r in report:
        print(r)
    return bad


def mix_records(path, n=448):
    d = Path(path).read_bytes()
    return [d[i:i + n] for i in range(0, len(d) - n + 1, n)]


def check_mix(ref, run, window=600):
    a, b = mix_records(ref / "sound_A.mix"), mix_records(run / "host.mix")
    where = {}
    for i, r in enumerate(a):
        where.setdefault(r, []).append(i)
    silent = bytes(448)
    found = total = 0
    off = 0
    for i, r in enumerate(b):
        if r == silent:
            continue
        total += 1
        best = None
        for j in where.get(r, []):
            if abs(j - i - off) <= window and (best is None or abs(j - i - off) < abs(best - i - off)):
                best = j
        if best is not None:
            found += 1
            off = best - i
    share = found / total if total else 1.0
    print(f"  mixer output: {found} of {total} non-silent host frames identical to mGBA's "
          f"({100 * share:.1f}%; mGBA {len(a)}, host {len(b)} frames)")
    return share


def envelope(path):
    s = array.array("h", Path(path).read_bytes()[44:])
    if sys.byteorder != "little":
        s.byteswap()
    env = []
    nf = int(len(s) / 2 / FRAME)
    for k in range(nf):
        lo, hi = int(k * FRAME) * 2, int((k + 1) * FRAME) * 2
        seg = s[lo:hi]
        env.append(math.sqrt(sum(v * v for v in seg) / max(1, len(seg))))
    return env


def corr(x, y):
    n = len(x)
    mx, my = sum(x) / n, sum(y) / n
    sxy = sum((a - mx) * (b - my) for a, b in zip(x, y))
    sxx = sum((a - mx) ** 2 for a in x)
    syy = sum((b - my) ** 2 for b in y)
    if sxx == 0 or syy == 0:
        return None
    return sxy / math.sqrt(sxx * syy)


def check_sound(ref, run, window, block=300):
    a, b = envelope(ref / "sound_A.wav"), envelope(run / "host.wav")
    cs, ratios = [], []
    for k in range(0, len(a) - block, block):
        x = a[k:k + block]
        if max(x) < 50:
            continue  # silence
        best = None
        for d in range(-window, 61, 2):   # the host runs ahead: look back mostly
            if k + d < 0 or k + d + block > len(b):
                continue
            y = b[k + d:k + d + block]
            c = corr(x, y)
            if c is not None and (best is None or c > best[0]):
                best = (c, d, sum(y) / max(1e-9, sum(x)))
        if best:
            cs.append(best[0])
            ratios.append(best[2])
    if not cs:
        print("  sound: no sound in mGBA's recording?")
        return 0.0
    cs.sort()
    ratios.sort()
    med = cs[len(cs) // 2]
    print(f"  sound: {len(cs)} blocks of {block} frames; loudness envelope correlation median "
          f"{med:.3f} (lowest {cs[0]:.3f}), host/mGBA level median {ratios[len(ratios) // 2]:.2f}")
    return med


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("scripts", nargs="*", default=SCRIPTS)
    p.add_argument("--window", type=int, default=400, help="frames the host may be off (default 400)")
    p.add_argument("--keep", action="store_true", help="keep the WAV and mix files")
    args = p.parse_args()

    if not HOST.exists():
        raise SystemExit(f"{HOST} is missing: make host")
    failed = False
    for script in args.scripts:
        name = Path(script).stem
        ref, run = OUT / name / "ref", OUT / name / "host"
        print(f"== {name}")
        reference(script, ref)
        emutest.fresh_dir(run)
        print(f"  host: {HOST}")
        r = subprocess.run([str(HOST), "--headless", "--input", str(ref / "plan.txt"),
                            "--dump-frames", str(run), "--log", str(run / "host.log"),
                            "--wav", str(run / "host.wav"), "--mix", str(run / "host.mix")],
                           capture_output=True, text=True)
        if r.returncode:
            sys.stderr.write(r.stdout + r.stderr)
            print(f"  host: exit status {r.returncode}")
            failed = True
            continue
        bad = check_pictures(name, ref, run, args.window)
        mix = check_mix(ref, run)
        med = check_sound(ref, run, args.window)
        min_mix, min_corr = MINIMA.get(name, MINIMA_OTHER)
        if bad or mix < min_mix or med < min_corr:
            failed = True
            print(f"  FAIL: {', '.join(bad)}{' mixer output' if mix < min_mix else ''}"
                  f"{' sound' if med < min_corr else ''}")
        else:
            print("  OK")
        if not args.keep:
            for f in (run / "host.wav", run / "host.mix", run / "host.mix.psg"):
                f.unlink(missing_ok=True)
    sys.exit(1 if failed else 0)


if __name__ == "__main__":
    main()
