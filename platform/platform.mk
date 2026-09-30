# Host platform layer (platform/, docs/port-platform.md): its tests and the
# comparisons with mGBA.  Run from the repository root, through the main
# Makefile: `make platform-test`, `make platform-biosref`,
# `make platform-ppucompare` (see the end of Makefile).

PLATFORM_CC ?= cc
PLATFORM_CFLAGS ?= -std=c99 -O2 -g -Wall -Wextra
PB := build/platform
PINC := -Iinclude -Iplatform

MGBA_PREFIX ?= $(shell brew --prefix mgba 2>/dev/null)
MGBA_CFLAGS ?= $(shell pkg-config --cflags libmgba 2>/dev/null || echo -I$(MGBA_PREFIX)/include)
MGBA_LIBS ?= $(shell pkg-config --libs libmgba 2>/dev/null || echo -L$(MGBA_PREFIX)/lib -Wl,-rpath,$(MGBA_PREFIX)/lib -lmgba)
# Homebrew's mgba bottle may want an older (keg-only) ffmpeg than the one
# installed (CONTRIBUTING, "Runtime test")
MGBA_ENV := DYLD_FALLBACK_LIBRARY_PATH=$(subst $(eval) ,:,$(wildcard /opt/homebrew/opt/ffmpeg@*/lib /usr/local/opt/ffmpeg@*/lib))

BIOS_SRC := platform/bios.c
PPU_SRC := platform/ppu.c
HDRS := platform/bios.h platform/ppu.h platform/tests/test.h

# The runtime (docs/port-platform.md, "Runtime").  For a host build of the
# game, link PLATFORM_RUNTIME_SRC + PLATFORM_FRONTEND_SRC + platform/main.c
# (compiled with PLATFORM_RUNTIME_CFLAGS) and platform/armfunc.c (compiled
# like the game's C: it includes gbafe.h) with PLATFORM_LIBS.
PLATFORM_RUNTIME_SRC := platform/bios.c platform/ppu.c platform/memory.c platform/irq.c \
                        platform/host.c platform/input.c platform/sram.c platform/png.c platform/audio.c
PLATFORM_RUNTIME_HDRS := platform/platform.h platform/bios.h platform/ppu.h include/gba/host.h
SDL2_CONFIG ?= $(shell command -v sdl2-config 2>/dev/null)
ifneq ($(SDL2_CONFIG),)
PLATFORM_FRONTEND_SRC := platform/frontend_sdl.c
PLATFORM_SDL_CFLAGS := $(shell $(SDL2_CONFIG) --cflags)
PLATFORM_LIBS := $(shell $(SDL2_CONFIG) --libs) -lz -lm
else
PLATFORM_FRONTEND_SRC := platform/frontend_null.c
PLATFORM_SDL_CFLAGS :=
PLATFORM_LIBS := -lz -lm
endif
PLATFORM_RUNTIME_CFLAGS := -std=gnu99 -O2 -g -Wall -Wextra -Wno-unused-parameter $(PINC) $(PLATFORM_SDL_CFLAGS)

.PHONY: test biosref ppucompare demo

test: $(PB)/test_bios $(PB)/test_ppu $(PB)/test_lz77 $(PB)/test_input $(PB)/demo
	$(PB)/test_bios
	$(PB)/test_ppu
	$(PB)/test_lz77
	$(PB)/test_input
	$(PB)/demo --check --headless --frames 120 --no-save
	$(PB)/demo --check --headless --no-save --input platform/tests/demo_input.txt

$(PB)/test_input: platform/tests/test_input.c platform/input.c $(PLATFORM_RUNTIME_HDRS)
	@mkdir -p $(@D)
	$(PLATFORM_CC) $(PLATFORM_RUNTIME_CFLAGS) -o $@ platform/tests/test_input.c platform/input.c

# The runtime without the game (platform/demo.c): `make platform-demo` opens
# a window.
$(PB)/demo: platform/demo.c $(PLATFORM_RUNTIME_SRC) $(PLATFORM_FRONTEND_SRC) $(PLATFORM_RUNTIME_HDRS)
	@mkdir -p $(@D)
	$(PLATFORM_CC) $(PLATFORM_RUNTIME_CFLAGS) -o $@ platform/demo.c $(PLATFORM_RUNTIME_SRC) $(PLATFORM_FRONTEND_SRC) $(PLATFORM_LIBS)

demo: $(PB)/demo
	$(PB)/demo --no-save

$(PB)/test_bios: platform/tests/test_bios.c $(BIOS_SRC) $(HDRS)
	@mkdir -p $(@D)
	$(PLATFORM_CC) $(PLATFORM_CFLAGS) $(PINC) -o $@ platform/tests/test_bios.c $(BIOS_SRC) -lm

$(PB)/test_lz77: platform/tests/test_lz77.c $(BIOS_SRC) $(HDRS)
	@mkdir -p $(@D)
	$(PLATFORM_CC) $(PLATFORM_CFLAGS) $(PINC) -o $@ platform/tests/test_lz77.c $(BIOS_SRC) -lm

$(PB)/test_ppu: platform/tests/test_ppu.c $(PPU_SRC) $(HDRS)
	@mkdir -p $(@D)
	$(PLATFORM_CC) $(PLATFORM_CFLAGS) $(PINC) -o $@ platform/tests/test_ppu.c $(PPU_SRC)

# Against mGBA (libmgba)
$(PB)/biosref: platform/tools/biosref.c $(BIOS_SRC) $(HDRS)
	@mkdir -p $(@D)
	$(PLATFORM_CC) -O2 -Wall $(PINC) $(MGBA_CFLAGS) -o $@ platform/tools/biosref.c $(BIOS_SRC) $(MGBA_LIBS) -lm

$(PB)/ppucapture: platform/tools/ppucapture.c $(PPU_SRC) $(HDRS)
	@mkdir -p $(@D)
	$(PLATFORM_CC) -O2 -Wall $(PINC) $(MGBA_CFLAGS) -o $@ platform/tools/ppucapture.c $(PPU_SRC) $(MGBA_LIBS) -lz

$(PB)/ppurender: platform/tools/ppurender.c $(PPU_SRC) $(HDRS)
	@mkdir -p $(@D)
	$(PLATFORM_CC) $(PLATFORM_CFLAGS) $(PINC) -o $@ platform/tools/ppurender.c $(PPU_SRC)

biosref: $(PB)/biosref
	$(MGBA_ENV) $(PB)/biosref baserom.gba data/graphics.txt

PPUCOMPARE_FLAGS ?=
ppucompare: $(PB)/ppucapture $(PB)/ppurender
	python3 platform/tools/ppucompare.py $(PPUCOMPARE_FLAGS)
