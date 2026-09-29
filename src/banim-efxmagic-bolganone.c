#include "gbafe.h"
#include <string.h>

extern u16 Img_BolganoneBG2_00[], Img_BolganoneBG2_01[], Img_BolganoneBG2_02[],
    Img_BolganoneBG2_03[], Img_BolganoneBG2_04[], Img_BolganoneBG3_00[], Img_BolganoneBG3_01[],
    Img_BolganoneBG3_02[], Tsa_BolganoneBG2_00[], Tsa_BolganoneBG2_01[], Tsa_BolganoneBG2_02[],
    Tsa_BolganoneBG2_03[], Tsa_BolganoneBG2_04[], Tsa_BolganoneBG3_00[], Tsa_BolganoneBG3_01[],
    Tsa_BolganoneBG3_02[], Tsa_BolganoneBG_00[], Tsa_BolganoneBG_01[], Tsa_BolganoneBG_02[],
    Tsa_BolganoneBG_03[], Tsa_BolganoneBG_04[], Tsa_BolganoneBG_05[], Tsa_BolganoneBG_06[],
    Tsa_BolganoneBG_07[], Tsa_BolganoneBG_08[], Tsa_BolganoneBG_09[], Tsa_BolganoneBG_0A[],
    Tsa_BolganoneBG_0B[];

extern const struct AnimSpriteData AnimSprite_BolganoneOBJ2Child_0_08BD24B8[],
    AnimSprite_BolganoneOBJ2Child_1_08BD2488[], AnimSprite_BolganoneOBJ2Child_1_08BD24A0[],
    AnimSprite_BolganoneOBJChild_0_08BD241C[], AnimSprite_BolganoneOBJChild_1_08BD2404[],
    AnimSprite_BolganoneOBJChild_2_08BD23E0[], AnimSprite_BolganoneOBJChild_3_08BD23BC[],
    AnimSprite_BolganoneOBJChild_4_08BD2434[], AnimSprite_BolganoneOBJChild_5_08BD2374[];

struct ProcEfxBolganoneOBJ {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 unk30;
    /* 32 */ s16 unk32;
    /* 34 */ s16 unk34;
    /* 36 */ s16 unk36;
    /* 38 */ s16 unk38;
    /* 3A */ s16 unk3A;

    STRUCT_PAD(0x3C, 0x44);

    /* 44 */ int unk44;

    STRUCT_PAD(0x48, 0x5C);

    /* 5C */ struct Anim * anim;
    /* 60 */ struct Anim * anim2;
};
PROC_SIZE_CHECK(struct ProcEfxBolganoneOBJ);

extern const s16 gBolganoneOBJDurations[];
extern const s16 gBolganoneOBJTypes[];
extern const s16 gBolganoneOBJ2Durations[];
extern const s16 gBolganoneOBJ2XOffsets[];
extern const s16 gBolganoneOBJ2XBase[];
extern const struct ProcCmd ProcScr_efxBolganoneOBJ2Child[];
extern const AnimScr AnimScr_BolganoneOBJ2Child_0[];
extern const AnimScr AnimScr_BolganoneOBJ2Child_1[];
extern const struct ProcCmd ProcScr_efxBolganoneOBJChild[];
extern const AnimScr AnimScr_BolganoneOBJChild_0[];
extern const AnimScr AnimScr_BolganoneOBJChild_1[];
extern const AnimScr AnimScr_BolganoneOBJChild_2[];
extern const AnimScr AnimScr_BolganoneOBJChild_3[];
extern const AnimScr AnimScr_BolganoneOBJChild_4[];
extern const AnimScr AnimScr_BolganoneOBJChild_5[];

/* auto-decls */
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void StartSubSpell_efxBolganoneOBJ2(struct Anim * anim, int terminator);
void StartSubSpell_efxBolganoneBG3(struct Anim * anim, int terminator);
void StartSubSpell_efxBolganoneBG(struct Anim * anim, int terminator);
void StartSubSpell_efxBolganoneBGCOL(struct Anim * anim, int terminator);
void EfxPlayHittedSFX(struct Anim * anim);
void StartSubSpell_efxBolganoneOBJ(struct Anim * anim, int terminator);
void StartSubSpell_efxBolganoneBG2(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern const struct ProcCmd ProcScr_efxBolganoneWOUT[];
int sub_08004CC4(void);
void NewEfxSpellCast(void);
void StartSubSpell_efxBolganoneOBJChild(struct Anim * anim, int idx);
void StartSubSpell_efxBolganoneOBJ2Child(struct Anim * anim, int idx);
extern int gEfxBgSemaphore;
extern int gUnknown_0202003C;
extern const struct ProcCmd ProcScr_efxBolganone[];
extern const struct ProcCmd ProcScr_efxBolganoneBG[];
extern const struct ProcCmd ProcScr_efxBolganoneBGCOL[];
extern const struct ProcCmd ProcScr_efxBolganoneBG2[];
extern const struct ProcCmd ProcScr_efxBolganoneBG3[];
extern const struct ProcCmd ProcScr_efxBolganoneOBJ[];
extern const struct ProcCmd ProcScr_efxBolganoneOBJ2[];
extern const s16 FrameConfig_BolganoneBG[];
extern const s16 FrameConfig_BolganoneBGCOL[];
extern const s16 FrameConfig_BolganoneBG2[];
extern const s16 FrameConfig_BolganoneBG3[];
extern u16 * const TsaArray_BolganoneBG[];
extern u16 * const TsaArray_BolganoneBG2[];
extern u16 * const TsaArray_BolganoneBG3[];
extern u16 * const ImgArray_BolganoneBG2[];
extern u16 * const ImgArray_BolganoneBG3[];
extern u16 Img_BolganoneBG[];
extern u16 Pal_BolganoneBGCOL[];
extern u16 Pal_BolganoneBG2[];
extern u16 Pal_BolganoneBG3[];
extern u16 Img_BolganoneOBJ[];
extern u16 Pal_BolganoneOBJ[];
extern u16 Img_BolganoneOBJ2[];
extern u16 Pal_BolganoneOBJ2[];

void StartSubSpell_efxBolganoneWOUT(struct Anim * anim, int duration, int terminator);
void efxBolganoneWOUT_Loop(struct ProcEfxOBJ * proc);



void StartSpellAnimBolganone(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxBolganone, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void efxBolganone_Loop(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    if (++proc->timer == 1)
        NewEfxFarAttackWithDistance(proc->anim, -1);

    if (proc->timer == duration + 1)
    {
        StartSubSpell_efxBolganoneOBJ2(anim, 130);
        PlaySFX(0x2CA, 0x100, 0x78, 0);
    }

    if (proc->timer == duration + 50)
    {
        if (proc->hitted == 0)
            StartSpellThing_MagicQuake(anim, 205, 10);
        else
            StartSpellThing_MagicQuake(anim, 105, 10);

        StartSubSpell_efxBolganoneBG3(anim, 40);
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 8, 0, 16, 0);
        NewEfxALPHA(anim, 32, 8, 16, 0, 0);
    }

    if (proc->timer == duration + 100)
    {
        StartSubSpell_efxBolganoneBG(anim, 52);
        StartSubSpell_efxBolganoneBGCOL(anim, 52);
    }

    if (proc->timer == duration + 120)
        StartSubSpell_efxBolganoneWOUT(anim, 35, 25);

    if (proc->hitted == 0)
    {
        if (proc->timer == duration + 155)
        {
            anim->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
            StartBattleAnimHitEffectsDefault(anim, proc->hitted);
            EfxPlayHittedSFX(anim);
            StartSubSpell_efxBolganoneOBJ(anim, 60);
            SetBlendAlpha(0, 16);
            NewEfxALPHA(anim, 0, 5, 0, 12, 0);
            NewEfxALPHA(anim, 60, 30, 12, 0, 0);
            StartSubSpell_efxBolganoneBG2(anim);
            PlaySFX(0x2CB, 0x100, 0x78, 0);
        }

        if (proc->timer == duration + 255)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }
    else
    {
        if (proc->timer == duration + 155)
        {
            anim->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
            StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        }

        if (proc->timer == duration + 160)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }
}

void StartSubSpell_efxBolganoneBG(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk30 = terminator;
    proc->frame = 0;
    proc->frame_config = FrameConfig_BolganoneBG;
    proc->tsal = TsaArray_BolganoneBG;
    proc->tsar = TsaArray_BolganoneBG;

    SpellFx_RegisterBgGfx(Img_BolganoneBG, 0x2000);
    SpellFx_SetSomeColorEffect();
}

void efxBolganoneBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        FillBGRect(gBg1Tm + 30, 2, 20, 1, 0x11F);
    }

    if (++proc->terminator > proc->unk30)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

void StartSubSpell_efxBolganoneBGCOL(struct Anim * anim, int terminator)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->terminator = terminator;
    proc->frame = 0;
    proc->frame_config = FrameConfig_BolganoneBGCOL;
    proc->pal = Pal_BolganoneBGCOL;

    SpellFx_RegisterBgPal(Pal_BolganoneBGCOL, 0x20);
}

void efxBolganoneBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(&PAL_BUF_COLOR(pal, ret, 0), 0x20);
    }

    if (++proc->timer2 == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

void StartSubSpell_efxBolganoneBG2(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameConfig_BolganoneBG2;
    proc->tsal = TsaArray_BolganoneBG2;
    proc->tsar = TsaArray_BolganoneBG2;
    proc->img = ImgArray_BolganoneBG2;

    SpellFx_RegisterBgPal(Pal_BolganoneBG2, 0x20);
    SpellFx_SetSomeColorEffect();
}

void efxBolganoneBG2_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;
        u16 * const * img = proc->img;
        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        FillBGRect(gBg1Tm + 30, 2, 20, 1, 0x11F);
    }
    else if (ret == -1)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

void StartSubSpell_efxBolganoneOBJ(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk30 = terminator;
    proc->unk44 = 2;
    proc->unk48 = 0;

    SpellFx_RegisterObjGfx(Img_BolganoneOBJ, 0x1000);
    SpellFx_RegisterObjPal(Pal_BolganoneOBJ, 0x20);
}

void efxBolganoneOBJ_Loop(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == (s16)proc->unk30)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
        return;
    }

    if (++proc->terminator == proc->unk44)
    {
        proc->terminator = 0;
        proc->unk44 = 2;

        if (sub_08004CC4() > 4)
            StartSubSpell_efxBolganoneOBJChild(proc->anim, proc->unk48++);

        if (sub_08004CC4() > 4)
            StartSubSpell_efxBolganoneOBJChild(proc->anim, proc->unk48++);
    }
}

void StartSubSpell_efxBolganoneOBJChild(struct Anim * anim, int idx)
{
    s16 durations[8];
    s16 types[64];
    struct ProcEfxBolganoneOBJ * proc;
    struct Anim * child;

    memcpy(durations, gBolganoneOBJDurations, sizeof(durations));
    memcpy(types, gBolganoneOBJTypes, sizeof(types));

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneOBJChild, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = durations[idx & 7];
    proc->unk32 = sub_080672E8(0xE0) + 8;
    proc->unk3A = 0;

    child = NULL;

    switch (types[idx & 0x3F])
    {
    case 0:
        child = AnimCreate(AnimScr_BolganoneOBJChild_0, 0x78);
        proc->anim2 = child;
        break;

    case 1:
        child = AnimCreate(AnimScr_BolganoneOBJChild_1, 0x78);
        proc->anim2 = child;
        break;

    case 2:
        child = AnimCreate(AnimScr_BolganoneOBJChild_2, 0x78);
        proc->anim2 = child;
        break;

    case 3:
        child = AnimCreate(AnimScr_BolganoneOBJChild_3, 0x78);
        proc->anim2 = child;
        break;

    case 4:
        child = AnimCreate(AnimScr_BolganoneOBJChild_4, 0x78);
        proc->anim2 = child;
        break;

    case 5:
        child = AnimCreate(AnimScr_BolganoneOBJChild_5, 0x78);
        proc->anim2 = child;
        break;
    }

    if (child == NULL)
    {
        gEfxBgSemaphore--;
        Proc_End(proc);
        return;
    }

    child->oam2Base = 0x2440;
    child->xPosition = proc->unk32;
    child->yPosition = proc->unk3A;
}

void efxBolganoneOBJChild_Loop(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(anim);
        Proc_Break(proc);
        return;
    }

    anim->yPosition = Interpolate(1, 0x78, 8, proc->timer, proc->terminator);
    proc->timer++;
}

void StartSubSpell_efxBolganoneBG3(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneBG3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk30 = terminator;
    proc->frame = 0;
    proc->frame_config = FrameConfig_BolganoneBG3;
    proc->tsal = TsaArray_BolganoneBG3;
    proc->tsar = TsaArray_BolganoneBG3;
    proc->img = ImgArray_BolganoneBG3;

    SpellFx_RegisterBgPal(Pal_BolganoneBG3, 0x20);
    SpellFx_SetSomeColorEffect();
}

void efxBolganoneBG3_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * const * tsaL = proc->tsal;
        u16 * const * tsaR = proc->tsar;
        u16 * const * img = proc->img;
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
    }

    if (++proc->terminator > proc->unk30)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

void StartSubSpell_efxBolganoneOBJ2(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk30 = terminator;
    proc->unk44 = 2;
    proc->unk48 = 0;

    SpellFx_RegisterObjGfx(Img_BolganoneOBJ2, 0x1000);
    SpellFx_RegisterObjPal(Pal_BolganoneOBJ2, 0x20);
    gUnknown_0202003C = 0;
}

void efxBolganoneOBJ2_Loop(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == (s16)proc->unk30)
    {
        gUnknown_0202003C = 1;
        gEfxBgSemaphore--;
        Proc_Break(proc);
        return;
    }

    if (++proc->terminator == proc->unk44)
    {
        proc->terminator = 0;
        proc->unk44 = 2;

        if (sub_08004CC4() > 4)
            StartSubSpell_efxBolganoneOBJ2Child(proc->anim, proc->unk48++);

        if (sub_08004CC4() > 4)
            StartSubSpell_efxBolganoneOBJ2Child(proc->anim, proc->unk48++);
    }
}

void StartSubSpell_efxBolganoneOBJ2Child(struct Anim * anim, int idx)
{
    s16 durations[8];
    s16 types[8];
    s16 xoffs[8];
    s16 xbase[8];
    struct ProcEfxBolganoneOBJ * proc;
    struct Anim * child;

    memcpy(durations, gBolganoneOBJ2Durations, sizeof(durations));
    memset(types, 0, sizeof(types));
    types[2] = 1;
    types[5] = 1;
    memcpy(xoffs, gBolganoneOBJ2XOffsets, sizeof(xoffs));
    memcpy(xbase, gBolganoneOBJ2XBase, sizeof(xbase));

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneOBJ2Child, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = durations[idx & 7];
    proc->unk30 = sub_080672E8(0xFF);
    proc->unk32 = xbase[idx & 7] + sub_080672E8(0x10);
    proc->unk3A = 0x70;

    if (GetAnimPosition(proc->anim) == 0)
        proc->unk44 = xoffs[idx & 7];
    else
        proc->unk44 = -xoffs[idx & 7];

    child = NULL;

    switch (types[idx & 7])
    {
    case 0:
        child = AnimCreate(AnimScr_BolganoneOBJ2Child_0, 0x78);
        proc->anim2 = child;
        break;

    case 1:
        child = AnimCreate(AnimScr_BolganoneOBJ2Child_1, 0x78);
        proc->anim2 = child;
        break;
    }

    if (child == NULL)
    {
        gEfxBgSemaphore--;
        Proc_End(proc);
        return;
    }

    child->oam2Base = 0x2440;
    child->xPosition = proc->unk32;
    child->yPosition = proc->unk3A;
}

void efxBolganoneOBJ2Child_Loop(struct ProcEfxBolganoneOBJ * proc)
{
    struct Anim * anim = proc->anim2;
    int r, off, x, y, a, s, c;

    if (gUnknown_0202003C == 1 || proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(anim);
        Proc_Break(proc);
        return;
    }

    r = Interpolate(0, 0, 0x70, proc->timer, proc->terminator);
    proc->timer++;

    off = gSinLut[proc->unk30 + 0x40] >> 10;
    proc->unk30 = (proc->unk30 + 6) & 0xFF;

    a = proc->unk44 & 0xFF;
    s = gSinLut[a];
    c = gSinLut[a + 0x40];
    x = s * r;
    y = c * r;
    x >>= 12;
    y >>= 12;

    anim->xPosition = proc->unk32 + off - x;
    anim->yPosition = proc->unk3A - y;
}

// 9.99 efxmagic-ivaldi:StartSubSpell_efxIvaldiWOUT
void StartSubSpell_efxBolganoneWOUT(struct Anim * anim, int duration, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBolganoneWOUT, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    NewEfxFlashBgWhite(anim, duration);

    return;
}

// 9.99 efxmagic-ivaldi:efxIvaldiWOUT_Loop
void efxBolganoneWOUT_Loop(struct ProcEfxOBJ * proc)
{
    int val = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->terminator);

    CpuFastCopy(gPal, gEfxPal, 0x400);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, val);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

SECTION(".rodata.08BA2840")
const struct ProcCmd ProcScr_efxBolganone[] = {
    PROC_19,
    PROC_REPEAT(efxBolganone_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2858")
const struct ProcCmd ProcScr_efxBolganoneBG[] = {
    PROC_19,
    PROC_REPEAT(efxBolganoneBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA28A0")
const struct ProcCmd ProcScr_efxBolganoneBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxBolganoneBGCOL_Loop),
    PROC_END,
};

SECTION(".rodata.08BA28C0")
const struct ProcCmd ProcScr_efxBolganoneBG2[] = {
    PROC_19,
    PROC_REPEAT(efxBolganoneBG2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2900")
const struct ProcCmd ProcScr_efxBolganoneOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxBolganoneOBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2918")
const struct ProcCmd ProcScr_efxBolganoneOBJChild[] = {
    PROC_19,
    PROC_REPEAT(efxBolganoneOBJChild_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2930")
const struct ProcCmd ProcScr_efxBolganoneBG3[] = {
    PROC_19,
    PROC_REPEAT(efxBolganoneBG3_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2960")
const struct ProcCmd ProcScr_efxBolganoneOBJ2[] = {
    PROC_19,
    PROC_REPEAT(efxBolganoneOBJ2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2978")
const struct ProcCmd ProcScr_efxBolganoneOBJ2Child[] = {
    PROC_19,
    PROC_REPEAT(efxBolganoneOBJ2Child_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2990")
const struct ProcCmd ProcScr_efxBolganoneWOUT[] = {
    PROC_19,
    PROC_REPEAT(efxBolganoneWOUT_Loop),
    PROC_END,
};

SECTION(".rodata.08BD2458")
const AnimScr AnimScr_BolganoneOBJChild_5[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_BolganoneOBJChild_5_08BD2374, 4),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BD2460")
const AnimScr AnimScr_BolganoneOBJChild_3[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_BolganoneOBJChild_3_08BD23BC, 4),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BD2468")
const AnimScr AnimScr_BolganoneOBJChild_2[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_BolganoneOBJChild_2_08BD23E0, 4),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BD2470")
const AnimScr AnimScr_BolganoneOBJChild_1[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_BolganoneOBJChild_1_08BD2404, 4),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BD2478")
const AnimScr AnimScr_BolganoneOBJChild_0[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_BolganoneOBJChild_0_08BD241C, 4),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BD2480")
const AnimScr AnimScr_BolganoneOBJChild_4[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_BolganoneOBJChild_4_08BD2434, 4),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BD24D0")
const AnimScr AnimScr_BolganoneOBJ2Child_1[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_BolganoneOBJ2Child_1_08BD2488, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_BolganoneOBJ2Child_1_08BD24A0, 1),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BD24DC")
const AnimScr AnimScr_BolganoneOBJ2Child_0[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_BolganoneOBJ2Child_0_08BD24B8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_BolganoneOBJ2Child_1_08BD24A0, 1),
    ANIMSCR_LOOP,
};

SECTION(".rodata.08BA2870")
u16 * const TsaArray_BolganoneBG[] = {
    Tsa_BolganoneBG_00,
    Tsa_BolganoneBG_01,
    Tsa_BolganoneBG_02,
    Tsa_BolganoneBG_03,
    Tsa_BolganoneBG_04,
    Tsa_BolganoneBG_05,
    Tsa_BolganoneBG_06,
    Tsa_BolganoneBG_07,
    Tsa_BolganoneBG_08,
    Tsa_BolganoneBG_09,
    Tsa_BolganoneBG_0A,
    Tsa_BolganoneBG_0B,
};

SECTION(".rodata.08BA28D8")
u16 * const TsaArray_BolganoneBG2[] = {
    Tsa_BolganoneBG2_00,
    Tsa_BolganoneBG2_01,
    Tsa_BolganoneBG2_02,
    Tsa_BolganoneBG2_03,
    Tsa_BolganoneBG2_04,
};

SECTION(".rodata.08BA28EC")
u16 * const ImgArray_BolganoneBG2[] = {
    Img_BolganoneBG2_00,
    Img_BolganoneBG2_01,
    Img_BolganoneBG2_02,
    Img_BolganoneBG2_03,
    Img_BolganoneBG2_04,
};

SECTION(".rodata.08BA2948")
u16 * const TsaArray_BolganoneBG3[] = {
    Tsa_BolganoneBG3_00,
    Tsa_BolganoneBG3_01,
    Tsa_BolganoneBG3_02,
};

SECTION(".rodata.08BA2954")
u16 * const ImgArray_BolganoneBG3[] = {
    Img_BolganoneBG3_00,
    Img_BolganoneBG3_01,
    Img_BolganoneBG3_02,
};
