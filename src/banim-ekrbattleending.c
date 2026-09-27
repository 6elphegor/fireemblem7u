#include "gbafe.h"

struct ProcEkrBattleEnding {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ STRUCT_PAD(0x30, 0x32);
    /* 32 */ s16 x1;
    /* 34 */ s16 x2;
    /* 36 */ STRUCT_PAD(0x36, 0x3A);
    /* 3A */ s16 y1;
    /* 3C */ s16 y2;
};

extern s16 gBanimBackgroundIndex;
extern s16 gEkrBmLocation[4];

extern struct ProcCmd CONST_DATA ProcScr_ekrBattleEnding[];

int GetBattleAnimArenaFlag(void);
void NewEkrBaseKaiten(int identifier);
void NewEkrBaseAppear(int identifier, int duration);
void PutBanimBgPAL(int index);
void BMapDispResume_FromBattleDelayed(void);
void RefreshBMapDisplay_FromBattle(void);
void UnpackChapterMapPalette(void);
void LoadLinkArenaFogPlaceholder(void);

void NewEkrbattleending(void)
{
    struct ProcEkrBattleEnding * proc;
    proc = Proc_Start(ProcScr_ekrBattleEnding, PROC_TREE_3);
    proc->timer = 0;
}

void ekrBattleEnding_80560F0(struct ProcEkrBattleEnding * proc)
{
    int ret;

    if (gBanimBackgroundIndex == 0 || CheckInEkrDragon() != 0)
    {
        Proc_Break(proc);
        return;
    }

    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, 0x8);
    PutBanimBgPAL(gBanimBackgroundIndex - 1);
    EfxPalBlackInOut(gPal, 0x6, 0xA, ret);
    EnablePalSync();

    if (++proc->timer == 0x9)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void ekrBattleEnding_8056170(struct ProcEkrBattleEnding * proc)
{
    if (gBanimBackgroundIndex == 0 || CheckInEkrDragon() != 0)
    {
        Proc_Break(proc);
        return;
    }

    UnpackChapterMapGraphics(gPlaySt.chapterIndex);
    EfxChapterMapFadeOUT(0x10);
    RenderMap();
    SetBgOffset(3, 0, 0);
    Proc_Break(proc);
}

void ekrBattleEnding_80561C8(struct ProcEkrBattleEnding * proc)
{
    if (gBanimBackgroundIndex == 0 || CheckInEkrDragon() != 0)
    {
        Proc_Break(proc);
        return;
    }

    EfxChapterMapFadeOUT(Interpolate(INTERPOLATE_LINEAR, 0x10, 0x4, proc->timer, 0x8));

    if (++proc->timer == 0x9)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void ekrBattleEnding_8056228(struct ProcEkrBattleEnding * proc)
{
    int val;

    proc->timer = 0;

    val = (gEkrBmLocation[0] + gEkrBmLocation[2]) * 8 + 8;
    proc->x2 = val;
    proc->x1 = val;

    val = (gEkrBmLocation[1] + gEkrBmLocation[3]) * 8 + 8;
    proc->y2 = val;
    proc->y1 = val;

    AnimClearAll();
    NewEkrUnitKakudai(1);
    NewEkrBaseKaiten(1);
    NewEkrWindowAppear(1, 0xB);
    NewEkrBaseAppear(1, 0xB);
    Proc_Break(proc);
}

void ekrBattleEnding_8056288(struct ProcEkrBattleEnding * proc)
{
    if (++proc->timer > 0xC)
    {
        EndEkrGauge();
        Proc_Break(proc);
        InitBmBgLayers();

        SetWinEnable(1, 0, 0);
        SetWin0Box(0, 0, 0, 0);
        SetWin0Layers(1, 1, 1, 1, 1);
        SetWOutLayers(1, 1, 1, 1, 0);
    }
}

void ekrBattleEnding_8056310(struct ProcEkrBattleEnding * proc)
{
    proc->timer = 0;
    proc->terminator = 0xF;
    ResetUnitSprites();
    BMapDispResume_FromBattleDelayed();
    RefreshUnitSprites();
    ForceSyncUnitSpriteSheet();
    ApplyUnitSpritePalettes();

    SetBlendConfig(3, 0, 0, 4);
    SetBlendTargetA(0, 0, 0, 1, 0);

    gDispIo.win_ct.win0_enable_blend = 0;
    gDispIo.win_ct.wout_enable_blend = 1;

    if (GetBattleAnimArenaFlag() != 1)
        UnpackChapterMapPalette();

    if (GetBanimLinkArenaFlag() == 1)
        LoadLinkArenaFogPlaceholder();

    Proc_Break(proc);
}

void ekrBattleEnding_8056390(struct ProcEkrBattleEnding * proc)
{
    int left, top, right, bottom;

    if (proc->timer != proc->terminator)
        proc->timer++;

    left   = Interpolate(INTERPOLATE_LINEAR, proc->x1, 0,    proc->timer, proc->terminator);
    top    = Interpolate(INTERPOLATE_LINEAR, proc->y1, 0,    proc->timer, proc->terminator);
    right  = Interpolate(INTERPOLATE_LINEAR, proc->x2, 0xF0, proc->timer, proc->terminator);
    bottom = Interpolate(INTERPOLATE_LINEAR, proc->y2, 0xA0, proc->timer, proc->terminator);

    SetWin0Box(left, top, right, bottom);
    CpuFastFill16(0, gBg2Tm, 0x800);
    EnableBgSync(BG2_SYNC_BIT);

    if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        SetWin0Box(0, 0, 0xF0, 0xA0);
        EnablePalSync();
        Proc_Break(proc);
    }
}

void ekrBattleEnding_8056484(struct ProcEkrBattleEnding * proc)
{
    EndEkrBattleDeamon();
    RefreshBMapDisplay_FromBattle();
    Proc_Break(proc);
}
