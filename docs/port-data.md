# Port data design

How the data region becomes usable by a native (LP64) build.  This answers
the open question in `docs/port-notes.md`, section 1.  Status as of
2026-09-29: batch 1 (proc scripts, 438 objects) merged; batch 2 (menus and
UI tables, `tools/datac.py`) left 9,136 pointer words; batch 3 (animation
scripts, sprite / image / TSA / glyph pointer tables, the battle animation
tables) leaves 2,502.

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
| `src/events/*.c` (69 files, `tools/evdis.py`) | event lists and scripts | Done: C with the macros of `include/event_macros.h` (batch 6) |
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

## Animation scripts (`AnimScr`)

A script is a list of instructions (`include/gbafe/anime.h`).  Four kinds
hold an address, and the ROM stores it as one word next to flag bits the
address has no room for on a 64-bit host: a sprite (`address + duration`:
bits 0-1 and 28-30), `0xC0000000 + function`, `0xD0000000 + script`, and the
two pointers after a FRAME instruction.  So a script is written with macros,
one per instruction, never with numbers or `|`:

    ANIMSCR_FORCE_SPRITE(AnimSprite_X, 2),  ANIMSCR_WAIT(0x13),
    ANIMSCR_MOVE(x, y, delay),  ANIMSCR_COMMAND(id),  ANIMSCR_FRAME(delay, img, spr),
    ANIMSCR_CALL(func),  ANIMSCR_JUMP(script),
    ANIMSCR_BLOCKED (STOP),  ANIMSCR_END,  ANIMSCR_LOOP

* **GBA** (`PLATFORM_GBA`): `AnimScr` is `u32`.  `ANIMSCR_FORCE_SPRITE(s, d)`
  is `(AnimScr) s + ANIMFMT_OAM_DURATION(d)`, the same relocation the
  assembly's `.4byte AnimSprite_X + 0x70000003` was; `CALL` and `JUMP` add
  the flag the same way.  The bytes do not change.
* **Host**: `AnimScr` is `uintptr_t`, and an instruction with an address is
  two cells, the flags then the address: `FORCE_SPRITE(s, d)` expands to
  `ANIMFMT_OAM_DURATION(d), (AnimScr) s`, `CALL(f)` to `0xC0000000u,
  (AnimScr) f`.  A cell holds a whole pointer, so nothing is masked out of
  an address.  The interpreter (`AnimInterpret`) tests
  `ANINS_HAS_ADDRESS(first cell)` and takes the address from the next cell
  instead of from the flag word.  FRAME is unchanged: the instruction
  word, then the sheet and sprite pointers as cells.
* Scripts that are not C (the battle animation scripts decompressed to RAM,
  whose words are 32-bit) have to be expanded into this cell format when
  they are decompressed on the host; that is the banim stream translation
  above, not something the macros can do.
* The sprites (`AnimSprite_*`) stay in assembly as blobs and are declared
  `extern const struct AnimSpriteData X[]`, several to a line; a script that
  jumps or calls names its target symbol like any other pointer.
* `tools/datac.py add FILE AnimScr OBJ...` decodes a script into these
  macros.  An object ends at its last STOP / END / LOOP before something that
  does not decode as an instruction (`note:` lines: bytes after it stay in the
  assembly).  STOP waits to be released and does not end the object.

## Events (`src/events/`)

The 69 files `tools/evdis.py` used to write as assembly are C now, one per
chapter plus `common.c`, `shops.c` and `traps.c` (`include/event_macros.h`
has the macros, generated by the same tool from its command table).

* An **event script** is a `const EventScr X[]` (`uintptr_t` cells) of
  command macros, `TEX1(MSG_X), STAL(30), ASMC(func), ENDA,`.  A macro
  expands to the words of one command: the command id and the first
  argument share word 0, halves and bytes are masked and shifted into
  their word (`EVP`), a field that holds an address is a whole cell
  (`EVW`, a cast to `EventScr`).  The unused high half of a command's first
  word is not an argument.  A script that another script enters half way
  (2 cases) is referenced as `&Outer[n]`.
* An **event list** (turn, character, location, misc, tutorial) is a
  `const EventListScr X[]` of the same kind of macros, `TURN(...)`,
  `AFEV(...)`, ..., ended by `EVLIST_END`; the reader walks it as words.
* Unit lists are `const struct UnitDefinition []` (`UNIT(...)`,
  `UNIT_END`), trap lists a packed `struct { struct TrapData traps[n];
  u8 end; }` (the list ends with one 0 byte, so it is not an array of
  6-byte entries), scripted battles `const struct BattleHit []`, sprite
  animation configs `struct EventSpriteAnimConf`, message lists
  `const u32 []`, shop lists `const u16 []`, move scripts and area lists
  `const u8 []`, a chapter's table of lists `struct ChapterEventGroup`.
* Functions and data outside the event files are named and declared
  (`extern void f();`, `extern const u8 X[];`) at the top of the file that
  needs them, unless a header already declares them.
* Each run of objects is one section, `SECTION(".rodata.ev_<ADDR>")` on
  every object, with a `data/layout.txt` line.  An object at a multiple of
  4 whose type is not 4-aligned is `EV_ALIGN4`; a section that starts at an
  address that is not a multiple of 4 holds only such byte-aligned objects
  (the tool starts a new section at the first object that needs alignment).
  Five zero paddings the compiler can't produce are `EvPad_*` byte arrays.

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
3. **Animation data** (done): `AnimScr []` (about 210 objects, see above), sprite
   and image pointer arrays (`u16 * []`, `ImgArray_*`, `TsaArray_*`,
   `SpriteArray_*`, glyph tables), `banim_data` and its two sibling tables.
4. **Mistyped declarations:** objects declared `u8 []`/`u32 []`/`void * []`
   that hold pointers (~220): find the real structure from the code.
5. **Undeclared objects** (365, mostly `gUnk_`): find the reader, name and
   type them.  The large ones (`gUnk_08CFFF68`, `gUnk_08FF0A10`,
   `gUnk_08CF8CA8`) are mostly bytes with a few pointers; check whether
   the words are pointers at all first.
6. **Events** (`evdis.py` emitting C): done; see "Events" below.
7. **Text table**, **music headers/voice groups**, **banim sheet tables**.

After batch 7 the remaining port-blocking data issue is layout: structures
with `STRUCT_PAD`/numeric offsets and literal-size copies
(`docs/port-notes.md`, section 4).  The `hostcheck` build plus a
`_Static_assert` on each ROM structure's GBA size, under
`PLATFORM_GBA`, keep the converted types honest.
