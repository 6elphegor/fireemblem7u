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

BANIMCONF_START, BANIMCONF_END = 0x08C99058, 0x08C996B4
UNIQUE_BANIM_TABLE, UNIQUE_BANIM_COUNT = 0x08C996B4, 19

HEADER = ['#include "gbafe.h"', "", "// Generated by tools/gen_data_tables.py", ""]


# --- class battle animation configs ------------------------------------------

def banimconf_names():
    names = {}
    for i in range(CLASS_COUNT):
        p = rd32(CLASS_TABLE + i * 0x54 + 0x34)
        if p:
            names.setdefault(p, "BanimConf_" + camel(CLASSES[i + 1][len("CLASS_"):].lower()))
    for i in range(1, UNIQUE_BANIM_COUNT):
        names.setdefault(rd32(UNIQUE_BANIM_TABLE + 4 * i), f"BanimConf_Unique{i:02X}")
    return names


BANIMCONF_NAMES = banimconf_names()


def gen_banimconf():
    out = HEADER + [
        "// Battle animation lists, terminated by { 0, 0 }.  wtype is an item id,",
        "// or 0x100 + a weapon type (ITYPE_ITEM: unarmed).",
        "",
    ]
    a = BANIMCONF_START
    while a < BANIMCONF_END:
        name = BANIMCONF_NAMES.get(a, f"BanimConf_Unused_{a:08X}")
        out.append(f"CONST_DATA struct BattleAnimDef {name}[] = {{")
        while True:
            w, idx = rd16(a), rd16(a + 2)
            a += 4
            if w == 0 and idx == 0:
                out.append("    { 0, 0 },")
                break
            if w >> 8 == 1:
                ws = f"0x100 + {ITYPES[w & 0xFF]}"
            else:
                assert w >> 8 == 0
                ws = item(w)
            out.append(f"    {{ {ws}, 0x{idx:02X} }},")
        out += ["};", ""]
    assert a == BANIMCONF_END
    out.append("CONST_DATA struct BattleAnimDef const * gUnitSpecificBanimConfigs[] = {")
    for i in range(UNIQUE_BANIM_COUNT):
        p = rd32(UNIQUE_BANIM_TABLE + 4 * i)
        out.append(f"    {BANIMCONF_NAMES[p] if p else 'NULL'},")
    out.append("};")
    write("banimconf.c", out)


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
    out.append("// Japanese terrain names (Shift-JIS in ROM; .rodata at 0x083B7C7C), unused in FE7U")
    out.append("CONST_DATA char const * gTerrainDebugNameTable[TERRAIN_COUNT] = {")
    for t in range(TERRAIN_COUNT):
        out.append(f'    [{TERRAINS[t]}] = "{sjis(rd32(0x08BE4FE4 + 4 * t))}",')
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
    decls += [f"extern CONST_DATA struct BattleAnimDef {n}[];" for n in BANIMCONF_NAMES.values()]
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
            f.append(f".pBattleAnimDef = {BANIMCONF_NAMES[rd32(a + 0x34)]},")
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
        f.append(f".affinity = AFFINITY_{rd8(a + 9)}," if rd8(a + 9) else ".affinity = 0,")
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


# --- affinity bonuses -----------------------------------------------------------

AFFINITY_TABLE, AFFINITY_COUNT = 0x08C9A1C0, 8


def gen_affinity():
    out = HEADER + ["// Per-affinity support bonuses, terminated by affinity 0", "",
                    "CONST_DATA struct SupportBonuses AffinityBonuses[] = {"]
    for i in range(AFFINITY_COUNT):
        a = AFFINITY_TABLE + i * 8
        assert rd8(a + 7) == 0
        aff = rd8(a)
        f = [f"AFFINITY_{aff}" if aff else "0"] + [str(rd8(a + j)) for j in range(1, 7)]
        out.append("    { " + ", ".join(f) + " },")
    out.append("};")
    write("affinity.c", out)


# --- chapters -----------------------------------------------------------------

CHAPTER_TABLE, CHAPTER_COUNT = 0x08C9A200, 67

# (offset, field, kind, count): kinds are u8/s8/u16/u32/msg/hex8/hex16
CHAPTER_FIELDS = [
    (0x04, "asset_img_a", "u8", 1), (0x05, "asset_img_b", "u8", 1),
    (0x06, "asset_pal", "u8", 1), (0x07, "asset_tileset", "u8", 1),
    (0x08, "asset_map", "u8", 1), (0x09, "asset_img_anims", "u8", 1),
    (0x0A, "asset_pal_anims", "u8", 1), (0x0B, "asset_map_changes", "u8", 1),
    None,
    (0x0C, "fog", "u8", 1), (0x0D, "has_prep", "u8", 1), (0x0E, "title_ids", "u8", 2),
    (0x10, "unk_0F", "u8", 1), (0x11, "unk_10", "u8", 1), (0x12, "weather", "u8", 1),
    (0x13, "banim_terrain_id", "u8", 1), (0x14, "hard_bonus_levels", "u8", 1),
    None,
    (0x16, "map_bgm_ids", "hex16", 8), (0x26, "song_prologue_lyn", "hex16", 1),
    (0x28, "song_openning", "hex16", 2),
    None,
    (0x2C, "wall_hp", "u8", 1),
    None,
    (0x2D, "turnsForTacticsRankAInEliwoodStory", "u8", 2),
    (0x2F, "turnsForTacticsRankAInHectorStory", "u8", 2),
    (0x31, "turnsForTacticsRankBInEliwoodStory", "u8", 2),
    (0x33, "turnsForTacticsRankBInHectorStory", "u8", 2),
    (0x35, "turnsForTacticsRankCInEliwoodStory", "u8", 2),
    (0x37, "turnsForTacticsRankCInHectorStory", "u8", 2),
    (0x39, "turnsForTacticsRankDInEliwoodStory", "u8", 2),
    (0x3B, "turnsForTacticsRankDInHectorStory", "u8", 2),
    (0x3D, "unk3D", "u8", 1),
    None,
    (0x3E, "gainedExpForExpRankAInEliwoodStory", "u16", 2),
    (0x42, "gainedExpForExpRankAInHectorStory", "u16", 2),
    (0x46, "gainedExpForExpRankBInEliwoodStory", "u16", 2),
    (0x4A, "gainedExpForExpRankBInHectorStory", "u16", 2),
    (0x4E, "gainedExpForExpRankCInEliwoodStory", "u16", 2),
    (0x52, "gainedExpForExpRankCInHectorStory", "u16", 2),
    (0x56, "gainedExpForExpRankDInEliwoodStory", "u16", 2),
    (0x5A, "gainedExpForExpRankDInHectorStory", "u16", 2),
    (0x5E, "unk5E", "u16", 1),
    None,
    (0x60, "goldForFundsRankInEliwoodStory", "u32", 2),
    (0x68, "goldForFundsRankInHectorStory", "u32", 2),
    None,
    (0x70, "msg_chapter_title", "msg", 2), (0x74, "unk74", "msg", 2),
    None,
    (0x78, "mapEventDataId", "u8", 1), (0x79, "gmapEventId", "u8", 1),
    None,
    (0x7A, "divinationTextIdBeginning", "msg", 1),
    (0x7C, "divinationTextIdInEliwoodStory", "msg", 1),
    (0x7E, "divinationTextIdInHectorStory", "msg", 1),
    (0x80, "divinationTextIdEnding", "msg", 1),
    (0x82, "divinationPortrait", "u8", 1), (0x83, "divinationFee", "u8", 1),
    None,
    (0x84, "prepScreenNumber", "u8", 2),
    (0x86, "merchantPosX", "u8", 1), (0x87, "merchantPosXInHectorStory", "u8", 1),
    (0x88, "merchantPosY", "u8", 1), (0x89, "merchantPosYInHectorStory", "u8", 1),
    None,
    (0x8A, "victorySongEnemyThreshold", "s8", 1), (0x8B, "fadeToBlack", "u8", 1),
    None,
    (0x8C, "statusObjectiveTextId", "msg", 1), (0x8E, "goalWindowTextId", "msg", 1),
    (0x90, "goalWindowDataType", "u8", 1), (0x91, "protectCharacterIndex", "u8", 1),
    (0x92, "destPosX", "u8", 1), (0x93, "destPosY", "u8", 1),
    None,
    (0x94, "unk94", "u8", 1), (0x95, "default_background", "u8", 1),
    (0x96, "unk96", "u8", 1), (0x97, "unk97", "u8", 1),
]


def gen_chapters():
    rd = {"u8": rd8, "s8": rds8, "hex16": rd16, "u16": rd16, "msg": rd16, "u32": rd32}
    size = {"u8": 1, "s8": 1, "hex16": 2, "u16": 2, "msg": 2, "u32": 4}
    chapters = parse_enum("include/constants/chapters.h", "CHAPTER_")
    out = HEADER + ["CONST_DATA struct ChapterInfo gChapterDataTable[] = {"]
    for i in range(CHAPTER_COUNT):
        a = CHAPTER_TABLE + i * 0x98
        assert rd8(a + 0x15) == 0
        name = chapters.get(i, f"0x{i:02X}")
        out.append(f"    [{name}] = {{")
        out.append(f'        .debug_name = "{cstr(rd32(a))}",')
        for fld in CHAPTER_FIELDS:
            if fld is None:
                out.append("")
                continue
            off, field, kind, count = fld
            vals = [rd[kind](a + off + j * size[kind]) for j in range(count)]
            if kind == "msg":
                strs = [f"0x{v:X}" for v in vals]
                texts = [decode_msg(v) for v in vals if v]
                comment = " // " + " / ".join(dict.fromkeys(texts)) if texts else ""
            else:
                strs = [f"0x{v:X}" if kind == "hex16" else str(v) for v in vals]
                comment = ""
            val = strs[0] if count == 1 else "{ " + ", ".join(strs) + " }"
            out.append(f"        .{field} = {val},{comment}")
        out.append("    },")
    out.append("};")
    write("chapters.c", out)


# --- debug unit names -----------------------------------------------------------

DEBUG_PINFO_TABLE = 0x08C97F3C


def cstr(a):
    o = a - 0x08000000
    return ROM[o:ROM.index(b"\0", o)].decode("ascii")


def sjis(a):
    o = a - 0x08000000
    return ROM[o:ROM.index(b"\0", o)].decode("cp932")


def gen_debugpinfo():
    out = HEADER + [
        "// Unreferenced: debug names of each character and its (generic) class.",
        "// The string literals are the module's .rodata (0x083B7E14).",
        "",
        "struct DebugPInfo {",
        "    int jid;",
        "    char const * pname;",
        "    char const * jname;",
        "};",
        "",
        "CONST_DATA struct DebugPInfo gDebugPInfo[] = {",
    ]
    for i in range(CHAR_COUNT):
        a = DEBUG_PINFO_TABLE + i * 12
        out.append(f'    [{char(i + 1)} - 1] = {{ {cls(rd32(a))}, "{cstr(rd32(a + 4))}", "{cstr(rd32(a + 8))}" }},')
    out.append("};")
    write("debugpinfo.c", out)


# --- standing map sprites ---------------------------------------------------------

UNIT_ICON_WAIT_TABLE, UNIT_ICON_WAIT_COUNT = 0x08C99700, 88
UNIT_ICON_SIZES = ["UNIT_ICON_SIZE_16x16", "UNIT_ICON_SIZE_16x32", "UNIT_ICON_SIZE_32x32"]


def unit_icon_names():
    """Standing sprite sheet names, after the first class using each SMS id."""
    names = {}
    for i in range(CLASS_COUNT):
        sms = rd8(CLASS_TABLE + i * 0x54 + 6)
        name = CLASSES[i + 1][len("CLASS_"):]
        names.setdefault(sms, "Class" + name if name[0].isdigit() else camel(name.lower()))
    return names


def gen_unit_icon_wait():
    names = unit_icon_names()
    sheets = [f"unit_icon_wait_{names[i]}_sheet" for i in range(UNIT_ICON_WAIT_COUNT)]
    out = HEADER + extern_block([f"extern u8 const {s}[];" for s in sheets]) + [
        "// Standing map sprites, indexed by ClassData::SMSId",
        "CONST_DATA struct UnitIconWait unit_icon_wait_table[] = {",
    ]
    for i in range(UNIT_ICON_WAIT_COUNT):
        a = UNIT_ICON_WAIT_TABLE + i * 8
        out.append(f"    [0x{i:02X}] = {{ {rd16(a)}, {UNIT_ICON_SIZES[rd16(a + 2)]}, {sheets[i]} }},")
    out.append("};")
    write("unit_icon_wait.c", out)
    return {rd32(UNIT_ICON_WAIT_TABLE + i * 8 + 4): sheets[i] for i in range(UNIT_ICON_WAIT_COUNT)}


# --- spell associations ----------------------------------------------------------

SPELL_ASSOC_TABLE, SPELL_ASSOC_COUNT = 0x08C999C0, 128
SPELL_ASSOC_PROCS = {
    0x08C9E044: "ProcScr_SpellAssocFortify",
    0x08C9E0BC: "ProcScr_SpellAssocAntitoxin",
    0x08C9E104: "ProcScr_SpellAssocPureWater",
    0x08C9E14C: "ProcScr_SpellAssocElixir",
    0x08C9E1A4: "ProcScr_SpellAssocVulnerary",
    0x08C9E1FC: "ProcScr_SpellAssocHeal",
    0x08C9E264: "ProcScr_SpellAssocMend",
    0x08C9E2CC: "ProcScr_SpellAssocRecover",
    0x08C9E334: "ProcScr_SpellAssocPhysic",
    0x08C9E39C: "ProcScr_SpellAssocTorch",
    0x08C9E3E4: "ProcScr_SpellAssocUnlock",
    0x08C9E46C: "ProcScr_SpellAssocBerserk",
    0x08C9E50C: "ProcScr_SpellAssocSleep",
    0x08C9E5AC: "ProcScr_SpellAssocSilence",
    0x08C9E64C: "ProcScr_SpellAssocRestore",
    0x08C9E6D4: "ProcScr_SpellAssocRepair",
    0x08C9E81C: "ProcScr_SpellAssocBarrier",
    0x08C9E8A4: "ProcScr_SpellAssocWarp",
}
MA_FACINGS = ["MA_FACING_OPPONENT", "MA_FACING_DEFAULT", "MA_FACING_UNK", "MA_FACING_STANDING"]
MCOLORS = ["SPELL_ASSOC_MCOLOR_NORMAL", "SPELL_ASSOC_MCOLOR_DARK", "SPELL_ASSOC_MCOLOR_FIRE",
           "SPELL_ASSOC_MCOLOR_ICE", "SPELL_ASSOC_MCOLOR_WIND", "SPELL_ASSOC_MCOLOR_LIGHT"]


def gen_spellassoc():
    decls = [f"extern CONST_DATA struct ProcCmd {n}[];" for n in SPELL_ASSOC_PROCS.values()]
    out = ['#include "gbafe.h"', '#include "gbafe/spellassoc.h"', "",
           "// Generated by tools/gen_data_tables.py", ""] + extern_block(decls) + [
        "// Map animation / battle effect of each item; terminated by item 0xFFFF",
        "CONST_DATA struct SpellAssoc gSpellAssocData[] = {",
    ]
    for i in range(SPELL_ASSOC_COUNT):
        a = SPELL_ASSOC_TABLE + i * 16
        assert rd8(a + 3) == 0 and rd16(a + 6) == 0 and rd8(a + 15) == 0
        iid = rd16(a)
        efx = struct.unpack_from("<h", ROM, a + 4 - 0x08000000)[0]
        p = rd32(a + 8)
        f = [item(iid) if iid != 0xFFFF else "0xFFFF", str(rd8(a + 2)), str(efx),
             SPELL_ASSOC_PROCS[p] if p else "NULL", ["FALSE", "TRUE"][rd8(a + 12)],
             MA_FACINGS[rd8(a + 13)], MCOLORS[rd8(a + 14)]]
        out.append("    SPELL_ASSOC_DATA(" + ", ".join(f) + "),")
    out.append("};")
    write("spellassoc.c", out)


# --- chapter assets / world map events -------------------------------------------

CHAPTER_ASSET_TABLE, CHAPTER_ASSET_COUNT = 0x08C9C9C8, 247
WM_EVENT_TABLE, WM_EVENT_COUNT = 0x08C9CDA4, 45
CHAPTER_ASSET_FIELDS = [(0x04, "img_a"), (0x05, "img_b"), (0x06, "pal"), (0x07, "tileset"),
                        (0x08, "map"), (0x09, "img_anims"), (0x0A, "pal_anims"),
                        (0x0B, "map_changes"), (0x78, "events")]


def chapter_users(fields):
    chapters = parse_enum("include/constants/chapters.h", "CHAPTER_")
    users = {}
    for i in range(CHAPTER_COUNT):
        a = CHAPTER_TABLE + i * 0x98
        for off, kind in fields:
            idx = rd8(a + off)
            if idx:
                users.setdefault(idx, {}).setdefault(kind, []).append(chapters.get(i, f"0x{i:02X}"))
    return users


def users_comment(u):
    if not u:
        return ""
    return " // " + "; ".join((f"{k}: " if k else "") + f"{', '.join(v)}" for k, v in u.items())


def gen_chapterassets():
    users = chapter_users(CHAPTER_ASSET_FIELDS)
    out = HEADER + [
        "// Map graphics, palettes, tilesets, layouts, tile/palette animations,",
        "// map changes and event data, indexed by ChapterInfo::asset_* and",
        "// ChapterInfo::mapEventDataId.",
        "CONST_DATA void const * gChapterDataAssetTable[] = {",
    ]
    for i in range(CHAPTER_ASSET_COUNT):
        p = rd32(CHAPTER_ASSET_TABLE + 4 * i)
        val = f"(void const *) 0x{p:08X}" if p else "NULL"
        out.append(f"    [0x{i:02X}] = {val},{users_comment(users.get(i))}")
    out.append("};")
    users = chapter_users([(0x79, "")])
    out += ["", "// World map event scripts, indexed by ChapterInfo::gmapEventId",
            "CONST_DATA EventScr const * gWmEventScripts[] = {"]
    for i in range(WM_EVENT_COUNT):
        p = rd32(WM_EVENT_TABLE + 4 * i)
        val = f"(EventScr const *) 0x{p:08X}" if p else "NULL"
        out.append(f"    [0x{i:02X}] = {val},{users_comment(users.get(i))}")
    out.append("};")
    write("chapterassets.c", out)


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    gen_characters()
    gen_classes()
    gen_items()
    gen_terrains()
    gen_itemuse()
    gen_supports()
    gen_itembonus()
    gen_banimconf()
    gen_chapters()
    gen_affinity()
    gen_debugpinfo()
    gen_unit_icon_wait()
    gen_spellassoc()
    gen_chapterassets()


if __name__ == "__main__":
    main()
