#include "gbafe.h"

struct SioProc85AA83C {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ struct MuProc * muProc;
};

struct SioWarpProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ struct Unit * unit;
    /* 30 */ struct MuProc * muProc;
    /* 34 */ int x;
    /* 38 */ int y;
    /* 3C */ int facing;
    /* 40 */ u8 unk_40;
    /* 41 */ s8 playStepSe;
};

struct SioProc85AA954 {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int x;
    /* 30 */ int y;
};

extern u16 * CONST_DATA PalArray_SolidColors[];
extern const struct ProcCmd ProcScr_085AA83C[];
extern struct ProcCmd ProcScr_MuDeathFade[];
extern struct ProcCmd ProcScr_MuRestorePalInfo[];

extern u8 CONST_DATA Img_LinkArenaWarpFx[];
extern u16 CONST_DATA Pal_LinkArenaWarpFx[];
extern u16 CONST_DATA Img_ManimWarpFlashyFrames[];
extern u8 CONST_DATA gUnknown_085AA854[];

extern const struct ProcCmd ProcScr_SIOWARP[];
extern const struct ProcCmd ProcScr_SIOWARPFX[];
extern const struct ProcCmd ProcScr_SioWarpFxPartial[];
extern const struct ProcCmd ProcScr_LAButtonSpriteDraw[];

extern u16 const Sprite_LinkArenaBButton[];

void sub_08047670(struct MuProc * muProc, int kind)
{
    struct SioProc85AA83C * proc;

    ApplyPalette(PalArray_SolidColors[kind], 0x16);

    muProc->sprite_anim->oam2 = muProc->config->chr + 0x6800;
    StartPalFade(gPal + (muProc->config->pal + 0x10) * 0x10, 0x16, 0x14, muProc);

    proc = Proc_Start(ProcScr_085AA83C, muProc);
    proc->muProc = muProc;
}

void sub_080476C8(struct SioProc85AA83C * proc)
{
    proc->muProc->sprite_anim->oam2 =
        OAM2_PAL(proc->muProc->config->pal) + proc->muProc->config->chr + 0x800;
}

void StartLinkArenaMUDeathFade(struct MuProc * muProc)
{
    struct MuEffectProc * muEffectProc;

    muProc->state = MU_STATE_DEATHFADE;

    muEffectProc = Proc_Start(ProcScr_MuDeathFade, muProc);
    muEffectProc->mu = muProc;
    muEffectProc->time_left = 32;

    SetBlendConfig(0, (u16) muEffectProc->time_left / 2, 16, 0);

    muProc->sprite_anim->clock = 0;
    muProc->sprite_anim->clock_interval_q8 = 0;

    sub_08047670(muProc, 0);

    muProc->sprite_anim->layer = 13;

    PlaySoundEffect(0xD6);
}

void sub_08047768(struct MuProc * muProc, int palIdx)
{
    muProc->sprite_anim->oam2 = muProc->config->chr + 0x6800;

    ApplyPalette(gPal + (muProc->config->pal + 0x10) * 0x10, 0x16);
    StartPalFade(PalArray_SolidColors[palIdx], 0x16, 8, muProc);
}

void StartMuRestorePalInfo(struct MuProc * muProc)
{
    struct MuEffectProc * muEffectProc;

    StartPalFade(gPal + (muProc->config->pal + 0x10) * 0x10, 0x16, 8, muProc);
    muEffectProc = Proc_Start(ProcScr_MuRestorePalInfo, PROC_TREE_3);
    muEffectProc->mu = muProc;
}

void SioWarp_Init(struct SioWarpProc * proc)
{
    Decompress(Img_LinkArenaWarpFx, (void *) (0x06004400));
    ApplyPalette(Pal_LinkArenaWarpFx, 3);

    proc->unk_40 = 0;

    if (proc->playStepSe)
        StartPlayMuStepSe(0x7f, 2, proc->x * 8);
}

void SioWarp_Loop(struct SioWarpProc * proc)
{
    sub_080148FC(
        gBg2Tm, proc->x - 1, proc->y - 3, 0x3220, 4, 6, Img_ManimWarpFlashyFrames,
        gUnknown_085AA854[proc->unk_40]);

    EnableBgSync(BG2_SYNC_BIT);

    proc->unk_40++;

    if (gUnknown_085AA854[proc->unk_40] == 0xFF)
        Proc_Break(proc);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 0;
    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg3_ct.priority = 3;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 0, 1, 1);

    SetBlendAlpha(12, 12);
}

void SioWarp_End(void)
{
    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    SetBlendNone();
}

void SioWarpFx_StartSioWarp(struct SioWarpProc * parent)
{
    struct SioWarpProc * proc = Proc_Start(ProcScr_SIOWARP, PROC_TREE_2);

    proc->x = parent->unit->xPos * 2;
    proc->y = parent->unit->yPos * 2;

    proc->playStepSe = parent->playStepSe;
}

void SioWarpFx_804C178(struct SioWarpProc * proc)
{
    sub_08047768(proc->muProc, 0);
}

void SioWarpFx_HideMoveUnit(struct SioWarpProc * proc)
{
    HideMu(proc->muProc);
}

void SioWarpFx_SetMUPosition(struct SioWarpProc * proc)
{
    SetMuScreenPosition(proc->muProc, proc->x * 16, proc->y * 16);

    proc->unit->xPos = proc->x;
    proc->unit->yPos = proc->y;
}

void SioWarpFx_ShowMoveUnit(struct SioWarpProc * proc)
{
    if (proc->facing != -1)
        SetMuFacing(proc->muProc, proc->facing);

    ShowMu(proc->muProc);
}

void SioWarpFx_804C1D8(struct SioWarpProc * proc)
{
    StartMuRestorePalInfo(proc->muProc);
}

void SioWarpFx_AwaitSioWarp(ProcPtr proc)
{
    s8 found = Proc_Find(ProcScr_SIOWARP) != NULL;

    if (!found)
        Proc_Break(proc);
}

ProcPtr StartSioWarpFx(struct Unit * unit, struct MuProc * muProc, int x, int y, int facing, u8 playStepSe, ProcPtr parent)
{
    struct SioWarpProc * proc;

    if (parent != NULL)
        proc = Proc_StartBlocking(ProcScr_SIOWARPFX, parent);
    else
        proc = Proc_Start(ProcScr_SIOWARPFX, PROC_TREE_2);

    proc->unit = unit;
    proc->muProc = muProc;
    proc->x = x;
    proc->y = y;
    proc->facing = facing;
    proc->playStepSe = playStepSe;

    return proc;
}

ProcPtr StartSioWarpFxPartial(struct Unit * unit, struct MuProc * muProc, int x, int y, int facing, u8 playStepSe, ProcPtr parent)
{
    struct SioWarpProc * proc;

    if (parent != NULL)
        proc = Proc_StartBlocking(ProcScr_SioWarpFxPartial, parent);
    else
        proc = Proc_Start(ProcScr_SioWarpFxPartial, PROC_TREE_2);

    proc->unit = unit;
    proc->muProc = muProc;
    proc->x = x;
    proc->y = y;
    proc->facing = facing;
    proc->playStepSe = playStepSe;

    return proc;
}

void PutLinkArenaButtonSpriteAt(int x, int y)
{
    PutSprite(4, x, y, Sprite_LinkArenaBButton, 0);
}

void LAButtonSprites_Loop(struct SioProc85AA954 * proc)
{
    PutLinkArenaButtonSpriteAt(proc->x, proc->y);
}

void StartLinkArenaButtonSpriteDraw(int x, int y, ProcPtr parent)
{
    struct SioProc85AA954 * proc;

    Proc_EndEach(ProcScr_LAButtonSpriteDraw);

    proc = Proc_Start(ProcScr_LAButtonSpriteDraw, parent);

    proc->x = x;
    proc->y = y;
}

void EndLinkArenaButtonSpriteDraw(void)
{
    if (Proc_Find(ProcScr_LAButtonSpriteDraw) != NULL)
        Proc_EndEach(ProcScr_LAButtonSpriteDraw);
}

SECTION(".rodata.08B9A298")
const struct ProcCmd ProcScr_SIOWARP[] = {
    PROC_19,
    PROC_SLEEP(0),
    PROC_CALL(SioWarp_Init),
    PROC_REPEAT(SioWarp_Loop),
    PROC_CALL(SioWarp_End),
    PROC_END,
};

SECTION(".rodata.08B9A2C8")
const struct ProcCmd ProcScr_SIOWARPFX[] = {
    PROC_19,
    PROC_SLEEP(0),
    PROC_CALL(SioWarpFx_StartSioWarp),
    PROC_SLEEP(5),
    PROC_CALL(SioWarpFx_804C178),
    PROC_SLEEP(15),
    PROC_CALL(SioWarpFx_HideMoveUnit),
    PROC_SLEEP(1),
    PROC_CALL(SioWarpFx_SetMUPosition),
    PROC_CALL(SioWarpFx_StartSioWarp),
    PROC_SLEEP(5),
    PROC_CALL(SioWarpFx_ShowMoveUnit),
    PROC_CALL(SioWarpFx_804C1D8),
    PROC_REPEAT(SioWarpFx_AwaitSioWarp),
    PROC_END,
};

SECTION(".rodata.08B9A340")
const struct ProcCmd ProcScr_SioWarpFxPartial[] = {
    PROC_SLEEP(0),
    PROC_CALL(SioWarpFx_HideMoveUnit),
    PROC_SLEEP(1),
    PROC_CALL(SioWarpFx_SetMUPosition),
    PROC_CALL(SioWarpFx_StartSioWarp),
    PROC_SLEEP(5),
    PROC_CALL(SioWarpFx_ShowMoveUnit),
    PROC_END,
};

SECTION(".rodata.08B9A380")
const struct ProcCmd ProcScr_LAButtonSpriteDraw[] = {
    PROC_SLEEP(0),
    PROC_REPEAT(LAButtonSprites_Loop),
    PROC_END,
};

SECTION(".rodata.08B9A268")
const struct ProcCmd ProcScr_085AA83C[] = {
    PROC_SLEEP(17),
    PROC_CALL(sub_080476C8),
    PROC_END,
};
