#include "gbafe.h"

extern const struct AnimSpriteData AnimSprite_ArrowCloseLeft_08BA5324[],
    AnimSprite_ArrowCloseLeft_08BA5348[], AnimSprite_ArrowCloseLeft_08BA536C[],
    AnimSprite_ArrowCloseRight_08BA5298[], AnimSprite_ArrowCloseRight_08BA52BC[],
    AnimSprite_ArrowCloseRight_08BA52E0[], AnimSprite_EfxTeyariObjType0Left_08BA5604[],
    AnimSprite_EfxTeyariObjType0Left_08BA5628[], AnimSprite_EfxTeyariObjType0Left_08BA564C[],
    AnimSprite_EfxTeyariObjType0Left_08BA5664[], AnimSprite_EfxTeyariObjType0Left_08BA5688[],
    AnimSprite_EfxTeyariObjType0Left_08BA56AC[], AnimSprite_EfxTeyariObjType0Left_08BA56D0[],
    AnimSprite_EfxTeyariObjType0Left_08BA56F4[], AnimSprite_EfxTeyariObjType0Left_08BA5718[],
    AnimSprite_EfxTeyariObjType0Left_08BA573C[], AnimSprite_EfxTeyariObjType0Left_08BA5760[],
    AnimSprite_EfxTeyariObjType0Left_08BA5784[], AnimSprite_EfxTeyariObjType0Left_08BA57A8[],
    AnimSprite_EfxTeyariObjType0Left_08BA57C0[], AnimSprite_EfxTeyariObjType0Right_08BA53B0[],
    AnimSprite_EfxTeyariObjType0Right_08BA53D4[], AnimSprite_EfxTeyariObjType0Right_08BA53F8[],
    AnimSprite_EfxTeyariObjType0Right_08BA5410[], AnimSprite_EfxTeyariObjType0Right_08BA5434[],
    AnimSprite_EfxTeyariObjType0Right_08BA5458[], AnimSprite_EfxTeyariObjType0Right_08BA547C[],
    AnimSprite_EfxTeyariObjType0Right_08BA54A0[], AnimSprite_EfxTeyariObjType0Right_08BA54C4[],
    AnimSprite_EfxTeyariObjType0Right_08BA54E8[], AnimSprite_EfxTeyariObjType0Right_08BA550C[],
    AnimSprite_EfxTeyariObjType0Right_08BA5530[], AnimSprite_EfxTeyariObjType0Right_08BA5554[],
    AnimSprite_EfxTeyariObjType0Right_08BA556C[], AnimSprite_EfxTeyariObjType1Left_08BA5AB8[],
    AnimSprite_EfxTeyariObjType1Left_08BA5AD0[], AnimSprite_EfxTeyariObjType1Left_08BA5B00[],
    AnimSprite_EfxTeyariObjType1Left_08BA5B24[], AnimSprite_EfxTeyariObjType1Left_08BA5B48[],
    AnimSprite_EfxTeyariObjType1Left_08BA5B6C[], AnimSprite_EfxTeyariObjType1Left_08BA5B90[],
    AnimSprite_EfxTeyariObjType1Left_08BA5BB4[], AnimSprite_EfxTeyariObjType1Left_08BA5BD8[],
    AnimSprite_EfxTeyariObjType1Left_08BA5BFC[], AnimSprite_EfxTeyariObjType1Left_08BA5C20[],
    AnimSprite_EfxTeyariObjType1Left_08BA5C44[], AnimSprite_EfxTeyariObjType1Left_08BA5C68[],
    AnimSprite_EfxTeyariObjType1Left_08BA5C80[], AnimSprite_EfxTeyariObjType1Right_08BA5858[],
    AnimSprite_EfxTeyariObjType1Right_08BA5870[], AnimSprite_EfxTeyariObjType1Right_08BA58A0[],
    AnimSprite_EfxTeyariObjType1Right_08BA58C4[], AnimSprite_EfxTeyariObjType1Right_08BA58E8[],
    AnimSprite_EfxTeyariObjType1Right_08BA590C[], AnimSprite_EfxTeyariObjType1Right_08BA5930[],
    AnimSprite_EfxTeyariObjType1Right_08BA5954[], AnimSprite_EfxTeyariObjType1Right_08BA5978[],
    AnimSprite_EfxTeyariObjType1Right_08BA599C[], AnimSprite_EfxTeyariObjType1Right_08BA59C0[],
    AnimSprite_EfxTeyariObjType1Right_08BA59E4[], AnimSprite_EfxTeyariObjType1Right_08BA5A08[],
    AnimSprite_EfxTeyariObjType1Right_08BA5A20[], AnimSprite_TeonoObj2Left_08BA51C4[],
    AnimSprite_TeonoObj2Right_08BA4E2C[], AnimSprite_TeonoObjCloseLeft_08BA4F00[],
    AnimSprite_TeonoObjCloseLeft_08BA4F18[], AnimSprite_TeonoObjCloseLeft_08BA4F30[],
    AnimSprite_TeonoObjCloseLeft_08BA4F48[], AnimSprite_TeonoObjCloseLeft_08BA4F60[],
    AnimSprite_TeonoObjCloseLeft_08BA4F78[], AnimSprite_TeonoObjCloseLeft_08BA4F90[],
    AnimSprite_TeonoObjCloseLeft_08BA4FA8[], AnimSprite_TeonoObjCloseLeft_08BA4FC0[],
    AnimSprite_TeonoObjCloseLeft_08BA4FD8[], AnimSprite_TeonoObjCloseLeft_08BA4FF0[],
    AnimSprite_TeonoObjCloseLeft_08BA5014[], AnimSprite_TeonoObjCloseLeft_08BA5038[],
    AnimSprite_TeonoObjCloseLeft_08BA505C[], AnimSprite_TeonoObjCloseLeft_08BA5080[],
    AnimSprite_TeonoObjCloseLeft_08BA50A4[], AnimSprite_TeonoObjCloseLeft_08BA50C8[],
    AnimSprite_TeonoObjCloseLeft_08BA50EC[], AnimSprite_TeonoObjCloseLeft_08BA5110[],
    AnimSprite_TeonoObjCloseLeft_08BA5134[], AnimSprite_TeonoObjCloseLeft_08BA5158[],
    AnimSprite_TeonoObjCloseLeft_08BA517C[], AnimSprite_TeonoObjCloseRight_08BA4B68[],
    AnimSprite_TeonoObjCloseRight_08BA4B80[], AnimSprite_TeonoObjCloseRight_08BA4B98[],
    AnimSprite_TeonoObjCloseRight_08BA4BB0[], AnimSprite_TeonoObjCloseRight_08BA4BC8[],
    AnimSprite_TeonoObjCloseRight_08BA4BE0[], AnimSprite_TeonoObjCloseRight_08BA4BF8[],
    AnimSprite_TeonoObjCloseRight_08BA4C10[], AnimSprite_TeonoObjCloseRight_08BA4C28[],
    AnimSprite_TeonoObjCloseRight_08BA4C40[], AnimSprite_TeonoObjCloseRight_08BA4C58[],
    AnimSprite_TeonoObjCloseRight_08BA4C7C[], AnimSprite_TeonoObjCloseRight_08BA4CA0[],
    AnimSprite_TeonoObjCloseRight_08BA4CC4[], AnimSprite_TeonoObjCloseRight_08BA4CE8[],
    AnimSprite_TeonoObjCloseRight_08BA4D0C[], AnimSprite_TeonoObjCloseRight_08BA4D30[],
    AnimSprite_TeonoObjCloseRight_08BA4D54[], AnimSprite_TeonoObjCloseRight_08BA4D78[],
    AnimSprite_TeonoObjCloseRight_08BA4D9C[], AnimSprite_TeonoObjCloseRight_08BA4DC0[],
    AnimSprite_TeonoObjCloseRight_08BA4DE4[], AnimSprite_TeonoObjFarLeft_08BA5194[],
    AnimSprite_TeonoObjFarLeft_08BA51AC[], AnimSprite_TeonoObjFarRight_08BA4DFC[],
    AnimSprite_TeonoObjFarRight_08BA4E14[];

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
extern const struct ProcCmd ProcScr_efxDummymagic[];
extern const struct ProcCmd ProcScr_efxTeono[];
// MISSING var (2)
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_efxTeonoOBJ[];
extern const AnimScr AnimScr_TeonoObjCloseLeft[];
extern const AnimScr AnimScr_TeonoObjCloseRight[];
extern const AnimScr AnimScr_TeonoObjFarLeft[];
extern const AnimScr AnimScr_TeonoObjFarRight[];
extern u16 Pal_TeonoOBJ[];
extern u16 Img_TeonoOBJ[];
extern u32 gUnknown_02017754;
extern const struct ProcCmd ProcScr_efxTeonoOBJ2[];
extern const AnimScr AnimScr_TeonoObj2Left[];
extern const AnimScr AnimScr_TeonoObj2Right[];
extern const struct ProcCmd ProcScr_efxTeonoSE[];
extern const struct ProcCmd ProcScr_efxArrow[];
extern const struct ProcCmd ProcScr_efxArrowOBJ[];
extern const AnimScr AnimScr_ArrowCloseLeft[];
extern const AnimScr AnimScr_ArrowCloseRight[];
extern const AnimScr AnimScr_ArrowFarLeft[];
extern const AnimScr AnimScr_ArrowFarRight[];
extern u16 Img_EfxArrowOBJ[];
extern const struct ProcCmd ProcScr_efxTeyari[];
extern const struct ProcCmd ProcScr_efxTeyariOBJ[];
extern const AnimScr AnimScr_EfxTeyariObjType0Right[];
extern const AnimScr AnimScr_EfxTeyariObjType0Left[];
extern const AnimScr AnimScr_EfxTeyariObjType1Right[];
extern const AnimScr AnimScr_EfxTeyariObjType1Left[];

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
            gEfxTeonoState = 1;
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
        gEfxTeonoState = 1;
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
    const AnimScr * scr1, * scr2;

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

SECTION(".rodata.08BA15BC")
const struct ProcCmd ProcScr_efxDummymagic[] = {
    PROC_19,
    PROC_REPEAT(EfxDummymagicMain),
    PROC_END,
};

SECTION(".rodata.08BA15D4")
const struct ProcCmd ProcScr_efxTeono[] = {
    PROC_19,
    PROC_REPEAT(EfxTeonoMain),
    PROC_END,
};

SECTION(".rodata.08BA15EC")
const struct ProcCmd ProcScr_efxTeonoOBJ[] = {
    PROC_19,
    PROC_REPEAT(EfxTeonoObjMain),
    PROC_REPEAT(EfxTeonoObjEnd),
    PROC_END,
};

SECTION(".rodata.08BA160C")
const struct ProcCmd ProcScr_efxTeonoOBJ2[] = {
    PROC_19,
    PROC_REPEAT(EfxTeonoObj2Main),
    PROC_END,
};

SECTION(".rodata.08BA1624")
const struct ProcCmd ProcScr_efxTeonoSE[] = {
    PROC_19,
    PROC_SET_END_CB(EfxTeonoSeCallBack),
    PROC_REPEAT(EfxTeonoSeMain),
    PROC_END,
};

SECTION(".rodata.08BA1644")
const struct ProcCmd ProcScr_efxArrow[] = {
    PROC_19,
    PROC_REPEAT(EfxArrowMain),
    PROC_END,
};

SECTION(".rodata.08BA165C")
const struct ProcCmd ProcScr_efxArrowOBJ[] = {
    PROC_19,
    PROC_REPEAT(EfxArrowObjMain),
    PROC_END,
};

SECTION(".rodata.08BA1674")
const struct ProcCmd ProcScr_efxTeyari[] = {
    PROC_19,
    PROC_REPEAT(EfxTeyariMain),
    PROC_END,
};

SECTION(".rodata.08BA168C")
const struct ProcCmd ProcScr_efxTeyariOBJ[] = {
    PROC_19,
    PROC_REPEAT(EfxTeyariObjMain),
    PROC_END,
};

SECTION(".rodata.08BA4E50")
const AnimScr AnimScr_TeonoObjCloseRight[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4B68, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4B80, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4B98, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4BB0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4BC8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4BE0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4BF8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4C10, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4C28, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4C40, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4C58, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4C7C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4CA0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4CC4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4CE8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4D0C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4D30, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4D54, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4D78, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4D9C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4DC0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4DE4, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA4EAC")
const AnimScr AnimScr_TeonoObjFarRight[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4B68, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4B80, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4B98, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4BB0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4BC8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjFarRight_08BA4DFC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjFarRight_08BA4E14, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA4ECC")
const AnimScr AnimScr_TeonoObj2Right[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj2Right_08BA4E2C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4C7C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4CA0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4CC4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4CE8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4D0C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4D30, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4D54, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4D78, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4D9C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4DC0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseRight_08BA4DE4, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA51E8")
const AnimScr AnimScr_TeonoObjCloseLeft[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4F00, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4F18, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4F30, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4F48, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4F60, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4F78, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4F90, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4FA8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4FC0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4FD8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4FF0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA5014, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA5038, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA505C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA5080, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA50A4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA50C8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA50EC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA5110, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA5134, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA5158, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA517C, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA5244")
const AnimScr AnimScr_TeonoObjFarLeft[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4F00, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4F18, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4F30, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4F48, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA4F60, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjFarLeft_08BA5194, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjFarLeft_08BA51AC, 2),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA5264")
const AnimScr AnimScr_TeonoObj2Left[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj2Left_08BA51C4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA5014, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA5038, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA505C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA5080, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA50A4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA50C8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA50EC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA5110, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA5134, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA5158, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_08BA517C, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA5304")
const AnimScr AnimScr_ArrowCloseRight[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_ArrowCloseRight_08BA5298, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_ArrowCloseRight_08BA52BC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_ArrowCloseRight_08BA52E0, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA5314")
const AnimScr AnimScr_ArrowFarRight[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_ArrowCloseRight_08BA5298, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_ArrowCloseRight_08BA52BC, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_ArrowCloseRight_08BA52E0, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA5390")
const AnimScr AnimScr_ArrowCloseLeft[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_ArrowCloseLeft_08BA5324, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_ArrowCloseLeft_08BA5348, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_ArrowCloseLeft_08BA536C, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA53A0")
const AnimScr AnimScr_ArrowFarLeft[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_ArrowCloseLeft_08BA5324, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_ArrowCloseLeft_08BA5348, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_ArrowCloseLeft_08BA536C, 1),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA5584")
const AnimScr AnimScr_EfxTeyariObjType0Right[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA53B0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA53D4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA53F8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA5410, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA5434, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA5458, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA547C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA54A0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA54C4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA54E8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA550C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA5530, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA5554, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA556C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA5554, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA556C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA5554, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA556C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA5554, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA556C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA5554, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA556C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA5554, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA556C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA5554, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA556C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA5554, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA556C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA5554, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Right_08BA556C, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA57D8")
const AnimScr AnimScr_EfxTeyariObjType0Left[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA5604, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA5628, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA564C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA5664, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA5688, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA56AC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA56D0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA56F4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA5718, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA573C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA5760, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA5784, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57A8, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57A8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57A8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57A8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57A8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57A8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57A8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57A8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57A8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType0Left_08BA57C0, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA5A38")
const AnimScr AnimScr_EfxTeyariObjType1Right[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5858, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5870, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA58A0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA58C4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA58E8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA590C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5930, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5954, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5978, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA599C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA59C0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA59E4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A08, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A20, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A08, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A20, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A08, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A20, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A08, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A20, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A08, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A20, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A08, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A20, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A08, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A20, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A08, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A20, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A08, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Right_08BA5A20, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_BLOCKED,
};

SECTION(".rodata.08BA5C98")
const AnimScr AnimScr_EfxTeyariObjType1Left[] = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5AB8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5AD0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5B00, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5B24, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5B48, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5B6C, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5B90, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5BB4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5BD8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5BFC, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C20, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C44, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C68, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C80, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C68, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C80, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C68, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C80, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C68, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C80, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C68, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C80, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C68, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C80, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C68, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C80, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C68, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C80, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C68, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeyariObjType1Left_08BA5C80, 31),
    ANIMSCR_WAIT(0x13),
    ANIMSCR_BLOCKED,
};
