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

// A crash names the frame it happened in (tools/hostrun.py reads the line):
// "fe7u: signal N in frame F" on stderr, then the default action (so lldb,
// a core dump and the exit status still see the signal).  Not installed
// under AddressSanitizer, which reports crashes itself.  Declared here, not
// included: the game's C is compiled -nostdinc against agbcc's newlib.
extern long gHostFrameCount;
typedef void (*HostSigHandler)(int);
HostSigHandler signal(int sig, HostSigHandler handler);
long write(int fd, const void * buf, unsigned long n);

#if defined(__APPLE__)
enum { HOST_SIGBUS = 10 };
#else
enum { HOST_SIGBUS = 7 };
#endif

static void HostCrashHandler(int sig)
{
    char buf[64], num[24];
    char * p = buf;
    const char * s;
    long v;
    int i;

    for (s = "fe7u: signal "; *s; )
        *p++ = *s++;
    *p++ = '0' + sig / 10;
    *p++ = '0' + sig % 10;
    for (s = " in frame "; *s; )
        *p++ = *s++;
    v = gHostFrameCount;
    i = 0;
    do {
        num[i++] = '0' + v % 10;
        v /= 10;
    } while (v > 0);
    while (i > 0)
        *p++ = num[--i];
    *p++ = '\n';
    write(2, buf, p - buf);

    signal(sig, (HostSigHandler) 0); // SIG_DFL: the fault happens again, unhandled
}

#if defined(__has_feature)
#if __has_feature(address_sanitizer)
#define HOST_ASAN 1
#endif
#endif

__attribute__((constructor)) static void HostCrashInit(void)
{
#ifndef HOST_ASAN
    signal(11, HostCrashHandler); // SIGSEGV
    signal(HOST_SIGBUS, HostCrashHandler);
    signal(4, HostCrashHandler); // SIGILL
    signal(8, HostCrashHandler); // SIGFPE
    signal(6, HostCrashHandler); // SIGABRT
#endif
}
