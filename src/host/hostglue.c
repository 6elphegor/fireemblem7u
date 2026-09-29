// Host build only (tools/hostgame.py; the GBA builds take src/*.c, not this
// directory): what the host link needs besides the game's C and data.

#include "gbafe.h"
#include "gba/m4a_internal.h"

// The RAM objects that only symbols.ld names live in two images laid out by
// tools/hostram.py (build/host-game/ramsyms.s), not in gHostEwram and
// gHostIwram: the game's start-up clear of EWRAM (sub_080009FC) clears
// gHostEwram and then calls this hook, which clears the EWRAM image the same
// way; AgbMain's clear of IWRAM calls HostClearRamIwram for the IWRAM image.
// (The game's own C variables are ordinary host variables: zero at start-up,
// not cleared again by a soft reset.)
extern u8 gHostRamEwram[], gHostRamEwramEnd[];
extern u8 gHostRamIwram[], gHostRamIwramEnd[];

static void ClearHostRamEwram(void)
{
    u8 * p;

    for (p = gHostRamEwram; p < gHostRamEwramEnd; p++)
        *p = 0;
}

void HostClearRamIwram(void)
{
    u8 * p;

    for (p = gHostRamIwram; p < gHostRamIwramEnd; p++)
        *p = 0;
}

__attribute__((constructor)) static void HostGameInit(void)
{
    gHostEwramClearHook = ClearHostRamEwram;
}

// The music track streams store their GOTO / PATT / REPT / MEMACC / xWAVE
// addresses as offsets from gHostSoundBase, the start of the host's sound
// data (tools/hostasm.py); M4aReadAddr (src/m4a_1.c) hands the stored value
// here.
extern u8 gHostSoundBase[];

void * M4aHostRomAddr(u32 stored)
{
    return gHostSoundBase + stored;
}
