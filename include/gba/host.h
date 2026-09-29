#ifndef GUARD_GBA_HOST_H
#define GUARD_GBA_HOST_H

// The GBA's memories and the hardware services the game needs, on a host
// (a PC build: PLATFORM_GBA not defined).  Defined by the platform layer,
// platform/ (docs/port-platform.md).  The gba headers include this file
// when PLATFORM_GBA is not defined; REG_BASE, PLTT, VRAM, OAM, IWRAM_START
// and EWRAM_START then point into these arrays, so `REG_DISPCNT = x` and
// `(void *)(VRAM + 0x20 * chr)` work unchanged.  Nothing here is used by
// the GBA builds.

#include <stdint.h>
#include "gba/types.h"

// Pointers set before main(), each aligned as the game expects: VRAM on
// 0x20000, palette and OAM on 0x400 (the game computes tile and palette
// numbers from the low bits of these addresses).  gHostSram is an array
// (src/save_core.c initializes a pointer with its address).
extern u8 * gHostIo;     // I/O registers (0x04000000), HOST_IO_SIZE bytes
extern u8 * gHostPltt;   // palette RAM (0x05000000)
extern u8 * gHostVram;   // VRAM (0x06000000)
extern u8 * gHostOam;    // OAM (0x07000000)
extern u8 * gHostEwram;  // EWRAM (0x02000000): what EWRAM_START points to
extern u8 * gHostIwram;  // IWRAM (0x03000000): what IWRAM_START points to
extern u8 gHostSram[];    // cartridge SRAM (0x0E000000), HOST_SRAM_BANK bytes, backed by a file

#define HOST_IO_SIZE    0x400
#define HOST_PLTT_SIZE  0x400
#define HOST_VRAM_SIZE  0x18000
#define HOST_OAM_SIZE   0x400
#define HOST_EWRAM_SIZE 0x40000
#define HOST_IWRAM_SIZE 0x8000
#define HOST_SRAM_BANK  0x10000 // the whole bank; FE7 uses 0x8000 (HOST_SRAM_SIZE)

// The BIOS's words at the top of IWRAM (0x03007FF0-0x03007FFF): plain
// variables on the host.  The platform dispatches interrupts itself
// (platform/irq.c, the C version of crt0.s's IntrMain, through gIrqFuncs),
// so INTR_VECTOR is only stored.
extern void * gHostIntrVector;               // INTR_VECTOR    (0x03007FFC)
extern u16 gHostIntrCheck;                   // INTR_CHECK     (0x03007FF8)
extern struct SoundInfo * gHostSoundInfoPtr; // SOUND_INFO_PTR (0x03007FF0)

// DMA: DmaSet (include/gba/macro.h) calls this.  `control` is the 32-bit
// value the GBA code writes to DMAxCNT (count in the low 16 bits, DMAxCNT_H
// flags in the high 16).  Immediate transfers are done at once; VBlank and
// HBlank transfers are done by the frame loop at those times (with repeat);
// the sound FIFO transfers (DMA 1/2, special timing) do nothing.
void HostDmaSet(int ch, const void * src, void * dst, u32 control);

// Audio: the sound engine hands the platform `frames` stereo frames
// (interleaved left, right) at `rate` Hz (HostAudioSetRate; default 13379,
// the m4a mixing rate FE7 sets).  Until something calls it the host is
// silent.
void HostAudioSetRate(int rate);
void HostAudioSubmit(const s16 * stereo, int frames);

// Called by the game's clear of EWRAM at start-up (sub_080009FC, crt0.s's
// C version in platform/armfunc.c) after gHostEwram is cleared, if set:
// for RAM the host keeps outside gHostEwram.
extern void (* gHostEwramClearHook)(void);

#endif // GUARD_GBA_HOST_H
