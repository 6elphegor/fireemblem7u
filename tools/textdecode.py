#!/usr/bin/env python3
"""Extract the game's Huffman-compressed messages from baserom.gba.

Usage: tools/textdecode.py [baserom.gba]

Writes
  texts/texts.txt       every message, one "## MSG_XXX" block each
  texts/textdefs.txt    "[Tag] = byte, byte..." names for control codes

Format of texts.txt: each message is a "## MSG_XXX" line (ids in order)
followed by its text up to and including [X] (the terminator).  Printable
ASCII is literal, control codes are [Tag]s from textdefs.txt, any byte can
be written [0xNN].  Line breaks in the file are ignored (one is written
after each [LF] for readability).

tools/textencode.py turns texts/ back into the original ROM bytes (the
build does this; `make msgheader` regenerates include/constants/msg.h).
This script only has to be run again if the format changes: texts/ is the
source of truth.
"""
import re
import struct
import sys
from pathlib import Path

ROM_BASE = 0x08000000
MSG_HUFF_TABLE = 0x08B7D71C       # gMsgHuffmanTable: tree nodes
MSG_HUFF_ROOT = 0x08B808A8        # gMsgHuffmanTableRoot: -> root node
MSG_TABLE = 0x08B808AC            # gMsgTable: one pointer per message
MSG_COUNT = 0x133E
CHARACTER_DATA = 0x08BDCE4C       # gCharacterData (0x34 bytes per entry)
CHARACTER_COUNT = 0xFD

# Control codes (names follow fireemblem8u's texts/textdefs.txt).
CONTROL = {
    (0x00,): "X",
    (0x01,): "LF",
    (0x02,): "CR",
    (0x03,): "A",
    (0x04,): "....",
    (0x05,): ".....",
    (0x06,): "......",
    (0x07,): ".......",
    (0x08,): "OpenFarLeft",
    (0x09,): "OpenMidLeft",
    (0x0A,): "OpenLeft",
    (0x0B,): "OpenRight",
    (0x0C,): "OpenMidRight",
    (0x0D,): "OpenFarRight",
    (0x0E,): "OpenFarFarLeft",
    (0x0F,): "OpenFarFarRight",
    (0x10,): "LoadFace",
    (0x11,): "ClearFace",
    (0x12,): "NormalPrint",
    (0x13,): "FastPrint",
    (0x14,): "CloseSpeechFast",
    (0x15,): "CloseSpeechSlow",
    (0x16,): "ToggleMouthMove",
    (0x17,): "ToggleSmile",
    (0x18,): "Yes",
    (0x19,): "No",
    (0x1A,): "BuySell",
    (0x1B,): "ShopContinue",
    (0x1C,): "SendToBack",
    (0x1F,): ".",
    (0x7F,): "DashedLine",
    (0x80, 0x04): "BreakTalk",
    (0x80, 0x05): "G",
    (0x80, 0x06): "Unknown8006",
    (0x80, 0x0A): "MoveFarLeft",
    (0x80, 0x0B): "MoveMidLeft",
    (0x80, 0x0C): "MoveLeft",
    (0x80, 0x0D): "MoveRight",
    (0x80, 0x0E): "MoveMidRight",
    (0x80, 0x0F): "MoveFarRight",
    (0x80, 0x10): "MoveFarFarLeft",
    (0x80, 0x11): "MoveFarFarRight",
    (0x80, 0x16): "EnableBlinking",
    (0x80, 0x17): "Unknown8017",
    (0x80, 0x18): "DelayBlinking",
    (0x80, 0x19): "PauseBlinking",
    (0x80, 0x1A): "Unknown801A",
    (0x80, 0x1B): "DisableBlinking",
    (0x80, 0x1C): "OpenEyes",
    (0x80, 0x1D): "CloseEyes",
    (0x80, 0x1E): "HalfCloseEyes",
    (0x80, 0x1F): "Wink",
    (0x80, 0x20): "Tact",
    (0x80, 0x21): "ToggleRed",
    (0x80, 0x22): "Item",
    (0x80, 0x23): "SetName",
    (0x80, 0x24): "Unknown8024",
    (0x80, 0x25): "ToggleColorInvert",
}
# Tags followed by a line break in texts.txt (the break itself is ignored).
NEWLINE_AFTER = {"LF"}


def main():
    rom = Path(sys.argv[1] if len(sys.argv) > 1 else "baserom.gba").read_bytes()

    def u16(a):
        return struct.unpack_from("<H", rom, a - ROM_BASE)[0]

    def u32(a):
        return struct.unpack_from("<I", rom, a - ROM_BASE)[0]

    root = u32(MSG_HUFF_ROOT)

    def decode(addr):
        out = bytearray()
        byte = nbits = 0
        while True:
            node = root
            while True:
                if nbits == 0:
                    byte, nbits = rom[addr - ROM_BASE], 8
                    addr += 1
                bit, byte, nbits = byte & 1, byte >> 1, nbits - 1
                node = MSG_HUFF_TABLE + 4 * u16(node + 2 * bit)
                value = u32(node)
                if value & 0x80000000:
                    break
            if value & 0xFF00:
                out += struct.pack("<H", value & 0xFFFF)
            else:
                out.append(value & 0xFF)
                if value & 0xFF == 0:
                    return bytes(out)

    msgs = [decode(u32(MSG_TABLE + 4 * i)) for i in range(MSG_COUNT)]

    # Portrait names for [LoadFace] arguments, from the character table.
    faces = {0xFFFF: "FID_Active"}
    for i in range(CHARACTER_COUNT):
        ent = CHARACTER_DATA + 0x34 * i
        name_id, fid = u16(ent), u16(ent + 6) + 0x100
        if fid == 0x100 or fid in faces or not 0 < name_id < MSG_COUNT:
            continue
        name = re.sub(r"[^A-Za-z0-9]", "", msgs[name_id].decode("latin-1"))
        if name:
            faces[fid] = f"FID_{name}"
    used = set()
    for m in msgs:
        for i in range(len(m) - 2):
            if m[i] == 0x10 and (i == 0 or m[i - 1] != 0x80):
                used.add(m[i + 1] | m[i + 2] << 8)
    counts = {}
    for n in faces.values():
        counts[n] = counts.get(n, 0) + 1
    for fid in sorted(faces):
        if counts[faces[fid]] > 1:
            faces[fid] += f"_{fid & 0xFF:02X}"
    for fid in used - faces.keys():
        faces[fid] = f"FID_{fid & 0xFF:02X}"
    fid_tags = {fid: n for fid, n in faces.items() if fid in used}

    Path("texts").mkdir(exist_ok=True)
    defs = ["# Tag definitions for texts/*.txt: [Name] = byte, byte, ...\n",
            "# [0xNN] is always accepted for a raw byte.\n\n"]
    for seq, name in CONTROL.items():
        defs.append(f"[{name}] = {', '.join(f'0x{b:02X}' for b in seq)}\n")
    defs.append("\n# [LoadFace] arguments (portrait id + 0x100, little endian)\n")
    for fid in sorted(fid_tags):
        defs.append(f"[{fid_tags[fid]}] = 0x{fid & 0xFF:02X}, 0x{fid >> 8:02X}\n")
    Path("texts/textdefs.txt").write_text("".join(defs))

    out = []
    for n, m in enumerate(msgs):
        out.append(f"## MSG_{n:03X}\n{render(m, fid_tags)}\n\n")
    Path("texts/texts.txt").write_text("".join(out))



def render(m, fid_tags):
    s = []
    i = 0
    while i < len(m):
        b = m[i]
        if b == 0x80:
            name = CONTROL.get((b, m[i + 1]))
            s.append(f"[{name}]" if name else f"[0x80][0x{m[i + 1]:02X}]")
            i += 2
            continue
        if b == 0x10:
            fid = m[i + 1] | m[i + 2] << 8
            s.append(f"[LoadFace][{fid_tags[fid]}]")
            i += 3
            continue
        name = CONTROL.get((b,))
        if name:
            s.append(f"[{name}]" + ("\n" if name in NEWLINE_AFTER else ""))
        elif 0x20 <= b < 0x7F and chr(b) not in "[]":
            s.append(chr(b))
        else:
            s.append(f"[0x{b:02X}]")
        i += 1
    return "".join(s)


if __name__ == "__main__":
    main()
