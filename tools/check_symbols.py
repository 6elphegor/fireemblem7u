#!/usr/bin/env python3
"""Fail if symbols.ld assigns one name two different addresses.

symbols.ld merges by union, so two branches naming the same symbol
differently would otherwise link silently with whichever comes last.
"""
import re
import sys
from collections import defaultdict

addrs = defaultdict(set)
for n, line in enumerate(open("symbols.ld"), 1):
    m = re.match(r"\s*(\w+)\s*=\s*(0x[0-9A-Fa-f]+)\s*;", line)
    if m:
        addrs[m.group(1)].add(int(m.group(2), 16))
bad = {k: v for k, v in addrs.items() if len(v) > 1}
for k, v in sorted(bad.items()):
    print(f"symbols.ld: {k} has conflicting addresses: {', '.join(hex(a) for a in sorted(v))}", file=sys.stderr)
sys.exit(1 if bad else 0)
