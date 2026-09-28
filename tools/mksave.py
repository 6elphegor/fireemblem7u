#!/usr/bin/env python3
"""Make a save memory image (32 KiB SRAM) from a text description.

  tools/mksave.py DESC OUT [--rom baserom.gba] [--elf fe7u.elf]

For `make emutest`: an input script that starts with `sram DESC` boots both
ROMs with this image (tools/emutest.py runs this tool), so a script can
start at a later chapter, with a party, gold and a convoy, or with the
extras unlocked, instead of playing there from a new game.  The image is
built from the game's own save structures (include/gbafe/save.h,
src/save_core.c, src/bmsave.c); a character's stats are its base stats
plus its class's, read from gCharacterData / gClassData of the ROM (like
a unit loaded by an event), so nothing but IDs is in the description.

Description (one command per line, `#` comments; names are the enums of
include/constants/*.h, numbers are decimal or 0x hex):

  chapter CHAPTER_0E       gPlaySt.chapterIndex: the chapter "Continue"
                           starts (its world map / opening events first)
  mode eliwood|hector|lyn  gPlaySt.chapterModeIndex (default eliwood)
  hard                     difficult mode (PLAY_FLAG_HARD)
  gold N                   party gold
  textspeed N              config text speed: 0 slow, 1 normal (the default,
                           as InitPlayConfig), 2 fast, 3 max (GetTextPrintDelay)
  unit PID [class=JID] [level=N] [items=ITEM,ITEM:USES,...] [undeployed] [dead]
        [ranks=R,R,R,R,R,R,R,R] [supports=PID:POINTS,...]
                           the next blue unit (gUnitArrayBlue order); ranks
                           are the 8 weapon rank points (default the
                           character's), supports the support points with
                           those partners
  supply ITEM ...          convoy items (full uses)
  completed                global save info: the game has been completed
                           (the Extras menu: sound room, support viewer...)
  known PID ...            global save info: characters met (support viewer)
  soundroom all            every sound room song unlocked
  supports all             global save info: every support conversation seen
                           (the support viewer can play them)

  slot 1|2                 the chapter / mode / gold / textspeed / unit /
                           supply commands after it describe that save slot
                           (before any: slot 0, the one selected first)

Every other save block (empty slots, suspend, link arena) is left erased,
and the boot code (LoadAndVerifySramSaveData) initializes the rank, bonus,
link and sound room data it finds invalid.
"""
import argparse
import re
import struct
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))

SRAM_SIZE = 0x8000
SAVE_MAGIC32 = 0x30317
SAVE_MAGIC32_SAV = 0x11217
SAVE_MAGIC16 = 0x200A
SAVE_KIND_GAME = 0
GAME_SAVES = (0x3F2C, 0x4CB8, 0x5A44)  # GetSaveWriteAddr(SAVE_GAME0..2)
GAME_SAVE_SIZE = 0xD8C       # WriteSaveBlockInfo, SAVE_KIND_GAME
BLOCK_INFO = 0x64            # struct SramMain.block_info
SRAM_OFFSET_SOUNDROOM = 0x70FC
UNIT_SAVE_AMOUNT_BLUE = 52
PLAY_FLAG_HARD = 1 << 6
IA_UNBREAKABLE = 1 << 3
MODES = {"lyn": 1, "eliwood": 2, "hector": 3}

CHAR_SIZE, CLASS_SIZE, ITEM_SIZE = 0x34, 0x54, 0x24


def constants():
    """NAME -> value from the enums of include/constants/*.h."""
    names = {}
    for h in sorted(Path("include/constants").glob("*.h")):
        for m in re.finditer(r"\b([A-Z][A-Z0-9_]*)\s*=\s*(0x[0-9A-Fa-f]+|\d+)", h.read_text()):
            names.setdefault(m.group(1), int(m.group(2), 0))
    return names


def checksum16(data):
    """Checksum16 (src/save_core.c): sum + xor of the halfwords."""
    add = xor = 0
    for (h,) in struct.iter_unpack("<H", data[:len(data) & ~1]):
        add += h
        xor ^= h
    return (add + xor) & 0xFFFF


def checksum32(data):
    """Checksum32 (asm/crt0.s): low 16 bits of the halfword sum, xor << 16."""
    add = xor = 0
    for (h,) in struct.iter_unpack("<H", data[:len(data) & ~1]):
        add += h
        xor ^= h
    return ((add & 0xFFFF) + (xor << 16)) & 0xFFFFFFFF


def pack_bits(fields, size):
    """Little-endian bitfields packed without gaps (a packed struct)."""
    v, pos = 0, 0
    for width, value in fields:
        assert 0 <= value < 1 << width, (width, value)
        v |= value << pos
        pos += width
    return v.to_bytes(size, "little")


class Rom:
    def __init__(self, rom, elf):
        import elf32
        self.rom = Path(rom).read_bytes()
        syms = {s.name: s.value for s in elf32.Elf(elf).symbols if s.name}
        self.chars, self.classes, self.items = (syms["gCharacterData"], syms["gClassData"],
                                                syms["gItemData"])

    def at(self, addr, size):
        return self.rom[addr - 0x08000000:addr - 0x08000000 + size]

    def char(self, pid):
        return self.at(self.chars + (pid - 1) * CHAR_SIZE, CHAR_SIZE)

    def cls(self, jid):
        return self.at(self.classes + (jid - 1) * CLASS_SIZE, CLASS_SIZE)

    def new_item(self, item, uses=None):
        """MakeNewItem (src/bmitem.c)."""
        d = self.at(self.items + item * ITEM_SIZE, ITEM_SIZE)
        attributes, max_uses = struct.unpack_from("<I", d, 8)[0], d[0x14]
        if uses is None:
            uses = 0 if attributes & IA_UNBREAKABLE else max_uses
        return (uses << 8) | item


def game_unit(rom, pid, jid=None, level=None, items=(), flags=0, ranks=None, supports=()):
    """struct GameSavePackedUnit (0x24 bytes) for a character with its
    base stats (character + class bases, as UnitInitFromDefinition).
    ranks: 8 weapon ranks (default the character's); supports: (partner
    pid, points), placed at the partner's index in the character's
    struct SupportData (include/gbafe/support.h)."""
    c = rom.char(pid)
    sup = bytearray(7)
    if supports:
        sd = struct.unpack_from("<I", c, 0x2C)[0]
        pids = list(rom.at(sd, 7)) if sd else []
        for partner, points in supports:
            if partner not in pids:
                raise SystemExit(f"character {pid:#x} has no support with {partner:#x}")
            sup[pids.index(partner)] = points
    jid = jid or c[5]
    k = rom.cls(jid)
    s8 = lambda b: b - 256 if b > 127 else b  # noqa: E731
    base = [s8(x) for x in c[0x0C:0x14]]      # hp pow skl spd def res lck con
    cbase = [s8(x) for x in k[0x0B:0x11]]      # hp pow skl spd def res
    hp, pow_, skl, spd, def_, res = (base[i] + cbase[i] for i in range(6))
    lck = base[6]
    level = level or s8(c[0x0B]) or 1
    items = list(items) + [0] * (5 - len(items))
    bits = [(7, jid), (5, level), (7, 0), (6, 0x3F), (6, 0x3F), (13, flags),
            (6, hp), (5, pow_), (5, skl), (5, spd), (5, def_), (5, res), (5, lck),
            (5, 0), (5, 0)] + [(14, i) for i in items]
    ranks = bytes(ranks) if ranks is not None else bytes(c[0x14:0x1C])
    return pack_bits(bits, 20) + bytes([pid]) + ranks + bytes(sup)


def play_st(slot, ch, mode, hard, gold, textspeed):
    """struct PlaySt (include/gbafe/bm.h), as WriteNewGameSave leaves it."""
    p = bytearray(0x48)
    struct.pack_into("<I", p, 0x08, gold)
    p[0x0C] = slot                      # gameSaveSlot
    p[0x0E] = ch
    p[0x14] = PLAY_FLAG_HARD if hard else 0
    p[0x18] = 1                         # playthroughIdentifier
    p[0x1B] = mode
    p[0x20:0x25] = b"Mark\0"            # tactician name (skips the info screen)
    p[0x2B] = 1                         # tact_enabled
    struct.pack_into("<I", p, 0x40, textspeed << 5)  # cfgTextSpeed; other options 0
    return bytes(p)


def build(desc, rom):
    k = constants()

    def num(tok):
        if tok in k:
            return k[tok]
        try:
            return int(tok, 0)
        except ValueError:
            raise SystemExit(f"{desc}: unknown name or number {tok!r}")

    def new_slot():
        return {"ch": 0, "mode": MODES["eliwood"], "hard": False, "gold": 0,
                "textspeed": 1, "units": [], "supply": []}

    slots = {0: new_slot()}
    cur = slots[0]
    known = set()
    completed = soundroom = supports = False
    for n, line in enumerate(Path(desc).read_text().splitlines(), 1):
        f = line.split("#", 1)[0].split()
        if not f:
            continue
        cmd, args = f[0], f[1:]
        if cmd == "slot":
            s = num(args[0])
            if s not in (0, 1, 2) or (s in slots and s):
                raise SystemExit(f"{desc}:{n}: bad or repeated slot")
            cur = slots[s] = new_slot()
        elif cmd == "chapter":
            cur["ch"] = num(args[0])
        elif cmd == "mode":
            cur["mode"] = MODES[args[0]]
        elif cmd == "hard":
            cur["hard"] = True
        elif cmd == "gold":
            cur["gold"] = num(args[0])
        elif cmd == "textspeed":
            cur["textspeed"] = num(args[0])
        elif cmd == "unit":
            pid, opts, flags = num(args[0]), {}, 0
            for a in args[1:]:
                if a == "undeployed":
                    flags |= 2      # PACKED_US_UNDEPLOYED
                elif a == "dead":
                    flags |= 1      # PACKED_US_DEAD
                else:
                    key, _, v = a.partition("=")
                    opts[key] = v
            items = []
            for it in filter(None, opts.get("items", "").split(",")):
                name, _, uses = it.partition(":")
                items.append(rom.new_item(num(name), num(uses) if uses else None))
            cur["units"].append(game_unit(
                rom, pid, num(opts["class"]) if "class" in opts else None,
                num(opts["level"]) if "level" in opts else None, items, flags,
                [num(r) for r in opts["ranks"].split(",")] if "ranks" in opts else None,
                [tuple(num(x) for x in s.split(":")) for s in opts["supports"].split(",")]
                if "supports" in opts else ()))
            known.add(pid)
        elif cmd == "supply":
            cur["supply"] += [rom.new_item(num(a)) for a in args]
        elif cmd == "completed":
            completed = True
        elif cmd == "known":
            known.update(num(a) for a in args)
        elif cmd == "soundroom":
            soundroom = True
        elif cmd == "supports":
            supports = True
        else:
            raise SystemExit(f"{desc}:{n}: unknown command {cmd!r}")

    sram = bytearray(b"\xFF" * SRAM_SIZE)   # WipeSram
    for s, d in slots.items():
        if len(d["units"]) > UNIT_SAVE_AMOUNT_BLUE or len(d["supply"]) > 100:
            raise SystemExit(f"{desc}: too many units or convoy items")
        # struct GameSaveBlock
        g = bytearray(GAME_SAVE_SIZE)
        g[0:0x48] = play_st(s, d["ch"], d["mode"], d["hard"], d["gold"], d["textspeed"])
        for i, u in enumerate(d["units"]):
            g[0x48 + i * 0x24:0x48 + (i + 1) * 0x24] = u
        for i, it in enumerate(d["supply"]):
            struct.pack_into("<H", g, 0x798 + 2 * i, it)
        for i in range(0x46):               # ClearPidChStatsSaveData: favval 0x2000
            struct.pack_into("<I", g, 0x860 + 16 * i, 0x2000 << 8)
        base = GAME_SAVES[s]
        sram[base:base + GAME_SAVE_SIZE] = g
        # struct SaveBlockInfo of the slot
        sram[BLOCK_INFO + 16 * s:BLOCK_INFO + 16 * (s + 1)] = struct.pack(
            "<IHBxHHI", SAVE_MAGIC32_SAV, SAVE_MAGIC16, SAVE_KIND_GAME, base,
            GAME_SAVE_SIZE, checksum32(g))

    # struct GlobalSaveInfo
    h = bytearray(0x64)
    h[0:8] = b"AGB-FE7\0"
    struct.pack_into("<IH", h, 8, SAVE_MAGIC32, SAVE_MAGIC16)
    h[0x0E] = 1 if completed else 0         # completed
    if supports:                            # SuppordRecord: every support seen
        h[0x20:0x40] = b"\xFF" * 0x20
    for pid in known:                       # MetaSave_SetMetCharacter
        h[0x40 + pid // 8] |= 1 << (pid % 8)
    struct.pack_into("<H", h, 0x60, checksum16(bytes(h[:0x50])))
    h[0x62] = 0                             # last_game_save_id
    h[0x63] = 0
    sram[0:0x64] = h

    if soundroom:                           # struct SoundRoomSaveData
        sr = bytearray(b"\xFF" * 0x20) + bytes(4)
        struct.pack_into("<H", sr, 0x20, checksum16(bytes(sr[:0x20])))
        sram[SRAM_OFFSET_SOUNDROOM:SRAM_OFFSET_SOUNDROOM + 0x24] = sr
    return bytes(sram)


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("desc")
    p.add_argument("out")
    p.add_argument("--rom", default="baserom.gba")
    p.add_argument("--elf", default="fe7u.elf")
    a = p.parse_args()
    Path(a.out).write_bytes(build(a.desc, Rom(a.rom, a.elf)))


if __name__ == "__main__":
    main()
