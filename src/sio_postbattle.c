#include "gbafe.h"
#include "gbafe/sio_core.h"

// ROM data referenced below, defined in data/ (see tools/datasplit.py)
extern const u8 gUnk_081D5298[];
extern const u8 gUnk_081D52A0[];
extern const u8 gUnk_081D52A8[];
extern const u8 gUnk_081D52B0[];
extern const u8 gUnk_081D52B8[];
extern const u8 gUnk_081D52C0[];
extern const u8 gUnk_081D52CE[];
extern const u8 gUnk_081D52D6[];

// FE8U: sio_postbattle.c

/**
 * Battle result screen for the Link Arena.
 * Not to be confused with "sio_result.c", which refers to the
 * "Battle Data" UI.
 */

extern s16 const gUnknown_080D9E1C[][4];

extern u8 const gUnknown_080D9E44[];

extern struct Text gUnk_Sio_0203DB1C[];
extern const u8 gUnknown_085ADE88[];
extern const u8 Img_LinkArenaPlayerBanners[];
extern const u8 Img_LinkArenaPlacementRanks[];
extern const u16 Pal_LinkArenaPlacementRanks[];
extern const u8 Img_LinkArenaActiveBannerFx[];
extern const u16 Pal_LinkArenaActiveBannerFx[];
extern const u8 Img_LinkArenaPostBattleBg[];
extern const u16 Pal_LinkArenaPostBattleBg[];
extern const u8 Tsa_LinkArenaPostBattleBg[];

void sub_080440E8(struct SioProc85A971C_Unk44 * buf);
void sub_080490D4(void);
extern u16 const Sprite_080D9DE4[];
extern u16 const Sprite_080D9E06[];
extern u16 const Sprite_081D52E6[];
extern u16 const Sprite_080D9DF2[];
extern u16 const Sprite_080D9E0E[];

void FE6Link_Init(ProcPtr proc);
void Set_0203DDDC(ProcPtr proc);

CONST_DATA u16 const * SpriteArray_085A96D4[] = {
    (u16 const *) gUnk_081D5298,
    (u16 const *) gUnk_081D52A0,
    (u16 const *) gUnk_081D52A8,
    (u16 const *) gUnk_081D52B0,
};

CONST_DATA u16 const * SpriteArray_085A96E4[] = {
    (u16 const *) gUnk_081D52B8,
    (u16 const *) gUnk_081D52C0,
    (u16 const *) gUnk_081D52CE,
    (u16 const *) gUnk_081D52D6,
};

CONST_DATA struct ProcCmd ProcScr_LinkArenaPostBattle_DrawSprites[] = {
    PROC_YIELD,
    PROC_CALL(SioPostBattleSprites_Init),
    PROC_REPEAT(SioPostBattleSprites_Loop_DrawSlideIn),
    PROC_REPEAT(SioPostBattleSprites_Loop_DrawStatic),
    PROC_END,
    PROC_CALL(SioPostBattle_Init),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,
    PROC_CALL(FE6Link_Init),
    PROC_REPEAT(SioPostBattle_Loop_Main),
    PROC_REPEAT(SioPostBattle_AwaitAPress),
    PROC_CALL(Set_0203DDDC),
    PROC_CALL(sub_08014170),
    PROC_YIELD,
    PROC_CALL(StartBmVSync),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_SioPostBattle_PlayMusic[] = {
    PROC_SLEEP(16),
    PROC_CALL(SioPostBattleMusic_PlayFanfare),
    PROC_SLEEP(210),
    PROC_CALL(SioPostBattleMusic_PlayStandardBgm),
    PROC_END,
};

//! FE8U = 0x08045208
void SioPostBattleSprites_Init(struct SioPostBattleSpritesProc * proc)
{
    UnpackFaceChibiSprGraphics(proc->fid, proc->oam2 * 8 + 0x180, proc->oam2 + 10);
    proc->timer = 0;
    proc->y = -38;
    return;
}

//! FE8U = 0x08045234
void SioPostBattleSprites_Loop_DrawSlideIn(struct SioPostBattleSpritesProc * proc)
{
    struct SioPostBattleProc * unk2C = proc->unk_2c;

    if (unk2C->unk_64 == 0)
    {
        if (proc->timer > 32)
        {
            Proc_Break(proc);
        }
    }

    if (unk2C->unk_64 != 0)
    {
        proc->y++;
    }

    proc->delayMaybe--;

    if (proc->delayMaybe < 0)
    {
        proc->delayMaybe = 0;
    }

    if (proc->delayMaybe == 0)
    {
        if (proc->timer <= 32)
        {
            proc->x = Interpolate(INTERPOLATE_RSQUARE, -80, 0, proc->timer, 32);
        }

        proc->timer++;

        PutSprite(4, proc->x, proc->y - 16, SpriteArray_085A96E4[proc->ranking], 0);
        PutSprite(4, proc->x + 72, proc->y - 6, SpriteArray_085A96D4[proc->oam2], 0);
        PutSprite(4, proc->x + 96, proc->y + 8, Sprite_080D9DE4, 0);
        PutSprite(4, proc->x + 64, proc->y + 8, Sprite_080D9E06, proc->ranking * 4 + 0x50);
        PutSprite(4, -proc->x + 112, proc->y - 8, Sprite_081D52E6, OAM2_PAL(proc->oam2) + 0x400);
        PutSprite(4, -proc->x + 124, proc->y, Sprite_080D9DF2, proc->oam2 == 3 ? 0x40 : proc->oam2 * 9);
        PutSprite(
            5, -proc->x + 208, proc->y - 8, Sprite_080D9E0E, OAM2_PAL(proc->oam2 + 10) + 0x180 + (proc->oam2 << 3));
    }

    return;
}

//! FE8U = 0x0804538C
void SioPostBattleSprites_Loop_DrawStatic(struct SioPostBattleSpritesProc * proc)
{
    PutSprite(4, proc->x, proc->y - 16, SpriteArray_085A96E4[proc->ranking], 0);
    PutSprite(4, proc->x + 72, proc->y - 6, SpriteArray_085A96D4[proc->oam2], 0);
    PutSprite(4, proc->x + 96, proc->y + 8, Sprite_080D9DE4, 0);
    PutSprite(4, proc->x + 64, proc->y + 8, Sprite_080D9E06, proc->ranking * 4 + 0x50);
    PutSprite(4, -proc->x + 112, proc->y - 8, Sprite_081D52E6, OAM2_PAL(proc->oam2) + 0x400);
    PutSprite(4, -proc->x + 124, proc->y, Sprite_080D9DF2, proc->oam2 == 3 ? 0x40 : proc->oam2 * 9);
    PutSprite(5, -proc->x + 208, proc->y - 8, Sprite_080D9E0E, OAM2_PAL(proc->oam2 + 10) + 0x180 + (proc->oam2 << 3));

    return;
}

//! FE8U = 0x08045494
ProcPtr StartDrawLinkArenaRankSprites(struct SioPostBattleProc * parent, int delayMaybe, u16 fid, u8 oam2, u8 ranking)
{
    struct SioPostBattleSpritesProc * proc = Proc_Start(ProcScr_LinkArenaPostBattle_DrawSprites, parent);

    proc->unk_2c = parent;
    proc->delayMaybe = delayMaybe;
    proc->fid = fid;
    proc->ranking = ranking;
    proc->oam2 = oam2;

    return proc;
}

//! FE8U = 0x080454E4
void sub_0803FE24(struct SioPostBattleProc * proc)
{
    int i;

    int unk_40 = proc->unk_40;
    u16 * tm = gBg2Tm;

    if (proc->playerId == proc->unk_44[(proc->unk_41 - 1)].playerId)
    {
        TmApplyTsa_thm(
            tm + TM_OFFSET(0, gUnknown_080D9E1C[unk_40][(proc->unk_41 - 1)]), gUnknown_085ADE88, 0x2060);
    }
    else
    {
        for (i = 0; i < 0x60; i++)
        {
            tm[TM_OFFSET(i, gUnknown_080D9E1C[unk_40][(proc->unk_41 - 1)])] = 0x1034;
        }
    }

    return;
}

//! FE8U = 0x0804556C
void sub_0803FEAC(struct SioPostBattleProc * proc)
{
    int i;

    int unk_40 = proc->unk_40;
    SetTextFont(&Font_Sio_02000C60);

    for (i = 0; i < unk_40; i++)
    {
        char * str = gUnk_Sio_0203DAC5[i];

        int len = GetStringTextLen(str);
        len = (72 - len) / 2;

        if (i < 3)
        {
            Text_InsertDrawString(Texts_0203DB14, 72 * i + len, 0, str);
        }
        else
        {
            Text_InsertDrawString(gUnk_Sio_0203DB1C, len, 0, str);
        }

        SioDrawNumber(gUnk_Sio_0203DB1C, i * 32 + 152, 2, proc->unk_44[i].points);
    }

    return;
}

//! FE8U = 0x08045610
ProcPtr SioPostBattle_StartMusicProc(struct SioPostBattleProc * parent)
{
    struct SioPostBattleMusicProc * proc = Proc_Start(ProcScr_SioPostBattle_PlayMusic, parent);

    if (parent->playerId == parent->unk_44[0].playerId)
    {
        proc->isPlayerWinner = 1;
    }
    else
    {
        proc->isPlayerWinner = 0;
    }

    return proc;
}

//! FE8U = 0x08045640
void SioPostBattle_Init(struct SioPostBattleProc * proc)
{
    int i;

    ClearSioBG();
    InitSioBG();

    Decompress(Img_TacticianSelObj, (void *)((VRAM + 0x14800)));
    Decompress(Img_LinkArenaPlayerBanners, (void *)((VRAM + 0x16000)));
    Decompress(Img_LinkArenaPlacementRanks, (void *)((VRAM + 0x16800)));

    ApplyPalettes(Pal_TacticianSelObj, 0x13, 4);
    ApplyPalette(Pal_LinkArenaPlacementRanks, 0x17);

    Decompress(Img_LinkArenaActiveBannerFx, (void *)((VRAM + 0xC00)));
    ApplyPalette(Pal_LinkArenaActiveBannerFx, 2);

    Decompress(Img_LinkArenaPostBattleBg, (void *)(VRAM + GetBgChrOffset(3)));
    ApplyPalettes(Pal_LinkArenaPostBattleBg, 10, 4);
    TmApplyTsa_thm(gBg3Tm, Tsa_LinkArenaPostBattleBg, 0);

    InitSpriteTextFont(&Font_Sio_02000C60, (void *)((VRAM + 0x12000)), 0xe);
    ApplyPalette(Pal_Text, 0x1E);
    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);
    ResetTextFont();

    for (i = 0; i < 2; i++)
    {
        InitSpriteText(&Texts_0203DB14[i]);
        SpriteText_DrawBackgroundExt(&Texts_0203DB14[i], 0);
    }

    proc->unk_40 = gSioSt->unk_007;
    proc->unk_41 = gSioSt->unk_007;
    proc->playerId = gSioSt->selfId;

    CpuFill16(0, proc->unk_44, sizeof(proc->unk_44));
    sub_080440E8(proc->unk_44);

    sub_0803FEAC(proc);

    proc->unk_64 = 176;

    SetBgOffset(2, 0, 176);

    SetWinEnable(0, 0, 0);

    SetBlendAlpha(8, 8);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SioPostBattle_StartMusicProc(proc);

    EnableBgSync(BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x080457F8
void SioPostBattle_Loop_Main(struct SioPostBattleProc * proc)
{
    int fid;

    int unk_40 = proc->unk_40;

    proc->unk_64--;
    SetBgOffset(2, 0, proc->unk_64);

    sub_080490D4();

    if (proc->unk_41 != 0)
    {
        if ((proc->unk_64 >> 3) == (gUnknown_080D9E1C[unk_40][(proc->unk_41 - 1)] + 4))
        {
            sub_0803FE24(proc);
            EnableBgSync(BG2_SYNC_BIT);

            fid = gUnk_Sio_0203DD90.unk_24[proc->unk_44[(proc->unk_41 - 1)].playerId];
            proc->unk_2c[(proc->unk_41 - 1)] =
                StartDrawLinkArenaRankSprites(proc, 40, fid, proc->unk_44[(proc->unk_41 - 1)].playerId, (proc->unk_41 - 1));

            proc->unk_41--;
        }
    }

    if (proc->unk_64 == 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0804589C
void SioPostBattle_AwaitAPress(ProcPtr proc)
{
    sub_080490D4();

    if ((gpKeySt->pressed & A_BUTTON) != 0)
    {
        m4aMPlayFadeOut(gMPlayTable[gSongTable[0x81].ms].info, 1);
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd CONST_DATA ProcScr_SioPostBattle[];

//! FE8U = 0x080458E8
void SioPostBattleMusic_PlayFanfare(struct SioPostBattleMusicProc * proc)
{
    if (proc->isPlayerWinner != 0)
    {
        StartBgmExt(0x2D, 0, 0);
    }
    else
    {
        StartBgmExt(0x2E, 0, 0);
    }

    PlaySoundEffect(0x81);

    return;
}

//! FE8U = 0x08045920
void SioPostBattleMusic_PlayStandardBgm(void)
{
    StartBgmExt(0x2E, 0, 0);
    return;
}

