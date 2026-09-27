#include "gbafe.h"

/**
 * Display standing map sprites and various tile/unit markers
 * (FE8U: bmudisp.c)
 */

struct UnitIconWait {
    /* 00 */ u16 unk00;
    /* 02 */ u16 size;
    /* 04 */ u8 const * sheet;
};

enum {
    UNIT_ICON_SIZE_16x16,
    UNIT_ICON_SIZE_16x32,
    UNIT_ICON_SIZE_32x32,
};

#define UNITSPRITE_ID_BITS 7
#define UNITSPRITE_MAX 0xD0

extern struct UnitIconWait CONST_DATA unit_icon_wait_table[];

extern u8 gUnitSpriteSlots[UNITSPRITE_MAX];
extern u8 gSMSGfxBuffer[3][8 * 0x20 * 0x20];
extern int gSMS16xGfxIndexCounter;
extern int gSMS32xGfxIndexCounter;
extern int gSMSSyncFlag;

extern u8 * CONST_DATA UnitSpriteUnpackBuf;
extern int CONST_DATA gSomeSMSLookupTable[];
extern u16 CONST_DATA sSlotToChrLut[];

extern u16 CONST_DATA Pal_MapSprite[];
extern u16 CONST_DATA Pal_MapSpriteArena[];
extern u16 CONST_DATA Pal_MapSpritePurple[];
extern u16 CONST_DATA Pal_MapSpriteSepia[];

#define GetInfo(id) (unit_icon_wait_table[(id) & ((1 << UNITSPRITE_ID_BITS) - 1)])

int ApplyUnitSpriteImage16x16(int slot, u32 id);
int ApplyUnitSpriteUiImage16x16(int slot, u32 id);
int ApplyUnitSpriteImage16x32(int slot, u32 id);
int ApplyUnitSpriteImage32x32(int slot, u32 id);

void IncUnitSpriteSyncFlag(void)
{
    gSMSSyncFlag++;
}

void ApplyUnitSpritePalettes(void)
{
    ApplyPalettes(Pal_MapSprite, 0x1C, 4);

    if (gBmSt.flags & BM_FLAG_LINKARENA)
        ApplyPalette(Pal_MapSpriteArena, 0x1B);
    else
        ApplyPalette(Pal_MapSpritePurple, 0x1B);
}

void ApplyUnitSpriteSepiaPalette(void)
{
    ApplyPalette(Pal_MapSpriteSepia, 0x1E);
}

void ResetUnitSprites(void)
{
    int i;

    for (i = UNITSPRITE_MAX - 1; i >= 0; i--)
        gUnitSpriteSlots[i] |= 0xFF;

    gSMS32xGfxIndexCounter = 0;
    gSMS16xGfxIndexCounter = 0x40 - 1;
}

void ResetUnitSpritesB(void)
{
    int i;

    for (i = UNITSPRITE_MAX - 1; i >= 0; i--)
        gUnitSpriteSlots[i] |= 0xFF;

    gSMS32xGfxIndexCounter = 0;
    gSMS16xGfxIndexCounter = 0x60 - 1;
}

int StartUiSMS(int smsId, int frameId)
{
    int slot = gSomeSMSLookupTable[frameId];
    Decompress(GetInfo(smsId).sheet, UnitSpriteUnpackBuf);

    switch (GetInfo(smsId).size)
    {
    case UNIT_ICON_SIZE_16x16:
        gUnitSpriteSlots[frameId] = ApplyUnitSpriteUiImage16x16(slot, smsId) / 2;
        break;

    case UNIT_ICON_SIZE_16x32:
        gUnitSpriteSlots[frameId] = ApplyUnitSpriteImage16x32(slot, smsId) / 2;
        break;

    case UNIT_ICON_SIZE_32x32:
        gUnitSpriteSlots[frameId] = ApplyUnitSpriteImage32x32(slot, smsId) / 2;
        break;
    }

    return gUnitSpriteSlots[frameId] << 1;
}

int UseUnitSprite(u32 id)
{
    if (gUnitSpriteSlots[id] == 0xFF)
    {
        Decompress(GetInfo(id).sheet, UnitSpriteUnpackBuf);

        switch (GetInfo(id).size)
        {
        case UNIT_ICON_SIZE_16x16:
            gUnitSpriteSlots[id] = ApplyUnitSpriteImage16x16(gSMS16xGfxIndexCounter, id) / 2;
            gSMS16xGfxIndexCounter -= 1;
            break;

        case UNIT_ICON_SIZE_16x32:
            gUnitSpriteSlots[id] = ApplyUnitSpriteImage16x32(gSMS32xGfxIndexCounter, id) / 2;
            gSMS32xGfxIndexCounter += 2;
            break;

        case UNIT_ICON_SIZE_32x32:
            if ((gSMS32xGfxIndexCounter & 0x1E) == 0x1E)
                gSMS32xGfxIndexCounter += 2;

            gUnitSpriteSlots[id] = ApplyUnitSpriteImage32x32(gSMS32xGfxIndexCounter, id) / 2;
            gSMS32xGfxIndexCounter += 4;
            break;
        }

        gSMSSyncFlag++;
    }

    return gUnitSpriteSlots[id] << 1;
}

int ApplyUnitSpriteImage16x16(int slot, u32 id)
{
    int i;
    int outOff = sSlotToChrLut[slot] * CHR_SIZE;
    id = ((id >> UNITSPRITE_ID_BITS) ^ 1) & 1;

    for (i = 0; i < 3; i++)
    {
        int imgOff = (i * id) * 4 * CHR_SIZE;

        CpuFastCopy(
            UnitSpriteUnpackBuf + 0 * CHR_SIZE + imgOff,
            gSMSGfxBuffer[i] + 0 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
        CpuFastCopy(
            UnitSpriteUnpackBuf + 2 * CHR_SIZE + imgOff,
            gSMSGfxBuffer[i] + 1 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
    }

    return sSlotToChrLut[slot];
}

int ApplyUnitSpriteUiImage16x16(int slot, u32 id)
{
    int i;
    int outOff = sSlotToChrLut[slot] * CHR_SIZE;
    id = ((id >> UNITSPRITE_ID_BITS) ^ 1) & 1;

    for (i = 0; i < 3; i++)
    {
        int imgOff = (i * id) * 4 * CHR_SIZE;

        CpuFastFill(0, gSMSGfxBuffer[i] + 0 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
        CpuFastFill(0, gSMSGfxBuffer[i] + 1 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);

        CpuFastCopy(
            UnitSpriteUnpackBuf + 0 * CHR_SIZE + imgOff,
            gSMSGfxBuffer[i] + 2 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
        CpuFastCopy(
            UnitSpriteUnpackBuf + 2 * CHR_SIZE + imgOff,
            gSMSGfxBuffer[i] + 3 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
    }

    return sSlotToChrLut[slot];
}

int ApplyUnitSpriteImage16x32(int slot, u32 id)
{
    int i;

    int outOff = sSlotToChrLut[slot] * CHR_SIZE;
    id = ((id >> UNITSPRITE_ID_BITS) ^ 1) & 1;

    for (i = 0; i < 3; i++)
    {
        int imgOff = (i * id) * 8 * CHR_SIZE;

        CpuFastCopy(UnitSpriteUnpackBuf + 0 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 0 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
        CpuFastCopy(UnitSpriteUnpackBuf + 2 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 1 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
        CpuFastCopy(UnitSpriteUnpackBuf + 4 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 2 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
        CpuFastCopy(UnitSpriteUnpackBuf + 6 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 3 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
    }

    return sSlotToChrLut[slot];
}

int ApplyUnitSpriteImage32x32(int slot, u32 id)
{
    int i;
    int outOff = sSlotToChrLut[slot] * CHR_SIZE;

    id = ((id >> UNITSPRITE_ID_BITS) ^ 1) & 1;

    for (i = 0; i < 3; i++)
    {
        int imgOff = (i * id) * 16 * CHR_SIZE;

        CpuFastCopy(UnitSpriteUnpackBuf + 0 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 0 * CHR_SIZE * CHR_LINE + outOff, 4 * CHR_SIZE);
        CpuFastCopy(UnitSpriteUnpackBuf + 4 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 1 * CHR_SIZE * CHR_LINE + outOff, 4 * CHR_SIZE);
        CpuFastCopy(UnitSpriteUnpackBuf + 8 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 2 * CHR_SIZE * CHR_LINE + outOff, 4 * CHR_SIZE);
        CpuFastCopy(UnitSpriteUnpackBuf + 12 * CHR_SIZE + imgOff, gSMSGfxBuffer[i] + 3 * CHR_SIZE * CHR_LINE + outOff, 4 * CHR_SIZE);
    }

    return sSlotToChrLut[slot];
}
