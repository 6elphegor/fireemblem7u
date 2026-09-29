# Port data design

How the data region becomes usable by a native (LP64) build.  This answers
the open question in `docs/port-notes.md`, section 1.  Status as of
2026-09-29: batch 1 (proc scripts, 438 objects) merged; batch 2 (menus and
UI tables, `tools/datac.py`) left 9,136 pointer words; batch 3 (animation
scripts, sprite / image / TSA / glyph pointer tables, the battle animation
tables) leaves 2,502; the AI scripts and tables, the tileset animation
tables, the link and trade events, the bare-RAM pointer variables
(`src/data/ramptrs.c`) and the rest of the ROM-B files leave 3 (the dead
block 0x08CF6A94-0x08CFFF78 and the RAM snapshot at 0x08FFF6E0 are marked
`NOT_POINTERS` in `tools/dataptrs.py`).

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
| `build/msg_bits.s`, `build/msg_table.c` (`tools/textencode.py`) | `gMsgTable`, one pointer per message; `gMsgHuffmanTableRoot` | **Done.** Both are C now, generated at build time (not committed) and linked with the bitstream and tree (bytes, assembly) into `build/msg_data.o`; see "Music and text" |
| `sound/` (`tools/m4adis.py`) | song headers, voice groups, both tables (aligned); track `GOTO`/`PATT` addresses (2,537 unaligned) | **Headers, voice groups and tables are C** (`sound/song_headers.c`, `voicegroups.c`, `song_table.c`); the track byte streams keep 4-byte addresses, which the portable m4a engine reads through one hook, `M4aReadAddr` (see "Music and text") |
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

* **One-word format** (`ANIMSCR_WIDE` is 0, the GBA default): `AnimScr` is
  `u32`.  `ANIMSCR_FORCE_SPRITE(s, d)` is `(AnimScr) s +
  ANIMFMT_OAM_DURATION(d)`, the same relocation the assembly's `.4byte
  AnimSprite_X + 0x70000003` was; `CALL` and `JUMP` add the flag the same
  way.  The bytes do not change.
* **Cell format** (`ANIMSCR_WIDE` is 1; the default when `!PLATFORM_GBA`):
  `AnimScr` is `uintptr_t`, and an instruction with an address is two
  cells, the flags then the address: `FORCE_SPRITE(s, d)` expands to
  `ANIMFMT_OAM_DURATION(d), (AnimScr) s`, `CALL(f)` to `0xC0000000u,
  (AnimScr) f`.  A cell holds a whole pointer, so nothing is masked out of
  an address.  `AnimInterpret` tests `ANINS_HAS_ADDRESS(first cell)` and
  takes the address from the next cell (`ANINS_CELL_ADDRESS`) instead of
  from the flag word.  FRAME is unchanged: the instruction word, then the
  sheet and sprite pointers as cells.
* **The other reader of ROM scripts**, `EkrsubAnimeEmulatorMain`
  (`banim-efxutils.c`), needed two changes that only running it showed.  A
  sprite's flag cell has no address bits, so its type field (bits 24-29)
  reads 0 = STOP: it tests `ANINS_IS_TYPE(inst, type)`, which checks
  NOT_FORCESPRITE first (in the one-word format `ANINS_GET_TYPE` alone
  worked because the address bits were in the word).  And its STOP mode 2
  ("hold the last instruction") stepped back one word; the previous
  instruction is now one or two cells, so the proc keeps `scr_prev` (a new
  field in the padding of `struct ProcEkrSubAnimeEmulator`, wide format
  only).  Any new code that walks a script must do the same: never
  decrement a cell index to reach the previous instruction, never read the
  type of a first cell without checking NOT_FORCESPRITE.
* **Testing the cell format on the GBA.**  `make NONMATCHING=1
  ANIMSCR_WIDE=1` builds `fe7u_nonmatching_wide.gba` (objects in
  `build/nonmatching-wide/`) with `-DANIMSCR_WIDE=1`.  A cell is 4 bytes
  there, so the scripts have the ROM's size, but every script has the
  two-cell layout and the reader logic is the one the host runs.
  `make emutest EMUTEST_B=fe7u_nonmatching_wide.gba EMUTEST_FLAGS=--fast`
  must give the same frames as the plain NONMATCHING build.  It does: all
  nine scripts have the same video and audio differences as
  `fe7u_nonmatching.gba` (the frames of `extras.txt` around 3404-3623, the
  known spinning-background difference of CONTRIBUTING, differ in pattern
  because the code addresses differ; `shops.txt` the same 488 frames).  The
  scripts do reach scripts of both kinds: the class reels of `opening.txt`
  and every battle animation in `prologue.txt`, `hector.txt`, `lyn.txt`
  (RAM scripts, `AnimInterpret`) and the class reel's
  `EkrsubAnimeEmulator` (ROM scripts, `AnimScr_EkrMainMini_*`); before the
  fixes above the wide build diverged in the first class reel (frame 5991).  The host
  compile (`make hostcheck`) has the switch on by default.
* **Battle animation scripts** (decompressed to RAM: `gBanimScrLeft` /
  `Right`, `include/gbafe/banim.h`).  They are interpreted by the same
  `AnimInterpret`, but contain only one-word instructions without an
  address (command, wait, stop, end) and FRAME (instruction, sheet pointer,
  sprite offset = three cells, as above).  The sprite / call / jump
  instructions never occur in them.  So there is no format conversion: the
  words are already cells.  Two things differ on a host where a cell is
  wider than the ROM's 4 bytes, and both belong to the banim stream
  translation, not to the macros: the decompressor has to widen every word
  into a cell (the sheet words become pointers there), and the mode table
  holds byte offsets into the 4-byte-word script.  The latter goes through
  one accessor, `BANIM_SCR_AT(base, byte_offset)`, which counts cells
  (`byte_offset / 4`); the interpreters step in cells (`pScrCurrent++`,
  `+= 3` for a FRAME) and are untouched.  In the matching build the macro
  is the original pointer sum.  `struct BanimModeData` (also read at a mode
  table offset, `banim-ekrbattleintro.c`) holds pointers in RAM and is not
  converted yet.
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

## Music and text

`tools/m4adis.py` (extracted into `sound/` on the first `make`, like before)
and `tools/textencode.py` (into `build/`) write the pointer-bearing
structures as C and the rest as assembly.  Neither is committed.

* **Text:** `build/msg_table.c` defines `gMsgHuffmanTableRoot` and `gMsgTable`
  (`const char * const []`, one `MSG_XXXX` label of the bitstream per
  message); the bitstream and the tree stay assembly (`build/msg_bits.s`,
  which now exports the `MSG_XXXX` labels).  The generated file must not
  include `constants/msg.h` (it defines the same names as ids).
* **Music, C:** `sound/voicegroups.c` (one `const struct ToneData []` per
  group; `wav` holds the sample, the sub group of a drum set or key split
  group, or the sweep / duty cycle byte of a square voice), `sound/song_headers.c`
  (`struct SongHeaderN`: the `struct SongHeader` layout with N track
  pointers, `trackCount` .. `tone`, `part[N]`), `sound/song_table.c`
  (`gMPlayTable`, `gSongTable`).  `struct ToneData` in
  `include/gba/m4a_internal.h` gained `union { struct { attack, decay, sustain,
  release } adsr; const u8 *keySplitTable; } u`, so a key split entry can hold
  its table pointer (this ROM has none; drum sets are `u.adsr` zero).
* **Music, assembly:** the track streams (`sound/songs/songNNN.s`, labels
  `songNNN_T` for the C headers), samples (`.incbin`) and bytes nothing
  refers to.  Samples: a `WaveData` is `wav` plus the 16-byte header, so the
  host keeps each sample contiguous with its header.
* **Placement:** every object is in a section `.rodata.ord.ADDR` (its ROM
  address), assembly and C alike, and `ld -r -T tools/ordered.ld` links
  them, sorted by name, into the one `.rodata` of `build/sound/sound.o`
  (`build/msg_data.o` the same way with `.rodata.ord.0/1/2`).  The layout
  lines, `datasplit.py`, `shifttest` and the modern build see the same
  objects and section names as before.  Padding for the 4-alignment of a
  header or voice group comes from the section alignment, not from
  `.align` in the tracks.

Reads of an address stored in the byte streams.  In the portable engine
(`src/m4a_1.c`, the NONMATCHING build) every one of them goes through one
function, the hook a host fills in:

```c
// include/gba/m4a_internal.h, src/m4a_1.c
u8 *M4aReadAddr(const u8 *p);
```

* `p` points at the 4 stored bytes in a track stream (unaligned,
  little-endian); the return value is the pointer they stand for.  The
  caller advances `cmdPtr` itself (GOTO jumps to the result; PATT keeps
  `p + 4` as its return address, so the stored field must stay 4 bytes).
* On the GBA (`PLATFORM_GBA`) the 4 bytes are the address.  Byte 0 is read
  through the portable `chk_adr_r2` (`AddrReadable`: a read from below
  0x02000000, the BIOS, gives 0, as `ply_goto` did).
* On a host (`!PLATFORM_GBA`) it assembles the same 32-bit value and passes
  it to `void *M4aHostRomAddr(u32 stored)`, which the host link provides
  (declared in `m4a_internal.h`, not defined anywhere yet): whatever the
  host's track assembly stores in those 4 bytes (a GBA ROM address, or an
  offset from a base symbol), it maps it to the host's copy of the data.
  Nothing else in the engine reads a stored address.

| Read | Where (portable engine) | Where (matching `asm/m4a_1.s`) | What it reads |
|---|---|---|---|
| GOTO | `ply_goto`: `M4aReadAddr(cmdPtr)` | `ply_goto`, byte loads | jump target |
| PATT | `ply_patt`: saves `cmdPtr + 4` in `patternStack`, then `ply_goto` | `ply_patt` | call target; the return address is a real pointer in RAM |
| REPT | `ply_rept`: `ply_goto` | `ply_rept`, `ply_rept_1` | jump target |
| MEMACC conditional | `src/m4a.c` `ply_memacc`: taken, `gMPlayJumpTable[1]` = `ply_goto`; not taken, `cmdPtr += 4` | same (C in both builds) | jump target |
| XCMD xWAVE | `src/m4a.c` `ply_xwave`: `M4aReadAddr(cmdPtr)` under `#if NONMATCHING` | `ply_xwave`, four `READ_XCMD_BYTE` | sample (`WaveData`) address stored into `track->tone.wav` |

Stored addresses that are not in the streams and need no translation on the
host because C now holds them: `songHeader->tone` and `part[i]`
(`MPlayStart_rev01`, `src/m4a.c:584-602`; `part[i]` is a `u8 *` to the first
track byte, the start of a stream), the song and player tables
(`src/m4a.c:72-148`), and the `ToneData` pointers read by `ply_voice`
(`asm/m4a_1.s:724-744`, which copies `type`, `wav` and the ADSR word of a
12-byte entry into the track; it also filters each word through
`chk_adr_r2`, `asm/m4a_1.s:563`, a BIOS-ROM guard that needs care with
64-bit values) and `ply_note` (`asm/m4a_1.s:1392` `keySplitTable`, `:1402`
`wav`: a drum set / key split entry is `group[index]`, index 12 bytes apart,
so `ToneData` stays 12 bytes on the GBA and the host indexes its own layout).
The engine's `struct ToneData` and `struct SongHeader` are used as declared
in C.  The raw byte offsets of `asm/m4a_1.s` (`o_MusicPlayerTrack_*`,
`[r5, 0x..]`) are gone from the portable engine: `src/m4a_1.c` and
`src/m4a_mixer.c` use the struct fields only, and the GBA sizes and offsets
the assembly relies on are static assertions there (under `PLATFORM_GBA`).

## Tables the code indexes from before their start (`FaceInfoTable`)

`GetFaceInfo(fid)` read `FaceInfoTable + fid`, and the label sat one entry
(0x1C bytes) before the first real record: face 0 has no record, and the
ROM's "entry 0" is the last 0x1C bytes of `Img_Portrait_001_Face`'s LZ77
stream.  A C array starting there would put compressed bytes into a
`struct FaceInfo`, and a symbol defined as `gFaceInfoTable - 1` would be
pointer arithmetic before the array on the host.  So the C table
(`gFaceInfoTable`, `src/face.c`, section `.rodata.08C965A0`) holds faces 1 to
0xE4 only and `GetFaceInfo` indexes `fid - 1`; the compiler folds the
constant into the same code.  The old label is gone from `data/rom`
(`tools/gfxrefs.py` keeps the address as a constant).

Rule for similar cases: never define an object over bytes that belong to
another; index from the real start in the reader.

## Event scripts outside the chapter tables

The scripts that code or another script starts (the epilogue scenes at
0x08CC0F54 and 0x08CC1280, `EventScr_SuspendPrompt`, the world map scripts
0x08CE78C8-0x08CED678 and the end of chapter 0x42 at 0x08CE1C64) are in
`src/events/` too (`epilogue.c`, `common.c`, `worldmap.c`, `ch42.c`): the
`EXTRA_RANGES` of `tools/evdis.py` name each range, which is cut into scripts
at a zero word (ENDA), at the end of the range, or where a symbol names a
command.  After `evdis.py` the gap in `data/rom` is closed by rerunning
`tools/datasplit.py`.

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
7. **Text table**, **music headers/voice groups** (done, see "Music and text"), **banim sheet tables**.

After batch 7 the remaining port-blocking data issue is layout: structures
with `STRUCT_PAD`/numeric offsets and literal-size copies
(`docs/port-notes.md`, section 4).  The `hostcheck` build plus a
`_Static_assert` on each ROM structure's GBA size, under
`PLATFORM_GBA`, keep the converted types honest.
