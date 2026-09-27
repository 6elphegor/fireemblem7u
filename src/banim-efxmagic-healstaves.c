#include "gbafe.h"

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxHpBarLive(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void sub_0805076C(void);
void NewEfxFlashUnit(struct Anim * anim, u16 dura1, u16 dura2, int c);
extern struct ProcCmd ProcScr_efxLive[];
extern struct ProcCmd ProcScr_efxRelive[];
extern struct ProcCmd ProcScr_efxRecover[];
extern struct ProcCmd ProcScr_efxReblow[];
extern int gEfxBgSemaphore;
extern struct ProcCmd ProcScr_efxLiveBG[];
extern const u16 gUnknown_081E8CB0[];
extern u16 * Tsa_HealSpellBg[];
extern u16 Img_HealSpellBg[];
extern const u16 gUnknown_081E8CBC[];
extern u16 * Tsa_EfxLiveBG_B_L[];
extern u16 * Tsa_EfxLiveBG_B_R[];
extern u16 Img_EfxLiveBG_B[];
extern const u16 gUnknown_081E8CB6[];
extern const u16 gUnknown_081E8CC2[];
extern struct ProcCmd ProcScr_efxLiveBGCOL[];
extern const u16 gUnknown_081E8CC8[];
extern const u16 gUnknown_081E8D4C[];
extern const u16 gUnknown_081E8D7E[];
extern u16 Pal_HealSpellBg[];
extern u16 Pal_0826C934[];
extern u16 Pal_0826C714[];
extern const u16 gUnknown_081E8D0A[];
extern struct ProcCmd ProcScr_efxLiveALPHA[];
extern struct ProcCmd ProcScr_efxLiveOBJ[];
extern AnimScr AnimScr_EfxLiveOBJ1[];
extern u16 Pal_HealSprites_Sparkles[];
extern u16 Img_HealSprites_Sparkles[];
extern struct ProcCmd ProcScr_efxReserveOBJ[];
extern u32 AnimScr_EfxLiveOBJ2[];
extern struct ProcCmd ProcScr_efxReblowOBJ[];
extern u32 AnimScr_EfxReblowOBJ_Right1[];
extern u32 AnimScr_EfxReblowOBJ_Left1[];
extern u32 AnimScr_EfxReblowOBJ_Right2[];
extern u32 AnimScr_EfxReblowOBJ_Left2[];
extern struct ProcCmd ProcScr_efxReserve[];
extern struct ProcCmd ProcScr_efxReserveBG[];
extern u16 * TsaArray_Fortify[];
extern struct ProcCmd ProcScr_efxReserveBGCOL[];
extern u16 Pal_0826D3D4[];
extern u16 Pal_0826D5D4[];
extern struct ProcCmd ProcScr_efxReserveBG2[];
extern u16 * TsaArray_FortifyBg2[];
extern struct Anim * gUnknown_02000010[2];
extern struct ProcCmd ProcScr_efxReserveBGCOL2[];
extern u16 Pal_0826D7D4[];
extern struct ProcCmd ProcScr_efxRest[];
extern struct ProcCmd ProcScr_efxRestBG[];
extern u16 * TsaArray_RestoreBg[];
extern u16 * ImgArray_RestoreBg[];
extern u16 Pal_MapAnimRestore[];
extern struct ProcCmd ProcScr_efxRestOBJ[];
extern u32 AnimScr_EfxRestOBJ[];
extern u16 Pal_SleepSprites[];
extern u16 Img_SleepSprites[];

void StartSpellAnimHeal(struct Anim * anim);
void efxLive_Loop_Main(struct ProcEfx * proc);
void StartSpellAnimMend(struct Anim * anim);
void efxRelive_Loop_Main(struct ProcEfx * proc);
void StartSpellAnimRecover(struct Anim * anim);
void efxRecover_Loop_Main(struct ProcEfx * proc);
void StartSpellAnimPhysic(struct Anim * anim);
void efxReblow_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxLiveBG_A(struct Anim * anim, u32 kind);
void StartSubSpell_efxLiveBG_B(struct Anim * anim, u32 kind);
void efxLiveBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxLiveBGCOL_A(struct Anim * anim, u32 kind);
void StartSubSpell_efxLiveBGCOL_B(struct Anim * anim, u32 kind);
void efxLiveBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxLiveALPHA(struct Anim * anim, int timer, int c, int d);
void efxLiveALPHA_Loop_A(struct ProcEfxALPHA * proc);
void efxLiveALPHA_Loop_B(struct ProcEfxALPHA * proc);
void StartSubSpell_efxLiveOBJ(struct Anim * anim);
void StartSubSpell_efxReserveOBJ(struct Anim * anim);
void efxLiveOBJ_Loop(struct ProcEfxOBJ * proc);
void efxReserveOBJ_Loop_A(struct ProcEfxOBJ * proc);
void efxReserveOBJ_Loop_B(struct ProcEfxOBJ * proc);
void StartSubSpell_efxReblowOBJ(struct Anim * anim, u32 kind);
void efxReblowOBJ_Loop_A(struct ProcEfxOBJ * proc);
void efxReblowOBJ_Loop_B(struct ProcEfxOBJ * proc);
void StartSpellAnimFortify(struct Anim * anim);
void StartSpellAnimLatona(struct Anim * anim);
void efxReserve_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxReserveBG(struct Anim * anim);
void efxReserveBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxReserveBGCOL(struct Anim * anim, u32 kind);
void efxReserveBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxReserveBG2(struct Anim * anim);
void efxReserveBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxReserveBGCOL2(struct Anim * anim, u32 kind);
void efxReserveBGCOL2_Loop(struct ProcEfxBGCOL * proc);
void StartSpellAnimRestore(struct Anim * anim);
void efxRest_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxRestBG(struct Anim * anim);
void efxRestBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxRestOBJ(struct Anim * anim);
void efxRestOBJ_Loop(void);

extern const u16 StartSubSpell_efxReserveBG_frames[];
extern const u16 efxReserveBG_Loop_songIds[];
extern const u16 efxReserveBG_Loop_positions[];
extern const u16 StartSubSpell_efxReserveBGCOL_frames[];
extern const u16 StartSubSpell_efxReserveBG2_frames[];
extern const u16 StartSubSpell_efxReserveBGCOL2_frames[];
extern const u16 StartSubSpell_efxRestBG_frames[];

// 9.99 efxmagic-healstaves:StartSpellAnimHeal
void StartSpellAnimHeal(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxLive, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    return;
}

// 9.99 efxmagic-healstaves:efxLive_Loop_Main
void efxLive_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxLiveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxLiveBG_A(proc->anim, 0);
        StartSubSpell_efxLiveBGCOL_A(proc->anim, 0);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 35, 25, 1);

        PlaySFX(0x10e, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 55)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 113)
    {
        StartSubSpell_efxLiveBG_B(proc->anim, 0);
        StartSubSpell_efxLiveBGCOL_B(proc->anim, 0);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 29, 25, 1);

        PlaySFX(0x10F, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == 166)
    {
        NewEfxHpBarLive(anim);
    }
    else if (proc->timer == 181)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        if (GetAnimNextRoundType(anim) != -1)
        {
            anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        }

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSpellAnimMend
void StartSpellAnimMend(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxRelive, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    return;
}

// 9.99 efxmagic-healstaves:efxRelive_Loop_Main
void efxRelive_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxLiveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxLiveBG_A(proc->anim, 1);
        StartSubSpell_efxLiveBGCOL_A(proc->anim, 1);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 35, 25, 1);

        PlaySFX(0x110, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 55)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 113)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 114)
    {
        StartSubSpell_efxLiveBG_B(proc->anim, 1);
        StartSubSpell_efxLiveBGCOL_B(proc->anim, 1);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 29, 25, 1);

        PlaySFX(0x111, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 166)
    {
        NewEfxHpBarLive(anim);
    }
    else if (proc->timer == duration + 181)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        if (GetAnimNextRoundType(anim) != -1)
        {
            anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        }

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSpellAnimRecover
void StartSpellAnimRecover(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxRecover, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    return;
}

// 9.99 efxmagic-healstaves:efxRecover_Loop_Main
void efxRecover_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxLiveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxLiveBG_A(proc->anim, 2);
        StartSubSpell_efxLiveBGCOL_A(proc->anim, 2);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 35, 25, 1);

        PlaySFX(0x112, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 55)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 113)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 114)
    {
        StartSubSpell_efxLiveBG_B(proc->anim, 2);
        StartSubSpell_efxLiveBGCOL_B(proc->anim, 2);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 29, 25, 1);

        PlaySFX(0x113, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 166)
    {
        NewEfxHpBarLive(anim);
    }
    else if (proc->timer == duration + 181)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        if (GetAnimNextRoundType(anim) != -1)
        {
            anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        }

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSpellAnimPhysic
void StartSpellAnimPhysic(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxReblow, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    return;
}

// 9.99 efxmagic-healstaves:efxReblow_Loop_Main
void efxReblow_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxLiveOBJ(proc->anim);
        StartSubSpell_efxReblowOBJ(proc->anim, 0);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxLiveBG_A(proc->anim, 0);
        StartSubSpell_efxLiveBGCOL_A(proc->anim, 0);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 35, 25, 1);

        PlaySFX(0x10e, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 55)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 151)
    {
        StartSubSpell_efxReblowOBJ(proc->anim, 1);
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 161)
    {
        StartSubSpell_efxLiveBG_B(proc->anim, 0);
        StartSubSpell_efxLiveBGCOL_B(proc->anim, 0);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 29, 25, 1);

        PlaySFX(0x10F, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 211)
    {
        NewEfxHpBarLive(anim);
        return;
    }
    else if (proc->timer == duration + 221)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        if (GetAnimNextRoundType(anim) != -1)
        {
            anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        }

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxLiveBG_A
void StartSubSpell_efxLiveBG_A(struct Anim * anim, u32 kind)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    switch (kind)
    {
        case 0:
            proc->unk29 = 1;
            proc->frame_config = gUnknown_081E8CB0;
            proc->tsal = Tsa_HealSpellBg;
            proc->tsar = Tsa_HealSpellBg;

            SpellFx_RegisterBgGfx(Img_HealSpellBg, 32 * 1 * CHR_SIZE);

            if (gEkrDistanceType != 0)
            {
                if (GetAnimPosition(proc->anim) == 0)
                {
                    SetBgOffset(BG_1, 24, 0);
                }
                else
                {
                    SetBgOffset(BG_1, 232, 0);
                }
            }

            break;

        case 1:
        case 2:
            proc->unk29 = 1;
            proc->frame_config = gUnknown_081E8CBC;

            proc->tsal = Tsa_EfxLiveBG_B_L;
            proc->tsar = Tsa_EfxLiveBG_B_R;

            SpellFx_RegisterBgGfx(Img_EfxLiveBG_B, 28 * 6 * CHR_SIZE);

            break;
    }

    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxLiveBG_B
void StartSubSpell_efxLiveBG_B(struct Anim * anim, u32 kind)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    proc->unk29 = 0;

    switch (kind)
    {
        case 0:
            proc->frame_config = gUnknown_081E8CB6;
            proc->tsal = Tsa_HealSpellBg;
            proc->tsar = Tsa_HealSpellBg;

            SpellFx_RegisterBgGfx(Img_HealSpellBg, 32 * 1 * CHR_SIZE);

            if (gEkrDistanceType != 0)
            {
                if (GetAnimPosition(proc->anim) == 0)
                {
                    SetBgOffset(BG_1, 232, 0);
                }
                else
                {
                    SetBgOffset(BG_1, 24, 0);
                }
            }

            break;

        case 1:
        case 2:
            proc->frame_config = gUnknown_081E8CC2;

            proc->tsal = Tsa_EfxLiveBG_B_L;
            proc->tsar = Tsa_EfxLiveBG_B_R;

            SpellFx_RegisterBgGfx(Img_EfxLiveBG_B, 28 * 6 * CHR_SIZE);

            break;
    }

    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-healstaves:efxLiveBG_Loop
void efxLiveBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        // TODO: Is this the correct data type?
        EfxCreateBackAnim(proc->anim, (u16 *)(tsaL + ret * 0x12c), (u16 *)(tsaR + ret * 0x12c));
    }
    else
    {
        if (ret == -1)
        {
            if (proc->unk29 == 0)
            {
                SpellFx_ClearBG1();
                SpellFx_ClearColorEffects();
            }

            SetBgOffset(BG_1, 0, 0);
            gEfxBgSemaphore--;

            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxLiveBGCOL_A
void StartSubSpell_efxLiveBGCOL_A(struct Anim * anim, u32 kind)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    if (kind == 0)
    {
        proc->frame_config = gUnknown_081E8CC8;
    }
    else if (kind == 1)
    {
        proc->frame_config = gUnknown_081E8D4C;
    }
    else
    {
        proc->frame_config = gUnknown_081E8D7E;
    }

    if (kind == 0)
    {
        proc->pal = Pal_HealSpellBg;
    }
    else if (kind == 1)
    {
        proc->pal = Pal_0826C934;
    }
    else
    {
        proc->pal = Pal_0826C714;
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxLiveBGCOL_B
void StartSubSpell_efxLiveBGCOL_B(struct Anim * anim, u32 kind)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    if (kind == 0)
    {
        proc->frame_config = gUnknown_081E8D0A;
    }
    else if (kind == 1)
    {
        proc->frame_config = gUnknown_081E8D4C;
    }
    else
    {
        proc->frame_config = gUnknown_081E8D7E;
    }

    if (kind == 0)
    {
        proc->pal = Pal_HealSpellBg;
    }
    else if (kind == 1)
    {
        proc->pal = Pal_0826C934;
    }
    else
    {
        proc->pal = Pal_0826C714;
    }

    return;
}

// 9.99 efxmagic-healstaves:efxLiveBGCOL_Loop
void efxLiveBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxLiveALPHA
void StartSubSpell_efxLiveALPHA(struct Anim * anim, int timer, int c, int d)
{
    struct ProcEfxALPHA * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveALPHA, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = timer;
    proc->unk2E = c;
    proc->unk29 = d;

    return;
}

// 9.99 efxmagic-healstaves:efxLiveALPHA_Loop_A
void efxLiveALPHA_Loop_A(struct ProcEfxALPHA * proc)
{
    proc->timer--;

    if (proc->timer == 0)
    {
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:efxLiveALPHA_Loop_B
void efxLiveALPHA_Loop_B(struct ProcEfxALPHA * proc)
{
    int coeffA;

    if (proc->timer > proc->unk2E)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
    else
    {
        if (proc->unk29 == 0)
        {
            coeffA = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->unk2E);
        }
        else
        {
            coeffA = Interpolate(INTERPOLATE_LINEAR, 16, 0, proc->timer, proc->unk2E);
        }

        SetBlendAlpha(coeffA, 16);

        proc->timer++;
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxLiveOBJ
void StartSubSpell_efxLiveOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 51;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1);

    SpellFx_RegisterObjPal(Pal_HealSprites_Sparkles, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_HealSprites_Sparkles, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxReserveOBJ
void StartSubSpell_efxReserveOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 51;
    proc->unk30 = 52;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1, AnimScr_EfxLiveOBJ1);

    SpellFx_RegisterObjPal(Pal_HealSprites_Sparkles, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_HealSprites_Sparkles, 32 * 4 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-healstaves:efxLiveOBJ_Loop
void efxLiveOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:efxReserveOBJ_Loop_A
void efxReserveOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        anim->pScrStart = AnimScr_EfxLiveOBJ2;
        anim->pScrCurrent = AnimScr_EfxLiveOBJ2;

        anim->timer = 0;
        proc->timer = 0;

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:efxReserveOBJ_Loop_B
void efxReserveOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == (s16)proc->unk30)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxReblowOBJ
void StartSubSpell_efxReblowOBJ(struct Anim * anim, u32 kind)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReblowOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk29 = kind;

    if (kind == 0)
    {
        proc->terminator = 43;
        proc->unk30 = 68;
    }
    else
    {
        proc->terminator = 31;
        proc->unk30 = 61;
    }

    return;
}

// 9.99 efxmagic-healstaves:efxReblowOBJ_Loop_A
void efxReblowOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim;
    int x;
    int y;
    u32 * scrA;
    u32 * scrB;

    proc->timer++;

    if (proc->timer != proc->terminator)
    {
        return;
    }

    proc->timer = 0;

    if (proc->unk29 == 0)
    {
        scrA = AnimScr_EfxReblowOBJ_Right1;
        scrB = AnimScr_EfxReblowOBJ_Left1;

        if (gEkrDistanceType != 0)
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 104 : 136;
        }
        else
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 128 : 112;
        }

        y = 78;
    }
    else
    {
        scrA = AnimScr_EfxReblowOBJ_Right2;
        scrB = AnimScr_EfxReblowOBJ_Left2;

        if (gEkrDistanceType != 0)
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 164 : 76;
        }
        else
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 140 : 100;
        }

        y = 64;
    }

    anim = EfxCreateFrontAnim(proc->anim, scrB, scrA, scrB, scrA);
    proc->anim2 = anim;
    anim->xPosition = x;
    anim->yPosition = y;

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-healstaves:efxReblowOBJ_Loop_B
void efxReblowOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == (s16)proc->unk30)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSpellAnimFortify
void StartSpellAnimFortify(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxReserve, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = 0;

    return;
}

// 9.99 efxmagic-healstaves:StartSpellAnimLatona
void StartSpellAnimLatona(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxReserve, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = 1;

    return;
}

// 9.99 efxmagic-healstaves:efxReserve_Loop_Main
void efxReserve_Loop_Main(struct ProcEfx * proc)
{
    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxReserveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxReserveBG(proc->anim);
        StartSubSpell_efxReserveBGCOL(proc->anim, proc->hitted);
    }
    else if (proc->timer == 183)
    {
        PlaySFX(0x114, 0x100, 120, 0);

        StartSubSpell_efxReserveBG2(proc->anim);
        StartSubSpell_efxReserveBGCOL2(proc->anim, proc->hitted);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 20, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 180, 40, 1);
    }
    else if (proc->timer == 453)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxReserveBG
void StartSubSpell_efxReserveBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxReserveBG_frames;

    proc->tsal = TsaArray_Fortify;
    proc->tsar = TsaArray_Fortify;

    SpellFx_RegisterBgGfx(Img_HealSpellBg, 32 * 1 * CHR_SIZE);
    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-healstaves:efxReserveBG_Loop
void efxReserveBG_Loop(struct ProcEfxBG * proc)
{


    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        int songId;
        int location;

        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        SpellFx_WriteBgMap(anim, *(tsaL + ret), *(tsaR + ret));

        songId = efxReserveBG_Loop_songIds[ret];
        location = efxReserveBG_Loop_positions[ret];
        PlaySFX(songId, 0x100, location, 0);
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SpellFx_ClearColorEffects();
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxReserveBGCOL
void StartSubSpell_efxReserveBGCOL(struct Anim * anim, u32 kind)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxReserveBGCOL_frames;

    if (kind == 0)
    {
        proc->pal = Pal_0826D3D4;
    }
    else
    {
        proc->pal = Pal_0826D5D4;
    }

    return;
}

// 9.99 efxmagic-healstaves:efxReserveBGCOL_Loop
void efxReserveBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxReserveBG2
void StartSubSpell_efxReserveBG2(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;
    struct Anim * otherAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxReserveBG2_frames;

    proc->tsal = TsaArray_FortifyBg2;
    proc->tsar = TsaArray_FortifyBg2;

    SpellFx_RegisterBgGfx(Img_EfxLiveBG_B, 28 * 6 * CHR_SIZE);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    sub_0805076C();

    anim->oam2Base &= ~OAM2_LAYER(3);
    anim->oam2Base |= OAM2_LAYER(1);

    otherAnim = gUnknown_02000010[GetAnimPosition(anim)];
    if (otherAnim != NULL)
    {
        otherAnim->oam2Base &= ~OAM2_LAYER(3);
        otherAnim->oam2Base |= OAM2_LAYER(1);
    }

    SpellFx_SetSomeColorEffect();
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    return;
}

// 9.99 efxmagic-healstaves:efxReserveBG2_Loop
void efxReserveBG2_Loop(struct ProcEfxBG * proc)
{
    int ret;

    struct Anim * procAnim = proc->anim;
    struct Anim * otherAnim = GetAnimAnotherSide(procAnim);

    struct Anim * anim3 = gUnknown_02000010[GetAnimPosition(procAnim)];

    if (anim3 != NULL)
    {
        anim3->oam2Base &= ~OAM2_LAYER(3);
        anim3->oam2Base |= OAM2_LAYER(1);
    }

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        SpellFx_WriteBgMap(otherAnim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();

            gEfxBgSemaphore--;

            gDispIo.bg0_ct.priority = 0;
            gDispIo.bg1_ct.priority = 1;
            gDispIo.bg2_ct.priority = 2;
            gDispIo.bg3_ct.priority = 3;

            procAnim->oam2Base &= ~OAM2_LAYER(3);
            procAnim->oam2Base |= OAM2_LAYER(2);

            if (anim3 != NULL)
            {
                anim3->oam2Base &= ~OAM2_LAYER(3);
                anim3->oam2Base |= OAM2_LAYER(2);
            }

            SpellFx_ClearColorEffects();
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxReserveBGCOL2
void StartSubSpell_efxReserveBGCOL2(struct Anim * anim, u32 kind)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveBGCOL2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxReserveBGCOL2_frames;

    if (kind == 0)
    {
        proc->pal = Pal_HealSpellBg;
    }
    else
    {
        proc->pal = Pal_0826D7D4;
    }

    return;
}

// 9.99 efxmagic-healstaves:efxReserveBGCOL2_Loop
void efxReserveBGCOL2_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSpellAnimRestore
void StartSpellAnimRestore(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxRest, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-healstaves:efxRest_Loop_Main
void efxRest_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 1)
    {
        StartSubSpell_efxRestBG(anim);
        NewEfxALPHA(anim, 40, 30, 16, 8, 0);
        NewEfxALPHA(anim, 71, 30, 8, 16, 0);
        NewEfxALPHA(anim, 102, 30, 16, 8, 0);
        NewEfxALPHA(anim, 133, 30, 8, 16, 0);
        NewEfxALPHA(anim, 164, 60, 16, 0, 0);
        PlaySFX(0xfd, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 80)
    {
        StartSubSpell_efxRestOBJ(anim);
    }
    else if (proc->timer == duration + 164)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 200)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);
        SetUnitEfxDebuff(anim, 0);
    }
    else if (proc->timer == duration + 300)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxRestBG
void StartSubSpell_efxRestBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxRestBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxRestBG_frames;

    proc->tsal = TsaArray_RestoreBg;
    proc->tsar = TsaArray_RestoreBg;

    proc->img = ImgArray_RestoreBg;

    SpellFx_RegisterBgPal(Pal_MapAnimRestore, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

// 9.99 efxmagic-healstaves:efxRestBG_Loop
void efxRestBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SpellFx_ClearColorEffects();
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-healstaves:StartSubSpell_efxRestOBJ
void StartSubSpell_efxRestOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxRestOBJ, PROC_TREE_3);
    proc->anim = anim;
    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxRestOBJ, AnimScr_EfxRestOBJ, AnimScr_EfxRestOBJ, AnimScr_EfxRestOBJ);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition -= 8;
        frontAnim->yPosition -= 8;
    }
    else
    {
        frontAnim->xPosition += 8;
        frontAnim->yPosition -= 8;
    }

    SpellFx_RegisterObjPal(Pal_SleepSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SleepSprites, 32 * 2 * CHR_SIZE);

    return;
}

// 9.99 efxmagic-healstaves:efxRestOBJ_Loop
void efxRestOBJ_Loop(void)
{
    gEfxBgSemaphore--;
    return;
}
