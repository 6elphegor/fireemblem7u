/*
 * The host platform layer's internal interface (platform/*.c).
 *
 * The game sees only include/gba/host.h (memories, HostDmaSet, audio) and
 * the BIOS calls (platform/bios.c).  This header ties the pieces together:
 * interrupts (irq.c), DMA timing (memory.c), the frame loop and main()
 * (host.c), save memory (sram.c), the front end (frontend_sdl.c) and PNG
 * dumps (png.c).
 */
#ifndef PLATFORM_PLATFORM_H
#define PLATFORM_PLATFORM_H

#include <stdint.h>

#include "gba/types.h"
#include "gba/io_reg.h"
#include "gba/host.h"
#include "bios.h"
#include "ppu.h"

/* ---- interrupts (irq.c) ---- */

/* The game's handler table (src/irq.c: IrqInit/SetIrqFunc), INT_COUNT = 14
 * entries in IE bit order.  Defined by the game (a RAM symbol). */
extern void (*gIrqFuncs[14])(void);

/* Set `flags` in IF and dispatch what IE and IME allow, like crt0.s's
 * IntrMain: lowest bit first, one handler per pass, IE restored after each. */
void HostRaiseIrq(u16 flags);
/* Dispatch pending interrupts (IE & IF) if IME allows. */
void HostCheckIrq(void);

/* ---- DMA timing (memory.c) ---- */

enum { HOST_DMA_VBLANK, HOST_DMA_HBLANK };
void HostDmaRun(int timing);
void HostDmaReset(void);

/* ---- the frame loop (host.c) ---- */

#define HOST_FRAME_NS 16742706LL /* 280896 cycles at 2^24 Hz: 59.7275 Hz */

struct HostOptions {
    int headless;
    long frames;          /* stop after this many frames (0: never) */
    const char *input;    /* emutest input script or plan (tools/emutest.py) */
    const char *dumpDir;  /* PNGs of the script's shots (and --dump-every) */
    long dumpEvery;       /* also every Nth frame (0: none) */
    const char *log;      /* per-frame log: frame, keys, picture hash */
    const char *save;     /* SRAM file, read at start and written back */
    const char *sramInit; /* SRAM image read at start, not written back */
    const char *wav;      /* audio written to a WAV file */
    int scale;            /* window scale */
    int hardwareColor;    /* PPU color math of the GBA instead of mGBA's */
};
extern struct HostOptions gHostOptions;

/* The current frame's picture (0x00BBGGRR, PPU_WIDTH x PPU_HEIGHT) and
 * the number of frames finished. */
extern uint32_t gHostFrame[PPU_WIDTH * PPU_HEIGHT];
extern long gHostFrameCount;

/* Run one frame: the rest of the previous VBlank's HBlanks (lines
 * 160-227), lines 0-159 with their HBlank and VCount interrupts and HBlank
 * DMA, then VBlank (input, VBlank DMA, the VBlank interrupt), then present
 * and pace.  The VBlankIntrWait hook. */
void HostRunFrame(void);

/* Reset the machine state the platform owns (registers, DMA, the frame
 * counter stays).  Called at power-on and by SoftReset. */
void HostPowerOn(void);

/* The game's entry point (src/main.c). */
void AgbMain(void);

/* Parse the command line into gHostOptions, set up everything, call
 * AgbMain (again after SoftReset).  Returns the exit status when the run
 * ends (frame limit, window closed). */
int HostMain(int argc, char **argv);

/* 64-bit FNV-1a of the picture */
uint64_t HostFrameHash(const uint32_t *fb);

/* ---- input scripts (input.c) ---- */

struct HostScript;
struct HostScript *HostScriptLoad(const char *path); /* NULL + message on error */
/* Keys (KEYINPUT bits, 1 = pressed) for frame n; the shot name for frame n
 * or NULL; total frames of the script. */
u16 HostScriptKeys(struct HostScript *s, long frame);
const char *HostScriptShot(struct HostScript *s, long frame, int *index);
long HostScriptFrames(const struct HostScript *s);
const char *HostScriptSram(const struct HostScript *s); /* `sram DESC` or plan's `sram FILE` */

/* ---- save memory (sram.c) ---- */

#define HOST_SRAM_SIZE 0x8000 /* FE7's SRAM: what the file holds */
void HostSramLoad(const char *path, const char *initImage);
void HostSramFrame(void); /* write the file if SRAM changed (checked once a frame) */
void HostSramFlush(void); /* write the file now if SRAM changed */

/* ---- front end (frontend_sdl.c) ---- */

int FrontendInit(int headless, int scale);
/* Poll events; returns 0 when the user closed the window.  *keys gets the
 * pressed GBA keys (KEYINPUT bits, 1 = pressed), *fast the fast-forward key. */
int FrontendPoll(u16 *keys, int *fast);
void FrontendPresent(const uint32_t *fb);
void FrontendAudioQueue(const s16 *stereo, int frames, int rate);
void FrontendQuit(void);
/* nanoseconds, monotonic */
int64_t FrontendNow(void);
void FrontendSleepUntil(int64_t t);

/* ---- PNG (png.c) ---- */

int HostWritePng(const char *path, const uint32_t *fb, int w, int h);

#endif
