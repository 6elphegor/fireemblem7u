#pragma once

#include "types.h"

void SetSramFastFunc(void);
void WriteSramFast(void const * src, void * dest, u32 size);
u32 WriteAndVerifySramFast(void const * src, void * dest, u32 size);
extern u32 (* VerifySramFast)(void const * src, void * dest, u32 size);
extern void (* ReadSramFast)(void const * src, void * dest, u32 size);

#define CART_SRAM_ADDR 0x0E000000
#define CART_SRAM_SIZE 0x00008000
#if PLATFORM_GBA
#define CART_SRAM ((void *) CART_SRAM_ADDR)
#else
// the platform's SRAM image (include/gba/host.h), backed by a file
#define CART_SRAM ((void *) gHostSram)
#endif
