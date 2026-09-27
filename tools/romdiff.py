#!/usr/bin/env python3
"""List where fe7u.gba differs from baserom.gba, by symbol.

Usage: tools/romdiff.py [MAX_RANGES]
"""
import bisect
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from elf32 import Elf, STT_FUNC, STT_OBJECT  # noqa: E402


def main():
    limit = int(sys.argv[1]) if len(sys.argv) > 1 else 20
    a, b = Path("fe7u.gba").read_bytes(), Path("baserom.gba").read_bytes()
    if len(a) != len(b):
        print(f"size differs: {len(a):#x} vs {len(b):#x}")
    syms = sorted((s.value & ~1, s.name) for s in Elf("fe7u.elf").symbols
                  if s.type in (STT_FUNC, STT_OBJECT) and s.value >= 0x08000000)
    addrs = [s[0] for s in syms]
    ranges, i, n = [], 0, min(len(a), len(b))
    while i < n and len(ranges) < limit:
        if a[i] != b[i]:
            j = i
            while j < n and (a[j] != b[j] or j - i < 16 and a[j:j + 4] != b[j:j + 4]):
                j += 1
            ranges.append((i, j))
            i = j
        i += 1
    if not ranges:
        print("identical")
    for s, e in ranges:
        addr = 0x08000000 + s
        k = bisect.bisect_right(addrs, addr) - 1
        where = f"{syms[k][1]}+{addr - syms[k][0]:#x}" if k >= 0 else "?"
        print(f"{addr:#010x}..{addr + e - s:#010x} ({e - s} bytes)  {where}")


if __name__ == "__main__":
    main()
