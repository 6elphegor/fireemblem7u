#include "gbafe.h"

/**
 * Level-up battle animation effects (fireemblem8u: banim-efxlvup.c)
 */

struct ProcEkrLvupApfx {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 pal;
    /* 2E */ s16 clock;
};

struct ProcEobjLvup {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 chr1;
    /* 30 */ s16 chr2;
    /* 32 */ s16 x;

    STRUCT_PAD(0x34, 0x3A);

    /* 3A */ s16 y;

    STRUCT_PAD(0x3C, 0x44);

    /* 44 */ int chr;
    /* 48 */ int pal;
    /* 4C */ int index;
    /* 50 */ int diff;

    STRUCT_PAD(0x54, 0x5C);

    /* 5C */ struct Anim * anim;
    /* 60 */ struct ProcEkrSubAnimeEmulator * child1, * child2;
};

extern int gEfxBgSemaphore;
extern u16 gEkrLvupScrollPos1;
extern u16 gEkrLvupScrollPos2;
extern int gEkrLvupApfxUnexist;

extern struct ProcCmd ProcScr_EfxPartsofScroll2[];
extern struct ProcCmd ProcScr_Efxleveluphb[];
extern struct ProcCmd ProcScr_Efxlvupbg[];
extern struct ProcCmd ProcScr_efxLvupBG2[];
extern struct ProcCmd ProcScr_efxLvupOBJ2[];
extern struct ProcCmd ProcScr_efxLvupBGCOL[];
extern struct ProcCmd ProcScr_EkrLvupApfx[];
extern struct ProcCmd ProcScr_eobjLvup[];

extern const s16 gEfxPartsofScroll2Lut[];
extern const u16 FrameConfig_EfxLvupBG[];
extern u16 * TsaLut_EfxLvupBG[];
extern u16 * ImgLut_EfxLvupBG[];
extern const u16 Pal_EfxLvupBG[];
extern const u16 FrameConfig_EfxLvupBG2[];
extern u16 * TsaLut_EfxLvupBG2[];
extern const u8 Img_EfxLvupBG2[];
extern const u16 Pal_EfxLvupBG2[];
extern AnimScr AnimScr_EfxLvupOBJ2[];
extern const u8 Img_EfxLvupOBJ2[];
extern const u16 FrameLut_EfxLvupBGCOL[];
extern const u16 FrameLut2_EfxLvupBGCOL[];
extern const u16 Pal_EfxLvupBGCOL[];
extern const u16 Pal_ManimLevelUpStatGainCycling[];
extern const u8 Img_ManimLevelUpStatGain[];
extern const u16 Pal_ManimLevelUp[];
extern const u8 Img_EkrLvupNumBig[];
extern const u8 Img_ManimLevelUpStatGainDigits[];
extern u32 AnimScr_LvupStatupfx1[];
extern u32 AnimScr_LvupStatupfx2[];
extern u32 AnimScr_LvupStatupfx3[];
extern u32 AnimScr_LvupStatupfx5[];
extern u32 AnimScr_LvupStatupObj[];

void sub_0805067C(const u16 * src, u16 * dst, u32 index, u32 count, u32 unk);

void EfxUpdatePartsofScroll(void);
void PutEkrLvupStatGainLabelGfx1(int stat_num, int stat_gain);
void PutEkrLvupStatGainLabelGfx2(int chr, int stat_gain);

ProcPtr NewEfxPartsofScroll(void)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_EfxPartsofScroll, PROC_TREE_3);
    proc->timer = 0;
    proc->step = 0;
    return proc;
}

void EfxUpdatePartsofScroll(void)
{
    u32 i;
    u16 * buf1 = (gEkrBg1ScrollFlip == 0)
               ? gpBg2ScrollOffsetTable1
               : gpBg2ScrollOffsetTable2;
    u16 * buf2 = (gEkrBg1ScrollFlip == 0)
               ? gpBg1ScrollOffsetList1
               : gpBg1ScrollOffsetList2;

    for (i = 0; i < 0xA0; i++)
    {
        if (i < 0x28)
        {
            *buf1++ = 0;
            *buf2++ = 0;
            continue;
        }

        if (i <= 0x47)
        {
            *buf1++ = gEkrLvupScrollPos1;
            *buf2++ = gEkrLvupScrollPos1;
            continue;
        }

        if (i <= 0x9F)
        {
            *buf1++ = gEkrLvupScrollPos2;
            *buf2++ = gEkrLvupScrollPos2;
            continue;
        }
    }
}

void EfxPartsofScrollCallBack(ProcPtr proc)
{
    return;
}

void EfxPartsofScrollMain(ProcPtr proc)
{
    EfxUpdatePartsofScroll();
}

ProcPtr NewEfxPartsofScroll2(void)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_EfxPartsofScroll2, PROC_TREE_3);
    proc->timer = 0;
    proc->step = 0;
    return proc;
}

void EfxPartsofScroll2CallBack(ProcPtr proc)
{
    return;
}

void EfxPartsofScroll2Main(ProcPtr proc)
{
    u16 * buf1 = (gEkrBg1ScrollFlip == 0)
               ? gpBg2ScrollOffsetTable1
               : gpBg2ScrollOffsetTable2;
    u16 * buf2 = (gEkrBg1ScrollFlip == 0)
               ? gpBg1ScrollOffsetList1
               : gpBg1ScrollOffsetList2;
    u32 i = 0;

    for (; i < 0xA0; i++)
    {
        const s16 * src = gEfxPartsofScroll2Lut;
        src = src - 0x28;

        if (i < 0x28)
        {
            *buf1++ = 0;
            *buf2++ = 0;
            continue;
        }

        if (i <= 0x47)
        {
            s16 val2 = (src[i] * gEkrLvupScrollPos1) >> 0xC;

            if (i + val2 < 0x2F)
                val2 = -0x20;
            else if (i + val2 >= 0x52)
                val2 = -0x20;

            *buf1++ = val2;
            *buf2++ = val2;
            continue;
        }

        if (i <= 0x9F)
        {
            *buf1++ = 0;
            *buf2++ = 0;
            continue;
        }
    }
}

ProcPtr NewEfxleveluphb(void)
{
    u32 i;
    struct ProcEfx * proc;
    u16 * buf;

    gEfxBgSemaphore++;

    buf = gpBg2ScrollOffsetTable2;
    for (i = 0; i < 0xA0; i++)
        *buf++ = 0;

    buf = gpBg2ScrollOffsetTable1;
    for (i = 0; i < 0xA0; i++)
        *buf++ = 0;

    buf = gpBg1ScrollOffsetList2;
    for (i = 0; i < 0xA0; i++)
        *buf++ = 0;

    buf = gpBg1ScrollOffsetList1;
    for (i = 0; i < 0xA0; i++)
        *buf++ = 0;

    gEkrBg2ScrollFlip = 0;
    gEkrBg1ScrollFlip = 0;

    gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable2;
    gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList2;
    gpBg2ScrollOffset = gpBg2ScrollOffsetStart;
    gpBg1ScrollOffset = gpBg1ScrollOffsetStart;

    proc = Proc_Start(ProcScr_Efxleveluphb, PROC_TREE_VSYNC);
    proc->timer = 0;
    return proc;
}

void EfxleveluphbCallBack(ProcPtr proc)
{
    SetOnHBlankA(NULL);
}

void EfxleveluphbNop(ProcPtr proc)
{
    Proc_Break(proc);
}

void EfxleveluphbMain(ProcPtr proc)
{
    if (gBmSt.main_loop_ended != false)
    {
        if (gEkrBg2ScrollFlip == 1)
        {
            gEkrBg2ScrollFlip = 0;
            gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable2;
        }
        else
        {
            gEkrBg2ScrollFlip = 1;
            gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable1;
        }

        if (gEkrBg1ScrollFlip == 1)
        {
            gEkrBg1ScrollFlip = 0;
            gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList2;
        }
        else
        {
            gEkrBg1ScrollFlip = 1;
            gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList1;
        }
    }

    gpBg2ScrollOffset = gpBg2ScrollOffsetStart;
    gpBg1ScrollOffset = gpBg1ScrollOffsetStart;
}

void EkrLvupHBlank(void)
{
    if (REG_DISPSTAT & DISPSTAT_VBLANK)
        return;

    REG_BG2HOFS = *gpBg2ScrollOffset++;
    REG_BG1HOFS = *gpBg1ScrollOffset++;
}

void EfxPartsofScroll2HBlank(void)
{
    if (REG_DISPSTAT & DISPSTAT_VBLANK)
        return;

    REG_BG2VOFS = gDispIo.bg_off[2].y + *gpBg2ScrollOffset++;
    REG_BG1VOFS = gDispIo.bg_off[1].y + *gpBg1ScrollOffset++;
}

void NewEfxlvupbg(struct Anim * anim)
{
    struct ProcEfxBG * proc = Proc_Start(ProcScr_Efxlvupbg, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameConfig_EfxLvupBG;
    proc->tsal = TsaLut_EfxLvupBG;
    proc->tsar = TsaLut_EfxLvupBG;
    proc->img = ImgLut_EfxLvupBG;

    SpellFx_RegisterBgPal(Pal_EfxLvupBG, 0x20);
    SpellFx_SetSomeColorEffect();
}

void EfxlvupbgMain(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa1 = proc->tsal;
        u16 ** tsa2 = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_WriteBgMap(proc->anim, tsa1[ret], tsa2[ret]);
        SpellFx_RegisterBgGfx(img[ret], 0x2000);
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

void NewEfxLvupBG2(struct Anim * anim)
{
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxLvupBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameConfig_EfxLvupBG2;
    proc->tsal = TsaLut_EfxLvupBG2;
    proc->tsar = TsaLut_EfxLvupBG2;

    SpellFx_RegisterBgGfx(Img_EfxLvupBG2, 0x2000);
    SpellFx_RegisterBgPal(Pal_EfxLvupBG2, 0x20);
}

void EfxLvupBg2Main(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa1 = proc->tsal;
        u16 ** tsa2 = proc->tsar;

        SpellFx_WriteBgMap(proc->anim, tsa1[ret], tsa2[ret]);
        return;
    }

    if (ret == -1)
        Proc_Break(proc);
}

void NewEfxLvupOBJ2(struct Anim * anim, int x, int y)
{
    struct Anim * anim3;
    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxLvupOBJ2, PROC_TREE_3);

    proc->anim = anim;
    anim3 = EfxCreateFrontAnim(anim, AnimScr_EfxLvupOBJ2, AnimScr_EfxLvupOBJ2, AnimScr_EfxLvupOBJ2, AnimScr_EfxLvupOBJ2);
    proc->anim3 = anim3;
    anim3->xPosition = x;
    anim3->yPosition = y;

    SpellFx_RegisterObjGfx(Img_EfxLvupOBJ2, 0x1000);
    SpellFx_RegisterObjPal(Pal_EfxLvupBG2, 0x20);
}

void EfxLvupOBJ2CallBack(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim3);
}

void NewEfxLvupBGCOL(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc = Proc_Start(ProcScr_efxLvupBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->terminator = 0x19;
    proc->frame = 0;
    proc->frame_config = FrameLut_EfxLvupBGCOL;
    proc->pal = (void *)Pal_EfxLvupBGCOL;
}

void Loop6C1_EfxLvupBGCOL(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
        sub_0805067C(proc->pal, gPal + 1, ret, 0xF, 8);

    if (++proc->timer2 > proc->terminator)
    {
        proc->timer = 0;
        proc->timer2 = 0;
        proc->frame = 0;
        proc->frame_config = FrameLut2_EfxLvupBGCOL;
        proc->pal = (void *)Pal_EfxLvupBG2;
        Proc_Break(proc);
    }
}

void Loop6C2_EfxLvupBGCOL(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(&PAL_BUF_COLOR(pal, ret, 0), 0x20);
        return;
    }

    if (ret == -1)
        Proc_Break(proc);
}

void EkrLvupApfxInit(struct ProcEkrLvupApfx * proc)
{
    proc->clock = 0;
}

void EkrLvupApfxMain(struct ProcEkrLvupApfx * proc)
{
    int new_color_offset;
    const u16 * colors = Pal_ManimLevelUpStatGainCycling;

    ++proc->clock;

    if (proc->clock & 3)
        return;

    new_color_offset = (proc->clock >> 2) & 0xF;

    ApplyPaletteExt(colors + new_color_offset + 0x00, (0x10 + proc->pal + 0) * 0x20 + 0x12, 0x20 - 0x12);
    ApplyPaletteExt(colors + new_color_offset + 0x20, (0x10 + proc->pal + 1) * 0x20 + 0x12, 0x20 - 0x12);
}

void NewEkrLvupApfx(int chr, int pal)
{
    int pal_bank;
    const u16 * pal_src;
    struct ProcEkrLvupApfx * proc;

    Decompress(Img_ManimLevelUpStatGain, (void *)OBJ_VRAM0 + OAM2_CHR(chr) * CHR_SIZE);

    pal_src = Pal_ManimLevelUp;
    pal_bank = pal + 0x10;
    ApplyPalette(pal_src, pal + 0x10);
    pal_bank = pal + 0x11;
    ApplyPalette(pal_src, pal_bank);

    proc = Proc_Start(ProcScr_EkrLvupApfx, PROC_TREE_3);
    proc->pal = pal;
    gEkrLvupApfxUnexist = false;
}

void EkrLvupApfxEndEach(void)
{
    Proc_EndEach(ProcScr_EkrLvupApfx);
    gEkrLvupApfxUnexist = true;
}

#if NONMATCHING

void PutEkrLvupStatGainLabelGfx1(int stat_num, int stat_gain)
{
    int chr = ABS((stat_num - 1) * 2);

    VramCopy(Img_EkrLvupNumBig + OAM2_CHR(chr) * CHR_SIZE,
        (u8 *)OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x2C) << 5), 2 * CHR_SIZE);

    VramCopy(Img_EkrLvupNumBig + OAM2_CHR(chr + 0x20) * CHR_SIZE,
        (u8 *)OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x4C) << 5), 2 * CHR_SIZE);
}

#else

void PutEkrLvupStatGainLabelGfx1(int stat_num, int stat_gain)
{
    const u8 * img = Img_EkrLvupNumBig;
    register int chr asm("r4");
    int chr_this_stat;

    chr = (stat_num - 1) * 2;

    chr_this_stat = chr;
    if (chr < 0)
        chr_this_stat = -chr;

    VramCopy(img + OAM2_CHR(chr_this_stat) * CHR_SIZE,
        (u8 *)OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x2C) << 5), 2 * CHR_SIZE);

    chr_this_stat = chr >= 0 ? chr : -chr;

    VramCopy(img + OAM2_CHR((chr_this_stat) + 0x20) * CHR_SIZE,
        (u8 *)OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x4C) << 5), 2 * CHR_SIZE);
}

#endif

void PutEkrLvupStatGainLabelGfx2(int chr, int stat_gain)
{
    int chr_this_stat;
    int chr_this_stat_2;
    const u8 * img1;
    const u8 * img2;

    img1 = Img_ManimLevelUpStatGainDigits;
    img2 = Img_EkrLvupNumBig;

    if (chr >= 0)
    {
        VramCopy(img2 + 0x18 * CHR_SIZE,
            (u8 *)OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x2C) << 5), 2 * CHR_SIZE);
        VramCopy(img2 + 0x38 * CHR_SIZE,
            (u8 *)OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x4C) << 5), 2 * CHR_SIZE);
    }
    else
    {
        VramCopy(img2 + 0x1A * CHR_SIZE,
            (u8 *)OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x2C) << 5), 2 * CHR_SIZE);
        VramCopy(img2 + 0x3A * CHR_SIZE,
            (u8 *)OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x4C) << 5), 2 * CHR_SIZE);
    }

    chr_this_stat = chr >= 0 ? chr : -chr;
    VramCopy(img1 + OAM2_CHR(chr_this_stat) * CHR_SIZE,
        (u8 *)OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x2D) << 5), CHR_SIZE);

    chr_this_stat_2 = chr >= 0 ? chr : -chr;
    VramCopy(img1 + OAM2_CHR((chr_this_stat_2) + 0x20) * CHR_SIZE,
        (u8 *)OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x4D) << 5), CHR_SIZE);
}

#if NONMATCHING

void BanimDrawStatupAp(int chr, int pal, int x, int y, int index, int gain)
{
    int chr2 = chr + 2 * (index - 1);
    int oam2 = (pal << 12) | 0x400 | chr;
    struct ProcEobjLvup * proc;

    NewEkrsubAnimeEmulator(x - 0x12, y - 0x04, AnimScr_LvupStatupfx1, 0, oam2, 0, PROC_TREE_5);

    if (index == 0)
        return;

    proc = Proc_Start(ProcScr_eobjLvup, PROC_TREE_3);

    if (gain >= 0)
    {
        proc->child2 = NewEkrsubAnimeEmulator(x, y, AnimScr_LvupStatupfx2, 2, oam2, 0, PROC_TREE_5);
    }
    else
    {
        proc->child1 = NewEkrsubAnimeEmulator(x - 3, y, AnimScr_LvupStatupfx5, 2,
            (pal << 12) | 0x400 | chr2, 0, PROC_TREE_5);
        proc->child2 = NewEkrsubAnimeEmulator(x, y, AnimScr_LvupStatupfx3, 2, oam2, 0, PROC_TREE_5);
        PutEkrLvupStatGainLabelGfx2(gain, chr2);
    }

    proc->x = x;
    proc->y = y;
    proc->timer = 0;
    proc->chr1 = chr;
    proc->chr2 = chr2;
    proc->chr = chr;
    proc->pal = pal;
    proc->index = index;
    proc->diff = gain;
}

#else

void BanimDrawStatupAp(int chr, int pal, int x, int y, int index, int gain)
{
    s32 sp14 = chr;
    int chr2 = chr + 2 * (index - 1);
    register int _pal asm("r6") = pal << 12;
    register struct ProcEobjLvup * proc asm("r4");
    int _chr = chr | 0x400;
    int __oam = _pal;

    if (__oam) { __oam++; __oam--; }
    __oam |= _chr;

    NewEkrsubAnimeEmulator(x - 0x12, y - 0x04, AnimScr_LvupStatupfx1, 0, __oam, 0, PROC_TREE_5);

    if (index == 0)
        return;

    proc = Proc_Start(ProcScr_eobjLvup, PROC_TREE_3);

    if (gain >= 0)
    {
        proc->child2 = NewEkrsubAnimeEmulator(x, y, AnimScr_LvupStatupfx2, 2, __oam, 0, PROC_TREE_5);
    }
    else
    {
        int _oam = 0x400 | _pal | chr2;
        proc->child1 = NewEkrsubAnimeEmulator(x - 3, y, AnimScr_LvupStatupfx5, 2, _oam, 0, PROC_TREE_5);
        _pal |= _chr;
        proc->child2 = NewEkrsubAnimeEmulator(x, y, AnimScr_LvupStatupfx3, 2, _pal, 0, PROC_TREE_5);
        PutEkrLvupStatGainLabelGfx2(gain, chr2);
    }

    proc->x = x;
    proc->y = y;
    proc->timer = 0;
    proc->chr1 = sp14;
    proc->chr2 = chr2;
    proc->chr = chr;
    proc->pal = pal;
    proc->index = index;
    proc->diff = gain;
}

#endif

void EobjLvup_DrawGain1(struct ProcEobjLvup * proc)
{
    int oam2;

    if (proc->diff < 0)
    {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer == 0xF)
    {
        proc->timer = 0;
        {
            int _pal = proc->pal << 12;
            int _chr = proc->chr2;
            int _lay = 0x400;
            oam2 = _pal | (_chr | _lay);
        }
        proc->child1 = NewEkrsubAnimeEmulator(
            proc->x - 3,
            proc->y,
            AnimScr_LvupStatupObj,
            2,
            oam2,
            0,
            PROC_TREE_3
        );
        PutEkrLvupStatGainLabelGfx1(proc->diff, proc->chr2);
        Proc_Break(proc);
    }
}

void EobjLvup_DrawGain2(struct ProcEobjLvup * proc)
{
    if (proc->diff < 0)
    {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer == 0xF)
    {
        proc->timer = 0;
        PutEkrLvupStatGainLabelGfx2(proc->diff, proc->chr2);
        Proc_Break(proc);
    }
}

void EobjLvup_WaitApfxEnd(struct ProcEobjLvup * proc)
{
    if (gEkrLvupApfxUnexist == true)
    {
        Proc_End(proc->child1);
        Proc_End(proc->child2);
        Proc_Break(proc);
    }
}
