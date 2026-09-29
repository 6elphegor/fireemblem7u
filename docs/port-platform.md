# Host platform layer

The native port's platform layer, in `platform/`: the GBA BIOS calls in C,
a scanline renderer for the GBA picture, and the runtime around them (the
GBA's memories as host arrays, DMA, interrupt dispatch, the frame loop,
save memory, audio output, an SDL2 front end and a headless mode).  It is
host-only C, built with the host's compiler, and not part of the GBA
builds.  The game doesn't link on the host yet (the host-link work,
docs/port-data.md); `platform/demo.c` stands in for it and exercises the
runtime the way the game does.  Status as of 2026-09-29.

| File | What |
|---|---|
| `platform/bios.c`, `bios.h` | every BIOS call `include/gba/syscall.h` declares and the game makes, plus `ArcTan`, `DivArm`, `Halt`, `IntrWait` |
| `platform/ppu.c`, `ppu.h` | the renderer: registers, palette, VRAM and OAM in, a 240x160 RGB frame out |
| `include/gba/host.h` | what the game sees of the runtime: the memories, `HostDmaSet`, audio |
| `platform/platform.h` | the runtime's internal interface |
| `platform/memory.c` | `gHostIo`, `gHostPltt`, `gHostVram`, `gHostOam`, `gHostEwram`, `gHostIwram`, `gHostSram`; DMA |
| `platform/irq.c` | interrupt dispatch (crt0.s's `IntrMain` in C) |
| `platform/host.c` | power-on, the frame loop (the `VBlankIntrWait` hook), the command line, `HostMain` |
| `platform/input.c` | emutest input scripts and plans for headless runs |
| `platform/sram.c` | save memory backed by a file; the host version of `src/agb-sram.c` |
| `platform/frontend_sdl.c`, `frontend_null.c` | the SDL2 window, keyboard and audio device; the stub without SDL2 (headless only) |
| `platform/png.c` | PNG dumps of frames |
| `platform/armfunc.c` | the ARM routines of `asm/crt0.s` and the veneers of `asm/veneers.s` in C (compiled like the game's C) |
| `platform/main.c` | `main()` for the game: `HostMain` |
| `platform/demo.c` | the runtime without the game: a scene, HBlank/VCount/VBlank handlers, DMA, audio |
| `platform/tests/` | unit tests (`test_bios`, `test_ppu`, `test_input`) and `test_lz77` (every LZ77 blob of the ROM) |
| `platform/tools/biosref.c` | BIOS calls against mGBA's HLE BIOS |
| `platform/tools/ppucapture.c`, `ppucompare.py`, `ppurender.c` | the renderer against mGBA on the runtime test scripts; dumps |
| `platform/platform.mk` | build rules (called from the main Makefile) |

## Running the tests

```sh
make                       # the matching build first (test_lz77 reads build/graphics/)
make platform-test         # test_bios, test_ppu, test_lz77, test_input, the demo headless: no mGBA needed
make platform-demo         # the demo in a window (SDL2; Esc quits)
make platform-biosref      # BIOS calls vs mGBA's HLE BIOS (libmgba)
make platform-ppucompare   # renderer vs mGBA, every frame of tests/inputs/*.txt (~15 min)
python3 platform/tools/ppucompare.py tests/inputs/opening.txt --every 10   # one script, sampled
```

`biosref` and `ppucapture` link libmgba like `tools/emutest.c` (Homebrew's
`mgba`; `platform.mk` sets `DYLD_FALLBACK_LIBRARY_PATH` for the keg-only
`ffmpeg@N` the bottle may want, see CONTRIBUTING, "Runtime test").  Nothing
ROM-derived is committed: the tests read `baserom.gba`, `data/graphics.txt`
and the build's extracted graphics at run time, and all output (PNGs, dumps)
goes to `build/platform/`.

## BIOS (`platform/bios.c`)

Same names and prototypes as `include/gba/syscall.h`, so the game's calls
link to them unchanged.  Pointers are host pointers; where the BIOS ignores
low address bits (word and halfword transfers, compressed-data headers), so
does this code, and memory is accessed bytewise (no alignment or aliasing
assumptions).

| Call | Notes |
|---|---|
| `CpuSet`, `CpuFastSet` | 21-bit counts; `CpuFastSet` rounds up to 8 words, like the BIOS |
| `LZ77UnCompWram/Vram`, `RLUnCompWram/Vram`, `HuffUnComp` | the `Vram` variants write halfwords: a back-reference to the byte still waiting for its pair reads the old memory, a final odd byte is not written; RL pads to 4 bytes with zeros; a last LZ77 copy that runs past the size is completed (all as mGBA) |
| `Div`, `DivRem`, `DivArm`, `DivArmRem` | truncating; division by zero returns +-1 and the numerator (the BIOS hangs) |
| `Sqrt`, `ArcTan`, `ArcTan2` | the BIOS's own algorithms (iterative root; the odd polynomial in 14-bit steps with arithmetic shifts) |
| `BgAffineSet`, `ObjAffineSet` | the BIOS's integer method with its 256-entry sine table (from the open-source Cult-of-GBA BIOS's reading of the original); only the top 8 bits of the angle count |
| `RegisterRamReset` | clears the regions in `gBiosMemory` (IWRAM without its top 0x200 bytes) and resets the registers in its `io` block |
| `VBlankIntrWait`, `IntrWait`, `Halt`, `Stop`, `SoftReset` | call the hooks in `gBiosHooks` (the host main loop's); without hooks the waits return and `SoftReset` aborts |
| `SoundBiasReset/Set`, `MultiBoot` | no-ops; `MultiBoot` fails (no link cable) |

Not provided: `MidiKey2Freq` (the game has its own `MidiKeyToFreq`),
`SoundDriverGetJumpList` (swi 0x2A, only in `MusicPlayerJumpTableCopy`'s
matching version, never called), BitUnPack and the Diff filters (unused).

mGBA's HLE BIOS computes the affine calls with single-precision `sinf`/
`cosf`, so its matrices differ from the real BIOS's by one unit about 90% of
the time.  `gBiosAffineMgba = 1` switches `BgAffineSet`/`ObjAffineSet` to
that float method, reproducing mGBA bit for bit (with the compiler's default
floating-point contraction on arm64, like mGBA's build), for runs that are
compared frame by frame with mGBA.

Tests:

* `test_bios` (107 checks): known values of every call; `Sqrt` against
  `floor(sqrt(x))` for all x below 2^22, around every square and 2 million
  random values; `ArcTan2` within 4 units of `atan2` on a grid; the affine
  calls against exact trigonometry (within 1); hand-made LZ77, RL and
  Huffman streams, including the VRAM corner cases; `RegisterRamReset`; the
  hooks.
* `test_lz77`: decompresses all 3,663 LZ77 blobs in `data/graphics.txt`
  (every `@ LZ77` label of `data/rom`; 13.4 MB) from `baserom.gba` and
  compares them with the files `tools/gfx.py` extracts and gbagfx builds
  (`build/graphics/NAME.4bpp` for images, `graphics/NAME.bin`/`.gbapal`
  otherwise): all identical, with `LZ77UnCompWram` and `LZ77UnCompVram`.
* `biosref`: 14.2 million arithmetic calls (`ArcTan2` on every x, y in
  [-1024, 1024] and 4 million random pairs, `ArcTan` over its domain,
  `Sqrt`, `Div`, `DivArm`), 400,000 random affine calls, the 3,663 game
  blobs through both LZ77 variants, and 40,000 random RL and short-distance
  LZ77 streams, each against mGBA's HLE BIOS called directly (`GBASwi16`):
  0 differences (the affine calls with `gBiosAffineMgba`; without it they
  differ by at most one unit, as said).

## Renderer (`platform/ppu.c`)

```c
struct Ppu ppu;
ppu_init(&ppu, io, pal, vram, oam, framebuffer);   /* 0x400, 0x400, 0x18000, 0x400 bytes; 240*160 u32 */
ppu_render_frame(&ppu, hook, user);                /* hook(ppu, y, user) before each line, may be NULL */
/* or, line by line: ppu_render_line(&ppu, y); and ppu_io_written(&ppu, offset) after BGxX/BGxY writes */
```

Output pixels are `0x00BBGGRR` (mGBA's `color_t` layout), each 5-bit channel
`c` widened as `c << 3 | c >> 2`.  Covered: modes 0-5 (text backgrounds of
every size, affine backgrounds with and without wrap-around, the three
bitmap modes with page flip), mosaic on backgrounds and sprites, regular and
affine sprites (double size, 1D and 2D tile mapping, 16 and 256 colors, the
per-line sprite time budget, the priority quirk of transparent sprite pixels),
semi-transparent and OBJ-window sprites, windows 0, 1 and OBJ (including
wrapped ranges), alpha blending, brightness up and down, forced blank, and
the three-line delay before a background enabled mid-frame shows.

Each line is drawn from the registers as they are when `ppu_render_line`
runs, so per-line effects (HBlank DMA, HBlank and VCount interrupts) work
when the caller applies them between lines, e.g. from the hook.  The one
piece of state is the affine layers' internal reference point: loaded from
BG2X/BG2Y/BG3X/BG3Y at line 0, advanced by PB/PD after each line, reloaded
after a mid-frame write (`ppu_io_written`).

`colorMath`: `PPU_COLOR_HARDWARE` (the default) blends on 5-bit channels as
the GBA does; `PPU_COLOR_MGBA` reproduces mGBA 0.10's arithmetic on 8-bit
channels (including its darken, which rounds green and blue differently from
red) and its one known deviation in layout (no horizontal mosaic on affine
backgrounds for a mosaic size of 2), so the two can be compared exactly.
Where GBATEK leaves a detail open the renderer does what mGBA does (sprite
VRAM wrapping, the sprite time budget, the edges of mosaic sprites and
affine clipping), as that is what it is checked against.

### Verification against mGBA

`platform/tools/ppucapture.c` plays an emutest input script in libmgba
(the same deterministic set-up as `tools/emutest.c`: HLE BIOS, no save file
unless the script's `sram` line gives one) and wraps mGBA's software
renderer callbacks.  For every compared frame it renders the picture twice
and compares both with mGBA's, pixel for pixel on all 24 bits:

* **line by line** ("live"): during mGBA's frame, each line when mGBA draws
  it, from mGBA's own registers, palette, VRAM and OAM at that moment, and
  with mGBA's writes to BGxX/BGxY forwarded.  This checks the renderer.
* **from one dump**: from a copy of the state when line 0 was drawn, which
  is what a single dump of the frame holds.  Frames that change registers,
  palette, VRAM or OAM between lines differ by nature; the tool records
  which frames do (from the renderer callbacks) so they are counted apart.

`platform/tools/ppucompare.py` runs it on every script and prints a table;
`--dump` also writes a dump file at every `shot` of a script (the line-0
state, each line's registers and palette, and mGBA's frame; the format is
in `ppucapture.c`), which `build/platform/ppurender DUMP...` renders and
compares offline, once from the snapshot and once with the per-line state.

Results over every frame of the nine scripts in `tests/inputs/` (150,895
frames), mGBA color math:

| script | frames | line by line identical | one dump identical | frames with mid-frame changes | without them: one dump identical |
|---|---|---|---|---|---|
| actions | 18,249 | 18,249 | 14,581 | 4,372 | 13,877 / 13,877 |
| ch13 | 18,739 | 18,739 | 16,520 | 2,744 | 15,995 / 15,995 |
| extras | 10,367 | 10,367 | 8,605 | 2,252 | 8,115 / 8,115 |
| final | 13,297 | 13,297 | 12,291 | 1,270 | 12,027 / 12,027 |
| hector | 15,265 | 15,265 | 12,624 | 3,011 | 12,254 / 12,254 |
| lyn | 8,417 | 8,417 | 6,925 | 1,694 | 6,723 / 6,723 |
| opening | 19,599 | 19,599 | 2,698 | 17,333 | 2,266 / 2,266 |
| prologue | 12,849 | 12,849 | 11,786 | 1,457 | 11,392 / 11,392 |
| shops | 34,113 | 34,113 | 30,233 | 4,583 | 29,530 / 29,530 |
| **all** | **150,895** | **150,895 (100%)** | **116,263 (77.0%)** | **38,716** | **112,179 / 112,179 (100%)** |

So the renderer matches mGBA on every pixel of every frame when it sees the
same per-line state, and a single dump reproduces every frame that has no
mid-frame changes.  Of the 38,716 frames with mid-frame changes, 4,084 still
come out identical from a single dump.  The dumps written with `--dump`
(per-line registers and palette, VRAM/OAM of line 0) close most of the
rest: on ch13's 76 `shot` frames, 71 are identical from the line-0 snapshot
and 75 with the per-line state; the one left changes VRAM during the frame.

Getting there took two mGBA details now reproduced under
`PPU_COLOR_MGBA`: its 5-to-8-bit widening (`c << 3 | c >> 2`) and its darken
rounding.

Frames with per-line changes: the opening's scenes (HBlank-driven waves,
gradients and the class reels' backgrounds, `opanim_scanline.c`), the
menus' fading gradients (BLDY changed per line), the world map and battle
backgrounds; also frames where the game writes VRAM or palette while the
frame is drawn (text glyphs, animations uploaded outside VBlank).  The
live comparison covers them all; for a single dump, capture the per-line
registers and palette as ppucapture's dumps do.

With `--hardware` (5-bit color math) every blended or brightened pixel can
differ from mGBA in its low bits, by design: on lyn.txt 32% of the frames
stay identical, since the game blends in most scenes (menus, windows, fades).
Which of the two is right on a real GBA isn't settled here; checking it would
need captures from hardware.

## Runtime

### The interface (what the game is built against)

When `PLATFORM_GBA` is not defined, `include/gba/defines.h` and `io_reg.h`
include `include/gba/host.h` and point the hardware addresses into the
platform's arrays (`platform/memory.c`, each aligned to 16):

| macro | GBA | host |
|---|---|---|
| `REG_BASE` (so every `REG_*`, `REG_ADDR_*`) | `0x4000000` | `(uintptr_t) gHostIo` (0x400 bytes) |
| `PLTT` (`BG_PLTT`, `OBJ_PLTT`) | `0x5000000` | `(uintptr_t) gHostPltt` (0x400) |
| `VRAM` (`BG_VRAM`, `BG_CHAR_ADDR`, `OBJ_VRAM0`...) | `0x6000000` | `(uintptr_t) gHostVram` (0x18000) |
| `OAM` | `0x7000000` | `(uintptr_t) gHostOam` (0x400) |
| `EWRAM_START`, `IWRAM_START` | `0x02000000`, `0x03000000` | `gHostEwram` (0x40000), `gHostIwram` (0x8000) |
| `INTR_VECTOR`, `INTR_CHECK`, `SOUND_INFO_PTR` | words at 0x03007FFx | `gHostIntrVector`, `gHostIntrCheck`, `gHostSoundInfoPtr` |

`gHostSram` (0x10000 bytes; FE7 uses the first 0x8000) is the cartridge
SRAM.  On the GBA nothing changes: the matching ROM, shifttest and
modern-check are unaffected.

DMA: when `PLATFORM_GBA` is not defined, `DmaSet` (include/gba/macro.h,
and through it every `DmaCopy*`/`DmaFill*`/`DmaClear*` macro) calls
`HostDmaSet(ch, src, dst, control)`, `control` being the 32-bit DMAxCNT
value.  Immediate transfers are done at once (16/32-bit units, the
increment/decrement/fixed/reload modes, count 0 = the maximum); VBlank and
HBlank transfers are kept and run by the frame loop at those times, with
repeat, until `DmaStop` clears the enable bit in `REG_DMAxCNT_H`; the
sound FIFO transfers (special timing) do nothing.  The registers are also
written, so reads of DMAxCNT see the flags.  The game uses no VBlank or
HBlank DMA and writes no DMA register directly outside the macros (m4a
aside); the demo checks the HBlank path.

Audio: `HostAudioSubmit(stereo, frames)` takes interleaved signed 16-bit
stereo at the rate `HostAudioSetRate` gave (default 13379 Hz, FE7's m4a
rate) and queues it to the SDL audio device (latency kept under 0.2 s by
dropping) and to `--wav FILE`.  Nothing calls it until the sound engine's
port does, so the game is silent.

### Hooking the game in

* **Entry.**  `platform/main.c`'s `main()` calls `HostMain` (host.c), which
  parses the options, loads SRAM, opens the window and calls the game's
  `AgbMain()`.  `SoftReset` longjmps back there and calls `AgbMain` again
  (after `HostPowerOn`: registers cleared, DMA stopped; RAM is kept, as on
  the GBA, so the soft-reset flags in EWRAM survive).
* **Frame.**  `VBlankIntrWait` (and `IntrWait`, `Halt`, `Stop`) call
  `HostRunFrame`: lines 160-227 of the previous VBlank (VCOUNT, VCount
  match, HBlank interrupts), then lines 0-159, each drawn by the PPU then
  followed by its HBlank (HBlank DMA and the HBlank interrupt, which set up
  the next line), then VBlank at line 160 (VBlank DMA, the VBlank interrupt:
  the game's `OnVBlank`), then the frame is presented, logged and dumped,
  SRAM saved if it changed, the next frame's keys read into
  `REG_KEYINPUT`, and the pace kept at 59.7275 Hz (280896 cycles).
  `DISPSTAT`'s status bits and `VCOUNT` are maintained; an interrupt is
  raised only if its enable bit in `DISPSTAT` is set.  Writes of BG2X..BG3Y
  by HBlank handlers are detected (compared around each HBlank) and passed
  to `ppu_io_written`.
* **Interrupts.**  `platform/irq.c` dispatches like crt0.s's `IntrMain`:
  if `IME`, take `IE & IF`, the lowest bit, acknowledge it in `IF`, call
  `gIrqFuncs[bit]` (the game's table, src/irq.c), restore `IE`; again while
  more are pending (nesting allowed; the game pak interrupt aborts).  The
  game's `IrqInit` copies 0x800 bytes from `IrqMain` to `IntrMainRam`:
  irq.c defines `IrqMain` as 0x800 zero bytes for that, and nothing runs it.
* **Input.**  Keyboard (arrows; Z/X = A/B; A/S = L/R; Enter = Start;
  Backspace = Select; Tab held = fast forward; Esc = quit), or an input
  script.  Frame numbers are tools/emutest.c's: frame N's keys are in
  `KEYINPUT` from the return of wait N-1 until the return of wait N, and
  picture N is the one drawn in wait N, so `--log` and shots line up with
  emutest's for the same script.
* **Save.**  `gHostSram` is loaded from `--save FILE` (default `fe7u.sav`
  in a window, none headless; 0xFF if absent) and written back a second
  after the game stops changing it, and at exit.  `platform/sram.c`
  replaces `src/agb-sram.c` on the host (`ReadSramFast`, `WriteSramFast`,
  `VerifySramFast`, `WriteAndVerifySramFast`, `SetSramFastFunc`, as plain
  copies).  A script's `sram DESC` line boots with the image
  `tools/mksave.py` makes (written to `$TMPDIR`, not written back).
* **The asm.**  `platform/armfunc.c` has C versions of the ARM routines of
  asm/crt0.s (`ColorFadeTick`, `ClearOam`, `Checksum32`, `TmFillRect`,
  `TmCopyRect`, `TmApplyTsa`, `PutOamHi/Lo`, `DrawGlyph`, `DecodeString`,
  `MapFloodCoreStep`, `MapFloodCore`, the EWRAM clear `sub_080009FC`), each
  derived from the instructions (loop counts, byte truncations, the
  rotated halfword loads), and the `*_thm` veneers of asm/veneers.s.  It
  includes gbafe.h, so it is compiled like the game's C (it passes
  hostcheck with 0 warnings).  asm/libagb.s is all BIOS call wrappers
  (bios.c).  Not ported: the unnamed second glyph drawer at 0x080005FC
  (unreferenced), and m4a (asm/m4a_1.s; the sound engine's port).
* **Headless.**  `--headless --frames N --input SCRIPT --dump-frames DIR`
  runs without SDL (no window, audio or pacing); `--input` takes an emutest
  script (tests/inputs/*.txt) or a plan, and runs its length unless
  `--frames` says otherwise; shots become `DIR/NAME.png` (RGB, like
  emutest's); `--dump-every N` adds `DIR/frameNNNNNN.png`; `--log FILE`
  writes `frame keys hash` per frame.  Color math is mGBA's by default (and
  the affine BIOS calls mGBA's, `gBiosAffineMgba`) so pictures can be
  compared with mGBA's; `--hardware-color` for the GBA's.

For a host build of the game, `platform/platform.mk` defines
`PLATFORM_RUNTIME_SRC`, `PLATFORM_FRONTEND_SRC` (SDL2 if `sdl2-config` is
found, else the headless stub), `PLATFORM_RUNTIME_CFLAGS` and
`PLATFORM_LIBS`: link those, `platform/main.c`, and `platform/armfunc.c`
compiled with the game's flags.

What the game's side still has to do for the host (src/, include/gbafe/):

* 195 casts of raw VRAM addresses (`(void *)0x06008000` etc.), 14 of EWRAM
  and 6 of I/O addresses in 59 files of src/ are not covered by the macros.
* `CART_SRAM` (include/gbafe/gbasram.h) must become `gHostSram`; the host
  links platform/sram.c instead of src/agb-sram.c.
* The game's RAM variables are wherever the host linker puts them, not in
  `gHostEwram`/`gHostIwram`: `AgbMain`'s clear of IWRAM and the start-up
  EWRAM clear (`sub_080009FC`) only clear those arrays.  Harmless if the
  variables start zeroed (C statics), but `gHostEwramClearHook` is there
  for anything that must be cleared with EWRAM.
* `InitRamFuncs` copies ARM code to IWRAM and calls it through `gRamFunc_*`
  pointers: on the host those must point at the C functions of armfunc.c.

### The demo

`platform/demo.c` defines `AgbMain` and `gIrqFuncs` and does through the
gba headers what the game does: a checkered text background (tiles by
`CpuCopy32` and `DmaFill32`), a 16x16 sprite moved every frame (its OAM
entry uploaded by `DmaCopy32` in the VBlank handler), an HBlank handler
that sets `BG0HOFS` per line (a wave), an HBlank DMA writing the backdrop
color per line (a gradient), a VCount handler at line 80, and a quiet tone
to `HostAudioSubmit`.  `--check` then verifies: one VBlank, 228 HBlank and
one VCount interrupt per frame (the VCount one at line 80); the sprite at
its position; on every line, the backdrop's color is the gradient's and
where it shows through the tile matches that line's wave offset; with an
input script, the keys the VBlank handler saw in each frame are the
script's for that frame; and the frame hash after 120 frames
(`e331db1a3a4e63ad`).  `make platform-test` runs it for 120 frames and on
`platform/tests/demo_input.txt` (both pass, 0.1 s each); `make
platform-demo` shows it in a window (paced at 59.73 Hz).  `test_input`
checks the script compiler against what tools/emutest.py makes of the same
script.

## What's next

* **Link the game** (the host-link work; see "Hooking the game in" above
  for what src/ needs).
* **Audio.**  m4a's mixer (`SoundMain`, asm/m4a_1.s) ported to C, writing
  to `HostAudioSubmit` once per frame from `m4aSoundVSync`/`SoundMain`;
  the four CGB (PSG) channels emulated.  `SoundBiasReset/Set` stay no-ops.
* **Timing detail.**  The game's logic runs between frames, so what the GBA
  does while it draws (VRAM written mid-frame, text glyphs, animations
  uploaded outside VBlank) lands wholly before or after the picture;
  harmless in practice (the dump comparison above shows how rare and local
  it is).  Timers, serial and keypad interrupts are not raised.
* **Compare with mGBA.**  With the game linked, `--headless --input
  tests/inputs/NAME.txt --dump-frames DIR --log FILE` gives shots and a
  per-frame log in emutest's numbering, to compare with
  `tools/emutest.py`'s output.
