#include "gbafe.h"

extern const u8 Img_BattleBg_00[], Img_BattleBg_01[], Img_BattleBg_02[], Img_BattleBg_03[],
    Img_BattleBg_04[], Img_BattleBg_05[], Img_BattleBg_06[], Img_BattleBg_07[], Img_BattleBg_08[],
    Img_BattleBg_09[], Img_BattleBg_0A[], Img_BattleBg_0B[], Img_BattleBg_0C[], Img_BattleBg_0D[],
    Img_BattleBg_0E[], Img_BattleBg_0F[], Img_BattleBg_1B[], Img_BattleBg_20[], Img_BattleBg_21[],
    Img_BattleBg_2D[], Img_BattleBg_2E[], Img_BattleBg_2F[], Img_BattleBg_33[], Img_BattleBg_34[],
    Img_BattleBg_3B[], Pal_BattleBg_00[], Pal_BattleBg_01[], Pal_BattleBg_02[], Pal_BattleBg_03[],
    Pal_BattleBg_04[], Pal_BattleBg_05[], Pal_BattleBg_06[], Pal_BattleBg_07[], Pal_BattleBg_08[],
    Pal_BattleBg_09[], Pal_BattleBg_0A[], Pal_BattleBg_0B[], Pal_BattleBg_0C[], Pal_BattleBg_0D[],
    Pal_BattleBg_0E[], Pal_BattleBg_0F[], Pal_BattleBg_10[], Pal_BattleBg_11[], Pal_BattleBg_12[],
    Pal_BattleBg_13[], Pal_BattleBg_14[], Pal_BattleBg_15[], Pal_BattleBg_16[], Pal_BattleBg_17[],
    Pal_BattleBg_18[], Pal_BattleBg_19[], Pal_BattleBg_1A[], Pal_BattleBg_1B[], Pal_BattleBg_1C[],
    Pal_BattleBg_1D[], Pal_BattleBg_1E[], Pal_BattleBg_1F[], Pal_BattleBg_20[], Pal_BattleBg_21[],
    Pal_BattleBg_22[], Pal_BattleBg_23[], Pal_BattleBg_24[], Pal_BattleBg_25[], Pal_BattleBg_26[],
    Pal_BattleBg_27[], Pal_BattleBg_28[], Pal_BattleBg_29[], Pal_BattleBg_2A[], Pal_BattleBg_2B[],
    Pal_BattleBg_2C[], Pal_BattleBg_2D[], Pal_BattleBg_2E[], Pal_BattleBg_2F[], Pal_BattleBg_30[],
    Pal_BattleBg_31[], Pal_BattleBg_32[], Pal_BattleBg_33[], Pal_BattleBg_34[], Pal_BattleBg_35[],
    Pal_BattleBg_36[], Pal_BattleBg_3B[], Tsa_BattleBg_00[], Tsa_BattleBg_01[], Tsa_BattleBg_02[],
    Tsa_BattleBg_03[], Tsa_BattleBg_04[], Tsa_BattleBg_05[], Tsa_BattleBg_06[], Tsa_BattleBg_07[],
    Tsa_BattleBg_08[], Tsa_BattleBg_09[], Tsa_BattleBg_0A[], Tsa_BattleBg_0B[], Tsa_BattleBg_0C[],
    Tsa_BattleBg_0D[], Tsa_BattleBg_0E[], Tsa_BattleBg_0F[], Tsa_BattleBg_1B[], Tsa_BattleBg_20[],
    Tsa_BattleBg_21[], Tsa_BattleBg_2D[], Tsa_BattleBg_2E[], Tsa_BattleBg_2F[], Tsa_BattleBg_33[],
    Tsa_BattleBg_34[], Tsa_BattleBg_3B[];

extern const struct AnimSpriteData AnimSprite_EkrPopup[];

/**
 * Battle popups: weapon rank up, weapon broke (fireemblem8u: banim-ekrpopup.c)
 */

struct ProcEkrPopup {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;

    STRUCT_PAD(0x30, 0x44);

    /* 44 */ int lbuff;
    /* 48 */ int ldebuf;
    /* 4C */ int rbuf;
    /* 50 */ int rdebuf;

    STRUCT_PAD(0x54, 0x60);

    /* 60 */ struct Anim * anim;
};
PROC_SIZE_CHECK(struct ProcEkrPopup);

extern struct ProcEkrPopup * gpProcEkrPopup;
extern int gEkrPopupEnded;

extern const void * const gBattleBGDataTable[];
extern const u8 Img_EkrPopup[];
extern const u8 Tsa_EkrPopup[];
extern const u16 Pal_EkrPopup[];
extern const u8 Img_EkrPopupText[];
extern const AnimScr AnimScr_EkrPopup[];
extern const struct ProcCmd ProcScr_ekrPopup[];
extern const struct ProcCmd ProcScr_ekrPopup2[];

extern struct Font gBanimFont;
extern struct Text gBanimText[];

void SetBgmVolume(int volume);
s8 DidBattleUnitBreakWeapon(struct BattleUnit * bu);
void EndEkrPopup(void);
void MakeBattlePopupTileMapFromTSA(u16 * tm, u16 width);
void DrawBattlePopup(struct ProcEkrPopup * proc, int type, u32 priv);

void PutBanimBgIMG(int index)
{
    int _i = index * 3;
    LZ77UnCompVram(gBattleBGDataTable[_i], (void *)BG_VRAM + 0x8000);
}

void PutBanimBgTSA(int index)
{
    int _i = index * 3 + 1;
    LZ77UnCompWram(gBattleBGDataTable[_i], gEkrTsaBuffer);
    EfxTmCpyBG(gEkrTsaBuffer, gBg3Tm, 0x1E, 0x14, 0x6, 0x0);
}

void PutBanimBgPAL(int index)
{
    int _i = index * 3 + 2;
    LZ77UnCompWram(gBattleBGDataTable[_i], PAL_BG(0x6));
}

void PutBanimBG(int index)
{
    PutBanimBgIMG(index);
    CpuFastFill(0, (void *)BG_VRAM + 0x10000 - 0x20, 0x20);
    PutBanimBgTSA(index);
    PutBanimBgPAL(index);
    PAL_BG_COLOR(0, 0) = 0;
    EnableBgSync(BG3_SYNC_BIT);
    EnablePalSync();
}

bool CheckEkrPopupDone(void)
{
    if (gEkrPopupEnded == true)
        return true;

    return false;
}

void EndEkrPopup(void)
{
    if (gpProcEkrPopup != NULL)
    {
        Proc_End(gpProcEkrPopup);
        gpProcEkrPopup = NULL;
    }
}

void EfxPlaySound5AVol100(void)
{
    EfxPlaySE(0x37A, 0x100);
}

void EfxPlaySound5CVol100(void)
{
    EfxPlaySE(0x37C, 0x100);
}

#if NONMATCHING

void MakeBattlePopupTileMapFromTSA(u16 * tm, u16 width)
{
    u32 i;

    tm[0x00] = gEkrTsaBuffer[0x00] + 0x1100;
    tm[0x20] = gEkrTsaBuffer[0x18] + 0x1100;
    tm[0x40] = gEkrTsaBuffer[0x30] + 0x1100;
    tm[0x60] = gEkrTsaBuffer[0x48] + 0x1100;

    for (i = 0; i < width; i++)
    {
        tm[0x01 + i] = gEkrTsaBuffer[0x01 + i] + 0x1100;
        tm[0x21 + i] = gEkrTsaBuffer[0x19 + i] + 0x1100;
        tm[0x41 + i] = gEkrTsaBuffer[0x31 + i] + 0x1100;
        tm[0x61 + i] = gEkrTsaBuffer[0x49 + i] + 0x1100;
    }

    tm[0x01 + i] = gEkrTsaBuffer[0x17] + 0x1100;
    tm[0x21 + i] = gEkrTsaBuffer[0x2F] + 0x1100;
    tm[0x41 + i] = gEkrTsaBuffer[0x47] + 0x1100;
    tm[0x61 + i] = gEkrTsaBuffer[0x5F] + 0x1100;
}

#else

// FAKEMATCH (found by an Opus 5.5 agent): the original never keeps 0x1100 in a
// register and rebuilds it at every use. The r10 clobber in the loop keeps sl
// free (the original pushes it but never uses it). The 160 empty asm
// statements stretch constant's lifetime so it gets no register at all (150 is
// the tested minimum), and the r5 clobber fixes an r4/r5 swap.
#define ASM_BARRIER_10 asm(""); asm(""); asm(""); asm(""); asm(""); asm(""); asm(""); asm(""); asm(""); asm("")
void MakeBattlePopupTileMapFromTSA(u16 * tm, u16 width)
{
    u32 i;
    u16 * ekrTsaBuf;
    s32 constant = 0x1100;

    asm("" : : : "r5");
    ekrTsaBuf = gEkrTsaBuffer;

    tm[0x00] = ekrTsaBuf[0x00] + constant;
    tm[0x20] = ekrTsaBuf[0x18] + constant;
    tm[0x40] = ekrTsaBuf[0x30] + constant;
    tm[0x60] = ekrTsaBuf[0x48] + constant;

    for (i = 0; i < width; i++)
    {
        u16 * src = &ekrTsaBuf[0x01 + i];
        s32 v0 = src[0x00] + constant;
        u16 * dst = &tm[0x01 + i];

        dst[0x00] = v0;
        dst[0x20] = src[0x18] + constant;
        {
            s32 v2 = src[0x30] + constant;
            dst[0x40] = v2;
        }
        dst[0x60] = src[0x48] + constant;

        asm("" : : : "r10");
    }

    tm[0x01 + i] = ekrTsaBuf[0x17] + 0x1100;
    tm[0x21 + i] = ekrTsaBuf[0x2F] + constant;
    tm[0x41 + i] = ekrTsaBuf[0x47] + constant;
    tm[0x61 + i] = ekrTsaBuf[0x5F] + constant;

    ASM_BARRIER_10; ASM_BARRIER_10; ASM_BARRIER_10; ASM_BARRIER_10;
    ASM_BARRIER_10; ASM_BARRIER_10; ASM_BARRIER_10; ASM_BARRIER_10;
    ASM_BARRIER_10; ASM_BARRIER_10; ASM_BARRIER_10; ASM_BARRIER_10;
    ASM_BARRIER_10; ASM_BARRIER_10; ASM_BARRIER_10; ASM_BARRIER_10;
    asm("" : : "g"(constant));
}
#undef ASM_BARRIER_10

#endif

void DrawBattlePopup(struct ProcEkrPopup * proc, int type, u32 priv)
{
    const char * str;
    int width1, width_popupbox, width5, xcursor;
#if NONMATCHING
    int width3;
#else
    register int width3 asm("r4");
#endif
    struct Text * text;
    struct Anim * anim;

    LZ77UnCompVram(Img_EkrPopup, (void *)BG_VRAM + 0x2000);
    LZ77UnCompWram(Tsa_EkrPopup, gEkrTsaBuffer);
    InitTextFont(&gBanimFont, (void *)BG_VRAM + 0x20C0, 0x106, 1);
    SetTextDrawNoClear();
    CpuFastCopy(Pal_EkrPopup, PAL_BG(0x1), 0x20);

    if (type == 0)
    {
        width1 = 0;
        str = DecodeMsg(0x750);
        width3 = GetStringTextLen(str) + 0x10;
    }
    else if (type == 1)
    {
        width1 = 0;
        str = GetItemNameWithArticle(priv, 1);
        width3 = GetStringTextLen(str) + 0x10;
        str = DecodeMsg(0x751);
        width3 = GetStringTextLen(str) + width3 + 0x04;
    }
    else
    {
        str = DecodeMsg(0x75A);
        width1 = GetStringTextLen(str) + 2;
        width3 = width1 + 0x10;
    }

    width_popupbox = (width3 + 7) >> 3;
    MakeBattlePopupTileMapFromTSA(gBg1Tm, width_popupbox);

    text = &gBanimText[0];
    InitText(text, width_popupbox);
    xcursor = (width_popupbox * 8 - width3) >> 1;
    Text_SetCursor(text, xcursor);

    LZ77UnCompVram(Img_EkrPopupText, (void *)BG_VRAM + 0x20C0);

    if (type == 0)
    {
        Text_Skip(text, 0x10);
        str = DecodeMsg(0x750);
        Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
        Text_DrawString(text, str);
    }
    else if (type == 1)
    {
        Text_Skip(text, 0x10);
        str = GetItemNameWithArticle(priv, 1);
        Text_SetColor(text, TEXT_COLOR_SYSTEM_GRAY);
        Text_DrawString(text, str);
        Text_Skip(text, 0x04);
        str = DecodeMsg(0x751);
        Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
        Text_DrawString(text, str);
    }
    else
    {
        str = DecodeMsg(0x75A);
        Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
        Text_DrawString(text, str);
    }

    width5 = (0xF0 - (width_popupbox + 2) * 8) >> 1;
    SetBgOffset(BG_1, -width5, 0xFFD0);
    EnableBgSync(BG1_SYNC_BIT);

    InitIcons();

    if (type == 0)
    {
        ApplyIconPalette(1, 0x12);
        PutIconObjImg(GetItemType(priv) + 0x70, 0x40);
    }
    else if (type == 1)
    {
        ApplyIconPalette(0, 0x12);
        PutIconObjImg(GetItemIconId(priv), 0x40);
    }
    else
    {
        ApplyIconPalette(1, 0x12);
        PutIconObjImg(priv + 0x70, 0x40);
    }

    anim = AnimCreate(AnimScr_EkrPopup, 0x96);
    proc->anim = anim;
    anim->oam2Base = OAM2_PAL(0x2) + OAM2_LAYER(0x1) + OAM2_CHR(0x0800 / 0x20);
    anim->xPosition = width5 + ({ xcursor + 8; }) + width1;
    anim->yPosition = 0x38;

    EnablePalSync();
    SetBlendNone();
    SetWinEnable(0, 0, 0);
}

void NewEkrPopup(void)
{
    int i;
    struct ProcEkrPopup * proc;

    if (gEkrDistanceType == 4)
    {
        gpProcEkrPopup = proc = Proc_Start(ProcScr_ekrPopup2, PROC_TREE_3);
        gEkrPopupEnded = 0;
        proc->lbuff = -1;

        for (i = 0; i < 8; i++)
        {
            if (gpEkrBattleUnitRight->unit.ranks[i] == 0)
            {
                if (gpEkrBattleUnitLeft->unit.ranks[i] != 0)
                    proc->lbuff = i;
            }
        }

        if (proc->lbuff != -1)
        {
            SetBgmVolume(0x80);
        }
        else
        {
            gEkrPopupEnded = true;
            EndEkrPopup();
            return;
        }
    }
    else
    {
        gpProcEkrPopup = proc = Proc_Start(ProcScr_ekrPopup, PROC_TREE_3);
        gEkrPopupEnded = 0;
        proc->timer = 0;
        proc->ldebuf = 0;
        proc->lbuff = 0;
        proc->rdebuf = 0;
        proc->rbuf = 0;

        if (gBanimFactionPal[POS_L] == 0)
        {
            if (HasBattleUnitGainedWeaponLevel(gpEkrBattleUnitLeft) == true)
                proc->lbuff = gpEkrBattleUnitLeft->weaponBefore;

            if (DidBattleUnitBreakWeapon(gpEkrBattleUnitLeft) == true)
                proc->ldebuf = gpEkrBattleUnitLeft->weaponBefore;
        }

        if (gBanimFactionPal[POS_R] == 0)
        {
            if (HasBattleUnitGainedWeaponLevel(gpEkrBattleUnitRight) == true)
                proc->rbuf = gpEkrBattleUnitRight->weaponBefore;

            if (DidBattleUnitBreakWeapon(gpEkrBattleUnitRight) == true)
                proc->rdebuf = gpEkrBattleUnitRight->weaponBefore;
        }

        if (proc->lbuff + proc->ldebuf + proc->rbuf + proc->rdebuf == 0)
        {
            gEkrPopupEnded = true;
            EndEkrPopup();
        }
        else
        {
            SetBgmVolume(0x80);
        }
    }
}

void EkrPopup_Delay(struct ProcEkrPopup * proc)
{
    if (++proc->timer > 0x10)
        Proc_Break(proc);
}

void EkrPopup_DrawWRankUp(struct ProcEkrPopup * proc)
{
    u32 priv = proc->lbuff;

    if (priv != 0)
    {
        DrawBattlePopup(proc, 0, priv);
        EfxPlaySound5AVol100();
        proc->timer = 0;
        proc->terminator = 0x60;
    }

    Proc_Break(proc);
}

void ekrPopup_WaitWRankUp(struct ProcEkrPopup * proc)
{
    if (proc->lbuff == 0)
    {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim);
        SpellFx_ClearBG1();
        Proc_Break(proc);
    }
}

void ekrPopup_DrawWRankUp2(struct ProcEkrPopup * proc)
{
    u32 priv = proc->rbuf;

    if (priv != 0)
    {
        DrawBattlePopup(proc, 0, priv);
        EfxPlaySound5AVol100();
        proc->timer = 0;
        proc->terminator = 0x60;
    }

    Proc_Break(proc);
}

void ekrPopup_WaitWRankUp2(struct ProcEkrPopup * proc)
{
    if (proc->rbuf == 0)
    {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim);
        SpellFx_ClearBG1();
        Proc_Break(proc);
    }
}

void ekrPopup_DrawWpnBroke(struct ProcEkrPopup * proc)
{
    u32 priv = proc->ldebuf;

    if (priv != 0)
    {
        DrawBattlePopup(proc, 1, priv);
        EfxPlaySound5CVol100();
        proc->timer = 0;
        proc->terminator = 0x6C;
    }

    Proc_Break(proc);
}

void ekrPopup_WaitWpnBroke(struct ProcEkrPopup * proc)
{
    if (proc->ldebuf == 0)
    {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim);
        SpellFx_ClearBG1();
        Proc_Break(proc);
    }
}

void ekrPopup_DrawWpnBroke2(struct ProcEkrPopup * proc)
{
    u32 priv = proc->rdebuf;

    if (priv != 0)
    {
        DrawBattlePopup(proc, 1, priv);
        EfxPlaySound5CVol100();
        proc->timer = 0;
        proc->terminator = 0x6C;
    }

    Proc_Break(proc);
}

void ekrPopup_WaitWpnBroke2(struct ProcEkrPopup * proc)
{
    if (proc->rdebuf == 0)
    {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer > proc->terminator)
    {
        proc->timer = 0;
        AnimDelete(proc->anim);
        SpellFx_ClearBG1();
        Proc_Break(proc);
    }
}

void ekrPopup_MarkEnd(struct ProcEkrPopup * proc)
{
    if (++proc->timer > 0x10)
    {
        gEkrPopupEnded = true;
        SetBgmVolume(0x100);
        Proc_Break(proc);
    }
}

void ekrPopup_Nop(struct ProcEkrPopup * proc)
{
    return;
}

void ekrPopup2_DrawWRankUp(struct ProcEkrPopup * proc)
{
    if (proc->rbuf != 0)
    {
        DrawBattlePopup(proc, 2, proc->lbuff);
        EfxPlaySound5AVol100();
        proc->timer = 0;
        proc->terminator = 0x60;
    }

    Proc_Break(proc);
}

void ekrPopup2_WaitWRankUp(struct ProcEkrPopup * proc)
{
    if (proc->rdebuf == 0)
    {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer > proc->terminator)
    {
        proc->timer = 0;
        AnimDelete(proc->anim);
        SpellFx_ClearBG1();
        Proc_Break(proc);
    }
}

SECTION(".rodata.08BDCD54")
const struct ProcCmd ProcScr_ekrPopup[] = {
    PROC_19,
    PROC_REPEAT(EkrPopup_Delay),
    PROC_REPEAT(EkrPopup_DrawWRankUp),
    PROC_REPEAT(ekrPopup_WaitWRankUp),
    PROC_REPEAT(ekrPopup_DrawWRankUp2),
    PROC_REPEAT(ekrPopup_WaitWRankUp2),
    PROC_REPEAT(ekrPopup_DrawWpnBroke),
    PROC_REPEAT(ekrPopup_WaitWpnBroke),
    PROC_REPEAT(ekrPopup_DrawWpnBroke2),
    PROC_REPEAT(ekrPopup_WaitWpnBroke2),
    PROC_REPEAT(ekrPopup_MarkEnd),
    PROC_REPEAT(ekrPopup_Nop),
    PROC_END,
};

SECTION(".rodata.08BDCDBC")
const struct ProcCmd ProcScr_ekrPopup2[] = {
    PROC_19,
    PROC_REPEAT(EkrPopup_Delay),
    PROC_REPEAT(ekrPopup2_DrawWRankUp),
    PROC_REPEAT(ekrPopup2_WaitWRankUp),
    PROC_REPEAT(ekrPopup_MarkEnd),
    PROC_REPEAT(ekrPopup_Nop),
    PROC_END,
};

SECTION(".rodata.08BDCD4C")
const AnimScr AnimScr_EkrPopup[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EkrPopup, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BDCA64")
const void * const gBattleBGDataTable[] = {
    Img_BattleBg_00,
    Tsa_BattleBg_00,
    Pal_BattleBg_00,
    Img_BattleBg_01,
    Tsa_BattleBg_01,
    Pal_BattleBg_01,
    Img_BattleBg_02,
    Tsa_BattleBg_02,
    Pal_BattleBg_02,
    Img_BattleBg_03,
    Tsa_BattleBg_03,
    Pal_BattleBg_03,
    Img_BattleBg_04,
    Tsa_BattleBg_04,
    Pal_BattleBg_04,
    Img_BattleBg_05,
    Tsa_BattleBg_05,
    Pal_BattleBg_05,
    Img_BattleBg_06,
    Tsa_BattleBg_06,
    Pal_BattleBg_06,
    Img_BattleBg_07,
    Tsa_BattleBg_07,
    Pal_BattleBg_07,
    Img_BattleBg_08,
    Tsa_BattleBg_08,
    Pal_BattleBg_08,
    Img_BattleBg_09,
    Tsa_BattleBg_09,
    Pal_BattleBg_09,
    Img_BattleBg_0A,
    Tsa_BattleBg_0A,
    Pal_BattleBg_0A,
    Img_BattleBg_0B,
    Tsa_BattleBg_0B,
    Pal_BattleBg_0B,
    Img_BattleBg_0C,
    Tsa_BattleBg_0C,
    Pal_BattleBg_0C,
    Img_BattleBg_0D,
    Tsa_BattleBg_0D,
    Pal_BattleBg_0D,
    Img_BattleBg_0E,
    Tsa_BattleBg_0E,
    Pal_BattleBg_0E,
    Img_BattleBg_0F,
    Tsa_BattleBg_0F,
    Pal_BattleBg_0F,
    Img_BattleBg_00,
    Tsa_BattleBg_00,
    Pal_BattleBg_10,
    Img_BattleBg_02,
    Tsa_BattleBg_02,
    Pal_BattleBg_11,
    Img_BattleBg_03,
    Tsa_BattleBg_03,
    Pal_BattleBg_12,
    Img_BattleBg_04,
    Tsa_BattleBg_04,
    Pal_BattleBg_13,
    Img_BattleBg_05,
    Tsa_BattleBg_05,
    Pal_BattleBg_14,
    Img_BattleBg_08,
    Tsa_BattleBg_08,
    Pal_BattleBg_15,
    Img_BattleBg_0A,
    Tsa_BattleBg_0A,
    Pal_BattleBg_16,
    Img_BattleBg_0B,
    Tsa_BattleBg_0B,
    Pal_BattleBg_17,
    Img_BattleBg_01,
    Tsa_BattleBg_01,
    Pal_BattleBg_18,
    Img_BattleBg_0D,
    Tsa_BattleBg_0D,
    Pal_BattleBg_19,
    Img_BattleBg_0B,
    Tsa_BattleBg_0B,
    Pal_BattleBg_1A,
    Img_BattleBg_1B,
    Tsa_BattleBg_1B,
    Pal_BattleBg_1B,
    Img_BattleBg_0B,
    Tsa_BattleBg_0B,
    Pal_BattleBg_1C,
    Img_BattleBg_1B,
    Tsa_BattleBg_1B,
    Pal_BattleBg_1D,
    Img_BattleBg_0B,
    Tsa_BattleBg_0B,
    Pal_BattleBg_1E,
    Img_BattleBg_1B,
    Tsa_BattleBg_1B,
    Pal_BattleBg_1F,
    Img_BattleBg_20,
    Tsa_BattleBg_20,
    Pal_BattleBg_20,
    Img_BattleBg_21,
    Tsa_BattleBg_21,
    Pal_BattleBg_21,
    Img_BattleBg_21,
    Tsa_BattleBg_21,
    Pal_BattleBg_22,
    Img_BattleBg_02,
    Tsa_BattleBg_02,
    Pal_BattleBg_23,
    Img_BattleBg_02,
    Tsa_BattleBg_02,
    Pal_BattleBg_24,
    Img_BattleBg_02,
    Tsa_BattleBg_02,
    Pal_BattleBg_25,
    Img_BattleBg_02,
    Tsa_BattleBg_02,
    Pal_BattleBg_26,
    Img_BattleBg_00,
    Tsa_BattleBg_00,
    Pal_BattleBg_27,
    Img_BattleBg_01,
    Tsa_BattleBg_01,
    Pal_BattleBg_28,
    Img_BattleBg_01,
    Tsa_BattleBg_01,
    Pal_BattleBg_29,
    Img_BattleBg_0D,
    Tsa_BattleBg_0D,
    Pal_BattleBg_2A,
    Img_BattleBg_0D,
    Tsa_BattleBg_0D,
    Pal_BattleBg_2B,
    Img_BattleBg_0C,
    Tsa_BattleBg_0C,
    Pal_BattleBg_2C,
    Img_BattleBg_2D,
    Tsa_BattleBg_2D,
    Pal_BattleBg_2D,
    Img_BattleBg_2E,
    Tsa_BattleBg_2E,
    Pal_BattleBg_2E,
    Img_BattleBg_2F,
    Tsa_BattleBg_2F,
    Pal_BattleBg_2F,
    Img_BattleBg_03,
    Tsa_BattleBg_03,
    Pal_BattleBg_30,
    Img_BattleBg_03,
    Tsa_BattleBg_03,
    Pal_BattleBg_31,
    Img_BattleBg_03,
    Tsa_BattleBg_03,
    Pal_BattleBg_32,
    Img_BattleBg_33,
    Tsa_BattleBg_33,
    Pal_BattleBg_33,
    Img_BattleBg_34,
    Tsa_BattleBg_34,
    Pal_BattleBg_34,
    Img_BattleBg_05,
    Tsa_BattleBg_05,
    Pal_BattleBg_35,
    Img_BattleBg_0A,
    Tsa_BattleBg_0A,
    Pal_BattleBg_36,
    Img_BattleBg_00,
    Tsa_BattleBg_00,
    Pal_BattleBg_00,
    Img_BattleBg_00,
    Tsa_BattleBg_00,
    Pal_BattleBg_00,
    Img_BattleBg_00,
    Tsa_BattleBg_00,
    Pal_BattleBg_00,
    Img_BattleBg_00,
    Tsa_BattleBg_00,
    Pal_BattleBg_00,
    Img_BattleBg_3B,
    Tsa_BattleBg_3B,
    Pal_BattleBg_3B,
};
