/*
 * Interrupt dispatch: the C version of crt0.s's IntrMain (IrqMain).
 *
 * On the GBA the BIOS calls INTR_VECTOR (IntrMainRam, a copy of IrqMain
 * that src/irq.c makes), which takes IE & IF, picks the lowest set bit
 * (bit 13, game pak, hangs), acknowledges it in IF, calls gIrqFuncs[bit]
 * with interrupts enabled again (nesting allowed) and restores IE to its
 * value at entry.  The host has no CPU exceptions: the platform raises
 * interrupts at fixed points of the frame (platform/host.c) and dispatches
 * them here the same way.
 */
#include <stdio.h>
#include <stdlib.h>

#include "platform.h"

/* src/irq.c copies 0x800 bytes from IrqMain to IntrMainRam and stores
 * IntrMainRam in INTR_VECTOR; on the host that is data nobody runs.  The
 * game's headers declare IrqMain as a function; here it is 0x800 readable
 * bytes (a symbol of another type at link time is fine in C). */
const u32 IrqMain[0x200] = { 0 };

static int sDepth;

static void dispatch(void)
{
    u16 ie = REG_IE;
    u16 pending = ie & REG_IF & 0x3FFF;
    int i;

    if (!pending)
        return;
    for (i = 0; !(pending & (1 << i)); i++)
        ;
    if (i == 13) {
        /* IntrMain spins forever on a game pak interrupt (cartridge
         * removed).  Nothing raises it on the host. */
        fprintf(stderr, "platform: game pak interrupt\n");
        abort();
    }

    REG_IF &= (u16)~(1 << i); /* acknowledge (the GBA's IF is write-1-to-clear) */
    sDepth++;
    if (gIrqFuncs[i])
        gIrqFuncs[i]();
    sDepth--;
    REG_IE = ie;
}

void HostCheckIrq(void)
{
    /* one handler per pass, like IntrMain; loop while more are pending.
     * A handler that raises an interrupt nests (IntrMain re-enables
     * interrupts before calling it). */
    int guard;

    for (guard = 0; guard < 64; guard++) {
        if (!(REG_IME & 1) || !(REG_IE & REG_IF & 0x3FFF))
            return;
        if (sDepth > 16) /* runaway nesting */
            return;
        dispatch();
    }
}

void HostRaiseIrq(u16 flags)
{
    REG_IF |= flags;
    HostCheckIrq();
}
