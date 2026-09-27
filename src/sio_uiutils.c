#include "gbafe.h"

// Link arena menu sprite/palette utilities (FE8U: sio_uiutils.c)

struct LinkArenaStMaybe {
    /* 00 */ u8 unk_00;
    /* 01 */ u8 unk_01;
    /* 02 */ u8 pad_02;
    /* 03 */ u8 unk_03;
    /* 04 */ u8 unk_04;
    /* 05 */ u8 unk_05;
};

struct SioProc85AAA78 {
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ s16 unk_30[5];
    /* 3A */ u8 unk_3a[5];
    /* 40 */ int unk_40;
    /* 44 */ s8 unk_44;
    /* 45 */ u8 pad_45[0x48 - 0x45];
    /* 48 */ int unk_48;
};

struct SioTeamListProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioProc85AAA78 * unk_2c;
    /* 30 */ ProcPtr pSioHoldProc;
    /* 34 */ int numActiveOptions;
    /* 38 */ int unk_38;
    /* 3C */ int optionIdx;
    /* 40 */ int unk_40;
    /* 44 */ int unk_44;
    /* 48 */ u8 unk_48;
    /* 49 */ u8 pad_49;
    /* 4A */ u16 yBg1;
};

struct SioMenuItemProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 xBase;
    /* 2C */ s16 yBase;
    /* 2E */ u8 state; // 0 = disabled, 1 = enabled, 2 = selected
    /* 2F */ u8 index;
    /* 30 */ u8 glowFrame;
    /* 32 */ s16 xLeftArrow;
    /* 34 */ s16 xRightArrow;
    /* 36 */ u16 leftArrowAnmCnt;
    /* 38 */ u16 rightArrowAnmCnt;
    /* 3A */ s16 leftArrowSpeed;
    /* 3C */ s16 rightArrowSpeed;
    /* 3E */ u8 unk_3e;
};

struct LinkArenaTitleBannerProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u8 pad_34[0x58 - 0x34];
    /* 58 */ int unk_58;
    /* 5C */ u32 chr;
};

struct LATeamSpriteDrawProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int xBase;
    /* 30 */ int yBase;
    /* 34 */ int yMin;
    /* 38 */ int yMax;
    /* 3C */ int numTeams;
};

struct NameEntrySpriteDrawProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int xCurrent;
    /* 30 */ int yCurrent;
    /* 34 */ int xNew;
    /* 38 */ int yNew;
    /* 3C */ int cursorKind;
    /* 40 */ int xPointer;
    /* 44 */ int unk_44;
};

struct RuleSettingSpriteDrawProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 yPrevious;
    /* 2C */ s16 yNew;
    /* 2E */ s16 xOption;
    /* 30 */ s16 yOption;
};

struct SioMenuBurstFxProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int xBase;
    /* 30 */ int yBase;
    /* 34 */ u8 pad_34[0x4C - 0x34];
    /* 4C */ s16 glowPalIdx;
};

struct LAMenuScrollBarProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int xBase;
    /* 30 */ int yBase;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ u8 unk_3c;
    /* 3D */ u8 unk_3d;
    /* 3E */ s16 unk_3e;
    /* 40 */ s16 unk_40;
    /* 42 */ u16 unk_42;
    /* 44 */ u8 oam2Arrows[2];
};

struct LAVersusSpriteDrawProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int yBase;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ u16 unk_3c[4];
};

struct SioProc85AABD8 {
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
};

struct SioScrollTextProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ int xCur;
    /* 38 */ int yCur;
    /* 3C */ int len;
    /* 40 */ int clock;
};

extern struct LinkArenaStMaybe gLinkArenaSt;
extern u8 gUnknown_0200118C[];
extern u16 CONST_DATA Sprite_08B9A3C8[];
extern u16 CONST_DATA Sprite_08B9A436[];
extern const u16 Sprite_081D5618[];
extern struct ProcCmd CONST_DATA ProcScr_08B9A3D0[];
extern const u8 Img_08B9A3D0_Font[];
extern const u16 Pal_08B9A3D0[];
extern s8 gUnk_Sio_0203DDDC;
extern int gUnknown_03001860;
extern struct MusicPlayer gMPlayInfo_BGM2;
extern struct ProcCmd CONST_DATA ProcScr_08CC1C5C[];
extern const u8 Img_LAPhaseIntroSquares[];
extern const u8 Img_LAPhaseIntro_P1[];
extern const u8 Img_LAPhaseIntro_P2[];
extern const u8 Img_LAPhaseIntro_P3[];
extern const u8 Img_LAPhaseIntro_P4[];
extern const u16 Pal_LAPhaseIntro_P1[];
extern const u16 Pal_LAPhaseIntro_P2[];
extern const u16 Pal_LAPhaseIntro_P3[];
extern const u16 Pal_LAPhaseIntro_P4[];

extern u16 CONST_DATA Sprite_LinkArena_MenuTitle[];
extern struct ProcCmd CONST_DATA ProcScr_LinkArenaTitleBanner[];
extern const u16 * CONST_DATA SpriteArray_SioMenuItems[];
extern const u16 gUnknown_080DA09C[];
extern const u16 * CONST_DATA SpriteArray_SioMenuTeamCount[];
extern struct ProcCmd CONST_DATA ProcScr_SioMenuItem[];
extern const u16 Sprite_LinkArena_PressStart[];
extern u16 CONST_DATA Sprite_LinkArena_TeamName[];
extern u16 CONST_DATA gUnknown_085AAA0E[];
extern u16 * CONST_DATA gUnknown_085AAA48[];
extern u16 CONST_DATA Sprite_LinkArena_NameBanner[];
extern u16 CONST_DATA gUnknown_085AAA5E[];
extern struct ProcCmd CONST_DATA ProcScr_085AAA78[];
extern struct ProcCmd CONST_DATA ProcScr_LinkArenaTeamSpriteDraw[];
extern const u16 * CONST_DATA SpriteArray_NameEntryCursor[];
extern const u16 Sprite_NameEntry_PositionIndicator[];
extern const u16 * CONST_DATA SpriteArray_NameEntryIcons[];
extern struct ProcCmd CONST_DATA ProcScr_NameEntrySpriteDraw[];
extern const u16 * CONST_DATA SpriteArray_RuleSettingIcons[];
extern struct ProcCmd CONST_DATA ProcScr_RuleSettingSpriteDraw_Interactive[];
extern const u16 Sprite_SioMenuBurst_TopLeft[];
extern const u16 Sprite_SioMenuBurst_TopRight[];
extern const u16 Sprite_SioMenuBurst_BottomLeft[];
extern const u16 Sprite_SioMenuBurst_BottomRight[];
extern const s16 gUnknown_080DA1CA[];
extern struct ProcCmd CONST_DATA ProcScr_SioMenuBurstFx[];
extern u16 CONST_DATA Sprite_LAMenuScrollBar_UpArrow[];
extern u16 CONST_DATA Sprite_LAMenuScrollBar_DownArrow[];
extern u16 CONST_DATA Sprite_LinkArenaMenuScrollBar[];
extern struct ProcCmd CONST_DATA ProcScr_LinkArenaMenuScrollBar[];
extern const u16 * CONST_DATA SpriteArray_LAVersusPlayerNumbers[];
extern const u16 Sprite_080DA25C[];
extern const u16 Sprite_080DA26A[];
extern struct ProcCmd CONST_DATA ProcScr_LAVersusSpriteDraw[];
extern const u16 Sprite_080DA27E[];
extern struct ProcCmd CONST_DATA ProcScr_085AABD8[];
extern const u16 Sprite_LinkArena_ChoiceBanner[];

extern u16 gUnknown_085ADDE8[];
extern u16 gUnknown_085ADE28[];
extern u16 gUnknown_085ADE48[];
extern u16 gUnknown_08A1BD40[];
extern u16 Pal_LinkArenaActiveBannerFx[];
extern const u8 gUnknown_085B0DE8[];
extern const u8 gUnknown_085AAE0C[];
extern const u8 gUnknown_085B0F2C[];
extern const u8 gGfx_SupportMenu[];
extern const u16 gPal_SupportMenu[];

void sub_08047CB8(u8 * src, u8 * dst, int c, int d);
void UpdateSioMenuSelectedGlow(u8 idx);
void sub_080481E4(void);
void sub_08048240(void);
void StartLinkArenaMenuScrollBar(int xBase, int yBase, u8 c, u8 d, u8 e, ProcPtr parent);
void PutLinkArenaTeamSprites(int x, int y, int yMax, int yMin, int count, ProcPtr parent);
void UpdateNameEntrySpriteGlow(void);
void UpdateSioMenuBurstGlow(int idx);
void sub_08048DF4(struct Unit * unit, int itemSlot);
void sub_08048E28(void);
void sub_08049124(void);
void PutLinkArenaButtonSpriteAt(int x, int y);
void sub_080263A0(int layer, int x, int y, int oam2, struct Unit * unit);

extern u16 const gSioDefaultBgConfig[12];
extern u8 const Img_SioBg[];
extern u8 const Tsa_SioBg[];
extern u16 const Pal_SioBg[];
extern u16 const gSioBgPalTable[20];
extern const u16 Pal_LinkArenaRankIcons[];

void InitSioBG(void)
{
    u16 bgConfig[12];

    memcpy(bgConfig, gSioDefaultBgConfig, sizeof(bgConfig));
    InitBgs(bgConfig);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    ApplySystemGraphics();

    ApplyPalettes(Pal_LinkArenaRankIcons, 0x18, 2);

    Decompress(Img_SioBg, (void *) BG_VRAM + GetBgChrOffset(3));
    Decompress(Tsa_SioBg, gBg3Tm);
    ApplyPalettes(Pal_SioBg, 0xE, 2);
}

void sub_08047BD4(ProcPtr parent, int n)
{
    u16 * tm = gBg3Tm;
    int i;

    Proc_EndEach(ProcScr_08CC1C5C);

    for (i = 0; i < (0x14 - n) * 0x20; i++)
        *tm++ += 0xE000;

    for (i = 0; i < n * 0x20; i++)
        *tm++ += 0xF000;

    Proc_Start(ProcScr_08CC1C5C, parent);
}

void sub_08047C38(ProcPtr parent)
{
    u16 pals[20];
    u16 * tm;
    int i;

    memcpy(pals, gSioBgPalTable, sizeof(pals));
    tm = gBg3Tm;

    Proc_EndEach(ProcScr_08CC1C5C);

    for (i = 0; i < 0x280; i++)
        *tm++ += (pals[i / 0x20] & 0xF) << 12;

    Proc_Start(ProcScr_08CC1C5C, parent);
}

void sub_08047CA8(void)
{
    Proc_EndEach(ProcScr_08CC1C5C);
    return;
}

void sub_08047CB8(u8 * src, u8 * dst, int c, int d)
{
    int i;

    int r7 = c << 5;

    for (i = 0; i < d; i++)
    {
        CpuFastCopy(src, dst, (r7 * 0x20) / 0x20);
        src += 0x400;
        dst += 0x400;
    }

    return;
}

void LATitleBanner_Init(struct LinkArenaTitleBannerProc * proc)
{
    int a = proc->unk_58 & 3;
    int b = proc->unk_58 / 4;

    Decompress(gUnknown_085B0DE8, (void *)(VRAM + 0x800));
    Decompress(gUnknown_085AAE0C, gBuf);

    sub_08047CB8(gBuf + (a * 0x100 + b * 0x800), OBJ_VRAM0 + 0x200 * 0x20, 8, 2);

    TmApplyTsa_thm(gBg2Tm, gUnknown_085B0F2C, 0x1040);
    EnableBgSync(BG2_SYNC_BIT);

    return;
}

void LATitleBanner_Loop(void)
{
    PutSpriteExt(4, 40, 8, Sprite_LinkArena_MenuTitle, 0);
    return;
}

void StartLinkArenaTitleBanner(ProcPtr parent, int size)
{
    struct LinkArenaTitleBannerProc * proc;

    Proc_EndEach(ProcScr_LinkArenaTitleBanner);
    proc = Proc_Start(ProcScr_LinkArenaTitleBanner, parent);

    proc->unk_58 = size;

    return;
}

void sub_08047DA4(void)
{
    Proc_EndEach(ProcScr_LinkArenaTitleBanner);
    return;
}

void sub_08047DB4(void)
{
    SetBlendAlpha(8, 15);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    return;
}

void sub_08047E00(struct SioScrollTextProc * proc)
{
    int i;
    int x, y;

    int chr = 0x7E08;

    x = (proc->x + proc->xCur) >> 1;
    y = (proc->y + proc->yCur) >> 1;

    proc->xCur = x;
    proc->yCur = y;

    for (i = 0; i < 32; i++)
    {
        int clock = proc->clock;
        int tile = (clock / 8 + i) % proc->len;
        PutSprite(12, x + i * 8 - (clock & 7), y, Sprite_08B9A3C8, tile + chr);
    }

    proc->clock++;

    if (proc->clock == proc->len * 8)
    {
        proc->clock = 0;
    }

    return;
}

void sub_08047E84(u8 * str, int len, int x, int y, int palId, ProcPtr parent)
{
    struct SioScrollTextProc * proc;
    int i;

    Decompress(Img_08B9A3D0_Font, gBuf);

    for (i = 0; i < len; i++)
    {
        sub_08047CB8(gBuf + str[i % len] * 0x20, OBJ_VRAM0 + 0x208 * 0x20 + i * 0x20, 1, 2);
    }

    ApplyPalette(Pal_08B9A3D0 + palId * 0x10, 0x17);

    Proc_EndEach(ProcScr_08B9A3D0);
    proc = Proc_Start(ProcScr_08B9A3D0, parent);

    proc->x = x;
    proc->xCur = x;
    proc->y = y;
    proc->yCur = y;
    proc->len = len;
    proc->clock = 0;

    return;
}

void sub_08047F1C(void)
{
    SetBlendConfig(0, 0, 0, 0);
    Proc_EndEach(ProcScr_08B9A3D0);

    return;
}

void sub_08047F50(int x, int y)
{
    struct SioScrollTextProc * proc = Proc_Find(ProcScr_08B9A3D0);

    proc->x = x;
    proc->y = y;

    return;
}

void sub_08047F6C(int x, int y)
{
    struct SioScrollTextProc * proc = Proc_Find(ProcScr_08B9A3D0);

    proc->x = proc->xCur = x;
    proc->y = proc->yCur = y;

    return;
}

void sub_08047F8C(int palId)
{
    ApplyPalette(Pal_08B9A3D0 + palId * 0x10, 0x17);
    return;
}


void UpdateSioMenuSelectedGlow(u8 idx)
{
    const u8 sioMenuItemGlowLut[] =
    {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
        0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08,
        0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
    };

    if (gUnk_Sio_0203DDDC == 0)
    {
        int color = sioMenuItemGlowLut[idx] + 0x10;
        PAL_OBJ_COLOR(3, 14) = ((color) << 10) + ((color) << 5) + (color);
        EnablePalSync();
    }

    return;
}

void SioMenuItem_Loop(struct SioMenuItemProc * proc)
{
    int oam2 = OAM2_CHR(0x2DA) + OAM2_PAL(8);

    PutSprite(4, proc->xBase, proc->yBase, SpriteArray_SioMenuItems[proc->index], gUnknown_080DA09C[proc->state]);

    if (proc->state == 2)
    {
        UpdateSioMenuSelectedGlow(proc->glowFrame);
    }

    proc->glowFrame = (proc->glowFrame + 1) & 31;

    if (proc->state == 2 && proc->index == 1)
    {
        proc->leftArrowAnmCnt += proc->leftArrowSpeed;
        proc->rightArrowAnmCnt += proc->rightArrowSpeed;

        if (proc->leftArrowSpeed > 4)
        {
            proc->leftArrowSpeed--;
        }

        if (proc->rightArrowSpeed > 4)
        {
            proc->rightArrowSpeed--;
        }

        if ((GetGameTime() & 3) == 0)
        {
            if (proc->xLeftArrow < 0)
            {
                proc->xLeftArrow++;
            }

            if (proc->xRightArrow > 52)
            {
                proc->xRightArrow--;
            }
        }

        PutSprite(0, 70 + proc->xBase + proc->xLeftArrow, proc->yBase + 8, Sprite_8x16, ((proc->leftArrowAnmCnt >> 5) % 6) + oam2);
        PutSprite(
            0, 70 + proc->xBase + proc->xRightArrow, proc->yBase + 8, Sprite_8x16_HFlipped,
            ((proc->rightArrowAnmCnt >> 5) % 6) + oam2);

        PutSpriteExt(0, 75 + proc->xBase, proc->yBase + 8, SpriteArray_SioMenuTeamCount[gLinkArenaSt.unk_05], 0);
    }

    return;
}

ProcPtr StartSioMenuItem(ProcPtr parent, u8 xBase, u8 yBase, u8 index, u8 state)
{
    struct SioMenuItemProc * proc = Proc_Start(ProcScr_SioMenuItem, parent);

    proc->xBase = xBase;
    proc->yBase = yBase;
    proc->state = state;
    proc->index = index;
    proc->xLeftArrow = 0;
    proc->xRightArrow = 52;
    proc->rightArrowAnmCnt = 0;
    proc->leftArrowAnmCnt = 0;
    proc->rightArrowSpeed = 4;
    proc->leftArrowSpeed = 4;
    proc->unk_3e = 0;
    proc->glowFrame = 0;

    return proc;
}

void SioMenuItem_SetArrowConfig(struct SioMenuItemProc * proc, int xLeft, int xRight, int leftSpeed, int rightSpeed)
{
    proc->xLeftArrow = xLeft;
    proc->xRightArrow = xRight;
    proc->leftArrowSpeed = leftSpeed;
    proc->rightArrowSpeed = rightSpeed;

    return;
}

void SioMenuItem_SetPosition(struct SioMenuItemProc * proc, s16 x, s16 y)
{
    proc->xBase = x;
    proc->yBase = y;

    return;
}

void sub_080481E4(void)
{
    u16 * ptr = gUnknown_085ADDE8;

    const u8 gUnknown_080DA102[] =
    {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
        0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08,
        0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
    };

    if (gUnk_Sio_0203DDDC == 0)
    {
        int a = (GetGameTime() % 0x40);
        int idx = gUnknown_080DA102[a / 2];

        PAL_OBJ_COLOR(9, 15) = ptr[idx];
        EnablePalSync();
    }

    return;
}

void sub_08048240(void)
{
    u16 * ptr = gUnknown_085ADE48;

    const u8 sioMenuItemGlowLut[] =
    {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
        0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08,
        0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
    };

    if (gUnk_Sio_0203DDDC == 0)
    {
        int a = (GetGameTime() % 0x40);
        int idx = sioMenuItemGlowLut[a / 2];

        PAL_OBJ_COLOR(3, 14) = ptr[idx];
        EnablePalSync();
    }

    return;
}

void sub_08048298(struct SioProc85AAA78 * proc)
{
    int i;
    int oam2;

    if (gLinkArenaSt.unk_00 == 1)
    {
        if (proc->unk_44 != 0)
        {
            oam2 = OAM2_LAYER(1);
        }
        else
        {
            oam2 = OAM2_LAYER(3);
        }

        PutSprite(11, 80, 32, Sprite_LinkArena_TeamName, proc->unk_44 ? OAM2_LAYER(2) : OAM2_LAYER(1));

        for (i = 0; i < proc->unk_2c; i++)
        {
            PutSprite(4, proc->unk_30[i] + 8, 32 + i * 24, Sprite_LinkArena_NameBanner, OAM2_PAL(i) + oam2);

            if (proc->unk_3a[i] != 0)
            {
                PutSprite(4, proc->unk_30[i] + 8, 32 + i * 24, gUnknown_085AAA5E, oam2);
            }
        }

        if (proc->unk_40 != 0)
        {
            if (gUnk_Sio_0203DDDC == 0)
            {
                PAL_OBJ_COLOR(8, 13) = ((GetGameTime() % 0x40) / 4)[gUnknown_08A1BD40];
                EnablePalSync();
            }

            if (proc->unk_40 < 0x100)
            {
                proc->unk_40 += 0x10;
            }

            SetObjAffine(
                0,
                Div(+COS_Q12(0) * 16, 0x100),
                Div(-SIN_Q12(0) * 16, proc->unk_40),
                Div(+SIN_Q12(0) * 16, 0x100),
                Div(+COS_Q12(0) * 16, proc->unk_40)
            );

            PutSprite(4, 120, 0, Sprite_LinkArena_PressStart, OAM2_PAL(8));
        }

        sub_08048240();
    }
    else
    {
        PutSprite(0xb, 80, 32, Sprite_LinkArena_TeamName, 0);

        for (i = 0; i < proc->unk_2c; i++)
        {
            PutSprite(2, proc->unk_30[i], 40 + i * 16, gUnknown_085AAA48[proc->unk_3a[i]], 0);

            if (proc->unk_3a[i] != 0)
            {
                if (proc->unk_30[i] < 0)
                {
                    proc->unk_30[i]++;
                }
            }
            else if (proc->unk_30[i] > -8)
            {
                proc->unk_30[i]--;
            }
        }

        sub_080481E4();
    }

    if (gLinkArenaSt.unk_00 == 1)
    {
        oam2 = OAM2_LAYER(1);
    }
    else
    {
        oam2 = OAM2_LAYER(2);
    }

    if (proc->unk_44 != 0)
    {
        PutLinkArenaButtonSpriteAt(192, 16);
    }

    if (proc->unk_48 >= 0)
    {
        PutSprite(4, 80, proc->unk_48 + 8, gUnknown_085AAA0E, oam2);
    }

    return;
}

ProcPtr sub_08048504(struct SioTeamListProc * parent, int numActiveOptions, u8 * buf)
{
    struct SioProc85AAA78 * proc;
    int i;

    Proc_EndEach(ProcScr_085AAA78);
    proc = Proc_Start(ProcScr_085AAA78, parent);

    proc->unk_2c = numActiveOptions;
    proc->unk_44 = 1;
    proc->unk_40 = 0;
    proc->unk_48 = -1;

    for (i = 0; i < 5; i++)
    {
        proc->unk_3a[i] = buf[i];
        proc->unk_30[i] = -8;
    }

    StartLinkArenaMenuScrollBar(224, 40, parent->unk_38, 6, parent->yBg1 + 40, proc);
    PutLinkArenaTeamSprites(152, 40 - parent->unk_48 * 16, 136, 39, parent->unk_38, proc);

    return proc;
}

void LATeamSpriteDraw_Loop(struct LATeamSpriteDrawProc * proc)
{
    int i;
    int j;

    for (i = 0; i < proc->numTeams; i++)
    {
        int y = proc->yBase + i * 16;

        if (y >= proc->yMax)
        {
            continue;
        }

        if (y <= proc->yMin)
        {
            continue;
        }

        for (j = 0; j < 5; j++)
        {
            struct Unit * unit = GetUnit(i * 5 + j + 1);

            if (unit->pCharacterData == NULL)
            {
                continue;
            }

            sub_080263A0(4, proc->xBase + j * 14, y, OAM2_LAYER(1), unit);
        }
    }

    return;
}

void PutLinkArenaTeamSprites(int x, int y, int yMax, int yMin, int count, ProcPtr parent)
{
    struct LATeamSpriteDrawProc * proc;

    Proc_EndEach(ProcScr_LinkArenaTeamSpriteDraw);
    proc = Proc_Start(ProcScr_LinkArenaTeamSpriteDraw, parent);

    proc->numTeams = count;

    proc->xBase = x;
    proc->yBase = y;

    proc->yMin = yMin;
    proc->yMax = yMax;

    return;
}

void ScrollMultiArenaTeamSprites(int amount)
{
    struct LATeamSpriteDrawProc * proc = Proc_Find(ProcScr_LinkArenaTeamSpriteDraw);
    proc->yBase += amount;

    return;
}

void UpdateNameEntrySpriteGlow(void)
{
    int r2;
    int i;

    u16 * ptr = gUnknown_085ADE28;

    if (gUnk_Sio_0203DDDC == 0)
    {
        r2 = (GetGameTime() % 0x20);
        r2 = r2 >> 1;

        for (i = 0; i < 5; i++)
        {
            PAL_OBJ_COLOR(9, 11 + i) = ptr[(r2 + i) & 0xf];
        }

        EnablePalSync();
    }

    return;
}

void NameEntrySpriteDraw_Loop(struct NameEntrySpriteDrawProc * proc)
{
    int i;

    int x = (proc->xNew + proc->xCurrent) >> 1;
    int y = (proc->yNew + proc->yCurrent) >> 1;

    proc->xCurrent = x;
    proc->yCurrent = y;

    PutSprite(2, x, y, SpriteArray_NameEntryCursor[proc->cursorKind], 0);
    PutSprite(2, 96 + proc->xPointer, 48, Sprite_NameEntry_PositionIndicator, 0);
    if (CheckInLinkArena())
    {
        PutSprite(2, 96, 32, Sprite_LinkArena_TeamName, 0);
        PutSprite(4, 80, 32, Sprite_LinkArena_NameBanner, OAM2_LAYER(2));
    }
    else
    {
        PutSprite(2, 88, 32, Sprite_08B9A436, 0);
        PutSprite(4, 80, 32, Sprite_081D5618, OAM2_LAYER(2));
    }

    for (i = 3; i < 5; i++)
    {
        if ((proc->unk_44 == i) && (i < 3))
        {
            PutSprite(4, 196, 72 + i * 16, SpriteArray_NameEntryIcons[i], OAM2_PAL(4));
        }
        else
        {
            PutSprite(4, 196, 72 + i * 16, SpriteArray_NameEntryIcons[i], OAM2_PAL(8));
        }
    }

    UpdateNameEntrySpriteGlow();

    return;
}

ProcPtr StartNameEntrySpriteDraw(ProcPtr parent, int x, int y)
{
    struct NameEntrySpriteDrawProc * proc;

    Proc_EndEach(ProcScr_NameEntrySpriteDraw);
    proc = Proc_Start(ProcScr_NameEntrySpriteDraw, parent);

    proc->xNew = x;
    proc->xCurrent = x;

    proc->yNew = y;
    proc->yCurrent = y;

    proc->cursorKind = 0;
    proc->xPointer = 0;
    proc->unk_44 = 1;

    return proc;
}

void UpdateNameEntrySpriteDraw(void * proc, int xNew, int yNew, int xPointer, int cursorKind, int f)
{
    struct NameEntrySpriteDrawProc * param_1 = proc;

    param_1->xNew = xNew;
    param_1->yNew = yNew;
    param_1->cursorKind = cursorKind;
    param_1->xPointer = xPointer;
    param_1->unk_44 = f;

    return;
}

void RuleSettingSprites_Interactive_Loop(struct RuleSettingSpriteDrawProc * proc)
{
    int i;

    int y1 = proc->yNew;
    int y2 = proc->yPrevious;
    int y = (y1 + y2) * 12;

    proc->yPrevious = proc->yNew;

    for (i = 0; i < 3; i++)
    {
        PutSprite(2, 32, 48 + i * 24, SpriteArray_RuleSettingIcons[i], 0);
    }

    DisplayFrozenUiHand(32, y + 48);
    PutUiHand(proc->xOption, proc->yOption);

    PutLinkArenaButtonSpriteAt(192, 16);

    return;
}

ProcPtr StartRuleSettingSpriteDrawInteractive(ProcPtr parent)
{
    struct RuleSettingSpriteDrawProc * proc;

    Proc_EndEach(ProcScr_RuleSettingSpriteDraw_Interactive);
    proc = Proc_Start(ProcScr_RuleSettingSpriteDraw_Interactive, parent);

    proc->yPrevious = 0;

    return proc;
}

void UpdateRuleSettingSprites(ProcPtr proc, s16 b, s16 xOption, s16 yOption)
{
    struct RuleSettingSpriteDrawProc * param_1 = proc;

    param_1->yNew = b;
    param_1->xOption = xOption;
    param_1->yOption = yOption;

    return;
}

void UpdateSioMenuBurstGlow(int idx)
{
    u16 * ptr = gUnknown_085ADE28;

    if (gUnk_Sio_0203DDDC == 0)
    {
        PAL_OBJ_COLOR(6, 14) = ptr[idx];
        EnablePalSync();
    }

    return;
}

void SioMenuBurstFx_Loop(struct SioMenuBurstFxProc * proc)
{
    int idx;
    int x;
    int y;
    int r1;

    idx = proc->glowPalIdx * 2;

    UpdateSioMenuBurstGlow(proc->glowPalIdx);

    x = gUnknown_080DA1CA[idx + 1];
    r1 = proc->xBase - x;

    y = gUnknown_080DA1CA[idx + 0];

    PutSprite(2, r1, proc->yBase - y, Sprite_SioMenuBurst_TopLeft, 0);
    PutSprite(2, proc->xBase + x + 16, proc->yBase - y, Sprite_SioMenuBurst_TopRight, 0);
    PutSprite(2, proc->xBase - x, proc->yBase + y, Sprite_SioMenuBurst_BottomLeft, 0);
    PutSprite(2, proc->xBase + x + 16, proc->yBase + y, Sprite_SioMenuBurst_BottomRight, 0);

    proc->glowPalIdx++;

    if (proc->glowPalIdx == 15)
    {
        Proc_Break(proc);
    }

    return;
}

ProcPtr StartSioMenuBurstFx(ProcPtr parent, int x, int y)
{
    struct SioMenuBurstFxProc * proc = Proc_Start(ProcScr_SioMenuBurstFx, parent);

    proc->xBase = x;
    proc->yBase = y;
    proc->glowPalIdx = 0;

    // return proc; // BUG
}

void LinkArenaMenuScroll_Init(struct LAMenuScrollBarProc * proc)
{
    proc->oam2Arrows[1] = 0;
    proc->oam2Arrows[0] = 0;

    proc->unk_38 = (proc->unk_34 * proc->unk_3d * 8) / proc->unk_3c;
    proc->unk_42 = (proc->unk_34 * 0x800) / (proc->unk_3c * 16);

    return;
}

void LinkArenaMenuScroll_Loop(struct LAMenuScrollBarProc * proc)
{
    int i;
    int buf[2];

    int r8 = proc->xBase;
    int sl = proc->yBase + 8;
    int sp_10 = proc->unk_38 >> 3;
    int sp_14 = 8 - (proc->unk_38 & 7);
    int sp_18 = (proc->unk_3e * proc->unk_42) >> 8;

    if (proc->unk_3c > proc->unk_3d)
    {
        proc->oam2Arrows[0]++;
        proc->oam2Arrows[1]++;

        if (proc->unk_3e < proc->unk_40)
        {
            proc->oam2Arrows[0] += 2;
        }

        if (proc->unk_3e > proc->unk_40)
        {
            proc->oam2Arrows[1] += 2;
        }

        for (i = 0; i < 2; i++)
        {
            if (proc->oam2Arrows[i] > 48)
            {
                proc->oam2Arrows[i] = 0;
            }

            buf[i] = (proc->oam2Arrows[i] / 8) % 6;
        }

        if (proc->unk_3e != 0)
        {
            PutSprite(3, r8, sl - 9, Sprite_LAMenuScrollBar_DownArrow, buf[0]);
        }

        if (((proc->unk_3e / 16) + proc->unk_3d) < proc->unk_3c)
        {
            PutSprite(3, r8, proc->unk_34 * 8 + sl + 1, Sprite_LAMenuScrollBar_UpArrow, buf[1]);
        }

        for (i = 0; i < proc->unk_34; i++)
        {
            PutSprite(2, r8, sl + i * 8, Sprite_LinkArenaMenuScrollBar, 1);
        }

        for (i = 0; i < sp_10; i++)
        {
            PutSprite(2, r8, (sl + sp_18) + i * 8, Sprite_LinkArenaMenuScrollBar, 0);
        }

        PutSprite(2, r8, (sl + sp_18) + (sp_10 * 8) - sp_14, Sprite_LinkArenaMenuScrollBar, 0);
        PutSprite(2, r8, sl - 8, Sprite_LinkArenaMenuScrollBar, 2);
        PutSprite(2, r8 + 0x2000, proc->unk_34 * 8 + sl - 7, Sprite_LinkArenaMenuScrollBar, 2);

        proc->unk_40 = proc->unk_3e;
    }

    return;
}

void StartLinkArenaMenuScrollBar(int xBase, int yBase, u8 c, u8 d, u8 e, ProcPtr parent)
{
    struct LAMenuScrollBarProc * proc;

    Proc_EndEach(ProcScr_LinkArenaMenuScrollBar);
    proc = Proc_Start(ProcScr_LinkArenaMenuScrollBar, parent);

    proc->xBase = xBase;
    proc->yBase = yBase;

    proc->unk_34 = d * 2 - 2;

    proc->unk_3c = c;
    proc->unk_3d = d;
    proc->unk_3e = e;
    proc->unk_40 = e;

    return;
}

void UpdateLinkArenaMenuScrollBar(u8 a, s16 b)
{
    struct LAMenuScrollBarProc * proc = Proc_Find(ProcScr_LinkArenaMenuScrollBar);

    if (proc == NULL)
    {
        return;
    }

    proc->unk_3c = a;
    proc->unk_3e = b & 0xff;
    proc->unk_38 = (proc->unk_34 * proc->unk_3d * 8) / proc->unk_3c;
    proc->unk_42 = (proc->unk_34 * 0x800) / (proc->unk_3c * 16);

    return;
}

void LAPhaseIntro_Init(void)
{
    Decompress(Img_LAPhaseIntroSquares, (void *)(VRAM + 0x2000));

    switch (gPlaySt.faction)
    {
    case 0:
        Decompress(Img_LAPhaseIntro_P1, (void *)(VRAM + 0x2800));
        ApplyPalette(Pal_LAPhaseIntro_P1, 5);
        break;

    case 1:
        Decompress(Img_LAPhaseIntro_P2, (void *)(VRAM + 0x2800));
        ApplyPalette(Pal_LAPhaseIntro_P2, 5);
        break;

    case 2:
        Decompress(Img_LAPhaseIntro_P3, (void *)(VRAM + 0x2800));
        ApplyPalette(Pal_LAPhaseIntro_P3, 5);
        break;

    case 3:
        Decompress(Img_LAPhaseIntro_P4, (void *)(VRAM + 0x2800));
        ApplyPalette(Pal_LAPhaseIntro_P4, 5);
        break;
    }

    gUnknown_03001860 = gPlaySt.faction;
    gPlaySt.faction = FACTION_BLUE;

    return;
}

void LAPhaseIntro_End(void)
{
    gPlaySt.faction = gUnknown_03001860;

    SetWinEnable(0, 0, 0);
    SetBlendNone();

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    return;
}

void LAPhaseIntro_StartBgm(void)
{
    StartBgm(0x49, &gMPlayInfo_BGM2);
    return;
}

void sub_08048DF4(struct Unit * unit, int itemSlot)
{
    u16 item = unit->items[itemSlot];

    if (item != 0)
    {
        unit->items[itemSlot] = item | 0xff00;
    }

    return;
}

void sub_08048E0C(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        sub_08048DF4(unit, i);
    }

    return;
}

void sub_08048E28(void)
{
    int idx;
    int i;

    u16 * ptr = Pal_LinkArenaActiveBannerFx;

    if (gUnk_Sio_0203DDDC == 0)
    {
        idx = (GetGameTime() % 0x20);
        idx = idx >> 1;

        for (i = 0; i < 15; i++)
        {
            PAL_OBJ_COLOR(9, 1 + i) = ptr[(idx + i) & 15];
        }

        EnablePalSync();
    }

    return;
}

void LAVersusSpriteDraw_Loop(struct LAVersusSpriteDrawProc * proc)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        PutSprite(4, proc->x, proc->yBase + i * 24, Sprite_LinkArena_NameBanner, OAM2_PAL(i) + OAM2_LAYER(2));

        SetObjAffine(
            i,
            Div(+COS_Q12(0) * 16, 0x100),
            Div(-SIN_Q12(0) * 16, 0x100),
            Div(+SIN_Q12(0) * 16, 0x100),
            Div(+COS_Q12(0) * 16, 0x100)
        );

        if (proc->unk_38 != -1)
        {
            if (proc->unk_38 != i)
            {
                if (proc->unk_3c[i] > 0x100)
                {
                    proc->unk_3c[i] -= 8;
                }

                if (proc->unk_38 == i)
                {
                    goto _0804D544;
                }
            }
            else
            {
            _0804D544:
                if (proc->unk_3c[i] <= 335)
                {
                    proc->unk_3c[i] += 8;
                }
            }

            SetObjAffine(
                i,
                Div(+COS_Q12(0) * 16, proc->unk_3c[i]),
                Div(-SIN_Q12(0) * 16, proc->unk_3c[i]),
                Div(+SIN_Q12(0) * 16, proc->unk_3c[i]),
                Div(+COS_Q12(0) * 16, proc->unk_3c[i])
            );
        }

        PutSprite(4, proc->x - 48, proc->yBase + i * 24, SpriteArray_LAVersusPlayerNumbers[i], 0);
    }

    if (proc->unk_34 != -1)
    {
        PutSprite(4, proc->x - 64, proc->yBase + proc->unk_34 * 24 + 8, Sprite_080DA25C, 0);
        PutSprite(4, proc->x - 64, proc->yBase + proc->unk_34 * 24 + 18, Sprite_080DA26A, 0);
        sub_08048E28();
    }

    return;
}

ProcPtr StartLinkArenaVersusSpriteDraw(int x, int y, ProcPtr parent)
{
    struct LAVersusSpriteDrawProc * proc;
    int i;

    Proc_EndEach(ProcScr_LAVersusSpriteDraw);
    proc = Proc_Start(ProcScr_LAVersusSpriteDraw, parent);

    proc->x = x;
    proc->yBase = y;
    proc->unk_34 = -1;
    proc->unk_38 = -1;

    for (i = 0; i < 4; i++)
    {
        proc->unk_3c[i] = 0x100;
    }

    return proc;
}

void EndLinkArenaVersusSpriteDraw(void)
{
    Proc_EndEach(ProcScr_LAVersusSpriteDraw);
    return;
}

ProcPtr GetLinkArenaVersusSpriteDraw(void)
{
    return Proc_Find(ProcScr_LAVersusSpriteDraw);
}

void sub_080490D4(void)
{
    int idx;
    int i;

    u16 * ptr = Pal_LinkArenaActiveBannerFx;

    if (gUnk_Sio_0203DDDC == 0)
    {
        idx = GetGameTime() % 0x20;
        idx = idx >> 1;

        for (i = 0; i < 15; i++)
        {
            PAL_BG_COLOR(2, 1 + i) = ptr[(idx + i) & 15];
        }

        EnablePalSync();
    }

    return;
}

void sub_08049124(void)
{
    int idx;
    int i;

    u16 * ptr = Pal_LinkArenaActiveBannerFx;

    if (gUnk_Sio_0203DDDC == 0)
    {
        idx = GetGameTime() % 0x20;
        idx = idx >> 1;

        for (i = 0; i < 15; i++)
        {
            PAL_OBJ_COLOR(3, 1 + i) = ptr[(idx + i) & 15];
        }

        EnablePalSync();
    }

    return;
}

void sub_08049178(void)
{
    SetBlendAlpha(8, 12);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 0);

    return;
}

void sub_080491C4(struct SioProc85AABD8 * proc)
{
    if (proc->y > 30 && proc->y < 153)
    {
        PutSprite(4, proc->x, proc->y, Sprite_080DA27E, 0);
        sub_08049124();
    }

    return;
}

ProcPtr sub_080491F0(int x, int y, ProcPtr parent)
{
    struct SioProc85AABD8 * proc;

    Proc_EndEach(ProcScr_085AABD8);
    proc = Proc_Start(ProcScr_085AABD8, parent);

    proc->x = x;
    proc->y = y;

    return proc;
}

void sub_08049220(void)
{
    Decompress(gGfx_SupportMenu, gUnknown_0200118C);
    sub_08047CB8(gUnknown_0200118C, (void *)(0x06016800), 6, 4);
    ApplyPalette(gPal_SupportMenu, 0x12);
    return;
}

void PutLinkArenaChoiceBannerSprite(int x, int y)
{
    PutSprite(1, x, y, Sprite_LinkArena_ChoiceBanner, 0);
    return;
}
