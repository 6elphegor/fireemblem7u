#include "gbafe.h"

extern u8 const Img_EkrExpBar[];
extern u8 const Img_EkrExpBarChange[];
extern u8 const Img_BarNumfx[];
extern u16 const Pal_ExpBar[];
extern u8 const Tsa_ManimExpBar[];
extern u16 const gManimExpBarInfo[];

void PutManimExpBar(int x, int y, int exp)
{
    PutManimWindowNumber(gBg0Tm + (((y + 1) << 5) + (x + 2)), exp, 0x521F, 2, 0x5229);
    PutManimWindowBar(gBg0Tm + (((y + 1) << 5) + (x + 3)), 99, exp, 0, gManimExpBarInfo);

    EnableBgSync(BG0_SYNC_BIT);
}

void ManimExpBar_Init(struct ManimExpBarProc * proc)
{
    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);

    RegisterDataMove(Img_EkrExpBar, (void *)(VRAM) + GetBgChrOffset(0) + 0x200 * 0x20, 7 * 0x20);
    RegisterDataMove(Img_EkrExpBarChange, (void *)(VRAM) + GetBgChrOffset(0) + 0x207 * 0x20, 24 * 0x20);
    RegisterDataMove(Img_BarNumfx, (void *)(VRAM) + GetBgChrOffset(0) + 0x21F * 0x20, 11 * 0x20);

    ApplyPalette(Pal_ExpBar, 5);

    TmApplyTsa_thm(gBg0Tm + TM_OFFSET(6, 8), Tsa_ManimExpBar, TILEREF(0x200, 5));

    PutManimExpBar(6, 8, proc->exp_from);
}

void ManimExpBar_PlaySe(struct ManimExpBarProc * proc)
{
    PlaySoundEffect(0x394);
}

void ManimExpBar_Increment(struct ManimExpBarProc * proc)
{
    proc->exp_from++;

    if (proc->exp_from >= 100)
        proc->exp_from = 0;

    PutManimExpBar(6, 8, proc->exp_from);

    if (proc->exp_from == proc->exp_to % 100)
    {
        Proc_Break(proc);
        m4aSongNumStop(0x394);
    }
}

void ManimExpBar_InitShake(struct ManimExpBarProc * proc)
{
    proc->timer = 0;

    ManimExpBar_Shake(proc);

    SetWinEnable(1, 0, 0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);
}

void ManimExpBar_Shake(struct ManimExpBarProc * proc)
{
    SetWin0Box(0, 76 - proc->timer, 240, 76 + proc->timer);

    proc->timer += 2;

    if (proc->timer > 12)
    {
        SetWinEnable(0, 0, 0);
        Proc_Break(proc);
    }
}

void ManimExpBar_LevelUpIfPossible(struct ManimExpBarProc * proc)
{
    if (proc->exp_to < 100)
        return;

    StartManimLevelUp(proc->actor, proc);
}
