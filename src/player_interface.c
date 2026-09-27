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

ASM_FUNC("asm/nonmatching/code_08084E28.s");

ASM_FUNC("asm/nonmatching/code_08084E70.s");

ASM_FUNC("asm/nonmatching/code_08084E90.s");

ASM_FUNC("asm/nonmatching/code_08084EB4.s");

ASM_FUNC("asm/nonmatching/code_08084EDC.s");

ASM_FUNC("asm/nonmatching/code_08084FB4.s");

ASM_FUNC("asm/nonmatching/code_08085110.s");

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

