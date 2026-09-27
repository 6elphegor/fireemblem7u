#include "gbafe.h"

extern int const gUnk_08CEF084[];
extern int const gUnk_08CEF0C4[];
extern u16 const gUnk_086740B4[];
extern u16 const gUnk_08B90600[];
extern u16 const gUnk_08CEF490[];
extern u8 const gUnk_086005C4[];
extern u8 const gUnk_085EE004[];
extern u8 const gUnk_08616FC4[];
extern u8 const gUnk_086758E0[];
extern u8 const gUnk_0867453C[];
extern void * const gUnk_08CEF078;
extern void * const gUnk_08CEF07C;
extern void * const gUnk_08CEF080;
extern u16 const gUnk_085ECDF4[];
extern u8 const gUnk_085ECE14[];
extern u8 const gUnk_085ED0DC[];
extern u8 const gUnk_08CEFA38[];
extern u16 const gUnk_08673D38[];
extern u8 const gUnk_08673D58[];
extern u16 const gUnk_08600544[];
extern u8 const gUnk_085FF1D4[];
extern u8 const gUnk_0860029C[];
extern u16 const gUnk_086005A4[];
extern u16 const gUnk_085E9D2C[];
extern u16 const gUnk_0867451C[];
extern u8 const gUnk_086756A0[];
extern u16 const gUnk_086758C0[];
extern u8 const gUnk_08676BB8[];
extern u16 const gUnk_08616D74[];
extern u8 const gUnk_08616D94[];
extern u16 const gUnk_086005E4[];
extern u16 const gUnk_08600604[];
extern u16 const gUnk_08600584[];
extern u16 const gUnk_08600564[];

struct ProcCmd CONST_DATA ProcScr_08CEF0E4[] = {
    PROC_SET_END_CB(sub_080BB524),
    PROC_YIELD,
    PROC_CALL(sub_080BB4E8),
    PROC_REPEAT(sub_080BB530),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_OpeningSeqence[] = {
    PROC_YIELD,
    PROC_CALL(sub_080BB81C),
    PROC_SLEEP(1),
    PROC_CALL(sub_080BB98C),
PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),
    PROC_SLEEP(90),
    PROC_CALL(sub_080BB800),
    PROC_CALL(OpAnim_DrawWater),
    PROC_REPEAT(sub_080BBB30),
    PROC_SLEEP(60),
    PROC_REPEAT(sub_080BBA3C),
    PROC_BLOCK,
PROC_LABEL(2),
    PROC_CALL(sub_080BC960),
    PROC_BLOCK,
PROC_LABEL(0),
    PROC_CALL(sub_080BBBA4),
    PROC_BLOCK,
PROC_LABEL(1),
    PROC_CALL(sub_080BBBB8),
    PROC_REPEAT(sub_080BBEB0),
    PROC_CALL(sub_080BC0A4),
    PROC_REPEAT(sub_080BC0C4),
    PROC_YIELD,
    PROC_CALL(sub_080BC164),
    PROC_REPEAT(sub_080BC21C),
    PROC_SLEEP(60),
    PROC_REPEAT(sub_080BC280),
PROC_LABEL(98),
    PROC_SLEEP(30),
    PROC_CALL(OpAnim_DrawCloud),
    PROC_YIELD,
    PROC_CALL(sub_080BC474),
PROC_CALL_ARG(NewFadeInWhite, 2),
    PROC_WHILE(FadeInExists),
    PROC_YIELD,
    PROC_REPEAT(sub_080BC494),
    PROC_WHILE(CheckBmBgfxDone),
PROC_LABEL(99),
    PROC_CALL(sub_080BC104),
    PROC_SLEEP(1),
    PROC_END,
};

void sub_080BB4E8(struct OpAnimProc * proc)
{
    gUnkOpAnim_03001620 = 0;
    gUnkOpAnim_020072BC = 0;

    sub_080BB2AC();
    InitOpScanlineBuf();
    sub_080BB070();

    SetOnHBlankA(NULL);
    SetOnHBlankA(HBlank_80BBDD0);

    proc->unk_4C = 0;
}
void sub_080BB524(struct OpAnimProc * proc)
{
    SetOnHBlankA(NULL);
}
void sub_080BB530(struct OpAnimProc * proc)
{
    if (gUnkOpAnim_03001620 & 0xE00)
        proc->unk_4C++;
    else
        proc->unk_4C = 0;

    if (gUnkOpAnim_03001620 & 0x400)
    {
        if ((proc->unk_4C & 0xF) == 0)
            sub_080BD424(gUnk_08CEF084[(proc->unk_4C >> 4) & 0xF], 0x70, gUnk_08CEF0C4[(proc->unk_4C >> 4) & 7], 0x20, proc);
    }
    else if (gUnkOpAnim_03001620 & 0x200)
    {
        if ((proc->unk_4C & 0x1F) == 0)
            sub_080BD424(gUnk_08CEF084[(proc->unk_4C >> 5) & 0xF], 0x70, gUnk_08CEF0C4[(proc->unk_4C >> 4) & 7], 0x20, proc);
    }

    if (gUnkOpAnim_03001620 & 0x800)
    {
        int xs[8] = { 60, 160, 80, 200, 100, 70, 190, 120 };

        if ((proc->unk_4C & 0xF) == 0)
            StartSpriteAnimProc(gUnk_086740B4, xs[(proc->unk_4C >> 4) & 7], 0x50, 0x3980, ((proc->unk_4C >> 4) & 1) + 1, 10);
    }

    if (gUnkOpAnim_03001620 & 0xF)
        sub_080BB0E0();

    if (gUnkOpAnim_03001620 & 0x180)
    {
        if (gUnkOpAnim_03001620 & 0x100)
        {
            if (gUnkOpAnim_020072BC > 0)
                gUnkOpAnim_020072BC--;
        }
        else if (gUnkOpAnim_03001620 & 0x80)
        {
            if (gUnkOpAnim_020072BC < 0x10)
                gUnkOpAnim_020072BC++;
        }
    }

    if (gUnkOpAnim_03001620 & 0x60)
    {
        if (gUnkOpAnim_03001620 & 0x40)
        {
            if (gUnkOpAnim_02007508 == 0)
            {
                gUnkOpAnim_03001620 &= ~0x64;
            }
            else if (gUnkOpAnim_02007508 > 0)
            {
                if (--gUnkOpAnim_02007508 == 0)
                {
                    TmFill(gBg0Tm, 0);
                    EnableBgSync(BG0_SYNC_BIT);
                }
            }
        }
        else if (gUnkOpAnim_03001620 & 0x20)
        {
            gUnkOpAnim_03001620 |= 4;

            if (gUnkOpAnim_02007508 < 0x40)
                gUnkOpAnim_02007508++;
        }

        OpScanlineSt.unk_0C = (gUnkOpAnim_0200751C * gUnkOpAnim_02007508) >> 6;
        OpScanlineSt.unk_10 = (gUnkOpAnim_02007520 * gUnkOpAnim_02007508) >> 6;
        sub_080BB32C();
    }

    gUnkOpAnim_0200750C.unk_08 = (COS_Q12(gUnkOpAnim_0200750C.unk_00) * gUnkOpAnim_0200750C.unk_04) >> 4;
    gUnkOpAnim_0200750C.unk_0C = (SIN_Q12(gUnkOpAnim_0200750C.unk_00) * gUnkOpAnim_0200750C.unk_04) >> 4;
}
void sub_080BB76C(struct OpAnimProc * proc)
{
    int i;

    if (gUnkOpAnim_03001620 & 0x180)
    {
        for (i = 0; i < 4; i++)
            PutSpriteExt(4, i << 6, 0x484, gUnk_08B90600, 0x1780);
    }

    if (proc->unk_3C)
    {
        PutSpriteExt(4, 8, 0x80, gUnk_08CEF490, 0x1200);
        PutSpriteExt(4, 8, 0x90, gUnk_08CEF490, 0x1240);
    }
    else
    {
        PutSpriteExt(4, 8, 0x90, gUnk_08CEF490, 0x1200);
    }
}
void sub_080BB800(struct OpAnimProc * proc)
{
    sub_08002C74();
    proc->unk_44 = 1;
}
void sub_080BB814(struct OpAnimProc * proc)
{
    proc->unk_44 = 0;
}
void sub_080BB81C(struct OpAnimProc * proc)
{
    int i;

    u16 bg_config[] = {
        0x8000, 0x6000, 0,
        0x0000, 0x6800, 0,
        0x0000, 0x7000, 0,
        0x8000, 0x7800, 0,
    };

    InitBgs(bg_config);
    FadeBgmOut(1);

    CpuFastFill(0, (void *) VRAM, 0x20);
    CpuFastFill(0, (void *) VRAM + 0x8000, 0x20);
    CpuFastFill(0, (void *) VRAM + 0x10000, 0x20);

    for (i = 0; i < 0x20; i++)
        CpuFastCopy(gUnk_086005C4, gPal + i * 0x10, 0x20);

    EnablePalSync();

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);
    SetBlendBackdropA(1);
    SetBlendBackdropB(1);

    SetDispEnable(0, 0, 0, 0, 0);

    ResetTitleBgAffin(2);

    if (sub_08002CA4())
        sub_080BB800(proc);
    else
        sub_080BB814(proc);

    sub_080BC5B8(proc);

    Decompress(gUnk_085EE004, (void *) 0x06017000);
    Decompress(gUnk_085EE004, (void *) 0x06017400);
    Decompress(gUnk_085EE004, (void *) 0x06017800);
    Decompress(gUnk_085EE004, (void *) 0x06017C00);

    Decompress(gUnk_08616FC4, gUnk_08CEF078);
    Decompress(gUnk_086758E0, gUnk_08CEF07C);
    Decompress(gUnk_0867453C, gUnk_08CEF080);

    Proc_Start(ProcScr_08CEF0E4, proc);

    SetNextGameAction(3);
}
void sub_080BB98C(struct OpAnimProc * proc)
{
    gDispIo.bg0_ct.priority = 2;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 3;
    gDispIo.bg3_ct.priority = 0;

    ApplyPaletteExt(gUnk_085ECDF4, 0x140, 0x20);
    Decompress(gUnk_085ECE14, (void *) 0x0600C000);
    sub_080AACD8(gBg3Tm, gUnk_085ED0DC, 0xA200);
    EnableBgSync(BG3_SYNC_BIT);

    proc->unk_2C = 0;
    proc->unk_40 = sub_080BD764(gUnk_08CEFA38, 2, -1, 0, proc);

    ApplyPaletteExt(gUnk_08673D38, 0x260, 0x20);
    Decompress(gUnk_08673D58, (void *) 0x06013000);
}
void sub_080BBA3C(struct OpAnimProc * proc)
{
    int val = ++proc->unk_2C;

    gDispIo.blend_ct.effect = BLEND_EFFECT_ALPHA;
    val = val >> 1;
    gDispIo.blend_coef_a = 0x10 - val;
    gDispIo.blend_coef_b = val;
    gDispIo.blend_y = 0;
    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(1, 0, 0, 0, 0);

    if (val == 0x10)
    {
        TmFill(gBg3Tm, 0);
        EnableBgSync(BG3_SYNC_BIT);
        Proc_Break(proc);
        sub_080BD548(proc);
    }
}
void OpAnim_DrawWater(struct OpAnimProc * proc)
{
    ApplyPaletteExt(gUnk_08600544, 0x1C0, 0x20);
    Decompress(gUnk_085FF1D4, (void *) 0x06008000);
    sub_080AACD8(gBg0Tm, gUnk_0860029C, 0xE000);

    gDispIo.bg0_ct.size = 0;
    gDispIo.bg0_ct.wrap = 1;

    EnableBgSync(BG0_SYNC_BIT);
    InitOpScanlineBuf();

    gUnkOpAnim_03001620 |= 1;
    proc->unk_2C = 0;
}
void sub_080BBB30(struct OpAnimProc * proc)
{
    int val = ++proc->unk_2C;

    gDispIo.blend_ct.effect = BLEND_EFFECT_ALPHA;
    val = val >> 2;
    gDispIo.blend_coef_a = val;
    gDispIo.blend_coef_b = 0x10 - val;
    gDispIo.blend_y = 0;

    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    if (val == 0x10)
    {
        proc->unk_2C = 0;
        Proc_Break(proc);
    }
}
void sub_080BBBA4(struct OpAnimProc * proc)
{
    ApplyPaletteExt(gUnk_086005A4, 0, 0x20);
}
void sub_080BBBB8(struct OpAnimProc * proc)
{
    StartBgmExt(0x5C, 0x1E, NULL);

    gDispIo.bg0_ct.priority = 2;
    gDispIo.bg1_ct.priority = 3;
    gDispIo.bg2_ct.priority = 3;
    gDispIo.bg3_ct.priority = 3;

    ApplyPaletteExt(gUnk_085E9D2C, 0x220, 0x20);
    EnableBgSync(BG2_SYNC_BIT);

    proc->unk_2C = 0;
    proc->unk_3C = 0;

    sub_080BCAFC();
    EndAllParallelWorkers();
    StartParallelWorker(sub_080BB76C, proc);
    sub_080BCE20(proc);

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);

    gUnkOpAnim_03001620 |= 0x80;

    proc->unk_30 = 0;
    proc->unk_38 = 0;
    proc->unk_34 = 0;
}
void sub_080BBC5C(void)
{
    StartSpriteAnimProc(gUnk_086740B4, 0x78, 0x50, 0x3980, 0, 10);
}
void sub_080BBC80(void)
{
    SetBgOffset(0, 0, 0);
    TmFill(gBg0Tm, 0);
    ApplyPaletteExt(gUnk_0867451C, 0x1A0, 0x20);
    CpuFastCopy(gUnk_08CEF080, (void *) 0x06008000, 0x2000);
    sub_080AACD8(gBg0Tm, gUnk_086756A0, 0xD000);
    EnableBgSync(BG0_SYNC_BIT);

    SetBlendAlpha(0, 0x10);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);
}
void sub_080BBD28(void)
{
    SetBgOffset(0, 0, 0);
    TmFill(gBg0Tm, 0);
    ApplyPaletteExt(gUnk_086758C0, 0x1A0, 0x20);
    CpuFastCopy(gUnk_08CEF07C, (void *) 0x06008000, 0x2000);
    sub_080AACD8(gBg0Tm, gUnk_08676BB8, 0xD000);
    EnableBgSync(BG0_SYNC_BIT);

    SetBlendAlpha(0, 0x10);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);
}
void sub_080BBDD0(void)
{
    SetBgOffset(0, 0, 0);
    sub_080BB2AC();
    TmFill(gBg0Tm, 0);
    ApplyPaletteExt(gUnk_08616D74, 0x1A0, 0x20);
    CpuFastCopy(gUnk_08CEF078, (void *) 0x06008000, 0x1000);
    sub_080AACD8(gBg0Tm + 0x40, gUnk_08616D94, 0xD000);

    gUnkOpAnim_03001620 |= 0x20;

    EnableBgSync(BG0_SYNC_BIT);
}
void sub_080BBE40(void)
{
    gUnkOpAnim_03001620 |= 0x40;
}
void sub_080BBE50(struct OpAnimProc * proc)
{
    sub_080BD1DC(-1, gUnk_086005E4, 0, 0x10, 0xFFFF, 8, proc);
}
void sub_080BBE7C(struct OpAnimProc * proc)
{
    sub_080BBC5C();
    sub_080BD1DC(-1, gUnk_08600604, 0, 0x10, 0xFFFF, 8, proc);
}
void sub_080BBEB0(struct OpAnimProc * proc)
{
    if (proc->unk_38 > proc->unk_30)
    {
        proc->unk_30 += proc->unk_34;

        if (proc->unk_30 > proc->unk_38)
            proc->unk_30 = proc->unk_38;

        sub_080BD688(proc->unk_40, -proc->unk_30);
    }

    if (proc->unk_38 < proc->unk_30)
    {
        proc->unk_30 -= proc->unk_34;

        if (proc->unk_30 < proc->unk_38)
            proc->unk_30 = proc->unk_38;

        sub_080BD688(proc->unk_40, -proc->unk_30);
    }

    switch (proc->unk_2C)
    {
    case 300:
        sub_080BCA6C(1000, proc);
        break;

    case 1220:
        gUnkOpAnim_03001620 |= 0x200;
        /* fallthrough */

    case 1340:
        sub_080BD0D4((void *) -1, gUnk_08600584, 0, 1, proc);
        break;

    case 1400:
        proc->unk_34 = 0x20;
        proc->unk_38 = 0x200;
        break;

    case 1580:
        gUnkOpAnim_03001620 |= 0x400;
        sub_080BBDD0();
        break;

    case 1760:
        proc->unk_34 = 0x20;
        proc->unk_38 = 0;
        break;

    case 2060:
    case 2210:
        sub_080BBE50(proc);
        break;

    case 2360:
        sub_080BBE7C(proc);
        gUnkOpAnim_03001620 &= ~0x600;
        sub_080BBE40();
        break;

    case 2860:
        sub_080BBE50(proc);
        gUnkOpAnim_03001620 |= 0x800;
        break;

    case 2920:
        proc->unk_34 = 0x10;
        proc->unk_38 = 0x180;
        gUnkOpAnim_03001620 &= ~0x800;
        break;

    case 3060:
        sub_080BD0D4((void *) -1, gUnk_08600564, 0, 1, proc);
        break;

    case 2560:
    case 3160:
        proc->unk_34 = 0x10;
        proc->unk_38 = 0x100;
        break;

    case 3700:
        sub_080BCAE8(proc);
        break;

    case 4000:
        Proc_Break(proc);
        break;
    }

    proc->unk_2C++;
}
void sub_080BC0A4(struct OpAnimProc * proc)
{
    proc->unk_2C = 0;
    gUnkOpAnim_03001620 |= 0x100;
    ArchiveCurrentPalettes();
}
void sub_080BC0C4(struct OpAnimProc * proc)
{
    int val = proc->unk_2C * 8 + 0x100;
    proc->unk_2C++;

    WriteFadedPaletteFromArchive(val, val, val, 1);

    if (val == 0x200)
        Proc_Break(proc);
}
void sub_080BC0F8(void)
{
    EnableBgSync(BG1_SYNC_BIT);
}
ASM_FUNC("asm/nonmatching/code_080BC104.s");
ASM_FUNC("asm/nonmatching/code_080BC164.s");
ASM_FUNC("asm/nonmatching/code_080BC21C.s");
ASM_FUNC("asm/nonmatching/code_080BC280.s");
ASM_FUNC("asm/nonmatching/code_080BC2D4.s");
ASM_FUNC("asm/nonmatching/code_080BC2D8.s");
ASM_FUNC("asm/nonmatching/code_080BC30C.s");
ASM_FUNC("asm/nonmatching/code_080BC474.s");
ASM_FUNC("asm/nonmatching/code_080BC494.s");
ASM_FUNC("asm/nonmatching/code_080BC570.s");
ASM_FUNC("asm/nonmatching/code_080BC5B8.s");
ASM_FUNC("asm/nonmatching/code_080BC5CC.s");
ASM_FUNC("asm/nonmatching/code_080BC5E0.s");
ASM_FUNC("asm/nonmatching/code_080BC5F4.s");
ASM_FUNC("asm/nonmatching/code_080BC6A8.s");
ASM_FUNC("asm/nonmatching/code_080BC790.s");
ASM_FUNC("asm/nonmatching/code_080BC7E4.s");
ASM_FUNC("asm/nonmatching/code_080BC8C0.s");
ASM_FUNC("asm/nonmatching/code_080BC8F8.s");
ASM_FUNC("asm/nonmatching/code_080BC94C.s");
ASM_FUNC("asm/nonmatching/code_080BC960.s");
ASM_FUNC("asm/nonmatching/code_080BC994.s");
ASM_FUNC("asm/nonmatching/code_080BC9A8.s");
ASM_FUNC("asm/nonmatching/code_080BC9B8.s");
ASM_FUNC("asm/nonmatching/code_080BCA6C.s");
ASM_FUNC("asm/nonmatching/code_080BCA84.s");
ASM_FUNC("asm/nonmatching/code_080BCA94.s");
ASM_FUNC("asm/nonmatching/code_080BCAE8.s");
ASM_FUNC("asm/nonmatching/code_080BCAFC.s");
ASM_FUNC("asm/nonmatching/code_080BCB1C.s");
ASM_FUNC("asm/nonmatching/code_080BCB34.s");
ASM_FUNC("asm/nonmatching/code_080BCBFC.s");
ASM_FUNC("asm/nonmatching/code_080BCCC4.s");
ASM_FUNC("asm/nonmatching/code_080BCCF0.s");
ASM_FUNC("asm/nonmatching/code_080BCDB4.s");
ASM_FUNC("asm/nonmatching/code_080BCDD8.s");
ASM_FUNC("asm/nonmatching/code_080BCE14.s");
ASM_FUNC("asm/nonmatching/code_080BCE20.s");
ASM_FUNC("asm/nonmatching/code_080BCE34.s");
ASM_FUNC("asm/nonmatching/code_080BCE60.s");
ASM_FUNC("asm/nonmatching/code_080BCFCC.s");
ASM_FUNC("asm/nonmatching/code_080BCFE8.s");
ASM_FUNC("asm/nonmatching/code_080BD08C.s");
ASM_FUNC("asm/nonmatching/code_080BD0D4.s");
ASM_FUNC("asm/nonmatching/code_080BD168.s");
ASM_FUNC("asm/nonmatching/code_080BD1A4.s");
ASM_FUNC("asm/nonmatching/code_080BD1DC.s");
ASM_FUNC("asm/nonmatching/code_080BD310.s");
ASM_FUNC("asm/nonmatching/code_080BD364.s");
ASM_FUNC("asm/nonmatching/code_080BD424.s");
ASM_FUNC("asm/nonmatching/code_080BD4C4.s");
ASM_FUNC("asm/nonmatching/code_080BD4F4.s");
ASM_FUNC("asm/nonmatching/code_080BD548.s");
ASM_FUNC("asm/nonmatching/code_080BD55C.s");
ASM_FUNC("asm/nonmatching/code_080BD570.s");
ASM_FUNC("asm/nonmatching/code_080BD588.s");
ASM_FUNC("asm/nonmatching/code_080BD688.s");
ASM_FUNC("asm/nonmatching/code_080BD68C.s");
ASM_FUNC("asm/nonmatching/code_080BD698.s");
ASM_FUNC("asm/nonmatching/code_080BD764.s");
