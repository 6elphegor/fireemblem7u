#!/usr/bin/env python3
"""Build the compressed message data from texts/.

Usage: tools/textencode.py texts/texts.txt texts/textdefs.txt OUT.s [--table OUT.c] [--header OUT.h]

Emits, in ROM order:
  OUT.s   the Huffman bitstream of every message (a global label each) and
          gMsgHuffmanTable (the tree): bytes and numbers, no pointers;
  OUT.c   (default msg_table.c beside OUT.s) gMsgHuffmanTableRoot and
          gMsgTable, the pointers, as C.
The sections are named .rodata.ord.N so that the build can link both objects
into one build/msg_data.o (`ld -r`, tools/ordered.ld) in that order.

The Huffman code is rebuilt from the texts' symbol frequencies exactly the
way the original tool did it, so unmodified texts give the original bytes:

* Symbols: the message's bytes are cut into units.  Control bytes
  (0x00-0x1E, '#', 0x7F) are single; 0x80 and the byte after it are two
  singles; [LoadFace]'s 2-byte argument is one symbol; any other byte is
  paired with the next one (low byte first) unless that one is a control
  byte, 0x80, '#' or 0x7F.
* Leaves are ordered: single bytes by value, then 0x01xx face arguments by
  value, then other pairs by (first byte, second byte).
* Nodes are merged smallest frequency first, ties to the lowest node index
  (leaves first, then internal nodes in creation order); the first node
  popped is the 0 (left) child.  Internal nodes follow the leaves in the
  table; the root is the last node.
* Bits are stored LSB first; the last byte of each message is 0-padded.
"""
import heapq
import re
import sys
from collections import Counter
from pathlib import Path

CONTROL_SINGLE = set(range(0x00, 0x1F)) | {0x23, 0x7F}


def parse_defs(path):
    defs = {}
    for line in Path(path).read_text().splitlines():
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        m = re.fullmatch(r"\[([^\]]+)\]\s*=\s*(.+)", line)
        if not m:
            sys.exit(f"{path}: bad line: {line}")
        defs[m.group(1)] = bytes(int(x, 0) for x in m.group(2).split(","))
    return defs


def parse_texts(path, defs):
    msgs, names = [], []
    body = None
    for n, line in enumerate(Path(path).read_text().split("\n"), 1):
        m = re.fullmatch(r"## (MSG_([0-9A-Fa-f]+))", line)
        if m:
            if int(m.group(2), 16) != len(msgs):
                sys.exit(f"{path}:{n}: expected MSG_{len(msgs):03X}, got {m.group(1)}")
            body = bytearray()
            msgs.append(body)
            names.append(m.group(1))
            continue
        if body is None:
            if line.strip():
                sys.exit(f"{path}:{n}: text before first ## MSG_ header")
            continue
        pos = 0
        for t in re.finditer(r"\[([^\]]*)\]", line):
            body += encode_chars(line[pos:t.start()], path, n)
            tag = t.group(1)
            if tag in defs:
                body += defs[tag]
            elif re.fullmatch(r"0x[0-9A-Fa-f]{1,2}", tag):
                body.append(int(tag, 16))
            else:
                sys.exit(f"{path}:{n}: unknown tag [{tag}]")
            pos = t.end()
        body += encode_chars(line[pos:], path, n)
    for name, b in zip(names, msgs):
        ss = symbols(b)
        if not ss or ss[-1] != 0 or 0 in ss[:-1]:
            sys.exit(f"{path}: {name} must end with [X] and contain it only once")
    return msgs, names


def encode_chars(s, path, n):
    try:
        return s.encode("ascii")
    except UnicodeEncodeError:
        sys.exit(f"{path}:{n}: non-ASCII text; use [0xNN] tags")


def symbols(b):
    out = []
    i, n = 0, len(b)
    while i < n:
        c = b[i]
        if c == 0x80 and i + 1 < n:
            out += [0x80, b[i + 1]]
            i += 2
        elif c == 0x10 and i + 2 < n:
            out += [0x10, b[i + 1] | b[i + 2] << 8]
            i += 3
        elif c in CONTROL_SINGLE:
            out.append(c)
            i += 1
        elif i + 1 < n and b[i + 1] >= 0x1F and b[i + 1] not in (0x80, 0x23, 0x7F):
            out.append(c | b[i + 1] << 8)
            i += 2
        else:
            out.append(c)
            i += 1
    return out


def leaf_key(v):
    if v < 0x100:
        return (0, v)
    if v >> 8 == 1:
        return (1, v)
    return (2, v & 0xFF, v >> 8)


def build_tree(freq):
    leaves = sorted(freq, key=leaf_key)
    weight = [freq[v] for v in leaves]
    nodes = [0xFFFF0000 | v for v in leaves]
    heap = [(w, i) for i, w in enumerate(weight)]
    heapq.heapify(heap)
    while len(heap) > 1:
        wa, a = heapq.heappop(heap)
        wb, b = heapq.heappop(heap)
        heapq.heappush(heap, (wa + wb, len(nodes)))
        nodes.append(a | b << 16)
    codes = {}
    stack = [(len(nodes) - 1, 0, 0)]
    while stack:
        i, code, length = stack.pop()
        if nodes[i] & 0x80000000:
            codes[nodes[i] & 0xFFFF] = (code, length)
        else:
            stack.append((nodes[i] & 0xFFFF, code, length + 1))
            stack.append((nodes[i] >> 16, code | 1 << length, length + 1))
    return nodes, codes


def main():
    args = sys.argv[1:]
    header = table = None
    if "--header" in args:
        k = args.index("--header")
        header = args[k + 1]
        del args[k:k + 2]
    if "--table" in args:
        k = args.index("--table")
        table = args[k + 1]
        del args[k:k + 2]
    texts, defs_path, out_path = args
    if table is None:
        table = str(Path(out_path).with_name("msg_table.c"))

    msgs, names = parse_texts(texts, parse_defs(defs_path))
    syms = [symbols(m) for m in msgs]
    freq = Counter(s for ss in syms for s in ss)
    nodes, codes = build_tree(freq)

    out = ["\t@ Generated by tools/textencode.py from texts/ -- do not edit\n",
           '\t.section .rodata.ord.0\n\n']
    for name, ss in zip(names, syms):
        acc = nbits = 0
        data = bytearray()
        for s in ss:
            code, length = codes[s]
            acc |= code << nbits
            nbits += length
            while nbits >= 8:
                data.append(acc & 0xFF)
                acc >>= 8
                nbits -= 8
        if nbits:
            data.append(acc)
        out.append(f"\t.global {name}\n{name}:\n")
        for i in range(0, len(data), 16):
            out.append("\t.byte " + ",".join(f"0x{x:02X}" for x in data[i:i + 16]) + "\n")

    out.append("\n\t.align 2, 0\n\t.global gMsgHuffmanTable\ngMsgHuffmanTable:\n")
    for i in range(0, len(nodes), 8):
        out.append("\t.4byte " + ",".join(f"0x{x:08X}" for x in nodes[i:i + 8]) + "\n")
    Path(out_path).parent.mkdir(parents=True, exist_ok=True)
    Path(out_path).write_text("".join(out))
    Path(table).write_text(table_source(names, len(nodes)))

    if header:
        write_header(header, msgs, names)


def table_source(names, nnodes):
    """gMsgHuffmanTableRoot and gMsgTable as C.  The file must not include
    constants/msg.h: it defines the MSG_XXXX names as ids."""
    c = ["// Generated by tools/textencode.py from texts/ -- do not edit\n",
         '#include "gbafe/global.h"\n\n',
         "extern const unsigned int gMsgHuffmanTable[];\n"]
    for i in range(0, len(names), 8):
        c.append("extern const char " + ", ".join(f"{n}[]" for n in names[i:i + 8]) + ";\n")
    c.append('\nSECTION(".rodata.ord.1")\n'
             f"const unsigned int * const gMsgHuffmanTableRoot = gMsgHuffmanTable + {nnodes - 1};\n\n"
             'SECTION(".rodata.ord.2")\nconst char * const gMsgTable[] = {\n')
    for n in names:
        c.append(f"    {n},\n")
    c.append("};\n")
    return "".join(c)


def write_header(path, msgs, names):
    hdr = ["#ifndef CONSTANTS_MSG_H\n#define CONSTANTS_MSG_H\n\n",
           "// Generated by tools/textencode.py --header from texts/texts.txt.\n",
           "// Message ids (index into gMsgTable).\n\n"]
    for n, (name, m) in enumerate(zip(names, msgs)):
        text, i = "", 0
        while i < len(m):
            c = m[i]
            text += chr(c) if 0x20 <= c < 0x7F else " "
            i += {0x80: 2, 0x10: 3}.get(c, 1)
        text = re.sub(r"\s+", " ", text).strip()[:48].rstrip().replace("*/", "* /")
        hdr.append(f"#define {name} 0x{n:04X}" + (f" /* {text} */" if text else "") + "\n")
    hdr.append(f"\n#define MSG_COUNT 0x{len(msgs):04X}\n\n#endif // CONSTANTS_MSG_H\n")
    Path(path).write_text("".join(hdr))


if __name__ == "__main__":
    main()
