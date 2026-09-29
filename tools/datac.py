#!/usr/bin/env python3
"""Convert typed data objects from data/rom/*.s to C, driven by the C structs.

Shared module for the data conversions (batch 1's tools/procdis.py imports the
ROM index from here).  Usage:

  tools/datac.py emit TYPE OBJ...
        C definitions of the objects, each under SECTION(".rodata.<ADDR>"),
        `const`, decoded as arrays of TYPE.  OBJ is a label of data/rom, or
        0xADDR, optionally NAME=0xADDR (define under a new name) and
        `:N` after it (N elements instead of "up to the next label").
        TYPE is a struct name, a typedef (ProcFunc), a pointer spec such as
        `u8 *` / `const struct Text *` (the elements are then `* const`), or
        any of these followed by dimensions (`"u8 const * [4]"` for a
        `[][4]` table).  Arrays of MenuItemDef and StatScreenTextInfo stop
        at their all-zero terminator (TERMINATED).  Problems go to stderr and
        are marked `/* FIXME */` in the output.
  tools/datac.py add [--hdr HEADER] FILE TYPE OBJ...
        `emit`, appended to the C file FILE, plus the data/layout.txt lines
        for it; then the symbols the code refers to that FILE cannot see
        declared (with the prototype the field type implies); --hdr appends
        those declarations to HEADER (functions to the header of the module
        that defines them, if it has one); without it they go into FILE.
        An object that has an `extern` already gets that line rewritten to
        the new type
  tools/datac.py add|emit [--hdr H] FILE AnimScr OBJ...
        animation scripts (include/gbafe/anime.h): decoded into ANIMSCR_*
        macros, the sprites they name declared as `extern const struct
        AnimSpriteData` (docs/port-data.md, "Animation scripts")
  tools/datac.py struct TYPE
        the parsed layout of a struct (offset, size, field, kind)
  tools/datac.py decl NAME...
        where NAME is declared (header/source, type) and what defines it

Bytes come from baserom.gba.  A pointer word is the `.4byte SYMBOL [+ ADDEND]`
of data/rom/*.s (dataptrs.py decided it is a pointer); a pointer field whose
word the assembly left raw is looked up by exact address in fe7u.elf (`nm`,
so `make` first) and the labels of data/rom.  A function pointer loses its
Thumb bit (C function pointers carry it).

Struct layouts are parsed from the definitions in include/ and src/ (fields,
arrays, nested structs, function pointers, STRUCT_PAD; natural ARM
alignment).  Bit-fields and unions are not supported: the tool says so.
"""
import bisect
import re
import struct as _struct
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
BASE = 0x08000000


# ---------------------------------------------------------------- ROM index

def build_rom_index():
    """Parse data/rom/*.s into (labels, ptrs, order, cover).

    labels: name -> address; ptrs: address -> (symbol, addend);
    order: sorted [(address, name)]; cover: merged [(start, end)] of the
    bytes the assembly files describe.
    """
    labels, ptrs, order, runs = {}, {}, [], []
    for path in sorted((ROOT / "data/rom").glob("*.s")):
        pos = None
        pending = []
        for line in path.read_text().splitlines():
            s = line.strip()
            if s.startswith(".section"):
                m = re.match(r"\.section \.rodata\.([0-9A-F]{8})", s)
                pos, pending = (int(m[1], 16) if m else None), []
            elif s.startswith(".incbin"):
                m = re.match(r'\.incbin "baserom.gba", (0x[0-9a-f]+|\d+), (0x[0-9a-f]+|\d+)', s)
                if m:
                    start = BASE + int(m[1], 0)
                    for n in pending:
                        labels[n] = start
                        order.append((start, n))
                    pending = []
                    pos = start + int(m[2], 0)
                    runs.append((start, pos))
                else:
                    pending = []
                    pos = None
            elif s.startswith(".4byte"):
                m = re.match(r"\.4byte (\w+)(?: \+ (0x[0-9a-f]+|\d+))?$", s)
                if pos is not None:
                    for n in pending:
                        labels[n] = pos
                        order.append((pos, n))
                    pending = []
                    if m:
                        ptrs[pos] = (m[1], int(m[2], 0) if m[2] else 0)
                    runs.append((pos, pos + 4))
                    pos += 4
            elif re.match(r"^\w+:$", s):
                pending.append(s[:-1])
    cover = []
    for a, b in sorted(runs):
        if cover and a <= cover[-1][1]:
            cover[-1] = (cover[-1][0], max(cover[-1][1], b))
        else:
            cover.append((a, b))
    return labels, ptrs, sorted(order), cover


class RomData:
    def __init__(self):
        self.rom = (ROOT / "baserom.gba").read_bytes()
        self.labels, self.ptrs, self.order, self.cover = build_rom_index()
        self.addr_names = {}
        for a, n in self.order:
            self.addr_names.setdefault(a, n)
        self.label_addrs = sorted(self.addr_names)
        self._elf = None

    def elf(self):
        if self._elf is None:
            self._elf = {}
            out = subprocess.run(["nm", str(ROOT / "fe7u.elf")], capture_output=True, text=True).stdout
            for line in out.splitlines():
                p = line.split()
                if len(p) == 3 and p[1] in "tTdDrRbB" and not p[2].startswith("$"):
                    a = int(p[0], 16)
                    self._elf.setdefault(a & ~1, (p[2], a & 1))
        return self._elf

    def ram_syms(self):
        if not hasattr(self, "_ram"):
            out = subprocess.run(["nm", "-n", str(ROOT / "fe7u.elf")], capture_output=True, text=True).stdout
            self._ram = []
            for line in out.splitlines():
                p = line.split()
                if len(p) == 3 and p[1] in "AaBbDdCc" and 0x02000000 <= int(p[0], 16) < 0x04000000 and not p[2].startswith("$"):
                    self._ram.append((int(p[0], 16), p[2]))
            self._ram.sort()
        return self._ram

    def word(self, addr):
        return _struct.unpack_from("<I", self.rom, addr - BASE)[0]

    def s16(self, addr):
        return _struct.unpack_from("<h", self.rom, addr - BASE)[0]

    def next_label(self, addr):
        i = bisect.bisect_right(self.label_addrs, addr)
        return self.label_addrs[i] if i < len(self.label_addrs) else None

    def run_end(self, addr):
        """End of the contiguous bytes of data/rom that contain addr."""
        for a, b in self.cover:
            if a <= addr < b:
                return b
        return None

    def object_extent(self, addr):
        """Bytes from addr to the next label or the end of the assembly run."""
        ends = [x for x in (self.next_label(addr), self.run_end(addr)) if x]
        return min(ends) - addr if ends else 0

    def ptr_expr(self, a, val, problems, script=False):
        """C expression for the pointer word `val` stored at address `a`."""
        if a in self.ptrs:
            sym, add = self.ptrs[a]
            if add == 0:
                return sym
            if script and add % 8 == 0:
                return f"&{sym}[{add // 8}]"
            problems.append(f"addend {sym} + {add:#x} at {a:#010x}")
            return f"(void *) &{sym}  /* FIXME: + {add:#x} */"
        if val == 0:
            return "0"
        e = self.elf().get(val & ~1)
        if e:
            return e[0]
        n = self.addr_names.get(val)
        if n:
            return n
        problems.append(f"raw pointer {val:#010x} at {a:#010x}")
        return f"(void *) {val:#010x}  /* FIXME */"


# ------------------------------------------------------------ C type parser

INTS = {
    "u8": (1, False), "s8": (1, True), "char": (1, True), "bool": (1, True), "bool8": (1, True),
    "unsigned char": (1, False), "signed char": (1, True),
    "u16": (2, False), "s16": (2, True), "short": (2, True), "unsigned short": (2, False),
    "u32": (4, False), "s32": (4, True), "int": (4, True), "unsigned": (4, False),
    "unsigned int": (4, False), "long": (4, True), "unsigned long": (4, False),
    "uintptr_t": (4, False), "intptr_t": (4, True), "size_t": (4, False),
    "vu8": (1, False), "vu16": (2, False), "vu32": (4, False), "fu16": (2, False),
}
QUALS = ("const", "volatile", "CONST_DATA", "EWRAM_DATA", "IWRAM_DATA", "static", "extern", "register")


class Unsupported(Exception):
    pass


class Field:
    """kind: int | ptr | fn | struct | array | pad."""
    def __init__(self, name, off, size, kind, **kw):
        self.name, self.off, self.size, self.kind = name, off, size, kind
        self.__dict__.update(kw)   # signed, pointee, sig, struct, elem, count

    def __repr__(self):
        return f"<{self.name}@{self.off:#x} {self.kind} {self.size}>"


def strip_comments(t):
    t = re.sub(r"/\*.*?\*/", " ", t, flags=re.S)
    return re.sub(r"//[^\n]*", "", t)


def split_top(s, sep=","):
    out, depth, cur = [], 0, ""
    for ch in s:
        if ch in "([{":
            depth += 1
        elif ch in ")]}":
            depth -= 1
        if ch == sep and depth == 0:
            out.append(cur)
            cur = ""
        else:
            cur += ch
    if cur.strip():
        out.append(cur)
    return out


def match_brace(t, i):
    """Index of the } that closes the { at t[i]."""
    depth = 0
    for j in range(i, len(t)):
        if t[j] == "{":
            depth += 1
        elif t[j] == "}":
            depth -= 1
            if depth == 0:
                return j
    raise ValueError("unbalanced")


class Types:
    def __init__(self):
        self.structs = {}    # name -> [(body, file)]
        self.typedefs = {}   # name -> declaration text (type with the name as declarator)
        self.consts = {}     # enum constants
        self.files = {}
        for p in sorted(list((ROOT / "include").rglob("*.h")) + list((ROOT / "src").rglob("*.c")) + list((ROOT / "src").rglob("*.h"))):
            t = strip_comments(p.read_text(errors="replace"))
            self.files[p] = t
            for m in re.finditer(r"\bstruct\s+(\w+)\s*\{", t):
                e = match_brace(t, m.end() - 1)
                self.structs.setdefault(m[1], []).append((t[m.end():e], p))
            for m in re.finditer(r"typedef\s+([^;{}]+);", t):
                d = m[1].strip()
                n = re.search(r"\(\s*\*\s*(\w+)\s*\)", d) or re.search(r"(\w+)\s*(?:\[[^\]]*\])?\s*$", d)
                if n:
                    self.typedefs.setdefault(n[1], d)
            for m in re.finditer(r"\benum\s*\w*\s*\{", t):
                e = match_brace(t, m.end() - 1)
                v = -1
                for item in split_top(t[m.end():e]):
                    item = item.strip()
                    if not item:
                        continue
                    k, _, val = item.partition("=")
                    try:
                        v = int(eval(val.strip(), {}, self.consts)) if val.strip() else v + 1
                    except Exception:
                        v = v + 1
                    self.consts[k.strip()] = v
        self._layouts = {}

    # -- a declaration "TYPE declarator" -> Field
    def field_from(self, base, stars, name, dims, off, bits=None):
        base = " ".join(w for w in base.split() if w not in QUALS)
        if bits:
            raise Unsupported(f"bit-field {name}")
        f = self.make_type(base, stars.count("*"), name, off)
        for d in reversed(dims):
            n = self.eval_dim(d)
            f = Field(name, off, f.size * n, "array", elem=f, count=n)
        return f

    def eval_dim(self, d):
        try:
            return int(eval(d.strip() or "0", {"__builtins__": {}}, dict(self.consts)))
        except Exception:
            raise Unsupported(f"array size [{d}]")

    def make_type(self, base, nstars, name, off):
        if nstars:
            return Field(name, off, 4, "ptr", pointee=base + " *" * (nstars - 1))
        if base in INTS:
            s, sg = INTS[base]
            return Field(name, off, s, "int", signed=sg, tname=base)
        m = re.match(r"(?:struct|union)\s+(\w+)$", base)
        if base.startswith("union"):
            raise Unsupported(f"union {base}")
        if m:
            lay = self.layout(m[1])
            return Field(name, off, lay["size"], "struct", struct=m[1])
        if base.startswith("enum"):
            return Field(name, off, 4, "int", signed=False)
        if base in self.typedefs:
            d = self.typedefs[base]
            fn = re.match(r"(.*?)\(\s*\*\s*\w+\s*\)\s*\((.*)\)$", d, re.S)
            if fn:
                return Field(name, off, 4, "fn", sig=(fn[1].strip(), fn[2].strip()))
            d2 = re.sub(r"\b" + re.escape(base) + r"\b\s*$", "", d).strip()
            return self.parse_decl_type(d2, name, off)
        raise Unsupported(f"type {base}")

    def parse_decl_type(self, text, name, off):
        text = " ".join(w for w in text.replace("*", " * ").split() if w not in QUALS)
        stars = text.count("*")
        base = text.replace("*", "").strip()
        return self.make_type(base, stars, name, off)

    def parse_fields(self, body):
        """Yield (base, stars, name, dims, bits|None, fnsig|None) per declarator."""
        out = []
        for stmt in split_top(body, ";"):
            stmt = " ".join(stmt.split())
            if not stmt:
                continue
            m = re.match(r"STRUCT_PAD\(\s*(\w+)\s*,\s*(\w+)\s*\)$", stmt)
            if m:
                out.append(("pad", int(m[2], 0) - int(m[1], 0)))
                continue
            if stmt.startswith(("PROC_HEADER", "union", "struct {", "struct{")) or "{" in stmt:
                raise Unsupported(stmt[:40])
            fn = re.match(r"(.*?)\(\s*\*\s*(\w+)\s*\)\s*\((.*)\)$", stmt)
            if fn:
                out.append(("fn", fn[2], (fn[1].strip(), fn[3].strip())))
                continue
            first, *rest = split_top(stmt)
            m = re.match(r"^(?P<type>.*?)(?P<stars>[\s\*]*)(?P<name>\w+)\s*(?P<dims>(?:\[[^\]]*\]\s*)*)(?::\s*(?P<bits>\w+))?$", first.strip())
            if not m:
                raise Unsupported(stmt)
            base = m["type"].strip()
            if not base:
                raise Unsupported(stmt)
            out.append(("f", base, m["stars"], m["name"], re.findall(r"\[([^\]]*)\]", m["dims"]), m["bits"]))
            for r in rest:
                r = r.strip()
                m2 = re.match(r"^(?P<stars>[\s\*]*)(?P<name>\w+)\s*(?P<dims>(?:\[[^\]]*\]\s*)*)$", r)
                out.append(("f", base, m2["stars"], m2["name"], re.findall(r"\[([^\]]*)\]", m2["dims"]), None))
        return out

    def layout(self, name, prefer=None):
        if name in self._layouts:
            return self._layouts[name]
        if name not in self.structs:
            raise Unsupported(f"struct {name} not found")
        cands = self.structs[name]
        body = cands[0][0]
        if prefer:
            for b, p in cands:
                if str(p) == prefer:
                    body = b
        fields, off, align = [], 0, 4   # agbcc aligns every struct to 4 and pads its size to 4
        for ent in self.parse_fields(body):
            if ent[0] == "pad":
                off += ent[1]
                continue
            if ent[0] == "fn":
                f = Field(ent[1], off, 4, "fn", sig=ent[2])
            else:
                _, base, stars, fname, dims, bits = ent
                f = self.field_from(base, stars, fname, dims, off, bits)
            a = self.align_of(f)
            off = (off + a - 1) // a * a
            f.off = off
            if f.kind == "array":
                pass
            fields.append(f)
            off += f.size
            align = max(align, a)
        size = (off + align - 1) // align * align
        lay = {"fields": fields, "size": size, "align": align}
        self._layouts[name] = lay
        return lay

    def align_of(self, f):
        if f.kind == "array":
            return self.align_of(f.elem)
        if f.kind == "struct":
            return self.layout(f.struct)["align"]
        return min(f.size, 4)

    # -- a top-level element type given on the command line
    def element(self, spec):
        spec = spec.strip()
        m = re.match(r"^(.*?)\s*((?:\[\d+\])+)$", spec)
        if m:   # an array of arrays: the element is the inner array
            f = self.element(m[1])
            for d in reversed(re.findall(r"\[(\d+)\]", m[2])):
                f = Field("", 0, f.size * int(d), "array", elem=f, count=int(d))
            return f
        spec = re.sub(r"^const\s+", "", spec)
        if spec.endswith("*") or spec in self.typedefs or spec in INTS:
            f = self.parse_decl_type(spec, "", 0)
        else:
            f = self.make_type("struct " + spec.replace("struct ", ""), 0, "", 0)
        return f


# ---------------------------------------------------------- AnimScr streams

ANIM_CTL = {0: "ANIMSCR_BLOCKED", 1: "ANIMSCR_END", 2: "ANIMSCR_LOOP"}


def decode_animscr(rom, em, addr, extent):
    """Instructions (one macro call each, include/gbafe/anime.h) of the script at
    addr.  STOP / END / LOOP do not end the object (STOP waits to be released and
    goes on), so the whole extent is decoded; if something in it does not decode,
    or it does not end on one of these, the object is cut after the last one (the
    rest is data the assembly keeps).  Returns (lines, bytes used)."""
    lines, pos, end = [], addr, addr + extent
    good = (0, addr, dict(em.refs))      # (lines, position, refs) after the last terminator
    bad = []
    ptr_f = Field("", 0, 4, "ptr", pointee="struct AnimSpriteData")
    nprob = len(em.problems)

    def target(a, val):
        if a in rom.ptrs:
            return rom.ptrs[a]
        if val == 0:
            return "NULL", 0
        loc = em.locate(val)
        if loc is None:
            bad.append(f"raw pointer {val:#010x} at {a:#010x}")
            return f"(void *) {val:#010x}", 0
        return loc

    while pos < end and not bad:
        w = rom.word(pos)
        if not w & 0x80000000:   # force sprite: address, duration in bits 0-1 and 28-30
            sym, add = target(pos, w & 0x0FFFFFFC)
            if pos not in rom.ptrs:
                add += w & 0xF0000003
            dur = ((add >> 26) & 0x1C) + (add & 3)
            rest = add & 0x0FFFFFFC
            if sym == "NULL":
                bad.append(f"empty sprite word at {pos:#010x}")
            elif rest:
                bad.append(f"{sym} + {rest:#x} at {pos:#010x}: sprite inside an object")
            else:
                em.sym_expr(sym, 0, ptr_f, pos)
                lines.append(f"ANIMSCR_FORCE_SPRITE({sym}, {dur})")
            pos += 4
            continue
        typ = (w >> 24) & 0x3F
        if w & 0x40000000:   # 0xC.. call a function, 0xD.. run another script
            if (w >> 28) not in (0xC, 0xD) or pos not in rom.ptrs or rom.ptrs[pos][1] & ~0xC0000001 & 0xFFFFFFFF:
                bad.append(f"unknown pointer instruction {w:#010x} at {pos:#010x}")
                break
            sym, add = rom.ptrs[pos]
            kind = "ANIMSCR_CALL" if w >> 28 == 0xC else "ANIMSCR_JUMP"
            f = Field("", 0, 4, "fn", sig=("void", "struct Anim *")) if kind == "ANIMSCR_CALL" else Field("", 0, 4, "ptr", pointee="AnimScr")
            lines.append(f"{kind}({em.sym_expr(sym, 0, f, pos)})")
            pos += 4
            continue
        arg = w & 0xFFFFFF
        if typ in ANIM_CTL and arg == 0:
            lines.append(ANIM_CTL[typ])
            pos += 4
            good = (len(lines), pos, dict(em.refs))
            continue
        if typ == 4 and arg <= 0xFFFF:
            lines.append(f"ANIMSCR_WAIT({em.fmt_int(arg)})")
        elif typ == 3:
            x, y, d = arg & 0xFF, (arg >> 8) & 0xFF, arg >> 16
            sx, sy = x - 256 if x > 127 else x, y - 256 if y > 127 else y
            lines.append(f"ANIMSCR_MOVE({sx}, {sy}, {d})")
        elif typ == 5 and arg <= 0xFF:
            lines.append(f"ANIMSCR_COMMAND({em.fmt_int(arg)})")
        elif typ == 6 and arg <= 0xFFFF and pos + 12 <= end:
            e = []
            for k in (4, 8):
                sym, add = target(pos + k, rom.word(pos + k))
                if sym != "NULL" and not bad:
                    em.sym_expr(sym, 0, Field("", 0, 4, "ptr", pointee="u8"), pos + k)
                    e.append(sym if add == 0 else f"&{sym}[{add}]")
                else:
                    e.append("0")
            lines.append(f"ANIMSCR_FRAME({em.fmt_int(arg)}, {e[0]}, {e[1]})")
            pos += 8
        else:
            bad.append(f"unknown instruction {w:#010x} at {pos:#010x}")
            break
        pos += 4
    if good[1] == addr:
        em.problems.append(f"script at {addr:#010x} has no terminator" + (f" ({bad[0]})" if bad else ""))
        return lines, pos - addr
    if good[1] < end:
        em.refs.clear()
        em.refs.update(good[2])
    return lines[:good[0]], good[1] - addr


# ------------------------------------------------------------------ emitter

def want_struct(f):
    m = re.search(r"struct\s+(\w+)\s*$", " ".join(w for w in getattr(f, "pointee", "").split() if w not in QUALS))
    return m[1] if m else None


class Emitter:
    def __init__(self, rom, types, scalars=(), decls=None):
        self.rom, self.types, self.decls = rom, types, decls
        self.refs = {}       # symbol -> field that points at it (for declarations)
        self.problems = []
        self.scalars = set(scalars)   # symbols that are single objects, not arrays
        self.scalars_here = set()
        self.casts = []

    def intval(self, addr, size, signed):
        fmt = {1: "b", 2: "h", 4: "i"}[size] if signed else {1: "B", 2: "H", 4: "I"}[size]
        return _struct.unpack_from("<" + fmt, self.rom.rom, addr - BASE)[0]

    def fmt_int(self, v):
        if v < 0:
            return str(v)
        return str(v) if v < 10 else f"0x{v:X}"

    def ptr(self, f, addr):
        val = self.rom.word(addr)
        if addr in self.rom.ptrs:
            sym, add = self.rom.ptrs[addr]
        elif val == 0:
            return "0"
        elif val == 0xFFFFFFFF:
            return "(void *) -1"
        else:
            loc = self.locate(val)
            if loc is None:
                self.problems.append(f"raw pointer {val:#010x} at {addr:#010x}")
                return f"(void *) {val:#010x}  /* FIXME */"
            sym, add = loc
        if f.kind == "fn" and add == 1:
            add = 0
        return self.sym_expr(sym, add, f, addr)

    def locate(self, val):
        """(symbol, offset) for an address the assembly left raw."""
        e = self.rom.elf().get(val & ~1)
        if e:
            return e[0], 0
        n = self.rom.addr_names.get(val)
        if n:
            return n, 0
        if 0x02000000 <= val < 0x04000000:
            syms = self.rom.ram_syms()
            k = bisect.bisect_right(syms, (val, "\uffff")) - 1
            while k >= 0 and val - syms[k][0] < 0x10000:
                a, n = syms[k]
                if self.decls and self.decls.decl_field(n, self.types):
                    return n, val - a
                k -= 1
        return None

    def sym_expr(self, sym, add, f, addr):
        self.refs.setdefault(sym, f)
        if add == 0:
            if sym in self.scalars and f.kind == "ptr":
                return "&" + sym
            if f.kind == "fn" and self.decls and sym in self.decls.sigs:
                want = norm_sig(*f.sig)
                if not any(sig_compatible(want, g) for g in self.decls.sigs[sym]):
                    self.casts.append(sym)
                    return "(void *) " + sym
            return sym
        fld = self.decls.decl_field(sym, self.types) if self.decls else None
        suffix = self.descend(fld, add, want_struct(f)) if fld else None
        if not fld:   # undeclared: an array of what the field points to
            base = getattr(f, "pointee", "")
            if base in INTS and add % INTS[base][0] == 0:
                return f"&{sym}[{add // INTS[base][0]}]"
        if suffix is None:
            self.problems.append(f"{sym} + {add:#x} at {addr:#010x}: no member there")
            return f"(void *) &{sym}  /* FIXME: + {add:#x} */"
        if fld.kind == "array" and fld.elem.size == 2 and re.search(r"Tm|Tilemap", sym) and re.fullmatch(r"\[\d+\]", suffix):
            idx = int(suffix[1:-1])
            return f"{sym} + TM_OFFSET({idx % 32}, {idx // 32})"
        expr = f"&{sym}{suffix}"
        pt = " ".join(w for w in getattr(f, "pointee", "").split() if w not in QUALS)
        if fld.kind == "array" and fld.elem.kind == "int" and pt and pt != "void" and pt != fld.elem.tname:
            expr = f"({pt} *) {expr}"
        return expr

    def descend(self, f, off, want=None):
        """The member path ([i], .name) of the byte at offset off of an object of type f;
        stops at a struct named `want`."""
        if f.kind == "array":
            idx, rem = divmod(off, f.elem.size)
            sub = self.descend(f.elem, rem, want)
            return None if sub is None else f"[{idx}]{sub}"
        if f.kind == "struct":
            if off == 0 and f.struct == want:
                return ""
            for m in self.types.layout(f.struct)["fields"]:
                if m.off <= off < m.off + m.size:
                    sub = self.descend(m, off - m.off, want)
                    return None if sub is None else f".{m.name}{sub}"
            return None
        return "" if off == 0 else None

    WIDTH = 96

    def value(self, f, addr, ind=0):
        """(text, is_zero) of the value of type f at addr; ind is the column the text starts at."""
        if f.kind == "int":
            if f.size == 4 and addr in self.rom.ptrs:   # a pointer stored in an integer field
                sym, add = self.rom.ptrs[addr]
                e = self.sym_expr(sym, add, Field("", 0, 4, "ptr", pointee="EventScr"), addr)
                return f"(uintptr_t) {e}", False
            v = self.intval(addr, f.size, f.signed)
            return self.fmt_int(v), v == 0
        if f.kind in ("ptr", "fn"):
            e = self.ptr(f, addr)
            return e, e == "0"
        if f.kind == "struct":
            return self.struct_value(self.types.layout(f.struct), addr, ind)
        if f.kind == "array":
            items, allzero = [], True
            for i in range(f.count):
                t, z = self.value(f.elem, addr + i * f.elem.size, ind + 4)
                if f.elem.kind in ("ptr", "fn") and t == "0":
                    t = "NULL"
                items.append(t)
                allzero &= z
            return self.wrap(items, ind, f.elem.kind in ("int", "ptr", "fn")), allzero
        raise Unsupported(f.kind)

    def wrap(self, items, ind, fill):
        one = "{ " + ", ".join(items) + " }"
        if "\n" not in one and ind + len(one) <= self.WIDTH:
            return one
        pad = " " * (ind + 4)
        if fill:   # several scalars per line
            lines, cur = [], pad
            for it in items:
                if len(cur) + len(it) + 2 > self.WIDTH and cur.strip():
                    lines.append(cur.rstrip())
                    cur = pad
                cur += it + ", "
            lines.append(cur.rstrip())
            return "{\n" + "\n".join(lines) + "\n" + " " * ind + "}"
        return "{\n" + "".join(pad + it + ",\n" for it in items) + " " * ind + "}"

    def struct_value(self, lay, addr, ind=0):
        parts, allzero = [], True
        covered = [False] * lay["size"]
        for f in lay["fields"]:
            for i in range(f.size):
                covered[f.off + i] = True
            t, z = self.value(f, addr + f.off, ind + 4)
            if not z:
                allzero = False
                parts.append(f".{f.name} = {t}")
        for i, c in enumerate(covered):
            if not c and self.rom.rom[addr - BASE + i]:
                self.problems.append(f"nonzero padding byte at {addr + i:#010x}")
        if not parts:
            return "{ 0 }", True
        return self.wrap(parts, ind, False), allzero

    def array(self, f, addr, count, single=False):
        lines = []
        for i in range(count):
            t, _ = self.value(f, addr + i * f.size, 0 if single else 4)
            if f.kind in ("ptr", "fn") and t == "0":
                t = "NULL"
            lines.append(t)
        return lines


KEYWORDS = {"int", "char", "short", "long", "unsigned", "signed", "void", "float", "double"}


def norm_toks(text):
    return [t for t in text.replace("*", " * ").split() if t not in QUALS + ("inline", "static", "extern")]


def norm_sig(ret, params):
    """(return type, [parameter types]); None params = unprototyped `()`."""
    r = " ".join(norm_toks(ret))
    if not params.strip():
        return (r, None)
    ps = []
    for p in split_top(params):
        t = norm_toks(p)
        if len(t) >= 2 and t[-1] != "*" and t[-1] not in KEYWORDS and t[-2] not in ("struct", "enum", "union"):
            t = t[:-1]
        ps.append(" ".join(t))
    if ps == ["void"]:
        ps = []
    return (r, ps)


def sig_compatible(a, b):
    if a[1] is None or b[1] is None:
        return True
    return a == b


class Decls:
    """Where each symbol is declared or defined (functions and extern data)."""
    def __init__(self, types):
        self.types = types
        self.decl = {}   # name -> [(file, text)]
        self.defn = {}   # function name -> [file]
        self.defn_text = {}   # function name -> its definition's prototype
        self.sigs = {}   # function name -> [normalized (return, params)] of its declarations and definitions
        for p, t in types.files.items():
            for m in re.finditer(r"^[ \t]*extern\s+([^;(){}]*?)\b(\w+)\s*((?:\[[^\]]*\]\s*)*)\s*;", t, re.M):
                self.decl.setdefault(m[2], []).append((p, m[0].strip()))
            for m in re.finditer(r"^([A-Za-z_][\w \t\*]*?)\b(\w+)\s*\(([^;{}()]*(?:\([^()]*\)[^;{}()]*)*)\)\s*([;{])", t, re.M):
                if m[1].strip().split()[0] in ("if", "while", "for", "switch", "return", "else", "define"):
                    continue
                if m[4] == ";":
                    self.decl.setdefault(m[2], []).append((p, m[0].strip()))
                else:
                    self.defn.setdefault(m[2], []).append(p)
                    self.defn_text.setdefault(m[2], " ".join(f"{m[1].strip()} {m[2]}({m[3].strip()});".split()))
                self.sigs.setdefault(m[2], []).append(norm_sig(m[1], m[3]))
        self._inc = {}

    def closure(self, path):
        path = Path(path).resolve()
        seen, todo = set(), [path]
        while todo:
            p = todo.pop()
            if p in seen:
                continue
            seen.add(p)
            try:
                t = p.read_text(errors="replace")
            except OSError:
                continue
            for m in re.finditer(r'^\s*#\s*include\s+"([^"]+)"', t, re.M):
                for base in (p.parent, ROOT / "include", ROOT / "include/gbafe", ROOT / "src"):
                    q = (base / m[1]).resolve()
                    if q.exists():
                        todo.append(q)
                        break
        return seen

    def decl_field(self, sym, types):
        """The Field type a non-function extern declaration gives sym (None if none)."""
        for p, t in self.decl.get(sym, []):
            if "(" in t:
                continue
            m = re.match(r"extern\s+(?P<type>.*?)(?P<stars>[\s\*]*)\b" + re.escape(sym) + r"\s*(?P<dims>(?:\[[^\]]*\]\s*)*);$", " ".join(t.split()))
            if not m:
                continue
            try:
                dims = re.findall(r"\[([^\]]*)\]", m["dims"])
                return types.field_from(m["type"], m["stars"], sym, [d or "0x10000" for d in dims], 0)
            except Unsupported:
                continue
        return None

    def scalars_outside(self, skip):
        """Symbols declared as a single object (not array, not function)."""
        return {n for n, ds in self.decl.items() if n not in skip and ds and all("[" not in t and "(" not in t for _, t in ds)}

    def visible(self, name, closure):
        r = [(p, t) for p, t in self.decl.get(name, []) if p.resolve() in closure]
        return r + [(p, "definition") for p in self.defn.get(name, []) if p.resolve() in closure]


def fn_proto(sig, name):
    return f"{sig[0]} {name}({sig[1]});"


TERMINATED = {"MenuItemDef", "StatScreenTextInfo"}   # arrays that end with an all-zero element


def decl_type(spec, elem):
    """(prefix, suffix-free type text) for `const <type> NAME[]`."""
    if spec.endswith("*"):
        return spec + " const"
    if elem.kind == "struct" and not spec.startswith("struct"):
        return "const struct " + spec
    return "const " + spec


def resolve_obj(rom, arg):
    """OBJ -> (name, addr, count).  NAME=0xADDR, 0xADDR or a label; :N suffix."""
    count = None
    if ":" in arg:
        arg, _, c = arg.partition(":")
        count = int(c)
    name, _, rest = arg.partition("=")
    if rest:
        return name, int(rest, 0), count
    if name.startswith("0x"):
        return f"gUnk_{int(name, 16):08X}", int(name, 16), count
    if name not in rom.labels:
        sys.exit(f"unknown object {name}")
    return name, rom.labels[name], count


def emit_objects(rom, types, decls, spec, args):
    if spec.strip() == "AnimScr":
        return emit_animscr(rom, types, decls, args)
    m = re.match(r"^(.*?)\s*((?:\[\d+\])+)$", spec.strip())
    dims = m[2] if m else ""
    base_spec = m[1] if m else spec.strip()
    elem = types.element(spec)
    objs, scalars = [], set()
    for arg in args:
        name, addr, count = resolve_obj(rom, arg)
        if count is None:
            size = rom.object_extent(addr)
            count = max(size // elem.size, 1)
            if size % elem.size:
                print(f"problem: {name}: extent {size:#x} is not a multiple of {elem.size:#x}", file=sys.stderr)
            if spec in TERMINATED:   # up to and including the first all-zero element
                k = 1
                while any(rom.rom[addr - BASE + (k - 1) * elem.size: addr - BASE + k * elem.size]) and k < count:
                    k += 1
                if k < count:
                    print(f"note: {name}: {(count - k) * elem.size:#x} bytes after the terminator at {addr + k * elem.size:#x} are not part of it", file=sys.stderr)
                count = k
        old = decls.decl.get(name, [])
        # declared without [] (or undeclared and one element): a single object
        single = count == 1 and not dims and (not old or all("[" not in t for _, t in old))
        if single:
            scalars.add(name)
        objs.append((name, addr, count, single))
    em = Emitter(rom, types, scalars | decls.scalars_outside(scalars), decls)
    out = []
    for name, addr, count, single in objs:
        lines = em.array(elem, addr, count, single)
        body = ",\n".join(("" if single else "    ") + l for l in lines)
        out.append((name, addr, count * elem.size, decl_type(base_spec, elem), body, single, dims))
    return out, em


def emit_animscr(rom, types, decls, args):
    """Objects that are animation scripts.  An object ends at its first STOP /
    END / LOOP; bytes after that up to the next label are left in the assembly
    (noted).  The size of an object is what it decodes to."""
    em = Emitter(rom, types, decls.scalars_outside(set()), decls)
    out = []
    for arg in args:
        name, addr, count = resolve_obj(rom, arg)
        extent = rom.object_extent(addr) if count is None else count * 4
        lines, used = decode_animscr(rom, em, addr, extent)
        if used < extent:
            print(f"note: {name}: {extent - used:#x} bytes after the script ({addr + used:#010x}) stay in the assembly", file=sys.stderr)
        body = ",\n".join("    " + l for l in lines)
        out.append((name, addr, used, "const AnimScr", body, False, ""))
    return out, em


def render(out):
    text = []
    for name, addr, size, tname, body, single, dims in out:
        if single:
            text.append(f'SECTION(".rodata.{addr:08X}")\n{tname} {name} = {body};\n')
        else:
            text.append(f'SECTION(".rodata.{addr:08X}")\n{tname} {name}[]{dims} = {{\n{body},\n}};\n')
    return "\n".join(text)


def extern_line(name, tname, single, dims=""):
    return f"extern {tname} {name}{'' if single else '[]'}{dims};"


def add(rom, types, decls, path, spec, args):
    """Append definitions to `path`, the layout lines to data/layout.txt;
    fix the declarations of the objects in place, declare the rest in `path`."""
    out, em = emit_objects(rom, types, decls, spec, args)
    path = Path(path)
    text = path.read_text() if path.exists() else '#include "gbafe.h"\n'
    if not text.endswith("\n"):
        text += "\n"
    newdecls = []
    for name, addr, size, tname, body, single, dims in out:
        line = extern_line(name, tname, single, dims)
        old = [(f, t) for f, t in decls.decl.get(name, []) if "(" not in t]
        for f, t in old:
            ft = f.read_text()
            if t in ft:
                f.write_text(ft.replace(t, line, 1))
            else:
                print(f"problem: cannot rewrite the declaration of {name} in {f}: {t}", file=sys.stderr)
        if not old:
            newdecls.append(line)
    text = path.read_text() if path.exists() else text   # the declarations may have been in path itself
    if not text.endswith("\n"):
        text += "\n"
    if newdecls:
        text += "\n" + "\n".join(newdecls) + "\n"
    text += "\n" + render(out)
    path.write_text(text)
    mod = path.stem
    with open(ROOT / "data/layout.txt", "a") as f:
        for name, addr, size, _, _, _, _ in out:
            f.write(f"rom {addr:#010X} {size:#X} build/src/{mod}.o(.rodata.{addr:08X})\n".replace("0X", "0x"))
    return out, em


def header_for(path):
    """include/gbafe/<stem>.h for a src/<stem>.c that has one."""
    h = ROOT / "include/gbafe" / (Path(path).stem + ".h")
    return h if h.exists() else None


def append_to_header(h, lines):
    t = h.read_text()
    m = re.search(r"\n#endif[^\n]*\s*$", t)
    add_text = "\n" + "\n".join(lines) + "\n"
    if m:
        t = t[:m.start()] + add_text + t[m.start():]
    else:
        t = t.rstrip("\n") + "\n" + add_text
    h.write_text(t)


def report_refs(em, decls, path, hdr=None, skip=()):
    """Declare what the emitted code refers to and `path` can't see declared:
    an include if a header declares it; else in `hdr` (functions: in the header
    of the module that defines them when it has one); else in `path` itself."""
    cl = decls.closure(path)
    todo, includes, local, grouped = {}, set(), [], {}
    names = {"fn": [], "data": [], "include": []}
    for sym, f in sorted(em.refs.items()):
        if decls.visible(sym, cl) or sym in skip:
            continue
        defs = decls.defn.get(sym, [])
        hs = [p for p, _ in decls.decl.get(sym, []) if p.suffix == ".h" and p.resolve() not in cl]
        if hs and Path(path).suffix == ".c":
            includes.add(str(hs[0].relative_to(ROOT / "include")))
            names["include"].append(sym)
            continue
        target = hdr
        if f.kind == "fn":
            line = decls.defn_text.get(sym) or fn_proto(f.sig, sym)
            target = (header_for(defs[0]) if defs else None) or hdr
            names["fn"].append(sym)
        else:
            pointee = "u8" if f.pointee.strip() in ("void", "const void") else f.pointee
            line = f"extern const {pointee} {sym}[];".replace("const const", "const")
            names["data"].append(sym)
            if pointee.split()[0] in ("struct", "u8", "u16", "u32"):   # many per line: `extern const T a[], b[];`
                grouped.setdefault((target, pointee), []).append(sym)   # (other modules keep their own declarations)
                continue
        if target:
            todo.setdefault(target, []).append(line)
        else:
            local.append(line)
    for (target, pointee), syms in grouped.items():
        head = f"extern const {pointee} "
        lines, cur, first = [], head, True
        for i, sy in enumerate(syms):
            item = f"{sy}[]" + ("," if i < len(syms) - 1 else ";")
            if len(cur) + len(item) > 100 and not first:
                lines.append(cur.rstrip())
                cur, first = "    ", True
            cur += item + " "
            first = False
        lines.append(cur.rstrip())
        if target:
            todo.setdefault(target, []).extend(lines)
        else:
            local.extend(lines)
    for k, v in names.items():
        if v:
            print(f"{k}: {len(v)} declared ({', '.join(v[:4])}{', ...' if len(v) > 4 else ''})")
    for h, lines in todo.items():
        append_to_header(h, lines)
    t = Path(path).read_text()
    last = list(re.finditer(r'^#include .*\n', t, re.M))
    pos = last[-1].end() if last else 0
    new = "".join(f'#include "{i}"\n' for i in sorted(includes) if f'#include "{i}"' not in t)
    if local:
        new += "\n" + "\n".join(local) + "\n"
    if new:
        Path(path).write_text(t[:pos] + new + t[pos:])


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    cmd, args = sys.argv[1], sys.argv[2:]
    if cmd == "struct":
        types = Types()
        lay = types.layout(args[0].replace("struct ", ""))
        for f in lay["fields"]:
            print(f"{f.off:#04x} {f.size:#04x} {f.name} {f.kind}")
        print(f"size {lay['size']:#x}")
    elif cmd in ("emit", "add"):
        rom, types = RomData(), Types()
        hdr = None
        if args[0] == "--hdr":
            hdr, args = ROOT / args[1], args[2:]
        if cmd == "add":
            path, args = args[0], args[1:]
        spec, args = args[0], args[1:]
        decls = Decls(types)
        if cmd == "emit":
            out, em = emit_objects(rom, types, decls, spec, args)
            print(render(out))
        else:
            out, em = add(rom, types, decls, path, spec, args)
        for p in em.problems:
            print("problem:", p, file=sys.stderr)
        for c in sorted(set(em.casts)):
            print(f"cast: {c} does not match its declaration: {decls.sigs[c]}", file=sys.stderr)
        if cmd == "add":
            report_refs(em, decls, path, hdr, {o[0] for o in out})
    elif cmd == "decl":
        types = Types()
        d = Decls(types)
        for n in args:
            print(n, [(str(p.relative_to(ROOT)), t[:100]) for p, t in d.decl.get(n, [])], [str(p.relative_to(ROOT)) for p in d.defn.get(n, [])])
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main()
