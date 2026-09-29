#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_FlameBreathfx[] = {
    PROC_YIELD,
    PROC_CALL(sub_0807C41C),
    PROC_REPEAT(FlameBreathfx_Loop_A),
    PROC_REPEAT(FlameBreathfx_Loop_B),
    PROC_REPEAT(FlameBreathfx_Loop_C),
    PROC_CALL(sub_0807C66C),
    PROC_END,
};

void sub_0807C3A0(struct ProcFlameBreathfx * proc)
{
    proc->bg_offset += 8;

    ScanlineRotation(GetScanlineBuf(1, 0), proc->bg_offset, 2, 2, GetBgYOffset(BG_0), 0x50, 1);
    ScanlineRotation(GetScanlineBuf(1, 0xA0), proc->bg_offset, 3, 2, GetBgXOffset(BG_0), 0x50, 1);

    SwapScanlineBufs();
}

void sub_0807C41C(struct ProcFlameBreathfx * proc)
{
    u8 * tsalut[2] = {
        Tsa_FlameBreathfxR,
        Tsa_FlameBreathfxL
    };

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    SetBlendAlpha(0, 0x10);

    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);

    Decompress(Img_FlameBreathfx, (void *)BG_VRAM + 0x800);
    ApplyPalette(Pal_FlameBreathfx, 5);
    PutCompressedTsa(gBg0Tm, tsalut[proc->type], 0x5040);

    SetBgOffset(BG_0, (-proc->x) & 0xFF, (-proc->y) & 0xFF);
    EnableBgSync(BG0_SYNC_BIT);
    proc->timer = 0;

    InitScanlineEffect();
    SetOnHBlankA(sub_08077ADC);
    StartParallelWorker(sub_0807C3A0, proc);
}

void FlameBreathfx_Loop_A(struct ProcFlameBreathfx * proc)
{
    int time = proc->timer++ * 2;
    SetBlendAlpha(time, 0x10 - time / 2);

    if (time == 0x10)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void FlameBreathfx_Loop_B(struct ProcFlameBreathfx * proc)
{
    int blend;

    proc->timer += 2;

    if ((s16)(proc->timer % 16) < 8)
        blend = 0x10 - (s16)(proc->timer % 8);
    else
        blend = (s16)(proc->timer % 8) + 8;

    SetBlendAlpha(blend, 0x10 - (blend >> 1));

    if (proc->timer == 0x10)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void FlameBreathfx_Loop_C(struct ProcFlameBreathfx * proc)
{
    int time = (s16)(proc->timer++ >> 1);

    SetBlendAlpha(0x10 - time, (time >> 1) + 8);

    if (time == 0x10)
        Proc_Break(proc);
}

void sub_0807C66C(struct ProcFlameBreathfx * proc)
{
    TmFill(gBg0Tm, 0);
    EnableBgSync(BG0_SYNC_BIT);
    SetOnHBlankA(NULL);
    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);
}
