"""Find the real pointers inside the data/rom gaps (used by tools/datasplit.py).

A pointer word is emitted as `.4byte NAME [+ ADDEND]` instead of raw bytes, so
the data follows its targets when anything in the ROM moves.  Only 4-aligned
words that are neither inside an LZ77 blob nor inside SKIP_RANGES are looked
at.  A word's value decodes as one of:

  code   a global function (odd Thumb or even ARM entry) or a global Thumb
         code label + 1 -- never mid-function, never _entry (0x08000000);
  data   an address in 0x080C57DC..0x09000000 that is not strictly inside an
         LZ77 blob.  In a gap it is expressed from the label at the address,
         else from a label at the address rounded down to 4 (created if
         missing: that is where the pointed-to object starts), + the rest.
         In a placed section (C / event source) it is expressed from the
         nearest global, non-absolute symbol at or before it in the same
         section;
  ram    an EWRAM/IWRAM address that is a global symbol, or inside one whose
         size is known (not 0x02000000 / 0x03000000 themselves, and not four
         bytes all below 0x20: those are packed small numbers);
  anim   an AnimScr instruction (include/gbafe/anime.h) holding a pointer:
         "force sprite" (bit 31 clear, sprite = w & 0x0FFFFFFC, delay in bits
         0-1 and 28-30) or a pointer instruction (0xC0000000 | function,
         0xD0000000 | script); these are only looked for inside AnimScr runs.

Which decodable words are pointers (the structure evidence).  Terms:
  structured  at least half of the words at +-4..+-16 bytes (same gap) are
              small numbers (< 0x10000 or >= 0xFFFF0000), pairs of small
              halfwords (< 0x1000 or >= 0xF000), ASCII text, or ROM/RAM-range
              values.  Graphics, compressed and sampled data fail this.
  known       the target is a function, a global symbol in source, an LZ77
              blob, or a label code/source point at or that has a real name.
  clean       not noise-like -- pixel-like values (<= 3 distinct nibbles, one
              nonzero nibble repeated 4+ times) outnumbering pointer-like
              neighbours, or a 0x08xx08xx tile map entry pair among other tile
              pairs -- and no invalid pointer-looking neighbour within +-16
              bytes (a data-region value into an LZ77 blob, or an odd code
              address that is not a function: tables of another build).
  R1  exact target: structured, and known or (any label and clean).
  R2  data target without a label: structured, clean, and either an R1/R3
      pointer within +-16 bytes or a target within 64 KiB of the word (local
      sprite / frame / sub-table references; not a tile map entry pair).
  R3  every pointer of an AnimScr run: consecutive words that all decode as
      AnimScr instructions (force sprite within 64 KiB, pointer instruction
      to a function / data, 0x80000000 | type<<24 control with type <= 6;
      FRAME (type 6) takes two extra words, the first an image sheet
      pointer), with at least two sprite words, fewer than half of them
      noise-like, and a STOP / END / LOOP / jump terminator.
  R4  RAM target: structured, and an R1/R3 pointer or an exact RAM symbol
      word within +-16 bytes (RAM address tables, proc / sound structs).
  R5  a pointer field of a structure found from the code's own tables
      (structures() below: the struct MapChange lists), whatever its
      surroundings.
Never pointers (the words are left raw and give no neighbour evidence):
  * the data of those structures that holds no pointer (map change tile
    data: u16 metatile ids, e.g. 0x08D0 0x00D4 read as a word is a label
    address);
  * NOT_POINTERS: ranges whose consumer shows they hold no pointer, each
    with its evidence;
  * a target strictly inside the music data or a battle animation script
    (placed whole from sound/ and banim/; code and tables only ever point
    at their start or at a named object in them), e.g. OAM attribute
    0x089B next to a zero halfword reads as music sample + 0x275C.
Acceptance is iterated to a fixpoint with the labels it creates, so running
the tool again gives the same output.  Everything else stays incbin'd;
`tools/datasplit.py --stats` counts the words per rule.
"""
import bisect
import struct

ROM_BASE = 0x08000000
DATA_START = 0x080C57DC
ROM_END = 0x09000000
LOCAL = 0x10000

# Left raw for dedicated passes:
SKIP_RANGES = [
    # gFe6LinkMultiBootImage: a separate program linked for EWRAM.
    (0x08CF0CD0, 0x08CF634C),
]

# Data that holds no pointer although some of its words look like one.
# (start, end, evidence); words overlapping a range are never symbolized.
NOT_POINTERS = [
    # SpriteLut_GaugePips' four sprites (src/opinfo.c passes each to
    # PutSpriteExt as a u16 OAM list: count 1, then attr0 attr1 attr2).
    # attr2 = 0x089B..0x089E (priority 2, tile 0x9B..) above attr1 = 0 reads
    # as 0x089B0000, which is inside a music sample.
    (0x08CE6058, 0x08CE6078, "SpriteLut_GaugePips sprites (u16 OAM lists)"),
]

# Placed objects that nothing points into (only at their start, or at a
# global name defined in them): the music data (tools/m4adis.py) and the
# battle animation scripts (tools/banim.py).
WHOLE_OBJS = ("build/sound/sound.o(", "build/banim/banim.o(")

# struct ChapterInfo (include/gbafe/chapterdata.h): size, and the offset of
# asset_map_changes, an index into gChapterDataAssetTable.
CHAPTER_INFO_SIZE = 0x98
CHAPTER_ASSET_MAP_CHANGES = 0x0B
MAP_CHANGE_SIZE = 12  # struct MapChange (include/gbafe/terrain.h)


def structures(rom, syms):
    """Structures found the way the game finds them.  Returns (pointer field
    addresses, [(start, end)] of their data that holds no pointer).

    Map changes: GetMapChange (src/bmtrick.c) walks
    gChapterDataAssetTable[GetChapterInfo(ch)->asset_map_changes], a list of
    struct MapChange {s8 id; u8 x, y, xSize, ySize; const u16 *data;} ended
    by a negative id; ApplyMapChange reads xSize * ySize u16 metatile ids
    from data."""
    def word(a):
        return struct.unpack_from("<I", rom, a - ROM_BASE)[0]

    fields, plain = set(), []
    chapters, csize = syms.named["gChapterDataTable"]
    assets, _ = syms.named["gChapterDataAssetTable"]
    assert csize % CHAPTER_INFO_SIZE == 0, "struct ChapterInfo size changed?"
    lists = set()
    for c in range(chapters, chapters + csize, CHAPTER_INFO_SIZE):
        lst = word(assets + 4 * rom[c + CHAPTER_ASSET_MAP_CHANGES - ROM_BASE])
        if lst:
            lists.add(lst)
    for a in lists:
        while rom[a - ROM_BASE] < 0x80:
            data = word(a + 8)
            w, h = rom[a + 3 - ROM_BASE], rom[a + 4 - ROM_BASE]
            assert DATA_START <= data < ROM_END, f"map change {a:#x}: data {data:#x}"
            fields.add(a + 8)
            plain.append((data, data + 2 * w * h))
            a += MAP_CHANGE_SIZE
    return fields, plain


def raw_ranges(rom, syms):
    """Sorted (start, end) ranges whose words are never pointers."""
    return sorted(structures(rom, syms)[1] + [(s, e) for s, e, _ in NOT_POINTERS])


def is_rom(v):
    return ROM_BASE <= v < ROM_END


def is_ram(v):
    return 0x02000000 <= v < 0x02040000 or 0x03000000 <= v < 0x03008000


def structured(w):
    if w < 0x10000 or w >= 0xFFFF0000 or is_rom(w) or is_ram(w):
        return True
    if all(h < 0x1000 or h >= 0xF000 for h in (w & 0xFFFF, w >> 16)):
        return True
    return all(b == 0 or 0x20 <= b < 0x7F for b in w.to_bytes(4, "little"))


class Symbols:
    """Global symbols of fe7u.elf outside the gaps (absolute ones only for RAM)."""

    def __init__(self, elf_path, in_gap):
        import elf32
        self.funcs = {}    # value (thumb bit set) -> name
        self.code = {}     # even address -> name (Thumb NOTYPE labels)
        self.data = {}     # data-region address -> name
        self.ram = {}      # RAM address -> (name, size)
        self.named = {}    # name -> (address, size), every global
        pick = {}
        for s in elf32.Elf(elf_path).symbols:
            if s.bind != 1 or s.shndx in (0, 0xFFF2) or not s.name or s.name.startswith("$"):
                continue
            self.named.setdefault(s.name, (s.value, s.size))
            if s.shndx == 0xFFF1 and not is_ram(s.value):
                continue  # absolute ROM addresses (symbols.ld) would not move
            if s.type not in (0, 1, 2):
                continue
            v = s.value
            if is_rom(v) and v >= DATA_START and in_gap(v):
                continue  # data/rom labels: datasplit knows those itself
            key = (s.type == 2, v)
            cur = pick.get(key)
            # prefer real names over placeholders, then alphabetical
            rank = (s.name.startswith(("gUnk_", "gUnknown_", "sub_", "Unknown_")), s.name)
            if cur is None or rank < cur[0]:
                pick[key] = (rank, s)
        for (_, v), (_, s) in pick.items():
            if s.type == 2:
                self.funcs[v] = s.name
            elif ROM_BASE <= v < DATA_START:
                self.code.setdefault(v, s.name)
            elif is_rom(v):
                self.data.setdefault(v, s.name)
            elif is_ram(v):
                self.ram.setdefault(v, (s.name, s.size))
        self.data_sorted = sorted(self.data)
        self.ram_sorted = sorted(self.ram)


def pixel_like(v):
    """4bpp pixels: at most three distinct nibbles, one nonzero nibble
    repeated at least four times (for ROM-range values: in the low 24 bits)."""
    h = f"{v & 0xFFFFFF:06x}" if is_rom(v) else f"{v:08x}"
    return len(set(h)) <= 3 and any(h.count(c) >= 4 for c in set(h) - {"0"})


def tile_pair(w, strict=True):
    """Two tile map entries with the same (nonzero) high byte and, if strict,
    close low bytes."""
    return w >> 24 and w >> 24 == (w >> 8) & 0xFF and (
        not strict or abs((w >> 16 & 0xFF) - (w & 0xFF)) < 0x20)


def find_pointers(rom, gaps, placed, names, trusted, blobs, blob_lookup, syms):
    """Returns {word address: (kind, base, addend, rule)} and the set of new label
    addresses (bases in the gaps that need a label).  kind: 'label' (base is
    a data/rom label address), 'sym' (base names syms.data/.ram), 'func',
    'code'.  trusted: gap addresses known to be objects independently of the
    gap words (code and source pointer targets, LZ77 blobs, named labels).
    Adds nothing to names itself."""
    gap_starts = [g[0] for g in gaps]
    placed_starts = [p[0] for p in placed]

    def gap_of(a):
        i = bisect.bisect_right(gap_starts, a) - 1
        return gaps[i] if i >= 0 and gaps[i][0] <= a < gaps[i][1] else None

    def placed_of(a):
        i = bisect.bisect_right(placed_starts, a) - 1
        if i >= 0 and placed[i][0] <= a < placed[i][0] + placed[i][1]:
            return placed[i]
        return None

    def word(a):
        return struct.unpack_from("<I", rom, a - ROM_BASE)[0]

    def skipped(a):
        return any(lo <= a < hi for lo, hi in SKIP_RANGES)

    def in_blob_interior(v):
        return blob_lookup(v) and v not in blobs

    # --- target resolution: (kind, base, addend, level) ----------------------
    # level 2: a known object or function, 1: some label, 0: neither
    def code_target(v):
        if v == ROM_BASE:
            return None
        if v in syms.funcs:
            return ("func", v, 0, 2)
        if v & 1 and v - 1 in syms.code:
            return ("code", v - 1, 1, 2)
        return None

    def data_target(v, labels):
        if in_blob_interior(v):
            return None
        g = gap_of(v)
        if g:
            if v in labels:
                return ("label", v, 0, 2 if v in trusted else 1)
            base = v & ~3
            if base < g[0] or in_blob_interior(base):
                base = v
            return ("label", base, v - base, 0)
        p = placed_of(v)
        if not p:
            return None
        i = bisect.bisect_right(syms.data_sorted, v) - 1
        if i < 0 or syms.data_sorted[i] < p[0]:
            return None
        base = syms.data_sorted[i]
        if base != v and p[2].startswith(WHOLE_OBJS):
            return None  # never into the music data or a battle animation script
        return ("sym", base, v - base, 2 if base == v else 0)

    def ram_target(v):
        if v in (0x02000000, 0x03000000) or all(b < 0x20 for b in v.to_bytes(4, "little")):
            return None  # base addresses and packed small bytes are not pointers
        if v in syms.ram:
            return ("sym", v, 0, 2)
        i = bisect.bisect_right(syms.ram_sorted, v) - 1
        if i >= 0:
            base = syms.ram_sorted[i]
            if v < base + syms.ram[base][1]:
                return ("sym", base, v - base, 0)
        return None

    def plain(v, labels):
        if not is_rom(v):
            return ram_target(v) if is_ram(v) else None
        if v < DATA_START:
            return code_target(v)
        return data_target(v, labels)

    # --- words to look at --------------------------------------------------
    struct_fields, _ = structures(rom, syms)
    raw = raw_ranges(rom, syms)
    raw_starts = [r[0] for r in raw]

    def is_raw(a):  # the word at a overlaps data that holds no pointer
        i = bisect.bisect_right(raw_starts, a + 3) - 1
        return i >= 0 and a < raw[i][1]

    words = {}
    for s, e in gaps:
        for a in range((s + 3) & ~3, e - 3, 4):
            if not skipped(a) and not blob_lookup(a) and not is_raw(a):
                words[a] = word(a)

    def struct_ok(a):
        g = gap_of(a)
        n = t = 0
        for d in (-16, -12, -8, -4, 4, 8, 12, 16):
            b = a + d
            if g[0] <= b and b + 4 <= g[1]:
                t += 1
                n += structured(word(b))
        return 2 * n >= t
    ok = {a: struct_ok(a) for a, v in words.items() if is_rom(v) or is_ram(v)}

    def noise_like(a, v=None):
        """Pixel-like values here and around (more than pointer-like ones, or
        a pixel-like value with no pointer-like neighbour), or a tile map
        entry pair among others."""
        v = words[a] if v is None else v
        nb = [word(a + k) for k in (-16, -12, -8, -4, 4, 8, 12, 16) if gap_of(a + k)]
        px = pixel_like(v) + sum(map(pixel_like, nb))
        ptr = sum(is_rom(w) and not pixel_like(w) for w in nb)
        if px >= 2 and px > ptr + (not pixel_like(v)) or pixel_like(v) and not ptr:
            return True
        return tile_pair(v, False) and sum(tile_pair(words.get(a + k, 0)) for k in (-8, -4, 4, 8)) >= 2

    # --- AnimScr runs (R3) -------------------------------------------------
    def anim_decode(v, labels):
        """None: not an AnimScr word.  Else (target or None, nextra, term)."""
        if not v & 0x80000000:
            t = v & 0x0FFFFFFC
            if not DATA_START <= t < ROM_END:
                return None
            d = data_target(t, labels)
            return ((d[0], d[1], d[2] + (v - t)), 0, False) if d else None
        if v & 0x40000000:
            typ, t = (v >> 28) & 3, v & 0x0FFFFFFF
            if typ == 0:
                c = code_target(t)
                return ((c[0], c[1], c[2] + (v - t)), 0, False) if c else None
            if typ == 1 and DATA_START <= t < ROM_END:
                d = data_target(t, labels)
                return ((d[0], d[1], d[2] + (v - t)), 0, True) if d else None
            return None
        typ = (v >> 24) & 0x3F
        if typ > 6:
            return None
        return (None, 2 if typ == 6 else 0, typ in (0, 1, 2))

    def anim_runs(labels):
        out = {}
        for s, e in gaps:
            a = (s + 3) & ~3
            while a + 4 <= e:
                run, sprites, noisy, term, b = {}, 0, 0, False, a
                while b + 4 <= e and b in words:
                    d = anim_decode(words[b], labels)
                    if d is None:
                        break
                    tgt, extra, t = d
                    v = words[b]
                    if not v & 0x80000000:  # sprites sit near their scripts
                        if abs((v & 0x0FFFFFFC) - b) >= LOCAL:
                            break
                        sprites += 1
                        noisy += noise_like(b, v & 0x0FFFFFFF)
                    if tgt:
                        run[b] = tgt
                    b += 4
                    if extra:  # FRAME: image sheet pointer, sprite offset
                        if b + 8 > e or b not in words:
                            break
                        p = plain(words[b], labels)
                        if p and p[0] in ("label", "sym") and is_rom(words[b]):
                            run[b] = p[:3]
                        b += 8
                    if t:
                        term = True
                        break
                if term and sprites >= 2 and 2 * noisy < sprites:
                    out.update(run)
                a = max(b, a + 4)
        return out

    # --- fixpoint of R1..R4 --------------------------------------------------
    labels = set(names)
    near = (-16, -12, -8, -4, 4, 8, 12, 16)
    while True:
        dec = {a: plain(v, labels) for a, v in words.items() if a in ok}
        dec = {a: d for a, d in dec.items() if d}
        # pointer-looking but invalid: into an LZ77 blob, odd but not a function
        bad = {a for a in ok if a not in dec and is_rom(words[a]) and (
            words[a] >= DATA_START or words[a] & 1 and words[a] >= ROM_BASE + 0x100)}

        def clean(a):  # plausible value, no invalid pointer-looking neighbour
            return not noise_like(a) and not any(a + k in bad for k in near)

        acc = {}
        for a, d in dec.items():  # R1
            if is_rom(words[a]) and ok[a] and (d[3] == 2 or d[3] == 1 and clean(a)):
                acc[a] = d[:3] + ("R1",)
        for a, t in anim_runs(labels).items():  # R3
            acc.setdefault(a, t + ("R3",))
        strong = set(acc)
        for a, d in dec.items():  # R2
            v = words[a]
            if a in acc or not ok[a] or not is_rom(v) or v < DATA_START or not clean(a):
                continue
            if any(a + k in strong for k in near) or abs(v - a) < LOCAL and not tile_pair(v):
                acc[a] = d[:3] + ("R2",)
        for a, d in dec.items():  # R4
            if a in acc or not ok[a] or not is_ram(words[a]):
                continue
            if any(a + k in strong or a + k in dec and is_ram(words[a + k]) and dec[a + k][3] == 2
                   for k in near):
                acc[a] = d[:3] + ("R4",)
        for a in struct_fields:  # R5
            d = plain(words[a], labels) if a in words else None
            if a not in acc and d:
                acc[a] = d[:3] + ("R5",)
        new = {t[1] for t in acc.values() if t[0] == "label" and t[1] not in labels}
        if not new:
            break
        labels |= new
    # A pointer word must not be split by a label.
    for a in [a for a in acc if any(a + k in labels for k in (1, 2, 3))]:
        del acc[a]
    new = {t[1] for t in acc.values() if t[0] == "label" and t[1] not in names}
    return acc, new
