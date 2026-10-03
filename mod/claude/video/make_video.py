"""Cut the showcase video from a recorded run of the native build.

Record the run first (every frame, and the audio):

    build/host-game/fe7u --headless --no-save --input mod/claude/video/showcase.txt \\
        --dump-frames REC --dump-every 1 --wav REC/audio.wav

then

    python3 mod/claude/video/make_video.py REC OUT.mp4

The game picture is scaled 4x (nearest neighbour) into a 1280x720 frame, a
caption bar below it; title and end cards around the segments; the audio
is cut from the same frames (the host writes no audio before the sound
engine starts, so the WAV starts AUDIO_START frames into the run).
"""
import glob
import os
import struct
import subprocess
import sys
import wave

import numpy as np
from PIL import Image, ImageDraw, ImageFont

FPS = 16777216 / 280896          # the GBA's frame rate, 59.7275
W, H = 1280, 720
SCALE = 4
GX, GY = (W - 240 * SCALE) // 2, 0
FADE = 12                        # frames of fade to and from black

# (first frame, last frame, caption): frames of the recorded run
SEGMENTS = [
    (4080, 6090, "Claude, a Daemon: a new character, added in C, who joins Lyn"),
    (6643, 7830, "Its own battle animation, and a new tome, Windseed: a spell written as new code"),
    (8470, 8830, "Its own class, portrait, map sprites and text, all built from the decomp's source"),
]
TITLE = [
    ("Fire Emblem: The Blazing Sword", 64),
    ("decompiled to C, running natively on macOS", 40),
    ("", 24),
    ("github.com/6elphegor/fireemblem7u", 30),
]
END = [
    ("No emulator: the game's own C code, compiled with clang", 36),
    ("and run as a macOS program", 36),
    ("", 30),
    ("Character design by thebes (Theia Vogel)", 32),
    ("Mod, art and code for this video by Claude", 32),
    ("", 30),
    ("A fan project, not affiliated with Nintendo,", 24),
    ("Intelligent Systems or Anthropic", 24),
]
CARD_FRAMES = int(3.5 * FPS)
BG = (18, 14, 20)
CORAL = (217, 119, 87)
CREAM = (248, 240, 228)


def font(size):
    for path in ("/System/Library/Fonts/Avenir Next.ttc",
                 "/System/Library/Fonts/Supplemental/Avenir Next.ttc",
                 "/System/Library/Fonts/Helvetica.ttc"):
        if os.path.exists(path):
            try:
                return ImageFont.truetype(path, size, index=0)
            except OSError:
                pass
    return ImageFont.load_default()


def card(lines):
    im = Image.new("RGB", (W, H), BG)
    d = ImageDraw.Draw(im)
    total = sum(s + 14 for _, s in lines)
    y = (H - total) // 2
    for i, (text, size) in enumerate(lines):
        f = font(size)
        if text:
            w = d.textlength(text, font=f)
            d.text(((W - w) / 2, y), text, font=f, fill=CORAL if i == 0 else CREAM)
        y += size + 14
    return np.asarray(im)


def frame_image(rec, n, caption, cache={}):
    im = Image.open(os.path.join(rec, f"frame{n:06d}.png")).convert("RGB")
    im = im.resize((240 * SCALE, 160 * SCALE), Image.NEAREST)
    if caption not in cache:
        base = Image.new("RGB", (W, H), BG)
        d = ImageDraw.Draw(base)
        f = font(28)
        w = d.textlength(caption, font=f)
        d.text(((W - w) / 2, 240 * SCALE // 1 * 0 + 160 * SCALE + 22), caption, font=f, fill=CREAM)
        cache[caption] = base
    out = cache[caption].copy()
    out.paste(im, (GX, GY))
    return np.asarray(out)


def fade(img, k, n):
    """Fade in over the first FADE frames and out over the last FADE."""
    a = min(1.0, (k + 1) / FADE, (n - k) / FADE)
    return (img.astype(np.float32) * a).astype(np.uint8)


def main():
    rec, out = sys.argv[1], sys.argv[2]
    wav = wave.open(os.path.join(rec, "audio.wav"))
    rate, ch = wav.getframerate(), wav.getnchannels()
    pcm = np.frombuffer(wav.readframes(wav.getnframes()), dtype=np.int16).reshape(-1, ch)
    nframes = len(glob.glob(os.path.join(rec, "frame*.png")))
    spf = rate / FPS
    audio_start = nframes - len(pcm) / spf       # frames before the audio

    video = []   # (kind, args)
    audio = []
    def silence(frames):
        audio.append(np.zeros((int(round(frames * spf)), ch), dtype=np.int16))

    video.append(("card", TITLE, CARD_FRAMES))
    silence(CARD_FRAMES)
    for a, b, cap in SEGMENTS:
        video.append(("seg", (a, b, cap), b - a + 1))
        s0 = int(round((a - audio_start) * spf))
        s1 = int(round((b + 1 - audio_start) * spf))
        clip = pcm[max(s0, 0):s1].astype(np.float32)
        ramp = min(len(clip), int(FADE * spf))
        env = np.ones(len(clip), dtype=np.float32)
        env[:ramp] = np.linspace(0, 1, ramp)
        env[len(clip) - ramp:] = np.linspace(1, 0, ramp)
        audio.append((clip * env[:, None]).astype(np.int16))
    video.append(("card", END, CARD_FRAMES + int(FPS)))
    silence(CARD_FRAMES + int(FPS))

    track = os.path.splitext(out)[0] + ".audio.wav"
    with wave.open(track, "wb") as w:
        w.setnchannels(ch)
        w.setsampwidth(2)
        w.setframerate(rate)
        w.writeframes(np.concatenate(audio).tobytes())

    ff = subprocess.Popen([
        "ffmpeg", "-v", "error", "-y",
        "-f", "rawvideo", "-pix_fmt", "rgb24", "-s", f"{W}x{H}", "-r", f"{FPS:.4f}", "-i", "-",
        "-i", track,
        "-c:v", "libx264", "-preset", "slow", "-crf", "16", "-pix_fmt", "yuv420p",
        "-c:a", "aac", "-b:a", "192k", "-shortest", "-movflags", "+faststart", out,
    ], stdin=subprocess.PIPE)
    total = 0
    for kind, args, n in video:
        if kind == "card":
            img = card(args)
            for k in range(n):
                ff.stdin.write(fade(img, k, n).tobytes())
        else:
            a, b, cap = args
            for k, f in enumerate(range(a, b + 1)):
                ff.stdin.write(fade(frame_image(rec, f, cap), k, n).tobytes())
        total += n
    ff.stdin.close()
    ff.wait()
    os.remove(track)
    print(f"{out}: {total} frames, {total / FPS:.1f} s")


if __name__ == "__main__":
    main()
