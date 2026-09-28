#!/usr/bin/env python3
"""Where the data in data/graphics.txt is used: tools/gfx.py's `classify`.

Collects every reference to a manifest entry's label

  * from data: `.4byte NAME` words in data/rom/*.s, with the label of the
    table they are in and their offset in it;
  * from C tables: the top-level initializer (array/struct name) of
    src/**/*.c, the brace group around the reference, its index there and
    the line's comment;
  * from C code: the call the label is an argument of (callee, argument
    index, all arguments) and the function it is in;

and derives from them (see RULES below) each entry's FORMAT, a descriptive
NAME, and for images the palette to show them with.
"""
import bisect
import collections
import re
import struct
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
import datasplit  # noqa: E402

ROM_BASE = 0x08000000
IDENT = re.compile(r"[A-Za-z_]\w*")


# --------------------------------------------------------------------------
# collecting references

class Refs:
    def __init__(self, rom, entries):
        self.rom = rom
        self.entries = entries
        items = datasplit.walk_rom_files(entries)
        self.items = items
        self.label_addr = {}
        self.labels_at = collections.defaultdict(list)
        for kind, a, name, _ in items:
            if kind == "label":
                self.label_addr[name] = a
                self.labels_at[a].append(name)
        self.name_of = {a: e for a, e in entries.items()}  # addr -> Entry
        self.data = collections.defaultdict(list)  # addr -> [(table name, table addr, offset)]
        self.ptr_at = {}  # word addr -> target addr
        sorted_labels = sorted((a, n) for n, a in self.label_addr.items())
        import bisect
        la = [a for a, _ in sorted_labels]
        for kind, a, expr, _ in items:
            if kind != "ptr":
                continue
            base, _, add = expr.partition("+")
            base = base.strip()
            if base not in self.label_addr:
                continue
            t = self.label_addr[base] + (int(add, 0) if add else 0)
            self.ptr_at[a] = t
            i = bisect.bisect_right(la, a) - 1
            if i >= 0:
                ta, tn = sorted_labels[i]
                self.data[t].append((tn, ta, a - ta))
        self.ctab = collections.defaultdict(list)   # label -> [CTable]
        self.ccall = collections.defaultdict(list)  # label -> [CCall]
        self.cfunc = collections.defaultdict(list)  # function -> [CCall]
        self.fidents = collections.defaultdict(set)  # function -> identifiers used
        for p in sorted(Path("src").rglob("*.c")):
            self._parse_c(p)

    def addr(self, name):
        return self.label_addr.get(name)

    def word(self, a):
        return struct.unpack_from("<I", self.rom, a - ROM_BASE)[0]

    # C parsing: enough of the language for initializers and calls.
    def _parse_c(self, path):
        raw = path.read_text(errors="replace")
        comments = {}
        for n, line in enumerate(raw.splitlines(), 1):
            if "//" in line:
                comments[n] = line.split("//", 1)[1].strip()
        text = re.sub(r"/\*.*?\*/", lambda m: re.sub(r"[^\n]", " ", m.group()), raw, flags=re.S)
        text = re.sub(r"//[^\n]*", "", text)
        text = re.sub(r"^\s*#[^\n]*", "", text, flags=re.M)
        toks = [(m.group(), m.start()) for m in
                re.finditer(r'[A-Za-z_]\w*|0x[0-9A-Fa-f]+|\d+|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|\S', text)]
        line_of = lambda pos: text.count("\n", 0, pos) + 1
        depth, top, kind, head = 0, None, None, []
        braces = []  # [start tok index, field index, designator]
        parens = []  # [callee, arg index, start tok index]
        for i, (tok, pos) in enumerate(toks):
            if tok == "{":
                if depth == 0:
                    h = " ".join(head)
                    m = re.findall(r"([A-Za-z_]\w*)(?:\s*\[[^\]]*\])*\s*=\s*$", h)
                    if m:
                        top, kind = m[-1], "data"
                    else:
                        m = re.findall(r"([A-Za-z_]\w*)\s*\(", h)
                        top, kind = (m[0] if m else None), "func"
                    head = []
                depth += 1
                braces.append([i, 0, None])
                continue
            if tok == "}":
                depth -= 1
                if braces:
                    braces.pop()
                if depth == 0:
                    top = None
                continue
            if depth == 0:
                head = [] if tok == ";" else head + [tok]
                continue
            prev = toks[i - 1][0]
            if tok == "(":
                parens.append([prev if IDENT.fullmatch(prev) else None, 0, i])
            elif tok == ")":
                if parens:
                    parens.pop()
            elif tok == ";":
                parens = []
            elif tok == ",":
                if parens:
                    parens[-1][1] += 1
                elif braces:
                    braces[-1][1] += 1
                    braces[-1][2] = None
            elif IDENT.fullmatch(tok) and prev == "." and braces and not parens:
                braces[-1][2] = tok
            if kind == "func" and IDENT.fullmatch(tok):
                self.fidents[top].add(tok)
            if tok not in self.label_addr:
                continue
            if kind == "data":
                b = braces[-1]
                j, d = b[0] + 1, 1
                while d and j < len(toks):  # the whole brace group
                    d += {"{": 1, "}": -1}.get(toks[j][0], 0)
                    j += 1
                group = " ".join(t for t, _ in toks[b[0]:j])
                t = CTable(path.name, top, b[2] or b[1], group, comments.get(line_of(pos), ""), len(braces))
                t.pos = (str(path), pos)
                self.ctab[tok].append(t)
            elif kind == "func":
                calls = [c for c in parens if c[0]]
                if not calls:
                    call = CCall(path.name, top, None, None, [], tok)
                else:
                    c = calls[-1]
                    args, j, d, cur = [], c[2] + 1, 1, []
                    while j < len(toks):
                        t = toks[j][0]
                        if t in "([{":
                            d += 1
                        elif t in ")]}":
                            d -= 1
                            if d == 0:
                                break
                        if t == "," and d == 1:
                            args.append(" ".join(cur))
                            cur = []
                        else:
                            cur.append(t)
                        j += 1
                    args.append(" ".join(cur))
                    call = CCall(path.name, top, c[0], c[1], args, tok)
                end = text.find(";", pos)
                call.after = " ".join(text[end + 1:end + 400].split())  # the next statements
                self.ccall[tok].append(call)
                self.cfunc[top].append(call)


class CTable:
    def __init__(self, file, table, field, group, comment, depth):
        self.file, self.table, self.field, self.group = file, table, field, group
        self.comment, self.depth = comment, depth


class CCall:
    def __init__(self, file, func, callee, arg, args, label):
        self.file, self.func, self.callee, self.arg = file, func, callee, arg
        self.args, self.label = args, label

    @property
    def dest(self):
        return self.args[1] if len(self.args) > 1 else ""


# --------------------------------------------------------------------------
# rules

# Struct tables in data/rom: label -> (stride, {field offset: (FORMAT, role)}),
# first entry at the label (FaceInfoTable: fid 0 is one entry before the data).
DATA_TABLES = {
    # struct FaceInfo (gbafe/face.h)
    "FaceInfoTable": (0x1C, {0x00: ("4bpp", "face"), 0x04: ("4bpp", "chibi"), 0x08: ("palette", "pal"),
                             0x10: ("4bpp", "card")}),
    # struct BackgroundInfo (gbafe/event.h): img, tsa (plain), pal (plain)
    "gBackgroundTable": (0xC, {0x0: ("4bpp", "img"), 0x4: ("tsa", "tsa"), 0x8: ("palette", "pal")}),
    # battle backgrounds (banim-ekrpopup.c): img, tile map, palette
    "gBattleBGDataTable": (0xC, {0x0: ("4bpp", "img"), 0x4: ("tilemap", "tsa"), 0x8: ("palette", "pal")}),
    # struct OpAnimImgEntry (opanim.c): img0, img1, tsa
    "gUnk_08CEF594": (0xC, {0x0: ("4bpp", "img"), 0x4: ("4bpp", "img"), 0x8: ("tsa", "tsa")}),
    "gUnk_08CEF630": (0xC, {0x0: ("4bpp", "img"), 0x4: ("4bpp", "img"), 0x8: ("tsa", "tsa")}),
    # struct EndingCgScrollEnt (ending_details.c): img[7], tsa[4]
    "gEndingCgScrollLut": (0x2C, {o: ("4bpp", "img") for o in range(0, 0x1C, 4)}),
    "gEndingCgScroll2Lut": (0x2C, {o: ("4bpp", "img") for o in range(0, 0x1C, 4)}),
    # StartEpilogueScroll (epilogue.c): palette, then (img, tsa) pairs
    "gEpilogueEndScroll": (0x8, {0x4: ("4bpp", "img"), 0x0: ("tsa", "tsa")}),
    # world map sprite animations (worldmap.c): .img decompressed to OBJ VRAM
    "gWmSpriteAnimTable": (0x14, {0x0: ("4bpp", "img")}),
    "gUiWindowFrameImgLut": (0x4, {0x0: ("4bpp", "img")}),
    "gUnknown_08BA1F08": (0x4, {0x0: ("4bpp", "img")}),     # flux (banim-efxmagic-flux.c) proc->img
    "gUnknown_08BA1E64": (0x4, {0x0: ("tilemap", "tsa")}),  # proc->tsal/tsar
    # opening animation image list (opanim.c: sub_080BCB1C(entry->img[i]))
    "gUnk_08CEF4BC": (0x4, {0x0: ("4bpp", "img")}),
}
# CG images made of 0x800-byte pieces (gCGDataTable entries with flag 1)
CG_PIECE_TABLE = re.compile(r"gUnk_08CED[0-9A-F]{3}$")

IMG_NAME = re.compile(r"(^|_)(Img|Imgs|Gfx|ImgArray|ImgLut|ImgList)(_|$)|^(Img|Gfx)|Img(Array|Lut)")
TSA_NAME = re.compile(r"(^|_)(Tsa|TSA|TSAs|Tm)(_|$)|^(Tsa|TSA|Tm)|Tsa(Array|Lut|List)|_tsa")
PAL_NAME = re.compile(r"^(Pal|gPal)|(^|_)Pal(_|$)|Pal(Array|Lut)")

VRAM_DEST = re.compile(r"VRAM|0x060|0x0600|0x0601|GetBgChrOffset|chr|vram|OBJCHR|BGCHR|CHR_SIZE")
TM_DEST = re.compile(r"(\(\s*\w+\s*\*\s*\)\s*)?(gBg\d?Tm|gEkrTsaBuffer|gUiTmScratch\w*)")
PAL_DEST = re.compile(r"PAL_|gPal|Palette")

ASSET_TAGS = {"img_a": "4bpp", "img_b": "4bpp", "tileset": "tileconfig", "map": "map",
              "pal": "palette", "img_anims": "data", "pal_anims": "data", "map_changes": "data"}
BMFX_TYPES = {"BMFX_CONFT_ZIMG": "4bpp", "BMFX_CONFT_IMG": "4bpp", "BMFX_CONFT_TSA": "tsa",
              "BMFX_CONFT_PAL": "palette"}

# functions that take an image / tile map / palette as their first argument
IMG_CALLS = {"SpellFx_RegisterObjGfx": "obj", "SpellFx_RegisterBgGfx": "bg",
             "CRSpell_RegisterObjGfx": "obj", "CRSpell_RegisterBgGfx": "bg",
             "StartManimEffectAnimator": "obj", "StartManimAntitoxinFx": "obj",
             "UnpackManimWindowGraphics": "bg", "sub_080BCB1C": "bg"}
TSA_CALLS = {"PutCompressedTsa": 1, "SpellFx_WriteBgMap": 0, "TmApplyTsa": 1, "TmApplyTsa_thm": 1}
PAL_CALLS = {"SpellFx_RegisterObjPal": "obj", "SpellFx_RegisterBgPal": "bg",
             "CRSpell_RegisterObjPal": "obj", "CRSpell_RegisterBgPal": "bg",
             "ApplyPalette": None, "ApplyPalettes": None, "CopyToPaletteBuffer": None,
             "sub_080010F4": "bg"}
DECOMP_CALLS = ("Decompress", "LZ77UnCompVram", "LZ77UnCompWram", "CopyDataWithPossibleUncomp")


def tsa_header_ok(d):
    """FE TSA: u8 width-1, u8 height-1, then width*height screen entries."""
    if len(d) < 2:
        return False
    n = 2 + 2 * (d[0] + 1) * (d[1] + 1)
    return len(d) in (n, (n + 3) & ~3)


def map_layout_ok(d):
    """Chapter map: u8 width, u8 height, then width*height u16 metatile ids."""
    if len(d) < 2 or not d[0] or not d[1]:
        return False
    n = 2 + 2 * d[0] * d[1]
    return len(d) in (n, (n + 3) & ~3)


class Vote:
    """Formats proposed for one entry, with the reasons."""
    def __init__(self):
        self.fmts = collections.Counter()
        self.why = collections.defaultdict(list)

    def add(self, fmt, why):
        self.fmts[fmt] += 1
        self.why[fmt].append(why)


def formats(refs, data_of):
    """{addr: Vote} for every manifest entry."""
    votes = collections.defaultdict(Vote)
    entries = refs.entries
    by_label = {}
    for a, e in entries.items():
        for n in refs.labels_at.get(a, []):
            by_label[n] = a

    # data tables
    for a in entries:
        for table, ta, off in refs.data.get(a, []):
            if table in DATA_TABLES:
                stride, fields = DATA_TABLES[table]
                f = fields.get(off % stride)
                if f:
                    votes[a].add(f[0], f"{table}+{off % stride:#x}")
            elif CG_PIECE_TABLE.match(table):
                votes[a].add("4bpp", "gCGDataTable piece list")
            elif IMG_NAME.search(table):
                votes[a].add("4bpp", f"in {table}")
            elif TSA_NAME.search(table):
                votes[a].add("tsa", f"in {table}")
            elif PAL_NAME.search(table):
                votes[a].add("palette", f"in {table}")

    # C tables and calls
    for label, a in by_label.items():
        for t in refs.ctab.get(label, []):
            if t.table == "gChapterDataAssetTable":
                tag = t.comment.split(":")[0].strip()
                if tag in ASSET_TAGS:
                    votes[a].add(ASSET_TAGS[tag], f"gChapterDataAssetTable {tag}")
            elif t.table == "gMuInfoTable" and t.field == 0:
                votes[a].add("4bpp", "gMuInfoTable.img")
            elif t.table == "gCGDataTable":
                if t.field == 1 and re.match(r"\{\s*0\s*,", t.group):
                    votes[a].add("4bpp", "gCGDataTable.img")
                elif t.field == 2:
                    votes[a].add("tsa", "gCGDataTable.tsa")
                elif t.field == 3:
                    votes[a].add("palette", "gCGDataTable.pal")
            elif t.table.startswith("BmBgfxConf_") and t.field in (1, "data"):
                m = re.search(r"BMFX_CONFT_\w+", t.group)
                if m and m.group() in BMFX_TYPES:
                    votes[a].add(BMFX_TYPES[m.group()], f"{t.table} {m.group()}")
            elif IMG_NAME.search(t.table) or t.table == "Imgs":
                votes[a].add("4bpp", f"in {t.table}")
            elif TSA_NAME.search(t.table):
                votes[a].add("tsa", f"in {t.table}")
            elif PAL_NAME.search(t.table):
                votes[a].add("palette", f"in {t.table}")
        for c in refs.ccall.get(label, []):
            fmt = call_format(c, refs)
            if fmt:
                votes[a].add(fmt, f"{c.func}: {c.callee}({', '.join(c.args)})")

    # tile maps: FE TSA (with the size header) or plain screen entries
    for a, v in votes.items():
        if "tsa" in v.fmts or "tilemap" in v.fmts:
            d = data_of(entries[a])
            fmt = "tsa" if tsa_header_ok(d) else "tilemap"
            n = v.fmts.pop("tsa", 0) + v.fmts.pop("tilemap", 0)
            why = v.why.pop("tsa", []) + v.why.pop("tilemap", [])
            v.fmts[fmt] += n
            v.why[fmt] += why
    return votes


def call_format(c, refs):
    if c.callee is None:
        return None
    if c.callee in TSA_CALLS and c.arg == TSA_CALLS[c.callee]:
        return "tsa"
    if c.callee in IMG_CALLS and c.arg == 0:
        return "4bpp"
    if c.callee in PAL_CALLS and c.arg == 0:
        return "palette"
    if c.callee in DECOMP_CALLS and c.arg == 0:
        dest = c.dest
        if TM_DEST.fullmatch(dest.strip()):
            return "tsa"
        if PAL_DEST.search(dest):
            return "palette"
        if VRAM_DEST.search(dest):
            return "4bpp"
        if re.search(r"gBuf|buf|gGenericBuffer", dest):
            return "buffer"  # see buffer_use()
    return None


def image_kind(c):
    """'obj' or 'bg' for an image load, None if unknown."""
    if c.callee in IMG_CALLS:
        return IMG_CALLS[c.callee]
    if c.callee in DECOMP_CALLS and c.arg == 0:
        d = c.dest
        if re.search(r"OBJ_VRAM|0x0601|0x06010000|OBJCHR", d):
            return "obj"
        if re.search(r"BG_VRAM|GetBgChrOffset|BGCHR|0x0600[0-9A-F]", d):
            return "bg"
    return None


def palette_kind(c):
    """('obj'|'bg'|None, bank count) for a palette load."""
    if c.callee not in PAL_CALLS or c.arg != 0:
        return None
    k = PAL_CALLS[c.callee]
    count = 1
    if c.callee in ("ApplyPalette", "ApplyPalettes") and len(c.args) > 1:
        idx = c.args[1]
        m = re.fullmatch(r"(0x[0-9A-Fa-f]+|\d+)", idx.strip())
        if m:
            k = "obj" if int(m.group(), 0) >= 0x10 else "bg"
        elif "OBJPAL" in idx or "0x10 +" in idx or "+ 0x10" in idx:
            k = "obj"
        if c.callee == "ApplyPalettes" and len(c.args) > 2:
            m = re.fullmatch(r"(0x[0-9A-Fa-f]+|\d+)", c.args[2].strip())
            if m:
                count = int(m.group(), 0)
    elif c.callee.startswith(("SpellFx", "CRSpell")) and len(c.args) > 1:
        m = re.fullmatch(r"(0x[0-9A-Fa-f]+|\d+)", c.args[1].strip())
        if m:
            count = max(1, int(m.group(), 0) // 0x20)
    return k, count


# --------------------------------------------------------------------------
# classify: formats, names, image layouts, palette pairings

# Blobs whose users say nothing about the format (unreferenced, or passed
# through a RAM pointer / debug variable); rendered and looked at.
LOOKED_AT = {
    0x081BE518: "4bpp",  # dragon sprite frames (unreferenced)
    0x081C270C: "4bpp",  # (unreferenced)
    0x081C2CA0: "4bpp",  # (unreferenced)
    0x081DA264: "4bpp",  # gBanimForceUnitChgDebug sprite sheets
    0x081DA6D8: "4bpp",
    0x081DAB78: "4bpp",
    0x08616FC4: "4bpp",  # opening: decompressed to *gUnk_08CEF078
    0x0867453C: "4bpp",  # opening: decompressed to *gUnk_08CEF080, then to BG VRAM
    0x086758E0: "4bpp",
}
# gUnk_08CEF788: (image, TSA gUnk_086157E4) pairs: frames of an opening movie
MOVIE_TABLE = "gUnk_08CEF788"
# local arrays in functions: talk.c sub_080099A4 decompresses them to BG VRAM
LOCAL_IMAGE_ARRAYS = {"sub_080099A4"}


def classify():
    import gfx
    rom = Path("baserom.gba").read_bytes()
    entries = gfx.read_manifest()
    refs = Refs(rom, entries)
    cache = {}

    def data_of(e):
        if e.addr not in cache:
            cache[e.addr] = gfx.rom_data(rom, e)
        return cache[e.addr]

    votes = formats(refs, data_of)
    # battle animation tables (gbafe/banim.h): name[12] then pointers
    banim = {}
    for table, stride, fields in (
            ("banim_data", 0x20, {0x10: "banim_script", 0x14: "banim_oam", 0x18: "banim_oam", 0x1C: "palette"}),
            ("character_battle_animation_palette_table", 0x10, {0xC: "palette"}),
            ("battle_terrain_table", 0x18, {0xC: "4bpp", 0x10: "palette"})):
        a, i = refs.addr(table), 0
        while 0x20 < rom[a - ROM_BASE] < 0x7F:
            abbr = rom[a - ROM_BASE:a - ROM_BASE + 12].split(b"\0")[0].decode("ascii", "replace")
            for off, fmt in fields.items():
                t = refs.word(a + off)
                if t in entries:
                    votes[t].add(fmt, f"{table}.{off:#x}")
                    banim.setdefault(t, (table, i, abbr, off))
            a += stride
            i += 1
    sheets = {}  # sheet addr -> (banim_data index, abbr, k, palette addr)
    for t, (table, i, abbr, off) in list(banim.items()):
        if table == "banim_data" and off == 0x10:
            for k, s in enumerate(sorted(datasplit.banim_sheets(rom, t))):
                if s in entries:
                    votes[s].add("4bpp", "banim script frame")
                    sheets.setdefault(s, (i, abbr, k, banim_pal(rom, refs, t)))
    for a, fmt in LOOKED_AT.items():
        if a in entries:
            votes[a].add(fmt, "looked at")
    for a in entries:
        if any(t == MOVIE_TABLE and off % 8 == 0 for t, _, off in refs.data.get(a, [])):
            votes[a].add("4bpp", f"{MOVIE_TABLE} frame")
        for n in refs.labels_at.get(a, []):
            for c in refs.ccall.get(n, []):
                if c.callee is None and c.func in LOCAL_IMAGE_ARRAYS:
                    votes[a].add("4bpp", f"{c.func} local image list")
                if c.callee in DECOMP_CALLS and c.arg == 0 and call_format(c, refs) == "buffer":
                    fmt = buffer_use(c)
                    if fmt:
                        votes[a].add(fmt, f"{c.func}: {c.callee}({', '.join(c.args)}) then {c.after[:40]}")

    # decide
    changed = 0
    for a, e in entries.items():
        if e.fmt in ("banim_script", "banim_oam"):
            continue  # from the battle animation tables; kept
        v = votes.get(a)
        fmts = collections.Counter()
        for f, n in (v.fmts.items() if v else []):
            if f != "buffer":
                fmts["tsa" if f == "tilemap" else f] += n
        if len(fmts) == 1:
            fmt = next(iter(fmts))
        elif fmts:
            fmt = max(fmts, key=lambda f: (fmts[f], f == "4bpp"))
            print(f"note: {e.name}: {fmts} -> {fmt}", file=sys.stderr)
        else:
            fmt = name_format(refs.labels_at.get(a, [e.name])) or e.fmt
        if fmt in ("tsa", "tilemap"):
            fmt = "tsa" if tsa_header_ok(data_of(e)) else "tilemap"
        if fmt != e.fmt:
            e.fmt = fmt
            changed += 1

    names = Namer(entries)
    pairs = Pairs(refs, entries, names)
    name_entries(refs, entries, names, pairs, banim, sheets, data_of)
    pair_functions(refs, entries, pairs)
    # image layouts and palettes
    for a, e in entries.items():
        if e.fmt not in gfx.IMAGE_FORMATS:
            continue
        n = len(data_of(e))
        tsize = 8 * gfx.IMAGE_FORMATS[e.fmt]
        if n % tsize or n == 0:
            e.opts.pop("w", None)
            continue
        ntiles = n // tsize
        if "w" not in e.opts:
            e.opts["w"] = str(pairs.width.get(a) or default_width(ntiles))
        if ntiles % int(e.opts["w"]):
            e.opts["tiles"] = str(ntiles)
        else:
            e.opts.pop("tiles", None)
        if "pal" not in e.opts and a in pairs.pal:
            pa, bank = pairs.pal[a]
            e.opts["pal"] = entries[pa].name + (f":{bank}" if bank else "")
    gfx.write_manifest(entries)
    counts = collections.Counter(e.fmt for e in entries.values())
    imgs = [e for e in entries.values() if e.is_image]
    print(f"{changed} formats changed; {len(entries)} entries: {dict(sorted(counts.items()))}")
    print(f"{len(imgs)} images, {sum(1 for e in imgs if e.pal)} with a palette; "
          f"{pairs.created} plain palettes added")


def banim_pal(rom, refs, script):
    """The palette of the battle animation whose script is at script."""
    a = refs.addr("banim_data")
    while 0x20 < rom[a - ROM_BASE] < 0x7F:
        if refs.word(a + 0x10) == script:
            return refs.word(a + 0x1C)
        a += 0x20
    return None


def default_width(ntiles):
    return 32 if ntiles >= 32 else ntiles


def name_format(labels):
    for n in labels:
        if n.startswith(("Img_", "Gfx_", "gGfx")) or n.endswith(("_sheet", "Gfx")):
            return "4bpp"
        if n.startswith(("Tsa_", "Tm_")):
            return "tsa"
        if n.startswith(("Pal_", "gPal")) or n.endswith("Pal"):
            return "palette"
    return None


def buffer_use(c):
    """Format of data decompressed to a buffer, from what the function does next."""
    m = re.search(r"(TmApplyTsa\w*|PutTmLinear|Copy2dChr|sub_08047CB8|CpuFastCopy|CpuCopy\w*)\s*\(", c.after)
    if not m:
        return None
    return "tsa" if m.group(1).startswith(("TmApplyTsa", "PutTmLinear")) else "4bpp"


class Namer:
    """Unique entry names; only entries still named after a gUnk_ label change."""
    def __init__(self, entries):
        self.entries = entries
        self.used = {e.name for e in entries.values()}

    @staticmethod
    def generic(name):
        return re.fullmatch(r"(gUnk_|gUnknown_)[0-9A-F]{8}_*", name) is not None

    def set(self, a, name, force=False):
        e = self.entries.get(a)
        if e is None or not (force or self.generic(e.name)):
            return False
        name = re.sub(r"[^A-Za-z0-9_/]", "_", name)
        base, k = name, 1
        while name in self.used:
            k += 1
            name = f"{base}_{k}"
        self.used.discard(e.name)
        self.used.add(name)
        e.name = name
        return True


class Pairs:
    """Image -> (palette entry addr, bank); makes plain (`raw`) palette entries."""
    def __init__(self, refs, entries, names):
        self.refs, self.entries, self.names = refs, entries, names
        self.pal = {}
        self.width = {}
        self.created = 0
        bounds = set()
        for kind, a, _, extra in refs.items:
            if kind in ("label", "ptr"):
                bounds.add(a)
            elif kind == "section":
                bounds.update((a, extra))
        for a, e in entries.items():
            bounds.update((a, a + e.size))
        self.bounds = sorted(bounds)
        self.sections = [(a, extra) for kind, a, _, extra in refs.items if kind == "section"]

    def palette(self, a, banks=1, name=None):
        """The palette entry at a (made a plain `raw` entry if needed), or None."""
        import gfx
        if a is None:
            return None
        if a in self.entries:
            if self.entries[a].fmt != "palette":
                return None
            if name:
                self.names.set(a, name)
            return a
        if a not in self.refs.labels_at or a % 2:
            return None
        if not any(s <= a < e for s, e in self.sections):
            return None  # not in data/rom (defined in source)
        nxt = self.bounds[bisect.bisect_right(self.bounds, a)]
        size = min(banks * 0x20, (nxt - a) & ~0x1F)
        if size < 0x20:
            return None
        label = sorted(self.refs.labels_at[a], key=Namer.generic)[0]
        e = gfx.Entry(a, size, "palette", label, {"raw": True})
        self.entries[a] = e
        self.names.used.add(label)
        if name:  # a new entry: its name is only a file name, not the label's
            self.names.set(a, name, force=True)
        self.created += 1
        return a

    def pair(self, img, pal, bank=0):
        if img in self.entries and pal is not None and img not in self.pal:
            self.pal[img] = (pal, bank)


def screen_banks(hw):
    c = collections.Counter(v >> 12 for v in hw)
    return c.most_common(1)[0][0], max(c) + 1


def tsa_banks(d):
    """(most used palette bank, number of banks) of a TSA with size header."""
    n = (d[0] + 1) * (d[1] + 1)
    return screen_banks(struct.unpack_from(f"<{n}H", d, 2))


def chapter_name(comment):
    m = re.search(r":\s*(CHAPTER_\w+|0x[0-9A-F]+)", comment)
    if not m:
        return None
    s = m.group(1)
    return "ch" + (s[8:] if s.startswith("CHAPTER_") else s[2:])


def by_label(refs, entries):
    return {n: a for a in entries for n in refs.labels_at.get(a, [])}


def name_entries(refs, entries, names, pairs, banim, sheets, data_of):
    """Descriptive names (and palette pairings) from the tables using the data."""
    rom = refs.rom
    word = refs.word

    def ok(t):
        return t in entries

    # portraits (struct FaceInfo); names from gCharacterData
    face_names = {}
    text = Path("src/data/characters.c").read_text()
    for m in re.finditer(r"\.nameTextId = 0x[0-9A-F]+, // ([^\n]+)\n(?:[^\n]*\n){0,8}?\s*\.portraitId = (0x[0-9A-F]+),", text):
        face_names.setdefault(int(m.group(2), 16), re.sub(r"\W", "", m.group(1).replace(" ", "_")))
    base = refs.addr("FaceInfoTable")
    for fid in range(1, 0x200):
        a = base + fid * 0x1C
        if not ok(word(a)):
            break
        who = face_names.get(fid, "")
        stem = f"portrait/{fid:03X}" + (f"_{who}" if who else "")
        pal = pairs.palette(word(a + 8), 1, f"{stem}_pal")
        for off, suffix, w in ((0, "face", 32), (4, "chibi", 4), (0x10, "card", 10)):
            t = word(a + off)
            if ok(t):
                names.set(t, f"{stem}_{suffix}")
                pairs.pair(t, pal)
                pairs.width[t] = w

    # event backgrounds (struct BackgroundInfo: img, plain tsa, plain pal)
    base = refs.addr("gBackgroundTable")
    for i in range(0x100):
        img, tsa, pal = (word(base + i * 0xC + k) for k in (0, 4, 8))
        if not (ok(img) and ROM_BASE <= tsa < 0x0A000000):
            break
        bank, nbanks = tsa_banks(rom[tsa - ROM_BASE:])
        names.set(img, f"bg/bg_{i:02X}")
        pairs.pair(img, pairs.palette(pal, nbanks, f"bg/bg_{i:02X}_pal"), bank)

    # battle backgrounds (img, tile map, palette: all compressed)
    base = refs.addr("gBattleBGDataTable")
    for i in range(0x100):
        img, tm, pal = (word(base + i * 0xC + k) for k in (0, 4, 8))
        if not (ok(img) and ok(tm) and ok(pal)):
            break
        for t, suffix in ((img, ""), (tm, "_tilemap"), (pal, "_pal")):
            names.set(t, f"btl_bg/btl_bg_{i:02X}{suffix}")
        d = data_of(entries[tm])
        bank, _ = screen_banks(struct.unpack_from(f"<{len(d) // 2}H", d))
        pairs.pair(img, pal, max(0, bank - 6))  # the palette goes to BG palette 6

    # battle animations, their palettes and sprite sheets, battle terrains
    for t, (table, i, abbr, off) in banim.items():
        if table == "banim_data":
            what = {0x14: "oam_r", 0x18: "oam_l", 0x1C: "pal"}.get(off)
            if what:
                names.set(t, f"banim/{i + 1:03X}_{abbr}/{what}")
        elif table == "character_battle_animation_palette_table":
            names.set(t, f"banim/chara_pal/{i + 1:02X}_{abbr}")
        elif table == "battle_terrain_table" and off == 0xC:
            names.set(t, f"btl_terrain/{i:02X}_{abbr}")
            p = word(refs.addr(table) + i * 0x18 + 0x10)
            pairs.pair(t, pairs.palette(p, 1, f"btl_terrain/{i:02X}_{abbr}_pal"))
    for s, (i, abbr, k, pal) in sheets.items():
        names.set(s, f"banim/{i + 1:03X}_{abbr}/sheet_{k}")
        if pal in entries:
            pairs.pair(s, pal)

    # chapter map assets (gChapterDataAssetTable; the comment says what)
    labels = by_label(refs, entries)
    for label, a in labels.items():
        for t in refs.ctab.get(label, []):
            if t.table != "gChapterDataAssetTable":
                continue
            tag = t.comment.split(":")[0].strip()
            idx = t.field if isinstance(t.field, int) else 0
            ch = chapter_name(t.comment) or f"{idx:02X}"
            n = {"img_a": f"map/obj_{idx:02X}", "img_b": f"map/obj_{idx:02X}_b",
                 "tileset": f"map/tileconfig_{idx:02X}", "pal": f"map/palette_{ch}",
                 "map": f"map/layout_{ch}", "img_anims": f"map/tile_anims_{idx:02X}",
                 "pal_anims": f"map/pal_anims_{idx:02X}", "map_changes": f"map/changes_{ch}"}.get(tag)
            if n:
                names.set(a, n)
    # chapter tilesets shown with the palette of the first chapter using them
    chap_pal, chap_img = {}, {}
    for line in Path("src/data/chapterassets.c").read_text().splitlines():
        m = re.search(r"\(void const \*\) (\w+), // (img_a|img_b|pal): (.*)", line)
        if m and m.group(1) in refs.label_addr:
            side = chap_pal if m.group(2) == "pal" else chap_img
            side[refs.addr(m.group(1))] = re.findall(r"CHAPTER_\w+|0x[0-9A-F]+", m.group(3))
    first_pal = {}
    for pa, chs in chap_pal.items():
        for ch in chs:
            first_pal.setdefault(ch, pa)
    for ia, chs in chap_img.items():
        for ch in chs:
            if ch in first_pal:
                pa = first_pal[ch]
                pairs.pair(ia, pairs.palette(pa, 10, "map/palette_" + chapter_name(": " + chap_pal[pa][0])))
                break

    # map sprites (gMuInfoTable, unit_icon_wait_table), shown in blue
    blue = pairs.palette(refs.addr("Pal_MapSprite"), 4, "unit_icon/map_sprite_pal")
    for m in re.finditer(r"\[(CLASS_\w+) - 1\] = \{ \(u8 const \*\) (\w+)", Path("src/mu.c").read_text()):
        a = refs.addr(m.group(2))
        if ok(a):
            names.set(a, f"unit_icon/move/{m.group(1)[6:].lower()}")
            pairs.width[a] = 4
            pairs.pair(a, blue)
    for m in re.finditer(r"\{ \w+, UNIT_ICON_SIZE_(\d+)x\d+, (\w+) \}",
                         Path("src/data/unit_icon_wait.c").read_text()):
        a = refs.addr(m.group(2))
        if ok(a):
            pairs.width[a] = int(m.group(1)) // 8
            pairs.pair(a, blue)

    # CG images (gCGDataTable: split flag, img or list of 10 pieces, tsa, pal)
    text = Path("src/cg.c").read_text()
    body = text[text.find("gCGDataTable[] = {"):]
    for i, m in enumerate(re.finditer(r"\{ (\d), \(void \*\) (\w+), \(u8 \*\) (\w+), \(u16 \*\) (\w+) \}", body)):
        split, img, tsa, pal = int(m.group(1)), refs.addr(m.group(2)), refs.addr(m.group(3)), refs.addr(m.group(4))
        if None in (img, tsa, pal):
            continue
        bank, nbanks = tsa_banks(rom[tsa - ROM_BASE:])
        p = pairs.palette(pal, nbanks, f"cg/cg_{i:02X}_pal")
        imgs = [img] if not split else [word(img + 4 * k) for k in range(10)]
        for k, t in enumerate(imgs):
            if ok(t):
                names.set(t, f"cg/cg_{i:02X}" + (f"_part_{k}" if split else ""))
                pairs.pair(t, p, bank)

    # epilogue scroll: palette, then (img, tsa) pairs
    a = refs.addr("gEpilogueEndScroll")
    p = pairs.palette(word(a), 8)
    k = 0
    while ok(word(a + 4 + 8 * k)):
        t = word(a + 4 + 8 * k)
        names.set(t, f"ending/epilogue_scroll_{k:02X}")
        pairs.pair(t, p)
        k += 1

    # the rest: name members after the (data or C) table they are in
    skip = {"FaceInfoTable", "gBackgroundTable", "gBattleBGDataTable", "banim_data",
            "gChapterDataAssetTable", "gMuInfoTable", "gCGDataTable", None}
    for a, e in entries.items():
        for table, ta, off in refs.data.get(a, []):
            if table not in skip:
                stride = DATA_TABLES.get(table, (4,))[0]
                names.set(a, f"{table_dir(table)}/{table_stem(table)}_{off // stride:02X}")
        for n in refs.labels_at.get(a, []):
            for t in refs.ctab.get(n, []):
                if t.table not in skip:
                    idx = t.field if isinstance(t.field, int) else 0
                    names.set(a, f"{table_dir(t.table)}/{table_stem(t.table)}_{idx:02X}")


def table_dir(table):
    t = table.lower()
    if table.startswith(("gUnk_08CEF", MOVIE_TABLE)) or t.startswith("op"):
        return "op_anim"
    if table.startswith("gUnk_08CED"):
        return "cg"
    if "ending" in t or "epilogue" in t:
        return "ending"
    if "bmbgfx" in t:
        return "bmfx"
    if "efx" in t or "bg" in t or "classreel" in t or "spell" in t or "ekr" in t or "08ba1" in t:
        return "efx"
    return "misc"


def table_stem(table):
    return re.sub(r"^(gUnknown_|gUnk_|g(?=[A-Z]))", "", table)


def table_kind(table):
    if re.search(r"Obj|OBJ", table):
        return "obj"
    if re.search(r"Bg|BG", table):
        return "bg"
    return None


def pair_functions(refs, entries, pairs):
    """Images and palettes loaded by the same function (or BmBgfxConf list)."""
    members = collections.defaultdict(set)  # table name -> image entries in it
    for a, e in entries.items():
        if e.fmt not in ("4bpp", "8bpp"):
            continue
        for table, _, _ in refs.data.get(a, []):
            members[table].add(a)
        for n in refs.labels_at.get(a, []):
            for t in refs.ctab.get(n, []):
                if t.table:
                    members[t.table].add(a)
    for func in set(refs.cfunc) | set(refs.fidents):
        calls = refs.cfunc.get(func, [])
        imgs, pals = [], []
        for table in refs.fidents.get(func, ()):
            if table in members and not table.startswith(("BmBgfxConf_", "gChapterDataAssetTable")):
                imgs += [(a, table_kind(table)) for a in members[table]]
        for c in calls:
            a = refs.addr(c.label)
            k = palette_kind(c)
            if k:
                pals.append((a, k[0], k[1]))
            elif a in entries and entries[a].fmt in ("4bpp", "8bpp"):
                imgs.append((a, image_kind(c)))
                m = re.match(r"(Copy2dChr|sub_08047CB8)\s*\(\s*gBuf[^,]*,[^,]*,\s*(\d+)\s*,", c.after)
                if c.callee in DECOMP_CALLS and m:
                    pairs.width.setdefault(a, int(m.group(2)))
        for a, kind in imgs:
            cand = {p for p, pk, n in pals if kind is None or pk is None or pk == kind}
            if len(cand) == 1:
                p = cand.pop()
                n = max(n for pa, _, n in pals if pa == p)
                pairs.pair(a, pairs.palette(p, n))
    # BmBgfxConf lists: the last palette before each image
    tables = collections.defaultdict(list)
    for label, uses in refs.ctab.items():
        for t in uses:
            if t.table and t.table.startswith("BmBgfxConf_"):
                tables[t.table].append((t.pos, label, t.group))
    for table, items in tables.items():
        pal = None
        for pos, label, group in sorted(items):
            a = refs.addr(label)
            if "BMFX_CONFT_PAL" in group:
                pal = pairs.palette(a, 1)
            elif "IMG" in group and pal is not None:
                pairs.pair(a, pal)
