#include "gbafe.h"

/**
 * Spell animation 0x21 (FE7-only)
 */

struct ProcEfxSpell21OBJ {
    PROC_HEADER;

    /* 29 */ u8 unk29;
    /* 2A */ u8 unk2A;

    STRUCT_PAD(0x2B, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 unk30;
    /* 32 */ s16 unk32;
    /* 34 */ s16 unk34;
    /* 36 */ s16 unk36;
    /* 38 */ s16 unk38;
    /* 3A */ s16 unk3A;
    /* 3C */ s16 unk3C;
    /* 3E */ s16 unk3E;
    /* 40 */ s16 unk40;
    /* 42 */ s16 unk42;
    /* 44 */ int unk44;
    /* 48 */ int unk48;
    /* 4C */ int unk4C;

    STRUCT_PAD(0x50, 0x5C);

    /* 5C */ struct Anim * anim;
    /* 60 */ struct Anim * anim2;
    /* 64 */ struct Anim * anim3;
};

void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
void sub_08050150(struct Anim * anim, int type);
void SpellFx_WriteBgMapExt(struct Anim * anim, const u16 * src, int width, int height);

extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxSpell21[];
extern const struct ProcCmd ProcScr_efxSpell21BG[];
extern const struct ProcCmd ProcScr_efxSpell21BG2[];
extern const struct ProcCmd ProcScr_efxSpell21BGCOL[];
extern const struct ProcCmd ProcScr_efxSpell21OBJ[];
extern const struct ProcCmd ProcScr_efxSpell21OBJChild[];
extern const struct ProcCmd ProcScr_efxSpell21OBJ2[];
extern const struct ProcCmd ProcScr_efxSpell21OBJ3[];
extern const struct ProcCmd ProcScr_efxSpell21OBJ3Child[];
extern const s16 FrameConfig_Spell21BG[];
extern const s16 FrameConfig_Spell21BGCOL[];
extern u16 * TsaArray_Spell21BG[];
extern u16 * ImgArray_Spell21BG[];
extern u16 Pal_Spell21BG[];
extern u16 Img_Spell21BG2[];
extern u16 Pal_Spell21BG2[];
extern u16 Tsa_Spell21BG2[];
extern u16 Pal_Spell21OBJ[];
extern u16 Img_Spell21OBJ[];
extern AnimScr AnimScr_Spell21OBJChild_A[];
extern AnimScr AnimScr_Spell21OBJChild_B[];
extern AnimScr AnimScr_Spell21OBJChild_C[];
extern AnimScr AnimScr_Spell21OBJ2_A[];
extern AnimScr AnimScr_Spell21OBJ2_B[];
extern AnimScr AnimScr_Spell21OBJ3_A[];
extern AnimScr AnimScr_Spell21OBJ3_B[];

void StartSubSpell_efxSpell21BG(struct Anim * anim);
void StartSubSpell_efxSpell21BG2(struct Anim * anim, int terminator);
void StartSubSpell_efxSpell21BGCOL(struct Anim * anim, int terminator);
void StartSubSpell_efxSpell21OBJ(struct Anim * anim, int terminator);
void StartSubSpell_efxSpell21OBJChild(struct Anim * anim, int idx);
void StartSubSpell_efxSpell21OBJ2(struct Anim * anim, int terminator);
void StartSubSpell_efxSpell21OBJ3(struct Anim * anim);
void StartSubSpell_efxSpell21OBJ3Child(struct Anim * anim, int idx);

void StartSpellAnimSpell21(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxSpell21, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void efxSpell21_Loop(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    if (++proc->timer == 1)
        NewEfxFarAttackWithDistance(proc->anim, -1);

    if (proc->timer == duration + 1)
    {
        StartSubSpell_efxSpell21BG(anim);
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 32, 0, 16, 0);
        StartSubSpell_efxSpell21OBJ(anim, 170);
        PlaySFX(0x12A, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 0x11B)
    {
        PlaySFX(0x12B, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 0x13B)
    {
        StartSubSpell_efxSpell21OBJ2(anim, 25);
    }
    else if (proc->timer == duration + 0x154)
    {
        NewEfxFlashBgWhite(anim, 12);
        anim->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
        sub_08050150(anim, proc->hitted);

        if (proc->hitted == 0)
            EfxPlayHittedSFX(anim);
    }
    else if (proc->timer == duration + 0x15A)
    {
        PlaySFX(0x12C, 0x100, 0x78, 0);
        StartSpellThing_MagicQuake(anim, 100, 10);
        StartSubSpell_efxSpell21BG2(anim, 100);
        StartSubSpell_efxSpell21BGCOL(anim, 100);
        NewEfxALPHA(anim, 70, 30, 16, 0, 0);
        StartSubSpell_efxSpell21OBJ3(anim);
    }
    else if (proc->timer == duration + 0x1EA)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }
}

void StartSubSpell_efxSpell21BG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSpell21BG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameConfig_Spell21BG;
    proc->tsal = TsaArray_Spell21BG;
    proc->img = ImgArray_Spell21BG;

    SpellFx_RegisterBgPal(Pal_Spell21BG, 0x20);
    SpellFx_SetBG1Position();
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            SetBgOffset(BG_1, 0xF8, 0);
        else
            SetBgOffset(BG_1, 0x18, 0);
    }
    else
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            SetBgOffset(BG_1, 0x10, 0);
    }
}

void efxSpell21BG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa = proc->tsal;
        SpellFx_RegisterBgGfx(*(proc->img + ret), 0x2000);
        SpellFx_WriteBgMapExt(proc->anim, *(tsa + ret), 32, 20);
    }
    else if (ret == -1)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

void StartSubSpell_efxSpell21BG2(struct Anim * anim, int terminator)
{
    struct ProcEfxSpell21OBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSpell21BG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;
    proc->unk32 = 0;
    proc->unk3A = 0;
    proc->unk34 = 0;
    proc->unk3C = 0;

    SpellFx_RegisterBgGfx(Img_Spell21BG2, 0x2000);
    SpellFx_RegisterBgPal(Pal_Spell21BG2, 0x20);
    SpellFx_SetBG1Position();
    SpellFx_SetSomeColorEffect();
}

void efxSpell21BG2_Loop(struct ProcEfxSpell21OBJ * proc)
{
    if (proc->timer & 1)
    {
        proc->unk32 -= 12;
        proc->unk3A += 12;
        gDispIo.bg_off[BG_1].x = proc->unk32;
        gDispIo.bg_off[BG_1].y = proc->unk3A;
        LZ77UnCompWram(Tsa_Spell21BG2, gEkrTsaBuffer);
        EfxTmCpyBG(gEkrTsaBuffer, gBg1Tm, 32, 32, 1, 0x100);
        EnableBgSync(BG1_SYNC_BIT);
    }
    else
    {
        proc->unk34 += 8;
        proc->unk3C += 8;
        gDispIo.bg_off[BG_1].x = proc->unk34;
        gDispIo.bg_off[BG_1].y = proc->unk3C;
        LZ77UnCompWram(Tsa_Spell21BG2, gEkrTsaBuffer);
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBg1Tm, 32, 32, 1, 0x100);
        EnableBgSync(BG1_SYNC_BIT);
    }

    if (++proc->timer == proc->terminator)
    {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

void StartSubSpell_efxSpell21BGCOL(struct Anim * anim, int terminator)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSpell21BGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->terminator = terminator;
    proc->frame = 0;
    proc->frame_config = FrameConfig_Spell21BGCOL;
    proc->pal = Pal_Spell21BG2;

    SpellFx_RegisterBgPal(Pal_Spell21BG2, 0x20);
}

void efxSpell21BGCOL_Loop(struct ProcEfxBGCOL * proc)
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

void StartSubSpell_efxSpell21OBJ(struct Anim * anim, int terminator)
{
    struct ProcEfxSpell21OBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSpell21OBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;
    proc->unk30 = 0;
    proc->unk44 = 10;
    proc->unk48 = 0;

    SpellFx_RegisterObjPal(Pal_Spell21OBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_Spell21OBJ, 0x1000);
}

void efxSpell21OBJ_Loop(struct ProcEfxSpell21OBJ * proc)
{
    if (++proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
        return;
    }

    if (++proc->unk30 == proc->unk44)
    {
        proc->unk30 = 0;
        proc->unk44 = 10;
        StartSubSpell_efxSpell21OBJChild(proc->anim, proc->unk48++);
    }
}

void StartSubSpell_efxSpell21OBJChild(struct Anim * anim, int idx)
{
    struct ProcEfxSpell21OBJ * proc;
    struct Anim * child;
    int r1, r2;
    AnimScr * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSpell21OBJChild, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = sub_080672E8(30) + 140;

    r1 = sub_080672E8(30);
    r2 = sub_080672E8(30);

    proc->unk32 = r1 + 70;
    proc->unk34 = r2 + 40;
    proc->unk3A = -20;
    proc->unk3C = 160;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
    {
        proc->unk32 = r1 + 94;
        proc->unk34 = r2 + 64;
    }

    if (GetAnimPosition(anim) == EKR_POS_R)
    {
        proc->unk32 = 240 - proc->unk32;
        proc->unk34 = 240 - proc->unk34;
    }

    switch (sub_080672E8(2))
    {
    case 0:
        scr = AnimScr_Spell21OBJChild_A;
        break;

    case 1:
        scr = AnimScr_Spell21OBJChild_B;
        break;

    default:
        scr = AnimScr_Spell21OBJChild_C;
        break;
    }

    child = AnimCreate(scr, 0x78);
    proc->anim2 = child;

    if (child == NULL)
    {
        gEfxBgSemaphore--;
        Proc_End(proc);
        return;
    }

    child->oam2Base = 0x2440;
    child->xPosition = 0x100;
    child->yPosition = 0x100;
}

void efxSpell21OBJChild_Loop(struct ProcEfxSpell21OBJ * proc)
{
    struct Anim * anim = proc->anim2;
    u16 x;
    s16 y;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(anim);
        Proc_Break(proc);
        return;
    }

    x = Interpolate(0, proc->unk32, proc->unk34, proc->timer, proc->terminator);
    y = Interpolate(0, proc->unk3A, proc->unk3C, proc->timer, proc->terminator);
    anim->xPosition = x;
    anim->yPosition = y;
    proc->timer++;
}

void StartSubSpell_efxSpell21OBJ2(struct Anim * anim, int terminator)
{
    struct ProcEfxSpell21OBJ * proc;
    struct Anim * front;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSpell21OBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk30 = terminator;
    proc->unk32 = 0x5B;
    proc->unk34 = 0x3F;
    proc->unk3A = -10;
    proc->unk3C = 100;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
    {
        proc->unk32 = 0x73;
        proc->unk34 = 0x57;
    }

    if (GetAnimPosition(anim) == EKR_POS_R)
    {
        proc->unk32 = 240 - proc->unk32;
        proc->unk34 = 240 - proc->unk34;
    }

    front = proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_Spell21OBJ2_A, AnimScr_Spell21OBJ2_A, AnimScr_Spell21OBJ2_A, AnimScr_Spell21OBJ2_A);
    front->xPosition = proc->unk32;
    front->yPosition = proc->unk3A;

    front = proc->anim3 = EfxCreateFrontAnim(anim, AnimScr_Spell21OBJ2_B, AnimScr_Spell21OBJ2_B, AnimScr_Spell21OBJ2_B, AnimScr_Spell21OBJ2_B);
    front->xPosition = proc->unk32;
    front->yPosition = proc->unk3A;
}

void efxSpell21OBJ2_Loop(struct ProcEfxSpell21OBJ * proc)
{
    struct Anim * anim2 = proc->anim2;
    struct Anim * anim3 = proc->anim3;

    anim2->xPosition = anim3->xPosition = Interpolate(0, proc->unk32, proc->unk34, proc->terminator, proc->unk30);
    anim2->yPosition = anim3->yPosition = Interpolate(0, proc->unk3A, proc->unk3C, proc->terminator, proc->unk30);

    if (++proc->timer == 17)
    {
        proc->timer = 0;
        anim3->pScrCurrent = anim3->pScrStart = AnimScr_Spell21OBJ2_B;
        anim2->timer = 0;
    }

    if (++proc->terminator > proc->unk30)
    {
        AnimDelete(anim2);
        AnimDelete(anim3);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

void StartSubSpell_efxSpell21OBJ3(struct Anim * anim)
{
    struct ProcEfxSpell21OBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSpell21OBJ3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk44 = 1;
    proc->unk48 = 0;
}

void efxSpell21OBJ3_Loop(struct ProcEfxSpell21OBJ * proc)
{
    if (++proc->timer == 47)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
        return;
    }

    if (++proc->terminator == proc->unk44)
    {
        proc->terminator = 0;
        proc->unk44 = 1;
        StartSubSpell_efxSpell21OBJ3Child(proc->anim, proc->unk48++);
    }
}

void StartSubSpell_efxSpell21OBJ3Child(struct Anim * anim, int idx)
{
    struct ProcEfxSpell21OBJ * proc;
    struct Anim * child;
    int r, a, b;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSpell21OBJ3Child, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 20;

    r = sub_080672E8(120);
    proc->unk32 = r - 60;
    proc->unk34 = r + 180;
    a = proc->unk32 * 3 >> 1;
    b = proc->unk34 * 3 >> 1;
    proc->unk3A = a + 192;
    proc->unk3C = b - 328;

    switch (sub_080672E8(2))
    {
    case 1:
        child = AnimCreate(AnimScr_Spell21OBJ3_A, 0x78);
        break;

    default:
        child = AnimCreate(AnimScr_Spell21OBJ3_B, 0x78);
        break;
    }

    proc->anim2 = child;

    if (child == NULL)
    {
        gEfxBgSemaphore--;
        Proc_End(proc);
        return;
    }

    child->oam2Base = 0x2440;
    child->xPosition = 0x100;
    child->yPosition = 0x100;
}

void efxSpell21OBJ3Child_Loop(struct ProcEfxSpell21OBJ * proc)
{
    struct Anim * anim = proc->anim2;
    u16 x;
    s16 y;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(anim);
        Proc_Break(proc);
        return;
    }

    x = Interpolate(0, proc->unk32, proc->unk34, proc->timer, proc->terminator);
    y = Interpolate(0, proc->unk3A, proc->unk3C, proc->timer, proc->terminator);
    anim->xPosition = x;
    anim->yPosition = y;
    proc->timer++;
}

void sub_0805BBEC(struct Anim * anim)
{
}

SECTION(".rodata.08BA2B50")
const struct ProcCmd ProcScr_efxSpell21[] = {
    PROC_19,
    PROC_REPEAT(efxSpell21_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2B68")
const struct ProcCmd ProcScr_efxSpell21BG[] = {
    PROC_19,
    PROC_REPEAT(efxSpell21BG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2BA8")
const struct ProcCmd ProcScr_efxSpell21BG2[] = {
    PROC_19,
    PROC_REPEAT(efxSpell21BG2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2BC0")
const struct ProcCmd ProcScr_efxSpell21BGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxSpell21BGCOL_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2BE0")
const struct ProcCmd ProcScr_efxSpell21OBJ[] = {
    PROC_19,
    PROC_REPEAT(efxSpell21OBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2BF8")
const struct ProcCmd ProcScr_efxSpell21OBJChild[] = {
    PROC_19,
    PROC_REPEAT(efxSpell21OBJChild_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2C10")
const struct ProcCmd ProcScr_efxSpell21OBJ2[] = {
    PROC_19,
    PROC_REPEAT(efxSpell21OBJ2_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2C28")
const struct ProcCmd ProcScr_efxSpell21OBJ3[] = {
    PROC_19,
    PROC_REPEAT(efxSpell21OBJ3_Loop),
    PROC_END,
};

SECTION(".rodata.08BA2C40")
const struct ProcCmd ProcScr_efxSpell21OBJ3Child[] = {
    PROC_19,
    PROC_REPEAT(efxSpell21OBJ3Child_Loop),
    PROC_END,
};
