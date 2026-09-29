/*
 * Host replacements for the GBA BIOS calls (platform/bios.c).
 *
 * The functions the game calls keep the names and prototypes of
 * include/gba/syscall.h; this header adds what the BIOS has and syscall.h
 * doesn't declare, and the hooks the host main loop fills in for the calls
 * that are about time or the machine (waiting for an interrupt, reset).
 */
#ifndef PLATFORM_BIOS_H
#define PLATFORM_BIOS_H

#include "gba/types.h"

struct MultiBootParam;
#include "gba/syscall.h"

/* Calls that wait for the hardware or restart the machine.  Every hook may
 * be NULL: the waits then return at once and SoftReset aborts. */
struct BiosHooks {
    /* IntrWait (swi 4): wait until one of `flags` (IE bits) is raised;
     * with `discard`, flags already raised don't count.  VBlankIntrWait
     * is IntrWait(1, INTR_FLAG_VBLANK) when this is set. */
    void (*intr_wait)(u32 discard, u32 flags);
    /* VBlankIntrWait (swi 5), if the host wants it separately (tried first). */
    void (*vblank_intr_wait)(void);
    void (*halt)(void);  /* swi 2: until any interrupt */
    void (*stop)(void);  /* swi 3: sleep until keypad/cartridge/serial IRQ */
    /* SoftReset (swi 0): restart the game from its entry point (the host
     * longjmps to its main loop).  Must not return. */
    void (*soft_reset)(void);
};
extern struct BiosHooks gBiosHooks;

/* Memory RegisterRamReset clears; NULL regions are skipped.  `io` is the
 * 0x400-byte register block (0x04000000). */
struct BiosMemory {
    void *ewram;  /* 0x40000 */
    void *iwram;  /* 0x8000; the top 0x200 bytes are never cleared */
    void *pal;    /* 0x400 */
    void *vram;   /* 0x18000 */
    void *oam;    /* 0x400 */
    void *io;     /* 0x400 */
};
extern struct BiosMemory gBiosMemory;

/* Nonzero: BgAffineSet/ObjAffineSet compute like mGBA's HLE BIOS (single
 * precision sin/cos) instead of like the real BIOS (a sine table), for runs
 * that are compared with mGBA.  They differ by at most 1 in each matrix
 * entry (and the rounding of the reference point). */
extern int gBiosAffineMgba;

void Halt(void);                              /* swi 2 */
void IntrWait(u32 discard, u32 flags);        /* swi 4 */
s16 ArcTan(s16 tan);                          /* swi 9: tan in 1.14, result in 1/0x10000 turns */
int DivArmRem(int denom, int num);            /* swi 7, the remainder (r1) */

/* The decompressors behind LZ77UnCompWram/Vram and RLUnCompWram/Vram
 * (`vram`: halfword writes).  They return the size in the header, the
 * bytes written (RL pads that to a multiple of 4 with zeros). */
u32 LZ77UnComp(const void *src, void *dest, int vram);
u32 RLUnComp(const void *src, void *dest, int vram);
/* Size a compressed stream decompresses to (the header's 24 bits). */
u32 BiosUnCompSize(const void *src);

#endif
