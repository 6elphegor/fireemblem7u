#include "gbafe.h"

extern const u8 gUnk_08600644[];
extern const u8 gUnk_08600950[];
extern const u8 gUnk_08600C64[];
extern const u8 gUnk_08600FAC[];
extern const u8 gUnk_08601330[];
extern const u8 gUnk_08601708[];
extern const u8 gUnk_08601B10[];
extern const u8 gUnk_08601F1C[];
extern const u8 gUnk_08602324[];
extern const u8 gUnk_08602758[];
extern const u8 gUnk_08602B8C[];
extern const u8 gUnk_08602FC8[];
extern const u8 gUnk_08603404[];
extern const u8 gUnk_0860382C[];
extern const u8 gUnk_08603C50[];
extern const u8 gUnk_08604088[];
extern const u8 gUnk_086044C8[];
extern const u8 gUnk_08604900[];
extern const u8 gUnk_08604D2C[];
extern const u8 gUnk_08605154[];
extern const u8 gUnk_0860556C[];
extern const u8 gUnk_0860599C[];
extern const u8 gUnk_08605DCC[];
extern const u8 gUnk_086061FC[];
extern const u8 gUnk_08606628[];
extern const u8 gUnk_08606A58[];
extern const u8 gUnk_08606E90[];
extern const u8 gUnk_086072D4[];
extern const u8 gUnk_08607718[];
extern const u8 gUnk_08607B5C[];
extern const u8 gUnk_08607F8C[];
extern const u8 gUnk_0860839C[];
extern const u8 gUnk_086087A4[];
extern const u8 gUnk_08608B74[];
extern const u8 gUnk_08608EA0[];
extern const u8 gUnk_086091B4[];
extern const u8 gUnk_08609534[];
extern const u8 gUnk_08609858[];
extern const u8 gUnk_08609C0C[];
extern const u8 gUnk_08609FF4[];
extern const u8 gUnk_0860A404[];
extern const u8 gUnk_0860A834[];
extern const u8 gUnk_0860AC60[];
extern const u8 gUnk_0860B098[];
extern const u8 gUnk_0860B4C4[];
extern const u8 gUnk_0860B8FC[];
extern const u8 gUnk_0860BD30[];
extern const u8 gUnk_0860C168[];
extern const u8 gUnk_0860C59C[];
extern const u8 gUnk_0860C9D0[];
extern const u8 gUnk_0860CDE0[];
extern const u8 gUnk_0860D1FC[];
extern const u8 gUnk_0860D638[];
extern const u8 gUnk_0860DA70[];
extern const u8 gUnk_0860DEB0[];
extern const u8 gUnk_0860E2F8[];
extern const u8 gUnk_0860E73C[];
extern const u8 gUnk_0860EB80[];
extern const u8 gUnk_0860EFC4[];
extern const u8 gUnk_0860F404[];
extern const u8 gUnk_0860F834[];
extern const u8 gUnk_0860FC24[];
extern const u8 gUnk_0860FFF8[];
extern const u8 gUnk_086103B8[];
extern const u8 gUnk_086107B0[];
extern const u8 gUnk_08610BB8[];
extern const u8 gUnk_08610FA8[];
extern const u8 gUnk_08611370[];
extern const u8 gUnk_086116F4[];
extern const u8 gUnk_08611A80[];
extern const u8 gUnk_08611DF0[];
extern const u8 gUnk_08612154[];
extern const u8 gUnk_086124D4[];
extern const u8 gUnk_0861289C[];
extern const u8 gUnk_08612CB8[];
extern const u8 gUnk_086130FC[];
extern const u8 gUnk_08613540[];
extern const u8 gUnk_08613984[];
extern const u8 gUnk_08613DB8[];
extern const u8 gUnk_086141E0[];
extern const u8 gUnk_0861460C[];
extern const u8 gUnk_08614A34[];
extern const u8 gUnk_08614E5C[];
extern const u8 gUnk_08615244[];
extern const u8 gUnk_08615594[];
extern const u16 gUnk_086157E4[];
extern const u16 gUnk_08615D68[];
extern const u16 gUnk_086162EC[];
extern const u16 gUnk_08616870[];

extern const struct OpAnimBgHeader gUnk_08CEF770[];
extern const struct OpAnimBgFrame gUnk_08CEF788[];

extern const u8 gUnk_085E9D4C[];
extern const u8 gUnk_085EA084[];
extern const u8 gUnk_085EA40C[];
extern const u8 gUnk_085EA784[];
extern const u8 gUnk_085EAB1C[];
extern const u8 gUnk_085EAE5C[];
extern const u8 gUnk_085EB194[];
extern const u8 gUnk_085EB534[];
extern const u8 gUnk_085EB880[];
extern const u8 gUnk_085EBB08[];
extern const u8 gUnk_085EBE18[];
extern const u8 gUnk_085EC128[];
extern const u8 gUnk_085EC3FC[];

extern const u8 gUnk_085EE04C[];
extern const u8 gUnk_085EE9F4[];
extern const u8 gUnk_085EF23C[];
extern const u8 gUnk_085EFC00[];
extern const u8 gUnk_085EFFB0[];
extern const u8 gUnk_085F08E8[];
extern const u8 gUnk_085F1144[];
extern const u8 gUnk_085F1BA4[];
extern const u8 gUnk_085F1C3C[];
extern const u8 gUnk_085F26AC[];
extern const u8 gUnk_085F2820[];
extern const u8 gUnk_085F3194[];
extern const u8 gUnk_085F33B4[];
extern const u8 gUnk_085F3C8C[];
extern const u8 gUnk_085F3E84[];
extern const u8 gUnk_085F4808[];
extern const u8 gUnk_085F4F6C[];
extern const u8 gUnk_085F58B8[];
extern const u8 gUnk_085F6324[];
extern const u8 gUnk_085F6B3C[];
extern const u8 gUnk_085F6FE8[];
extern const u8 gUnk_085F79A4[];
extern const u8 gUnk_085F7FCC[];
extern const u8 gUnk_085F88BC[];
extern const u8 gUnk_085F8C84[];
extern const u8 gUnk_085F9468[];
extern const u8 gUnk_085F9918[];
extern const u8 gUnk_085FA24C[];
extern const u8 gUnk_085FAA6C[];
extern const u8 gUnk_085FB034[];
extern const u8 gUnk_085FB0B4[];
extern const u8 gUnk_085FB160[];
extern const u8 gUnk_085FB214[];
extern const u8 gUnk_085FB2E8[];
extern const u8 gUnk_085FB3D8[];
extern const u8 gUnk_085FB4E4[];
extern const u8 gUnk_085FB620[];
extern const u8 gUnk_085FB790[];
extern const u8 gUnk_085FB924[];
extern const u8 gUnk_085FBB00[];
extern const u8 gUnk_085FBD1C[];
extern const u8 gUnk_085FBF70[];
extern const u8 gUnk_085FC200[];
extern const u8 gUnk_085FC4C0[];
extern const u8 gUnk_085FC7A0[];
extern const u8 gUnk_085FCAC0[];
extern const u8 gUnk_085FCDF8[];
extern const u8 gUnk_085FD02C[];
extern const u8 gUnk_085FD27C[];
extern const u8 gUnk_085FD508[];
extern const u8 gUnk_085FD7B8[];
extern const u8 gUnk_085FDA80[];
extern const u8 gUnk_085FDBF8[];
extern const u8 gUnk_085FDD84[];
extern const u8 gUnk_085FDF20[];
extern const u8 gUnk_085FE0DC[];
extern const u8 gUnk_085FE2B8[];
extern const u8 gUnk_085FE4B8[];
extern const u8 gUnk_085FE6DC[];
extern const u8 gUnk_085FE914[];
extern const u8 gUnk_085FEA24[];
extern const u8 gUnk_085FEB60[];
extern const u8 gUnk_085FECC0[];
extern const u8 gUnk_085FEE38[];
extern const u8 gUnk_085FEFC4[];

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
extern const struct OpAnimBgConf gUnk_08CEFA38;
extern u16 const gUnk_08673D38[];
extern u8 const gUnk_08673D58[];
extern u16 const Pal_OpAnimWater[];
extern u8 const Img_OpAnimWater[];
extern u8 const Tsa_OpAnimWater[];
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
extern u8 const gUnk_085EC9A4[];
extern u8 const gUnk_085ECBC0[];
extern u16 const Pal_OpAnimCloud[];
extern u8 const Img_OpAnimCloud[];
extern u8 const Tsa_OpAnimCloud[];
extern u16 const gUnk_085ED1C4[];
extern u8 const gUnk_085ED1E4[];
extern const struct ProcCmd ProcScr_08CEF264[];
extern const struct ProcCmd ProcScr_08CEF284[];
extern u16 const gUnk_085EE02C[];
extern const struct OpAnimImgEntry gUnk_08CEF594[];
extern const struct OpAnimImgEntry gUnk_08CEF630[];
extern const struct ProcCmd ProcScr_08CEF2D4[];
extern const struct ProcCmd ProcScr_08CEF2F4[];
extern const struct ProcCmd ProcScr_08CEF394[];
extern const struct ProcCmd ProcScr_08CEF3EC[];
extern u8 * gUnk_08CEF074;
extern u16 const gUnk_08CEF314[];
extern const struct OpAnimTextEntry gUnk_08CEF4BC[];
extern const struct ProcCmd ProcScr_08CEF40C[];
extern const struct ProcCmd ProcScr_08CEF424[];
extern const struct ProcCmd ProcScr_08CEF444[];
extern const struct ProcCmd ProcScr_08CEF464[];
extern const struct ProcCmd ProcScr_08CEF750[];
extern u16 const gUnk_085E9AD4[];
extern u8 const gUnk_085E9AF4[];

void Sound_SetMaxNumChannels(int reverb);

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
    PROC_REPEAT(OpeningSeqence_Loop_A),
    PROC_SLEEP(60),
    PROC_REPEAT(OpeningSeqence_Loop_B),
    PROC_BLOCK,
PROC_LABEL(2),
    PROC_CALL(sub_080BC960),
    PROC_BLOCK,
PROC_LABEL(0),
    PROC_CALL(sub_080BBBA4),
    PROC_BLOCK,
PROC_LABEL(1),
    PROC_CALL(sub_080BBBB8),
    PROC_REPEAT(OpeningSeqence_Loop_C),
    PROC_CALL(sub_080BC0A4),
    PROC_REPEAT(OpeningSeqence_Loop_D),
    PROC_YIELD,
    PROC_CALL(sub_080BC164),
    PROC_REPEAT(OpeningSeqence_Loop_E),
    PROC_SLEEP(60),
    PROC_REPEAT(OpeningSeqence_Loop_F),
PROC_LABEL(98),
    PROC_SLEEP(30),
    PROC_CALL(OpAnim_DrawCloud),
    PROC_YIELD,
    PROC_CALL(sub_080BC474),
PROC_CALL_ARG(NewFadeInWhite, 2),
    PROC_WHILE(FadeInExists),
    PROC_YIELD,
    PROC_REPEAT(OpeningSeqence_Loop_G),
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
    PutCompressedTsa(gBg3Tm, gUnk_085ED0DC, 0xA200);
    EnableBgSync(BG3_SYNC_BIT);

    proc->unk_2C = 0;
    proc->unk_40 = sub_080BD764(&gUnk_08CEFA38, 2, -1, 0, proc);

    ApplyPaletteExt(gUnk_08673D38, 0x260, 0x20);
    Decompress(gUnk_08673D58, (void *) 0x06013000);
}
void OpeningSeqence_Loop_B(struct OpAnimProc * proc)
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
    ApplyPaletteExt(Pal_OpAnimWater, 0x1C0, 0x20);
    Decompress(Img_OpAnimWater, (void *) 0x06008000);
    PutCompressedTsa(gBg0Tm, Tsa_OpAnimWater, 0xE000);

    gDispIo.bg0_ct.size = 0;
    gDispIo.bg0_ct.wrap = 1;

    EnableBgSync(BG0_SYNC_BIT);
    InitOpScanlineBuf();

    gUnkOpAnim_03001620 |= 1;
    proc->unk_2C = 0;
}
void OpeningSeqence_Loop_A(struct OpAnimProc * proc)
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
    PutCompressedTsa(gBg0Tm, gUnk_086756A0, 0xD000);
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
    PutCompressedTsa(gBg0Tm, gUnk_08676BB8, 0xD000);
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
    PutCompressedTsa(gBg0Tm + 0x40, gUnk_08616D94, 0xD000);

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
void OpeningSeqence_Loop_C(struct OpAnimProc * proc)
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
void OpeningSeqence_Loop_D(struct OpAnimProc * proc)
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
void sub_080BC104(struct OpAnimProc * proc)
{
    SetOnHBlankA(NULL);
    sub_080BC5CC();
    EndFadeInOut();

    CpuFastFill(0, gPal, 0x20);
    EnablePalSync();

    SetDispEnable(0, 0, 0, 0, 0);

    ResetTitleBgAffin(2);
    EndEachSpriteAnimProc();
}
void sub_080BC164(struct OpAnimProc * proc)
{
    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);

    gUnkOpAnim_03001620 &= ~0x1E1;

    CpuFastFill(0, (void *) 0x06017000, 0x1000);

    SetDispEnable(0, 0, 0, 0, 1);

    ApplyPaletteExt(gUnk_085E9D2C, 0x220, 0x20);
    sub_080BCB1C(gUnk_085EC9A4, 0);
    sub_080BCB1C(gUnk_085ECBC0, 0x800);

    proc->unk_2C = 0;

    CpuFastFill(0, (void *) 0x06014000, 0x1000);

    proc->unk_3C = 1;
}
void OpeningSeqence_Loop_E(struct OpAnimProc * proc)
{
    int len = 0x70;
    int div = 8;
    int time = proc->unk_2C;
    int val = (time % len) / div;

    if (time < len)
        sub_080BCB34(2, 2, 8, val << 6, time);
    else
        sub_080BCB34(2, 2, 8, (val << 6) + 0x800, time - len);

    if (proc->unk_2C == len * 2)
    {
        proc->unk_2C = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->unk_2C++;
    }
}

void OpeningSeqence_Loop_F(struct OpAnimProc * proc)
{
    if (proc->unk_2C == 0)
        StartBgmExt(0x5F, 0, NULL);

    if (proc->unk_2C < 0x20)
    {
        sub_080BCBFC(0x20, 2, 2, 0, proc->unk_2C);
        sub_080BCBFC(0x20, 2, 2, 0x800, proc->unk_2C);
        proc->unk_2C++;
    }
    else
    {
        Proc_Break(proc);
    }
}
void sub_080BC2D4(void)
{
}
s8 sub_080BC2D8(struct ProcBmBgfx * proc)
{
    if ((s8) proc->func_call_type != 0 && proc->counter_functioncall == 1)
        sub_080BD0D4(gUnk_08659C9C, gUnk_08659C9C + 0x10, 10, 0x10, proc);

    return 0;
}
void OpAnim_DrawCloud(struct OpAnimProc * proc)
{
    SetDispEnable(0, 0, 0, 0, 0);

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);
    TmFill(gBg3Tm, 0);

    EndAllParallelWorkers();

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 3;
    gDispIo.bg3_ct.priority = 2;

    StartBmBgfx(BmBgfxConf_OpAnim, 0, 0, 0, 0, 0x4000, 10, sub_080BC2D8, proc);

    gUnkOpAnim_03001620 |= 0x10;

    ApplyPaletteExt(Pal_OpAnimCloud, 0x1C0, 0x20);
    Decompress(Img_OpAnimCloud, (void *) 0x06000000);
    PutCompressedTsa(gBg1Tm, Tsa_OpAnimCloud, 0xE000);

    ApplyPaletteExt(gUnk_085ED1C4, 0x300, 0x20);
    Decompress(gUnk_085ED1E4, (void *) 0x06010000);

    SetBlendAlpha(0x10, 0x10);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    proc->unk_2C = 0;

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}
void sub_080BC474(struct OpAnimProc * proc)
{
    SetDispEnable(1, 1, 1, 1, 1);
}
void OpeningSeqence_Loop_G(struct OpAnimProc * proc)
{
    int angles[8] = { 0x00, 0x80, 0x40, 0xA0, 0x20, 0xE0, 0x60, 0xC0 };
    int step = 0x10;
    int val = proc->unk_2C / 10;

    if (val < 0x10)
    {
        SetBlendAlpha(0x10, 0x10 - val);
    }

    if ((proc->unk_2C % step) == 0)
    {
        int i = proc->unk_2C / step;

        if (i < 8)
            sub_080BCFCC(i, angles[i], proc);
    }

    if (proc->unk_2C == 0xA0)
    {
        TmFill(gBg1Tm, 0);
        EnableBgSync(BG1_SYNC_BIT);

        SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);

        BmBgfxSetLoopEN(0);
        Proc_Break(proc);

        SetBackdropColor(0);
    }

    proc->unk_2C++;
}

void sub_080BC570(struct Proc * proc)
{
    if (((struct OpAnimProc *) proc->proc_parent)->unk_44 != 0)
    {
        if (gpKeySt->pressed & (A_BUTTON | B_BUTTON | START_BUTTON))
        {
            SetNextGameAction(2);
            sub_080BC994();
            sub_080BD55C();
            Proc_Break(proc);
            Proc_Goto(proc->proc_parent, 99);
        }
    }
}
void sub_080BC5B8(ProcPtr proc)
{
    Proc_Start(ProcScr_08CEF264, proc);
}
void sub_080BC5CC(void)
{
    Proc_End(Proc_Find(ProcScr_08CEF264));
}
int sub_080BC5E0(struct OpAnimImgEntry const * list)
{
    int i;

    for (i = 0; list->img0 != NULL; list++)
        i++;

    return i;
}
void sub_080BC5F4(struct OpAnimSubProc * proc)
{
    ApplyPaletteExt(gUnk_085EE02C, 0x1E0, 0x20);
    CpuFastFill(0, (void *) 0x0600C000, 0x4000);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 3;
    gDispIo.bg2_ct.priority = 3;
    gDispIo.bg3_ct.priority = 2;

    SetBlendAlpha(0x10, 0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    proc->unk_3C = gUnk_08CEF594;
    proc->unk_2C = 0;
    proc->unk_30 = 1;
    proc->unk_34 = sub_080BC5E0(gUnk_08CEF594);
}
bool sub_080BC6A8(struct OpAnimSubProc * proc)
{
    int time, val, a;

    switch (proc->unk_2C % 3)
    {
    case 0:
        Decompress(proc->unk_3C->img0, (void *) 0x0600C000 + (proc->unk_30 << 13));
        break;

    case 1:
        Decompress(proc->unk_3C->img1, (void *) 0x0600D000 + (proc->unk_30 << 13));
        break;

    case 2:
        PutCompressedTsa(gBg3Tm, proc->unk_3C->tsa, 0xF200 + (proc->unk_30 << 8));
        proc->unk_30 = 1 - proc->unk_30;
        EnableBgSync(BG3_SYNC_BIT);
        break;
    }

    time = ++proc->unk_2C;
    val = (time * 0x10) / (proc->unk_34 * 3);

    gDispIo.blend_ct.effect = BLEND_EFFECT_ALPHA;

    a = (0x10 - val) * 2;

    if (a > 0x10)
        a = 0x10;

    gDispIo.blend_coef_a = a;
    gDispIo.blend_coef_b = val;
    gDispIo.blend_y = 0;

    if ((time % 3) == 0)
    {
        int i = time / 3;
        proc->unk_3C++;

        if (i == proc->unk_34)
            return TRUE;
    }

    return FALSE;
}
void sub_080BC790(struct OpAnimSubProc * proc)
{
    if (OpScanlineSt.unk_08 < 0x600)
        OpScanlineSt.unk_08 += 0x100;

    if (OpScanlineSt.unk_0C < 0x600)
        OpScanlineSt.unk_0C += 0x20;

    if (OpScanlineSt.unk_10 < 0x900)
        OpScanlineSt.unk_10 += 0x20;

    if (sub_080BC6A8(proc))
        Proc_Break(proc);
}
void sub_080BC7E4(struct OpAnimSubProc * proc)
{
    proc->unk_2C = 0;
    proc->unk_3C = gUnk_08CEF630;
    proc->unk_34 = sub_080BC5E0(gUnk_08CEF630);

    gDispIo.bg0_ct.priority = 2;
    gDispIo.bg1_ct.priority = 3;
    gDispIo.bg2_ct.priority = 3;
    gDispIo.bg3_ct.priority = 1;

    TmFill(gBg0Tm, 0);
    EnableBgSync(BG0_SYNC_BIT);

    gUnkOpAnim_03001620 &= ~1;

    SetBlendAlpha(0x10, 0);
    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    Proc_Goto(proc->proc_parent, 0);

    InitOpScanlineBuf();

    OpScanlineSt.unk_08 = 0x300;
    OpScanlineSt.unk_04 = 0x300;
    OpScanlineSt.unk_0C = 0x190;
    OpScanlineSt.unk_10 = 0x320;

    gUnkOpAnim_03001620 |= 4;
}
void sub_080BC8C0(struct OpAnimSubProc * proc)
{
    if (sub_080BC6A8(proc))
    {
        proc->unk_2C = 0;
        Proc_Break(proc);

        TmFill(gBg3Tm, 0);
        EnableBgSync(BG3_SYNC_BIT);

        Proc_Goto(proc->proc_parent, 1);
    }
}
void sub_080BC8F8(struct OpAnimSubProc * proc)
{
    int time;

    if (proc->unk_2C == 400)
    {
        Proc_Break(proc);
        return;
    }

    time = ++proc->unk_2C;

    if (time > 0x8C)
    {
        int max;

        time -= 0x8C;
        max = 0x100;

        if (time <= max)
        {
            OpScanlineSt.unk_10 = (max - time) * 800 / max;
            OpScanlineSt.unk_0C = (max - time) * 400 / max;
        }
    }
}
void sub_080BC94C(void)
{
    gUnkOpAnim_03001620 &= ~4;
}
void sub_080BC960(struct OpAnimProc * proc)
{
    Sound_SetMaxNumChannels(8);
    PlaySoundEffect(0x62);
    Proc_Start(ProcScr_08CEF284, proc);
}
void sub_080BC994(void)
{
    Proc_End(Proc_Find(ProcScr_08CEF284));
}
void sub_080BC9A8(struct OpAnimSubProc * proc)
{
    proc->unk_2C = 0;
    sub_080BBD28();
}
void sub_080BC9B8(struct OpAnimSubProc * proc)
{
    int val;

    if (++proc->unk_2C <= 0x40)
    {
        SetBlendAlpha(proc->unk_2C / 8, 0x10);
    }

    SetBgOffset(0, proc->unk_2C >> 1, 0);

    if (proc->unk_2C > proc->unk_30)
    {
        val = 8 - (proc->unk_2C - proc->unk_30) / 8;
        SetBlendAlpha(val, 0x10);

        if (val == 0)
        {
            Proc_Break(proc);
            TmFill(gBg0Tm, 0);
            EnableBgSync(BG0_SYNC_BIT);
        }
    }
}
void sub_080BCA6C(int a, ProcPtr parent)
{
    struct OpAnimSubProc * proc = Proc_Start(ProcScr_08CEF2D4, parent);
    proc->unk_30 = a;
}
void sub_080BCA84(struct OpAnimSubProc * proc)
{
    proc->unk_2C = 0;
    sub_080BBC80();
}
void sub_080BCA94(struct OpAnimSubProc * proc)
{
    if (++proc->unk_2C <= 0x80)
    {
        SetBlendAlpha(proc->unk_2C / 8, 0x10);
    }
    else
    {
        Proc_Break(proc);
    }
}
void sub_080BCAE8(ProcPtr proc)
{
    Proc_Start(ProcScr_08CEF2F4, proc);
}
void sub_080BCAFC(void)
{
    CpuFastFill(0, (void *) 0x06014000, 0x800);
}
void sub_080BCB1C(u8 const * src, int offset)
{
    Decompress(src, gUnk_08CEF074 + offset);
}
#if NONMATCHING

// Copies (sub_080BCB34) or clears (sub_080BCBFC) count pixels per tile of a
// w x h block of 4bpp tiles at offset into OBJ VRAM + 0x4000, taking the
// pixel indices from gUnk_08CEF314 from index count * start on.

void sub_080BCB34(int w, int h, int count, int offset, int start)
{
    int y, x, i;

    start *= count;

    for (y = 0; y < h; y++)
    {
        for (x = 0; x < w; x++)
        {
            for (i = 0; i < count; i++)
            {
                int pixel = gUnk_08CEF314[start++ & 0x3F];
                int tile_offset = offset + x * 0x20 + y * 0x400;
                u32 const * src = (u32 const *) (gUnk_08CEF074 + tile_offset) + (pixel >> 3);
                u32 * dst = (u32 *) ((u8 *) OBJ_VRAM0 + 0x4000 + tile_offset) + (pixel >> 3);

                *dst |= *src & (0xF << ((pixel & 7) * 4));
            }
        }
    }
}

void sub_080BCBFC(int w, int h, int count, int offset, int start)
{
    int y, x, i;

    start *= count;

    for (y = 0; y < h; y++)
    {
        for (x = 0; x < w; x++)
        {
            for (i = 0; i < count; i++)
            {
                int pixel = gUnk_08CEF314[start++ & 0x3F];
                int tile_offset = offset + x * 0x20 + y * 0x400;
                u32 const * src = (u32 const *) (gUnk_08CEF074 + tile_offset) + (pixel >> 3);
                u32 * dst = (u32 *) ((u8 *) OBJ_VRAM0 + 0x4000 + tile_offset) + (pixel >> 3);

                *dst &= *src & ~(0xF << ((pixel & 7) * 4));
            }
        }
    }
}

#else

// FAKEMATCH (found by an Opus 5.5 agent): *&tmp stops loop.c from hoisting
// the dst partial sum; reusing start as the index, reading the table three
// times and declaring y, x, i in that order set the register/stack layout.
void sub_080BCB34(int w, int h, int count, int offset, int start)
{
    int y, x, i;
    int tmp;

    start *= count;

    for (y = 0; y < h; y++)
    {
        for (x = 0; x < w; x++)
        {
            for (i = 0; i < count; i++)
            {
                u32 * src;
                u32 * dst;

                start &= 0x3F;

                src = (u32 *) (gUnk_08CEF074 + offset + x * 0x20 + y * 0x400);
                tmp = x * 0x20;
                tmp = offset + tmp;
                dst = (u32 *) (*&tmp + y * 0x400 + 0x06014000);

                src += gUnk_08CEF314[start & 0x3F] >> 3;
                dst += gUnk_08CEF314[start & 0x3F] >> 3;

                *dst |= *src & (0xF << ((gUnk_08CEF314[start & 0x3F] & 7) * 4));

                start++;
            }
        }
    }
}

// FAKEMATCH (found by an Opus 5.5 agent): *&tmp stops loop.c from hoisting
// the dst partial sum; reusing start as the index, reading the table three
// times and declaring y, x, i in that order set the register/stack layout.
void sub_080BCBFC(int w, int h, int count, int offset, int start)
{
    int y, x, i;
    int tmp;

    start *= count;

    for (y = 0; y < h; y++)
    {
        for (x = 0; x < w; x++)
        {
            for (i = 0; i < count; i++)
            {
                u32 * src;
                u32 * dst;

                start &= 0x3F;

                src = (u32 *) (gUnk_08CEF074 + offset + x * 0x20 + y * 0x400);
                tmp = x * 0x20;
                tmp = offset + tmp;
                dst = (u32 *) (*&tmp + y * 0x400 + 0x06014000);

                src += gUnk_08CEF314[start & 0x3F] >> 3;
                dst += gUnk_08CEF314[start & 0x3F] >> 3;

                *dst &= *src & ~(0xF << ((gUnk_08CEF314[start & 0x3F] & 7) * 4));

                start++;
            }
        }
    }
}

#endif

void sub_080BCCC4(struct OpAnimTextProc * proc)
{
    ApplyPaletteExt(gUnk_085E9D2C, 0x220, 0x20);

    proc->entry = gUnk_08CEF4BC;
    proc->unk_38 = 0;

    sub_080BCAFC();

    proc->unk_3C = 0;
}
void sub_080BCCF0(struct OpAnimTextProc * proc)
{
    int div = 8;
    int len, max, rem, x;

    if (proc->unk_3C == 0)
    {
        proc->unk_30 = sub_080BD570(proc->entry);

        if (proc->unk_30 == 0)
        {
            if (proc->entry->duration == 0)
                Proc_Goto(proc, 99);
            else
                Proc_Break(proc);

            return;
        }
    }

    len = 0x400 / div - 0x10;

    max = proc->unk_30 * len;

    if (proc->unk_3C < max)
    {
        rem = proc->unk_3C % len;
        x = rem / (0x40 / div);

        if (rem == 0)
        {
            int i = proc->unk_3C / len;
            sub_080BCB1C(proc->entry->img[i], proc->unk_38 + (i << 11));
        }

        sub_080BCB34(2, 2, div, proc->unk_38 + (x << 6), proc->unk_3C);
        proc->unk_3C++;
    }
    else
    {
        Proc_Break(proc);
    }
}

void sub_080BCDB4(struct OpAnimTextProc * proc)
{
    if (++proc->unk_3C >= proc->entry->duration - 0x20)
    {
        proc->unk_3C = 0;
        Proc_Break(proc);
    }
}
void sub_080BCDD8(struct OpAnimTextProc * proc)
{
    if (proc->unk_3C < 0x20)
    {
        sub_080BCBFC(0x1E, proc->unk_30 * 2, 2, proc->unk_38, proc->unk_3C);
        proc->unk_3C++;
    }
    else
    {
        proc->unk_3C = 0;
        proc->entry++;
        Proc_Break(proc);
    }
}
void sub_080BCE14(struct OpAnimTextProc * proc)
{
    sub_080BCAFC();
}
void sub_080BCE20(ProcPtr proc)
{
    Proc_Start(ProcScr_08CEF394, proc);
}
void sub_080BCE34(struct OpAnimCloudProc * proc)
{
    int i;

    proc->unk_2E = 0;
    proc->unk_30 = (proc->unk_2C / 4) * 0x2000 + (proc->unk_2C % 4) * 0x100;

    for (i = 0; i < 4; i++)
    {
        proc->unk_32[i] = 0xFF00;
        proc->unk_3A[i] = 0xFF00;
    }
}
void sub_080BCE60(struct OpAnimCloudProc * proc)
{
    int t, dist, scale, angle, rot, rx, ry, x, y;
    int a = 0x40;
    int b = 0x80;

    t = a - proc->unk_2E;
    dist = b - (t * (t << 7)) / (a * a);
    scale = 0x200 - (dist << 9) / b;

    angle = proc->unk_2A + dist;
    rot = 0x100 - (angle & 0xFF);

    rx = (scale * 180) / 0x200;
    ry = (scale * 100) / 0x200;

    if (scale < 8)
    {
        Proc_Break(proc);
        return;
    }

    x = (((SIN_Q12(angle - 0x40) * rx) >> 12) + 0x38) & 0x1FF;
    y = (0x10 - ((COS_Q12(angle - 0x40) * ry) >> 12)) & 0xFF;

    rot = rot & 0xFF;

    SetObjAffine(
        proc->unk_2C,
        Div(+COS_Q12(rot) * 16, scale),
        Div(-SIN_Q12(rot) * 16, scale),
        Div(+SIN_Q12(rot) * 16, scale),
        Div(+COS_Q12(rot) * 16, scale));

    x += proc->unk_2C << 9;
    y += 0x300;

    PutSpriteExt(4, x, y, Sprite_64x64, (proc->unk_30 >> 5) + 0x8000);

    proc->unk_2E++;
}
void sub_080BCFCC(int a, int b, ProcPtr parent)
{
    struct OpAnimCloudProc * proc = Proc_Start(ProcScr_08CEF3EC, parent);
    proc->unk_2C = a;
    proc->unk_2A = b;
}
void sub_080BCFE8(u16 const * src1, u16 const * src2, int pal, int k)
{
    int i;
    u16 * dst = gPal + pal * 0x10;
    int k2 = 0x100 - k;

    for (i = 0; i < 0x10; i++)
    {
        *dst++ =
            ((((*src1 & 0x001F) * k + (*src2 & 0x001F) * k2) >> 8) & 0x001F) +
            ((((*src1 & 0x03E0) * k + (*src2 & 0x03E0) * k2) >> 8) & 0x03E0) +
            ((((*src1 & 0x7C00) * k + (*src2 & 0x7C00) * k2) >> 8) & 0x7C00);

        src1++;
        src2++;
    }

    EnablePalSync();
}
void Proc_08DB9398_Loop(struct OpAnimSubProc * proc)
{
    proc->unk_30 += proc->unk_2C;

    if (proc->unk_30 > 0x100)
        proc->unk_30 = 0x100;

    if (proc->unk_30 < 0)
        proc->unk_30 = 0;

    sub_080BCFE8(gUnkOpAnim_020072C0 + 0x10, gUnkOpAnim_020072C0, proc->unk_34, proc->unk_30);

    if (proc->unk_30 == 0x100 || proc->unk_30 == 0)
        Proc_Break(proc);
}
void sub_080BD0D4(void * a, const u16 * pal, int pal_bank, int size, ProcPtr parent)
{
    struct OpAnimSubProc * proc = Proc_Start(ProcScr_08CEF40C, parent);

    if (a == (void *) -1)
    {
        CpuFastCopy(gPal + pal_bank * 0x10, gUnkOpAnim_020072C0, 0x20);
    }
    else if (a == NULL)
    {
        CpuFastFill(0, gUnkOpAnim_020072C0, 0x20);
    }
    else
    {
        CpuFastCopy(a, gUnkOpAnim_020072C0, 0x20);
    }

    CpuFastCopy(pal, gUnkOpAnim_020072C0 + 0x10, 0x20);

    proc->unk_30 = 0;
    proc->unk_34 = pal_bank;
    proc->unk_2C = size;

    EnablePalSync();
}
void sub_080BD168(struct OpAnimSubProc * proc)
{
    proc->unk_30 += proc->unk_2C * 4;

    if (proc->unk_30 > 0x100)
        proc->unk_30 = 0x100;

    sub_080BCFE8(gUnkOpAnim_020072C0 + 0x10, gUnkOpAnim_020072C0, proc->unk_34, proc->unk_30);

    if (proc->unk_30 == 0x100)
        Proc_Break(proc);
}
void sub_080BD1A4(struct OpAnimSubProc * proc)
{
    proc->unk_30 -= proc->unk_2C;

    if (proc->unk_30 < 0)
        proc->unk_30 = 0;

    sub_080BCFE8(gUnkOpAnim_020072C0 + 0x10, gUnkOpAnim_020072C0, proc->unk_34, proc->unk_30);

    if (proc->unk_30 == 0)
        Proc_Break(proc);
}
void sub_080BD1DC(intptr_t a, u16 const * pal, int pal_bank, int amount, int mask, int speed, ProcPtr parent)
{
    int i;
    u16 bits = mask;
    struct OpAnimSubProc * proc = Proc_Start(ProcScr_08CEF424, parent);

    proc->unk_30 = 0;
    proc->unk_34 = pal_bank;
    proc->unk_2C = speed;

    EnablePalSync();

    if (a == -1)
        CpuFastCopy(gPal + pal_bank * 0x10, gUnkOpAnim_020072C0, 0x20);
    else
        CpuFastCopy((void *) a, gUnkOpAnim_020072C0, 0x20);

    if (pal == (u16 const *) -1)
    {
        for (i = 0; i < 0x10; i++)
        {
            if ((bits >> i) & 1)
            {
                int r = (gUnkOpAnim_020072C0[i] & 0x1F) + (amount & 0x1F);
                int g = (gUnkOpAnim_020072C0[i] & 0x3E0) + ((amount & 0x1F) << 5);
                int b = (gUnkOpAnim_020072C0[i] & 0x7C00) + ((amount & 0x1F) << 10);

                gUnkOpAnim_020072C0[0x10 + i] =
                    ((r > 0x1F ? 0x1F : r) & 0x1F) +
                    ((g > 0x3E0 ? 0x3E0 : g) & 0x3E0) +
                    ((b > 0x7C00 ? 0x7C00 : b) & 0x7C00);
            }
            else
            {
                gUnkOpAnim_020072C0[0x10 + i] = gUnkOpAnim_020072C0[i];
            }
        }
    }
    else
    {
        CpuFastCopy(pal, gUnkOpAnim_020072C0 + 0x10, 0x20);
        CpuFastCopy(gUnkOpAnim_020072C0 + 0x10, gPal + pal_bank * 0x10, 0x20);
        EnablePalSync();
    }
}

void sub_080BD310(struct OpAnimBirdProc * proc)
{
    proc->anim[0] = StartSpriteAnimProc(gUnk_086740B4, proc->x[0] >> 16, proc->y[0] >> 16, 0x3980, 5, 10);
    proc->anim[1] = StartSpriteAnimProc(gUnk_086740B4, proc->x[1] >> 16, proc->y[1] >> 16, 0x3980, 6, 10);
}
void sub_080BD364(struct OpAnimBirdProc * proc)
{
    int i;

    for (i = 0; i < 2; i++)
    {
        ProcPtr anim = proc->anim[i];

        if (anim != NULL)
        {
            int x, y;

            proc->vx[i] += gUnkOpAnim_0200750C.unk_08;
            proc->vy[i] += gUnkOpAnim_0200750C.unk_0C;
            proc->x[i] += proc->vx[i];
            proc->y[i] += proc->vy[i];

            x = (s16) (proc->x[i] >> 16);
            y = proc->y[i] >> 16;

            if (x < 0 || x > 0xF0 || y < 0)
            {
                EndSpriteAnimProc(anim);
                proc->anim[i] = NULL;
            }
            else
            {
                SetSpriteAnimProcParameters(anim, x & 0x1FF, y & 0xFF, 0x3980);
            }
        }
    }

    if (proc->anim[0] == NULL && proc->anim[1] == NULL)
        Proc_Break(proc);
}
void sub_080BD424(int x, int y, int angle, int speed, ProcPtr parent)
{
    struct OpAnimBirdProc * proc = Proc_Start(ProcScr_08CEF444, parent);

    proc->x[0] = x << 16;
    proc->y[0] = y << 16;
    proc->x[1] = ((x + 0x80) & 0xFF) << 16;
    proc->y[1] = (y << 16) + 0x20;

    proc->vx[0] = COS_Q12(angle) * speed;
    proc->vy[0] = SIN_Q12(angle) * speed;
    proc->vx[1] = COS_Q12(angle + 4) * speed;
    proc->vy[1] = SIN_Q12(angle + 4) * speed;

    proc->anim[0] = NULL;
    proc->anim[1] = NULL;
}
void sub_080BD4C4(struct OpAnimSubProc * proc)
{
    proc->unk_2C = 0x74;
    proc->unk_30 = 0;
    proc->unk_38 = 0;

    ApplyPaletteExt(gUnk_085E9AD4, 0x280, 0x20);
    Decompress(gUnk_085E9AF4, (void *) 0x06010000);
}
void sub_080BD4F4(struct OpAnimSubProc * proc)
{
    proc->unk_38++;
    proc->unk_30 += proc->unk_38;

    if (proc->unk_30 >= 0x50)
    {
        Proc_Break(proc);
        Proc_Goto(proc->proc_parent, 2);
    }
    else
    {
        PutSpriteExt(4, proc->unk_2C, proc->unk_30, Sprite_8x8, (proc->unk_34 & 1) + 0x4400);
    }

    proc->unk_34++;
}
void sub_080BD548(ProcPtr proc)
{
    Proc_Start(ProcScr_08CEF464, proc);
}
void sub_080BD55C(void)
{
    Proc_End(Proc_Find(ProcScr_08CEF464));
}
int sub_080BD570(struct OpAnimTextEntry const * entry)
{
    int i;

    i = 0;

    do
    {
        if (entry->img[i] == NULL)
            break;

        i++;
    } while (i < 2);

    return i;
}
// FAKEMATCH (found by an Opus 5.5 agent): the do/while(0) around the
// GetBgTilemap call changes register priorities; tm is shared by both branches.
void sub_080BD588(int bg, struct OpAnimBgConf const * conf, int row)
{
    int i;
    u16 * tm;
    void const * img = conf->frames[row].img;
    u16 const * tsa = conf->frames[row].tsa;

    if (row < 0)
        return;

    if (img != NULL)
        Decompress(img, (void *) GetBgChrOffset(bg) + ((row % conf->header->rows) * 0x400 + 0x6000000) + conf->header->chr_offset);

    if (tsa != NULL)
    {
        int width = *(u8 const *) tsa;
        int height = *tsa >> 8;

        tsa++;

#if NONMATCHING
        tm = GetBgTilemap(bg) + (row & 0x1F) * 0x20;
#else
        do {
            tm = GetBgTilemap(bg) + (row & 0x1F) * 0x20;
        } while (0);
#endif

        tsa += (height - row % conf->header->rows) * (width + 1);

        for (i = 0; i <= width; i++)
        {
            *tm++ = *tsa + (conf->header->pal_bank << 12) + ((conf->header->chr_offset & 0x1FFFF) >> 5);
            tsa++;
        }
    }
    else
    {
        int base = (row % conf->header->rows) * 0x20;
        tm = GetBgTilemap(bg) + (row & 0x1F) * 0x20;

        for (i = 0; i < 0x20; i++)
            *tm++ = i + base + (conf->header->pal_bank << 12) + ((conf->header->chr_offset & 0x1FFFF) >> 5);
    }
}

void sub_080BD688(struct OpAnimBgProc * proc, int speed)
{
    proc->speed = speed;
}
void sub_080BD68C(struct OpAnimBgProc * proc)
{
    proc->speed = 0;
    proc->count = 0;
    proc->bg = 0;
    proc->conf = NULL;
}
void sub_080BD698(struct OpAnimBgProc * proc)
{
    int prev = proc->pos >> 10;
    int bgbits[4] = { BG0_SYNC_BIT, BG1_SYNC_BIT, BG2_SYNC_BIT, BG3_SYNC_BIT };
    int cur;

    if (proc->conf == NULL)
        return;

    proc->pos += proc->speed;

    if (proc->pos < 0)
    {
        proc->pos = 0;
        Proc_Break(proc);
    }

    if ((proc->pos >> 10) > (proc->count - 0x14) * 8)
        Proc_Break(proc);

    cur = proc->pos >> 10;

    if (prev == cur)
        return;

    if (prev > cur && prev / 8 != cur / 8)
        sub_080BD588(proc->bg, proc->conf, prev / 8 - 1);

    if (prev < cur && (prev + 7) / 8 != (cur + 7) / 8)
        sub_080BD588(proc->bg, proc->conf, prev / 8 + 0x14);

    EnableBgSync(bgbits[proc->bg]);
    SetBgOffset(proc->bg, 0, cur);
}

ProcPtr sub_080BD764(struct OpAnimBgConf const * conf, int bg, int pos, int speed, ProcPtr parent)
{
    int i;
    int bgbits[4] = { BG0_SYNC_BIT, BG1_SYNC_BIT, BG2_SYNC_BIT, BG3_SYNC_BIT };
    struct OpAnimBgProc * proc = Proc_Start(ProcScr_08CEF750, parent);

    proc->count = 0;

    while (conf->frames[proc->count].img != (void *) -1)
        proc->count++;

    if (pos == -1)
        pos = proc->count - 0x14;

    proc->pos = pos << 13;
    proc->conf = conf;
    proc->bg = bg;
    proc->speed = speed;

    SetBgOffset(bg, 0, proc->pos >> 10);

    if (conf->header->img != NULL)
        Decompress(conf->header->img, (void *) GetBgChrOffset(bg) + (VRAM + conf->header->chr_offset));

    if (conf->header->pal != NULL && conf->header->pal_count != 0)
        ApplyPaletteExt(conf->header->pal, conf->header->pal_bank * 0x20, conf->header->pal_count * 0x20);

    for (i = -1; i < 0x14; i++)
        sub_080BD588(bg, conf, pos + i);

    EnableBgSync(bgbits[bg]);

    return proc;
}

SECTION(".rodata.08CEF264")
const struct ProcCmd ProcScr_08CEF264[] = {
    PROC_SLEEP(0),
    PROC_REPEAT(sub_080BC570),
    PROC_BLOCK,
    PROC_END,
};

SECTION(".rodata.08CEF284")
const struct ProcCmd ProcScr_08CEF284[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_080BC5F4),
    PROC_REPEAT(sub_080BC790),
    PROC_SLEEP(0),
    PROC_CALL(sub_080BC7E4),
    PROC_REPEAT(sub_080BC8C0),
    PROC_REPEAT(sub_080BC8F8),
    PROC_SLEEP(0),
    PROC_CALL(sub_080BC94C),
    PROC_END,
};

SECTION(".rodata.08CEF2D4")
const struct ProcCmd ProcScr_08CEF2D4[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_080BC9A8),
    PROC_REPEAT(sub_080BC9B8),
    PROC_END,
};

SECTION(".rodata.08CEF2F4")
const struct ProcCmd ProcScr_08CEF2F4[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_080BCA84),
    PROC_REPEAT(sub_080BCA94),
    PROC_END,
};

SECTION(".rodata.08CEF394")
const struct ProcCmd ProcScr_08CEF394[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_080BCCC4),
    PROC_SLEEP(1),
    PROC_LABEL(0),
    PROC_REPEAT(sub_080BCCF0),
    PROC_REPEAT(sub_080BCDB4),
    PROC_REPEAT(sub_080BCDD8),
    PROC_GOTO(0),
    PROC_LABEL(99),
    PROC_CALL(sub_080BCE14),
    PROC_END,
};

SECTION(".rodata.08CEF3EC")
const struct ProcCmd ProcScr_08CEF3EC[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_080BCE34),
    PROC_REPEAT(sub_080BCE60),
    PROC_END,
};

SECTION(".rodata.08CEF40C")
const struct ProcCmd ProcScr_08CEF40C[] = {
    PROC_SLEEP(0),
    PROC_REPEAT(Proc_08DB9398_Loop),
    PROC_END,
};

SECTION(".rodata.08CEF424")
const struct ProcCmd ProcScr_08CEF424[] = {
    PROC_SLEEP(0),
    PROC_REPEAT(sub_080BD168),
    PROC_REPEAT(sub_080BD1A4),
    PROC_END,
};

SECTION(".rodata.08CEF444")
const struct ProcCmd ProcScr_08CEF444[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_080BD310),
    PROC_REPEAT(sub_080BD364),
    PROC_END,
};

SECTION(".rodata.08CEF750")
const struct ProcCmd ProcScr_08CEF750[] = {
    PROC_CALL(sub_080BD68C),
    PROC_SLEEP(0),
    PROC_REPEAT(sub_080BD698),
    PROC_END,
};

SECTION(".rodata.08CEF464")
const struct ProcCmd ProcScr_08CEF464[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_080BD4C4),
    PROC_REPEAT(sub_080BD4F4),
    PROC_END,
};

SECTION(".rodata.08CEF594")
const struct OpAnimImgEntry gUnk_08CEF594[] = {
    { .img0 = gUnk_085EE04C, .img1 = gUnk_085EE9F4, .tsa = gUnk_085FB0B4 },
    { .img0 = gUnk_085EE04C, .img1 = gUnk_085EE9F4, .tsa = gUnk_085FB160 },
    { .img0 = gUnk_085EE04C, .img1 = gUnk_085EE9F4, .tsa = gUnk_085FB214 },
    { .img0 = gUnk_085EE04C, .img1 = gUnk_085EE9F4, .tsa = gUnk_085FB2E8 },
    { .img0 = gUnk_085EE04C, .img1 = gUnk_085EE9F4, .tsa = gUnk_085FB3D8 },
    { .img0 = gUnk_085EE04C, .img1 = gUnk_085EE9F4, .tsa = gUnk_085FB4E4 },
    { .img0 = gUnk_085EE04C, .img1 = gUnk_085EE9F4, .tsa = gUnk_085FB620 },
    { .img0 = gUnk_085EE04C, .img1 = gUnk_085EE9F4, .tsa = gUnk_085FB790 },
    { .img0 = gUnk_085EF23C, .img1 = gUnk_085EFC00, .tsa = gUnk_085FB924 },
    { .img0 = gUnk_085EF23C, .img1 = gUnk_085EFC00, .tsa = gUnk_085FBB00 },
    { .img0 = gUnk_085EFFB0, .img1 = gUnk_085F08E8, .tsa = gUnk_085FBD1C },
    { .img0 = gUnk_085EFFB0, .img1 = gUnk_085F08E8, .tsa = gUnk_085FBF70 },
    { 0 },
};

SECTION(".rodata.08CEF630")
const struct OpAnimImgEntry gUnk_08CEF630[] = {
    { .img0 = gUnk_085F1144, .img1 = gUnk_085F1BA4, .tsa = gUnk_085FC200 },
    { .img0 = gUnk_085F1C3C, .img1 = gUnk_085F26AC, .tsa = gUnk_085FC4C0 },
    { .img0 = gUnk_085F2820, .img1 = gUnk_085F3194, .tsa = gUnk_085FC7A0 },
    { .img0 = gUnk_085F33B4, .img1 = gUnk_085F3C8C, .tsa = gUnk_085FCAC0 },
    { .img0 = gUnk_085F3E84, .img1 = gUnk_085F4808, .tsa = gUnk_085FCDF8 },
    { .img0 = gUnk_085F3E84, .img1 = gUnk_085F4808, .tsa = gUnk_085FD02C },
    { .img0 = gUnk_085F4F6C, .img1 = gUnk_085F58B8, .tsa = gUnk_085FD27C },
    { .img0 = gUnk_085F4F6C, .img1 = gUnk_085F58B8, .tsa = gUnk_085FD508 },
    { .img0 = gUnk_085F6324, .img1 = gUnk_085F6B3C, .tsa = gUnk_085FD7B8 },
    { .img0 = gUnk_085F6324, .img1 = gUnk_085F6B3C, .tsa = gUnk_085FDA80 },
    { .img0 = gUnk_085F6FE8, .img1 = gUnk_085F79A4, .tsa = gUnk_085FDBF8 },
    { .img0 = gUnk_085F6FE8, .img1 = gUnk_085F79A4, .tsa = gUnk_085FDD84 },
    { .img0 = gUnk_085F6FE8, .img1 = gUnk_085F79A4, .tsa = gUnk_085FDF20 },
    { .img0 = gUnk_085F7FCC, .img1 = gUnk_085F88BC, .tsa = gUnk_085FE0DC },
    { .img0 = gUnk_085F7FCC, .img1 = gUnk_085F88BC, .tsa = gUnk_085FE2B8 },
    { .img0 = gUnk_085F8C84, .img1 = gUnk_085F9468, .tsa = gUnk_085FE4B8 },
    { .img0 = gUnk_085F8C84, .img1 = gUnk_085F9468, .tsa = gUnk_085FE6DC },
    { .img0 = gUnk_085F9918, .img1 = gUnk_085FA24C, .tsa = gUnk_085FE914 },
    { .img0 = gUnk_085F9918, .img1 = gUnk_085FA24C, .tsa = gUnk_085FEA24 },
    { .img0 = gUnk_085F9918, .img1 = gUnk_085FA24C, .tsa = gUnk_085FEB60 },
    { .img0 = gUnk_085F9918, .img1 = gUnk_085FA24C, .tsa = gUnk_085FECC0 },
    { .img0 = gUnk_085F9918, .img1 = gUnk_085FA24C, .tsa = gUnk_085FEE38 },
    { .img0 = gUnk_085FAA6C, .img1 = gUnk_085FB034, .tsa = gUnk_085FEFC4 },
    { 0 },
};

SECTION(".rodata.08CEF4BC")
const struct OpAnimTextEntry gUnk_08CEF4BC[] = {
    { .img = { gUnk_085E9D4C, NULL }, .duration = 0x190 },
    { .duration = 0x46 },
    { .img = { gUnk_085EA084, NULL }, .duration = 0x140 },
    { .img = { gUnk_085EA40C, NULL }, .duration = 0x12C },
    { .duration = 0x46 },
    { .img = { gUnk_085EA784, NULL }, .duration = 0x118 },
    { .img = { gUnk_085EAB1C, NULL }, .duration = 0x118 },
    { .duration = 0x46 },
    { .img = { gUnk_085EAE5C, NULL }, .duration = 0x118 },
    { .img = { gUnk_085EB194, NULL }, .duration = 0x104 },
    { .img = { gUnk_085EB534, NULL }, .duration = 0x118 },
    { .img = { gUnk_085EB880, NULL }, .duration = 0x118 },
    { .duration = 0x3C },
    { .img = { gUnk_085EBB08, NULL }, .duration = 0x10E },
    { .img = { gUnk_085EBE18, NULL }, .duration = 0xFA },
    { .img = { gUnk_085EC128, NULL }, .duration = 0x10E },
    { .img = { gUnk_085EC3FC, NULL }, .duration = 0x10E },
    { 0 },
};

SECTION(".rodata.08CEFA38")
const struct OpAnimBgConf gUnk_08CEFA38 = { .header = gUnk_08CEF770, .frames = gUnk_08CEF788 };

SECTION(".rodata.08CEF788")
const struct OpAnimBgFrame gUnk_08CEF788[] = {
    { .img = gUnk_08600644, .tsa = gUnk_086157E4 },
    { .img = gUnk_08600950, .tsa = gUnk_086157E4 },
    { .img = gUnk_08600C64, .tsa = gUnk_086157E4 },
    { .img = gUnk_08600FAC, .tsa = gUnk_086157E4 },
    { .img = gUnk_08601330, .tsa = gUnk_086157E4 },
    { .img = gUnk_08601708, .tsa = gUnk_086157E4 },
    { .img = gUnk_08601B10, .tsa = gUnk_086157E4 },
    { .img = gUnk_08601F1C, .tsa = gUnk_086157E4 },
    { .img = gUnk_08602324, .tsa = gUnk_086157E4 },
    { .img = gUnk_08602758, .tsa = gUnk_086157E4 },
    { .img = gUnk_08602B8C, .tsa = gUnk_086157E4 },
    { .img = gUnk_08602FC8, .tsa = gUnk_086157E4 },
    { .img = gUnk_08603404, .tsa = gUnk_086157E4 },
    { .img = gUnk_0860382C, .tsa = gUnk_086157E4 },
    { .img = gUnk_08603C50, .tsa = gUnk_086157E4 },
    { .img = gUnk_08604088, .tsa = gUnk_086157E4 },
    { .img = gUnk_086044C8, .tsa = gUnk_086157E4 },
    { .img = gUnk_08604900, .tsa = gUnk_086157E4 },
    { .img = gUnk_08604D2C, .tsa = gUnk_086157E4 },
    { .img = gUnk_08605154, .tsa = gUnk_086157E4 },
    { .img = gUnk_0860556C, .tsa = gUnk_086157E4 },
    { .img = gUnk_0860599C, .tsa = gUnk_086157E4 },
    { .img = gUnk_08605DCC, .tsa = gUnk_08615D68 },
    { .img = gUnk_086061FC, .tsa = gUnk_08615D68 },
    { .img = gUnk_08606628, .tsa = gUnk_08615D68 },
    { .img = gUnk_08606A58, .tsa = gUnk_08615D68 },
    { .img = gUnk_08606E90, .tsa = gUnk_08615D68 },
    { .img = gUnk_086072D4, .tsa = gUnk_08615D68 },
    { .img = gUnk_08607718, .tsa = gUnk_08615D68 },
    { .img = gUnk_08607B5C, .tsa = gUnk_08615D68 },
    { .img = gUnk_08607F8C, .tsa = gUnk_08615D68 },
    { .img = gUnk_0860839C, .tsa = gUnk_08615D68 },
    { .img = gUnk_086087A4, .tsa = gUnk_08615D68 },
    { .img = gUnk_08608B74, .tsa = gUnk_08615D68 },
    { .img = gUnk_08608EA0, .tsa = gUnk_08615D68 },
    { .img = gUnk_086091B4, .tsa = gUnk_08615D68 },
    { .img = gUnk_08609534, .tsa = gUnk_08615D68 },
    { .img = gUnk_08609858, .tsa = gUnk_08615D68 },
    { .img = gUnk_08609C0C, .tsa = gUnk_08615D68 },
    { .img = gUnk_08609FF4, .tsa = gUnk_08615D68 },
    { .img = gUnk_0860A404, .tsa = gUnk_08615D68 },
    { .img = gUnk_0860A834, .tsa = gUnk_08615D68 },
    { .img = gUnk_0860AC60, .tsa = gUnk_08615D68 },
    { .img = gUnk_0860B098, .tsa = gUnk_08615D68 },
    { .img = gUnk_0860B4C4, .tsa = gUnk_086162EC },
    { .img = gUnk_0860B8FC, .tsa = gUnk_086162EC },
    { .img = gUnk_0860BD30, .tsa = gUnk_086162EC },
    { .img = gUnk_0860C168, .tsa = gUnk_086162EC },
    { .img = gUnk_0860C59C, .tsa = gUnk_086162EC },
    { .img = gUnk_0860C9D0, .tsa = gUnk_086162EC },
    { .img = gUnk_0860CDE0, .tsa = gUnk_086162EC },
    { .img = gUnk_0860D1FC, .tsa = gUnk_086162EC },
    { .img = gUnk_0860D638, .tsa = gUnk_086162EC },
    { .img = gUnk_0860DA70, .tsa = gUnk_086162EC },
    { .img = gUnk_0860DEB0, .tsa = gUnk_086162EC },
    { .img = gUnk_0860E2F8, .tsa = gUnk_086162EC },
    { .img = gUnk_0860E73C, .tsa = gUnk_086162EC },
    { .img = gUnk_0860EB80, .tsa = gUnk_086162EC },
    { .img = gUnk_0860EFC4, .tsa = gUnk_086162EC },
    { .img = gUnk_0860F404, .tsa = gUnk_086162EC },
    { .img = gUnk_0860F834, .tsa = gUnk_086162EC },
    { .img = gUnk_0860FC24, .tsa = gUnk_086162EC },
    { .img = gUnk_0860FFF8, .tsa = gUnk_086162EC },
    { .img = gUnk_086103B8, .tsa = gUnk_086162EC },
    { .img = gUnk_086107B0, .tsa = gUnk_086162EC },
    { .img = gUnk_08610BB8, .tsa = gUnk_086162EC },
    { .img = gUnk_08610FA8, .tsa = gUnk_08616870 },
    { .img = gUnk_08611370, .tsa = gUnk_08616870 },
    { .img = gUnk_086116F4, .tsa = gUnk_08616870 },
    { .img = gUnk_08611A80, .tsa = gUnk_08616870 },
    { .img = gUnk_08611DF0, .tsa = gUnk_08616870 },
    { .img = gUnk_08612154, .tsa = gUnk_08616870 },
    { .img = gUnk_086124D4, .tsa = gUnk_08616870 },
    { .img = gUnk_0861289C, .tsa = gUnk_08616870 },
    { .img = gUnk_08612CB8, .tsa = gUnk_08616870 },
    { .img = gUnk_086130FC, .tsa = gUnk_08616870 },
    { .img = gUnk_08613540, .tsa = gUnk_08616870 },
    { .img = gUnk_08613984, .tsa = gUnk_08616870 },
    { .img = gUnk_08613DB8, .tsa = gUnk_08616870 },
    { .img = gUnk_086141E0, .tsa = gUnk_08616870 },
    { .img = gUnk_0861460C, .tsa = gUnk_08616870 },
    { .img = gUnk_08614A34, .tsa = gUnk_08616870 },
    { .img = gUnk_08614E5C, .tsa = gUnk_08616870 },
    { .img = gUnk_08615244, .tsa = gUnk_08616870 },
    { .img = gUnk_08615594, .tsa = gUnk_08616870 },
    { .img = (void *) -1 },
};
