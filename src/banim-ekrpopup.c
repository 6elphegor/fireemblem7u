#include "gbafe.h"

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

extern struct ProcEkrPopup * gpProcEkrPopup;
extern int gEkrPopupEnded;

extern const void * gBattleBGDataTable[];
extern const u8 Img_EkrPopup[];
extern const u8 Tsa_EkrPopup[];
extern const u16 Pal_EkrPopup[];
extern const u8 Img_EkrPopupText[];
extern CONST_DATA AnimScr AnimScr_EkrPopup[];
extern CONST_DATA struct ProcCmd ProcScr_ekrPopup[];
extern CONST_DATA struct ProcCmd ProcScr_ekrPopup2[];

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

ASM_FUNC("asm/nonmatching/code_0806B0C0.s");

void DrawBattlePopup(struct ProcEkrPopup * proc, int type, u32 priv)
{
    const char * str;
    int width1, width_popupbox, width5, xcursor;
#ifndef NONMATCHING
    register int width3 asm("r4");
#else
    int width3;
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
