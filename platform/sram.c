/*
 * Save memory: gHostSram backed by a file, and the host version of the
 * AGB SRAM library (src/agb-sram.c).
 *
 * The game reads and writes SRAM through gSramMain (CART_SRAM, 0x0E000000
 * on the GBA; gHostSram on the host) with ReadSramFast, WriteSramFast,
 * VerifySramFast and WriteAndVerifySramFast.  agb-sram.c copies its own
 * Thumb code to RAM to run it from there; the functions below do the same
 * copies directly, so a host build uses this file instead of agb-sram.c.
 *
 * The file: HOST_SRAM_SIZE (32 KiB, FE7's SRAM, the size of an mGBA .sav)
 * bytes, read at start; SRAM is compared with the last written contents
 * once per frame and the file rewritten when it changed, and at exit.
 * Without a file, SRAM starts as 0xFF bytes (empty save memory, as in mGBA).
 */
#include <stdio.h>
#include <string.h>

#include "platform.h"

static const char *sPath;
static u8 sWritten[HOST_SRAM_SIZE];

void HostSramLoad(const char *path, const char *initImage)
{
    const char *from = initImage ? initImage : path;
    FILE *f;

    memset(gHostSram, 0xFF, sizeof(gHostSram));
    sPath = path;

    if (from && (f = fopen(from, "rb")) != NULL) {
        size_t n = fread(gHostSram, 1, sizeof(gHostSram), f);
        fclose(f);
        if (n == 0)
            memset(gHostSram, 0xFF, sizeof(gHostSram));
    } else if (initImage) {
        fprintf(stderr, "platform: can't read the SRAM image %s\n", initImage);
    }

    memcpy(sWritten, gHostSram, HOST_SRAM_SIZE);
    /* an SRAM image (not the save file) is written on the first change */
}

void HostSramFlush(void)
{
    FILE *f;

    if (!sPath || memcmp(sWritten, gHostSram, HOST_SRAM_SIZE) == 0)
        return;
    f = fopen(sPath, "wb");
    if (!f) {
        fprintf(stderr, "platform: can't write %s\n", sPath);
        sPath = NULL;
        return;
    }
    fwrite(gHostSram, 1, HOST_SRAM_SIZE, f);
    fclose(f);
    memcpy(sWritten, gHostSram, HOST_SRAM_SIZE);
}

void HostSramFrame(void)
{
    /* The game writes a save in pieces over a few frames; writing the file
     * a second after the last change keeps it from being rewritten on
     * every one of them. */
    static u8 prev[HOST_SRAM_SIZE];
    static int havePrev, quiet;

    if (!sPath)
        return;
    if (!havePrev) {
        memcpy(prev, sWritten, HOST_SRAM_SIZE);
        havePrev = 1;
    }
    if (memcmp(prev, gHostSram, HOST_SRAM_SIZE) != 0) {
        memcpy(prev, gHostSram, HOST_SRAM_SIZE);
        quiet = 60;
    } else if (quiet > 0 && --quiet == 0) {
        HostSramFlush();
    }
}

/* ---- src/agb-sram.c on the host ---- */

const char AgbLibSramVersion[] = "SRAM_F_V102";

static void read_sram(const void *src, void *dest, u32 size)
{
    memmove(dest, src, size);
}

static u32 verify_sram(const void *src, void *dest, u32 size)
{
    const u8 *s = src;
    u8 *d = dest;

    while (size--) {
        if (*d++ != *s++)
        {
            /* the GBA returns the address; only nonzero counts */
            u32 addr = (u32)(uintptr_t)(d - 1);
            return addr ? addr : 1;
        }
    }
    return 0;
}

void (*ReadSramFast)(const void *src, void *dest, u32 size) = read_sram;
u32 (*VerifySramFast)(const void *src, void *dest, u32 size) = verify_sram;

void ReadSramFast_Core(const u8 *src, u8 *dest, u32 size)
{
    read_sram(src, dest, size);
}

u32 VerifySramFast_Core(const u8 *src, u8 *dest, u32 size)
{
    return verify_sram(src, dest, size);
}

void WriteSramFast(const u8 *src, u8 *dest, u32 size)
{
    memmove(dest, src, size);
}

void SetSramFastFunc(void)
{
    ReadSramFast = read_sram;
    VerifySramFast = verify_sram;
}

u32 WriteAndVerifySramFast(const void *src, void *dest, u32 size)
{
    u8 i;
    u32 errorAddr = 0;

    for (i = 0; i < 3; i++) {
        WriteSramFast(src, dest, size);
        errorAddr = VerifySramFast(src, dest, size);
        if (errorAddr == 0)
            break;
    }
    return errorAddr;
}
