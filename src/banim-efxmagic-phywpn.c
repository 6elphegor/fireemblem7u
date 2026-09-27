#include "gbafe.h"

/* auto-decls */
extern u16 Img_SpellJavelin_08056938[];
extern u16 Pal_SpellJavelin_08056938[];
extern u16 Img_SpellJavelin_08056994[];
extern u16 Pal_SpellJavelin_08056994[];
extern u16 Img_SpellJavelin_080569F0[];
extern u16 Pal_SpellJavelin_080569F0[];
extern u16 Img_SpellJavelin_08056A4C[];
extern u16 Pal_SpellJavelin_08056A4C[];
extern u16 Img_SpellJavelin_08056AA8[];
extern u16 Pal_SpellJavelin_08056AA8[];
extern u16 Img_SpellJavelin_08056B04[];
extern u16 Pal_SpellJavelin_08056B04[];
extern u16 Img_SpellJavelin_08056B60[];
extern u16 Pal_SpellJavelin_08056B60[];
extern u16 Img_SpellJavelin_08056BBC[];
extern u16 Pal_SpellJavelin_08056BBC[];
extern u16 Img_SpellJavelin_08056C18[];
extern u16 Pal_SpellJavelin_08056C18[];
extern u16 Img_SpellJavelin_08056C74[];
extern u16 Pal_SpellJavelin_08056C74[];
extern u16 Img_SpellJavelin_08056CD0[];
extern u16 Pal_SpellJavelin_08056CD0[];
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
int GetProperAnimSoundLocation(struct Anim * anim);
extern struct ProcCmd ProcScr_efxDummymagic[];
extern struct ProcCmd ProcScr_efxTeono[];
// MISSING var (2)
extern int gEfxBgSemaphore;
extern struct ProcCmd ProcScr_efxTeonoOBJ[];
extern u32 AnimScr_TeonoObjCloseLeft[];
extern u32 AnimScr_TeonoObjCloseRight[];
extern u32 AnimScr_TeonoObjFarLeft[];
extern u32 AnimScr_TeonoObjFarRight[];
extern u16 Pal_TeonoOBJ[];
extern u16 Img_TeonoOBJ[];
extern u32 gUnknown_02017754;
extern struct ProcCmd ProcScr_efxTeonoOBJ2[];
extern u32 AnimScr_TeonoObj2Left[];
extern u32 AnimScr_TeonoObj2Right[];
extern struct ProcCmd ProcScr_efxTeonoSE[];
extern struct ProcCmd ProcScr_efxArrow[];
extern struct ProcCmd ProcScr_efxArrowOBJ[];
extern u32 AnimScr_ArrowCloseLeft[];
extern u32 AnimScr_ArrowCloseRight[];
extern u32 AnimScr_ArrowFarLeft[];
extern u32 AnimScr_ArrowFarRight[];
extern u16 Img_EfxArrowOBJ[];
extern struct ProcCmd ProcScr_efxTeyari[];
extern struct ProcCmd ProcScr_efxTeyariOBJ[];
extern u32 AnimScr_EfxTeyariObjType0Right[];
extern u32 AnimScr_EfxTeyariObjType0Left[];
extern u32 AnimScr_EfxTeyariObjType1Right[];
extern u32 AnimScr_EfxTeyariObjType1Left[];

struct ProcEfxMagicOBJ {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    STRUCT_PAD(0x30, 0x5C);
    /* 5C */ struct Anim * anim;
    /* 60 */ struct Anim * anim2;
    /* 64 */ ProcPtr seproc;
};

void StartSpellAnimDummy(struct Anim * anim);
void EfxDummymagicMain(struct ProcEfx * proc);
void StartSpellAnimHandAxe(struct Anim * anim);
void EfxTeonoMain(struct ProcEfx * proc);
void NewEfxTeonoOBJ(struct Anim * anim);
void EfxTeonoObjMain(struct ProcEfxMagicOBJ * proc);
void EfxTeonoObjEnd(struct ProcEfxMagicOBJ * proc);
void NewEfxTeonoOBJ2(struct Anim * anim);
void EfxTeonoObj2Main(struct ProcEfxMagicOBJ * proc);
ProcPtr NewEfxTeonoSE(struct Anim * anim, struct Anim * anim2);
void EfxTeonoSeCallBack(struct ProcEfxMagicOBJ * proc);
void EfxTeonoSeMain(struct ProcEfxMagicOBJ * proc);
void StartSpellAnimArrow(struct Anim * anim);
void EfxArrowMain(struct ProcEfx * proc);
void NewEfxArrowOBJ(struct Anim * anim);
void EfxArrowObjMain(struct ProcEfxMagicOBJ * proc);
void sub_08056938(struct Anim * anim);
void sub_08056994(struct Anim * anim);
void sub_080569F0(struct Anim * anim);
void sub_08056A4C(struct Anim * anim);
void sub_08056AA8(struct Anim * anim);
void sub_08056B04(struct Anim * anim);
void sub_08056B60(struct Anim * anim);
void sub_08056BBC(struct Anim * anim);
void sub_08056C18(struct Anim * anim);
void sub_08056C74(struct Anim * anim);
void sub_08056CD0(struct Anim * anim);
void EfxTeyariMain(struct ProcEfx * proc);
void NewEfxTeyariOBJ(struct Anim * anim, int type);
void EfxTeyariObjMain(struct ProcEfxMagicOBJ * proc);



// 0.93 efxmagic-phywpn:StartSpellAnimDummy
void StartSpellAnimDummy(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxDummymagic, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

// 0.89 efxmagic-phywpn:EfxDummymagicMain
void EfxDummymagicMain(struct ProcEfx * proc)
{
    struct Anim * animc = GetAnimAnotherSide(proc->anim);
    int time = ++proc->timer;

    if (time == 1)
    {
        animc->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
        return;
    }

    if (time == 10)
    {
        if (GetAnimNextRoundType(animc) != ANIM_ROUND_INVALID)
            animc->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

// 9.99 efxmagic-phywpn:StartSpellAnimHandAxe
void StartSpellAnimHandAxe(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxTeono, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

// 0.95 efxmagic-phywpn:EfxTeonoMain
void EfxTeonoMain(struct ProcEfx * proc)
{
    struct Anim * animc = GetAnimAnotherSide(proc->anim);

    if (++proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        NewEfxTeonoOBJ(proc->anim);

        if (proc->timer == 1)
        {
            animc->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
            StartBattleAnimHitEffectsDefault(animc, proc->hitted);

            if (GetEfxHpChangeType(animc) != (2))
            {
                if (CheckRoundCrit(proc->anim) == true)
                    NewEfxPierceCritical(animc);
                else if (proc->hitted != false)
                    return;
                else
                    NewEfxNormalEffect(proc->anim);
            }
            if (proc->hitted == false)
                EfxPlayHittedSFX(animc);

            return;
        }
    }

    if (proc->timer == 0x46)
    {
        return;
    }

    if (proc->timer == 0x50)
    {
        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

// 0.85 efxmagic-phywpn:NewEfxTeonoOBJ
void NewEfxTeonoOBJ(struct Anim * anim)
{
    struct Anim * anim2;
    struct ProcEfxMagicOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxTeonoOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, AnimScr_TeonoObjCloseLeft, AnimScr_TeonoObjCloseRight, AnimScr_TeonoObjFarLeft, AnimScr_TeonoObjFarRight);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == POS_L)
        anim2->xPosition += 0x48;
    else
        anim2->xPosition -= 0x48;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        proc->terminator = 35;
    else
        proc->terminator = 10;

    proc->seproc = NewEfxTeonoSE(proc->anim, proc->anim2);

    SpellFx_RegisterObjPal(Pal_TeonoOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_TeonoOBJ, 0x1000);
}

// 0.84 efxmagic-phywpn:EfxTeonoObjMain
void EfxTeonoObjMain(struct ProcEfxMagicOBJ * proc)
{
    if (++proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);

        if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        {
            Unk_02017758 = 1;
            Proc_End(proc->seproc);
            Proc_End(proc);
        }
        else
        {
            Proc_Break(proc);
        }
    }
}

// 0.88 efxmagic-phywpn:EfxTeonoObjEnd
void EfxTeonoObjEnd(struct ProcEfxMagicOBJ * proc)
{
    gUnknown_02017754 = 0;
    Proc_End(proc->seproc);
    NewEfxTeonoOBJ2(proc->anim);
    Proc_Break(proc);
}

// 0.88 efxmagic-phywpn:NewEfxTeonoOBJ2
void NewEfxTeonoOBJ2(struct Anim * anim)
{
    struct Anim * anim2;
    struct ProcEfxMagicOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxTeonoOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, AnimScr_TeonoObj2Left, AnimScr_TeonoObj2Right, AnimScr_TeonoObj2Left, AnimScr_TeonoObj2Right);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == POS_L)
        anim2->xPosition += 0x48;
    else
        anim2->xPosition -= 0x48;

    SpellFx_RegisterObjPal(Pal_TeonoOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_TeonoOBJ, 0x1000);
    proc->seproc = NewEfxTeonoSE(proc->anim, proc->anim2);
}

// 0.93 efxmagic-phywpn:EfxTeonoObj2Main
void EfxTeonoObj2Main(struct ProcEfxMagicOBJ * proc)
{
    if (++proc->timer == 17)
    {
        gEfxBgSemaphore--;
        Unk_02017758 = 1;
        Proc_End(proc->seproc);
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

// 0.93 efxmagic-phywpn:NewEfxTeonoSE
ProcPtr NewEfxTeonoSE(struct Anim * anim, struct Anim * anim2)
{
    struct ProcEfxMagicOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxTeonoSE, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = anim2;
    proc->timer = 0;
    proc->terminator = 1;
    PlaySFX(0xCD, 0x100, anim->xPosition, 1);
    return proc;
}

// 9.99 efxmagic-phywpn:EfxTeonoSeCallBack
void EfxTeonoSeCallBack(struct ProcEfxMagicOBJ * proc)
{
    gEfxBgSemaphore--;
}

// 0.90 efxmagic-phywpn:EfxTeonoSeMain
void EfxTeonoSeMain(struct ProcEfxMagicOBJ * proc)
{
    int sound_pos;

    if (++proc->timer == 0x8)
    {
        sound_pos = (u16)proc->anim2->xPosition + GetProperAnimSoundLocation(proc->anim2);
        PlaySFX(0xCD, 0x100, (s16)sound_pos, 1);
        proc->timer = 0;
        if (proc->terminator <= 8)
            proc->terminator++;
    }
}

// 9.99 efxmagic-phywpn:StartSpellAnimArrow
void StartSpellAnimArrow(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxArrow, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

// 0.96 efxmagic-phywpn:EfxArrowMain
void EfxArrowMain(struct ProcEfx * proc)
{
    struct Anim * animc = GetAnimAnotherSide(proc->anim);
    int frame = EfxGetCamMovDuration();

    if (++proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        NewEfxArrowOBJ(proc->anim);
        PlaySFX(0xCC, 0x100, proc->anim->xPosition, 1);

        if (proc->timer == 1)
        {
            animc->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
            StartBattleAnimHitEffectsDefault(animc, proc->hitted);

            if (GetEfxHpChangeType(animc) != (2))
            {
                if (CheckRoundCrit(proc->anim) == true)
                    NewEfxPierceCritical(animc);
                else if (proc->hitted != false)
                    return;
                else
                    NewEfxNormalEffect(proc->anim);
            }
            if (proc->hitted == false)
                EfxPlayHittedSFX(animc);

            return;
        }
    }

    if (proc->timer == (frame + 9))
    {
        return;
    }

    if (proc->timer == (frame + 10))
    {
        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

// 0.80 efxmagic-phywpn:NewEfxArrowOBJ
void NewEfxArrowOBJ(struct Anim * anim)
{
    struct Anim * anim2;
    struct ProcEfxMagicOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxArrowOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_ArrowCloseLeft, AnimScr_ArrowCloseRight, AnimScr_ArrowFarLeft, AnimScr_ArrowFarRight);

    SpellFx_RegisterObjPal(Pal_TeonoOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxArrowOBJ, 0x60);
}

// 0.95 efxmagic-phywpn:EfxArrowObjMain
void EfxArrowObjMain(struct ProcEfxMagicOBJ * proc)
{
    if (++proc->timer == 4)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

// 9.99 efxmagic-phywpn:StartSpellAnimJavelin
void sub_08056938(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 0);
    SpellFx_RegisterObjPal(Pal_SpellJavelin_08056938, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelin_08056938, 0x1000);
}

// 9.99 efxmagic-phywpn:StartSpellAnimJavelinCavalier
void sub_08056994(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelin_08056994, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelin_08056994, 0x1000);
}

// 9.99 efxmagic-phywpn:StartSpellAnimJavelinSoldier
void sub_080569F0(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 0);
    SpellFx_RegisterObjPal(Pal_SpellJavelin_080569F0, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelin_080569F0, 0x1000);
}

// 9.99 efxmagic-phywpn:StartSpellAnimJavelinPaladin
void sub_08056A4C(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelin_08056A4C, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelin_08056A4C, 0x1000);
}

// 9.99 efxmagic-phywpn:StartSpellAnimJavelinPegasusKnight
void sub_08056AA8(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelin_08056AA8, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelin_08056AA8, 0x1000);
}

// 9.99 efxmagic-phywpn:StartSpellAnimJavelinFalcon
void sub_08056B04(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelin_08056B04, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelin_08056B04, 0x1000);
}

// 9.99 efxmagic-phywpn:StartSpellAnimJavelinWyvernRider
void sub_08056B60(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelin_08056B60, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelin_08056B60, 0x1000);
}

// 9.99 efxmagic-phywpn:StartSpellAnimJavelinWyvernLord
void sub_08056BBC(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelin_08056BBC, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelin_08056BBC, 0x1000);
}

// 9.99 efxmagic-phywpn:StartSpellAnimJavelinGenerial
void sub_08056C18(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelin_08056C18, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelin_08056C18, 0x1000);
}

// 9.99 efxmagic-phywpn:StartSpellAnimJavelinUnk
void sub_08056C74(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelin_08056C74, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelin_08056C74, 0x1000);
}

// 9.99 efxmagic-phywpn:StartSpellAnimJavelinPaladinF
void sub_08056CD0(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelin_08056CD0, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelin_08056CD0, 0x1000);
}

// 0.95 efxmagic-phywpn:EfxTeyariMain
void EfxTeyariMain(struct ProcEfx * proc)
{
    if (++proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        PlaySFX(0xCA, 0x100, proc->anim->xPosition, 1);

        if (proc->timer == 1)
        {
            struct Anim * animc = GetAnimAnotherSide(proc->anim);
            animc->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
            StartBattleAnimHitEffectsDefault(animc, proc->hitted);

            if (GetEfxHpChangeType(animc) != (2))
            {
                if (CheckRoundCrit(proc->anim) == true)
                    NewEfxPierceCritical(animc);
                else if (proc->hitted != false)
                    return;
                else
                    NewEfxNormalEffect(proc->anim);
            }
            if (proc->hitted == false)
                EfxPlayHittedSFX(animc);

            return;
        }
    }

    if (proc->timer == 0xE)
    {
        return;
    }

    if (proc->timer == 0x10)
    {
        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

// 0.84 efxmagic-phywpn:NewEfxTeyariOBJ
void NewEfxTeyariOBJ(struct Anim * anim, int type)
{
    struct Anim * anim2;
    struct ProcEfxMagicOBJ * proc;
    u32 * scr1, * scr2;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxTeyariOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (type == 0)
    {
        scr2 = AnimScr_EfxTeyariObjType0Right;
        scr1 = AnimScr_EfxTeyariObjType0Left;
    }
    else
    {
        scr2 = AnimScr_EfxTeyariObjType1Right;
        scr1 = AnimScr_EfxTeyariObjType1Left;
    }

    anim2 = EfxCreateFrontAnim(anim, scr1, scr2, scr1, scr2);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == POS_L)
        anim2->xPosition += 0x38;
    else
        anim2->xPosition -= 0x38;
}

// 0.95 efxmagic-phywpn:EfxTeyariObjMain
void EfxTeyariObjMain(struct ProcEfxMagicOBJ * proc)
{
    if (++proc->timer == 0xC)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}
