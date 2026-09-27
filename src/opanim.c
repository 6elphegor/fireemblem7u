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
ASM_FUNC("asm/nonmatching/code_080BBB30.s");
ASM_FUNC("asm/nonmatching/code_080BBBA4.s");
ASM_FUNC("asm/nonmatching/code_080BBBB8.s");
ASM_FUNC("asm/nonmatching/code_080BBC5C.s");
ASM_FUNC("asm/nonmatching/code_080BBC80.s");
ASM_FUNC("asm/nonmatching/code_080BBD28.s");
ASM_FUNC("asm/nonmatching/code_080BBDD0.s");
ASM_FUNC("asm/nonmatching/code_080BBE40.s");
ASM_FUNC("asm/nonmatching/code_080BBE50.s");
ASM_FUNC("asm/nonmatching/code_080BBE7C.s");
ASM_FUNC("asm/nonmatching/code_080BBEB0.s");
ASM_FUNC("asm/nonmatching/code_080BC0A4.s");
ASM_FUNC("asm/nonmatching/code_080BC0C4.s");
ASM_FUNC("asm/nonmatching/code_080BC0F8.s");
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
