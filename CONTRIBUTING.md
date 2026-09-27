# Contributing

The goal is C that compiles to the exact bytes of the original ROM.
`make` must end with `fe7u.gba: OK`; a change that doesn't is not done.

## Setup (including in a git worktree)

`baserom.gba` and `tools/agbcc/` are not in git. In a fresh worktree:

```sh
ln -s "/Users/belphegor/Fire Emblem/baserom.gba" baserom.gba
ln -s "/Users/belphegor/Fire Emblem/tools/agbcc" tools/agbcc
make -j10
```

macOS `make` is 3.81 and compares mtimes to the second: after scripted
bulk edits, `rm -rf build/asm build/src` before building.

## How code is laid out

* `asm/code_<ADDR>.s` — one not-yet-decompiled function per file, linked
  in the order listed in `fe7u.lds`.
* `src/<module>.c` — decompiled modules (most adopted from FireEmblem7J).
  A module can hold functions that don't match yet:
  `ASM_FUNC("asm/nonmatching/code_<ADDR>.s");` emits the original asm at
  that point.  `asm/nonmatching/` is only ever included this way.
* `include/` — headers (FireEmblem7J's, extended).
* `symbols.ld` — FE7U addresses of data not yet defined in C.
* `data/layout.txt` — FE7U addresses of C modules' data sections.

## Decompiling a function

1. Find it: `asm/nonmatching/code_<ADDR>.s` (inside a C module) or
   `asm/code_<ADDR>.s` (not in any module yet).
2. Write C.  Good references:
   * FireEmblem7J (`/private/tmp/claude-501/-Users-belphegor-Fire-Emblem/bf1905e3-923e-418b-951a-7850f33a76fb/scratchpad/FireEmblem7J`) — same game, Japanese release.
     A nonmatching function is usually its JP version with small changes.
   * fireemblem8u (`.../scratchpad/fe8u`) — same engine, often near-identical code.
3. Compile and compare: `make`, then `tools/romdiff.py` lists differing
   ranges by symbol.  `build/src/<module>.s` is the compiler's output;
   compare it against the original asm.
4. When it matches:
   * inside a module: replace the `ASM_FUNC(...)` line with the C and
     `git rm` the `asm/nonmatching/` file;
   * a new function next to a module: add it to that module in ROM order,
     `git rm asm/code_<ADDR>.s`, and delete its line from `fe7u.lds`
     (the module's line covers it).  A new module gets its own
     `src/<module>.c` whose line replaces the first function's line in
     `fe7u.lds`.

The compiler is `old_agbcc` at `-O2` (a few modules differ; see Makefile).
Matching tips: statement order, temporaries, `s8/u8/s16` vs `int`, and
`if`/`switch` shape all change codegen; FE7J's sources show the idioms that
match this compiler.

## Rules that keep parallel work mergeable

* Touch only the functions/modules you were assigned.
* Don't reformat or reorder unrelated code; don't rename symbols outside
  your area (`tools/rename.py` edits every asm file).  If a name is wrong,
  note it in your report instead.
* Header edits: add declarations near related ones; don't rewrite blocks.
  `grep -rn NAME include/` first — two branches declaring the same function
  with different types breaks the build after merging.
* `symbols.ld` and `data/layout.txt` merge by union — just add lines.
* Commit only matching states (`make` prints `OK`).
* Before reporting done: `git merge main`, then `tools/fix_renames.sh`
  (updates `sub_XXXXXXXX` calls to functions renamed on main), fix any
  remaining conflicts or duplicate declarations, and make sure `make`
  still prints `OK`.
