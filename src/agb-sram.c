// Not gbafe.h: its gbasram.h declares WriteSramFast with void pointers.
#include "gba/gba.h"

const char AgbLibSramVersion[] = "SRAM_F_V102";

static u16 verifySramFast_Work[80]; // buffer to hold code of VerifySramFast_Core
static u16 readSramFast_Work[64];   // buffer to hold code of ReadSramFast_Core

u32 (* VerifySramFast)(void const * src, void * dest, u32 size); // pointer to verifySramFast_Work
void (* ReadSramFast)(void const * src, void * dest, u32 size);  // pointer to readSramFast_Work

void ReadSramFast_Core(const u8 * src, u8 * dest, u32 size)
{
    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;
    while (--size != -1)
        *dest++ = *src++;
}

void WriteSramFast(const u8 * src, u8 * dest, u32 size)
{
    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;
    while (--size != -1)
        *dest++ = *src++;
}

u32 VerifySramFast_Core(const u8 * src, u8 * dest, u32 size)
{
    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;
    while (--size != -1)
    {
        if (*dest++ != *src++)
            return (u32)(dest - 1);
    }
    return 0;
}

void SetSramFastFunc(void)
{
    u16 * src;
    u16 * dest;
    u16 size;

    // copy ReadSramFast_Core (up to WriteSramFast) into its IWRAM buffer
    src = (u16 *)ReadSramFast_Core;
    src = (u16 *)((u32)src ^ 1);
    dest = readSramFast_Work;
    size = ((u32)WriteSramFast - (u32)ReadSramFast_Core) / 2;
    while (size != 0)
    {
        *dest++ = *src++;
        size--;
    }
    ReadSramFast = (void *)((u32)readSramFast_Work + 1);

    // copy VerifySramFast_Core (up to SetSramFastFunc) into its IWRAM buffer
    src = (u16 *)VerifySramFast_Core;
    src = (u16 *)((u32)src ^ 1);
    dest = verifySramFast_Work;
    size = ((u32)SetSramFastFunc - (u32)VerifySramFast_Core) / 2;
    while (size != 0)
    {
        *dest++ = *src++;
        size--;
    }
    VerifySramFast = (void *)((u32)verifySramFast_Work + 1);

    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;
}

u32 WriteAndVerifySramFast(void const * src, void * dest, u32 size)
{
    u8 i;
    u32 errorAddr;

    // try writing and verifying the data 3 times
    for (i = 0; i < 3; i++)
    {
        WriteSramFast(src, dest, size);
        errorAddr = VerifySramFast(src, dest, size);
        if (errorAddr == 0)
            break;
    }

    return errorAddr;
}
