#include "gbafe.h"

extern s8 CONST_DATA gUnitBurstMapUiTextXTable[];
extern s8 CONST_DATA gUnitBurstMapUiTextYTable[];
extern s8 CONST_DATA gUnitBurstMapUiXOffsetTable[];
extern s8 CONST_DATA gUnitBurstMapUiYOffsetTable[];
extern u8 const * CONST_DATA gUnitBurstMapUiTopTsaLut[];
extern s8 CONST_DATA sMMBSlideInWidthLut[];
extern s8 CONST_DATA sMMBSlideOutWidthLut[];
extern s8 CONST_DATA sTerrainSlideInWidthLut[];
extern s8 CONST_DATA sTerrainSlideOutWidthLut[];
extern struct ProcCmd CONST_DATA gProcScr_TerrainDisplay[];
extern struct ProcCmd CONST_DATA gProcScr_UnitDisplay_MinimugBox[];
extern struct ProcCmd CONST_DATA gProcScr_UnitDisplay_Burst[];
extern struct ProcCmd CONST_DATA gProcScr_SideWindowMaker[];
extern s8 CONST_DATA sGoalSlideInWidthLut[];
extern s8 CONST_DATA sGoalSlideOutWidthLut[];
extern struct ProcCmd CONST_DATA gProcScr_GoalDisplay[];
extern struct ProcCmd CONST_DATA gProcScr_PrepMap_MenuButtonDisplay[];

extern u16 const gPal_PlayerInterface_Blue[];
extern u16 const gPal_PlayerInterface_Red[];
extern u16 const gPal_PlayerInterface_Green[];
extern u8 const Img_MapUiStatusAttack[];
extern u8 const Img_MapUiStatusDefense[];
extern u8 const Img_MapUiStatusCrit[];
extern u8 const Img_MapUiStatusAvoid[];
extern u8 const Tsa_MinimugBox[];

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
int sub_0802BCBC(int x, int y); // GetObstacleHpAt
void sub_08005044(int number); // StoreNumberStringToSmallBuffer
void nullsub_7(void);
void sub_08005080(int number); // StoreNumberStringOrDashesToSmallBuffer

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
                sub_08005080(0xFF);
            else
                sub_08005080(GetUnitCurrentHp(unit));

            proc->hpCurHi = gNumberStr[6] - '0';
            proc->hpCurLo = gNumberStr[7] - '0';

            if (GetUnitMaxHp(unit) >= 100)
                sub_08005080(0xFF);
            else
                sub_08005080(GetUnitMaxHp(unit));

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
        sub_08005044(TerrainTable_Def_Common[terrainId]);
        PutDigits(gUiTmScratchA + TM_OFFSET(4, 14), gNumberStr + 7, TILEREF(0x128, 0), 2);

        sub_08005044(TerrainTable_Avo_Common[terrainId]);
        PutDigits(gUiTmScratchA + TM_OFFSET(4, 15), gNumberStr + 7, TILEREF(0x128, 0), 2);
    }

    switch (terrainId)
    {
    case TERRAIN_SNAG:
    case TERRAIN_WALL_BREAKABLE:
        TmApplyTsa(gUiTmScratchA + TM_OFFSET(1, 14), Tsa_TerrainMapUi_ObstacleLabels, TILEREF(0x100, 2));

        num = sub_0802BCBC(gBmSt.cursor.x, gBmSt.cursor.y);

        if (num == 100)
        {
            TmApplyTsa(gUiTmScratchA + TM_OFFSET(3, 15), Tsa_TerrainMapUi_ObstacleFullHp, TILEREF(0x100, 0));
        }
        else
        {
            sub_08005044(num);
            PutDigits(gUiTmScratchA + TM_OFFSET(4, 15), gNumberStr + 7, TILEREF(0x128, 0), 2);
        }

        break;

    case TERRAIN_BALLISTA:
    case TERRAIN_LONGBALLISTA:
    case TERRAIN_KILLERBALLISTA:
        TmApplyTsa(gUiTmScratchA + TM_OFFSET(1, 14), Tsa_TerrainMapUi_BallistaLabels, TILEREF(0x100, 0));

        sub_08005044(sub_0802BCBC(gBmSt.cursor.x, gBmSt.cursor.y));
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

ASM_FUNC("asm/nonmatching/code_080857B4.s");

ASM_FUNC("asm/nonmatching/code_080857DC.s");

ASM_FUNC("asm/nonmatching/code_08085888.s");

ASM_FUNC("asm/nonmatching/code_08085968.s");

ASM_FUNC("asm/nonmatching/code_080859B4.s");

ASM_FUNC("asm/nonmatching/code_080859E0.s");

ASM_FUNC("asm/nonmatching/code_08085ADC.s");

ASM_FUNC("asm/nonmatching/code_08085C68.s");

ASM_FUNC("asm/nonmatching/code_08085C7C.s");

ASM_FUNC("asm/nonmatching/code_08085CDC.s");

ASM_FUNC("asm/nonmatching/code_08085CFC.s");

ASM_FUNC("asm/nonmatching/code_08085D48.s");

ASM_FUNC("asm/nonmatching/code_08085DCC.s");

ASM_FUNC("asm/nonmatching/code_08085F70.s");

ASM_FUNC("asm/nonmatching/code_08086008.s");

ASM_FUNC("asm/nonmatching/code_080861C8.s");

ASM_FUNC("asm/nonmatching/code_08086210.s");

ASM_FUNC("asm/nonmatching/code_0808626C.s");

ASM_FUNC("asm/nonmatching/code_08086270.s");

ASM_FUNC("asm/nonmatching/code_08086274.s");

ASM_FUNC("asm/nonmatching/code_08086278.s");

ASM_FUNC("asm/nonmatching/code_0808630C.s");

ASM_FUNC("asm/nonmatching/code_08086368.s");

ASM_FUNC("asm/nonmatching/code_08086398.s");

ASM_FUNC("asm/nonmatching/code_08086420.s");

ASM_FUNC("asm/nonmatching/code_080864AC.s");

ASM_FUNC("asm/nonmatching/code_080864E8.s");

ASM_FUNC("asm/nonmatching/code_0808652C.s");

ASM_FUNC("asm/nonmatching/code_080865D4.s");

