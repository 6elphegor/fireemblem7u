#!/bin/sh
# Fetch and build the external tools (agbcc, gbadisasm) into tools/.
# Paths are quoted throughout: the project directory may contain spaces.
set -e
here="$(cd "$(dirname "$0")/.." && pwd)"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

# Run a build step quietly; show its output only if it fails.
quiet() {
    "$@" >"$tmp/log" 2>&1 || { cat "$tmp/log"; echo "setup.sh: failed: $*" >&2; exit 1; }
}

if [ ! -x "$here/tools/agbcc/bin/agbcc" ]; then
    git clone -q https://github.com/pret/agbcc.git "$tmp/agbcc"
    # adds -mtpcs-frame (GCC 2.95 Thumb backtrace frames), needed by src/main.c
    git -C "$tmp/agbcc" apply "$here/tools/agbcc-tpcs-frame.patch"
    (cd "$tmp/agbcc" && quiet ./build.sh)
    d="$here/tools/agbcc"
    mkdir -p "$d/bin" "$d/include" "$d/lib"
    cp "$tmp/agbcc/agbcc" "$tmp/agbcc/old_agbcc" "$tmp/agbcc/agbcc_arm" "$d/bin/"
    cp -R "$tmp/agbcc/libc/include" "$d/"
    cp "$tmp/agbcc/ginclude/"* "$d/include/"
    cp "$tmp/agbcc/libgcc.a" "$tmp/agbcc/libc.a" "$d/lib/"
    echo "agbcc installed"
fi

if [ ! -x "$here/tools/gbadisasm/gbadisasm" ]; then
    rm -rf "$here/tools/gbadisasm"    # left over from a failed run
    git clone -q https://github.com/camthesaxman/gbadisasm.git "$here/tools/gbadisasm"
    quiet make -C "$here/tools/gbadisasm"
    echo "gbadisasm installed"
fi
