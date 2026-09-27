"""Minimal little-endian ELF32 reader: sections, symbols, REL relocations."""
import struct
from pathlib import Path

SHT_SYMTAB, SHT_NOBITS, SHT_REL = 2, 8, 9
SHF_ALLOC = 2
STT_OBJECT, STT_FUNC, STT_SECTION = 1, 2, 3
SHN_UNDEF, SHN_COMMON = 0, 0xFFF2
R_ARM_ABS32, R_ARM_THM_CALL = 2, 10


class Section:
    def __init__(self, index, name, type, flags, data, size):
        self.index, self.name, self.type, self.flags = index, name, type, flags
        self.data, self.size = data, size
        self.relocs = []  # (offset, type, Symbol)


class Symbol:
    def __init__(self, name, value, size, type, bind, shndx):
        self.name, self.value, self.size = name, value, size
        self.type, self.bind, self.shndx = type, bind, shndx

    def __repr__(self):
        return f"Symbol({self.name!r}, {self.value:#x}, shndx={self.shndx})"


class Elf:
    def __init__(self, path):
        self.path = Path(path)
        b = self.path.read_bytes()
        if b[:4] != b"\x7fELF":
            raise ValueError(f"{path}: not ELF")
        shoff, = struct.unpack_from("<I", b, 0x20)
        shentsize, shnum, shstrndx = struct.unpack_from("<HHH", b, 0x2E)
        raw = [struct.unpack_from("<IIIIIIIIII", b, shoff + i * shentsize) for i in range(shnum)]

        def cstr(sec, off):
            base = raw[sec][4] + off
            return b[base:b.index(b"\0", base)].decode("latin-1")

        self.sections = []
        for i, (name, typ, flags, addr, off, size, link, info, align, entsize) in enumerate(raw):
            data = b"" if typ == SHT_NOBITS else b[off:off + size]
            self.sections.append(Section(i, cstr(shstrndx, name), typ, flags, data, size))
            self.sections[-1].addr = addr

        self.symbols = []
        for name, typ, flags, addr, off, size, link, info, align, entsize in raw:
            if typ == SHT_SYMTAB:
                for k in range(size // entsize):
                    n, value, sz, inf, other, shndx = struct.unpack_from("<IIIBBH", b, off + k * entsize)
                    self.symbols.append(Symbol(cstr(link, n) if n else "", value, sz, inf & 0xF, inf >> 4, shndx))
                break
        for i, s in enumerate(self.symbols):
            if s.type == STT_SECTION and not s.name and 0 < s.shndx < len(self.sections):
                s.name = self.sections[s.shndx].name

        for name, typ, flags, addr, off, size, link, info, align, entsize in raw:
            if typ == SHT_REL:
                sec = self.sections[info]
                for k in range(size // 8):
                    r_off, r_info = struct.unpack_from("<II", b, off + k * 8)
                    sec.relocs.append((r_off, r_info & 0xFF, self.symbols[r_info >> 8]))

    def section(self, name):
        return next((s for s in self.sections if s.name == name), None)

    def functions(self, shndx):
        """FUNC symbols in a section, sorted by offset (thumb bit cleared)."""
        fs = [s for s in self.symbols if s.type == STT_FUNC and s.shndx == shndx]
        return sorted(fs, key=lambda s: s.value)
