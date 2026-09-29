/*
 * The GBA's memories on the host, and DMA (include/gba/host.h).
 *
 * The game's REG_*, PLTT, VRAM, OAM, IWRAM_START and EWRAM_START point into
 * these arrays when it is built for the host (include/gba/defines.h,
 * io_reg.h).  The PPU (platform/ppu.c) reads gHostIo, gHostPltt, gHostVram
 * and gHostOam; the frame loop (platform/host.c) writes VCOUNT, DISPSTAT's
 * status bits and KEYINPUT.
 *
 * DMA: DmaSet (include/gba/macro.h) calls HostDmaSet with host pointers.
 * Immediate transfers happen at once.  VBlank and HBlank transfers are
 * kept and run by the frame loop (HostDmaRun) at the start of VBlank and in
 * each visible line's HBlank, as long as the channel stays enabled in
 * DMAxCNT_H (DmaStop clears it there), with repeat and destination reload.
 * The sound FIFO transfers (special timing on DMA 1 and 2) are left to the
 * sound engine's port and do nothing here.
 */
#include <string.h>

#include "platform.h"

#define ALIGN16 __attribute__((aligned(16)))

u8 gHostIo[0x400] ALIGN16;
u8 gHostPltt[0x400] ALIGN16;
u8 gHostVram[0x18000] ALIGN16;
u8 gHostOam[0x400] ALIGN16;
u8 gHostEwram[0x40000] ALIGN16;
u8 gHostIwram[0x8000] ALIGN16;
u8 gHostSram[0x10000] ALIGN16;

void *gHostIntrVector;
u16 gHostIntrCheck;
struct SoundInfo *gHostSoundInfoPtr;

void (*gHostEwramClearHook)(void);

/* DMA register block: 0xB0 + 12 * ch: SAD, DAD, CNT_L, CNT_H */
#define DMA_IO(ch) (gHostIo + 0xB0 + 12 * (ch))

struct HostDma {
    const u8 *src;
    u8 *dst, *dstReload;
    u32 control;
    int pending; /* a VBlank/HBlank transfer waiting for its time */
};
static struct HostDma sDma[4];

static void io_st16(u32 off, u16 v)
{
    gHostIo[off] = (u8)v;
    gHostIo[off + 1] = (u8)(v >> 8);
}

static u16 io_ld16(u32 off)
{
    return (u16)(gHostIo[off] | gHostIo[off + 1] << 8);
}

static void transfer(int ch)
{
    struct HostDma *d = &sDma[ch];
    u32 cnt = d->control >> 16;
    u32 count = d->control & 0xFFFF;
    int unit = (cnt & 0x0400) ? 4 : 2;
    int dstMode = (cnt >> 5) & 3;
    int srcMode = (cnt >> 7) & 3;
    long srcStep, dstStep;
    u32 i;

    if (ch < 3)
        count &= 0x3FFF;
    if (count == 0)
        count = ch == 3 ? 0x10000 : 0x4000;

    srcStep = srcMode == 0 ? unit : srcMode == 1 ? -unit : 0; /* 3: prohibited, treated as fixed */
    dstStep = (dstMode == 0 || dstMode == 3) ? unit : dstMode == 1 ? -unit : 0;

    for (i = 0; i < count; i++) {
        /* bytewise: no alignment or aliasing assumptions (the GBA ignores
         * the low address bits; the game's buffers are aligned anyway) */
        memmove(d->dst, d->src, unit);
        d->src += srcStep;
        d->dst += dstStep;
    }

    if (dstMode == 3)
        d->dst = d->dstReload;

    if (cnt & 0x4000) /* IRQ at the end */
        HostRaiseIrq((u16)(INTR_FLAG_DMA0 << ch));
}

void HostDmaSet(int ch, const void *src, void *dst, u32 control)
{
    struct HostDma *d;
    u32 cnt = control >> 16;
    u8 *io;

    if (ch < 0 || ch > 3)
        return;
    d = &sDma[ch];
    io = DMA_IO(ch);

    /* the registers as the GBA code would have written them (low 32 bits
     * of the host pointers), so that reads of DMAxCNT see the flags */
    {
        uintptr_t s = (uintptr_t)src, t = (uintptr_t)dst;
        int k;
        for (k = 0; k < 4; k++) {
            io[k] = (u8)(s >> (8 * k));
            io[4 + k] = (u8)(t >> (8 * k));
            io[8 + k] = (u8)(control >> (8 * k));
        }
    }

    d->src = src;
    d->dst = d->dstReload = dst;
    d->control = control;
    d->pending = 0;

    if (!(cnt & 0x8000))
        return;

    switch (cnt & 0x3000) {
    case 0x0000: /* now */
        transfer(ch);
        /* done: the enable bit clears (immediate transfers never repeat) */
        io_st16(0xB0 + 12 * ch + 10, (u16)(cnt & ~0x8000));
        break;
    case 0x1000: /* VBlank */
    case 0x2000: /* HBlank */
        d->pending = 1;
        break;
    default: /* special: sound FIFO (DMA 1, 2), video capture (DMA 3) */
        break;
    }
}

void HostDmaRun(int timing)
{
    int ch;

    for (ch = 0; ch < 4; ch++) {
        struct HostDma *d = &sDma[ch];
        u16 cnt;

        if (!d->pending)
            continue;
        cnt = io_ld16(0xB0 + 12 * ch + 10);
        if (!(cnt & 0x8000)) { /* stopped (DmaStop) */
            d->pending = 0;
            continue;
        }
        if ((cnt & 0x3000) != (timing == HOST_DMA_VBLANK ? 0x1000 : 0x2000))
            continue;
        transfer(ch);
        if (!(cnt & 0x0200)) {
            d->pending = 0;
            io_st16(0xB0 + 12 * ch + 10, (u16)(cnt & ~0x8000));
        }
    }
}

void HostDmaReset(void)
{
    memset(sDma, 0, sizeof(sDma));
}
