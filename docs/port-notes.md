# Port notes

What stands between the decompiled C and a native PC build, as of
2026-09-28.  It is the starting point for the platform layer; nothing
here is solved yet unless it says so.  Line numbers are for the commit that
last touched this file; `make hostcheck` and `tools/hostcheck.py --list
CATEGORY` give the current ones.

## Where things stand

`make hostcheck` (tools/hostcheck.py; CONTRIBUTING, "Host check") compiles
all 307 C files (`src/*.c`, `src/data/*.c`) with the host's clang and
`-DNONMATCHING=1` for x86_64-linux-gnu (ELF) and the host target
(arm64-apple-macosx: Mach-O), both LP64.  Every file compiles on both; the
objects are in `build/host/TRIPLE/`.  `make host` links the whole game
with the platform layer and runs it (see "Host link" below).

| | x86_64-linux-gnu | arm64-apple-macosx |
|---|---|---|
| before (854931c) | 9 files, 29 errors, 512 warnings | 304 files, 2,115 errors, 435 warnings |
| now | 0 errors, 405 warnings | 0 errors, 405 warnings |

Errors fixed:

* **Casts as lvalues** (GCC 2 extension; `anime.c`, `oam.c`,
  `eventcall_quakefx.c`, `banim-efxmagic-shine.c`): written as assignments.
  Six of them compile to the same bytes and are plain C now; the two OAM
  pointer increments (`*(u32 *)((u32 *)gOamHiPutIt)++ = ...`) keep the
  matching form under `#else` of `#if NONMATCHING`.
* **Section attributes** (15 section type conflicts from `CONST_DATA`
  putting const and non-const data in `.data`; Mach-O rejects every
  `SECTION()` name, 2,091 places): link sections only mean something to
  `fe7u.lds`/`data/layout.txt`, so `SECTION`, `CONST_DATA`, `EWRAM_DATA`,
  `IWRAM_DATA` and `EWRAM_OVERLAY` expand to nothing unless `PLATFORM_GBA`
  is set.  The Makefile passes `-DPLATFORM_GBA=1` to both GBA builds
  (matching and NONMATCHING).  Why a new macro and not `#ifdef __arm__`:
  the GBA builds are preprocessed with `-undef`, so no compiler macro is
  defined there at all, and a 32-bit ARM host (Linux on a Raspberry Pi)
  defines `__arm__` too.  Why not `NONMATCHING`: the NONMATCHING GBA build
  still needs the sections to link.
* **Function pointers in 32-bit `EventScr` initializers** (eventscr4.c,
  sio_event.c): `EventScr` is already `uintptr_t`; the errors came from
  agbcc's `<stdint.h>` (`uintptr_t` = `unsigned int`).  hostcheck uses
  clang's own freestanding `stdint.h`/`stddef.h`/`limits.h` (LP64 sizes)
  and agbcc's newlib headers only for `<stdlib.h>`/`<string.h>`.
* **`static` after `extern`** (hardware.c `MainFunc`, `gKeyStObj`): the
  header no longer declares them (only hardware.c uses them).
* **Implicit `memcpy`/`strcpy`/`strlen`** (an error for Apple clang):
  `global.h` includes `<string.h>` (same bytes).

## Host link

`make host` (tools/hostgame.py, `-j 4` by default) builds the whole game as
a native program, `build/host-game/fe7u` (arm64 macOS; the tools also know
ELF).  It needs the matching build first.  The program is the runtime's
(docs/port-platform.md): `build/host-game/fe7u --headless --input
tests/inputs/NAME.txt --dump-frames DIR --log FILE`, or a window.

**How far it runs** (`make hostrun`, tools/hostrun.py: every script
headless, no save file unless the script has an `sram` line; a crash prints
`fe7u: signal N in frame F`).  Every script runs to its last frame:

| script | frames | before the fixes below (frame of the crash) |
|---|---|---|
| opening | 19,600 | 19,600 |
| prologue | 12,850 | 7,450 |
| lyn | 8,418 | 8,418 |
| ch13 | 18,740 | 8,391 |
| actions | 18,250 | 12,702 |
| shops | 34,114 | 10,343 |
| hector | 15,266 | 9,973 |
| final | 13,298 | 10,385 |
| extras | 10,368 | 10,368 |

Pictures and sound (`make hosttest`, docs/port-platform.md, "Test against
mGBA"): on the opening and lyn, the checkpoints are mGBA's pictures pixel
for pixel (15 of 16 and 18 of 32; the rest differ by animation phase,
except the sprites of a ranged battle while its screen pans), found some
frames earlier on the host, which never lags.  The backgrounds that came
out black or garbled had two causes: gHostVram was not 0x20000-aligned
(the platform now aligns the video memories), and `ArchiveCurrentPalettes`
(bmlib.c) stepped through `struct PalFadeSt` by 24 halfwords, the GBA's
size, so every fade from the archive (`WriteFadedPaletteFromArchive`: the
save menu, the world map...) took palette N from 8·N bytes too far.  The
sound is the platform's (platform/audio.c): m4a's mixed buffer and the CGB
registers played as the GBA's hardware would.

**What is linked.**  Every `src/*.c` but `agb-sram.c` (platform/sram.c
replaces it), `src/data`, `src/events`, the generated `sound/*.c` and
`build/msg_table.c`, `platform/armfunc.c` (compiled like the game),
`src/host/hostglue.c` (below), the battle animations as C
(`tools/banim.py host`, `build/host-game/banim/banim_host.c`, ROM bytes, so
never committed), the data assembly, the RAM images and the runtime
(`PLATFORM_RUNTIME_SRC` + front end + `platform/main.c`).  symbols.ld's
aliases of C symbols (`MoveTable_Flying = TerrainTable_...`) are passed to
the linker as `-alias`; the ones of data labels become `.set` in the
converted assembly (`gFe6LinkMultiBootImageEnd = gFe6LinkMultiBootImage +
0x567C`).  No stubs are left: m4a is the C engine (`src/m4a.c`,
`src/m4a_1.c`, `src/m4a_mixer.c`), the crt0/libagb routines are the
runtime's.

**Data assembly (tools/hostasm.py).**  Each GBA assembly file is rewritten
line by line into one host file: `.include` inlined, `@` comments dropped,
every `.section .rodata.ADDR` becomes the host's read-only data section,
4-aligned and then `ADDR & 3` bytes in (so everything aligned on the GBA is
aligned on the host: sections of one file are contiguous on the host, while
C objects of data/layout.txt sit between them on the GBA), symbols get the
`_` prefix, `.align` is `.p2align`, and `.incbin` becomes `.byte` lines
(read once per file: LLVM's assembler maps the whole ROM again for every
`.incbin`, which took gigabytes per file).  A 4-byte word naming a symbol is
an error outside the music tracks (convert the object to C).  Objects whose
C type differs in size on a host but that hold no real pointer can be
re-laid out record by record (`RELAYOUT`: the 449 glyphs, `struct Glyph`,
whose `next` words are all NULL, become 0x50-byte host records).

**Track addresses (the m4a hook).**  In the music streams (sound/) the
GOTO / PATT / REPT / MEMACC / xWAVE words are written as `.long TARGET -
_gHostSoundBase`, the offset from a label at the start of the sound file's
data (one section, so the assembler computes it).  `M4aReadAddr`
(src/m4a_1.c) assembles the four bytes and calls `M4aHostRomAddr(u32)`,
which `src/host/hostglue.c` defines as `gHostSoundBase + value`.

**RAM symbols (tools/hostram.py).**  The ~510 EWRAM/IWRAM objects that only
symbols.ld names and the host objects use are laid out in two images,
`gHostRamEwram` and `gHostRamIwram` (build/host-game/ramsyms.s, zero-filled
`__bss`), one label per name.  Sizes: for each C file that refers to such
names, its preprocessed text gets `sizeof`/`__alignof__` probes appended and
is compiled for the host (clang) and for the GBA (agbcc, so agbcc's struct
rounding counts); an incomplete array gets its GBA size from the gap to the
next RAM symbol of fe7u.elf and its host size scaled by the element sizes.
Placement: host offset = f(GBA offset), f monotonic with f(x + d) >= f(x) +
d, an object that ends (on the GBA) before another starts ends before it on
the host too, and each name at the host's alignment.  So objects that
overlap on the GBA (the screens' overlays at 0x02000000, names inside a
bigger buffer) keep their distances unless something between them grew,
and objects that grew on the host (pointers) push the later ones up.
build/host-game/ramsyms.txt lists the layout and every name that moved
inside another (almost all are different screens sharing an overlay).
`RAM_ADDR(0x0203A98C)` (include/gbafe/global.h, with
`DECLARE_RAM_ADDR(0x0203A98C);` at file scope) names an unnamed RAM address
the code or a ROM table points at: the address on the GBA, `HostRam_0x...`
on a host, which hostram.py places at that address's place in the image.
The battle animation script buffers (`gBanimScrLeft` / `Right`,
`gOpInfoFrameBuf`) get twice their GBA size (`WIDENED`).  The start-up
clears reach the images: `sub_080009FC` clears EWRAM and then calls
`gHostEwramClearHook` (set by hostglue.c), and `AgbMain` calls
`HostClearRamIwram` after its IWRAM clear.  The game's own C variables are
ordinary host variables (zero at start, not cleared by a soft reset).
Raw EWRAM addresses cast in the code (`EWRAM_START + x`) still point into
the runtime's gHostEwram, not the image; none is left in src/ outside
`RAM_ADDR`.

**Host-only code in src/** (all `#if !PLATFORM_GBA` or `#if NONMATCHING`;
the GBA builds are unchanged):

* Hardware addresses: 246 VRAM / PLTT / OAM literals are the macros
  (`(VRAM + 0x17000)`; same constants on the GBA), `REG_BASE + 0x54` in
  scanline.c, `CART_SRAM` is `gHostSram`, the save block offsets are
  `SramAddrToOffset` (the GBA keeps the address's low 16 bits), two VRAM
  addresses held in `int`/`u32` are `uintptr_t`.
* `InitRamFuncs` points the `gRamFunc_*` at armfunc.c's C routines.
* Layouts: `struct Proc`'s host padding makes a slot 0xC8 bytes (MenuProc
  and WmSlotsProc are 0xC8 on a host and overran their slots; every struct
  that starts with `PROC_HEADER` now has its `PROC_SIZE_CHECK`, and all
  fit); new proc slots are zeroed
  (the GBA's leftovers are mostly zero, the host's are not); three structs
  that agbcc rounds to 4 bytes (`AiEscapePt`, `AiHealThreshold`,
  `EndingDefeatEnt`) get the padding on a host; `ProcEventMapLock` puts its
  two bytes at `EventProc`'s offsets (an ASMC's view of the event proc);
  the chapter goal is read by field, not at `+ 0x8E`;
  `ArchiveCurrentPalettes` steps by `sizeof(struct PalFadeSt)`, not 24
  halfwords; the heal-staff
  background TSA is strided in bytes, not in 4-byte pointers;
  `ANIMSCR_WIDE` is now defined on a host (it was only defined for the GBA,
  so a host compiled one-cell scripts with 8-byte cells);
  `NUM_MUSIC_PLAYERS`/`MAX_LINES` are constants (absolute symbols can't be
  addressed from position-independent code).
* Local views of a structure that holds pointers (the same size on the GBA,
  not on a host): the merchant position (`MERCHANT_X`, eventscr4.c, read at
  `ChapterInfo + 0x86`) is read by field, so Merlinus is no longer placed
  at row 59 of a 10-row map; the battle gauge's `EkrGaugeStruct1` (a view of
  `struct Anim` with `pSpriteData` at 0x3C) pads to the host's offset;
  banim-battleparse.c read `gSpellAssocData` through its own 16-byte
  `struct SpellAssocEnt` (the table is `struct SpellAssoc`, 24 bytes on a
  host, so the spell of every item after the first was wrong and a spell
  animation called into data): it uses `struct SpellAssoc` (same bytes on
  the GBA).
* Data after the end of a proc script: `gUnk_08CC4FA0`'s page number
  sprites are 9 objects stored after `gProcScr_PrepWMShopSell`'s `PROC_END`
  and addressed as halfwords 68-100 of it; with 16-byte proc commands on a
  host they are their own table, `gHostSprites_PrepPageNum`.
* RAM objects that follow each other on the GBA: the right side's battle
  animation sprite data, `gBanimOamr2`, is the 0x5800 bytes after
  `gBanimOaml` there, and `SwitchAISFrameDataFromBARoundType` computes it
  as `gBanimOaml + 0x5800`; on a host `gOpInfoFrameBuf`, an overlay inside
  `gBanimOaml`, is twice as big (`WIDENED`) and moves gBanimOamr2 up, so the
  right side drew sprites from the wrong buffer (garbage at the left edge,
  then a crash on an affine count read from it).  The host names the buffer.
* Prototypes that don't match the definition: eventscr4.c declared
  `StartTutorialCursors(int)`, but it takes the tutorial's cursor list (a
  pointer); on a host the upper half was lost.  (A plain C change; the
  GBA's code is the same.)  `tools/hostsigs.py` (`make hostsigs`) looks for
  more of this kind and for the struct views above: it compiles every C file
  to LLVM IR and reports calls whose argument or result is a pointer or
  64-bit value on one side and narrower on the other (implicit
  declarations, old-style prototypes, local prototypes), and `extern`
  declarations of a C object whose (element) size differs from the
  definition's where either holds a pointer.  Both lists are empty now.
* Timing: `SampleFreqSet` does not wait for VCOUNT 159 (the host's VCOUNT
  moves only between frames).
* Reads and writes through NULL that the GBA sends to the BIOS region
  (reads give open-bus values, writes are ignored), skipped on a host:
  `SyncHiOam` before the first `InitOam`, `ResetTextFont` with no font,
  `EndFace`, `GetFaceDisp`, `SetFaceBlinkControl` (no face / no eyes),
  `SetTalkFaceDisp`, `BmMapFill` and `RefreshUnitSprites` before the maps
  exist, `AnimDelete` of the last anim, the triangle attack palettes,
  `UnitMapUiUpdate` without a unit, `IsItemEffectiveAgainst` without a
  class, the packed unit / met-character writes of empty unit slots, and
  the save menu's read of a "PlaySt" at the slot number (always true),
  the support partner that isn't in the army (`GetUnitSupportUnit` gives
  NULL, and the unit list asks `CanUnitSupportNow` for every unit: count no
  supports), and an AI unit that died in its own battle (`MoveActiveUnit`
  reads its character number through NULL, and adds the move to that
  number's stats: skipped).
  More will turn up: each crash so far was a first use of such a path.
* Found with UBSan (`HOSTGAME_FLAGS=-fsanitize=undefined
  HOSTGAME_OUT=build/host-ubsan`, every script): only out-of-bounds indexes
  that read or write the neighbouring field or object, the same one on both
  (pathCosts[-1], a unit's ranks[255] of no weapon type, the unit list's
  20 entries in a u32[8], the cursor hand's 8 flags in u8[4], the shop's 21
  items in u16[20]), and divisions by zero (the line drawing in bmlib.c,
  the win percentage with no battles), which give 0 on both.  AddressSanitizer
  doesn't start on this Mac (Apple clang 15 on macOS 26: a CHECK in the
  runtime's malloc hook, even for an empty program).
* Data converted to C because the C type is wider on a host
  (tools/datac.py, data/layout.txt): `gUnk_08CE5378`, `ProcScr_DebugMonitor`
  (bmdebug.c), `PopupScr_AiPillage`, `gUnknown_085AA21C`, `gUnk_08BFFC9C`,
  `gUnk_08CEF770`, `gBattleTalkList`, `gTriangleAttackTalkList`,
  `gTextInitInfo_ChapterStatus`: pointer-width fields holding numbers, or
  RAM pointers, left as `.incbin` because no `.4byte SYMBOL` marked them.

**Requests to the platform layer**, done (docs/port-platform.md):

* The memories' alignment: VRAM on 0x20000, palette and OAM on 0x400, as
  pointers into one aligned mapping (a static array can't be aligned past
  16 KB on macOS: `aligned(0x20000)` on an array gave an address 0x4000
  past a boundary, which moved every screen block the game computed).
  `gHostSram` stays a 16-aligned array: `gSramMain = CART_SRAM` needs a
  link-time address, and the save block offsets are differences
  (`SramAddrToOffset`), so no SRAM address bits are used.
* Audio: the platform reads the part of `gSoundInfo.pcmBuffer` the DMA
  plays each frame (through `SOUND_INFO_PTR`) and the CGB registers.

## Compiler and ABI requirements

* **`-funsigned-char`.**  `char` is unsigned on the GBA (ARM ABI) and the
  text code depends on it: `msg.c:69,175`, `cgtext.c:150` compare a `char`
  with 128, and `cgtext.c`, `helpbox.c`, `talk.c` switch on a `char` with
  `case 0x80`/`0x81` (control codes).  x86-64 and Apple arm64 make `char`
  signed; with it those cases are dead.  hostcheck passes the flag.
* **Text encoding.**  The GBA build pipes every C file through
  `iconv -f UTF-8 -t CP932` (Japanese strings in the source become Shift
  JIS bytes).  hostcheck compiles the UTF-8 source as is.  A port must
  convert the same way (clang has no `-fexec-charset` for CP932; compiling
  the iconv output works, with `-Wno-invalid-source-encoding`).
* **gnu89.**  Implicit int, old-style declarations (`StartEvent` is called
  without a prototype in 28 places; `SetTradeMenuTutStatus4` and
  `Minimap_ApplyViewportFlashColor` get an extra argument), statement
  expressions.  Harmless with the default argument promotions as long as
  no pointer is passed where the callee takes an `int` (none found by the
  warnings), but prototypes everywhere would be safer.
* **Little-endian** is assumed throughout (halfword views of words:
  `EVT_CMD_ARGV`, OAM words, packed script words).  Every PC target is
  little-endian.

## 1. Data that is still GBA-format assembly

The C tables (`src/data/*.c`, `CONST_DATA` in modules) compile natively,
pointers and all.  Everything else in the data region is assembled for the
GBA and needs either a conversion to C or a loader; this is the biggest
port design question.

| Source | What | Pointer words |
|---|---|---|
| `data/rom/*.s` | tables, graphics, maps, scripts not yet in C (`tools/datasplit.py`, `tools/dataptrs.py`) | 13,747 `.4byte SYMBOL` + raw `.incbin` chunks (14,432) |
| `src/events/*.c` | chapter event lists and event scripts (`include/event_macros.h`) | C: `EventScr`/`EventListScr` word arrays (`uintptr_t`), pointers as symbols |
| `sound/` | m4a songs, voice groups, samples (`tools/m4adis.py`) | 5,111, including 2,537 unaligned ones in track data |
| `banim/` | battle animation scripts (`tools/banim.py`) | 25,329 sheet pointers inside LZ77-compressed scripts; `BANIM_SHEET_INDEX` makes them indices into `gBanimSheets[]` (docs/port-data.md) |
| `build/msg_bits.s` (bytes), `build/msg_table.c` | Huffman text, `gMsgTable` | done: the table is C (docs/port-data.md, "Music and text") |

Every pointer word is 4 bytes and every structure is laid out for 4-byte
pointers.  The sources already say which words are pointers (symbols) and
where each object starts (labels), so the information for a conversion
exists.  Options:

* **Convert to C** (or to a relocatable blob with 8-byte pointer slots):
  tools that emit C initializers from the structure the tools already know.
  Needs a C type for every structure (many are only known as byte ranges),
  and scripts that are word streams (event scripts, AnimScr, proc-like
  tables in data) must become `uintptr_t` streams, which changes every
  offset computed in words (see section 2).
* **Loader with 32-bit addresses**: keep the data image as built (e.g.
  `fe7u_modern.gba`'s data region) and translate ROM addresses at the few
  places code reads a pointer out of data.  There are thousands of such
  places (every `->field` of a struct in ROM that holds a pointer), so this
  only works with a translation hidden in the types.
* **32-bit host process**: build for i386 or armv7 Linux and map ROM, EWRAM,
  IWRAM and VRAM at their GBA addresses (`mmap(MAP_FIXED)`); then every
  4-byte pointer and every cast below just works.  Not possible on macOS
  (no 32-bit processes; arm64 reserves the low 4 GiB) or Windows on ARM.

## 2. Pointers kept in 32-bit words

Fixed (same types on the GBA, so no byte changes): `EventScr` (was
already `uintptr_t`), `struct PopupInstruction.data`,
`struct CallDelayedProc.arg` and `CallDelayedArg`'s callbacks,
`struct ProcLordSelect.unk_4C` / `GetClassReelEntry` / `StartClassNameIntro`
/ `StartClassAnimDisplay` (class reel entry pointer), proc parents that
are a tree index (`proc.c`, `event-engine.c:1059`), `sub_080BD1DC`'s palette
argument, the sprite data offset in `anime.c`, `move-data.c`'s fill value
kept in the `src` pointer, the snowstorm/thunder event commands reading
their arguments as `u32`, and `proc.c`'s `sub_08004CC4` (proc pool size
0x1A94 hard-coded: plain version uses `PROC_COUNT`).

**Event readers, fixed** (an event cell, `EventScr`/`EventListScr`, is 8
bytes on a 64-bit host; a cell packs a command's non-pointer fields in its
low 32 bits, see `EVP` in `include/event_macros.h`, and an address is a
whole cell).  The matching build is byte-identical:

* `struct EventInfo` (now in `gbafe/event.h`, shared with
  prep_sallycursor.c, which had its own copy) has `EventListScr const *
  listScript` and an `EventScr script`, so `listScript += length` steps in
  cells; `struct TutorialEventEnt` and the `EvList_*` externs are
  `EventListScr`; the `EvCheck*` structs are made of `EventListScr`,
  `EventScr` and function pointer fields (so `EVT_CMD_B*` on their words
  read the low 32 bits of the right cell), and `EvCheck07`'s item / money
  halves and `EvCheck0E_Area`'s command / flag halves are taken from a cell
  with `EVT_CMD_LO/HI`.  `BattleTalkExtEnt.event` and
  `DefeatTalkExtEnt.event` are `uintptr_t`.
* the chapter event group is read as `struct ChapterEventGroup`
  (`group->initialUnits[i]`, `group->playerUnits[i]` in `sub_08079214` and
  `sub_08079280`, instead of `group[0x18 / 4]`); prep_sallycursor.c
  (`info.script` as a shop list pointer) follows from the shared struct.
* halfword arguments: `EVT_HALF(script, k)` (event.h) is halfword `k` of
  the command at `script` (0 = the command id), i.e. half `k & 1` of cell
  `k / 2`; `EVT_ARG_U16` (eventscr4.c, eventscr_browntextbox.c) and the
  `((u16 const *) script)[n]` reads in eventscr4.c use it.  The matching
  build keeps the `u16 *` view (`#else` of `#if NONMATCHING`) because it
  compiles to `ldrh`.  `EVT_CMD_ARGV` is only used by the matching form of
  `EventE8_StartSpriteAnim`.
* `EvtCmd_TalkGeneric` / `TalkMoreGeneric` / `TalkByTactRank`
  (eventscr.c) indexed a message list, a `const u32 []` in `src/events/`,
  as `EventScr []`; it is `u32 const *` now.
* `make hostevents` (`tools/hostevents.py`, `tests/host/events.c`) links
  the host build of eventinfo.c with the converted chapter data and event
  lists and compares, for all 66 chapters, the entries of the four event
  lists (`gEventListCmdInfoTable` lengths, the data cells) and the answers
  of `SearchAvailableEvent` (location and misc lists) with a walk of the
  same lists as 4-byte words in the built ROM.  It also checks
  `EVT_HALF`.  Passing with 0 differences; it fails, for example, if an
  `EvCheck*` struct goes back to `u32` fields.

Left in the event code: `*(u16 const *) proc->script` (event-engine.c,
the command id in the low half of cell 0, right on a little-endian host).

Left, with the reason (file:line of each cast; `--list` the
`int-to-pointer-cast`, `int-to-void-pointer-cast`, `pointer-to-int-cast`
and `void-pointer-to-int-cast` categories for the current list):

* **AnimScr** (`typedef u32 AnimScr`, anime.h): tagged pointers, the top
  nibble is the instruction (`ANINS_PTRINS_GET_ADDRESS` masks
  `0xF0000000`, `ANIMSCR_FORCE_SPRITE` adds a duration in the low bits).
  Needs a different encoding (e.g. two words per pointer instruction).
  anime.c:193,197,198,277,280,292; banim-efxutils.c:648;
  banim-mainutils.c:4.  The battle animation scripts' `0x86NNDDDD SHEET OAM`
  frames (`banim/`) had the same problem inside compressed data; there the
  word is a sheet index on a host (`BANIM_SHEET_INDEX`, docs/port-data.md).
* **m4a sound driver**: done.  The NONMATCHING build uses the engine in
  C (`src/m4a_1.c`: `SoundMain`, the channel envelopes, `MPlayMain`, every
  `ply_*` command, notes, CGB channels; `src/m4a_mixer.c`: the mixer's
  loops, including reverb), with typed fields (`SoundInfo.func/intp/
  MPlayJumpTable/plynote/ExtVolPit`, `CgbChannel.wp/cp/tp/pp/np`,
  `SoundChannel.cp/pp/np` are pointers now) and no byte offsets; the
  matching build still assembles `asm/m4a_1.s`.  Stored addresses in track
  data go through `M4aReadAddr` (port-data.md, "Music and text").  On a
  host, platform/audio.c plays the DirectSound buffer (the part the DMA
  plays each frame, from `pcmDmaCounter`, instead of emulating timer 0 and
  DMA 1/2) and the CGB registers `CgbSound` leaves; `M4aHostRomAddr` is
  src/host/hostglue.c's.  On the GBA the loops run from IWRAM
  (`SoundMainRAM_Buffer`, 0x400 bytes, which they almost fill); a host
  calls them in place (`MIXER()` in `src/m4a_1.c`).
* **SRAM access** (agb-sram.c:32,45,47,53,57,59,65): copies its own Thumb
  code to RAM and calls it (`+ 1` for the Thumb bit).  Replaced by a save
  file layer.
* **Mixed tables**: `EfxQuakePureVecs` (banim-efxbattle.c:104) stores ints
  in `const void *` slots (fine on a host, just a cast).

## 3. Hardware

* **Registers**: 347 uses of 95 `REG_*` macros (`include/gba/io_reg.h`,
  absolute addresses at 0x04000000), plus `gDispIo` (the shadow copy
  hardware.c writes to the registers each frame).  The platform layer
  provides them as memory it reads after each frame, or as functions.
  `sio_multiboot.c:108,120,159,184,197,231,259,404,425` (`REG_SIOMULTI(i)`
  computes a register address from an `int`).
* **VRAM, palette, OAM as integers**: `VRAM` (0x6000000), `PLTT`, `OAM` and
  `BG_CHAR_ADDR` etc. are integer constants (`include/gba/defines.h`); the
  code adds offsets and casts to a pointer (292 uses of the macros, 251
  literal 0x05xxxxxx-0x07xxxxxx addresses, e.g. `(void *)(0x06010000 +
  chr)`), and turns VRAM pointers back into tile numbers
  (`((u32)vram << 0x11) >> 0x16`).  Making `VRAM` etc. `(uintptr_t)
  gHostVram` covers the macro uses; the literals need replacing.  Casts
  flagged now: banim-efxop.c:195,213; bmlib.c:248,264,1897,1900,1903,1906;
  bmshop.c:916; cg.c:290,295; ending_details.c:1491,1528,1589;
  epilogue.c:505,534; eventscr_browntextbox.c:211,226;
  face.c:365,372,554,570,1258; fe6link.c:127,136; hardware.c:241,342,796;
  helpbox.c:263,290,895,978; main.c:16 (IWRAM clear); minimap.c:567;
  opanim.c:1505,1608; opinfo.c:703,707; prep_bgscroll.c:96,105;
  prep_itemsupply.c:125,126; prep_menuscroll.c:421;
  savemenu_modeselect.c:685; sio_bat.c:884; sio_postbattle.c:262;
  sio_result.c:124,275; sio_rulesettings.c:87; soundroom.c:1120;
  spinning_arrow.c:166,169; sysutil.c:1422,1431; text.c:69,300;
  unit-sprite.c:286-287,303-306,322-325; worldmap.c:329,664,2202,2254,
  2307,2308.  Casts of constants don't warn, so there are more.
* **BIOS calls** (`include/gba/syscall.h`, `asm/libagb.s`): `CpuSet`,
  `CpuFastSet`, LZ77/RL decompression, `Div`, `Sqrt`, `ArcTan2`,
  `BgAffineSet`/`ObjAffineSet`, `SoftReset`, `VBlankIntrWait`... need C
  versions (done: `platform/bios.c`, see `docs/port-platform.md`, which
  also has the renderer for the picture).  DMA (`DmaCopy*`, `DmaFill*`)
  likewise.
* **Interrupts and timing**: `irq.c` (VBlank/HBlank/serial handlers),
  code copied to IWRAM (`ramfunc.c`, `sub_...` routines run from RAM), the
  main loop waiting for VBlank (`main.c`).
* **Link cable, multiboot, FE6 link** (`sio_*.c`, `fe6link.c`,
  `gFe6LinkMultiBootImage`): no PC equivalent; stub out.
* **Save memory**: SRAM layout in `save_core.c`/`bmsave.c`; maps to a file.

## 4. Fixed RAM addresses

* `symbols.ld` defines about 500 RAM symbols by address (378 in EWRAM,
  120 in IWRAM) that no C file defines yet; a host build needs C definitions
  (types from the headers, sizes from the gaps).
* C data initialized with RAM addresses: `gpPathArrowProc`
  (bmpatharrowdisp.c:14, 0x0203A878), `gpShopSellStringBuffer`
  (prep_itemsell.c:12) and `gpPrepItemSupplyStringBuffer`
  (prep_itemsupply.c:29, both 0x0200E68C), `gSioSt` (sio_main.c:4,
  0x0203A98C), the buffer table at savemenu_modeselect.c:70-90.  They point
  into other objects' RAM or into unnamed buffers.
* `EWRAM_OVERLAY(id)` variables (prepscreen.c, bmio.c, bmfx-chapterintrofx.c,
  opanim_scanline.c, savemenu.c, savemenu_tactician.c, titlescreen.c) share
  memory on the GBA; on a host they are separate variables.  Code that
  relies on the sharing (one screen reading what another left) would break;
  none is known.
* **The proc pool** (`struct Proc`, 0x6C bytes on the GBA, `PROC_COUNT` 64):
  every proc struct is allocated in a `struct Proc` slot, so each must fit
  in `sizeof(struct Proc)`.  With 8-byte pointers the header grows from 0x29
  to 0x4D bytes and the fixed-size fields after it (`STRUCT_PAD(from, to)`
  gives the GBA gap, not an offset) push procs past the slot.  Done: all 133
  distinct proc structs (136 definitions, everything that uses `PROC_HEADER`)
  have a `PROC_SIZE_CHECK(struct X);` after them (proc.h), a compile-time
  error if the struct is bigger than `struct Proc`, on the GBA and on the
  host.  Measured with clang on LP64 (x86_64-linux-gnu and arm64-apple-macosx
  agree): `struct Proc` is 0x98 bytes without padding, the largest procs are
  `ProcEkrDragon` and `ProcPrepMenu` (0xB8), then `ProcEkrDragonFx` and
  `ProcNinianAppear` (0xA8), the `ProcEfx*` family (0xA0).  On the host
  `struct Proc` ends with `u8 hostPad[0x28]`, so a slot is 0xC0 bytes
  (`sProcArray` is `PROC_COUNT` of them; a host defines it, `symbols.ld`
  only does on the GBA).  On the GBA nothing changes (`PLATFORM_GBA`).  A new
  proc that doesn't fit stops the host build (or, if the GBA slot is the
  problem, the GBA build): raise `hostPad`.
* **Size checks.**  `GBA_SIZE_CHECK(struct X, 0x24);` (include/gba/types.h)
  follows the definition of every structure that is laid out in ROM data or
  save data, the m4a and hardware structures, and a few RAM ones assumed by
  offset (`Unit`, `BattleUnit`, `BmSt`, `PlaySt`, `Proc`): 152 checks, sizes
  taken from the GBA build (ROM table strides).  Active only with
  `PLATFORM_GBA`: an edit that changes a GBA layout stops the GBA build.
  `SAVE_SIZE_CHECK(struct X, N);` is the same but active everywhere, for
  structures written to SRAM as they are; all 18 pass on both host targets,
  so bit-fields and `__attribute__((packed))` lay out the same in clang
  (see "Save data").  The macro is an `extern char [cond ? 1 : -1]`
  declaration: C89, agbcc and clang, no code, may repeat.  Note that
  `make` does not track header dependencies: after adding a check to a
  header, `rm -rf build/src` to see it fail.
* **Offsets and sizes written as numbers**: `/* 2C */` comments and
  `STRUCT_PAD` describe the GBA layout only.  The GBA layouts of ROM tables
  are what the size checks pin; whether the *host* layout of a table struct
  matches is the data conversion's business (port-data.md), not the code's.

### Copies with literal sizes

Audit of every `CpuCopy16/32`, `CpuFastCopy`, `CpuFill16/32`,
`CpuFastFill(16)`, `CpuSet`, `CpuFastSet`, `CPU_FILL`, `DmaFill32`,
`memcpy`, `memset` call in `src/` (tools: a call scanner over `src/*.c`
and `src/data/*.c`; 401 hits, 12 of them macro definitions and prototypes,
so 389 calls).  93 of the 389 have a `sizeof` size, 203 a plain number, 93
a variable, a count times a size or a named constant (`PLTT_SIZE`,
`CHR_SIZE`).  A copy is wrong on a host only if the memory holds a pointer
or a struct that contains one: the classification is by what the
source and destination hold.

| Class | Calls | Verdict |
|---|---|---|
| palettes, tile maps, character data, OAM, VRAM/PLTT/OAM addresses, BG buffers (`gPal`, `gBg0Tm`, `PAL_OBJ(..)`, `(void *)0x06008000`, `gEfxPal`, `sOamHi.buf` x 8, ...) | 270 | fine as is |
| other data with no pointers: `sizeof` of the object's own type (`Unit`, `PlaySt`, `BmSt`, `Trap` lists, save-block chunks), byte and halfword tables (`gArenaBaseWeapons`, rank thresholds, `sFactionUnitCountLut`, sio title strings), bit flag arrays (`soundroom` flags, `unitFlags`), the bonus claim blob (`0x284` bytes: 32 `BonusClaimEnt` of 0x14 and 4 more), `SupportScreenUnit` (0xC00, bytes only), `PrepScreenItemListEnt` (`0x190` words, u8/u8/u16), VectorBmfx tables | 114 | fine as is (a `sizeof` follows the host type; the literal ones have no pointers) |
| struct with a pointer, literal size | 1 | fixed |
| literal size of a pointer-free struct or array where `sizeof` is clearer | 4 | changed to `sizeof` (same bytes) |

Fixed:

| Where | Was | Now | Why |
|---|---|---|---|
| epilogue.c `InitEpilogueEntries` | `CpuFill16(0, ent, 0xB4)` | `15 * sizeof(struct EpilogueEnt)` | `EpilogueEnt` has an `info` pointer: 0xC bytes on the GBA, 0x10 on the host |
| bmsave-lib.c `LoadRankData` | `CpuFill16(0, buf, 0x18)` | `sizeof(struct GameRankSaveData)` | tidy, same on both |
| danceringfx.c, lightrunefx.c, bmfx_08020AD0.c | `memcpy(buf, Vectors_.., 0x38/0x34)` | `sizeof(buf)` | 14 / 13 `VectorBmfx` (2 x s16) |

The build is byte-identical (the compiler folds the products).  Left, and
worth knowing: `main.c:16` clears IWRAM (`0x7F80` from `IWRAM_START`) and
`irq.c:15`/`ramfunc.c:23` copy code to RAM: platform layer.  `oam.c`
multiplies a count by 8 (an `OamData`, no pointers).  The pointer-bearing
tables that are copied whole are copied by `sizeof` of their own arrays
(`opinfo.c:714` `hack.hack_2d`, `sio_bat.c` `hack`).  Copies of the RAM
buffers whose *address* is a literal (`gpEpilogueEnts`, `gpBonusClaimData`,
`sSupportScreenUnits`, section 4 above) need those buffers allocated on the
host with the sizes above (15 x `EpilogueEnt`, 0x284, 0xC00).

### Save data

`bmsave*.c`/`save_core.c` write RAM structures to SRAM byte for byte with
`WriteAndVerifySramFast(&obj, dest, sizeof(obj))`, `WriteSramFast(...)` and
`ReadSramFast(...)`, where `dest` is `gSramMain` (`CART_SRAM`, 0x0E000000,
`CART_SRAM_SIZE` 0x8000) plus a struct member or a hard-coded offset
(`GetSaveWriteAddr`: 0x3F2C, 0x4CB8, 0x5A44, 0x00D4, 0x2000, 0x67D0; the
extra-map block at the end; the misc data at `SRAM_OFFSET_*`).  Findings:

* **Layout.**  `GlobalSaveInfo`, `SaveBlockInfo`, `PlaySt`, `Trap`,
  `GameSavePackedUnit` (packed), `SuspendSavePackedUnit`, `GameSaveBlock`,
  `GameRank*`, `Fe6LinkSaveInfo`, `SoundRoomSaveData`, `LinkArenaSaveData2`,
  `PidStats`, `ChapterStats`, `MultiArena*` contain no pointers and
  `SAVE_SIZE_CHECK` proves clang gives them the GBA size on both host
  targets (bit-fields included).  The chunk positions stored in
  `SaveBlockInfo.offset` are offsets from the start of SRAM, so they are
  portable.  Units are not written as `struct Unit` (which has pointers)
  but encoded field by field into the packed formats
  (`WriteGameSavePackedUnit`, `EncodeSuspendSavePackedUnit`), so no pointer
  reaches the save.
* **One exception: `struct Action`** (0x1C bytes, `action.h`) is written raw
  into the suspend save (`dest->action`, bmsave.c `WriteSuspendSave` /
  `ReadSuspendSave`) by the matching build, and its last member is a
  pointer, `battle_scr` (a `BattleHit *`, set for the duration of a
  scripted fight or by `FIGHT_OVERRIDE` for the next battle).  It only ever
  points at one of the 21 `const struct BattleHit BattleScr_*[]` arrays of
  `src/events/` (from `FIGHT` and `FIGHT_OVERRIDE`) or is NULL.  On a host
  `sizeof(struct Action)` is 0x20, so a raw write would shift everything
  after it, and the pointer is meaningless in the next run.  **Done:**
  under `NONMATCHING` the save's field is `u8 action[0x1C]`
  (`SuspendSaveBlock` then has `SAVE_SIZE_CHECK`), and
  `EncodeSuspendAction` / `DecodeSuspendAction` (bmsave.c) write the GBA
  layout: the fields before `battle_scr` as they are (u16s and u8s, the
  same bytes on any little-endian host), then `battle_scr` as a
  little-endian word holding the **retail ROM address** of its array
  (which the arrays' names carry: `BattleScr_08CA85DC` is 0x08CA85DC), 0
  for NULL.  An unknown value reads back as NULL.  So a suspend save has
  the retail bytes on the GBA NONMATCHING build and on a host, and a real
  cartridge's `.sav` loads.  The lookup is a chain of comparisons (an
  X-macro list, `BATTLE_SCRS` in bmsave.c), not a table: the layout keeps
  no `.rodata` of bmsave.o.  A new scripted battle array needs an entry
  there.  Checked with `actions.txt` (suspend and Resume Chapter): the
  NONMATCHING build against one with the raw write has the same picture
  in every frame.  `GBA_SIZE_CHECK` still guards `Action` itself.
* **The SRAM itself.**  `gSramMain` is initialized with the integer address
  0x0E000000 (`save_core.c`); the host needs a 32 KiB buffer, loaded from and
  written to a file, at that variable, and `SRAM_XMAP_ADDR` (end of SRAM)
  computed from it.  `agb-sram.c` copies its own Thumb code to RAM
  (`SetSramFastFunc`) and reads/writes byte by byte with `REG_WAITCNT`
  tweaks: replace the whole file by `memcpy` on the buffer (plus a flush to
  the file after each `Write*`); `VerifySramFast` returns the address of the
  first mismatch, 0 if equal.  `SramInit` probes the SRAM with a test
  pattern at `gSramMain + 0x73B8`.
* **Checksums** (`Checksum16`, `SramChecksum32`) read halfwords and words
  in place, so they are little-endian and unchanged; they cover the same
  bytes as long as the chunks have the GBA sizes above.
* **Nothing else needs a redesign**: no save structure holds a code pointer
  or a RAM address except `Action.battle_scr`.  A save file from the GBA
  (`.sav`) then loads unchanged, provided `Action` is converted.

## 5. Original bugs the warnings revealed

The matching build keeps them; each plain version (`#if NONMATCHING`)
does what the ROM does, spelled out, so a port can decide.

* Missing return values whose result is used (the ROM returns whatever r0
  held):
  * `AiEquipGetFlags` (cp_0803E2F4.c): 2 if the unit has five items, else
    the address of its first empty item slot cut to `s8`.  That is 0 for a
    one-item unit at `gUnitArrayRed[4]` or `[36]` (also Blue 2, 34, Green
    18), and then the AI doesn't re-equip before attacking
    (`CpPerform_EquipBest`).  The intent is surely `TRUE`.
  * `sub_080100D0` (event command 0xD4, eventscr4.c): returns the event
    flags as an `EVENT_CMDRET` value (`EVENT_FLAG_UNITCAM` alone = JUMPED
    would re-run the command forever).
  * `EventEA_StartMixPalette` (eventscr_spriteanim.c): returns a code
    address (StartMixPalette's return address): CONTINUE in effect.
  * `EventE8_StartSpriteAnim` returns the proc pointer (CONTINUE in
    effect; `BUGFIX` already had `YIELD`), and `EventE9_EndEventSpriteAnim`
    returns `Proc_End`'s leftover r0 (not changed: unknown value).
  * `GetMinimapBridgeKindAt` (minimap.c): a bridge not next to a lake gets
    the terrain id of the tile above as its minimap tile kind.
  * `GetFaceBlinkInterval` (face.c): blink kind 0 (or above 5) gives
    `blink - 1`.
  * `ArenaGetUpgradedWeapon` (bmarena.c): an item not in the upgrade list
    gives 0xFF.
  * `sub_08044BF0` (sio_battlemap.c): a unit not found gives the last
    byte of the table.
  * `NewEkrDragonBg2ScrollHandler`, `NewEkrDragonFxMain` (banim-ekrdragonfx.c),
    `NewTargetSelection_Specialized` (uiselecttarget.c) return the proc
    they start: now written out (same bytes).
* `GetChapterTitleName` (chapterdata.c:27) passes the *address* of the
  chapter's title message ids to `DecodeMsg` (FE7U added `unk74[2]` and
  this function wasn't updated).  Unused.
* `PrepItemTrade_Init` (prep_itemtrade.c) calls
  `InitBgs(*gBgConfig_PrepScreen)`: the config's first halfword (0, i.e.
  NULL: the default layout) instead of the config.
* `EventLoadUnitFromDef` passes its `int` flag as the `struct EventProc *`
  of `LoadUnitCore` (only ever called with 0).
* `COS_Q12`/`SIN_Q12` read `gSinLut[0x40 .. 0x13F]`, past the 0x40-entry
  array into `gCosLut`, which only works because the two are adjacent.  The
  plain build makes them one array; `gSinLut` is declared without a size.
* `hack.hack_4d[0][i][1][-1]` in opinfo.c's class reel (a FAKEMATCH that
  indexes out of range to reach `hack_2d[0][i]`): plain version indexes
  directly.
* `CpuFastFill16(-1, ...)`/`(0x001F001F, ...)` shifted signed values
  (undefined in C): the macro shifts `u32` now (same bytes).

Missing returns that don't matter (the result is ignored, or the
fall-through can't happen) are left as they are: the menu and target
selection callbacks for draw, switch in/out, help box, init and end
(bmmenu.c, bmitemuse.c, uimenu.c, convoymenu.c, sio_menudef.c,
bmdebug.c), `PROC_CALL` routines (bmmind.c:172, bmusemind.c:191),
statement calls (bmtrade.c:479, bmtrick.c:78,573, cp_battle.c:198,289,
sio_uiutils.c:988, spinning_arrow.c:177, unit.c:801), and switches over
every possible value (bksel.c:321, bm.c:1028, bmarena.c:217,
hardware.c:207, player_interface.c:223, sysutil.c:1642,1659,
unit-sprite.c:475, bmpatharrowdisp.c:256,269, bmsave-bwl.c:536,
support.c:256 (`BUGFIX`: NULL)).  On a host they are only undefined if
reached; adding `return 0` where the ROM's r0 is irrelevant is safe.

## 6. Warnings left (hostcheck, both targets)

| Category | Count | What |
|---|---|---|
| `-Wpointer-sign` | 143 | `char *` vs `u8 *` for text; harmless |
| `-Wint-to-void-pointer-cast`, `-Wint-to-pointer-cast`, `-Wpointer-to-int-cast`, `-Wvoid-pointer-to-int-cast` | 142 | sections 2 and 3 |
| `-Wreturn-type` | 63 | section 5, the harmless ones |
| `-Wdeprecated-non-prototype` | 48 | unprototyped `StartEvent` and two others |
| `-Wtautological-compare` | 4 | `talk.c:807,850,867` (`str == str`, a no-op kept for matching), `bmdebug.c:273` (compares two arrays: always false in the ROM too) |
| too many arguments | 2 | bmtrade.c:615, minimap.c:1053 (extra argument ignored) |
| `-Wswitch` | 1 | mu.c:952 `case MOVE_CMD_END` (-1) on a `u8`: never taken, in the ROM as well |
| `-Wpointer-bool-conversion` | 1 | helpbox.c:977 `if (&vram_dst)`: always true, as in the ROM |
| `-Wmacro-redefined` | 1 | cp_utility.c `ITEM_INDEX` |
