// Pointer variables the game keeps in ROM that point at fixed RAM buffers.
//
// The modules that read them declare them as non-const pointers (CONST_DATA),
// and a const declaration lets the compiler reuse a loaded value, which
// changes the code.  So the definitions live here, in a file that includes no
// header (the readers' declarations would conflict with these).

#include "gbafe/global.h"

extern unsigned char gBuf[];   // hardware.h
extern char sShopState[];      // struct ShopState, bmshop.h

SECTION(".rodata.08B93E44")
void * const UnitSpriteUnpackBuf = gBuf;

SECTION(".rodata.08B96ED0")
void * const sUnitPriorityArray = gBuf;

SECTION(".rodata.08B99084")
void * const gUnknown_085A9884 = gBuf;

SECTION(".rodata.08CE5480")
void * const gUnknown_08A212D4 = gBuf;

SECTION(".rodata.08CE5484")
void * const gUnknown_08A212D8 = &gBuf[0x800];

SECTION(".rodata.08CE5488")
void * const gUnknown_08A212DC = &gBuf[0x1000];

SECTION(".rodata.08CE548C")
void * const gSoundRoomShuffleBuffer = &gBuf[0x1200];

SECTION(".rodata.08CE583C")
void * const gConfigUiState = gBuf;

SECTION(".rodata.08CE7298")
void * const gShopState = sShopState;
