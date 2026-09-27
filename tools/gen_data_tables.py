#!/usr/bin/env python3
"""Dump FE7U's core gameplay tables from baserom.gba as C initializers.

Usage: tools/gen_data_tables.py [OUT_DIR]   (default: src/data)

Writes characters.c, classes.c, items.c, itemuse.c, supports.c,
itembonus.c and terrains.c.  The output is committed; this script only
exists to regenerate it (e.g. after renaming constants) and documents
where each table lives.  Every byte of each table's range is emitted, so
a successful `make` (which asserts address and size via data/layout.txt)
proves the C matches the ROM.

Message ids get the decoded text as a comment (FE7U Huffman text).
"""
import re
import struct
import sys
from pathlib import Path

ROM = Path("baserom.gba").read_bytes()
OUT = Path(sys.argv[1] if len(sys.argv) > 1 else "src/data")


def rd8(a): return ROM[a - 0x08000000]
def rds8(a): return struct.unpack_from("<b", ROM, a - 0x08000000)[0]
def rd16(a): return struct.unpack_from("<H", ROM, a - 0x08000000)[0]
def rd32(a): return struct.unpack_from("<I", ROM, a - 0x08000000)[0]


# --- text -----------------------------------------------------------------

MSG_TABLE = 0x08B808AC
HUFFMAN_TREE = 0x08B7D71C
HUFFMAN_ROOT = rd32(0x08B808A8)


def decode_msg(msgid):
    """Decode a message as DecodeString does; control codes are dropped."""
    p = rd32(MSG_TABLE + 4 * msgid)
    out = bytearray()
    if p & 0x80000000:
        p &= 0x7FFFFFFF
        while rd8(p):
            out.append(rd8(p))
            p += 1
    else:
        bits = cnt = 0
        done = False
        while not done:
            node = HUFFMAN_ROOT
            while True:
                if cnt == 0:
                    bits, cnt = rd8(p), 8
                    p += 1
                cnt -= 1
                node = HUFFMAN_TREE + 4 * rd16(node + (2 if bits & 1 else 0))
                bits >>= 1
                leaf = rd32(node)
                if leaf & 0x80000000:
                    break
            if leaf & 0xFF00:
                out += bytes([leaf & 0xFF, (leaf >> 8) & 0xFF])
            elif leaf & 0xFF:
                out.append(leaf & 0xFF)
            else:
                done = True
    text = "".join(chr(c) if 0x20 <= c < 0x7F else " " for c in out)
    return re.sub(r"\s+", " ", text).strip().replace("*/", "* /")


def msg_field(name, msgid):
    text = decode_msg(msgid) if msgid else ""
    return f".{name} = 0x{msgid:X}," + (f" // {text}" if text else "")


# --- constants --------------------------------------------------------------

def parse_enum(path, prefix):
    names = {}
    for m in re.finditer(r"\b(" + prefix + r"\w+)\s*=\s*(0x[0-9A-Fa-f]+|\d+)\s*,",
                         Path(path).read_text()):
        names.setdefault(int(m.group(2), 0), m.group(1))
    return names


ITEMS = parse_enum("include/constants/items.h", "ITEM_")
CLASSES = parse_enum("include/constants/classes.h", "CLASS_")
CHARS = parse_enum("include/constants/characters.h", "CHARACTER_")
TERRAINS = parse_enum("include/constants/terrains.h", "TERRAIN_")
TERRAIN_COUNT = 0x41

ITYPES = ["ITYPE_SWORD", "ITYPE_LANCE", "ITYPE_AXE", "ITYPE_BOW", "ITYPE_STAFF",
          "ITYPE_ANIMA", "ITYPE_LIGHT", "ITYPE_DARK", "ITYPE_BLLST", "ITYPE_ITEM",
          "ITYPE_DRAGN", "ITYPE_11", "ITYPE_12"]
WPN_EXP = {1: "WPN_EXP_E", 31: "WPN_EXP_D", 71: "WPN_EXP_C", 121: "WPN_EXP_B",
           181: "WPN_EXP_A", 251: "WPN_EXP_S"}
WPN_EFFECTS = ["WPN_EFFECT_NONE", "WPN_EFFECT_POISON", "WPN_EFFECT_HPDRAIN",
               "WPN_EFFECT_HPHALVE", "WPN_EFFECT_DEVIL"]
IA_FLAGS = ["IA_WEAPON", "IA_MAGIC", "IA_STAFF", "IA_UNBREAKABLE", "IA_UNSELLABLE",
            "IA_BRAVE", "IA_MAGICDAMAGE", "IA_UNCOUNTERABLE", "IA_REVERTTRIANGLE",
            "IA_HAMMERNE", "IA_LOCK_3", "IA_LOCK_1", "IA_LOCK_2", "IA_LOCK_0",
            "IA_NEGATE_FLYING", "IA_NEGATE_CRIT", "IA_UNUSABLE", "IA_NEGATE_DEFENSE",
            "IA_LOCK_4", "IA_LOCK_5", "IA_LOCK_6", "IA_LOCK_7"]
CA_FLAGS = ["CA_MOUNTEDAID", "CA_CANTO", "CA_STEAL", "CA_THIEF", "CA_DANCE", "CA_PLAY",
            "CA_CRITBONUS", "CA_BALLISTAE", "CA_PROMOTED", "CA_SUPPLY", "CA_MOUNTED",
            "CA_WYVERN", "CA_PEGASUS", "CA_LORD", "CA_FEMALE", "CA_BOSS", "CA_LOCK_1",
            "CA_LOCK_2", "CA_LOCK_3", "CA_MAXLEVEL10", "CA_UNSELECTABLE",
            "CA_TRIANGLEATTACK_PEGASI", "CA_TRIANGLEATTACK_ARMORS", "CA_BIT_23",
            "CA_NEGATE_LETHALITY", "CA_ASSASSIN", "CA_MAGICSEAL", "CA_SUMMON", "CA_LOCK_4",
            "CA_LOCK_5", "CA_LOCK_6", "CA_LOCK_7"]


def flags(value, names):
    parts = [n for i, n in enumerate(names) if value & (1 << i)]
    rest = value & ~((1 << len(names)) - 1)
    if rest:
        parts.append(f"0x{rest:X}")
    return " | ".join(parts) if parts else "0"


def item(v): return ITEMS.get(v, f"0x{v:02X}")
def cls(v): return CLASSES.get(v, f"0x{v:02X}")
def char(v): return CHARS.get(v, f"0x{v:02X}")
def wexp(v): return WPN_EXP.get(v, str(v))


def camel(text):
    return "".join(w[:1].upper() + w[1:] for w in re.split(r"[^A-Za-z0-9]+", text) if w)


def ranks(addr):
    vals = [rd8(addr + i) for i in range(8)]
    if not any(vals):
        return None
    return "{ " + ", ".join(f"[{ITYPES[i]}] = {wexp(v)}" for i, v in enumerate(vals) if v) + " }"


def write(name, lines):
    (OUT / name).write_text("\n".join(lines).rstrip() + "\n")


def extern_block(decls):
    return sorted(set(decls)) + [""] if decls else []


# --- addresses ----------------------------------------------------------------

CHAR_TABLE, CHAR_COUNT = 0x08BDCE4C, 253
CLASS_TABLE, CLASS_COUNT = 0x08BE01B0, 99
ITEM_TABLE, ITEM_COUNT = 0x08BE222C, 0x9F
TERRAIN_START, TERRAIN_END = 0x08BE3888, 0x08BE516A
ITEMUSE_START, ITEMUSE_END = 0x08C97E90, 0x08C97F39
SUPPORT_START, SUPPORT_COUNT = 0x08C98B18, 48
BONUS_START, BONUS_COUNT = 0x08C98F98, 16

HEADER = ['#include "gbafe.h"', "", "// Generated by tools/gen_data_tables.py", ""]


# --- terrains ----------------------------------------------------------------

def terrain_tables():
    """(addr, name, kind) for each 65-entry table, then the two special tables."""
    groups = ["CommonT2", "CommonT1", "Armor", "Fighter", "Berserker", "Brigand",
              "Pirate", "Thief", "Magic", "Civilian", "HorseT1", "HorseT2",
              "NomadT1", "NomadT2", "Fly"]
    tabs = []
    a = TERRAIN_START
    for weather in ["Normal", "Rain", "Snow"]:
        for g in groups:
            tabs.append((a, f"TerrainTable_MovCost_{g}{weather}"))
            a += TERRAIN_COUNT
        if weather == "Normal":
            tabs.append((a, "TerrainTable_MovCost_FireDragon"))
            a += TERRAIN_COUNT
            tabs.append((a, "TerrainTable_MovCost_Ballista"))
            a += TERRAIN_COUNT
        else:
            tabs.append((a, f"TerrainTable_MovCost_Unk{weather}"))
            a += TERRAIN_COUNT
    for n in ["Avo_Common", "Def_Common", "Res_Common", "Avo_Fly", "Def_Fly", "Res_Fly",
              "Unk50_Brigand", "Unk50_Pirate", "Unk50_Berserker", "Unk50_Cleric", "Unk50_Unused",
              "HealAmount", "HealsStatus"]:
        tabs.append((a, "TerrainTable_" + n))
        a += TERRAIN_COUNT
    tabs.append((a, "BanimTerrainGroundDefault"))
    a += TERRAIN_COUNT
    for i in range(1, 15):
        tabs.append((a, f"BanimTerrainGround_Tileset{i:02X}"))
        a += TERRAIN_COUNT
    tabs.append((a, "gBanimBGLutDefault"))
    a += TERRAIN_COUNT
    for i in range(1, 15):
        tabs.append((a, f"gBanimBGLut{i:02X}"))
        a += TERRAIN_COUNT
    assert a == 0x08BE4FE4, hex(a)
    return tabs


TERRAIN_TABLES = terrain_tables()
TERRAIN_NAMES = {a: n for a, n in TERRAIN_TABLES}


def gen_terrains():
    out = HEADER + [
        "// Per-terrain lookup tables: movement costs per class group and weather,",
        "// avoid/def/res bonuses, healing, and battle animation backgrounds.",
        "",
    ]
    for a, name in TERRAIN_TABLES:
        out.append(f"CONST_DATA s8 {name}[TERRAIN_COUNT] = {{")
        for t in range(TERRAIN_COUNT):
            out.append(f"    [{TERRAINS[t]}] = {rds8(a + t)},")
        out += ["};", ""]
    out.append("// Japanese (Shift-JIS) terrain names, unused in FE7U")
    out.append("CONST_DATA char const * gTerrainDebugNameTable[TERRAIN_COUNT] = {")
    for t in range(TERRAIN_COUNT):
        out.append(f"    [{TERRAINS[t]}] = (char const *) 0x{rd32(0x08BE4FE4 + 4 * t):08X},")
    out += ["};", ""]
    out.append("CONST_DATA u16 gTerrainNameMsgTable[TERRAIN_COUNT] = {")
    for t in range(TERRAIN_COUNT):
        m = rd16(0x08BE50E8 + 2 * t)
        out.append(f"    [{TERRAINS[t]}] = 0x{m:X}, // {decode_msg(m)}")
    out += ["};"]
    write("terrains.c", out)


# --- item effectiveness / item use class lists ---------------------------------

ITEMUSE_NAMES = {
    0x08C97E90: "ItemEffectiveness_Unused_08C97E90",
    0x08C97E96: "ItemEffectiveness_Armor",
    0x08C97E9C: "ItemEffectiveness_ArmorAndHorse",
    0x08C97EAD: "ItemEffectiveness_Swordsman",
    0x08C97EB7: "ItemEffectiveness_Horse",
    0x08C97EC3: "ItemEffectiveness_Dragon",
    0x08C97EC5: "ItemEffectiveness_Dragon_Wyvern",
    0x08C97ECB: "ItemEffectiveness_Dragon_Wyvern_DarkDruid",
    0x08C97ED2: "ItemEffectiveness_08C97ED2",  # fliers (bows)
    0x08C97EDD: "gItemUseJidList_HeroCrest",
    0x08C97EE3: "gItemUseJidList_KnightCrest",
    0x08C97EE8: "gItemUseJidList_OrionsBolt",
    0x08C97EED: "gItemUseJidList_ElysianWhip",
    0x08C97EF1: "gItemUseJidList_GuidingRing",
    0x08C97EFD: "gItemUseJidList_EarthSeal",
    0x08C97F16: "gItemUseJidList_HeavenSeal",
    0x08C97F21: "gItemUseJidList_HeavenSealHector",
    0x08C97F24: "gItemUseJidList_OceanSeal",
    0x08C97F29: "gItemUseJidList_FellContract",
}


def gen_itemuse():
    out = HEADER + [
        "// Class lists terminated by CLASS_NONE: weapon effectiveness",
        "// (ItemData::pEffectiveness) and promotion item users.",
        "",
    ]
    a = ITEMUSE_START
    while a < ITEMUSE_END:
        name = ITEMUSE_NAMES.get(a, f"gItemUseJidList_Unk_{a:08X}")
        vals = []
        while True:
            v = rd8(a)
            a += 1
            vals.append(cls(v))
            if v == 0:
                break
        out.append(f"CONST_DATA u8 {name}[] = {{")
        out += [f"    {v}," for v in vals]
        out += ["};", ""]
    assert a == ITEMUSE_END
    write("itemuse.c", out)


# --- item stat bonuses ----------------------------------------------------------

BONUS_FIELDS = ["hpBonus", "powBonus", "sklBonus", "spdBonus", "defBonus",
                "resBonus", "lckBonus", "movBonus", "conBonus"]


def bonus_names():
    names = {}
    for i in range(ITEM_COUNT):
        p = rd32(ITEM_TABLE + i * 0x24 + 0xC)
        if p:
            names.setdefault(p, "ItemBonus_" + camel(decode_msg(rd16(ITEM_TABLE + i * 0x24))))
    return names


BONUS_NAMES = bonus_names()


def gen_itembonus():
    out = list(HEADER)
    for i in range(BONUS_COUNT):
        a = BONUS_START + i * 12
        assert ROM[a + 9 - 0x08000000:a + 12 - 0x08000000] == b"\0\0\0"
        out.append(f"CONST_DATA struct ItemStatBonuses {BONUS_NAMES[a]} = {{")
        for j, f in enumerate(BONUS_FIELDS):
            if rds8(a + j):
                out.append(f"    .{f} = {rds8(a + j)},")
        out += ["};", ""]
    write("itembonus.c", out)


# --- items --------------------------------------------------------------------

def gen_items():
    decls = [f"extern CONST_DATA struct ItemStatBonuses {n};" for n in BONUS_NAMES.values()]
    decls += [f"extern CONST_DATA u8 {n}[];" for n in ITEMUSE_NAMES.values()
              if n.startswith("ItemEffectiveness")]
    out = HEADER + extern_block(decls) + ["CONST_DATA struct ItemData gItemData[] = {"]
    for i in range(ITEM_COUNT):
        a = ITEM_TABLE + i * 0x24
        assert rd8(a + 6) == i
        f = []
        for name, off in [("nameTextId", 0), ("descTextId", 2), ("useDescTextId", 4)]:
            if rd16(a + off):
                f.append(msg_field(name, rd16(a + off)))
        f.append(f".number = {item(i)},")
        f.append(f".weaponType = {ITYPES[rd8(a + 7)]},")
        if rd32(a + 8):
            f.append(f".attributes = {flags(rd32(a + 8), IA_FLAGS)},")
        if rd32(a + 0xC):
            f.append(f".pStatBonuses = &{BONUS_NAMES[rd32(a + 0xC)]},")
        if rd32(a + 0x10):
            f.append(f".pEffectiveness = {ITEMUSE_NAMES[rd32(a + 0x10)]},")
        for name, off in [("maxUses", 0x14), ("might", 0x15), ("hit", 0x16),
                          ("weight", 0x17), ("crit", 0x18)]:
            if rd8(a + off):
                f.append(f".{name} = {rd8(a + off)},")
        if rd8(a + 0x19):
            f.append(f".encodedRange = 0x{rd8(a + 0x19):02X},")
        if rd16(a + 0x1A):
            f.append(f".costPerUse = {rd16(a + 0x1A)},")
        if rd8(a + 0x1C):
            f.append(f".weaponRank = {wexp(rd8(a + 0x1C))},")
        f.append(f".iconId = 0x{rd8(a + 0x1D):X},")
        if rd8(a + 0x1E):
            f.append(f".useEffectId = 0x{rd8(a + 0x1E):X},")
        if rd8(a + 0x1F):
            f.append(f".weaponEffectId = {WPN_EFFECTS[rd8(a + 0x1F)]},")
        if rd8(a + 0x20):
            f.append(f".weaponExp = {rd8(a + 0x20)},")
        if rd8(a + 0x21):
            f.append(f".unk21 = {rd8(a + 0x21)},")
        assert rd16(a + 0x22) == 0, hex(a)
        out.append(f"    [{item(i)}] = {{")
        out += ["        " + x for x in f]
        out.append("    },")
    out.append("};")
    write("items.c", out)


# --- classes ------------------------------------------------------------------

def gen_classes():
    decls = [f"extern CONST_DATA s8 {n}[];" for n in TERRAIN_NAMES.values()]
    out = HEADER + extern_block(decls) + ["CONST_DATA struct ClassData gClassData[] = {"]
    stats = ["HP", "Pow", "Skl", "Spd", "Def", "Res", "Con", "Mov"]
    for i in range(CLASS_COUNT):
        a = CLASS_TABLE + i * 0x54
        jid = i + 1
        assert rd8(a + 4) == jid
        f = [msg_field("nameTextId", rd16(a)), msg_field("descTextId", rd16(a + 2))]
        f.append(f".number = {cls(jid)},")
        f.append(f".promotion = {cls(rd8(a + 5))},")
        f.append(f".SMSId = 0x{rd8(a + 6):X},")
        f.append(f".slowWalking = {rd8(a + 7)},")
        f.append(f".defaultPortraitId = 0x{rd16(a + 8):X},")
        f.append(f".sort_order = {rd8(a + 0xA)},")
        f.append("")
        f += [f".base{s} = {rds8(a + 0xB + j)}," for j, s in enumerate(stats)]
        f.append("")
        f += [f".max{s} = {rds8(a + 0x13 + j)}," for j, s in enumerate(stats[:7])]
        f.append("")
        f.append(f".classRelativePower = {rds8(a + 0x1A)},")
        f.append("")
        f += [f".growth{s} = {rds8(a + 0x1B + j)},"
              for j, s in enumerate(["HP", "Pow", "Skl", "Spd", "Def", "Res", "Lck"])]
        f.append("")
        f += [f".promotion{s} = {rd8(a + 0x22 + j)},"
              for j, s in enumerate(["Hp", "Pow", "Skl", "Spd", "Def", "Res"])]
        f.append("")
        if rd32(a + 0x28):
            f.append(f".attributes = {flags(rd32(a + 0x28), CA_FLAGS)},")
        r = ranks(a + 0x2C)
        if r:
            f.append(f".baseRanks = {r},")
        if rd32(a + 0x34):
            f.append(f".pBattleAnimDef = (const void *) 0x{rd32(a + 0x34):08X},")
        mov = [rd32(a + 0x38 + 4 * j) for j in range(3)]
        if any(mov):
            f.append(".pMovCostTable = { " + ", ".join(TERRAIN_NAMES[p] for p in mov) + " },")
        for name, off in [("pTerrainAvoidLookup", 0x44), ("pTerrainDefenseLookup", 0x48),
                          ("pTerrainResistanceLookup", 0x4C), ("_pU50", 0x50)]:
            if rd32(a + off):
                f.append(f".{name} = {TERRAIN_NAMES[rd32(a + off)]},")
        out.append(f"    [{cls(jid)} - 1] = {{")
        out += [("        " + x) if x else "" for x in f]
        out.append("    },")
    out.append("};")
    write("classes.c", out)


# --- supports / characters ----------------------------------------------------

def support_names():
    names = {}
    for i in range(CHAR_COUNT):
        p = rd32(CHAR_TABLE + i * 0x34 + 0x2C)
        if p:
            names[p] = "SupportData_" + camel(CHARS[i + 1][len("CHARACTER_"):].lower())
    for i in range(SUPPORT_COUNT):
        names.setdefault(SUPPORT_START + i * 0x18, f"SupportData_Unused_{SUPPORT_START + i * 0x18:08X}")
    return names


SUPPORT_NAMES = support_names()


def gen_supports():
    out = list(HEADER)
    for i in range(SUPPORT_COUNT):
        a = SUPPORT_START + i * 0x18
        assert rd16(a + 0x16) == 0
        out.append(f"CONST_DATA struct SupportData {SUPPORT_NAMES[a]} = {{")
        out.append("    .pids = { " + ", ".join(char(rd8(a + j)) for j in range(7)) + " },")
        out.append("    .exp_base = { " + ", ".join(str(rd8(a + 7 + j)) for j in range(7)) + " },")
        out.append("    .exp_growth = { " + ", ".join(str(rd8(a + 14 + j)) for j in range(7)) + " },")
        out.append(f"    .count = {rd8(a + 0x15)},")
        out += ["};", ""]
    write("supports.c", out)


def gen_characters():
    decls = [f"extern CONST_DATA struct SupportData {n};" for n in SUPPORT_NAMES.values()]
    out = HEADER + extern_block(decls) + ["CONST_DATA struct CharacterData gCharacterData[] = {"]
    for i in range(CHAR_COUNT):
        a = CHAR_TABLE + i * 0x34
        pid = i + 1
        assert rd8(a + 4) == pid
        f = [msg_field("nameTextId", rd16(a)), msg_field("descTextId", rd16(a + 2))]
        f.append(f".number = {char(pid)},")
        f.append(f".defaultClass = {cls(rd8(a + 5))},")
        f.append(f".portraitId = 0x{rd16(a + 6):X},")
        f.append(f".miniPortrait = 0x{rd8(a + 8):X},")
        f.append(f".affinity = {rd8(a + 9)},")
        f.append(f".sort_order = {rd8(a + 0xA)},")
        f.append("")
        f += [f".base{s} = {rds8(a + 0xB + j)},"
              for j, s in enumerate(["Level", "HP", "Pow", "Skl", "Spd", "Def", "Res", "Lck", "Con"])]
        f.append("")
        r = ranks(a + 0x14)
        if r:
            f.append(f".baseRanks = {r},")
        f += [f".growth{s} = {rd8(a + 0x1C + j)},"
              for j, s in enumerate(["HP", "Pow", "Skl", "Spd", "Def", "Res", "Lck"])]
        for j in range(0x23, 0x28):
            if rd8(a + j):
                f.append(f"._u{j:02x} = {rd8(a + j)},")
        if rd32(a + 0x28):
            f.append(f".attributes = {flags(rd32(a + 0x28), CA_FLAGS)},")
        if rd32(a + 0x2C):
            f.append(f".pSupportData = &{SUPPORT_NAMES[rd32(a + 0x2C)]},")
        if rd8(a + 0x30):
            f.append(f".visit_group = {rd8(a + 0x30)},")
        for off in (0x31, 0x32, 0x33):
            assert rd8(a + off) == 0, hex(a + off)
        out.append(f"    [{char(pid)} - 1] = {{")
        out += [("        " + x) if x else "" for x in f]
        out.append("    },")
    out.append("};")
    write("characters.c", out)


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    gen_characters()
    gen_classes()
    gen_items()
    gen_terrains()
    gen_itemuse()
    gen_supports()
    gen_itembonus()


if __name__ == "__main__":
    main()
