#!/bin/sh
# After a merge: C that still calls sub_XXXXXXXX for a function renamed on
# the other branch fails to link.  Replace each such name with the name
# tools/fe7u.cfg now gives that address, then rebuild; repeat until clean.
for i in 1 2 3 4 5 6 7 8; do
    out=$(make -j10 2>&1)
    und=$(printf '%s\n' "$out" | grep -oE "(undefined reference to .|.)sub_[0-9A-F]{8}(' undeclared)?" | grep -oE 'sub_[0-9A-F]{8}' | sort -u)
    [ -z "$und" ] && break
    for s in $und; do
        n=$(awk -v a="0x${s#sub_}" 'tolower($2) == tolower(a) && NF >= 3 { print $3 }' tools/fe7u.cfg)
        [ -z "$n" ] || [ "$n" = "$s" ] && continue
        echo "$s -> $n"
        grep -rl "$s" src include | xargs perl -pi -e "s/\\b$s\\b/$n/g"
    done
done
printf '%s\n' "$out" | tail -1
