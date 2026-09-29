// Pointer variables the game keeps in ROM that point at fixed RAM buffers.
//
// The modules that read them declare them as non-const pointers (CONST_DATA),
// and a const declaration lets the compiler reuse a loaded value, which
// changes the code.  So the definitions live here, in a file that includes no
// header (the readers' declarations would conflict with these).

#include "gbafe/global.h"

extern unsigned char gBuf[];   // hardware.h
extern char sShopState[];      // struct ShopState, bmshop.h
extern char sTalkStData[];    // struct TalkSt, talk.h
extern char gBonusClaimData[];
extern char gBonusClaimDataUpdated[];
extern char gBonusClaimItemList[];
extern char gBonusClaimConfig[];
extern char gBonusClaimItemCount[];
extern char gBonusClaimText[];
extern char gEpilogueStrBuf[];
extern char gEpilogueEnts[];
extern char gCharacterEndingTexts[];
extern char gTurnRecordTexts[];
extern char gEndingCgScrollBlendTable[];
extern char gUnkOpAnim_02000018[];
extern char gUnkOpAnim_02002018[];
extern char gUnkOpAnim_02003018[];
extern char gUnkOpAnim_02005018[];
extern char gSoundInfo[];
extern char gSupportScreenUnits[];

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

SECTION(".rodata.08CE5774")
void * const gpBonusClaimData = gBonusClaimData;

SECTION(".rodata.08CE40F4")
void * const gpSaveDrawBonusClaimData = gBonusClaimData;

SECTION(".rodata.08CE5778")
void * const gpBonusClaimDataUpdated = gBonusClaimDataUpdated;

SECTION(".rodata.08CE577C")
void * const gpBonusClaimItemList = gBonusClaimItemList;

SECTION(".rodata.08CE5788")
void * const gpBonusClaimConfig = gBonusClaimConfig;

SECTION(".rodata.08CE5780")
void * const gpBonusClaimItemCount = gBonusClaimItemCount;

SECTION(".rodata.08CE5784")
void * const gpBonusClaimText = gBonusClaimText;

SECTION(".rodata.08CEDDFC")
void * const gpEpilogueStrBuf = gEpilogueStrBuf;

SECTION(".rodata.08CEE15C")
void * const gpDefeatedEndingLocString = gEpilogueStrBuf;

SECTION(".rodata.08CEDE00")
void * const gpEpilogueEnts = gEpilogueEnts;

SECTION(".rodata.08CEE868")
void * const gpCharacterEndingTexts = gCharacterEndingTexts;

SECTION(".rodata.08CEEBA4")
void * const gpTurnRecordTexts = gTurnRecordTexts;

SECTION(".rodata.08CEEF68")
void * const gpEndingCgScrollBlendTable = gEndingCgScrollBlendTable;

SECTION(".rodata.08CEF074")
void * const gUnk_08CEF074 = gUnkOpAnim_02000018;

SECTION(".rodata.08CEF078")
void * const gUnk_08CEF078 = gUnkOpAnim_02002018;

SECTION(".rodata.08CEF07C")
void * const gUnk_08CEF07C = gUnkOpAnim_02003018;

SECTION(".rodata.08CEF080")
void * const gUnk_08CEF080 = gUnkOpAnim_02005018;

SECTION(".rodata.08CE54B0")
void * const gpSoundInfo = gSoundInfo;

SECTION(".rodata.08CC5798")
void * const sSupportScreenUnits = gSupportScreenUnits;

SECTION(".rodata.08B909B8")
void * const sTalkSt = sTalkStData;
