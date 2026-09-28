#!/usr/bin/env python3
"""Extract the music (m4a / MusicPlayer2000) data from baserom.gba into sound/.

Usage: tools/m4adis.py [--stats] [--rom baserom.gba]

The build runs this once (order-only on baserom.gba, like texts/texts.txt):
song data and samples are not in git.  Only sound/manifest.txt is committed:
the region, the table addresses, and names kept at fixed addresses.

Parsed, starting from the tables in the manifest:
  * the music player table (gMPlayTable: MusicPlayerInfo / track RAM
    arrays, named from symbols.ld) and the song table (gSongTable: header
    pointer, player, player again);
  * every song header (track count, blocks, priority, reverb, voice group,
    track pointers);
  * every track's command stream, followed from each track start through
    GOTO / PATT / REPT / conditional MEMACC targets with the running status
    the engine keeps (a byte < 0x80 in command position repeats the last
    VOICE..note command; notes take up to three bytes < 0x80: key, velocity,
    gate time; EOT one), so every pointer is found, aligned or not.  Bytes no
    path reaches (dead code after a GOTO, unused tails) are decoded linearly
    where that works and are raw bytes otherwise;
  * voice groups: arrays of 12-byte ToneData on one grid, one label per
    referenced entry, followed into drum sets (type 0x80) and key split
    groups (0x40, whose key split table pointer may point before the table);
  * WaveData samples (16-byte header, size + 1 sample bytes) and
    programmable waves (16 bytes, 32 4-bit samples).
Bytes that none of these cover (unused key split tables, padding) are
emitted as raw bytes.

Written (all generated, gitignored):
  sound/sound.s                       the whole region in ROM order: .include /
                                      .incbin of the files below, labels, raw
                                      bytes; built as build/sound/sound.o
  sound/voicegroups/voicegroupNNN.s   voice macros (include/m4a_data.inc)
  sound/songs/songNNN.s               tracks (include/MPlayDef.s names) + header
  sound/direct_sound_samples/ADDR.bin WaveData (header + samples)
  sound/programmable_wave_samples/NNN.pcm
  sound/song_table.s, sound/music_player_table.s

Every pointer inside the region is written as a label (+ offset), so the
region can move.  Tool names (songNNN, songNNN_T, voicegroupNNN,
DirectSoundData_ADDR, ProgrammableWaveData_NNN) and manifest names at the
same addresses are global; manifest names inside an object are local, so
tools/dataptrs.py does not take look-alike words elsewhere for pointers to
them.  --stats prints counts and writes nothing.
"""
import argparse
import bisect
import re
import struct
import sys
from pathlib import Path

ROM_BASE = 0x08000000
MANIFEST = Path("sound/manifest.txt")

# --- m4a command set --------------------------------------------------------
LENGTHS = list(range(25)) + [28, 30, 32, 36, 40, 42, 44, 48, 52, 54, 56, 60,
                             64, 66, 68, 72, 76, 78, 80, 84, 88, 90, 92, 96]
CMD_NAMES = {0xB1: "FINE", 0xB2: "GOTO", 0xB3: "PATT", 0xB4: "PEND", 0xB5: "REPT",
             0xB9: "MEMACC", 0xBA: "PRIO", 0xBB: "TEMPO", 0xBC: "KEYSH", 0xBD: "VOICE",
             0xBE: "VOL", 0xBF: "PAN", 0xC0: "BEND", 0xC1: "BENDR", 0xC2: "LFOS",
             0xC3: "LFODL", 0xC4: "MOD", 0xC5: "MODT", 0xC8: "TUNE", 0xCC: "PORT",
             0xCD: "XCMD", 0xCE: "EOT", 0xCF: "TIE"}
ONE_ARG = {0xBA, 0xBB, 0xBC, 0xBD, 0xBE, 0xBF, 0xC0, 0xC1, 0xC2, 0xC3, 0xC4,
           0xC5, 0xC8, 0xCC}
# gMPlayJumpTable entries that are ply_fine: the track stops.
STOPS = {0xB1, 0xB6, 0xB7, 0xB8, 0xC6, 0xC7, 0xC9, 0xCA, 0xCB}
# gXcmdTable: argument bytes per XCMD sub-command (None: ply_xxx, stops).
XCMD_ARGS = [None, 4, 1, None, 1, 1, 1, 1, 1, 1, 1, 1]
XCMD_NAMES = {8: "xIECV", 9: "xIECL"}
MEMACC_NAMES = ["mem_set", "mem_add", "mem_sub", "mem_mem_set", "mem_mem_add",
                "mem_mem_sub", "mem_beq", "mem_bne", "mem_bhi", "mem_bhs", "mem_bls",
                "mem_blo", "mem_mem_beq", "mem_mem_bne", "mem_mem_bhi", "mem_mem_bhs",
                "mem_mem_bls", "mem_mem_blo"]
MODT_NAMES = ["mod_vib", "mod_tre", "mod_pan"]
NOTE_NAMES = ["Cn", "Cs", "Dn", "Ds", "En", "Fn", "Fs", "Gn", "Gs", "An", "As", "Bn"]


def note_name(k):
    octave = k // 12 - 2
    return NOTE_NAMES[k % 12] + (f"M{-octave}" if octave < 0 else str(octave))


def wait_name(c):
    return f"W{LENGTHS[c - 0x80]:02d}"


def cv(v):
    return "c_v" if v == 0x40 else f"c_v{v - 0x40:+d}"


def arg_text(cmd, v):
    """One argument byte of a 1-argument command, symbolically."""
    if v >= 0x80:
        return str(v)
    if cmd == 0xBE:
        return f"v{v:03d}"
    if cmd in (0xBF, 0xC0, 0xC8):
        return cv(v)
    if cmd == 0xC5 and v < len(MODT_NAMES):
        return MODT_NAMES[v]
    return str(v)


class Rom:
    def __init__(self, path):
        self.data = Path(path).read_bytes()

    def b(self, a):
        return self.data[a - ROM_BASE]

    def w(self, a):
        return struct.unpack_from("<I", self.data, a - ROM_BASE)[0]

    def h(self, a):
        return struct.unpack_from("<H", self.data, a - ROM_BASE)[0]

    def bytes(self, a, n):
        return self.data[a - ROM_BASE:a - ROM_BASE + n]


def read_manifest(path=MANIFEST):
    m = {"labels": []}
    for line in Path(path).read_text().splitlines():
        line = line.split("#")[0].split()
        if not line:
            continue
        key, args = line[0], line[1:]
        if key == "region":
            m["region"] = (int(args[0], 16), int(args[1], 16))
        elif key in ("mplaytable", "songtable"):
            m[key] = (int(args[0], 16), int(args[1], 0), args[2])
        elif key == "pwaves":
            m["pwaves"] = (int(args[0], 16), int(args[1], 0))
        elif key == "label":
            m["labels"].append((int(args[0], 16), args[1]))
        else:
            sys.exit(f"{path}: unknown line {line}")
    return m


def ram_names(path="symbols.ld"):
    names = {}
    for line in Path(path).read_text().splitlines():
        if mm := re.match(r"\s*([A-Za-z_]\w*)\s*=\s*0x(0[23][0-9A-Fa-f]{6})\s*;", line):
            a, n = int(mm.group(2), 16), mm.group(1)
            if a not in names or names[a].startswith("gUnk") and not n.startswith("gUnk"):
                names[a] = n
    return names


# --- parsing ------------------------------------------------------------------
class Item:
    """A run of bytes at addr with its assembler text.  refs: {offset: target}
    for 4-byte pointer fields (the text refers to them as {0}, {1}... in
    offset order)."""
    __slots__ = ("addr", "size", "fmt", "refs")

    def __init__(self, addr, size, fmt, refs=None):
        self.addr, self.size, self.fmt, self.refs = addr, size, fmt, refs or {}


class Sound:
    def __init__(self, rom, manifest):
        self.rom, self.m = rom, manifest
        self.start, self.end = manifest["region"]
        self.chunks = []     # (start, end, kind, payload)
        self.labels = {}     # addr -> [names]  (first is the primary name)
        self.problems = []
        self.parse()

    def in_region(self, a):
        return self.start <= a < self.end

    def label(self, a, name, front=False):
        ns = self.labels.setdefault(a, [])
        if name not in ns:
            ns.insert(0, name) if front else ns.append(name)

    # tables ------------------------------------------------------------------
    def parse(self):
        r = self.rom
        mp_addr, mp_count, mp_name = self.m["mplaytable"]
        st_addr, st_count, st_name = self.m["songtable"]
        self.mplay = [(r.w(a), r.w(a + 4), r.b(a + 8), r.b(a + 9), r.h(a + 10))
                      for a in range(mp_addr, mp_addr + 12 * mp_count, 12)]
        self.songs = [(r.w(a), r.h(a + 4), r.h(a + 6))
                      for a in range(st_addr, st_addr + 8 * st_count, 8)]
        self.chunks.append((mp_addr, mp_addr + 12 * mp_count, "mplay", None))
        self.chunks.append((st_addr, st_addr + 8 * st_count, "songtable", None))
        self.label(mp_addr, mp_name)
        self.label(st_addr, st_name)

        # song headers
        self.headers = {}   # addr -> (ntracks, blocks, prio, reverb, tone or None, [tracks])
        first_id = {}
        for i, (h, _, _) in enumerate(self.songs):
            first_id.setdefault(h, i)
        for h, i in sorted(first_id.items(), key=lambda x: x[0]):
            n = r.b(h)
            tone = r.w(h + 4)
            if n == 0 and not self.in_region(tone):
                self.headers[h] = (0, r.b(h + 1), r.b(h + 2), r.b(h + 3), None, [])
                size = 4
            else:
                tracks = [r.w(h + 8 + 4 * t) for t in range(n)]
                self.headers[h] = (n, r.b(h + 1), r.b(h + 2), r.b(h + 3), tone, tracks)
                size = 8 + 4 * n
            self.chunks.append((h, h + size, "header", h))
        self.song_name = {h: f"song{i:03d}" for h, i in first_id.items()}
        for h, name in self.song_name.items():
            self.label(h, name, front=True)

        self.parse_voices()
        self.parse_waves()
        self.parse_tracks()
        self.fill_holes()

    # voice groups ------------------------------------------------------------
    def voice_ptr_kind(self, t):
        if t & 0xC0 == 0x40:
            return "keysplit"
        if t & 0xC0 == 0x80:
            return "drum"
        if t & 7 == 0:
            return "wave"
        if t & 7 == 3:
            return "pwave"
        if t & 7 in (1, 2, 4):
            return None
        return "bad"

    def parse_voices(self):
        r = self.rom
        groups = {v[4] for v in self.headers.values() if v[4] is not None}
        waves, pwaves, kstables = set(), set(), set()
        entries = {}   # entry address -> kind
        blockers = sorted(c[0] for c in self.chunks)
        todo = sorted(groups)
        seen = set()
        while todo:
            g = todo.pop()
            if g in seen:
                continue
            seen.add(g)
            i = bisect.bisect_right(blockers, g)
            limit = min(blockers[i] if i < len(blockers) else self.end, g + 128 * 12)
            for a in range(g, limit - 11, 12):
                if a in entries:
                    continue
                t, p = r.b(a), r.w(a + 4)
                kind = self.voice_ptr_kind(t)
                if kind == "bad" or kind and not self.in_region(p):
                    break
                entries[a] = kind
                if kind == "wave":
                    waves.add(p)
                elif kind == "pwave":
                    pwaves.add(p)
                elif kind in ("drum", "keysplit"):
                    if p not in groups:
                        groups.add(p)
                        todo.append(p)
                    if kind == "keysplit":
                        kstables.add(r.w(a + 8))
            if not todo:
                # unreferenced groups: grid-aligned runs of valid entries in
                # holes between the entries found so far
                addrs = sorted(entries)
                for x, y in zip(addrs, addrs[1:]):
                    if y > x + 12 and (y - x) % 12 == 0 and x + 12 not in groups:
                        a = x + 12
                        t, p = r.b(a), r.w(a + 4)
                        kind = self.voice_ptr_kind(t)
                        if kind != "bad" and (not kind or self.in_region(p)):
                            groups.add(a)
                            todo.append(a)
        grid = {g % 12 for g in groups}
        if len(grid) != 1:
            self.problems.append(f"voice groups on different 12-byte grids: {grid}")
        self.voice_entries = entries
        self.groups = sorted(groups)
        self.waves, self.pwave_refs, self.kstables = waves, pwaves, kstables
        # contiguous runs of entries become chunks, split at group starts
        addrs = sorted(entries)
        for i, g in enumerate(self.groups):
            self.label(g, f"voicegroup{i:03d}", front=True)
        run = []
        for a in addrs + [None]:
            if run and (a is None or a != run[-1] + 12):
                self.chunks.append((run[0], run[-1] + 12, "voices", None))
                run = []
            if a is not None:
                run.append(a)

    # samples ----------------------------------------------------------------
    def parse_waves(self):
        r = self.rom
        self.wave_size = {}
        for a in sorted(self.waves):
            typ, status, _, loop, size = struct.unpack_from("<HHIII", r.data, a - ROM_BASE)
            n = 16 + size + 1
            if typ != 0 or status not in (0, 0x4000) or not self.in_region(a + n - 1):
                self.problems.append(f"bad WaveData at {a:#x}")
                continue
            self.wave_size[a] = n
            self.chunks.append((a, a + n, "wave", a))
            self.label(a, f"DirectSoundData_{a:08X}", front=True)
        pw_addr, pw_count = self.m["pwaves"]
        self.pwaves = [pw_addr + 16 * i for i in range(pw_count)]
        for p in self.pwave_refs - set(self.pwaves):
            self.problems.append(f"programmable wave {p:#x} is outside the manifest's table")
        for i, a in enumerate(self.pwaves):
            self.chunks.append((a, a + 16, "pwave", i))
            self.label(a, f"ProgrammableWaveData_{i:03d}", front=True)

    # tracks -----------------------------------------------------------------
    def decode_one(self, a, status):
        """(size, cmd, status after, stops, [(offset, target)]) of the command at
        a, or None if it cannot be decoded (unknown running status)."""
        r = self.rom
        c = r.b(a)
        p = a + 1
        if c < 0x80:
            if status is None:
                return None
            cmd, p = status, a
        else:
            cmd = c
            if c >= 0xBD:
                status = c
        ptrs, stops = [], False
        if cmd >= 0xCE:   # EOT, TIE, notes: optional key (velocity, gate time)
            for _ in range(1 if cmd == 0xCE else 3):
                if r.b(p) >= 0x80:
                    break
                p += 1
        elif cmd <= 0xB0 or cmd == 0xB4:
            pass
        elif cmd in STOPS:
            stops = True
        elif cmd in (0xB2, 0xB3):
            ptrs.append(p - a)
            p += 4
            stops = cmd == 0xB2
        elif cmd == 0xB5:
            ptrs.append(p + 1 - a)
            p += 5
        elif cmd == 0xB9:
            op = r.b(p)
            p += 3
            if 6 <= op <= 17:
                ptrs.append(p - a)
                p += 4
        elif cmd in ONE_ARG:
            p += 1
        elif cmd == 0xCD:
            x = r.b(p)
            n = XCMD_ARGS[x] if x < len(XCMD_ARGS) else None
            p += 1
            if n is None:
                stops = True
            else:
                if n == 4:
                    ptrs.append(p - a)
                p += n
        else:
            return None
        return p - a, cmd, status, stops, [(o, r.w(a + o)) for o in ptrs]

    def parse_tracks(self):
        self.insns = {}          # addr -> (size, cmd, status_in, ptrs, reached)
        self.track_label = {}    # track start -> name
        self.jump_targets = set()
        starts = []
        for h, (n, _, _, _, _, tracks) in self.headers.items():
            for i, t in enumerate(tracks):
                if t not in self.track_label:
                    self.track_label[t] = f"{self.song_name[h]}_{i + 1}"
                    starts.append(t)
        work = [(t, None) for t in starts]
        seen = set()
        while work:
            a, st = work.pop()
            while (a, st) not in seen:
                seen.add((a, st))
                d = self.decode_one(a, st)
                if d is None:
                    self.problems.append(f"undecodable track byte at {a:#x}")
                    break
                size, cmd, st2, stops, ptrs = d
                old = self.insns.get(a)
                if old and old[0] != size:
                    self.problems.append(f"track command at {a:#x} decodes two ways")
                self.insns[a] = (size, cmd, st, ptrs, True)
                for _, t in ptrs:
                    if cmd == 0xCD:
                        continue   # xwave: a sample pointer, not code
                    if not self.in_region(t):
                        self.problems.append(f"track pointer at {a:#x} leaves the region")
                        continue
                    self.jump_targets.add(t)
                    work.append((t, st2))
                if stops:
                    break
                a, st = a + size, st2
        for t in starts:
            self.label(t, self.track_label[t], front=True)
        # chunks: one per song, from the end of the previous song's header
        # (or the first track) up to the end of its own header
        heads = sorted(h for h in self.headers if self.headers[h][4] is not None)
        code = sorted(self.insns)
        track_lo = min(code) if code else None
        prev = None
        for h in heads:
            n = self.headers[h][0]
            self.chunks = [c for c in self.chunks if c[:3] != (h, h + 8 + 4 * n, "header")]
            lo = prev if prev is not None else min(track_lo, h)
            self.chunks.append((lo, h + 8 + 4 * n, "song", h))
            prev = h + 8 + 4 * n
        self.song_area = (track_lo, prev)

    # holes ------------------------------------------------------------------
    def fill_holes(self):
        self.chunks.sort()
        out, pos = [], self.start
        for s, e, kind, payload in self.chunks:
            if s < pos:
                self.problems.append(f"{kind} at {s:#x} overlaps the previous object (ends {pos:#x})")
                continue
            if s > pos:
                out.append((pos, s, "raw", None))
            out.append((s, e, kind, payload))
            pos = e
        if pos < self.end:
            out.append((pos, self.end, "raw", None))
        elif pos > self.end:
            self.problems.append(f"objects run past the region end ({pos:#x})")
        self.chunks = out
        # Manifest names are global where the tool names an object too, and
        # local elsewhere (inside a sample, a voice group, a track): only
        # object starts are pointer targets for code and other data.
        self.local_names = set()
        for a, name in self.m["labels"]:
            if not self.in_region(a):
                self.problems.append(f"manifest label {name} is outside the region")
            if a not in self.labels:
                self.local_names.add(name)
            self.label(a, name)


# --- emission -----------------------------------------------------------------
class Emitter:
    def __init__(self, snd, ram):
        self.s, self.rom, self.ram = snd, snd.rom, ram
        self.label_addrs = sorted(snd.labels)
        self.ptr_count = 0
        self.raw_ptrs = []
        self.local = {}   # addr -> local label name (track jump targets)

    def ref(self, v):
        """Assembler expression for the pointer value v."""
        self.ptr_count += 1
        if v in self.s.labels:
            return self.s.labels[v][0]
        if v in self.local:
            return self.local[v]
        if self.s.in_region(v):
            i = bisect.bisect_right(self.label_addrs, v) - 1
            base = self.label_addrs[i]
            return f"{self.s.labels[base][0]} + {v - base:#x}"
        if v in self.ram:
            return self.ram[v]
        self.ptr_count -= 1
        if v == 0:
            return "0"

        self.raw_ptrs.append(v)
        return f"{v:#010x}"

    def label_lines(self, a, local_ok=True):
        out = []
        for n in self.s.labels.get(a, []):
            if n not in self.s.local_names:
                out.append(f"\t.global {n}\n")
            out.append(f"{n}:\n")
        if a in self.local and local_ok:
            out.append(f"{self.local[a]}:\n")
        return out

    def raw(self, a, n):
        out = []
        for k in range(0, n, 16):
            chunk = self.rom.bytes(a + k, min(16, n - k))
            out.append("\t.byte " + ", ".join(f"{x:#04x}" for x in chunk) + "\n")
        return out

    def labels_inside(self, a, n):
        """Label addresses strictly inside [a, a+n)."""
        i = bisect.bisect_right(self.all_labels, a)
        j = bisect.bisect_left(self.all_labels, a + n)
        return self.all_labels[i:j]

    def items(self, items):
        """Text for a list of Items; an item with a label inside it is written as
        raw bytes split at the label."""
        out = []
        for it in items:
            out += self.label_lines(it.addr)
            inside = self.labels_inside(it.addr, it.size)
            if inside:
                self.s.problems.append(f"label inside an object at {it.addr:#x}: raw bytes")
                pos = it.addr
                for x in sorted(set(inside)) + [it.addr + it.size]:
                    out += self.raw(pos, x - pos)
                    if x < it.addr + it.size:
                        out += self.label_lines(x)
                    pos = x
                continue
            refs = [self.ref(self.rom.w(it.addr + o)) for o in sorted(it.refs)]
            out.append(it.fmt.format(*refs))
        return out

    # voice groups -----------------------------------------------------------
    def voice(self, a):
        r = self.rom
        e = r.bytes(a, 12)
        t, key, length, ps = e[0], e[1], e[2], e[3]
        adsr = list(e[8:12])
        kind = self.s.voice_ptr_kind(t)

        def pan_ok(p):
            return p == 0 or p & 0x80 and p != 0x80
        ok_adsr = adsr[0] < 8 and adsr[1] < 8 and adsr[2] < 16 and adsr[3] < 8
        tail = ", ".join(map(str, adsr))
        if kind == "wave" and t in (0, 8, 0x10) and length == 0 and pan_ok(ps):
            name = {0: "voice_directsound", 8: "voice_directsound_no_resample",
                    0x10: "voice_directsound_alt"}[t]
            return Item(a, 12, f"\t{name} {key}, {ps & 0x7F}, {{0}}, {tail}\n", {4: 1})
        if t in (1, 9) and key == 60 and length == 0 and e[4] < 4 and e[5:8] == b"\0\0\0" and ok_adsr:
            name = "voice_square_1" if t == 1 else "voice_square_1_alt"
            return Item(a, 12, f"\t{name} {ps}, {e[4]}, {tail}\n")
        if t in (2, 10) and key == 60 and length == 0 and ps == 0 and e[4] < 4 \
                and e[5:8] == b"\0\0\0" and ok_adsr:
            name = "voice_square_2" if t == 2 else "voice_square_2_alt"
            return Item(a, 12, f"\t{name} {e[4]}, {tail}\n")
        if t in (3, 11) and key == 60 and length == 0 and ps == 0 and ok_adsr:
            name = "voice_programmable_wave" if t == 3 else "voice_programmable_wave_alt"
            return Item(a, 12, f"\t{name} {{0}}, {tail}\n", {4: 1})
        if t in (4, 12) and pan_ok(length) and e[4] < 2 and e[5:8] == b"\0\0\0" and ok_adsr:
            # (pret's voice_noise puts "pan" in the length byte, "unk" in pan_sweep)
            name = "voice_noise" if t == 4 else "voice_noise_alt"
            return Item(a, 12, f"\t{name} {key}, {length & 0x7F}, {ps}, {e[4]}, {tail}\n")
        if t == 0x80 and e[1:4] == b"\0\0\0" and e[8:12] == b"\0\0\0\0":
            return Item(a, 12, "\tvoice_keysplit_all {0}\n", {4: 1})
        if t == 0x40 and e[1:4] == b"\0\0\0":
            return Item(a, 12, "\tvoice_keysplit {0}, {1}\n", {4: 1, 8: 1})
        # anything else: bytes, with the pointer field symbolic if it is one
        head = ", ".join(map(str, e[:4]))
        if kind in ("wave", "pwave", "drum", "keysplit"):
            return Item(a, 12, f"\t.byte {head}\n\t.4byte {{0}}\n\t.byte {tail}\n", {4: 1})
        return Item(a, 12, f"\t.byte {head}\n\t.4byte {r.w(a + 4):#x}\n\t.byte {tail}\n")

    def voicegroup_file(self, lo, hi):
        items = [self.voice(a) for a in range(lo, hi, 12)]
        return ["\t@ ToneData entries, see include/m4a_data.inc\n\n"] + self.items(items)

    # songs ------------------------------------------------------------------
    def insn_item(self, a, size, cmd, status, ptrs):
        r = self.rom
        by = r.bytes(a, size)
        c0 = by[0]
        refs = {o: 1 for o, _ in ptrs}
        running = c0 < 0x80
        args = by if running else by[1:]
        if cmd >= 0xCE:
            parts = []
            if not running:
                parts.append("TIE" if cmd == 0xCF else "EOT" if cmd == 0xCE else f"N{LENGTHS[cmd - 0xCF]:02d}")
            for i, v in enumerate(args):
                parts.append(note_name(v) if i == 0 else f"v{v:03d}" if i == 1
                             else f"gtp{v}" if 1 <= v <= 3 else str(v))
            ind = "\t" if running or cmd >= 0xCF else ""
            return Item(a, size, f"\t.byte\t{ind}" + ", ".join(parts) + "\n")
        if cmd <= 0xB0:
            return Item(a, size, f"\t.byte\t{wait_name(cmd)}\n")
        name = CMD_NAMES.get(cmd)
        if cmd in ONE_ARG:
            if running:
                return Item(a, size, f"\t.byte\t\t{arg_text(cmd, args[0])}\n")
            return Item(a, size, f"\t.byte\t{name}, {arg_text(cmd, args[0])}\n")
        if cmd in (0xB2, 0xB3):
            return Item(a, size, f"\t.byte\t{name}\n\t .word\t{{0}}\n", refs)
        if cmd == 0xB5:
            return Item(a, size, f"\t.byte\t{name}, {args[0]}\n\t .word\t{{0}}\n", refs)
        if cmd == 0xB9:
            op = args[0]
            opn = MEMACC_NAMES[op] if op < len(MEMACC_NAMES) else str(op)
            text = f"\t.byte\t{name}, {opn}, {args[1]}, {args[2]}\n"
            if ptrs:
                text += "\t .word\t{0}\n"
            return Item(a, size, text, refs)
        if cmd == 0xCD:
            x = args[0]
            xn = XCMD_NAMES.get(x, str(x))
            if size == 6:
                return Item(a, size, f"\t.byte\t{name}, {xn}\n\t .word\t{{0}}\n", refs)
            return Item(a, size, f"\t.byte\t{name}, " + ", ".join([xn] + [str(v) for v in args[1:]]) + "\n")
        if name:
            return Item(a, size, f"\t.byte\t{name}\n")
        return Item(a, size, f"\t.byte\t{c0:#04x}\n")

    def song_file(self, lo, hi, h):
        s = self.s
        n, blocks, prio, reverb, tone, tracks = s.headers[h]
        items = []
        a = lo
        hole_status = None
        while a < h:
            d = s.insns.get(a)
            if d:
                size, cmd, st, ptrs, _ = d
                items.append(self.insn_item(a, size, cmd, st, ptrs))
                hole_status = s.decode_one(a, st)[2]
                a += size
                continue
            # unreached bytes up to the next reached command or the header
            nxt = self.next_code(a, h)
            end = nxt
            if nxt == h and h % 4 == 0:   # zero padding that aligns the header
                while end > a and h - end < 3 and self.rom.b(end - 1) == 0:
                    end -= 1
            items += self.dead(a, end, hole_status)
            if end < nxt:
                items.append(Item(end, nxt - end, "\t.align 2, 0\n"))
            a = nxt
        fields = [f"\t.byte\t{n}\t@ NumTrks\n", f"\t.byte\t{blocks}\t@ NumBlks\n",
                  f"\t.byte\t{prio}\t@ Priority\n", f"\t.byte\t{reverb}\t@ Reverb\n"]
        hdr = "".join(fields) + "\n\t.word\t{0}\n\n" + "".join("\t.word\t{%d}\n" % (i + 1) for i in range(n))
        items.append(Item(h, 8 + 4 * n, hdr, {o: 1 for o in range(4, 8 + 4 * n, 4)}))
        return self.items(items)

    def next_code(self, a, h):
        i = bisect.bisect_right(self.code_addrs, a)
        return min(self.code_addrs[i], h) if i < len(self.code_addrs) else h

    def dead(self, a, end, status):
        """Unreached track bytes: decoded linearly while that stays in bounds."""
        s = self.s
        items = []
        while a < end:
            d = s.decode_one(a, status)
            if d is None or a + d[0] > end:
                items.append(Item(a, end - a, "".join(self.raw(a, end - a))))
                break
            size, cmd, st2, stops, ptrs = d
            ptrs = [(o, t) for o, t in ptrs if s.in_region(t)]
            items.append(self.insn_item(a, size, cmd, status, ptrs))
            self.dead_ptrs += len(ptrs)
            a, status = a + size, st2
        return items

    # whole region ------------------------------------------------------------
    def run(self, write):
        s = self.s
        self.dead_ptrs = 0
        self.code_addrs = sorted(s.insns)
        # local labels at track jump targets without another name
        tracks = sorted(s.track_label)
        for t in sorted(s.jump_targets):
            if t not in s.labels:
                base = tracks[bisect.bisect_right(tracks, t) - 1]
                self.local[t] = f"{s.track_label[base]}_{t:08X}"
        self.all_labels = sorted(set(self.label_addrs) | set(self.local))
        files = {}
        top = ["@ Generated by tools/m4adis.py from baserom.gba -- do not edit by hand\n"
               "@ unless you mean to: rerunning the tool overwrites sound/.\n",
               '\t.include "MPlayDef.s"\n\t.include "m4a_data.inc"\n\n\t.section .rodata\n']
        vg_starts = s.groups
        for lo, hi, kind, payload in s.chunks:
            top.append("\n")
            if kind == "voices":
                cuts = [g for g in vg_starts if lo <= g < hi]
                bounds = ([lo] if not cuts or cuts[0] != lo else []) + cuts + [hi]
                for x, y in zip(bounds, bounds[1:]):
                    name = s.labels[x][0] if x in vg_starts else f"voices_{x:08X}"
                    path = f"sound/voicegroups/{name}.s"
                    files[path] = self.voicegroup_file(x, y)
                    top.append(f'\t.include "{path}"\n')
            elif kind == "wave":
                path = f"sound/direct_sound_samples/{payload:08X}.bin"
                files[path] = s.rom.bytes(lo, hi - lo)
                top += self.incbin(lo, hi, path)
            elif kind == "pwave":
                path = f"sound/programmable_wave_samples/{payload:03d}.pcm"
                files[path] = s.rom.bytes(lo, hi - lo)
                top += self.incbin(lo, hi, path)
            elif kind == "song":
                path = f"sound/songs/{s.song_name[payload]}.s"
                files[path] = ['\t@ Tracks, then the song header (MPlayDef.s names)\n\n'] + \
                    self.song_file(lo, hi, payload)
                top.append(f'\t.include "{path}"\n')
            elif kind == "header":
                n, blocks, prio, reverb, tone, _ = s.headers[payload]
                text = f"\t.byte\t{n}, {blocks}, {prio}, {reverb}\t@ song header without tracks\n"
                if tone is None:
                    top += self.items([Item(lo, hi - lo, text)])
                else:
                    top += self.items([Item(lo, hi - lo, text + "\t.word\t{0}\n", {4: 1})])
            elif kind == "mplay":
                files["sound/music_player_table.s"] = self.mplay_file(lo, hi)
                top.append('\t.include "sound/music_player_table.s"\n')
            elif kind == "songtable":
                files["sound/song_table.s"] = self.songtable_file(lo, hi)
                top.append('\t.include "sound/song_table.s"\n')
            elif kind == "raw":
                if hi - lo < 4 and hi % 4 == 0 and not any(s.rom.bytes(lo, hi - lo)) \
                        and not any(x in s.labels for x in range(lo, hi)):
                    top.append("\t.align 2, 0\n")
                else:
                    top.append(f"\t@ {hi - lo:#x} bytes nothing refers to\n")
                    top += self.items([Item(lo, hi - lo, "".join(self.raw(lo, hi - lo)))])
        files["sound/sound.s"] = top
        if write:
            for path, content in files.items():
                p = Path(path)
                p.parent.mkdir(parents=True, exist_ok=True)
                if isinstance(content, bytes):
                    p.write_bytes(content)
                else:
                    p.write_text("".join(content))
        return files

    def incbin(self, lo, hi, path):
        out = self.label_lines(lo)
        pos = lo
        for x in self.labels_inside(lo, hi - lo) + [hi]:
            if x == hi and pos == lo:
                out.append(f'\t.incbin "{path}"\n')
                break
            out.append(f'\t.incbin "{path}", {pos - lo:#x}, {x - pos:#x}\n')
            if x < hi:
                out += self.label_lines(x)
            pos = x
        return out

    def mplay_file(self, lo, hi):
        items = []
        for i, (info, track, n, pad, unk) in enumerate(self.s.mplay):
            a = lo + 12 * i
            if pad == 0:
                items.append(Item(a, 12, f"\tmusic_player {{0}}, {{1}}, {n}, {unk}\n", {0: 1, 4: 1}))
            else:
                items.append(Item(a, 12, "".join(self.raw(a, 12))))
        return self.items(items)

    def songtable_file(self, lo, hi):
        items = []
        for i, (h, ms, me) in enumerate(self.s.songs):
            items.append(Item(lo + 8 * i, 8, f"\tsong {{0}}, {ms}, {me}\t@ {i}\n", {0: 1}))
        return self.items(items)


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--rom", default="baserom.gba")
    ap.add_argument("--stats", action="store_true")
    args = ap.parse_args()
    snd = Sound(Rom(args.rom), read_manifest())
    em = Emitter(snd, ram_names())
    files = em.run(write=not args.stats)
    kinds = {}
    for c in snd.chunks:
        kinds[c[2]] = kinds.get(c[2], 0) + 1
    print(f"songs {len(snd.songs)} (headers {len(snd.headers)}), tracks {len(snd.track_label)}, "
          f"track commands {len(snd.insns)}, jump targets {len(snd.jump_targets)}; "
          f"voice groups {len(snd.groups)} ({len(snd.voice_entries)} entries); "
          f"samples {len(snd.wave_size)}; programmable waves {len(snd.pwaves)}; "
          f"pointers {em.ptr_count} (in dead track code {em.dead_ptrs}); raw pointer values {len(em.raw_ptrs)}; "
          f"raw chunks {kinds.get('raw', 0)} ({sum(c[1] - c[0] for c in snd.chunks if c[2] == 'raw'):#x} bytes); "
          f"files {len(files)}")
    for p in snd.problems:
        print("warning:", p, file=sys.stderr)


if __name__ == "__main__":
    main()
