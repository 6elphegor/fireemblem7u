# Port data design

How the data region becomes usable by a native (LP64) build.  This answers
the open question in `docs/port-notes.md`, section 1.  Status as of
2026-09-29: batch 1 (proc scripts, 438 objects) merged; batch 2 (menus and
UI tables, `tools/datac.py`) leaves 9,136 pointer words.

## Decision

Convert every data object that holds a pointer to C, typed with the
structure the code reads it through.  Leave pointer-free data as it is.
Handle the two stream formats whose pointers sit inside byte or compressed
data (music, battle animation scripts) with a translation local to the code
that reads them.

Rejected:

* **32-bit host process with fixed mappings.**  Not possible on the main
  development machine (Apple Silicon: no 32-bit processes, no AArch32, the
  low 4 GiB reserved), nor on Windows on ARM.  A prototype would have needed
  a Linux VM or wasm32 toolchain only to be thrown away later.
* **Address-translating loader for everything.**  Code reads pointers out of
  ROM structures in thousands of places (every `->field` of a struct in ROM
  that holds a pointer); hiding a translation in the types would touch more
  code than converting the data does.

## Why it is smaller than the data region

Measured on a3246c9 (`data/rom/*.s`, 15.2 MiB of the region still in
assembly):

| | objects | bytes |
|---|---|---|
| labeled objects in `data/rom` | 11,790 | ~14 MiB |
| of those, holding at least one `.4byte SYMBOL` | 1,326 | ~300 KiB |
| ... declared in a header with a type | 960 | ~110 KiB |
| ... not declared anywhere (mostly `gUnk_`) | 365 | ~190 KiB |

Pointer-free objects (graphics, LZ77 blobs, palettes, tile maps, map
data, number tables) are byte arrays on every platform.  A host build
assembles the same `data/rom` files with the host's assembler: `.incbin`,
labels and `.global` are portable; only the `.section` line needs a
host spelling (Mach-O has no ELF section names), which a small preprocessing
step or `#ifdef` in a shared include can supply.  Those objects stay in
assembly, and nothing about them has to change for the port.

What does have to change, by source:

| Source | Pointer-bearing content | Plan |
|---|---|---|
| `data/rom/*.s` | 1,326 objects, 13,657 pointer words | Convert to C (batches below) |
| `data/events/*.s` (69 files, `tools/evdis.py`) | event lists and scripts | Teach `evdis.py` to emit C with the event macros already used by `src/*.c` (`EventScr` is `uintptr_t`) |
| `build/msg_data.s` | `gMsgTable`, one pointer per message | Emit the table as C from the text tool; the Huffman bitstream stays bytes |
| `sound/` (`tools/m4adis.py`) | song headers, voice groups (aligned); track `GOTO`/`PATT` addresses (2,537 unaligned) | Headers and voice groups as C; the track byte streams keep 4-byte addresses and the ported m4a engine translates them (one read site per command) |
| `banim/` (`tools/banim.py`) | sheet pointers inside LZ77-compressed scripts | Same: the scripts stay bytes; the banim code maps a stored address to a sheet through a table the tool generates |

## Rules for converted objects

* **Where:** the C module that uses the object (the one that references
  it; for shared tables, the owner of the related code).  Data with no
  code user yet, or used from many modules, goes in `src/data/<topic>.c`.
* **Placement:** every converted object (or contiguous run of objects that
  move together) gets its own section, `SECTION(".rodata.<ADDR>")` with the
  object's ROM address, and is defined `const` (non-const objects make
  agbcc emit a writable section and `as` warn; see CONTRIBUTING, "Data
  objects converted to C"), and a `data/layout.txt` line
  `rom 0x<ADDR> 0x<SIZE> build/src/<module>.o(.rodata.<ADDR>)`.  Then
  rerun `tools/datasplit.py` so the gap shrinks around it.  `SECTION`
  expands to nothing off the GBA (`PLATFORM_GBA`), so the host needs
  nothing extra.
* **Types:** the type the code reads the object as.  Fix wrong
  declarations as you go (`u8 []` or `u32 []` for something that holds
  pointers is wrong).  Every pointer field is a pointer type or
  `uintptr_t`, never `u32`.  A struct that is only known as a byte range
  gets a struct definition with named or `unk_XX` fields; the offsets live
  in comments only.
* **Pointers:** every `.4byte SYMBOL [+ ADDEND]` becomes the symbol
  expression.  `+ 1` on a Thumb function disappears (C function pointers
  carry the Thumb bit).  An addend into the middle of an object becomes
  `&obj[i]` or `&obj.field`; if that is impossible, the object is typed
  wrong.
* **Words that are pointers but were left raw:** `NULL` fields are raw
  zeros and need no care, but a pointer `dataptrs.py` missed shows up as a
  number in a pointer field.  Resolving it to a symbol is part of the
  conversion; `make` verifies the bytes either way.
* **Checks** before each commit: `make` prints `fe7u.gba: OK`;
  `make shifttest` reports `WRONG: 0`; `make modern-check`; `make
  hostcheck` has no errors.

Progress metric: pointer words left in assembly,
`grep -c '^\s*\.4byte' data/rom/*.s | awk -F: '{s+=$2} END {print s}'`
(13,657 at the start), plus the three stream sources above.

## Batches

Ordered so that each batch is mechanical within itself and has a decoder
that can be reused:

1. **Proc scripts** (`struct ProcCmd []`, ~430 objects, ~26 KiB): a decoder
   from the 8-byte commands to the `PROC_*` macros in
   `include/gbafe/proc.h`.  Mostly battle-animation spell effects, the map
   main loop, and menus.
2. **Menus and UI tables** with known types: `struct MenuDef`,
   `struct MenuItemDef []` (`gItemMenuItems`, `gMapMenuItems`, ...),
   `struct SelectInfo`, `struct HelpBoxInfo`, `StatScreenTextInfo`, game
   options, the sound room, battle talk, the ending tables.
3. **Animation data:** `AnimScr []` (93), sprite and image pointer arrays
   (`u16 * []`, `ImgArray_*`, `TsaArray_*`, `SpriteArray_*`).
4. **Mistyped declarations:** objects declared `u8 []`/`u32 []`/`void * []`
   that hold pointers (~220): find the real structure from the code.
5. **Undeclared objects** (365, mostly `gUnk_`): find the reader, name and
   type them.  The large ones (`gUnk_08CFFF68`, `gUnk_08FF0A10`,
   `gUnk_08CF8CA8`) are mostly bytes with a few pointers; check whether
   the words are pointers at all first.
6. **Events** (`evdis.py` emitting C).
7. **Text table**, **music headers/voice groups**, **banim sheet tables**.

After batch 7 the remaining port-blocking data issue is layout: structures
with `STRUCT_PAD`/numeric offsets and literal-size copies
(`docs/port-notes.md`, section 4).  The `hostcheck` build plus a
`_Static_assert` on each ROM structure's GBA size, under
`PLATFORM_GBA`, keep the converted types honest.
