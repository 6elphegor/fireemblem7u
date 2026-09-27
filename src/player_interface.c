#include "gbafe.h"

extern u16 const gPal_PlayerInterface_Blue[];
extern u16 const gPal_PlayerInterface_Red[];
extern u16 const gPal_PlayerInterface_Green[];
extern u8 const Img_MapUiStatusAttack[];
extern u8 const Img_MapUiStatusDefense[];
extern u8 const Img_MapUiStatusCrit[];
extern u8 const Img_MapUiStatusAvoid[];
extern u8 const Tsa_MinimugBox[];
extern u8 const Img_PlayerInterface[];

extern char gNumberStr[];

extern s8 const TerrainTable_MovCost_BerserkerNormal[];
extern s8 const TerrainTable_Avo_Common[];
extern s8 const TerrainTable_Def_Common[];
extern u8 const Tsa_TerrainMapUi_Box[];
extern u8 const Tsa_TerrainMapUi_Labels[];
extern u8 const Tsa_TerrainMapUi_BallistaLabels[];
extern u8 const Tsa_TerrainMapUi_ObstacleLabels[];
extern u8 const Tsa_TerrainMapUi_ObstacleFullHp[];

char const * GetTerrainName(int terrain);
void GenNumberStr(int number); // StoreNumberStringToSmallBuffer
void nullsub_7(void);
void GenNumberOrBlankStr(int number); void IsMapFadeActive(ProcPtr proc);

CONST_DATA struct PlayerInterfaceConfigEntry sPlayerInterfaceConfigLut[4] = {
    { 1, 1, -1, 1, 1, -1, { 0 } },
    { -1, 1, -1, -1, 1, 1, { 0 } },
    { 1, 1, -1, -1, 1, -1, { 0 } },
    { -1, 1, -1, -1, 1, -1, { 0 } },
};

CONST_DATA s8 gUnitBurstMapUiTextXTable[] = {
    1, 1, 1, 1, 1, 1,
};

CONST_DATA s8 gUnitBurstMapUiTextYTable[] = {
    1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 3, 3, 3, 3,
    3, 3,
};

CONST_DATA s8 gUnitBurstMapUiXOffsetTable[] = {
    0, -1, -6, 0, -1, -6,
};

CONST_DATA s8 gUnitBurstMapUiYOffsetTable[] = {
    -6, -6, -6, 3, 3, 3,
};

CONST_DATA u8 const * gUnitBurstMapUiTopTsaLut[] = {
    (u8 *) 0x08404688,
    (u8 *) 0x084046DC,
    (u8 *) 0x08404730,
    (u8 *) 0x08404784,
    (u8 *) 0x084047D8,
    (u8 *) 0x0840482C,
};

CONST_DATA s8 sMMBSlideInWidthLut[] = {
    5, 9, 11, 12,
};

CONST_DATA s8 sMMBSlideOutWidthLut[] = {
    11, 7, 0,
};

CONST_DATA s8 sTerrainSlideInWidthLut[] = {
    4, 5, 6,
};

CONST_DATA s8 sTerrainSlideOutWidthLut[] = {
    5, 4, 0, 0, 0, 0,
};

CONST_DATA struct ProcCmd gProcScr_TerrainDisplay[] = {
    PROC_19,
    PROC_19,
    PROC_YIELD,
    PROC_CALL(TerrainDisplay_Init),
    PROC_LABEL(0),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_REPEAT(TerrainDisplay_Loop_OnSideChange),
    PROC_REPEAT(TerrainDisplay_Loop_SlideIn),
    PROC_REPEAT(TerrainDisplay_Loop_Display),
    PROC_REPEAT(TerrainDisplay_Loop_SlideOut),
    PROC_GOTO(0),
    PROC_END,
};

CONST_DATA struct ProcCmd gProcScr_UnitDisplay_MinimugBox[] = {
    PROC_19,
    PROC_19,
    PROC_YIELD,
    PROC_CALL(MMB_Init),
    PROC_LABEL(0),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_REPEAT(MMB_Loop_OnSideChange),
    PROC_REPEAT(MMB_Loop_SlideIn),
    PROC_LABEL(2),
    PROC_REPEAT(MMB_Loop_Display),
    PROC_LABEL(3),
    PROC_REPEAT(MMB_Loop_SlideOut),
    PROC_GOTO(0),
    PROC_LABEL(1),
    PROC_CALL(MMB_CheckForUnit),
    PROC_GOTO(2),
    PROC_END,
};

CONST_DATA struct ProcCmd gProcScr_UnitDisplay_Burst[] = {
    PROC_19,
    PROC_19,
    PROC_YIELD,
    PROC_CALL(BurstDisplay_Init),
    PROC_REPEAT(BurstDisplay_Loop_Display),
    PROC_END,
};

CONST_DATA struct ProcCmd gProcScr_SideWindowMaker[] = {
    PROC_WHILE(IsMapFadeActive),
    PROC_CALL(InitPlayerPhaseInterface),
    PROC_END,
};

CONST_DATA s8 sGoalSlideInWidthLut[] = {
    1, 3, 4, 5, 6,
};

CONST_DATA s8 sGoalSlideOutWidthLut[] = {
    3, 1, 0,
};

CONST_DATA struct ProcCmd gProcScr_GoalDisplay[] = {
    PROC_19,
    PROC_19,
    PROC_YIELD,
    PROC_CALL(GoalDisplay_Init),
    PROC_LABEL(0),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_REPEAT(GoalDisplay_Loop_OnSideChange),
    PROC_REPEAT(GoalDisplay_Loop_SlideIn),
    PROC_REPEAT(GoalDisplay_Loop_Display),
    PROC_REPEAT(GoalDisplay_Loop_SlideOut),
    PROC_GOTO(0),
    PROC_END,
};

CONST_DATA struct ProcCmd gProcScr_PrepMap_MenuButtonDisplay[] = {
    PROC_19,
    PROC_YIELD,
    PROC_CALL(MenuButtonDisp_Init),
    PROC_LABEL(0),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_WHILE(IsAnyPlayerSideWindowRetracting),
    PROC_CALL(MenuButtonDisp_UpdateCursorPos),
    PROC_REPEAT(MenuButtonDisp_Loop_OnSlideIn),
    PROC_REPEAT(MenuButtonDisp_Loop_Display),
    PROC_REPEAT(MenuButtonDisp_Loop_OnSlideOut),
    PROC_GOTO(0),
    PROC_END,
};

// StoreNumberStringOrDashesToSmallBuffer

int GetWindowQuadrant(int x, int y)
{
    if (x < 0)
    {
        if (y < 0)
            return 0;
        else
            return 1;
    }
    else if (y < 0)
        return 2;
    else
        return 3;
}

int GetCursorQuadrant(void)
{
    int cursorX;
    int camX;
    int cursorY;
    int camY;

    int x;
    int y;

    cursorX = (gBmSt.cursor.x * 16);
    camX = (gBmSt.camera.x - 8);

    x = cursorX - camX;

    cursorY = (gBmSt.cursor.y * 16);
    camY = (gBmSt.camera.y - 8);

    y = cursorY - camY;

    if ((x < 105) && (y < (DISPLAY_HEIGHT / 2) + 1))
        return 0;

    if ((x >= 105) && (y < (DISPLAY_HEIGHT / 2) + 1))
        return 1;

    if ((x < 105) && (y >= (DISPLAY_HEIGHT / 2) + 1))
        return 2;

    if ((x >= 105) && (y >= (DISPLAY_HEIGHT / 2) + 1))
        return 3;
}

void PutMapUiHpBarLeft(u16 * buffer, s16 hp, int tileBase)
{
    if (hp > 5)
        hp = 5;

    *buffer = hp + tileBase;
}

void PutMapUiHpBarMid(u16 * buffer, s16 hp, int tileBase)
{
    int i;

    int hpEighth = hp >> 3;
    int eighthTileIdx = hp & 7;

    for (i = 0; i < 4; i++)
    {
        int fullTileIdx = tileBase + 14;
        int emptyTileIdx = tileBase + 6;

        if (i < hpEighth)
            *buffer = fullTileIdx;
        else if (i == hpEighth)
            *buffer = emptyTileIdx + eighthTileIdx;
        else
            *buffer = emptyTileIdx;

        buffer++;
    }
}

void PutMapUiHpBarRight(u16 * buffer, s16 hp, int tileBase)
{
    int base;

    if (hp >= 5)
        hp = 5;

    if (hp < 0)
        hp = 0;

    base = tileBase + 15;

    *buffer = hp + base;
}

void PutMapUiHpBar(u16 * buffer, struct Unit * unit, int tileBase)
{
    s16 hpCurrent = 42 * GetUnitCurrentHp(unit);
    s16 hpPercent = Div(hpCurrent, GetUnitMaxHp(unit));

    PutMapUiHpBarLeft(buffer, hpPercent, tileBase);
    PutMapUiHpBarMid(buffer + 1, hpPercent - 5, tileBase);
    PutMapUiHpBarRight(buffer + 5, hpPercent - 37, tileBase);
}

void MMB_Loop_SlideIn(struct PlayerInterfaceProc * proc)
{
    int tmIndex;
    int width;

    int y = sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug < 0 ? 0 : 14;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
    {
        tmIndex = TM_OFFSET(0, y);

        TmFillRect(gBg0Tm + tmIndex, 12, 6, 0);
        TmFillRect(gBg1Tm + tmIndex, 12, 6, 0);
    }
    else
    {
        tmIndex = TM_OFFSET(0, y);

        TmFillRect(gBg0Tm + TM_OFFSET(18, 0) + tmIndex, 12, 6, 0);
        TmFillRect(gBg1Tm + TM_OFFSET(18, 0) + tmIndex, 12, 6, 0);
    }

    tmIndex = TM_OFFSET(0, y);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sMMBSlideInWidthLut[proc->showHideClock];

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
    {
        TmCopyRect(gUiTmScratchA + (12 - width), gBg0Tm + tmIndex, width, 6);
        TmCopyRect(gUiTmScratchB + (12 - width), gBg1Tm + tmIndex, width, 6);
    }
    else
    {
        TmCopyRect(gUiTmScratchA, gBg0Tm + TM_OFFSET(30 - width, y), width, 6);
        TmCopyRect(gUiTmScratchB, gBg1Tm + TM_OFFSET(30 - width, y), width, 6);
    }

    proc->showHideClock++;

    if (proc->showHideClock == 4)
    {
        proc->hideContents = false;
        proc->showHideClock = 0;

        Proc_Break(proc);

        UnitMapUiUpdate(proc, GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]));
    }
}

void MMB_Loop_SlideOut(struct PlayerInterfaceProc * proc)
{
    int tmIndex;
    int width;

    int y = sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug < 0 ? 0 : 14;

    proc->hideContents = true;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
    {
        tmIndex = TM_OFFSET(0, y);

        TmFillRect(gBg0Tm + tmIndex, 12, 6, 0);
        TmFillRect(gBg1Tm + tmIndex, 12, 6, 0);
    }
    else
    {
        tmIndex = TM_OFFSET(0, y);

        TmFillRect(gBg0Tm + TM_OFFSET(18, 0) + tmIndex, 12, 6, 0);
        TmFillRect(gBg1Tm + TM_OFFSET(18, 0) + tmIndex, 12, 6, 0);
    }

    tmIndex = TM_OFFSET(0, y);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sMMBSlideOutWidthLut[proc->showHideClock];

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
    {
        TmCopyRect(gUiTmScratchA + (12 - width), gBg0Tm + tmIndex, width, 6);
        TmCopyRect(gUiTmScratchB + (12 - width), gBg1Tm + tmIndex, width, 6);
    }
    else
    {
        TmCopyRect(gUiTmScratchA, gBg0Tm + TM_OFFSET(30 - width, y), width, 6);
        TmCopyRect(gUiTmScratchB, gBg1Tm + TM_OFFSET(30 - width, y), width, 6);
    }

    proc->showHideClock++;

    if (proc->showHideClock == 3)
    {
        proc->isRetracting = false;
        proc->showHideClock = 0;
        proc->windowQuadrant = -1;

        Proc_Break(proc);
    }
}

void TerrainDisplay_Loop_SlideIn(struct PlayerInterfaceProc * proc)
{
    int width;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain < 0)
    {
        TmFillRect(gBg0Tm + TM_OFFSET(0, 13), 6, 7, 0);
        TmFillRect(gBg1Tm + TM_OFFSET(0, 13), 6, 7, 0);
    }
    else
    {
        TmFillRect(gBg0Tm + TM_OFFSET(24, 13), 6, 7, 0);
        TmFillRect(gBg1Tm + TM_OFFSET(24, 13), 6, 7, 0);
    }

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sTerrainSlideInWidthLut[proc->showHideClock];

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain < 0)
    {
        TmCopyRect(gUiTmScratchA + TM_OFFSET(6 - width, 10), gBg0Tm + TM_OFFSET(0, 13), width, 7);
        TmCopyRect(gUiTmScratchB + TM_OFFSET(6 - width, 10), gBg1Tm + TM_OFFSET(0, 13), width, 7);
    }
    else
    {
        TmCopyRect(gUiTmScratchA + TM_OFFSET(0, 10), gBg0Tm + TM_OFFSET(30 - width, 13), width, 7);
        TmCopyRect(gUiTmScratchB + TM_OFFSET(0, 10), gBg1Tm + TM_OFFSET(30 - width, 13), width, 7);
    }

    proc->showHideClock++;

    if (proc->showHideClock == 3)
    {
        proc->showHideClock = 0;
        proc->hideContents = false;

        Proc_Break(proc);
    }
}

void TerrainDisplay_Loop_SlideOut(struct PlayerInterfaceProc * proc)
{
    int width;

    proc->hideContents = true;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain < 0)
    {
        TmFillRect(gBg0Tm + TM_OFFSET(0, 13), 6, 7, 0);
        TmFillRect(gBg1Tm + TM_OFFSET(0, 13), 6, 7, 0);
    }
    else
    {
        TmFillRect(gBg0Tm + TM_OFFSET(24, 13), 6, 7, 0);
        TmFillRect(gBg1Tm + TM_OFFSET(24, 13), 6, 7, 0);
    }

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sTerrainSlideOutWidthLut[proc->showHideClock];

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain < 0)
    {
        TmCopyRect(gUiTmScratchA + TM_OFFSET(6 - width, 10), gBg0Tm + TM_OFFSET(0, 13), width, 7);
        TmCopyRect(gUiTmScratchB + TM_OFFSET(6 - width, 10), gBg1Tm + TM_OFFSET(0, 13), width, 7);
    }
    else
    {
        TmCopyRect(gUiTmScratchA + TM_OFFSET(0, 10), gBg0Tm + TM_OFFSET(30 - width, 13), width, 7);
        TmCopyRect(gUiTmScratchB + TM_OFFSET(0, 10), gBg1Tm + TM_OFFSET(30 - width, 13), width, 7);
    }

    proc->showHideClock++;

    if (proc->showHideClock == 3)
    {
        proc->showHideClock = 0;
        proc->hideContents = false;
        proc->isRetracting = false;

        Proc_Break(proc);
    }
}

void sub_08084D90(struct PlayerInterfaceProc * proc)
{
    int x;
    int y;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
        x = 0;
    else
        x = 18;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug < 0)
        y = 0;
    else
        y = 14;

    TmCopyRect(gUiTmScratchA, gBg0Tm + TM_OFFSET(x, y), 12, 6);
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void sub_08084DE4(struct PlayerInterfaceProc * proc)
{
    int x;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain < 0)
        x = 0;
    else
        x = 24;

    TmCopyRect(gUiTmScratchA + TM_OFFSET(0, 10), gBg0Tm + TM_OFFSET(x, 13), 6, 7);
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void ApplyUnitMapUiFramePal(int faction, int palId)
{
    u16 const * pal = NULL;

    switch (faction)
    {
    case FACTION_BLUE:
        pal = gPal_PlayerInterface_Blue;
        break;

    case FACTION_RED:
        pal = gPal_PlayerInterface_Red;
        break;

    case FACTION_GREEN:
        pal = gPal_PlayerInterface_Green;
        break;

    default:
        nullsub_7();
        break;
    }

    ApplyPalette(pal, palId);
}

int sub_08084E70(void)
{
    if (((gBmSt.cursor.x * 16) - gBmSt.camera.x) < DISPLAY_WIDTH / 2 - 8)
        return +1;
    else
        return -1;
}

int sub_08084E90(void)
{
    if (((gBmSt.cursor.x * 16) - gBmSt.camera.x) > DISPLAY_WIDTH / 2 - 8)
        return -1;
    else
        return +1;
}

void ClearUnitMapUiStatus(u16 * buffer, struct Unit * unit)
{
    buffer[0] = TILEREF(0x120, 0);
    buffer[1] = TILEREF(0x121, 0);
    buffer[2] = 0;
    buffer[3] = TILEREF(0x13E, 0);
    buffer[4] = TILEREF(0x13F, 0);
    buffer[5] = 0;
}

void PutUnitMapUiStatus(u16 * buffer, struct Unit * unit)
{
    int tileIdx = TILEREF(0x100, 0);

    if (unit == NULL)
        return;

    switch (unit->statusIndex)
    {
    case UNIT_STATUS_NONE:
        return;

    case UNIT_STATUS_SLEEP:
        tileIdx += 0x60;
        break;

    case UNIT_STATUS_POISON:
        tileIdx += 0x64;
        break;

    case UNIT_STATUS_BERSERK:
        tileIdx += 0x68;
        break;

    case UNIT_STATUS_SILENCED:
        tileIdx += 0x6C;
        break;

    case UNIT_STATUS_ATTACK:
    case UNIT_STATUS_DEFENSE:
    case UNIT_STATUS_CRIT:
    case UNIT_STATUS_AVOID:
        tileIdx += 0x70;
        break;
    }

    switch (unit->statusIndex)
    {
    case UNIT_STATUS_ATTACK:
        CpuFastCopy(Img_MapUiStatusAttack, (void *)(VRAM + 0x2E00), 4 * CHR_SIZE);
        break;

    case UNIT_STATUS_DEFENSE:
        CpuFastCopy(Img_MapUiStatusDefense, (void *)(VRAM + 0x2E00), 4 * CHR_SIZE);
        break;

    case UNIT_STATUS_CRIT:
        CpuFastCopy(Img_MapUiStatusCrit, (void *)(VRAM + 0x2E00), 4 * CHR_SIZE);
        break;

    case UNIT_STATUS_AVOID:
        CpuFastCopy(Img_MapUiStatusAvoid, (void *)(VRAM + 0x2E00), 4 * CHR_SIZE);
        break;
    }

    buffer[0] = tileIdx++;
    buffer[1] = tileIdx++;
    buffer[2] = tileIdx++;
    buffer[3] = tileIdx++;
    buffer[4] = 0;
    buffer[5] = TILEREF(0x128 + unit->statusDuration, 0);
}

void UnitMapUiUpdate(struct PlayerInterfaceProc * proc, struct Unit * unit)
{
    if ((proc->unitClock & 63) == 0)
    {
        if ((proc->unitClock & 64) != 0)
        {
            PutUnitMapUiStatus(proc->statusTm, unit);
            EnableBgSync(BG0_SYNC_BIT);
        }
        else
        {
            ClearUnitMapUiStatus(proc->statusTm, unit);
            EnableBgSync(BG0_SYNC_BIT);

            if (GetUnitCurrentHp(unit) >= 100)
                GenNumberOrBlankStr(0xFF);
            else
                GenNumberOrBlankStr(GetUnitCurrentHp(unit));

            proc->hpCurHi = gNumberStr[6] - '0';
            proc->hpCurLo = gNumberStr[7] - '0';

            if (GetUnitMaxHp(unit) >= 100)
                GenNumberOrBlankStr(0xFF);
            else
                GenNumberOrBlankStr(GetUnitMaxHp(unit));

            proc->hpMaxHi = gNumberStr[6] - '0';
            proc->hpMaxLo = gNumberStr[7] - '0';
        }
    }

    if ((proc->hideContents == false) && ((proc->unitClock & 64) == 0 || (unit->statusIndex == UNIT_STATUS_NONE)))
    {
        int xDigits;
        int yDigits;

        int xDigit1;

        xDigits = proc->xHp * 8;
        xDigit1 = xDigits + 16;

        yDigits = proc->yHp * 8;

        if (proc->hpCurHi != (u8)(' ' - '0'))
            PutOamHiRam(xDigit1, yDigits, Sprite_8x8, proc->hpCurHi + OAM2_CHR(0x2E0) + OAM2_PAL(8));

        PutOamHiRam(xDigits + 23, yDigits, Sprite_8x8, proc->hpCurLo + OAM2_CHR(0x2E0) + OAM2_PAL(8));
        PutOamHiRam(xDigits + 34, yDigits, Sprite_8x8, proc->hpMaxHi + OAM2_CHR(0x2E0) + OAM2_PAL(8));
        PutOamHiRam(xDigits + 41, yDigits, Sprite_8x8, proc->hpMaxLo + OAM2_CHR(0x2E0) + OAM2_PAL(8));
    }
}

void DrawUnitMapUi(struct PlayerInterfaceProc * proc, struct Unit * unit)
{
    char const * str;
    int pos;
    int faceId;

    CpuFastFill(0, gUiTmScratchA, 6 * CHR_SIZE * sizeof(u16));

    str = DecodeMsg(unit->pCharacterData->nameTextId);
    pos = GetStringTextCenteredPos(48, str);

    ClearText(proc->texts);
    Text_SetParams(proc->texts, pos, TEXT_COLOR_0030);
    Text_DrawString(proc->texts, str);
    PutText(proc->texts, gUiTmScratchA + TM_OFFSET(5, 1));

    faceId = GetUnitMiniPortraitId(unit);

    if (unit->state & US_BIT23)
        faceId = faceId + 1;

    PutFaceChibi(faceId, gUiTmScratchA + TM_OFFSET(1, 1), 0xF0, 4, 0);

    proc->statusTm = gUiTmScratchA + TM_OFFSET(5, 3);
    proc->unitClock = 0;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
        proc->xHp = 5;
    else
        proc->xHp = 23;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug < 0)
        proc->yHp = 3;
    else
        proc->yHp = 17;

    UnitMapUiUpdate(proc, unit);
    PutMapUiHpBar(gUiTmScratchA + TM_OFFSET(5, 4), unit, TILEREF(0x140, 3));

    TmApplyTsa(gUiTmScratchB, Tsa_MinimugBox, TILEREF(0x100, 3));
    ApplyUnitMapUiFramePal(UNIT_FACTION(unit), 3);
}

int GetUnitBurstMapUiOrientationAt(int x, int y)
{
    int cursorQuadrant = GetCursorQuadrant();

    int result = 1;

    if ((y < 6) || ((y < 12) && (sPlayerInterfaceConfigLut[cursorQuadrant].yGoal < 0)))
        result = 4;

    if (x < 2)
        result = result - 1;

    if (x > 22)
        result = result + 1;

    return result;
}

void DrawUnitBurstMapUi(struct PlayerInterfaceProc * proc, struct Unit * unit)
{
    int x;
    int y;
    int orientation;
    char const * nameStr;
    int pos;

    x = (unit->xPos * 16 - gBmSt.camera.x) / 8;
    y = (unit->yPos * 16 - gBmSt.camera.y) / 8;

    orientation = GetUnitBurstMapUiOrientationAt(x, y);

    x = x + gUnitBurstMapUiXOffsetTable[orientation];
    y = y + gUnitBurstMapUiYOffsetTable[orientation];

    proc->xBurst = x;
    proc->yBurst = y;

    proc->wBurst = 8;
    proc->hBurst = 5;

    nameStr = DecodeMsg(unit->pCharacterData->nameTextId);
    pos = GetStringTextCenteredPos(48, nameStr);

    ClearText(proc->texts);

    Text_SetParams(proc->texts, pos, TEXT_COLOR_0030);
    Text_DrawString(proc->texts, nameStr);

    PutText(proc->texts, gBg0Tm + TM_OFFSET(
        x + gUnitBurstMapUiTextXTable[orientation],
        y + gUnitBurstMapUiTextYTable[orientation]));

    proc->statusTm = gBg0Tm + TM_OFFSET(x + 1, y + 3);

    proc->unitClock = 0;

    proc->xHp = x + 1;
    proc->yHp = y + 3;

    UnitMapUiUpdate(proc, unit);

    TmApplyTsa(gBg1Tm + TM_OFFSET(x, y), gUnitBurstMapUiTopTsaLut[orientation], TILEREF(0x100, 3));

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    ApplyUnitMapUiFramePal(UNIT_FACTION(unit), 3);
}

void ClearUnitBurstMapUi(struct PlayerInterfaceProc * proc)
{
    if (proc->wBurst == 8 && proc->hBurst == 5)
    {
        TmFillRect(gBg0Tm + TM_OFFSET(proc->xBurst, proc->yBurst), proc->wBurst - 1, proc->hBurst - 1, 0);
        TmFillRect(gBg1Tm + TM_OFFSET(proc->xBurst, proc->yBurst), proc->wBurst - 1, proc->hBurst - 1, 0);

        EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

        proc->wBurst = 0;
        proc->hBurst = 0;
    }
}

void DrawTerrainDisplayWindow(struct PlayerInterfaceProc * proc)
{
    char const * str;
    int num;

    int terrainId = gBmMapTerrain[gBmSt.cursor.y][gBmSt.cursor.x];

    TmFillRect(gUiTmScratchA + TM_OFFSET(0, 10), 14, 7, 0);
    TmFillRect(gUiTmScratchB + TM_OFFSET(0, 10), 14, 7, 0);

    str = GetTerrainName(terrainId);

    num = GetStringTextCenteredPos(32, str);

    ClearText(proc->texts);
    Text_SetParams(proc->texts, num, TEXT_COLOR_SYSTEM_WHITE);
    Text_DrawString(proc->texts, str);
    PutText(proc->texts, gUiTmScratchA + TM_OFFSET(1, 12));

    TmApplyTsa(gUiTmScratchA + TM_OFFSET(1, 14), Tsa_TerrainMapUi_Labels, TILEREF(0x100, 0));

    if (TerrainTable_MovCost_BerserkerNormal[terrainId] > 0)
    {
        GenNumberStr(TerrainTable_Def_Common[terrainId]);
        PutDigits(gUiTmScratchA + TM_OFFSET(4, 14), gNumberStr + 7, TILEREF(0x128, 0), 2);

        GenNumberStr(TerrainTable_Avo_Common[terrainId]);
        PutDigits(gUiTmScratchA + TM_OFFSET(4, 15), gNumberStr + 7, TILEREF(0x128, 0), 2);
    }

    switch (terrainId)
    {
    case TERRAIN_SNAG:
    case TERRAIN_WALL_BREAKABLE:
        TmApplyTsa(gUiTmScratchA + TM_OFFSET(1, 14), Tsa_TerrainMapUi_ObstacleLabels, TILEREF(0x100, 2));

        num = GetObstacleHpAt(gBmSt.cursor.x, gBmSt.cursor.y);

        if (num == 100)
        {
            TmApplyTsa(gUiTmScratchA + TM_OFFSET(3, 15), Tsa_TerrainMapUi_ObstacleFullHp, TILEREF(0x100, 0));
        }
        else
        {
            GenNumberStr(num);
            PutDigits(gUiTmScratchA + TM_OFFSET(4, 15), gNumberStr + 7, TILEREF(0x128, 0), 2);
        }

        break;

    case TERRAIN_BALLISTA:
    case TERRAIN_LONGBALLISTA:
    case TERRAIN_KILLERBALLISTA:
        TmApplyTsa(gUiTmScratchA + TM_OFFSET(1, 14), Tsa_TerrainMapUi_BallistaLabels, TILEREF(0x100, 0));

        GenNumberStr(GetObstacleHpAt(gBmSt.cursor.x, gBmSt.cursor.y));
        PutDigits(gUiTmScratchA + TM_OFFSET(4, 14), gNumberStr + 7, TILEREF(0x128, 0), 2);

        break;
    }

    TmApplyTsa(gUiTmScratchB + TM_OFFSET(0, 10), Tsa_TerrainMapUi_Box, TILEREF(0x100, 1));
}

void TerrainDisplay_Init(struct PlayerInterfaceProc * proc)
{
    proc->windowQuadrant = -1;
    proc->isRetracting = false;
    proc->showHideClock = 0;
    proc->cursorQuadrant = 1;

    InitTextDb(proc->texts, 4);
}

void TerrainDisplay_Loop_OnSideChange(struct PlayerInterfaceProc * proc)
{
    int quadrant;
    struct PlayerInterfaceProc * ui1Proc;
    struct PlayerInterfaceProc * piProc;

    proc->hideContents = true;

    proc->cursorQuadrant = GetCursorQuadrant();

    quadrant = GetWindowQuadrant(
        sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain,
        sPlayerInterfaceConfigLut[proc->cursorQuadrant].yTerrain);

    ui1Proc = Proc_Find(gProcScr_UnitDisplay_MinimugBox);

    if (ui1Proc != NULL)
    {
        if ((ui1Proc->windowQuadrant > -1) && (ui1Proc->windowQuadrant == quadrant))
            return;
    }

    piProc = Proc_Find(gProcScr_GoalDisplay);

    // BUG: checks ui1Proc instead of piProc
    if (ui1Proc != NULL)
    {
        if ((piProc->windowQuadrant > -1) && (piProc->windowQuadrant == quadrant))
            return;
    }

    proc->windowQuadrant = quadrant;

    DrawTerrainDisplayWindow(proc);

    proc->xCursor = gBmSt.cursor.x;
    proc->yCursor = gBmSt.cursor.y;

    Proc_Break(proc);
}

void TerrainDisplay_Loop_Display(struct PlayerInterfaceProc * proc)
{
    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    proc->xCursor = gBmSt.cursor.x;
    proc->yCursor = gBmSt.cursor.y;

    if ((proc->xCursor == proc->xCursorPrev) && (proc->yCursor == proc->yCursorPrev))
        return;

    if (Proc_Find(ProcScr_CamMove) == NULL)
    {
        int cursorQuadrant = GetCursorQuadrant();

        if ((cursorQuadrant == proc->cursorQuadrant) ||
            ((sPlayerInterfaceConfigLut[cursorQuadrant].xTerrain ==
              sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain) &&
             (sPlayerInterfaceConfigLut[cursorQuadrant].yTerrain ==
              sPlayerInterfaceConfigLut[proc->cursorQuadrant].yTerrain)))
        {
            DrawTerrainDisplayWindow(proc);
            sub_08084DE4(proc);
            return;
        }
    }

    proc->isRetracting = true;

    Proc_Break(proc);
}

void MMB_Init(struct PlayerInterfaceProc * proc)
{
    proc->windowQuadrant = -1;
    InitTextDb(proc->texts, 6);
    proc->showHideClock = 0;
    proc->isRetracting = false;
}

void MMB_Loop_OnSideChange(struct PlayerInterfaceProc * proc)
{
    int quadrant;
    struct PlayerInterfaceProc * tiProc;

    struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]);

    if (unit == NULL)
        return;

    proc->hideContents = true;

    proc->cursorQuadrant = GetCursorQuadrant();

    quadrant = GetWindowQuadrant(
        sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug,
        sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug);

    tiProc = Proc_Find(gProcScr_TerrainDisplay);

    if (tiProc != NULL)
    {
        if ((tiProc->windowQuadrant > -1) && (tiProc->windowQuadrant == quadrant))
            return;
    }

    proc->windowQuadrant = quadrant;

    proc->xCursor = gBmSt.cursor.x;
    proc->yCursor = gBmSt.cursor.y;

    DrawUnitMapUi(proc, unit);

    Proc_Break(proc);
}

void MMB_Loop_Display(struct PlayerInterfaceProc * proc)
{
    struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]);

    proc->unitClock++;

    UnitMapUiUpdate(proc, unit);

    if ((proc->unitClock & 63) == 0)
        sub_08084D90(proc);

    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    proc->xCursor = gBmSt.cursor.x;
    proc->yCursor = gBmSt.cursor.y;

    if ((proc->xCursor == proc->xCursorPrev) && (proc->yCursor == proc->yCursorPrev))
        return;

    if (unit != NULL && Proc_Find(ProcScr_CamMove) == NULL)
    {
        int cursorQuadrant = GetCursorQuadrant();

        if ((cursorQuadrant == proc->cursorQuadrant) ||
            ((sPlayerInterfaceConfigLut[cursorQuadrant].xMinimug ==
              sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug) &&
             (sPlayerInterfaceConfigLut[cursorQuadrant].yMinimug ==
              sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug)))
        {
            Proc_Goto(proc, 1);
            return;
        }
    }

    proc->isRetracting = true;

    Proc_Break(proc);
}

void MMB_CheckForUnit(struct PlayerInterfaceProc * proc)
{
    struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x]);

    if (unit == NULL)
    {
        Proc_Goto(proc, 3);
    }
    else
    {
        DrawUnitMapUi(proc, unit);
        sub_08084D90(proc);
    }
}

void BurstDisplay_Init(struct PlayerInterfaceProc * proc)
{
    InitTextDb(proc->texts, 6);
    proc->burstUnitId = 0;
    proc->hideContents = false;
    proc->showHideClock = 0;
    proc->wBurst = 0;
    proc->hBurst = 0;
    proc->isRetracting = false;
}

void BurstDisplay_Loop_Display(struct PlayerInterfaceProc * proc)
{
    struct PlayerInterfaceProc * tiProc;
    struct PlayerInterfaceProc * piProc;

    proc->burstUnitIdPrev = proc->burstUnitId;

    proc->burstUnitId = gBmMapUnit[gBmSt.cursor.y][gBmSt.cursor.x];

    if ((proc->burstUnitIdPrev != proc->burstUnitId) && (proc->burstUnitIdPrev != 0))
    {
        ClearUnitBurstMapUi(proc);
        proc->showHideClock = 0;

        return;
    }

    if ((proc->burstUnitId == 0) || (Proc_Find(ProcScr_CamMove) != 0))
        return;

    tiProc = Proc_Find(gProcScr_TerrainDisplay);

    if (tiProc != NULL)
    {
        if (tiProc->hideContents)
        {
            if (proc->showHideClock < 4)
                proc->showHideClock++;

            return;
        }
    }

    piProc = Proc_Find(gProcScr_GoalDisplay);

    if (piProc != NULL)
    {
        if (piProc->hideContents)
        {
            if (proc->showHideClock < 4)
                proc->showHideClock++;

            return;
        }
    }

    proc->showHideClock++;

    if (proc->showHideClock < 8)
        return;

    if (proc->showHideClock == 8)
    {
        DrawUnitBurstMapUi(proc, GetUnit(proc->burstUnitId));
    }
    else
    {
        proc->unitClock++;

        if (tiProc)
            proc->hideContents = tiProc->hideContents;
        else
            proc->hideContents = false;

        UnitMapUiUpdate(proc, GetUnit(proc->burstUnitId));
    }
}

void InitPlayerPhaseInterface(void)
{
    SetWinEnable(0, 0, 0);
    SetWOutLayers(1, 1, 1, 1, 1);
    gDispIo.win_ct.wout_enable_blend = 1;

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);

    SetBlendAlpha(15, 4);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendBackdropA(0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    Decompress(Img_PlayerInterface, (void *)(VRAM + 0x2000));

    CpuFastCopy((void *)(VRAM + 0x2500), (void *)(VRAM + 0x15C00), 10 * CHR_SIZE);
    CpuFastCopy((void *)(VRAM + 0x2EA0), (void *)(VRAM + 0x15D40), CHR_SIZE);

    ApplyPalette(gPal, 0x18);

    ApplyIconPalette(1, 2);

    ResetTextFont();

    if (gPlaySt.cfgDisableTerrainDisplay == 0)
        Proc_Start(gProcScr_TerrainDisplay, PROC_TREE_3);

    if (gBmSt.flags & BM_FLAG_4)
    {
        Proc_Start(gProcScr_PrepMap_MenuButtonDisplay, PROC_TREE_3);
    }
    else
    {
        if (gPlaySt.cfgDisableGoalDisplay == 0)
            Proc_Start(gProcScr_GoalDisplay, PROC_TREE_3);
    }

    if (gPlaySt.cfgUnitDisplayType == 0)
        Proc_Start(gProcScr_UnitDisplay_MinimugBox, PROC_TREE_3);

    if (gPlaySt.cfgUnitDisplayType == 1)
        Proc_Start(gProcScr_UnitDisplay_Burst, PROC_TREE_3);
}

void StartMapWindows(void)
{
    Proc_Start(gProcScr_SideWindowMaker, PROC_TREE_3);
}

void EndPlayerPhaseSideWindows(void)
{
    Proc_EndEach(gProcScr_UnitDisplay_MinimugBox);
    Proc_EndEach(gProcScr_UnitDisplay_Burst);
    Proc_EndEach(gProcScr_TerrainDisplay);
    Proc_EndEach(gProcScr_GoalDisplay);
    Proc_EndEach(gProcScr_PrepMap_MenuButtonDisplay);

    SetBlendNone();

    ClearUi();
}

extern u8 const gTSA_GoalBox_OneLine[];
extern u8 const gTSA_GoalBox_TwoLines[];
extern u8 const Img_PrepHelpButtonSprites[];

int sub_08084E70(void);
int sub_08084E90(void);
int CountUnitsByFaction(int faction);

bool sub_08085CDC(void)
{
    if (((gBmSt.cursor.y * 16) - gBmSt.camera.y) > 64)
        return TRUE;

    return FALSE;
}

int sub_08085CFC(void)
{
    if (sub_08085CDC())
    {
        if (sub_08084E70() == -1)
            return 2;

        if (sub_08084E70() == +1)
            return 1;
    }
    else
    {
        if (sub_08084E90() == -1)
            return 4;

        if (sub_08084E90() == +1)
            return 3;
    }

    return 0;
}

void sub_08085D48(struct PlayerInterfaceProc * proc)
{
    TmFillRect(gUiTmScratchB + TM_OFFSET(20, 10), 11, 9, 0);
    TmFillRect(gUiTmScratchA + TM_OFFSET(20, 12), 11, 9, 0);

    if (proc->unitClock == 0)
    {
        TmApplyTsa(gUiTmScratchB + TM_OFFSET(20, 10), gTSA_GoalBox_OneLine, TILEREF(0x100, 1));
        PutText(proc->texts, gUiTmScratchA + TM_OFFSET(21, 13));
    }

    if (proc->unitClock == 1)
    {
        TmApplyTsa(gUiTmScratchB + TM_OFFSET(20, 10), gTSA_GoalBox_TwoLines, TILEREF(0x100, 1));
        PutText(&proc->texts[0], gUiTmScratchA + TM_OFFSET(21, 13));
        PutText(&proc->texts[1], gUiTmScratchA + TM_OFFSET(21, 15));
    }
}

void GoalDisplay_Init(struct PlayerInterfaceProc * proc)
{
    int turnNumber;
    char const * str;

    proc->showHideClock = 0;
    proc->isRetracting = FALSE;
    proc->cursorQuadrant = 0;
    proc->windowQuadrant = -1;

    InitText(&proc->texts[0], 9);
    InitText(&proc->texts[1], 8);

    StartGreenText(proc);

    ClearText(&proc->texts[0]);
    ClearText(&proc->texts[1]);

    {
        char const * goalStr = DecodeMsg(GetChapterInfo(gPlaySt.chapterIndex)->goalWindowTextId);
        Text_InsertDrawString(&proc->texts[0], GetStringTextCenteredPos(72, goalStr), TEXT_COLOR_SYSTEM_WHITE, goalStr);
    }

    switch (GetChapterInfo(gPlaySt.chapterIndex)->goalWindowDataType)
    {
    case 0:
    case 3:
    case 4:
        proc->unitClock = 0;
        return;

    case 1:
        Text_InsertDrawString(&proc->texts[1], 16, TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(0x128D));

        if (gPlaySt.chapterVisionRange != 0)
            Text_InsertDrawString(&proc->texts[1], 40, TEXT_COLOR_SYSTEM_GRAY, DecodeMsg(0x127C));
        else
            Text_InsertDrawNumberOrBlank(&proc->texts[1], 48, TEXT_COLOR_SYSTEM_BLUE, CountUnitsByFaction(FACTION_RED));

        break;

    case 2:
        turnNumber = gPlaySt.chapterTurnNumber;

        if (turnNumber >= GetChapterInfo(gPlaySt.chapterIndex)->protectCharacterIndex - 1)
        {
            str = DecodeMsg(0x128E);
            Text_InsertDrawString(&proc->texts[1], GetStringTextCenteredPos(64, str), TEXT_COLOR_SYSTEM_GREEN, str);
            break;
        }

        Text_InsertDrawNumberOrBlank(&proc->texts[1], 10, TEXT_COLOR_SYSTEM_BLUE, gPlaySt.chapterTurnNumber);
        Text_InsertDrawString(&proc->texts[1], 19, TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(0x12B0));
        Text_InsertDrawNumberOrBlank(&proc->texts[1], 34, TEXT_COLOR_SYSTEM_BLUE,
            GetChapterInfo(gPlaySt.chapterIndex)->protectCharacterIndex - 1);
        Text_InsertDrawString(&proc->texts[1], 43, TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(0x128F));

        break;

    default:
        return;
    }

    proc->unitClock = 1;
}

void GoalDisplay_Loop_OnSideChange(struct PlayerInterfaceProc * proc)
{
    int quadrant;
    struct PlayerInterfaceProc * tiProc;

    proc->showHideClock = 0;
    proc->hideContents = TRUE;

    proc->cursorQuadrant = GetCursorQuadrant();

    quadrant = GetWindowQuadrant(
        sPlayerInterfaceConfigLut[proc->cursorQuadrant].xGoal, sPlayerInterfaceConfigLut[proc->cursorQuadrant].yGoal);

    tiProc = Proc_Find(gProcScr_TerrainDisplay);

    if (tiProc != NULL)
    {
        if ((tiProc->windowQuadrant > -1) && (tiProc->windowQuadrant == quadrant))
            return;
    }

    proc->windowQuadrant = quadrant;

    sub_08085D48(proc);

    proc->xCursor = gBmSt.cursor.x;
    proc->yCursor = gBmSt.cursor.y;

    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    Proc_Break(proc);
}

void sub_08086008(int quadrant, int param_2, int param_3)
{
    int x = sPlayerInterfaceConfigLut[quadrant].xGoal;
    int y = sPlayerInterfaceConfigLut[quadrant].yGoal;

    if ((x < 0) && (y < 0))
    {
        TmFillRect(gBg1Tm, 12, 6, 0);
        TmFillRect(gBg0Tm, 12, 6, 0);

        TmCopyRect(gUiTmScratchB + TM_OFFSET(20, (16 - param_2)), gBg1Tm, 12, param_2);
        TmCopyRect(gUiTmScratchA + TM_OFFSET(20, (18 - param_2)), gBg0Tm, 12, param_2);
    }

    if ((x > 0) && (y < 0))
    {
        TmFillRect(gBg1Tm + TM_OFFSET(19, 0), 12, 6, 0);
        TmFillRect(gBg0Tm + TM_OFFSET(19, 0), 12, 6, 0);

        TmCopyRect(gUiTmScratchB + TM_OFFSET(20, (16 - param_2)), gBg1Tm + TM_OFFSET(19, 0), 12, param_2);
        TmCopyRect(gUiTmScratchA + TM_OFFSET(20, (18 - param_2)), gBg0Tm + TM_OFFSET(19, 0), 12, param_2);
    }

    if ((x < 0) && (y > 0))
    {
        TmFillRect(gBg1Tm + TM_OFFSET(0, 14), 12, 6, 0);
        TmFillRect(gBg0Tm + TM_OFFSET(0, 14), 12, 6, 0);

        TmCopyRect(
            gUiTmScratchB + TM_OFFSET(20, 10),
            gBg1Tm + 0x1C0 + 0x20 * (({ (1 - param_3) * 2 + 20; }) - param_2) - 0x1C0, 12, param_2);
        TmCopyRect(
            gUiTmScratchA + TM_OFFSET(20, 12),
            gBg0Tm + 0x1C0 + 0x20 * (({ (1 - param_3) * 2 + 20; }) - param_2) - 0x1C0, 12, param_2);
    }

    if ((x > 0) && (y > 0))
    {
        TmFillRect(gBg1Tm + TM_OFFSET(19, 14), 12, 6, 0);
        TmFillRect(gBg0Tm + TM_OFFSET(19, 14), 12, 6, 0);

        TmCopyRect(
            gUiTmScratchB + TM_OFFSET(20, 10),
            gBg1Tm + 0x1D3 + 0x20 * (({ (1 - param_3) * 2 + 20; }) - param_2) - 0x1C0, 12, param_2);
        TmCopyRect(
            gUiTmScratchA + TM_OFFSET(20, 12),
            gBg0Tm + 0x1D3 + 0x20 * (({ (1 - param_3) * 2 + 20; }) - param_2) - 0x1C0, 12, param_2);
    }

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void GoalDisplay_Loop_SlideIn(struct PlayerInterfaceProc * proc)
{
    int width = sGoalSlideInWidthLut[proc->showHideClock];

    sub_08086008(proc->cursorQuadrant, width, proc->unitClock);

    proc->showHideClock++;

    if (proc->showHideClock == 5)
    {
        proc->showHideClock = 0;
        proc->hideContents = FALSE;

        Proc_Break(proc);
    }
}

void GoalDisplay_Loop_SlideOut(struct PlayerInterfaceProc * proc)
{
    int width;

    proc->hideContents = TRUE;

    width = sGoalSlideOutWidthLut[proc->showHideClock];

    sub_08086008(proc->cursorQuadrant, width, proc->unitClock);

    proc->showHideClock++;

    if (proc->showHideClock == 3)
    {
        proc->showHideClock = 0;
        proc->hideContents = FALSE;
        proc->isRetracting = FALSE;
        proc->windowQuadrant = -1;

        Proc_Break(proc);
    }
}

void sub_0808626C(void)
{
}

void sub_08086270(void)
{
}

void sub_08086274(void)
{
}

void GoalDisplay_Loop_Display(struct PlayerInterfaceProc * proc)
{
    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    proc->xCursor = gBmSt.cursor.x;
    proc->yCursor = gBmSt.cursor.y;

    if (proc->xCursor == proc->xCursorPrev && proc->yCursor == proc->yCursorPrev)
        return;

    if (Proc_Find(ProcScr_CamMove) == NULL)
    {
        int cursorQuadrant = GetCursorQuadrant();
        int quadrant = proc->cursorQuadrant;

        if (cursorQuadrant == quadrant)
            return;

        if ((sPlayerInterfaceConfigLut[cursorQuadrant].xGoal == sPlayerInterfaceConfigLut[quadrant].xGoal) &&
            (sPlayerInterfaceConfigLut[cursorQuadrant].yGoal == sPlayerInterfaceConfigLut[quadrant].yGoal))
            return;
    }

    proc->isRetracting = TRUE;

    Proc_Break(proc);
}

bool IsAnyPlayerSideWindowRetracting(void)
{
    struct PlayerInterfaceProc * proc;

    proc = Proc_Find(gProcScr_UnitDisplay_MinimugBox);

    if (proc != NULL && proc->isRetracting)
        return TRUE;

    proc = Proc_Find(gProcScr_TerrainDisplay);

    if (proc != NULL && proc->isRetracting)
        return TRUE;

    proc = Proc_Find(gProcScr_GoalDisplay);

    if (proc != NULL && proc->isRetracting)
        return TRUE;

    return FALSE;
}

void MenuButtonDisp_Init(struct PlayerInterfaceProc * proc)
{
    Decompress(Img_PrepHelpButtonSprites, (void *) 0x06015000);

    proc->xHp = 160;
    proc->yHp = 140;
    proc->isRetracting = FALSE;
}

void UpdateMenuButtonPos(struct PlayerInterfaceProc * proc, int quadrant, int offset)
{
    int x = sPlayerInterfaceConfigLut[quadrant].xGoal;
    int y = sPlayerInterfaceConfigLut[quadrant].yGoal;

    if ((x < 0) && (y < 0))
    {
        proc->xHp = 8;
        proc->yHp = offset - 24;
    }

    if ((x > 0) && (y < 0))
    {
        proc->xHp = 160;
        proc->yHp = offset - 24;
    }

    if ((x < 0) && (y > 0))
    {
        proc->xHp = 8;
        proc->yHp = 160 - offset;
    }

    if ((x > 0) && (y > 0))
    {
        proc->xHp = 160;
        proc->yHp = 160 - offset;
    }
}

void DrawMenuButtonAt(int x, int y)
{
    PutSprite(4, OAM1_X(x + 0), OAM0_Y(y), Sprite_32x16, OAM2_CHR(0x280));
    PutSprite(4, OAM1_X(x + 32), OAM0_Y(y), Sprite_32x16, OAM2_CHR(0x284));
    PutSprite(4, OAM1_X(x + 64), OAM0_Y(y), Sprite_32x16, OAM2_CHR(0x288));
    PutSprite(4, OAM1_X(x + 96), OAM0_Y(y), Sprite_8x16, OAM2_CHR(0x28C));
}

void MenuButtonDisp_UpdateCursorPos(struct PlayerInterfaceProc * proc)
{
    proc->cursorQuadrant = GetCursorQuadrant();

    UpdateMenuButtonPos(proc, proc->cursorQuadrant, proc->showHideClock);

    proc->showHideClock = 0;

    proc->xCursor = gBmSt.cursor.x;
    proc->yCursor = gBmSt.cursor.y;
}

void MenuButtonDisp_Loop_OnSlideIn(struct PlayerInterfaceProc * proc)
{
    proc->showHideClock += 4;

    UpdateMenuButtonPos(proc, proc->cursorQuadrant, proc->showHideClock);
    DrawMenuButtonAt(proc->xHp, proc->yHp);

    if (proc->showHideClock == 24)
    {
        Proc_Break(proc);
        proc->isRetracting = FALSE;
    }
}

void MenuButtonDisp_Loop_Display(struct PlayerInterfaceProc * proc)
{
    DrawMenuButtonAt(proc->xHp, proc->yHp);

    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    proc->xCursor = gBmSt.cursor.x;
    proc->yCursor = gBmSt.cursor.y;

    if (proc->xCursor == proc->xCursorPrev && proc->yCursor == proc->yCursorPrev)
        return;

    if (Proc_Find(ProcScr_CamMove) == NULL)
    {
        int cursorQuadrant = GetCursorQuadrant();
        int quadrant = proc->cursorQuadrant;

        if (cursorQuadrant == quadrant)
            return;

        if ((sPlayerInterfaceConfigLut[cursorQuadrant].xGoal == sPlayerInterfaceConfigLut[quadrant].xGoal) &&
            (sPlayerInterfaceConfigLut[cursorQuadrant].yGoal == sPlayerInterfaceConfigLut[quadrant].yGoal))
            return;
    }

    proc->isRetracting = TRUE;

    Proc_Break(proc);
}

void MenuButtonDisp_Loop_OnSlideOut(struct PlayerInterfaceProc * proc)
{
    proc->showHideClock -= 4;

    UpdateMenuButtonPos(proc, proc->cursorQuadrant, proc->showHideClock);
    DrawMenuButtonAt(proc->xHp, proc->yHp);

    if (proc->showHideClock == 0)
    {
        proc->isRetracting = FALSE;
        Proc_Break(proc);
    }
}

