#include "gbafe.h"

extern u16 gUnk_08B94060[], gUnk_08B94068[], gUnk_08B940C8[], gUnk_08B940E4[],
    sSprite_BerserkIconA[], sSprite_BerserkIconB[], sSprite_BerserkIconC[], sSprite_BerserkIconD[],
    sSprite_BerserkIconE[], sSprite_BerserkIconF[], sSprite_BerserkIconG[], sSprite_BerserkIconH[],
    sSprite_BerserkIconI[], sSprite_None[], sSprite_PoisonIconA[], sSprite_PoisonIconC[],
    sSprite_PoisonIconE[], sSprite_PoisonIconF[], sSprite_PoisonIconG[], sSprite_PoisonIconH[],
    sSprite_SleepIconA[], sSprite_SleepIconB[], sSprite_SleepIconC[], sSprite_SleepIconD[],
    sSprite_SleepIconE[], sSprite_SleepIconF[], sSprite_SleepIconG[];

/**
 * Display standing map sprites and various tile/unit markers
 * (FE8U: bmudisp.c)
 */

#define UNITSPRITE_ID_BITS 7
#define UNITSPRITE_MAX 0xD0

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
#if MOD_CLAUDE
extern const u16 Pal_MapSprite_Flower[];
#endif

#define GetInfo(id) (unit_icon_wait_table[(id) & ((1 << UNITSPRITE_ID_BITS) - 1)])

int ApplyUnitSpriteImage16x16(int slot, u32 id);
int ApplyUnitSpriteUiImage16x16(int slot, u32 id);
int ApplyUnitSpriteImage16x32(int slot, u32 id);
int ApplyUnitSpriteImage32x32(int slot, u32 id);
extern u16 CONST_DATA sTornOutPixelLut[];
int GetUnitSpritePalette(struct Unit const * unit);

struct SMSHandle {
    /* 00 */ struct SMSHandle * pNext;
    /* 04 */ short xDisplay;
    /* 06 */ short yDisplay;
    /* 08 */ u16 oam2Base;
    /* 0A */ u8 _u0A;
    /* 0B */ s8 config;
};

extern struct SMSHandle gSMSHandleArray[];
extern struct SMSHandle * gSMSHandleIt;

struct SMSHandle * AddUnitSprite(int y);
void PutChapterMarkedTileIconOam(void);

extern u16 const sRescuePalLut[3];
extern u16 * const sSleepIconSprites[];
extern u16 * const sBerserkIconSprites[];
extern u16 * const sSilenceIconSprites[];
extern u16 * const sPoisonIconSprites[];
extern u16 CONST_DATA sSprite_StatusUpIcon[];

void * memcpy(void * dst, const void * src, unsigned long n);
u8 GetUnitSpriteHideFlag(struct Unit * unit);

extern int gMapSpriteSwitchHoverTimer;

extern u16 CONST_DATA sSprite_16x16_Blend[];
extern u16 CONST_DATA sSprite_16x32_Blend[];
extern u16 CONST_DATA sSprite_32x32_Blend[];
extern u16 CONST_DATA sSprite_16x16_Window[];
extern u16 CONST_DATA sSprite_16x32_Window[];
extern u16 CONST_DATA sSprite_32x32_Window[];

int GetClassSMSId(int jid);

void IncUnitSpriteSyncFlag(void)
{
    gSMSSyncFlag++;
}

void ApplyUnitSpritePalettes(void)
{
    ApplyPalettes(Pal_MapSprite, 0x1C, 4);

    if (gBmSt.flags & BM_FLAG_LINKARENA)
        ApplyPalette(Pal_MapSpriteArena, 0x1B);
#if MOD_CLAUDE
    // the flower character's map palette: Pal_MapSpritePurple's colors 0-5,
    // then its coral, lavender and white (mod/claude/art/mapsprite.py)
    else
        ApplyPalette(Pal_MapSprite_Flower, 0x1B);
#else
    else
        ApplyPalette(Pal_MapSpritePurple, 0x1B);
#endif
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

void TornOutUnitSprite(struct Unit * unit, int timer)
{
    u8 r4;
    u16 r6;
    int r7;
    int i, j;
    int slot;

    slot = GetUnitSMSId(unit);
    r7 = UseUnitSprite(slot) * 0x20;
    r6 = sTornOutPixelLut[timer];

    r4 = 0;
    i = GetGameTime() % 0x48;

    if (i >= 0x44) r4 = 1;
    if (i >= 0x24) r4 = 2;
    if (i >= 0x20) r4 = 1;
    if (i >= 0) r4 = 0;

    switch (GetInfo(slot).size)
    {
    case 0:
        for (i = 0; i < 3; i++)
        {
            for (j = 0; j < 2; j++)
            {
                { int offset = 0 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2); }
                { int offset = 1 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2); }
            }
        }

        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 0 * CHR_SIZE * CHR_LINE], (u8 *) (r7 + (VRAM + 0x11000)), 2 * CHR_SIZE);
        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 1 * CHR_SIZE * CHR_LINE], (u8 *) (r7 + (VRAM + 0x11400)), 2 * CHR_SIZE);
        break;

    case 1:
        for (i = 0; i < 3; i++)
        {
            int var = 2; // for reordering the unrolled expressions
            for (j = 0; j < 2; j++)
            {
                { int offset = 0 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << var); }
                { int offset = 1 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);   }
                { int offset = 2 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);   }
                { int offset = 3 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);   }
            }
        }

        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 0 * CHR_SIZE * CHR_LINE], (u8 *) (r7 + (VRAM + 0x11000)), 2 * CHR_SIZE);
        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 1 * CHR_SIZE * CHR_LINE], (u8 *) (r7 + (VRAM + 0x11400)), 2 * CHR_SIZE);
        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 2 * CHR_SIZE * CHR_LINE], (u8 *) (r7 + (VRAM + 0x11800)), 2 * CHR_SIZE);
        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 3 * CHR_SIZE * CHR_LINE], (u8 *) (r7 + (VRAM + 0x11C00)), 2 * CHR_SIZE);
        break;

    case 2:
        for (i = 0; i < 3; i++)
        {
            int var = 2;
            for (j = 0; j < 4; j++)
            {
                { int offset = 0 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << var); }
                { int offset = 1 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);   }
                { int offset = 2 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);   }
                { int offset = 3 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);   }
            }
        }

        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 0 * CHR_SIZE * CHR_LINE], (u8 *) (r7 + (VRAM + 0x11000)), 4 * CHR_SIZE);
        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 1 * CHR_SIZE * CHR_LINE], (u8 *) (r7 + (VRAM + 0x11400)), 4 * CHR_SIZE);
        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 2 * CHR_SIZE * CHR_LINE], (u8 *) (r7 + (VRAM + 0x11800)), 4 * CHR_SIZE);
        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 3 * CHR_SIZE * CHR_LINE], (u8 *) (r7 + (VRAM + 0x11C00)), 4 * CHR_SIZE);
        break;
    }

    if (timer == 0x3f)
        gUnitSpriteSlots[slot] |= 0xff;
}

void SyncUnitSpriteSheet(void)
{
    int frame = GetGameTime() % 72;

    if (frame == 0)
        CpuFastCopy(gSMSGfxBuffer[0], (void *) (VRAM + 0x11000), sizeof(gSMSGfxBuffer[0]));

    if (frame == 32)
        CpuFastCopy(gSMSGfxBuffer[1], (void *) (VRAM + 0x11000), sizeof(gSMSGfxBuffer[1]));

    if (frame == 36)
        CpuFastCopy(gSMSGfxBuffer[2], (void *) (VRAM + 0x11000), sizeof(gSMSGfxBuffer[2]));

    if (frame == 68)
        CpuFastCopy(gSMSGfxBuffer[1], (void *) (VRAM + 0x11000), sizeof(gSMSGfxBuffer[1]));
}

void ForceSyncUnitSpriteSheet(void)
{
    int frame;
    gSMSSyncFlag = 0;

    frame = GetGameTime() % 72;

    if (frame >= 68)
    {
        RegisterDataMove(gSMSGfxBuffer[1], (void *) (VRAM + 0x11000), sizeof(gSMSGfxBuffer[1]));
        return;
    }

    if (frame >= 36)
    {
        RegisterDataMove(gSMSGfxBuffer[2], (void *) (VRAM + 0x11000), sizeof(gSMSGfxBuffer[2]));
        return;
    }

    if (frame >= 32)
    {
        RegisterDataMove(gSMSGfxBuffer[1], (void *) (VRAM + 0x11000), sizeof(gSMSGfxBuffer[1]));
        return;
    }

    if (frame >= 0)
    {
        RegisterDataMove(gSMSGfxBuffer[0], (void *) (VRAM + 0x11000), sizeof(gSMSGfxBuffer[0]));
        return;
    }
}

void SyncUiSMS(int frameId, u8 * dst)
{
    int i;
    int off;

    int frame = GetGameTime() % 72;

    u8 * src = NULL;

    if (frame == 0)
        src = gSMSGfxBuffer[0];

    if (frame == 32)
        src = gSMSGfxBuffer[1];

    if (frame == 36)
        src = gSMSGfxBuffer[2];

    if (frame == 68)
        src = gSMSGfxBuffer[1];

    if (src == NULL)
        return;

    off = gSomeSMSLookupTable[frameId] * CHR_SIZE;

    for (i = 0; i <= 3; i++)
    {
        u32 a = off + 0 * CHR_SIZE + i * CHR_SIZE * CHR_LINE;
        u32 b = off + 1 * CHR_SIZE + i * CHR_SIZE * CHR_LINE;
        CpuFastCopy(src + a, dst + b, 2 * CHR_SIZE);
    }
}

void SetStandingMuFacing(int frameId, u8 * dst)
{
    int i;
    int off;

    int frame = GetGameTime() % 72;

    u8 * src = NULL;

    if (frame >= 68)
        src = gSMSGfxBuffer[1];
    else if (frame >= 36)
        src = gSMSGfxBuffer[2];
    else if (frame >= 32)
        src = gSMSGfxBuffer[1];
    else if (frame >= 0)
        src = gSMSGfxBuffer[0];

    if (src == NULL)
        return;

    off = gSomeSMSLookupTable[frameId] * 0x20;

    for (i = 0; i <= 3; i++)
    {
        u32 a = off + 0 * CHR_SIZE + i * CHR_SIZE * CHR_LINE;
        u32 b = off + 1 * CHR_SIZE + i * CHR_SIZE * CHR_LINE;

        RegisterDataMove(src + a, dst + b, 2 * CHR_SIZE);
    }
}

int GetUnitDisplayedSpritePalette(struct Unit const * unit)
{
    if (unit->state & US_BIT27)
        return 0xB;

    if (unit->state & US_UNSELECTABLE)
        return 0xF;

    return GetUnitSpritePalette(unit);
}

int GetUnitSpritePalette(struct Unit const * unit)
{
#if MOD_CLAUDE
    // the flower character keeps its colors on the player's side (OBJ
    // palette 11, ApplyUnitSpritePalettes); elsewhere it takes the faction's
    if (UNIT_FACTION(unit) == FACTION_BLUE && unit->pCharacterData->number == CHARACTER_FLOWER
        && !(gBmSt.flags & BM_FLAG_LINKARENA))
        return 0xB;
#endif
    switch (UNIT_FACTION(unit))
    {
    case FACTION_BLUE:
        return 0xC;

    case FACTION_RED:
        return 0xD;

    case FACTION_GREEN:
        return 0xE;

    case FACTION_PURPLE:
        return 0xB;
    }
}

void RefreshUnitSprites(void)
{
    struct SMSHandle * smsHandle;

    struct Trap * trap;
    int i;
    u16 oam2 = 0;
    struct SMSHandle * nullHandle = NULL;

    gSMSHandleIt = &gSMSHandleArray[0];

    gSMSHandleIt->pNext = nullHandle;
    gSMSHandleIt->yDisplay = 0x400;

    gSMSHandleIt = &gSMSHandleArray[1];

    for (i = 1; i < FACTION_PURPLE + 6; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        unit->pMapSpriteHandle = NULL;

        if (unit->state & (US_HIDDEN | US_CONCEALED))
            continue;

#if !PLATFORM_GBA
        // (before the chapter's maps exist the GBA reads through NULL)
        if (gBmMapUnit == NULL)
            continue;
#endif
        if (gBmMapUnit[unit->yPos][unit->xPos] == 0)
            continue;

        smsHandle = AddUnitSprite(unit->yPos * 16);

        smsHandle->yDisplay = unit->yPos * 16;
        smsHandle->xDisplay = unit->xPos * 16;

        smsHandle->oam2Base = UseUnitSprite(GetUnitSMSId(unit)) + 0x80 + (GetUnitDisplayedSpritePalette(unit) & 0xf) * 0x1000;

        smsHandle->config = GetInfo(GetUnitSMSId(unit)).size;

        if (unit->state & 0x100)
            smsHandle->config += 3;

        if (unit->state & 0x1000000)
            smsHandle->config += 0x40;

        unit->pMapSpriteHandle = smsHandle;
    }

    for (trap = GetTrap(0); trap->type != 0; trap++)
    {
        if (trap->type == 1 && trap->data[1] == 0)
        {
            switch (trap->extra)
            {
            case 0x34:
                oam2 = UseUnitSprite(0x52) - 0x4000 + 0x80;
                break;

            case 0x35:
                oam2 = UseUnitSprite(0x53) - 0x4000 + 0x80;
                break;

            case 0x36:
                oam2 = UseUnitSprite(0x54) - 0x4000 + 0x80;
                break;
            }

            smsHandle = AddUnitSprite(trap->yPos * 16);

            smsHandle->yDisplay = trap->yPos * 16;
            smsHandle->xDisplay = trap->xPos * 16;

            smsHandle->oam2Base = oam2;

            smsHandle->config = GetInfo(0x52).size;
        }

        if (trap->type == 0xC)
        {
            smsHandle = AddUnitSprite(trap->yPos * 16);
            smsHandle->yDisplay = trap->yPos * 16;
            smsHandle->xDisplay = trap->xPos * 16;

            smsHandle->oam2Base = UseUnitSprite(0x57) - 0x5000 + 0x80;

            smsHandle->config = GetInfo(0x57).size;
        }
    }

    if (gSMSSyncFlag != 0)
        ForceSyncUnitSpriteSheet();
}

struct SMSHandle * AddUnitSprite(int y)
{
    struct SMSHandle * it = gSMSHandleArray;

    while (1)
    {
        if (it->pNext == NULL || it->pNext->yDisplay < y)
        {
            gSMSHandleIt->pNext = it->pNext;
            gSMSHandleIt = (it->pNext = gSMSHandleIt) + 1;

            return it->pNext;
        }

        it = it->pNext;
    }
}

void PutUnitSpritesOam(void)
{
    struct SMSHandle * it = gSMSHandleArray->pNext;

    PutUnitSpriteIconsOam();

    if (it == NULL)
        return;

    for (; it != NULL; it = it->pNext)
    {
        int r3 = 0;

        int x = it->xDisplay - gBmSt.camera.x;
        int y = it->yDisplay - gBmSt.camera.y;

        if (x < -16 || x > DISPLAY_WIDTH)
            continue;

        if (y < -32 || y > DISPLAY_HEIGHT)
            continue;

        if (it->config & 0x80)
            continue;

        if (it->config & 0x40)
            r3 = GetGameTime() & 2;

        switch ((it->config & 0xf))
        {
        case 0:
            PutOamHiRam(OAM1_X(x + r3 + 0x200), OAM0_Y(0x100 + y), Sprite_16x16, it->oam2Base + OAM2_LAYER(2));
            break;

        case 1:
            PutOamHiRam(OAM1_X(x + r3 + 0x200), OAM0_Y(0x100 + y - 16), Sprite_16x32, it->oam2Base + OAM2_LAYER(2));
            break;

        case 2:
            PutOamHiRam(OAM1_X((x - 8) + r3 + 0x200), OAM0_Y(0x100 + y - 16), Sprite_32x32, it->oam2Base + OAM2_LAYER(2));
            break;

        case 3:
            PutOamHiRam(OAM1_X(x + r3 + 0x200), OAM0_Y(0x100 + y), Sprite_16x16, it->oam2Base + OAM2_LAYER(3));
            break;

        case 4:
            PutOamHiRam(OAM1_X(x + r3 + 0x200), OAM0_Y(0x100 + y - 16), Sprite_16x32, it->oam2Base + OAM2_LAYER(3));
            break;

        case 5:
            PutOamHiRam(OAM1_X((x - 8) + r3 + 0x200), OAM0_Y(0x100 + y - 16), Sprite_32x32, it->oam2Base + OAM2_LAYER(3));
            break;
        }
    }
}

void PutChapterMarkedTileIconOam(void)
{
    int x;
    int y;
    int xTile;
    int yTile;
    int shouldDisplay;

    // NOTE: chapterdata.h names 0x93/0x94 destPosY/unk94, but here they are the x/y of the marked tile
    xTile = GetChapterInfo(gPlaySt.chapterIndex)->destPosY;
    yTile = GetChapterInfo(gPlaySt.chapterIndex)->unk94;

    shouldDisplay = (GetGameTime() & 0x1f) < 0x14 ? 1 : 0;

    if (xTile == 0xFF)
        return;

    if (shouldDisplay == 0)
        return;

    if (gBmMapFog[yTile][xTile] == 0)
        return;

    if (gBmMapTerrain[yTile][xTile] == TERRAIN_ROOF)
        return;

    x = xTile * 16 - gBmSt.camera.x;
    y = yTile * 16 - gBmSt.camera.y;

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -16 || y > DISPLAY_HEIGHT)
        return;

    PutOamHiRam(OAM1_X(0x200 + x + 4), OAM0_Y(0x100 + y + 7), Sprite_8x8, 0xC51);
}

void PutUnitSpriteIconsOam(void)
{
    u8 protectCharacterId;
    int i;
    int x;
    int y;
    s8 displayRescueIcon;

    int poisonIconFrame;
    int sleepIconFrame;
    int berserkIconFrame;
    int silenceIconFrame;

    u16 rescuePalLut[3];

    memcpy(rescuePalLut, sRescuePalLut, sizeof(rescuePalLut));

    // NOTE: chapterdata.h names 0x92 destPosX, but it is the protected character here
    protectCharacterId = GetChapterInfo(gPlaySt.chapterIndex)->destPosX;

    displayRescueIcon = (GetGameTime() % 32) < 20 ? 1 : 0;

    poisonIconFrame = GetGameTime() / 8 % 12;
    sleepIconFrame = GetGameTime() / 16 % 7;
    berserkIconFrame = GetGameTime() / 8 % 9;
    silenceIconFrame = GetGameTime() / 4 % 18;

    if (CheckFlag(0x91) != 0)
        return;

    PutChapterMarkedTileIconOam();

    for (i = 1; i < 0xc0; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_HIDDEN)
            continue;

        if (GetUnitSpriteHideFlag(unit) != 0)
            continue;

        switch (unit->statusIndex)
        {
        case UNIT_STATUS_POISON:
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                break;

            if (y < -16 || y > DISPLAY_HEIGHT)
                break;

            PutOamHiRam(OAM1_X(0x200 + x - 2), OAM0_Y(0x100 + y - 4), sPoisonIconSprites[poisonIconFrame], 0);
            break;

        case UNIT_STATUS_SILENCED:
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                break;

            if (y < -16 || y > DISPLAY_HEIGHT)
                break;

            PutOamHiRam(OAM1_X(0x200 + x - 2), OAM0_Y(0x100 + y - 4), sSilenceIconSprites[silenceIconFrame], 0);
            break;

        case UNIT_STATUS_SLEEP:
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                break;

            if (y < -16 || y > DISPLAY_HEIGHT)
                break;

            PutOamHiRam(OAM1_X(0x200 + x + 2), OAM0_Y(0x100 + y), sSleepIconSprites[sleepIconFrame], 0);
            break;

        case UNIT_STATUS_BERSERK:
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                break;

            if (y < -16 || y > DISPLAY_HEIGHT)
                break;

            PutOamHiRam(OAM1_X(0x200 + x + 1), OAM0_Y(0x100 + y - 5), sBerserkIconSprites[berserkIconFrame], 0);
            break;

        case UNIT_STATUS_ATTACK:
        case UNIT_STATUS_DEFENSE:
        case UNIT_STATUS_CRIT:
        case UNIT_STATUS_AVOID:
            if (!displayRescueIcon)
                continue;

            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                break;

            if (y < -16 || y > DISPLAY_HEIGHT)
                break;

            PutOamHiRam(OAM1_X(0x200 + x - 1), OAM0_Y(0x100 + y - 5), sSprite_StatusUpIcon, 0);
            break;
        }

        if (!displayRescueIcon)
            continue;

        if (unit->state & US_RESCUING)
        {
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                continue;

            if (y < -16 || y > DISPLAY_HEIGHT)
                continue;

            PutOamHiRam(OAM1_X(0x200 + x + 9), OAM0_Y(0x100 + y + 7), Sprite_8x8, (rescuePalLut[unit->rescue >> 6] & 0xf) * 0x1000 + 0x803);
        }
        else if ((UNIT_FACTION(unit) != FACTION_BLUE) && (UNIT_CATTRIBUTES(unit) & CA_BOSS))
        {
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                continue;

            if (y < -16 || y > DISPLAY_HEIGHT)
                continue;

            PutOamHiRam(OAM1_X(0x200 + x + 9), OAM0_Y(0x100 + y + 7), Sprite_8x8, 0x810);
        }
        else if (protectCharacterId == unit->pCharacterData->number)
        {
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                continue;

            if (y < -16 || y > DISPLAY_HEIGHT)
                continue;

            PutOamHiRam(OAM1_X(0x200 + x + 9), OAM0_Y(0x100 + y + 7), Sprite_8x8, 0x811);
        }
    }
}

void ResetUnitSpriteHoverCursor(void)
{
    gBmSt.cursor_previous.x = -1;
}

void ResetUnitSpriteHover(void)
{
    gMapSpriteSwitchHoverTimer = 0;
}

// view of gBmSt's cursor/cursor_previous as whole words
struct BmStCursorWords {
    /* 00 */ u8 pad[0x14];
    /* 14 */ u32 cursor;
    /* 18 */ u32 cursor_previous;
};

void UnitSpriteHoverUpdate(void)
{
    struct Unit * unit;

    unit = GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]);

    if (unit)
    {
        if (!(unit->state & US_UNSELECTABLE)
            && (UNIT_FACTION(unit) == FACTION_BLUE)
            && unit->statusIndex != UNIT_STATUS_BERSERK
            && unit->statusIndex != UNIT_STATUS_SLEEP)
        {
            gMapSpriteSwitchHoverTimer++;

            if (gMapSpriteSwitchHoverTimer == 5)
            {
                StartMu(unit);
                HideUnitSprite(unit);
                return;
            }
        }
    }

    if (((struct BmStCursorWords *) &gBmSt)->cursor_previous != ((struct BmStCursorWords *) &gBmSt)->cursor)
    {
        gMapSpriteSwitchHoverTimer = 0;
        unit = GetUnit(gBmMapUnit[gBmSt.cursor_previous.y][gBmSt.cursor_previous.x]);

        if (unit)
        {
            EndAllMus();
            ShowUnitSprite(unit);
        }
    }
}

bool IsUnitSpriteHoverEnabledAt(int x, int y)
{
    struct Unit * unit = GetUnit(gBmMapUnit[y][x]);

    if (!unit)
        return FALSE;

    if (unit->state & US_UNSELECTABLE)
        return FALSE;

    if (UNIT_FACTION(unit) != FACTION_BLUE)
        return FALSE;

    if (unit->statusIndex != UNIT_STATUS_BERSERK && unit->statusIndex != UNIT_STATUS_SLEEP)
        return TRUE;

    return FALSE;
}

void PutUnitSprite(int layer, int x, int y, struct Unit * unit)
{
    u32 id = GetUnitSMSId(unit);
    int chr = UseUnitSprite(id);

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT)
        return;

    switch (GetInfo(id).size)
    {
    case UNIT_ICON_SIZE_16x16:
        PutSprite(layer, x, y, Sprite_16x16, (GetUnitDisplayedSpritePalette(unit) & 0xf) * 0x1000 + 0x880 + chr);
        break;

    case UNIT_ICON_SIZE_16x32:
        PutSprite(layer, x, y - 16, Sprite_16x32, (GetUnitDisplayedSpritePalette(unit) & 0xf) * 0x1000 + 0x880 + chr);
        break;

    case UNIT_ICON_SIZE_32x32:
        PutSprite(layer, x - 8, y - 16, Sprite_32x32, (GetUnitDisplayedSpritePalette(unit) & 0xf) * 0x1000 + 0x880 + chr);
        break;
    }
}

void PutUnitSpriteForClassId(int layer, int x, int y, u16 oam2, int class)
{
    u32 id = GetClassSMSId(class);
    int chr = UseUnitSprite(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT)
        return;

    switch (GetInfo(id).size)
    {
    case UNIT_ICON_SIZE_16x16:
        PutSprite(layer, x, y, Sprite_16x16, oam2 + chr);
        break;

    case UNIT_ICON_SIZE_16x32:
        PutSprite(layer, x, y - 16, Sprite_16x32, oam2 + chr);
        break;

    case UNIT_ICON_SIZE_32x32:
        PutSprite(layer, x - 8, y - 16, Sprite_32x32, oam2 + chr);
        break;
    }
}

void sub_08026250(int layer, int x, int y, int class)
{
    u32 id = GetClassSMSId(class);
    int chr = UseUnitSprite(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT)
        return;

    switch (GetInfo(id).size)
    {
    case UNIT_ICON_SIZE_16x16:
        PutSpriteExt(layer, x, y + OAM0_WINDOW, Sprite_16x16, chr);
        break;

    case UNIT_ICON_SIZE_16x32:
        PutSpriteExt(layer, x, OAM0_Y(y - 16) + OAM0_WINDOW, Sprite_16x32, chr);
        break;

    case UNIT_ICON_SIZE_32x32:
        PutSpriteExt(layer, OAM1_X(x - 8), OAM0_Y(y - 16) + OAM0_WINDOW, Sprite_32x32, chr);
        break;
    }
}

void sub_08026308(int layer, int x, int y, u16 oam2, int class, int idx)
{
    u32 id = GetClassSMSId(class);
    int chr = gSomeSMSLookupTable[idx] + 1;

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT)
        return;

    switch (GetInfo(id).size)
    {
    case UNIT_ICON_SIZE_16x16:
    case UNIT_ICON_SIZE_16x32:
        PutSprite(layer, x, y - 16, Sprite_16x32, (oam2) + chr);
        break;

    case UNIT_ICON_SIZE_32x32:
        PutSprite(layer, x - 8, y - 16, Sprite_32x32, (oam2) + chr);
        break;
    }
}

void sub_080263A0(int layer, int x, int y, int oam2, struct Unit * unit)
{
    u32 id = GetUnitSMSId(unit);
    int chr = UseUnitSprite(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT)
        return;

    switch (GetInfo(id).size)
    {
    case UNIT_ICON_SIZE_16x16:
        PutSprite(layer, x, y, Sprite_16x16, oam2 + (GetUnitSpritePalette(unit) & 0xf) * 0x1000 + chr);
        break;

    case UNIT_ICON_SIZE_16x32:
        PutSprite(layer, x, y - 16, Sprite_16x32, oam2 + (GetUnitSpritePalette(unit) & 0xf) * 0x1000 + chr);
        break;

    case UNIT_ICON_SIZE_32x32:
        PutSprite(layer, x - 8, y - 16, Sprite_32x32, oam2 + (GetUnitSpritePalette(unit) & 0xf) * 0x1000 + chr);
        break;
    }
}

void PutBlendWindowUnitSprite(int layer, int x, int y, int oam2, struct Unit * unit)
{
    u32 id = GetUnitSMSId(unit);
    int chr = UseUnitSprite(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT)
        return;

    switch (GetInfo(id).size)
    {
    case UNIT_ICON_SIZE_16x16:
        PutSprite(layer, x, y, sSprite_16x16_Blend, oam2 + chr);
        PutSprite(layer, x, y, sSprite_16x16_Window, oam2 + chr);
        break;

    case UNIT_ICON_SIZE_16x32:
        PutSprite(layer, x, y - 16, sSprite_16x32_Blend, oam2 + chr);
        PutSprite(layer, x, y - 16, sSprite_16x32_Window, oam2 + chr);
        break;

    case UNIT_ICON_SIZE_32x32:
        PutSprite(layer, x - 8, y - 16, sSprite_32x32_Blend, oam2 + chr);
        PutSprite(layer, x - 8, y - 16, sSprite_32x32_Window, oam2 + chr);
        break;
    }
}

void ClearUnitSpriteHandles(void)
{
    gSMSHandleArray[0].pNext = NULL;
}

void HideUnitSprite(struct Unit * unit)
{
    if (!unit)
        RefreshUnitSprites();

    if (!unit->pMapSpriteHandle)
        return;

    unit->pMapSpriteHandle->config |= 0x80;
}

void ShowUnitSprite(struct Unit * unit)
{
    if (!unit->pMapSpriteHandle)
        return;

    unit->pMapSpriteHandle->config &= ~(0x80);
}

u8 GetUnitSpriteHideFlag(struct Unit * unit)
{
    if (!unit->pMapSpriteHandle)
        return 0x80;

    return unit->pMapSpriteHandle->config & 0x80;
}

void sub_080265C0(u32 (*r8)[1][1], int r5, int r9, int d)
{
    int i, j;
    int r6 = sTornOutPixelLut[d];

    for (i = 0; i < r9; i++)
    {
        for (j = 0; j < r5; j++)
        {
            u32 ip = ~(0xf << ((r6 & 7) << 2));
            r8[8 * j][0x100 * i][r6 >> 3] &= ip;
        }
    }

    return;
}

SECTION(".rodata.08B93FD0")
u16 * const sSleepIconSprites[] = {
    sSprite_SleepIconA,
    sSprite_SleepIconB,
    sSprite_SleepIconC,
    sSprite_SleepIconD,
    sSprite_SleepIconE,
    sSprite_SleepIconF,
    sSprite_SleepIconG,
};

SECTION(".rodata.08B94034")
u16 * const sBerserkIconSprites[] = {
    sSprite_BerserkIconA,
    sSprite_BerserkIconB,
    sSprite_BerserkIconC,
    sSprite_BerserkIconD,
    sSprite_BerserkIconE,
    sSprite_BerserkIconF,
    sSprite_BerserkIconG,
    sSprite_BerserkIconH,
    sSprite_BerserkIconI,
};

SECTION(".rodata.08B94074")
u16 * const sSilenceIconSprites[] = {
    &sSprite_None[1],
    &gUnk_08B94060[1],
    &gUnk_08B94068[1],
    &gUnk_08B94068[1],
    &gUnk_08B94068[1],
    &gUnk_08B94068[1],
    &gUnk_08B94068[1],
    &gUnk_08B94068[1],
    &gUnk_08B94068[1],
    &gUnk_08B94068[1],
    &gUnk_08B94068[1],
    &gUnk_08B94060[1],
    &sSprite_None[1],
    sSprite_None,
    sSprite_None,
    sSprite_None,
    sSprite_None,
    sSprite_None,
};

SECTION(".rodata.08B94114")
u16 * const sPoisonIconSprites[] = {
    sSprite_PoisonIconA,
    &gUnk_08B940C8[1],
    sSprite_PoisonIconC,
    &gUnk_08B940E4[1],
    sSprite_PoisonIconE,
    sSprite_PoisonIconF,
    sSprite_PoisonIconG,
    sSprite_PoisonIconH,
    sSprite_PoisonIconH,
    sSprite_None,
    sSprite_None,
    sSprite_None,
};
