#include "gbafe.h"

/**
 * Promotion preparation battle animation screen (fireemblem8u: banim-ekrhensei.c)
 */

struct ProcEkrHensei {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
};

extern u32 gEkrInitPosReal;
extern s16 gBanimBackgroundIndex;

extern CONST_DATA struct ProcCmd ProcScr_ekrHenseiInit[];
extern CONST_DATA struct ProcCmd ProcScr_ekrHenseiEnd[];

int GetBanimInitPosReal(void);
void MainUpdate_8055C68(void);
void EfxClearScreenFx(void);
void EkrDispUP_0804D5A4(void);
void PutBanimBG(int index);

void NewEkrHenseiInitPROC(void);
void NewEkrHenseiEnd(void);

int CheckBanimHensei(void)
{
    if (gBattleStats.config & BATTLE_CONFIG_PROMOTION_PREP)
        return true;

    return false;
}

void BeginAnimsOnBattle_Hensei(void)
{
    int pos;

    NewEkrBattleDeamon();
    AnimClearAll();
    pos = GetBanimInitPosReal();
    gEkrInitPosReal = pos;
    NewEkrHenseiInitPROC();
    SetOnHBlankA(NULL);
}

void ExecEkrHenseiEnd(void)
{
    AnimClearAll();
    NewEkrHenseiEnd();
    SetMainFunc(MainUpdate_8055C68);
}

void NewEkrHenseiInitPROC(void)
{
    Proc_Start(ProcScr_ekrHenseiInit, PROC_TREE_3);
}

void EkrHenseiInit_InitScreen(struct ProcEkrHensei * proc)
{
    InitOam(0);
    EfxClearScreenFx();
    UpdateBanimFrame();
    NewEkrGauge();
    NewEkrDispUP();
    NewEkrBattle();
    PutBanimBG(gBanimBackgroundIndex - 1);
    CpuFastCopy(PAL_BG(0), gEfxPal, 0x400);
    EfxPalBlackInOut(PAL_BG(0), 0, 0x20, 0x10);
    EnablePalSync();
    Proc_Break(proc);
}

void EkrHenseiInit_InitTimer(struct ProcEkrHensei * proc)
{
    EkrGauge_0804CC48();
    EkrDispUP_0804D5A4();
    proc->timer = 0;
    proc->terminator = 0x10;
    Proc_Break(proc);
}

void EkrHenseiInit_FadeIn(struct ProcEkrHensei * proc)
{
    int color = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, proc->terminator);

    CpuFastCopy(gEfxPal, PAL_BG(0), 0x400);
    EfxPalBlackInOut(PAL_BG(0), 0, 0x20, color);
    EnablePalSync();

    if (++proc->timer == (proc->terminator + 1))
        Proc_Break(proc);
}

void EkrHenseiInit_End(struct ProcEkrHensei * proc)
{
    Proc_Break(proc);
}

void NewEkrHenseiEnd(void)
{
    Proc_Start(ProcScr_ekrHenseiEnd, PROC_TREE_3);
}

void EkrHenseiEnd_InitTimer(struct ProcEkrHensei * proc)
{
    CpuFastCopy(PAL_BG(0), gEfxPal, 0x400);
    proc->timer = 0;
    proc->terminator = 0x10;
    Proc_Break(proc);
}

void EkrHenseiEnd_FadeOut(struct ProcEkrHensei * proc)
{
    int color = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, proc->terminator);

    CpuFastCopy(gEfxPal, PAL_BG(0), 0x400);
    EfxPalBlackInOut(PAL_BG(0), 0, 0x20, color);
    EnablePalSync();

    if (++proc->timer == (proc->terminator + 1))
        Proc_Break(proc);
}

void EkrHenseiEnd_End(struct ProcEkrHensei * proc)
{
    EndEkrBattleDeamon();
    EndEkrGauge();
    SetMainFunc(OnMain);
    SetOnVBlank(OnVBlank);
    Proc_Break(proc);
}
