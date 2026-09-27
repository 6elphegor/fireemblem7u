#include "gbafe.h"
#include <string.h>

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

extern const s16 gBolganoneOBJDurations[];
extern const s16 gBolganoneOBJTypes[];
extern const s16 gBolganoneOBJ2Durations[];
extern const s16 gBolganoneOBJ2XOffsets[];
extern const s16 gBolganoneOBJ2XBase[];
extern struct ProcCmd ProcScr_efxBolganoneOBJ2Child[];
extern AnimScr AnimScr_BolganoneOBJ2Child_0[];
extern AnimScr AnimScr_BolganoneOBJ2Child_1[];
extern struct ProcCmd ProcScr_efxBolganoneOBJChild[];
extern AnimScr AnimScr_BolganoneOBJChild_0[];
extern AnimScr AnimScr_BolganoneOBJChild_1[];
extern AnimScr AnimScr_BolganoneOBJChild_2[];
extern AnimScr AnimScr_BolganoneOBJChild_3[];
extern AnimScr AnimScr_BolganoneOBJChild_4[];
extern AnimScr AnimScr_BolganoneOBJChild_5[];

/* auto-decls */
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void sub_0805AB44(struct Anim * anim, int terminator);
void sub_0805AA7C(struct Anim * anim, int terminator);
void sub_0805A62C(struct Anim * anim, int terminator);
void sub_0805A6F8(struct Anim * anim, int terminator);
void EfxPlayHittedSFX(struct Anim * anim);
void sub_0805A864(struct Anim * anim, int terminator);
void sub_0805A78C(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern struct ProcCmd ProcScr_efxBolganoneWOUT[];
int sub_08004CC4(void);
void NewEfxSpellCast(void);
void sub_0805A928(struct Anim * anim, int idx);
void sub_0805AC1C(struct Anim * anim, int idx);
extern int gEfxBgSemaphore;
extern int gUnknown_0202003C;
extern struct ProcCmd ProcScr_efxBolganone[];
extern struct ProcCmd ProcScr_efxBolganoneBG[];
extern struct ProcCmd ProcScr_efxBolganoneBGCOL[];
extern struct ProcCmd ProcScr_efxBolganoneBG2[];
extern struct ProcCmd ProcScr_efxBolganoneBG3[];
extern struct ProcCmd ProcScr_efxBolganoneOBJ[];
extern struct ProcCmd ProcScr_efxBolganoneOBJ2[];
extern const s16 FrameConfig_BolganoneBG[];
extern const s16 FrameConfig_BolganoneBGCOL[];
extern const s16 FrameConfig_BolganoneBG2[];
extern const s16 FrameConfig_BolganoneBG3[];
extern u16 * TsaArray_BolganoneBG[];
extern u16 * TsaArray_BolganoneBG2[];
extern u16 * TsaArray_BolganoneBG3[];
extern u16 * ImgArray_BolganoneBG2[];
extern u16 * ImgArray_BolganoneBG3[];
extern u16 Img_BolganoneBG[];
extern u16 Pal_BolganoneBGCOL[];
extern u16 Pal_BolganoneBG2[];
extern u16 Pal_BolganoneBG3[];
extern u16 Img_BolganoneOBJ[];
extern u16 Pal_BolganoneOBJ[];
extern u16 Img_BolganoneOBJ2[];
extern u16 Pal_BolganoneOBJ2[];

void sub_0805ADF0(struct Anim * anim, int duration, int terminator);
void sub_0805AE28(struct ProcEfxOBJ * proc);



void sub_0805A3F0(struct Anim * anim)
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

void sub_0805A42C(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    if (++proc->timer == 1)
        NewEfxFarAttackWithDistance(proc->anim, -1);

    if (proc->timer == duration + 1)
    {
        sub_0805AB44(anim, 130);
        PlaySFX(0x2CA, 0x100, 0x78, 0);
    }

    if (proc->timer == duration + 50)
    {
        if (proc->hitted == 0)
            StartSpellThing_MagicQuake(anim, 205, 10);
        else
            StartSpellThing_MagicQuake(anim, 105, 10);

        sub_0805AA7C(anim, 40);
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 8, 0, 16, 0);
        NewEfxALPHA(anim, 32, 8, 16, 0, 0);
    }

    if (proc->timer == duration + 100)
    {
        sub_0805A62C(anim, 52);
        sub_0805A6F8(anim, 52);
    }

    if (proc->timer == duration + 120)
        sub_0805ADF0(anim, 35, 25);

    if (proc->hitted == 0)
    {
        if (proc->timer == duration + 155)
        {
            anim->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
            StartBattleAnimHitEffectsDefault(anim, proc->hitted);
            EfxPlayHittedSFX(anim);
            sub_0805A864(anim, 60);
            SetBlendAlpha(0, 16);
            NewEfxALPHA(anim, 0, 5, 0, 12, 0);
            NewEfxALPHA(anim, 60, 30, 12, 0, 0);
            sub_0805A78C(anim);
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

void sub_0805A62C(struct Anim * anim, int terminator)
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

void sub_0805A680(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
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

void sub_0805A6F8(struct Anim * anim, int terminator)
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

void sub_0805A740(struct ProcEfxBGCOL * proc)
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

void sub_0805A78C(struct Anim * anim)
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

void sub_0805A7E0(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
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

void sub_0805A864(struct Anim * anim, int terminator)
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

void sub_0805A8B4(struct ProcEfxOBJ * proc)
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
            sub_0805A928(proc->anim, proc->unk48++);

        if (sub_08004CC4() > 4)
            sub_0805A928(proc->anim, proc->unk48++);
    }
}

void sub_0805A928(struct Anim * anim, int idx)
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

void sub_0805AA28(struct ProcEfxOBJ * proc)
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

void sub_0805AA7C(struct Anim * anim, int terminator)
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

void sub_0805AAD8(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
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

void sub_0805AB44(struct Anim * anim, int terminator)
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

void sub_0805AB9C(struct ProcEfxOBJ * proc)
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
            sub_0805AC1C(proc->anim, proc->unk48++);

        if (sub_08004CC4() > 4)
            sub_0805AC1C(proc->anim, proc->unk48++);
    }
}

void sub_0805AC1C(struct Anim * anim, int idx)
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

#if NONMATCHING
void sub_0805AD44(struct ProcEfxBolganoneOBJ * proc)
{
    struct Anim * anim = proc->anim2;
    int r, off, x, y;

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

    x = gSinLut[proc->unk44 & 0xFF] * r;
    y = gSinLut[(proc->unk44 & 0xFF) + 0x40] * r;

    anim->xPosition = proc->unk32 + off - (x >> 12);
    anim->yPosition = proc->unk3A - (y >> 12);
}
#else
ASM_FUNC("asm/nonmatching/code_0805AD44.s");
#endif

// 9.99 efxmagic-ivaldi:StartSubSpell_efxIvaldiWOUT
void sub_0805ADF0(struct Anim * anim, int duration, int terminator)
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
void sub_0805AE28(struct ProcEfxOBJ * proc)
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
