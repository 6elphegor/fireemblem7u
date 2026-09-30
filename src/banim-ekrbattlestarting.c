#include "gbafe.h"

struct ProcEkrBattleStarting {
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
PROC_SIZE_CHECK(struct ProcEkrBattleStarting);

extern s16 gEkrDebugModeMaybe;
extern s16 gBanimBackgroundIndex;
extern s16 gEkrSnowWeather;
extern s16 gEkrBmLocation[4];
extern int gEkrInitPosReal;
extern int gUnknown_0201FACC;
extern struct Anim * gUnknown_02000010[2];

int GetBattleAnimArenaFlag(void);
void BeginAnimsOnBattle_Arena(void);
void ExecBattleAnimArenaExit(void);
int CheckBanimHensei(void);
void BeginAnimsOnBattle_Hensei(void);
void ExecEkrHenseiEnd(void);
void NewEkrbattleending(void);
void MainUpdate_8055C68(void);
void NewEkrBattleStarting(void);
void EkrDispUpSet4C(void);
void EkrDispUpSet50(void);
void EfxClearScreenFx(void);
void NewEkrBaseKaiten(int identifier);
void NewEkrBaseAppear(int identifier, int duration);
void PutBanimBgPAL(int index);
void PutBanimBG(int index);

void ekrBaStart_8055FE8(struct ProcEkrBattleStarting * proc);
void ekrBaStart_8056024(struct ProcEkrBattleStarting * proc);
void ekrBaStart_8056078(struct ProcEkrBattleStarting * proc);
void ekrBaStart_ExecEkrBattle6C(struct ProcEkrBattleStarting * proc);
void ekrBaStart_InitBattleScreen(struct ProcEkrBattleStarting * proc);
void ekrBaStart_InitScreen(struct ProcEkrBattleStarting * proc);
void ekrBaStart_SreenFailIn(struct ProcEkrBattleStarting * proc);

CONST_DATA struct ProcCmd ProcScr_ekrBattleStarting[] = {
    PROC_19,
    PROC_REPEAT(ekrBaStart_InitScreen),
    PROC_REPEAT(ekrBaStart_SreenFailIn),
    PROC_REPEAT(ekrBaStart_InitBattleScreen),
    PROC_REPEAT(ekrBaStart_ExecEkrBattle6C),
    PROC_REPEAT(ekrBaStart_8055FE8),
    PROC_REPEAT(ekrBaStart_8056024),
    PROC_REPEAT(ekrBaStart_8056078),
    PROC_END,
};

bool SetupBanim(void)
{
    return PrepareBattleGraphicsMaybe();
}

void BeginAnimsOnBattleAnimations(void)
{
    int ret;

    if (GetBattleAnimArenaFlag() == TRUE)
    {
        BeginAnimsOnBattle_Arena();
        return;
    }

    if (CheckBanimHensei() == TRUE)
    {
        BeginAnimsOnBattle_Hensei();
        return;
    }

    NewEkrBattleDeamon();
    AnimClearAll();
    ret = GetBanimInitPosReal();
    gEkrInitPosReal = ret;
    NewEkrBattleStarting();

    gAnims[0] = NULL;
    gAnims[1] = NULL;
    gAnims[2] = NULL;
    gAnims[3] = NULL;

    gUnknown_02000010[0] = NULL;
    gUnknown_02000010[1] = NULL;

    SetMainFunc(MainUpdate_8055C68);
    SetOnHBlankA(NULL);
}

void EkrBattleEndRountine(void)
{
    if (GetBattleAnimArenaFlag() == TRUE)
    {
        ExecBattleAnimArenaExit();
        return;
    }

    if (CheckBanimHensei() == TRUE)
    {
        ExecEkrHenseiEnd();
        return;
    }

    NewEkrbattleending();
    SetMainFunc(MainUpdate_8055C68);
}

void MainUpdate_8055C68(void)
{
    RefreshKeySt(gpKeySt);
    ClearSprites();

    Proc_Run(gProcTreeRootArray[1]);

    if (GetGameLock() == 0)
        Proc_Run(gProcTreeRootArray[2]);

    Proc_Run(gProcTreeRootArray[3]);
    Proc_Run(gProcTreeRootArray[5]);

    PutSpriteLayerOam(0);
    Proc_Run(gProcTreeRootArray[4]);

    AnimUpdateAll();
    BattleAIS_ExecCommands();

    PutSpriteLayerOam(0xD);

    gBmSt.main_loop_ended = TRUE;
    gBmSt.main_loop_end_scanline = REG_VCOUNT;
    VBlankIntrWait();
}

void NewEkrBattleStarting(void)
{
    Proc_Start(ProcScr_ekrBattleStarting, PROC_TREE_3);
}

void ekrBaStart_InitScreen(struct ProcEkrBattleStarting * proc)
{
    int val;

    proc->timer = 0;
    proc->terminator = 0xF;

    val = (gEkrBmLocation[0] + gEkrBmLocation[2]) * 8 + 8;
    proc->x2 = val;
    proc->x1 = val;

    val = (gEkrBmLocation[1] + gEkrBmLocation[3]) * 8 + 8;
    proc->y2 = val;
    proc->y1 = val;

    CpuFastFill(0, gBg2Tm, 0x800);
    EnableBgSync(BG2_SYNC_BIT);

    SetBlendConfig(3, 0, 0, 4);
    SetBlendTargetA(0, 0, 0, 1, 0);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0, 0xF0, 0xA0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 0);

    gDispIo.win_ct.win0_enable_blend = 0;
    gDispIo.win_ct.wout_enable_blend = 1;

    Proc_Break(proc);
}

void ekrBaStart_SreenFailIn(struct ProcEkrBattleStarting * proc)
{
    int left, top, right, bottom;

    if (proc->timer != proc->terminator)
        proc->timer++;

    left   = Interpolate(INTERPOLATE_LINEAR, 0,    proc->x1, proc->timer, proc->terminator);
    top    = Interpolate(INTERPOLATE_LINEAR, 0,    proc->y1, proc->timer, proc->terminator);
    right  = Interpolate(INTERPOLATE_LINEAR, 0xF0, proc->x2, proc->timer, proc->terminator);
    bottom = Interpolate(INTERPOLATE_LINEAR, 0xA0, proc->y2, proc->timer, proc->terminator);

    SetWin0Box(left, top, right, bottom);

    if (proc->timer == proc->terminator)
    {
        SetWOutLayers(1, 1, 1, 1, 1);
        InitOam(0);
        LockBmDisplay();
        SetWin0Box(0, 0, 0xF0, 0xA0);
        EfxPalBlackInOut(gPal, 0x6, 0xA, 0x4);
        EnablePalSync();
        EndAllMus();
        Proc_Break(proc);
    }
}

void ekrBaStart_InitBattleScreen(struct ProcEkrBattleStarting * proc)
{
    if (0 == gEkrDebugModeMaybe)
    {
        NewEkrGauge();
        NewEkrDispUP();

        switch (gEkrDistanceType)
        {
        case EKR_DISTANCE_CLOSE:
        case EKR_DISTANCE_FAR:
        case EKR_DISTANCE_FARFAR:
            break;

        case EKR_DISTANCE_MONOCOMBAT:
            if (gBanimValid[0] == FALSE)
            {
                EkrGauge_Set4C();
                EkrDispUpSet4C();
            }

            if (gBanimValid[1] == FALSE)
            {
                EkrGauge_Set50();
                EkrDispUpSet50();
            }
            break;

        case EKR_DISTANCE_PROMOTION:
            EkrGauge_Set4C();
            EkrDispUpSet4C();
            break;

        default:
            break;
        }
    }

    EfxClearScreenFx();
    NewEkrUnitKakudai(0);
    NewEkrBaseKaiten(0);
    NewEkrWindowAppear(0, 0xB);
    NewEkrNamewinAppear(0, 0xB, 0);
    NewEkrBaseAppear(0, 0xB);

    proc->timer = 0;
    Proc_Break(proc);
}

void ekrBaStart_ExecEkrBattle6C(struct ProcEkrBattleStarting * proc)
{
    if (++proc->timer > 0xB)
    {
        if (gBanimBackgroundIndex == 0 || CheckInEkrDragon() != 0)
        {
            NewEkrBattle();
            Proc_End(proc);
        }
        else
        {
            proc->timer = 0;
            NewEkrBattle();
            Proc_Break(proc);
        }
    }
}

void ekrBaStart_8055FE8(struct ProcEkrBattleStarting * proc)
{
    EfxChapterMapFadeOUT(Interpolate(0, 4, 0x10, proc->timer, 8));

    if (++proc->timer == 0x9)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void ekrBaStart_8056024(struct ProcEkrBattleStarting * proc)
{
    if (gEkrSnowWeather == 0)
        gUnknown_0201FACC = 0x6;
    else
        gUnknown_0201FACC = 0xA;

    PutBanimBG(gBanimBackgroundIndex - 1);
    EfxPalBlackInOut(gPal, 0x6, 0xA, 0x10);
    Proc_Break(proc);
}

void ekrBaStart_8056078(struct ProcEkrBattleStarting * proc)
{
    int val = Interpolate(0, 0x10, 0, proc->timer, 8);

    PutBanimBgPAL(gBanimBackgroundIndex - 1);
    EfxPalBlackInOut(gPal, 0x6, 0xA, val);
    EnablePalSync();

    if (++proc->timer == 0x9)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
