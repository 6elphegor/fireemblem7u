#!/bin/sh
# Port reference files one at a time, keeping each that builds matching.
# Usage: tools/port_loop.sh REF_REPO STEM...
ref="$1"; shift
plan="build/plan.json"
for stem in "$@"; do
    make -j10 >/dev/null 2>&1
    if ! python3 tools/port_partial.py "$ref/objs" --json "$plan" "$stem" | grep -q "$stem.*C "; then
        echo "$stem: not portable"; continue
    fi
    if python3 tools/apply_port.py "$ref" "$plan" "$stem" >build/apply.log 2>&1 &&
       make -j10 >build/make.log 2>&1 && tail -1 build/make.log | grep -q ': OK'; then
        git add -A && git commit -q -m "Partial port of ${stem#src_}.c from FireEmblem7J" && echo "$stem: ported"
    else
        echo "$stem: FAILED (see build/fail_$stem.log)"
        cat build/apply.log build/make.log > "build/fail_$stem.log" 2>/dev/null
        git checkout -q -- asm src include symbols.ld data fe7u.lds tools/fe7u.cfg tools/ref_rewrites.txt
        git clean -fdq asm src include symbols.ld data
        rm -rf build/src build/asm
    fi
done
