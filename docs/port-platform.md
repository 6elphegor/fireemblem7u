# Host platform layer

The first pieces of the native port's platform layer, in `platform/`: the
GBA BIOS calls in C and a scanline renderer for the GBA picture, each tested
on its own and against mGBA.  They are host-only C99, built with the host's
compiler, and not part of the GBA build.  Nothing here links with the game
yet (it can't until the data region is C; see `docs/port-data.md`); what is
left for that is under "What's next".  Status as of 2026-09-29.

| File | What |
|---|---|
| `platform/bios.c`, `bios.h` | every BIOS call `include/gba/syscall.h` declares and the game makes, plus `ArcTan`, `DivArm`, `Halt`, `IntrWait` |
| `platform/ppu.c`, `ppu.h` | the renderer: registers, palette, VRAM and OAM in, a 240x160 RGB frame out |
| `platform/tests/` | unit tests (`test_bios`, `test_ppu`) and `test_lz77` (every LZ77 blob of the ROM) |
| `platform/tools/biosref.c` | BIOS calls against mGBA's HLE BIOS |
| `platform/tools/ppucapture.c`, `ppucompare.py`, `ppurender.c` | the renderer against mGBA on the runtime test scripts; dumps |
| `platform/platform.mk` | build rules (called from the main Makefile) |

## Running the tests

```sh
make                       # the matching build first (test_lz77 reads build/graphics/)
make platform-test         # test_bios, test_ppu, test_lz77: no mGBA needed
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

## What's next

To run the game on the host, around the two pieces above:

* **Memory and registers.**  Host arrays for EWRAM, IWRAM, the I/O block,
  palette, VRAM and OAM, and `REG_*`, `VRAM`, `PLTT`, `OAM` etc. pointing
  into them (docs/port-notes.md, section 3).  The I/O block is what the PPU
  reads; writes with side effects (DMA control, IE/IF/IME, sound, timers,
  KEYINPUT reads) need a hook, so the `REG_*` macros become accessors on the
  host, or the platform layer inspects the block at fixed points (after the
  VBlank handler, per line).
* **DMA.**  `DmaSet` (include/gba/macro.h) stores pointers into 32-bit
  registers: on the host it becomes a function taking pointers.  The game
  only starts DMA immediately (copies and fills, which become a copy with
  the DMA's increment modes) and for the sound FIFOs (`m4a.c`, DMA 1 and 2
  with `DMA_REPEAT`), which go away with the mixer; it uses no HBlank or
  VBlank DMA.  (A general model would run HBlank DMA one unit per line from
  the PPU hook.)
* **Interrupts.**  `irq.c` keeps its handler table (`gIrqFuncs`); the host
  calls the VBlank handler once per frame after drawing, the HBlank handler
  from the line hook before each line while `REG_IE` has HBlank on, and the
  VCount handler (`SetOnVMatch`, `SetNextVCount`) at the matching line.  The
  per-line effects are all HBlank handlers (`SetOnHBlankA/B`, `hardware.c`,
  used from 46 files: scanline waves, gradients, split scrolling) that
  write the registers for the next line, so the PPU's line hook is where
  they belong.  `IrqMain` (copied to IWRAM) is not used.
* **Main loop and VBlank.**  `AgbMain` loops `RunMainFunc`, which waits in
  `VBlankIntrWait`.  On the host that hook ends the frame: draw the 160
  lines (with the HBlank work), run the VBlank handler (`OnVBlank`: the
  `gDispIo` copy to the registers, OAM and palette uploads, `m4aSoundVSync`),
  present, and pace to 59.73 Hz.  Game code that writes VRAM "during" a
  frame on the GBA then shows a frame later or earlier than on hardware for
  those lines; harmless in practice (the dump comparison above shows how
  rare and local it is).  `SoftReset` longjmps back to `AgbMain`.
* **Input.**  `REG_KEYINPUT` (active low) from the keyboard or a game pad,
  sampled once per frame before the VBlank handler.
* **Audio.**  m4a's mixer (`SoundMain`, `asm/m4a_1.s`, ARM code copied to
  IWRAM) needs a C port writing to a host audio buffer, and the four CGB
  (PSG) channels need emulating; the song data keep their 4-byte addresses
  (docs/port-data.md).  `SoundBiasReset/Set` stay no-ops.
* **Save.**  `agb-sram.c` copies Thumb code to RAM to read and write SRAM;
  replace it with a 32 KiB file (`ReadSramFast`/`WriteSramFast`/`VerifySram`
  on a host array flushed to disk).
* **Presenting the frame.**  The renderer's buffer is ready for an SDL2
  texture (`SDL_PIXELFORMAT_ABGR8888` on little-endian); a viewer for the
  dumps would be the first user.
