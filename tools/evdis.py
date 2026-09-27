#!/usr/bin/env python3
"""Disassemble FE7U chapter event data into data/events/*.s.

Usage: tools/evdis.py [--report] [OUT_DIR]      (default: data/events)

Walks every chapter's ChapterEventGroup (gChapterDataAssetTable
[chapter.mapEventDataId]), the tutorial event lists (gTutorialEventTable)
and the battle/defeat talk tables, and decodes everything reachable:

  * event lists (turn/character/location/misc/tutorial)  -> EvList macros
  * event scripts (gEventCmdTable, one macro per command) -> Evt macros
  * unit definition lists (struct UnitDefinition)        -> UNIT
  * trap lists (struct TrapData), move scripts, scripted battles,
    message arrays, shop lists, tutorial area lists

Each chapter's data goes to OUT_DIR/chXX.s, data reached from more than one
chapter to OUT_DIR/common.s.  Contiguous runs become sections named
.data.ev_<ADDR>; the matching data/layout.txt lines are printed with
--layout (they are what places each run at its original address).

The output is committed; this script only exists to regenerate it.  It
needs a built fe7u.elf for code symbol names (function pointers).
Macros are defined in include/event_macros.inc.
"""
import re
import struct
import subprocess
import sys
from collections import defaultdict
from pathlib import Path

ROM = Path("baserom.gba").read_bytes()


def rd8(a): return ROM[a - 0x08000000]
def rd16(a): return struct.unpack_from("<H", ROM, a - 0x08000000)[0]
def rd32(a): return struct.unpack_from("<I", ROM, a - 0x08000000)[0]
def s16(v): return v - 0x10000 if v & 0x8000 else v
def s8(v): return v - 0x100 if v & 0x80 else v


def isrom(p): return 0x08000000 <= p < 0x09000000


CHAPTER_TABLE = 0x08C9A200      # gChapterDataTable (struct ChapterInfo, 0x98 each)
ASSET_TABLE = 0x08C9C9C8        # gChapterDataAssetTable
EVENT_CMD_TABLE = 0x08B90E48    # gEventCmdTable
TUTORIAL_TABLE = 0x08C9EA2C     # gTutorialEventTable (12 x 4 lists)
BATTLE_TALK_EXT = 0x08C9EDA0    # gBattleTalkExtList
DEFEAT_TALK_EXT = 0x08C9F2EC    # gDefeatTalkExtList
NUM_CHAPTERS = 0x43
NUM_VISIT_GROUPS = 14           # max(CharacterData.visit_group) + 1

CMD_LEN = [rd32(EVENT_CMD_TABLE + 8 * i + 4) for i in range(0xE8)]

# --- constants -------------------------------------------------------------


def parse_names(path, prefix):
    names = {}
    text = Path(path).read_text()
    for m in re.finditer(r"(?:#define\s+|\n\s*)(" + prefix + r"\w+)\s*=?\s*(0x[0-9A-Fa-f]+|\d+)\b(?:[ ,]*(?:/\*\s*(.*?)\s*\*/)?)", text):
        v = int(m.group(2), 0)
        if v not in names:
            names[v] = (m.group(1), m.group(3))
    return names


MSGS = parse_names("include/constants/msg.h", "MSG_")
CHARS = parse_names("include/constants/characters.h", "CHARACTER_")
CLASSES = parse_names("include/constants/classes.h", "CLASS_")
ITEMS = parse_names("include/constants/items.h", "ITEM_")
SONGS = parse_names("include/constants/songs.h", "SONG_")
CHAPTERS = parse_names("include/constants/chapters.h", "CHAPTER_")


def cname(table, v, width=2):
    if v in table and (v != 0 or table is not MSGS):
        return table[v][0]
    return f"0x{v:0{width}X}"


# --- code symbols ------------------------------------------------------------

SYMS = {}       # addr -> name (functions: odd address)
OBJECTS = []    # (addr, size, name) of sized data symbols


def load_symbols():
    try:
        out = subprocess.run(["arm-none-eabi-readelf", "-sW", "fe7u.elf"],
                             capture_output=True, text=True, check=True).stdout
    except (OSError, subprocess.CalledProcessError):
        raise SystemExit("evdis.py: needs a built fe7u.elf (run make first)")
    for line in out.splitlines():
        f = line.split()
        if len(f) < 8 or f[4] != "GLOBAL" or f[6] == "UND":
            continue
        name = f[7]
        a = int(f[1], 16)
        SYMS.setdefault(a, name)
        if f[3] == "OBJECT" and int(f[2]) > 0:
            OBJECTS.append((a, int(f[2]), name))
    for line in open("symbols.ld"):
        m = re.match(r"\s*(\w+)\s*=\s*(0x[0-9A-Fa-f]+)\s*;", line)
        if m:
            SYMS.setdefault(int(m.group(2), 16), m.group(1))


# Event data that code refers to by name (these used to be in symbols.ld).
KNOWN_NAMES = {
    0x08CA749C: "gEvent_GameOver",
    0x08CB8984: "gUnk_08CB8984",
    0x08CB898E: "gUnk_08CB898E",
    0x08CBF3AC: "gUnk_08CBF3AC",
    0x08CDB3C8: "gUnk_08CDB3C8",
    0x08CDB3E8: "gUnk_08CDB3E8",
    0x08CE0898: "gUnk_08CE0898",
    0x08CE08B8: "gUnk_08CE08B8",
    0x08CE08D8: "gUnk_08CE08D8",
    0x08CE08F8: "gUnk_08CE08F8",
    0x08CE0978: "gUnk_08CE0978",
    0x08CE0998: "gUnk_08CE0998",
    0x08CE09B8: "gUnk_08CE09B8",
    0x08CE0B18: "gUnk_08CE0B18",
    0x08CE0B38: "gUnk_08CE0B38",
}

SYMBOLS_LD = dict(KNOWN_NAMES)
for _line in open("symbols.ld"):
    _m = re.match(r"\s*(\w+)\s*=\s*(0x[0-9A-Fa-f]+)\s*;", _line)
    if _m:
        SYMBOLS_LD.setdefault(int(_m.group(2), 16), _m.group(1))

# --- event command specs -----------------------------------------------------
#
# Each command: (name, fields).  Fields are laid out in ROM order after the
# 16-bit command id; together they cover the command's whole length.
# Field = "name:type[:kind][=default]", type one of b sb h sh w.
# Fields with a default go last in the macro's argument list.

CMDS = {
    0x00: ("ENDA", "_hi:h=0"),
    0x01: ("ENDB", "_hi:h=0"),
    0x02: ("STAL", "frames:h"),
    0x03: ("STAL2", "frames:h"),
    0x04: ("STAL3", "frames:h"),
    0x05: ("BACG", "bg:h"),
    0x06: ("BACG_RANDOM", "_hi:h=0"),
    0x07: ("BACG_MORE", "bg:h"),
    0x08: ("BACG_LYNDEATH", "_hi:h=0"),
    0x09: ("CLEAN", "_hi:h=0"),
    0x0A: ("REMA", "_hi:h=0"),
    0x0B: ("REMA_PREP", "_hi:h=0"),
    0x0C: ("FADE_FROM_OPENING", "_hi:h=0"),
    0x0D: ("TEX1", "_hi:h=0 msg:w:msg"),
    0x0E: ("TEX1_OPAQUE", "_hi:h=0 msg:w:msg"),
    0x0F: ("TEX1_BY_MODE", "_hi:h=0 msg:w:msg msg_hector:w:msg"),
    0x10: ("TEX_SETFUNC", "_hi:h=0 arg:w"),
    0x11: ("TEX2", "_hi:h=0 msg:w:msg"),
    0x12: ("TEX2_BY_MODE", "_hi:h=0 msg:w:msg msg_hector:w:msg"),
    0x13: ("TEX_AUTO", "_hi:h=0"),
    0x14: ("TEXTCONT", "_hi:h=0"),
    0x15: ("TEX1_VISIT", "_hi:h=0 msgs:w:msgs"),
    0x16: ("TEX2_VISIT", "_hi:h=0 msgs:w:msgs"),
    0x17: ("TEX1_BY_RANK", "rank:h msgs:w:rankmsgs"),
    0x18: ("TEX1_BY_GENDER", "_hi:h=0 msg_m:w:msg msg_f:w:msg"),
    0x19: ("TEX2_BY_GENDER", "_hi:h=0 msg_m:w:msg msg_f:w:msg"),
    0x1A: ("TEX1_IF_FLAG", "_hi:h=0 flag:w msg_y:w:msg msg_n:w:msg"),
    0x1B: ("TEX2_IF_FLAG", "_hi:h=0 flag:w msg_y:w:msg msg_n:w:msg"),
    0x1C: ("TEX1_IF_ASM", "_hi:h=0 func:w:func msg_y:w:msg msg_n:w:msg"),
    0x1D: ("TEX2_IF_ASM", "_hi:h=0 func:w:func msg_y:w:msg msg_n:w:msg"),
    0x1E: ("TEXTEND", "_hi:h=0"),
    0x1F: ("CAM1_POS", "x:b y:b"),
    0x20: ("CAM1", "pid:h:pid"),
    0x21: ("CAM1_LEADER", "_hi:h=0"),
    0x22: ("CAM2_POS", "x:b y:b"),
    0x23: ("MOVE_POS", "_hi:h=0 x:sh y:sh x_to:sh y_to:sh"),
    0x24: ("MOVE_POS_SPEED", "_hi:h=0 x:sh y:sh x_to:sh y_to:sh speed:w"),
    0x25: ("MOVE_POS_SCR", "_hi:h=0 x:sh y:sh movescr:w:move"),
    0x26: ("MOVE", "_hi:h=0 pid:w:pid x_to:sh y_to:sh"),
    0x27: ("MOVE_SPEED", "_hi:h=0 pid:w:pid x_to:sh y_to:sh speed:w"),
    0x28: ("MOVE_SCR", "_hi:h=0 pid:w:pid movescr:w:move"),
    0x29: ("MOVENEXTTO", "_hi:h=0 pid:w:pid target:w:pid"),
    0x2A: ("MOVE_LEADER", "_hi:h=0 x_to:sh y_to:sh"),
    0x2B: ("MOVE_BLUE_OR_SCR", "_hi:h=0 pid:h:pid speed:h x_to:sh y_to:sh movescr:w:move"),
    0x2C: ("MOVE_SCR_BLUE_OR_SCR", "_hi:h=0 pid:w:pid movescr_blue:w:move movescr:w:move"),
    0x2D: ("MOVE_1STEP", "_hi:h=0 pid:w:pid direction:w"),  # the handler also reads a speed from a 4th word
    0x2E: ("MOVE_POS_INSTANT", "_hi:h=0 x:sh y:sh x_to:sh y_to:sh"),
    0x2F: ("MOVE_INSTANT", "_hi:h=0 pid:w:pid x_to:sh y_to:sh"),
    0x30: ("SAVE_POS", "_hi:h=0 pid:w:pid slot:w"),
    0x31: ("MOVE_SAVED_POS", "_hi:h=0 pid:w:pid slot:w"),
    0x32: ("LOU1", "_hi:h=0 units:w:units"),
    0x33: ("LOU1_ALIVE", "_hi:h=0 units:w:units"),
    0x34: ("LOU1_IF_MODE", "_hi:h=0 mode:h hard:h units:w:units"),
    0x35: ("LOU1_BY_MODE", "_hi:h=0 units:w:units units_hard:w:units units_hector:w:units units_hector_hard:w:units"),
    0x36: ("LOU2", "_hi:h=0 units:w:units"),
    0x37: ("LOU2_IF_MODE", "_hi:h=0 mode:w units:w:units"),
    0x38: ("LOU2_BY_MODE", "_hi:h=0 units:w:units units_hard:w:units units_hector:w:units units_hector_hard:w:units"),
    0x39: ("LOAD_UNIT", "_hi:h=0 pid:h:pid jid:h:jid x:h y:h"),
    0x3A: ("LOU1_WARP", "_hi:h=0 units:w:units"),
    0x3B: ("ENUN", "_hi:h=0"),
    0x3C: ("UNIT_CAM_ON", "_hi:h=0"),
    0x3D: ("UNIT_CAM_OFF", "_hi:h=0"),
    0x3E: ("ASMC", "_hi:h=0 func:w:func"),
    0x3F: ("ASMC2", "_hi:h=0 func:w:func"),
    0x40: ("ASMC3", "_hi:h=0 func:w:func"),
    0x41: ("ASMC_WAIT", "_hi:h=0 func:w:func"),
    0x42: ("ASMC_WAIT2", "_hi:h=0 func:w:func"),
    0x43: ("STOP", "_hi:h=0"),
    0x44: ("LABEL", "_hi:h=0 id:w"),
    0x45: ("GOTO", "_hi:h=0 id:w"),
    0x46: ("IFCA", "_hi:h=0 id:w pid:w:pid"),
    0x47: ("IFCD", "_hi:h=0 id:w pid:w:pid"),
    0x48: ("IFAT", "_hi:h=0 id:w func:w:func"),
    0x49: ("IFAF", "_hi:h=0 id:w func:w:func"),
    0x4A: ("IFSKIP", "_hi:h=0 id:w"),
    0x4B: ("IFTEXTSKIP", "_hi:h=0 id:w"),
    0x4C: ("IFET", "_hi:h=0 id:w flag:w"),
    0x4D: ("IFEF", "_hi:h=0 id:w flag:w"),
    0x4E: ("IFUA", "negate:h id:w pid:w:pid"),
    0x4F: ("IFEM", "_hi:h=0 id:w"),
    0x50: ("IFHM", "_hi:h=0 id:w"),
    0x51: ("IFDIFF", "hard:h id:w"),
    0x52: ("IFYN", "_hi:h=0 id:w"),
    0x53: ("IFYN2", "_hi:h=0 id:w"),
    0x54: ("IFTU", "_hi:h=0 id:w"),
    0x55: ("IFCA_ONCE", "_hi:h=0 id:w pid:w:pid flag:w"),
    0x56: ("IFTURN", "turn:h id:w"),
    0x57: ("IFDEPLOYED", "negate:h id:w pid:w:pid"),
    0x58: ("JUMP", "_hi:h=0 scr:w:script"),
    0x59: ("SKIP_IF_ASM", "count:h func:w:func"),
    0x5A: ("SKIP_IFN_ASM", "count:h func:w:func"),
    0x5B: ("ITGV", "_hi:h=0 item:w:iid"),
    0x5C: ("ITGC", "_hi:h=0 pid:w:pid item:w:iid"),
    0x5D: ("ITGM", "_hi:h=0 item:w:iid"),
    0x5E: ("MONE", "silent:h amount:w"),
    0x5F: ("MNCH_MAP", "id:h"),
    0x60: ("MAC_POS", "x:b y:b"),
    0x61: ("MAC_INSTANT", "id:h"),
    0x62: ("MAC_NORENDER", "id:h"),
    0x63: ("MAP_RERENDER", "arg:h"),
    0x64: ("MAC_WATER", "id:h"),
    0x65: ("CHANGE_FACTION", "_hi:h=0 pid:w:pid faction:w"),
    0x66: ("CURF_POS", "_hi:h=0 x:sh y:sh"),
    0x67: ("CURF", "_hi:h=0 pid:w:pid"),
    0x68: ("CUMO_POS", "_hi:h=0 x:sh y:sh"),
    0x69: ("CURE", "_hi:h=0"),
    0x6A: ("DISA_POS", "_hi:h=0 x:sh y:sh"),
    0x6B: ("DISA", "_hi:h=0 pid:w:pid"),
    0x6C: ("DISA_POS_FADE", "_hi:h=0 x:sh y:sh"),
    0x6D: ("DISA_FADE", "_hi:h=0 pid:w:pid"),
    0x6E: ("HIDE_POS", "_hi:h=0 x:sh y:sh"),
    0x6F: ("HIDE", "_hi:h=0 pid:w:pid"),
    0x70: ("DISABLE_UNIT", "_hi:h=0 pid:w:pid"),
    0x71: ("ENABLE_UNIT", "_hi:h=0 pid:w:pid"),
    0x72: ("UNIT_SET_STATE", "_hi:h=0 pid:w:pid bits:w:hex"),
    0x73: ("UNIT_CLEAR_STATE", "_hi:h=0 pid:w:pid bits:w:hex"),
    0x74: ("CHAI", "_hi:h=0 pid:w:pid ai:w:hex"),
    0x75: ("CHAI_POS", "_hi:h=0 x:sh y:sh ai:w:hex"),
    0x76: ("ENUT", "flag:h"),
    0x77: ("ENUF", "flag:h"),
    0x78: ("MUSC", "song:h:song"),
    0x79: ("MUSS", "song:h:song"),
    0x7A: ("MURE", "speed:h"),
    0x7B: ("MUSC_FADE", "song:h:song speed:w"),
    0x7C: ("MUEN", "speed:h"),
    0x7D: ("MUSI", "_hi:h=0"),
    0x7E: ("MUNO", "_hi:h=0"),
    0x7F: ("SOUN", "song:h:song"),
    0x80: ("MUSC_EXT", "song:h:song mode:w"),
    0x81: ("MNCH", "chapter:h:chapter"),
    0x82: ("COMPLETE_GAME", "_hi:h=0"),
    0x83: ("END_LYN_MODE", "_hi:h=0"),
    0x84: ("LOMA", "_hi:h=0 chapter:w:chapter x:w y:w"),
    0x85: ("LOMA_ID", "chapter:h:chapter"),
    0x86: ("EVBIT_NOSKIP", "_hi:h=0"),
    0x87: ("EVBIT_NOTEXTSKIP", "_hi:h=0"),
    0x88: ("EVBIT_NOTEXTSKIP_SLOW", "_hi:h=0"),
    0x89: ("EVBIT_YESSKIP", "_hi:h=0"),
    0x8A: ("EVBIT_SILENTSKIP", "_hi:h=0"),
    0x8B: ("EVBIT_NOSKIP_NGP", "_hi:h=0"),
    0x8C: ("EVBIT_NOTEXTSKIP_SLOW_NGP", "_hi:h=0"),
    0x8D: ("EVBIT_NOSKIP_SLOW_NGP", "_hi:h=0"),
    0x8E: ("FADI", "speed:h"),
    0x8F: ("FADU", "speed:h"),
    0x90: ("FAWI", "speed:h"),
    0x91: ("FAWU", "speed:h"),
    0x92: ("EXIT_MAP", "_hi:h=0"),
    0x93: ("ENTER_MAP", "_hi:h=0"),
    0x94: ("FADI_LYNDEATH", "arg:h"),
    0x95: ("COLOR_FADE_OUT", "_hi:h=0 a:w:hex b:w c:w:hex"),
    0x96: ("COLOR_FADE_IN", "_hi:h=0 a:w:hex b:w c:w:hex"),
    0x97: ("FIGHT", "_hi:h=0 pid:w:pid target:w:pid battle:w:battle item:h:iid ballista:b noscript:b"),
    0x98: ("NO_RELOAD_GFX", "_hi:h=0"),
    0x99: ("ON_SKIP_ASM", "_hi:h=0 func:w:func"),
    0x9A: ("CLEAR_ON_SKIP_ASM", "_hi:h=0"),
    0x9B: ("WEA1", "weather:h"),
    0x9C: ("WEA2", "weather:h"),
    0x9D: ("VCBF", "vision:h"),
    0x9E: ("VCWF", "vision:h"),
    0x9F: ("BREAK_SEAL", "_hi:h=0 pid:w:pid item:w:iid flag:w"),
    0xA0: ("ENQUEUE_EVENT", "_hi:h=0 arg:w"),
    0xA1: ("IGNORE_KEYS", "_hi:h=0 keys:w:hex"),
    0xA2: ("FIGHT_OVERRIDE", "_hi:h=0 battle:w:battle"),
    0xA3: ("MENU_OVERRIDE_CLEAR", "_hi:h=0"),
    0xA4: ("MENU_OVERRIDE_HIDE", "_hi:h=0 cmd:w:hex"),
    0xA5: ("MENU_OVERRIDE_DISABLE", "_hi:h=0 cmd:w:hex"),
    0xA6: ("MENU_OVERRIDE_ENABLE", "_hi:h=0 cmd:w:hex"),
    0xA7: ("TUTORIAL_TEXT", "_hi:h=0 x:sh y:sh msg:w:msg"),
    0xA8: ("TUTORIAL_TEXT_BY_GENDER", "_hi:h=0 x:sh y:sh msg_m:w:msg msg_f:w:msg"),
    0xA9: ("TUTORIAL_A9", "_hi:h=0"),
    0xAA: ("TUTORIAL_CURSORS_TARGET", "_hi:h=0"),
    0xAB: ("TUTORIAL_CURSORS", "_hi:h=0 area:w:area_pos"),
    0xCB: ("CALL", "_hi:h=0 scr:w:script"),
    0xCC: ("WARP_POS", "_hi:h=0 x:sh y:sh kind:w"),
    0xCD: ("WARP", "_hi:h=0 pid:w:pid kind:w"),
    0xCE: ("WARP_OUT_POS", "_hi:h=0 x:sh y:sh kind:w"),
    0xCF: ("CG_TEXT", "_hi:h=0 msg:w:msg kind:w"),
    0xD0: ("CG_TEXT_EXT", "_hi:h=0 msg:w:msg kind:w flags:w:hex"),
    0xD1: ("CG_TEXT_MORE", "_hi:h=0 msg:w:msg kind:w"),
    0xD2: ("CG_TEXT_END", "_hi:h=0"),
    0xD3: ("CG_BACG", "cg:h"),
    0xD4: ("CG_D4", "_hi:h=0"),
    0xD5: ("PAL_FADE_FROM_BLACK", "speed:h"),
    0xD6: ("PAL_FADE_TO_BLACK", "speed:h"),
    0xD7: ("BROWN_TEXTBOX", "_hi:h=0 msg:w:msg x:sh y:sh"),
    0xD8: ("BROWN_TEXTBOX_END", "_hi:h=0"),
    0xD9: ("BACG_FADE_IN", "_hi:h=0 bg:w flags:w:hex"),
    0xDA: ("BACG_FADE", "_hi:h=0 bg:w flags:w:hex"),
    0xDB: ("BACG_FADE_TO_MAP", "_hi:h=0 speed:w:hex"),
    0xDC: ("SNOWSTORM_FX", "_hi:h=0 arg:w"),
    0xDD: ("THUNDER_FX", "_hi:h=0 x:w:signed y:w:signed"),
    0xDE: ("SCREEN_FLASH_FX", "_hi:h=0 mask:w:hex duration:w speeds:w:hex color:w:hex"),
    0xDF: ("NINIAN_APPEAR_FX", "_hi:h=0 x:w y:w"),
    0xE0: ("FADE_STEPS", "_hi:h=0 mask:w:hex speed:w color:w:hex"),
    0xE1: ("FADE_START", "_hi:h=0"),
    0xE2: ("FADE_END", "_hi:h=0"),
    0xE3: ("SPRITE_ANIM", "_hi:h=0 conf:w:sprconf x:sh y:sh"),
    0xE4: ("SPRITE_ANIM_END", "_hi:h=0"),
    0xE5: ("MIX_PALETTE", "_hi:h=0 pal_a:w:ptr pal_b:w:ptr arg:w:hex"),
    0xE6: ("MIX_PALETTE_END", "_hi:h=0"),
}

TYPE_SIZE = {"b": 1, "sb": 1, "h": 2, "sh": 2, "w": 4}
TYPE_DIR = {"b": ".byte", "sb": ".byte", "h": ".2byte", "sh": ".2byte", "w": ".4byte"}


def parse_fields(spec):
    out = []
    for f in spec.split():
        default = None
        if "=" in f:
            f, default = f.split("=")
        parts = f.split(":")
        name, typ = parts[0], parts[1]
        kind = parts[2] if len(parts) > 2 else ("signed" if typ in ("sh", "sb") else "num")
        out.append((name, typ, kind, default))
    return out


def cmd_spec(cmd):
    if cmd in CMDS:
        name, spec = CMDS[cmd]
    else:
        name = f"EVCMD_{cmd:02X}"
        spec = "_hi:h=0 " + " ".join(f"arg{i}:w:hex" for i in range(1, CMD_LEN[cmd]))
    fields = parse_fields(spec)
    size = 2 + sum(TYPE_SIZE[t] for _, t, _, _ in fields)
    assert size == 4 * CMD_LEN[cmd], (hex(cmd), size, CMD_LEN[cmd])
    return name, fields


def macro_args(fields):
    """Macro argument order: fields without defaults first, in ROM order."""
    return [f for f in fields if f[3] is None] + [f for f in fields if f[3] is not None]


def read_field(addr, typ):
    if typ in ("b", "sb"):
        v = rd8(addr)
        return s8(v) if typ == "sb" else v
    if typ in ("h", "sh"):
        v = rd16(addr)
        return s16(v) if typ == "sh" else v
    return rd32(addr)

# --- item discovery ------------------------------------------------------------


class Item:
    def __init__(self, addr, kind, arg=None):
        self.addr, self.kind, self.arg = addr, kind, arg
        self.size = 0
        self.children = []      # (addr, kind, arg)
        self.owners = set()
        self.name = None
        self.decoded = False
        self.container = None   # script item this one starts inside of
        self.guessed = False    # not referenced by anything (found in a gap)


ITEMS_AT = {}
EVLIST_LEN = [1, 3, 4, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4]
# event list entry: (macro, fields after the 16-bit type)
EVLIST = {
    0x00: ("END_MAIN", "_flag:h=0"),
    0x01: ("AFEV", "flag:h scr:w:script check_flag:h _pad:h=0"),
    0x02: ("TURN", "flag:h scr:w:script turn:b turn_end:b faction:b:faction _b3:b=0 mode:w"),
    0x03: ("CHAR", "flag:h scr:w:script pid:b:pid pid_target:b:pid _pad:h=0 cond:b _b1:b=0 cond_flag:h=0"),
    0x04: ("CHAR_ASM", "flag:h scr:w:script pid:b:pid pid_target:b:pid _pad:h=0 func:w:func"),
    0x05: ("LOCA", "flag:h scr:w:script x:b y:b cmd:b _b3:b=0"),
    0x06: ("VILL", "flag:h scr:w:script x:b y:b cmd:b _b3:b=0"),
    0x07: ("CHES", "flag:h item:h:iid money:h x:b y:b cmd:b _b3:b=0"),
    0x08: ("DOOR", "flag:h scr:w:script x:b y:b cmd:b _b3:b=0"),
    0x09: ("LOCA_09", "flag:h scr:w:script x:b y:b cmd:b _b3:b=0"),
    0x0A: ("SHOP", "flag:h items:w:shop x:b y:b cmd:b _b3:b=0"),
    0x0B: ("AREA", "flag:h scr:w:script x1:b y1:b x2:b y2:b"),
    0x0C: ("AREA_ELIWOOD", "flag:h scr:w:script x1:b y1:b x2:b y2:b"),
    0x0D: ("AREA_HECTOR", "flag:h scr:w:script x1:b y1:b x2:b y2:b"),
    0x0E: ("ASME", "flag:h scr:w:script func:w:func"),
    0x0F: ("TUTORIAL_POS", "flag:h area:w:area scr:w:script check_flag:w"),
    0x10: ("TUTORIAL_AREA", "flag:h area:w:area scr:w:script check_flag:w"),
}


REGION = (0x08CA0540, 0x08CE2000)


# data placed from other sources (C modules) in data/layout.txt
OTHER_DATA = []
for _line in open("data/layout.txt"):
    _f = _line.split()
    if len(_f) == 4 and _f[0] == "rom" and "build/data/events/" not in _f[3]:
        OTHER_DATA.append((int(_f[1], 16), int(_f[1], 16) + int(_f[2], 16)))


def in_region(a):
    return REGION[0] <= a < REGION[1] and not any(s <= a < e for s, e in OTHER_DATA)


def get_item(addr, kind, arg=None):
    it = ITEMS_AT.get(addr)
    if it is not None:
        if it.kind != kind:
            raise SystemExit(f"{addr:#x}: reached as {kind} and as {it.kind}")
        return it, False
    it = Item(addr, kind, arg)
    ITEMS_AT[addr] = it
    return it, True


def decode_fields(addr, fields):
    vals = []
    for name, typ, kind, default in fields:
        vals.append(read_field(addr, typ))
        addr += TYPE_SIZE[typ]
    return vals


PTR_KIND = {"script": "script", "units": "units", "move": "move", "battle": "battle",
            "msgs": "msgs", "rankmsgs": "rankmsgs", "shop": "shop", "area": "area",
            "sprconf": "sprconf", "area_pos": "area_pos"}


def ptr_children(fields, vals, cmd=None):
    out = []
    for (name, typ, kind, default), v in zip(fields, vals):
        if kind in PTR_KIND and isrom(v):
            k = PTR_KIND[kind]
            if k == "area":
                k = "area_pos" if cmd == 0x0F else "area_rect"
            out.append((v, k))
    return out


def decode(it):
    a = it.addr
    k = it.kind
    if k == "group":
        it.size = 0x40
        for i, sub in enumerate(("evlist",) * 4 + ("traps",) * 2 + ("units",) * 8 + ("script",) * 2):
            p = rd32(a + 4 * i)
            if isrom(p):
                it.children.append((p, sub))
    elif k == "evlist":
        p = a
        while True:
            w = rd32(p)
            t = w & 0xFFFF
            if t > 0x10:
                raise SystemExit(f"{a:#x}: bad event list entry {w:#x} at {p:#x}")
            n = EVLIST_LEN[t] * 4
            if w == 0:
                p += 4
                break
            _, spec = EVLIST[t]
            fields = parse_fields(spec)
            vals = decode_fields(p + 2, fields)
            it.children += ptr_children(fields, vals, t)
            p += n
        it.size = p - a
    elif k == "script":
        p = a
        while True:
            w = rd32(p)
            c = w & 0xFFFF
            if c >= 0xE8:
                raise SystemExit(f"{a:#x}: bad event command {w:#x} at {p:#x}")
            _, fields = cmd_spec(c)
            vals = decode_fields(p + 2, fields)
            it.children += ptr_children(fields, vals)
            p += 4 * CMD_LEN[c]
            if w == 0:
                break
        it.size = p - a
    elif k == "units":
        p = a
        while rd8(p) != 0:
            p += 16
        it.size = p + 16 - a
    elif k == "traps":
        p = a
        while rd8(p) != 0:
            p += 6
        it.size = p + 1 - a
    elif k == "move":
        p = a
        while True:
            c = rd8(p)
            p += 1
            if c in (9, 12):
                p += 1
            elif c in (4, 0xFF):
                break
            if p - a > 0x40:
                raise SystemExit(f"{a:#x}: runaway move script")
        it.size = p - a
    elif k == "battle":
        p = a
        while not rd8(p + 2) & 0x80:
            p += 4
        it.size = p + 4 - a
    elif k == "msgs":
        it.size = 4 * NUM_VISIT_GROUPS
    elif k == "rankmsgs":
        it.size = 4 * 3
    elif k == "shop":
        p = a
        while rd16(p) != 0:
            p += 2
        it.size = p + 2 - a
    elif k == "area_pos":
        p = a
        while rd8(p) != 0xFF:
            p += 4
        it.size = p + 4 - a      # the terminator's whole entry
    elif k == "pidmsg":
        p = a
        while rd32(p) != 0:
            p += 8
        it.size = p + 8 - a
    elif k == "pidlist":
        p = a
        while rd16(p) != 0:
            p += 2
        it.size = p + 2 - a
    elif k == "area_rect":
        it.size = 8
    elif k == "sprconf":
        it.size = 0x14
    else:
        raise SystemExit(k)


def discover(roots):
    """roots: list of (addr, kind, owner, name)."""
    work = []
    for addr, kind, owner, name in roots:
        it, new = get_item(addr, kind)
        if name and not it.name:
            it.name = name
        work.append(it)
    while work:
        it = work.pop()
        if it.decoded:
            continue
        it.decoded = True
        decode(it)
        for c, ck in it.children:
            if in_region(c):
                child, new = get_item(c, ck)
                work.append(child)


def script_cmd_starts(it):
    p, out = it.addr, []
    while p < it.addr + it.size:
        out.append(p)
        p += 4 * CMD_LEN[rd32(p) & 0xFFFF]
    return out


def resolve_overlaps():
    """A script that starts inside another script is a label inside it."""
    items = sorted((i for i in ITEMS_AT.values() if not i.container), key=lambda i: i.addr)
    prev = None
    for it in items:
        if prev and it.addr < prev.addr + prev.size:
            if (prev.kind == it.kind == "script" and it.addr + it.size == prev.addr + prev.size
                    and it.addr in script_cmd_starts(prev)):
                it.container = prev
                continue
            raise SystemExit(f"overlap {prev.kind}@{prev.addr:#x}+{prev.size:#x} / {it.kind}@{it.addr:#x}+{it.size:#x}")
        prev = it


def try_scripts(s, e):
    """Decode [s, e) as consecutive complete scripts; return their starts."""
    starts, p = [], s
    while p < e:
        starts.append(p)
        while True:
            if p >= e:
                return None
            w = rd32(p)
            c = w & 0xFFFF
            if c >= 0xE8:
                return None
            p += 4 * CMD_LEN[c]
            if w == 0:
                break
    return starts if p == e else None


def try_units(s, e):
    if (e - s) % 16 or rd8(e - 16) != 0 or any(ROM[e - 16 - 0x08000000:e - 0x08000000]):
        return None
    for p in range(s, e - 16, 16):
        if rd8(p) == 0:
            return None
    return [s]


def try_battle(s, e):
    p = s
    while p < e:
        if rd8(p + 2) & 0x80:
            return [s] if p + 4 == e else None
        p += 4
    return None


def move_end(p, limit):
    a = p
    while p < limit and p - a <= 0x40:
        c = rd8(p)
        p += 1
        if c in (9, 12):
            p += 1
        elif c in (4, 0xFF):
            return p
        elif c > 14:
            return None
    return None


def try_moves(s, e):
    starts, p = [], s
    while p < e:
        if e - p < 4 and e % 4 == 0 and not any(ROM[p - 0x08000000:e - 0x08000000]):
            break       # alignment padding
        q = move_end(p, e)
        if q is None:
            return None
        starts.append(p)
        p = q
    return starts or None


def gaps():
    items = sorted((i for i in ITEMS_AT.values() if not i.container), key=lambda i: i.addr)
    for a, b in zip(items, items[1:]):
        end = a.addr + a.size
        if b.addr > end:
            yield a, b, end, b.addr


def fill_gaps():
    """Unreferenced scripts/unit lists between referenced items."""
    while True:
        new = []
        for a, b, s, e in gaps():
            if any(s <= x < e for x in SYMBOLS_LD) or any(s < oe and os < e for os, oe in OTHER_DATA):
                continue
            t = s
            while t < e and t % 4 and rd8(t) == 0:
                t += 1
            if t >= e or not any(ROM[t - 0x08000000:e - 0x08000000]):
                continue
            for kind, fn in (("script", try_scripts), ("units", try_units),
                             ("battle", try_battle), ("move", try_moves)):
                if kind == "move":
                    starts = fn(s, e)
                elif t % 4:
                    continue
                else:
                    starts = fn(t, e)
                if starts:
                    for st in starts:
                        it, _ = get_item(st, kind)
                        it.guessed = True
                        it.owners_hint = a
                        new.append((st, kind, None, None))
                    break
        if not new:
            return
        discover(new)
        resolve_overlaps()


def propagate(roots):
    for addr, kind, owner, name in roots:
        stack = [ITEMS_AT[addr]]
        while stack:
            it = stack.pop()
            if owner in it.owners:
                continue
            it.owners.add(owner)
            for c, ck in it.children:
                if c in ITEMS_AT:
                    stack.append(ITEMS_AT[c])


def chapter_group(ch):
    eid = rd8(CHAPTER_TABLE + ch * 0x98 + 0x78)
    return rd32(ASSET_TABLE + 4 * eid)


GROUP_SLOTS = ["EvList_{}_Turn", "EvList_{}_Character", "EvList_{}_Location", "EvList_{}_Misc",
               "Traps_{}", "Traps_{}_Hector",
               "Units_{}_Initial", "Units_{}_InitialHard", "Units_{}_InitialHector", "Units_{}_InitialHectorHard",
               "Units_{}_Player", "Units_{}_PlayerHard", "Units_{}_PlayerHector", "Units_{}_PlayerHectorHard",
               "EventScr_{}_Beginning", "EventScr_{}_Ending"]


def collect_roots():
    roots = []
    for ch in range(NUM_CHAPTERS):
        g = chapter_group(ch)
        if not isrom(g):
            continue
        tag = f"Ch{ch:02X}"
        roots.append((g, "group", ch, f"ChapterEvents_{tag}"))
        for i, fmt in enumerate(GROUP_SLOTS):
            p = rd32(g + 4 * i)
            if isrom(p):
                kind = ("evlist",) * 4 + ("traps",) * 2 + ("units",) * 8 + ("script",) * 2
                roots.append((p, kind[i], ch, fmt.format(tag)))
    for ch in range(12):
        for i, n in enumerate("ABCD"):
            p = rd32(TUTORIAL_TABLE + 16 * ch + 4 * i)
            if isrom(p):
                roots.append((p, "evlist", ch, f"EvList_Ch{ch:02X}_Tutorial{n}"))
    # used by code (eventcall_0807CEC8.c)
    roots.append((0x08CB8984, "pidlist", 0x22, "gUnk_08CB8984"))
    roots.append((0x08CB898E, "pidlist", 0x22, "gUnk_08CB898E"))
    roots.append((0x08CBF3AC, "pidmsg", 0x2E, "gUnk_08CBF3AC"))   # eventcall_0807D9E4.c
    # battle / defeat talks with events
    for base, esz, choff, evoff in ((BATTLE_TALK_EXT, 16, 2, 8), (DEFEAT_TALK_EXT, 16, 1, 8)):
        p = base
        while rd8(p + (1 if base == BATTLE_TALK_EXT else 0)) != 0:
            ev = rd32(p + evoff)
            ch = rd8(p + choff)
            if isrom(ev):
                roots.append((ev, "script", ch if ch < NUM_CHAPTERS else "common", None))
            p += esz
    return roots


def main():
    roots = collect_roots()
    discover(roots)
    resolve_overlaps()
    fill_gaps()
    propagate(roots)
    # unreferenced items belong with the item before them
    for it in sorted(ITEMS_AT.values(), key=lambda i: i.addr):
        if not it.owners and it.guessed:
            prev = max((i for i in ITEMS_AT.values() if i.addr < it.addr and i.owners),
                       key=lambda i: i.addr)
            propagate([(it.addr, it.kind, next(iter(prev.owners)) if len(prev.owners) == 1 else "common", None)])
    for it in sorted(ITEMS_AT.values(), key=lambda i: i.addr):
        if not it.owners:
            it.owners = {"common"}
    if "--report" in sys.argv:
        report()
        return
    load_symbols()
    emit(Path([a for a in sys.argv[1:] if not a.startswith("--")][0]
              if [a for a in sys.argv[1:] if not a.startswith("--")] else "data/events"))


def owner_file(it):
    if it.kind in ("traps", "shop"):
        return {"traps": "traps", "shop": "shops"}[it.kind]
    if len(it.owners) == 1:
        o = next(iter(it.owners))
        if o != "common":
            return f"ch{o:02X}"
    return "common"


def report():
    items = sorted((i for i in ITEMS_AT.values() if not i.container), key=lambda i: i.addr)
    for a, n in sorted(SYMBOLS_LD.items()):
        for i in items:
            if i.addr <= a < i.addr + i.size:
                print(f"symbols.ld {n} {a:#x}: in {i.kind}@{i.addr:#x}+{i.size:#x} guessed={i.guessed}")
    total = sum(i.size for i in items)
    print(f"{len(items)} items, {total:#x} bytes")
    prev = None
    overl = 0
    for it in items:
        if prev and it.addr < prev.addr + prev.size:
            print(f"overlap {prev.kind}@{prev.addr:#x}+{prev.size:#x} / {it.kind}@{it.addr:#x}")
            overl += 1
        if prev and it.addr > prev.addr + prev.size:
            gap = it.addr - (prev.addr + prev.size)
            print(f"gap {prev.addr + prev.size:#x}..{it.addr:#x} ({gap:#x}) after {prev.kind} {owner_file(prev)} before {it.kind} {owner_file(it)}")
        prev = it


# --- emission ------------------------------------------------------------------

DEFAULT_PREFIX = {"script": "EventScr", "evlist": "EvList", "units": "Units", "traps": "Traps",
                  "move": "MoveScr", "battle": "BattleScr", "msgs": "MsgList", "rankmsgs": "MsgList",
                  "shop": "ShopList", "area_pos": "AreaList", "area_rect": "AreaList",
                  "sprconf": "SpriteAnimConf", "pidlist": "PidList", "pidmsg": "PidMsgList",
                  "group": "ChapterEvents"}

MV_NAMES = ["MV_LEFT", "MV_RIGHT", "MV_DOWN", "MV_UP", "MV_HALT", "MV_FACE_LEFT", "MV_FACE_RIGHT",
            "MV_FACE_DOWN", "MV_FACE_UP", "MV_SLEEP", "MV_BUMP", "MV_UNK11", "MV_SPEED",
            "MV_CAM_ON", "MV_CAM_OFF"]


def assign_names():
    for it in ITEMS_AT.values():
        if it.addr in SYMBOLS_LD:
            it.name = SYMBOLS_LD[it.addr]
        elif not it.name:
            it.name = f"{DEFAULT_PREFIX[it.kind]}_{it.addr:08X}"
    names = defaultdict(list)
    for it in ITEMS_AT.values():
        names[it.name].append(it)
    for n, its in names.items():
        assert len(its) == 1, n


EMITTED = []    # top-level items, sorted by address


def find_item(v):
    it = ITEMS_AT.get(v)
    if it is not None:
        return it.name
    for it in EMITTED:
        if it.addr < v < it.addr + it.size:
            return f"{it.name}+0x{v - it.addr:X}"
    return None


def fmt_ptr(v):
    if v == 0:
        return "0"
    if not isrom(v):
        return f"0x{v:X}"
    n = find_item(v)
    if n:
        return n
    if v in SYMS:
        return SYMS[v]
    if v & 1 and v - 1 in SYMS:
        return SYMS[v - 1] + "+1"
    for a, size, name in OBJECTS:
        if a < v < a + size:
            return f"{name}+0x{v - a:X}"
    return f"0x{v:08X}"


def fmt_val(v, kind, typ, notes):
    if kind == "msg":
        if v in MSGS and v != 0:
            name, text = MSGS[v]
            if text:
                notes.append(text)
            return name
        return f"0x{v:X}"
    if kind == "pid":
        return cname(CHARS, v)
    if kind == "jid":
        return cname(CLASSES, v)
    if kind == "iid":
        return cname(ITEMS, v)
    if kind == "song":
        return cname(SONGS, v)
    if kind == "chapter":
        return cname(CHAPTERS, v)
    if kind == "script" and v == 1:
        return "EVENT_NOSCRIPT"
    if kind in PTR_KIND or kind in ("func", "ptr"):
        return fmt_ptr(v)
    if kind == "faction" and v in (0, 0x40, 0x80):
        return {0: "FACTION_BLUE", 0x40: "FACTION_GREEN", 0x80: "FACTION_RED"}[v]
    if kind == "hex":
        return f"0x{v:X}"
    if kind == "signed":
        if typ == "w":
            v = v - (1 << 32) if v & 0x80000000 else v
        return str(v)
    return str(v) if v < 10 else f"0x{v:X}"


def fmt_macro(name, fields, vals, notes):
    byname = {f[0]: (f, v) for f, v in zip(fields, vals)}
    args = []
    for f in macro_args(fields):
        (fname, typ, kind, default), v = byname[f[0]]
        args.append((fmt_val(v, kind, typ, notes), default is not None and v == int(default, 0)))
    while args and args[-1][1]:
        args.pop()
    return name + ("" if not args else " " + ", ".join(a for a, _ in args))


def comment(line, notes):
    if notes:
        line = line.ljust(40) + " @ " + " / ".join(notes)
    return "\t" + line


GROUP_SLOT_DESC = ["turn", "character", "location", "misc", "traps", "traps (Hector mode)",
                   "units loaded at start", "(hard)", "(Hector mode)", "(Hector mode, hard)",
                   "player units", "(hard)", "(Hector mode)", "(Hector mode, hard)",
                   "beginning scene", "ending scene"]


def emit_item(it, labels):
    a, k = it.addr, it.kind
    out = []
    if k == "group":
        for i, sl in enumerate(GROUP_SLOT_DESC):
            out.append(f"\t.4byte {fmt_ptr(rd32(a + 4 * i))}".ljust(41) + f" @ {sl}")
    elif k == "evlist":
        p = a
        while True:
            w = rd32(p)
            t = w & 0xFFFF
            if w == 0:
                out.append("\tEVLIST_END")
                break
            name, spec = EVLIST[t]
            fields = parse_fields(spec)
            vals = decode_fields(p + 2, fields)
            notes = []
            out.append(comment(fmt_macro(name, fields, vals, notes), notes))
            p += EVLIST_LEN[t] * 4
    elif k == "script":
        p = a
        while p < a + it.size:
            if p != a and p in labels:
                out.append(f"{labels[p]}:")
            w = rd32(p)
            c = w & 0xFFFF
            name, fields = cmd_spec(c)
            vals = decode_fields(p + 2, fields)
            notes = []
            out.append(comment(fmt_macro(name, fields, vals, notes), notes))
            p += 4 * CMD_LEN[c]
    elif k == "units":
        p = a
        while rd8(p):
            b3 = rd8(p + 3)
            vals = [cname(CHARS, rd8(p)), cname(CLASSES, rd8(p + 1)), cname(CHARS, rd8(p + 2)),
                    str(b3 >> 3), FACTION_NAMES[(b3 >> 1) & 3], str(b3 & 1),
                    str(rd8(p + 4)), str(rd8(p + 5)), str(rd8(p + 6)), str(rd8(p + 7))]
            items = [cname(ITEMS, rd8(p + 8 + i)) for i in range(4)]
            ai = [f"0x{rd8(p + 12 + i):X}" for i in range(4)]
            tail = items + ai
            while tail and tail[-1] in ("ITEM_NONE", "0x0"):
                tail.pop()
            out.append("\tUNIT " + ", ".join(vals + tail))
            p += 16
        out.append("\tUNIT_END")
    elif k == "traps":
        p = a
        while rd8(p):
            out.append("\tTRAP " + ", ".join(str(rd8(p + i)) for i in range(6)))
            p += 6
        out.append("\tTRAP_END")
    elif k == "move":
        bs, p = [], a
        while p < a + it.size:
            c = rd8(p)
            p += 1
            if c == 0xFF:
                bs.append("MV_END")
            else:
                bs.append(MV_NAMES[c])
                if c in (9, 12):
                    bs.append(f"0x{rd8(p):X}")
                    p += 1
        out.append("\t.byte " + ", ".join(bs))
    elif k == "battle":
        for p in range(a, a + it.size, 4):
            out.append(f"\tBATTLE_HIT 0x{rd16(p):X}, 0x{rd8(p + 2):X}, {rd8(p + 3)}")
    elif k in ("msgs", "rankmsgs"):
        for p in range(a, a + it.size, 4):
            notes = []
            out.append(comment(".4byte " + fmt_val(rd32(p), "msg", "w", notes), notes))
    elif k == "shop":
        vals = [cname(ITEMS, rd16(p)) for p in range(a, a + it.size, 2)]
        out.append("\t.2byte " + ", ".join(vals))
    elif k == "pidlist":
        vals = [cname(CHARS, rd16(p)) for p in range(a, a + it.size, 2)]
        out.append("\t.2byte " + ", ".join(vals))
    elif k == "pidmsg":
        for p in range(a, a + it.size, 8):
            notes = []
            v = rd32(p + 4)
            out.append(comment(f".4byte {cname(CHARS, rd32(p))}, " + (fmt_val(v, "msg", "w", notes) if v else "0"), notes))
    elif k in ("area_pos", "area_rect"):
        for p in range(a, a + it.size, 4):
            out.append("\t.byte " + ", ".join(str(rd8(p + i)) for i in range(4)))
    elif k == "sprconf":
        out.append(f"\t.4byte {fmt_ptr(rd32(a))}, {fmt_ptr(rd32(a + 4))}, {fmt_ptr(rd32(a + 8))}")
        out.append(f"\t.2byte 0x{rd16(a + 12):X}, 0x{rd16(a + 14):X}")
        out.append(f"\t.byte {rd8(a + 16)}, {rd8(a + 17)}, {rd8(a + 18)}, {rd8(a + 19)}")
    else:
        raise SystemExit(k)
    return out


FACTION_NAMES = ["FACTION_ID_BLUE", "FACTION_ID_GREEN", "FACTION_ID_RED", "FACTION_ID_PURPLE"]


def chapter_title(ch):
    m = re.search(r"CHAPTER_%02X = 0x%02X, // (.*)" % (ch, ch), Path("include/constants/chapters.h").read_text())
    return m.group(1) if m else None


def zero(a, b): return not any(ROM[a - 0x08000000:b - 0x08000000])


def make_runs():
    """Consecutive items of one file form a run; short zero padding joins the run before it."""
    runs = []
    for it in EMITTED:
        f = owner_file(it)
        if runs:
            r = runs[-1]
            gap = it.addr - r["end"]
            padding = 0 < gap < 16 and zero(r["end"], it.addr)
            if r["file"] == f and (gap == 0 or padding):
                if gap:
                    r["parts"].append(("pad", gap))
                r["parts"].append(("item", it))
                r["end"] = it.addr + it.size
                continue
            if padding:
                r["parts"].append(("pad", gap))
                r["end"] = it.addr
        runs.append({"file": f, "start": it.addr, "end": it.addr + it.size, "parts": [("item", it)]})
    return runs


def emit(out):
    global EMITTED
    assign_names()
    EMITTED = sorted((i for i in ITEMS_AT.values() if not i.container), key=lambda i: i.addr)
    inner = defaultdict(dict)
    for it in ITEMS_AT.values():
        if it.container:
            inner[it.container.addr][it.addr] = it.name
    runs = make_runs()
    files = defaultdict(list)
    for r in runs:
        files[r["file"]].append(r)
    out.mkdir(parents=True, exist_ok=True)
    layout = []
    for f, rs in sorted(files.items()):
        if f == "common":
            head = "Event data shared by several chapters"
        elif f == "traps":
            head = "Trap lists (ChapterEventGroup traps; struct TrapData)"
        elif f == "shops":
            head = "Shop item lists (SHOP location events)"
        else:
            ch = int(f[2:], 16)
            head = f"Chapter 0x{ch:02X}" + (f": {chapter_title(ch)}" if chapter_title(ch) else "")
        lines = [f"@ {head}", "@ Generated by tools/evdis.py", "",
                 '#include "event_macros.inc"', ""]
        for r in rs:
            lines.append(f'\t.section .rodata.ev_{r["start"]:08X}, "a"')
            lines.append("")
            for kind, x in r["parts"]:
                if kind == "pad":
                    lines.append(f"\t.fill {x}, 1, 0")
                    lines.append("")
                    continue
                labels = inner.get(x.addr, {})
                for la in [x.name] + sorted(labels.values()):
                    lines.append(f"\t.global {la}")
                lines.append(f"{x.name}:" + ("\t@ unreferenced" if x.guessed else ""))
                lines += emit_item(x, labels)
                lines.append("")
            layout.append(f'rom 0x{r["start"]:08X} 0x{r["end"] - r["start"]:X} '
                          f'build/data/events/{f}.o(.rodata.ev_{r["start"]:08X})')
        (out / f"{f}.s").write_text("\n".join(lines))
    if "--layout" in sys.argv:
        print("\n".join(layout))
    total = sum(r["end"] - r["start"] for r in runs)
    print(f"{len(files)} files, {len(runs)} sections, {total:#x} bytes", file=sys.stderr)
    write_macros(Path("include/event_macros.inc"))


def macro_def(name, cmd_id, fields, lines, doc=None):
    args = macro_args(fields)
    params = ", ".join(f[0] + ("" if f[3] is None else f"={f[3]}") for f in args)
    if doc:
        lines.append(f"@ {doc}")
    lines.append(f".macro {name}" + (f" {params}" if params else ""))
    lines.append(f"\t.2byte 0x{cmd_id:02X}")
    for fname, typ, kind, default in fields:
        lines.append(f"\t{TYPE_DIR[typ]} \\{fname}")
    lines.append(".endm")
    lines.append("")


def write_macros(path):
    handlers = {}
    try:
        out = subprocess.run(["arm-none-eabi-readelf", "-sW", "fe7u.elf"],
                             capture_output=True, text=True, check=True).stdout
        funcs = {}
        for line in out.splitlines():
            f = line.split()
            if len(f) >= 8 and f[3] == "FUNC":
                funcs.setdefault(int(f[1], 16), f[7])
        for i in range(0xE8):
            handlers[i] = funcs.get(rd32(EVENT_CMD_TABLE + 8 * i), "?")
    except (OSError, subprocess.CalledProcessError):
        pass
    lines = [MACROS_HEADER]
    lines.append("@ --- event scripts (gEventCmdTable; command id, then fields) ---\n")
    for c in range(0xE8):
        name, fields = cmd_spec(c)
        macro_def(name, c, fields, lines, f"0x{c:02X} {handlers.get(c, '')} ({CMD_LEN[c]} words)")
    lines.append("@ --- event lists (gEventListCmdInfoTable; terminated by EVLIST_END) ---\n")
    lines.append(".macro EVLIST_END\n\t.4byte 0\n.endm\n")
    for t in range(1, 0x11):
        name, spec = EVLIST[t]
        macro_def(name, t, parse_fields(spec), lines, f"event list entry 0x{t:02X} ({EVLIST_LEN[t]} words)")
    lines.append(MACROS_FOOTER)
    path.write_text("\n".join(lines))


MACROS_HEADER = """@ FE7U event script macros.  Generated by tools/evdis.py (edit the specs there).
@
@ Event scripts are arrays of words: the low 16 bits of a command's first
@ word are its id (index into gEventCmdTable, which also gives its length in
@ words), the high 16 bits its first argument.  Names follow the FE7 Event
@ Assembler / fireemblem8u (EAstdlib) where a command corresponds; the rest
@ are named after their handler (listed with each macro).  Arguments with a
@ default (like _hi, the unused high half of the first word) go last.

#include "constants/msg.h"
#include "constants/characters.inc"
#include "constants/classes.inc"
#include "constants/items.inc"
#include "constants/songs.inc"
#include "constants/chapters.inc"

#define EVENT_NOSCRIPT 1

#define FACTION_BLUE  0x00
#define FACTION_GREEN 0x40
#define FACTION_RED   0x80

#define FACTION_ID_BLUE   0
#define FACTION_ID_GREEN  1
#define FACTION_ID_RED    2
#define FACTION_ID_PURPLE 3

@ move script commands (struct MuProc move scripts; MOVE_CMD_* in mu.h)
#define MV_END        0xFF
#define MV_LEFT       0
#define MV_RIGHT      1
#define MV_DOWN       2
#define MV_UP         3
#define MV_HALT       4
#define MV_FACE_LEFT  5
#define MV_FACE_RIGHT 6
#define MV_FACE_DOWN  7
#define MV_FACE_UP    8
#define MV_SLEEP      9
#define MV_BUMP       10
#define MV_UNK11      11
#define MV_SPEED      12
#define MV_CAM_ON     13
#define MV_CAM_OFF    14
"""

MACROS_FOOTER = """@ --- other event data ---

@ struct UnitDefinition; terminated by UNIT_END
.macro UNIT pid, jid, lead, level, faction, autolevel, x, y, x_move, y_move, item1=0, item2=0, item3=0, item4=0, ai1=0, ai2=0, ai3=0, ai4=0
	.byte \\pid, \\jid, \\lead, (\\autolevel) | ((\\faction) << 1) | ((\\level) << 3)
	.byte \\x, \\y, \\x_move, \\y_move
	.byte \\item1, \\item2, \\item3, \\item4
	.byte \\ai1, \\ai2, \\ai3, \\ai4
.endm

.macro UNIT_END
	.fill 16, 1, 0
.endm

@ struct TrapData (6 bytes); a list ends with a single 0 byte
.macro TRAP type, x, y, subtype, turn_counter, turn
	.byte \\type, \\x, \\y, \\subtype, \\turn_counter, \\turn
.endm

.macro TRAP_END
	.byte 0
.endm

@ struct BattleHit for scripted battles (FIGHT); the last hit has info bit 7 set
.macro BATTLE_HIT attributes, info, hp_change
	.2byte \\attributes
	.byte \\info, \\hp_change
.endm
"""


if __name__ == "__main__":
    main()
