#!/usr/bin/env python3
"""Runtime test: play ROMs through scripted inputs in mGBA and compare them.

  tools/emutest.py compare [SCRIPT...] [-a ROM_A] [-b ROM_B]   (make emutest)
  tools/emutest.py record SCRIPT [-a ROM] [--every N]          (one ROM, PNGs)
  tools/emutest.py sheet OUT.png COLS PNG...                   (contact sheet)

`compare` runs ROM A (default fe7u.gba) and ROM B (default
build/shift/s.gba, the `make shifttest` build) side by side in one process,
frame by frame with the same keys, from power-on with an empty save, and
reports the first frame where the pictures differ (side-by-side PNGs
A | B | differing pixels in magenta), the first frame where memory differs
and the words that differ, and the first frame where the sound differs.
Without SCRIPT it runs every tests/inputs/*.txt.  Output goes to
build/emutest/<script>/.  The exit status is 1 if any run diverged.

Memory: EWRAM, IWRAM, VRAM, palette and OAM are compared every frame.  RAM
legitimately holds ROM data addresses, which differ when the data moved, so
when both ROMs have an ELF next to them (NAME.elf; fe7u.elf for fe7u.gba and
baserom.gba) every RAM word that falls in a symbol of B's data is compared
as the address of the same symbol (plus offset) in A (or as is: RAM also
holds code copied from ROM).  A pointer that was left as raw bytes in the
data still holds A's address in B, so it compares equal itself; what shows
is the data B loaded through it (VRAM, palettes, RAM buffers).

Input scripts (tests/inputs/*.txt), one command per line, `#` comments:

  wait N                  N frames with no keys
  hold KEYS N             hold KEYS for N frames
  press KEYS [COUNT] [GAP]  press KEYS COUNT times (default 1): 2 frames
                          down, then GAP frames up (default 14)
  shot NAME               checkpoint: PNG of A (and A|B if they differ),
                          plus video and memory hashes, at the current frame
                          (repeated names get _2, _3...)
  repeat N ... end        repeat a block
  sram DESC               (first line only) boot with the save memory that
                          tools/mksave.py makes from DESC (tests/saves/*.txt:
                          a later chapter with a party, the extras unlocked);
                          without it the save memory starts empty

KEYS: A B Select Start Right Left Up Down R L, joined with `+` (`A+B`).
"""
import argparse
import glob
import os
import re
import struct
import subprocess
import sys
import zlib
from pathlib import Path

KEYS = {"a": 0, "b": 1, "select": 2, "start": 3, "right": 4, "left": 5,
        "up": 6, "down": 7, "r": 8, "l": 9}
BIN = Path("build/tools/emutest")
OUT = Path("build/emutest")


# ---- input scripts ----

def keymask(spec):
    m = 0
    for k in spec.split("+"):
        if k.lower() not in KEYS:
            raise SystemExit(f"unknown key {k!r}")
        m |= 1 << KEYS[k.lower()]
    return m


def compile_script(path):
    """Script -> (frames, [(frame, keymask)], [(frame, name)], sram DESC or None)."""
    lines = []
    for n, l in enumerate(Path(path).read_text().splitlines(), 1):
        l = l.split("#", 1)[0].split()
        if l:
            lines.append((n, l))
    events, shots, used = [], [], set()
    frame = 0
    sram = None

    def setkeys(m):
        if events and events[-1][0] == frame:
            events[-1] = (frame, m)
        else:
            events.append((frame, m))

    def run(block):
        nonlocal frame, sram
        i = 0
        while i < len(block):
            n, (cmd, *args) = block[i]
            try:
                if cmd == "repeat":
                    depth, j = 1, i + 1
                    while depth:
                        if j >= len(block):
                            raise SystemExit(f"{path}:{n}: repeat without end")
                        depth += {"repeat": 1, "end": -1}.get(block[j][1][0], 0)
                        j += 1
                    for _ in range(int(args[0])):
                        run(block[i + 1:j - 1])
                    i = j
                    continue
                if cmd == "wait":
                    setkeys(0)
                    frame += int(args[0])
                elif cmd == "hold":
                    setkeys(keymask(args[0]))
                    frame += int(args[1])
                    setkeys(0)
                elif cmd == "press":
                    count = int(args[1]) if len(args) > 1 else 1
                    gap = int(args[2]) if len(args) > 2 else 14
                    for _ in range(count):
                        setkeys(keymask(args[0]))
                        frame += 2
                        setkeys(0)
                        frame += gap
                elif cmd == "sram":
                    if frame or events or shots or sram:
                        raise SystemExit(f"{path}:{n}: sram must come first")
                    sram = args[0]
                elif cmd == "shot":
                    # the frame just run (the picture after the previous command)
                    name, k = args[0], 1
                    while name in used:  # inside a repeat: NAME_2, NAME_3...
                        k += 1
                        name = f"{args[0]}_{k}"
                    used.add(name)
                    shots.append((max(frame - 1, 0), name))
                else:
                    raise SystemExit(f"{path}:{n}: unknown command {cmd!r}")
            except (IndexError, ValueError):
                raise SystemExit(f"{path}:{n}: bad arguments")
            i += 1

    run(lines)
    return frame, events, shots, sram


def write_plan(script, out):
    frames, events, shots, sram = compile_script(script)
    with open(out / "plan.txt", "w") as f:
        f.write(f"frames {frames}\n")
        if sram:
            # (reads base stats and item uses from baserom.gba: the same
            # values in every build, so A and B boot with the same image)
            subprocess.run([sys.executable, "tools/mksave.py", sram, str(out / "sram.bin")],
                           check=True)
            f.write(f"sram {out / 'sram.bin'}\n")
        for fr, m in events:
            f.write(f"keys {fr} {m:x}\n")
        for fr, name in shots:
            f.write(f"shot {fr} {name}\n")
    return frames


# ---- ROM pointer map for B's RAM ----

def elf_for(rom):
    rom = Path(rom)
    if rom.resolve() == Path("baserom.gba").resolve() or rom.name == "baserom.gba":
        return Path("fe7u.elf")
    e = rom.with_suffix(".elf")
    return e if e.exists() else None


def symbols(elf):
    out = subprocess.run(["arm-none-eabi-nm", "-n", str(elf)], capture_output=True,
                         text=True, check=True).stdout
    syms, seen = {}, set()
    for l in out.splitlines():
        f = l.split()
        if len(f) != 3:
            continue
        a = int(f[0], 16)
        if not 0x08000000 <= a < 0x0A000000 or f[2].startswith("$"):
            continue
        if f[2] in syms:
            seen.add(f[2])
        syms[f[2]] = a
    for s in seen:
        del syms[s]
    return syms


def write_map(elf_a, elf_b, path):
    """B address ranges -> delta to A, from the symbols both ELFs define."""
    sa, sb = symbols(elf_a), symbols(elf_b)
    pts = sorted((sb[n], sa[n] - sb[n]) for n in sb if n in sa)
    segs = []
    for i, (b, d) in enumerate(pts):
        if segs and segs[-1][2] == d:
            continue
        if segs:
            segs[-1][1] = b
        segs.append([b, None, d])
    if segs:
        segs[-1][1] = 0x0A000000
    segs = [s for s in segs if s[2]]
    with open(path, "w") as f:
        for lo, hi, d in segs:
            f.write(f"{lo:08X} {hi:08X} {d}\n")
    return len(segs)


def ram_names(elf):
    """RAM symbols of A, to name differing memory words."""
    out = subprocess.run(["arm-none-eabi-nm", "-n", "-S", str(elf)], capture_output=True,
                         text=True).stdout
    syms = []
    for l in out.splitlines():
        f = l.split()
        if len(f) >= 3 and f[-1][:1] != "$":
            a = int(f[0], 16)
            if 0x02000000 <= a < 0x04000000:
                size = int(f[1], 16) if len(f) == 4 else 0
                syms.append((a, size, f[-1]))
    return syms


def name_of(syms, addr):
    best = None
    for a, size, n in syms:
        if a > addr:
            break
        best = (a, size, n)
    if not best:
        return ""
    a, size, n = best
    if size and addr >= a + size and addr - a > 0x1000:
        return f"(after {n})"
    return f"{n}+{addr - a:#x}"


FIRST = {"first_video_diff": "pictures", "first_vmem_diff": "palette/VRAM/OAM",
         "first_audio_diff": "sound samples", "first_ram_diff": "RAM (EWRAM/IWRAM)"}


# ---- running ----

def environment():
    env = dict(os.environ)
    # Homebrew's mgba bottle can lag behind its ffmpeg dependency (libmgba
    # links the video recorder against it); an older keg-only ffmpeg@N
    # satisfies it.  The emulator core itself doesn't use ffmpeg.
    extra = sorted(glob.glob("/opt/homebrew/opt/ffmpeg@*/lib") + glob.glob("/usr/local/opt/ffmpeg@*/lib"))
    if extra and sys.platform == "darwin":
        env["DYLD_FALLBACK_LIBRARY_PATH"] = ":".join(
            extra + [p for p in env.get("DYLD_FALLBACK_LIBRARY_PATH", "").split(":") if p])
    return env


def run_bin(args):
    p = subprocess.run([str(BIN)] + args, capture_output=True, text=True, env=environment())
    if p.returncode:
        sys.stderr.write(p.stderr)
        if "Library not loaded" in p.stderr:
            sys.stderr.write("emutest: libmgba can't load a dependency (see CONTRIBUTING, "
                             "Runtime test)\n")
        raise SystemExit(p.returncode)
    return p.stdout


def fresh_dir(d):
    d.mkdir(parents=True, exist_ok=True)
    for f in d.iterdir():
        if f.suffix in (".png", ".bin", ".txt", ".log"):
            f.unlink()


def compare(script, rom_a, rom_b, args):
    name = Path(script).stem
    out = OUT / name
    fresh_dir(out)
    frames = write_plan(script, out)
    cmd = ["-p", str(out / "plan.txt"), "-o", str(out), "-d", str(args.dump)]
    ea, eb = elf_for(rom_a), elf_for(rom_b)
    note = "RAM compared as is"
    if ea and eb and ea.exists() and eb.exists() and ea.resolve() != eb.resolve():
        n = write_map(ea, eb, out / "ptrmap.txt")
        cmd += ["-m", str(out / "ptrmap.txt")]
        note = f"ROM pointers in B's RAM mapped to A ({n} ranges, {eb} -> {ea})"
    if args.log:
        cmd += ["-l", str(out / "frames.log")]
    if args.stop is not None:
        cmd += ["-s", str(args.stop)]
    print(f"== {name}: {rom_a} vs {rom_b}, {frames} frames; {note}")
    text = run_bin(cmd + [str(rom_a), str(rom_b)])
    (out / "result.txt").write_text(text)
    syms = ram_names(ea) if ea and ea.exists() else []
    deltas = set()  # low halves of the B->A address deltas
    if (out / "ptrmap.txt").exists() and "-m" in cmd:
        for l in (out / "ptrmap.txt").read_text().splitlines():
            d = int(l.split()[2]) & 0xFFFFFFFF
            deltas.add(d & 0xFFFF)
    diverged = ram_only = False
    shots_same = shots_total = 0
    for l in text.splitlines():
        f = l.split()
        if f[0] == "shot":
            shots_total += 1
            shots_same += f[-1] == "same"
            if f[-1] != "same":
                print(f"  checkpoint {f[2]} (frame {f[1]}): pictures differ")
        elif f[0] == "memdiff":
            region, addr, va, vb, vm = f[1], int(f[2], 16), f[3], f[4], f[5]
            a, b = int(va, 16), int(vb, 16)
            # a pointer's low halfword left behind (stale proc fields...)
            half = a >> 16 == b >> 16 and (a - b) & 0xFFFF in deltas
            print(f"    {addr:08X} {name_of(syms, addr):32} A={va} B={vb}"
                  + (f" (as A: {vm})" if vm != vb else "")
                  + ("  half of a moved pointer?" if half else ""))
        elif f[0] in ("first_video_diff", "first_vmem_diff", "first_audio_diff"):
            diverged = True
            print(f"  {FIRST[f[0]]} differ first at frame {f[1]}")
        elif f[0] == "first_ram_diff":
            ram_only = True
            print(f"  {FIRST[f[0]]} differs first at frame {f[1]}")
        elif f[0] in ("memdiff_count", "video_diff_range", "png", "stopped"):
            print("  " + l)
        elif f[0] == "summary":
            print("  " + " ".join(f[1:]))
    verdict = "DIVERGED" if diverged else "SAME (RAM differs, see above)" if ram_only else "IDENTICAL"
    print(f"  checkpoints with the same picture: {shots_same}/{shots_total}; {verdict} (output in {out})")
    return not diverged


def record(script, rom, args):
    out = OUT / ("record_" + Path(script).stem)
    fresh_dir(out)
    frames = write_plan(script, out)
    cmd = ["-p", str(out / "plan.txt"), "-o", str(out)]
    if args.every:
        cmd += ["-e", str(args.every)]
    if args.log:
        cmd += ["-l", str(out / "frames.log")]
    text = run_bin(cmd + [str(rom)])
    (out / "result.txt").write_text(text)
    pngs = sorted(str(p) for p in out.glob("*.png"))
    shots = [f"{out}/{l.split()[2]}.png" for l in text.splitlines() if l.startswith("shot ")]
    if args.every:
        pngs = sorted(str(p) for p in out.glob("f[0-9]*.png"))
        sheet(out / "sheet_every.png", 6, pngs)
    if shots:
        sheet(out / "sheet_shots.png", 4, shots)
    print(f"{rom}: {frames} frames, {len(shots)} checkpoints, output in {out}")
    for l in text.splitlines():
        if l.startswith("shot "):
            print("  " + l)


# ---- PNG contact sheets (no PIL needed) ----

def read_png(path):
    d = Path(path).read_bytes()
    i, idat = 8, b""
    while i < len(d):
        n, t = struct.unpack(">I4s", d[i:i + 8])
        c = d[i + 8:i + 8 + n]
        if t == b"IHDR":
            w, h = struct.unpack(">II", c[:8])
        elif t == b"IDAT":
            idat += c
        i += 12 + n
    raw, s = zlib.decompress(idat), w * 3 + 1  # emutest writes filter 0 RGB rows
    return w, h, [raw[y * s + 1:(y + 1) * s] for y in range(h)]


def write_png(path, w, rows):
    def chunk(t, c):
        return struct.pack(">I", len(c)) + t + c + struct.pack(">I", zlib.crc32(t + c))
    raw = b"".join(b"\0" + r for r in rows)
    Path(path).write_bytes(b"\x89PNG\r\n\x1a\n"
                           + chunk(b"IHDR", struct.pack(">IIBBBBB", w, len(rows), 8, 2, 0, 0, 0))
                           + chunk(b"IDAT", zlib.compress(raw)) + chunk(b"IEND", b""))


def sheet(out, cols, files):
    imgs = [read_png(f) for f in files]
    if not imgs:
        return
    w, h = imgs[0][0], imgs[0][1]
    white = b"\xff\xff\xff"
    rows = []
    for r in range(0, len(imgs), cols):
        for y in range(h):
            rows.append(b"".join((im[2][y] if im[0] == w else white * w) + white * 2
                                 for im in imgs[r:r + cols]).ljust(cols * (w + 2) * 3, b"\0"))
        rows += [white * cols * (w + 2)] * 2
    write_png(out, cols * (w + 2), rows)


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = p.add_subparsers(dest="cmd", required=True)
    c = sub.add_parser("compare")
    c.add_argument("scripts", nargs="*")
    c.add_argument("-a", default="fe7u.gba")
    c.add_argument("-b", default="build/shift/s.gba")
    c.add_argument("--dump", type=int, default=4, help="side-by-side PNGs of the first N differing frames")
    c.add_argument("--stop", type=int, help="stop N frames after the first divergence")
    c.add_argument("--log", action="store_true", help="write per-frame hashes to frames.log")
    r = sub.add_parser("record")
    r.add_argument("script")
    r.add_argument("-a", default="fe7u.gba")
    r.add_argument("--every", type=int, default=0, help="also save a PNG every N frames")
    r.add_argument("--log", action="store_true")
    s = sub.add_parser("sheet")
    s.add_argument("out")
    s.add_argument("cols", type=int)
    s.add_argument("pngs", nargs="+")
    args = p.parse_args()
    if args.cmd == "sheet":
        sheet(args.out, args.cols, args.pngs)
        return
    if not BIN.exists():
        raise SystemExit(f"{BIN} is missing: run `make {BIN}`")
    if args.cmd == "record":
        record(args.script, args.a, args)
        return
    scripts = args.scripts or sorted(glob.glob("tests/inputs/*.txt"))
    for rom in (args.a, args.b):
        if not Path(rom).exists():
            raise SystemExit(f"{rom} is missing")
    ok = all([compare(s, args.a, args.b, args) for s in scripts])
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
