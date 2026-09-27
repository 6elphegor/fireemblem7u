#!/bin/sh
# Fetch and build the external tools (agbcc, gbadisasm) into tools/.
# Paths are quoted throughout: the project directory may contain spaces.
set -e
here="$(cd "$(dirname "$0")/.." && pwd)"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

if [ ! -x "$here/tools/agbcc/bin/agbcc" ]; then
    git clone -q https://github.com/pret/agbcc.git "$tmp/agbcc"
    (cd "$tmp/agbcc" && ./build.sh >/dev/null)
    d="$here/tools/agbcc"
    mkdir -p "$d/bin" "$d/include" "$d/lib"
    cp "$tmp/agbcc/agbcc" "$tmp/agbcc/old_agbcc" "$tmp/agbcc/agbcc_arm" "$d/bin/"
    cp -R "$tmp/agbcc/libc/include" "$d/"
    cp "$tmp/agbcc/ginclude/"* "$d/include/"
    cp "$tmp/agbcc/libgcc.a" "$tmp/agbcc/libc.a" "$d/lib/"
    echo "agbcc installed"
fi

if [ ! -x "$here/tools/gbadisasm/gbadisasm" ]; then
    git clone -q https://github.com/camthesaxman/gbadisasm.git "$here/tools/gbadisasm"
    make -C "$here/tools/gbadisasm" >/dev/null
    echo "gbadisasm installed"
fi
