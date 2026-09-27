#include "gbafe.h"

extern s8 CONST_DATA gUnitBurstMapUiTextXTable[];
extern s8 CONST_DATA gUnitBurstMapUiTextYTable[];
extern s8 CONST_DATA gUnitBurstMapUiXOffsetTable[];
extern s8 CONST_DATA gUnitBurstMapUiYOffsetTable[];
extern u16 * CONST_DATA gUnitBurstMapUiTopTsaLut[];
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

ASM_FUNC("asm/nonmatching/code_08085250.s");

ASM_FUNC("asm/nonmatching/code_08085290.s");

ASM_FUNC("asm/nonmatching/code_080853F8.s");

ASM_FUNC("asm/nonmatching/code_08085478.s");

ASM_FUNC("asm/nonmatching/code_08085644.s");

ASM_FUNC("asm/nonmatching/code_0808566C.s");

ASM_FUNC("asm/nonmatching/code_08085710.s");

ASM_FUNC("asm/nonmatching/code_080857B4.s");

ASM_FUNC("asm/nonmatching/code_080857DC.s");

ASM_FUNC("asm/nonmatching/code_08085888.s");

ASM_FUNC("asm/nonmatching/code_08085968.s");

ASM_FUNC("asm/nonmatching/code_080859B4.s");

ASM_FUNC("asm/nonmatching/code_080859E0.s");

ASM_FUNC("asm/nonmatching/code_08085ADC.s");

ASM_FUNC("asm/nonmatching/code_08085C68.s");

ASM_FUNC("asm/nonmatching/code_08085C7C.s");

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

