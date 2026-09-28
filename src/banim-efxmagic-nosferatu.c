#include "gbafe.h"

// ROM data referenced below, defined in data/ (see tools/datasplit.py)
extern const u8 gUnk_0822A27C[];
extern const u8 gUnk_0822AD4C[];
extern const u8 gUnk_0822B8F4[];
extern const u8 gUnk_0822C44C[];
extern const u8 gUnk_0822CF00[];
extern const u8 gUnk_0822D9D0[];
extern const u8 gUnk_0822E694[];
extern const u8 gUnk_0822EF98[];
extern const u8 gUnk_0822F4EC[];
extern const u8 gUnk_0822FE04[];
extern const u8 gUnk_08230A38[];
extern const u8 gUnk_082316DC[];
extern const u8 gUnk_082322D0[];
extern const u8 gUnk_08232BD0[];
extern const u8 gUnk_08232D00[];
extern const u8 gUnk_08232DAC[];
extern const u8 gUnk_08232E5C[];
extern const u8 gUnk_08232F14[];
extern const u8 gUnk_08232FD4[];
extern const u8 gUnk_082330A0[];
extern const u8 gUnk_08233180[];
extern const u8 gUnk_08233268[];
extern const u8 gUnk_08233370[];
extern const u8 gUnk_0823348C[];
extern const u8 gUnk_082335C8[];
extern const u8 gUnk_08233718[];
extern const u8 gUnk_08233870[];
extern const u8 gUnk_082339C8[];
extern const u8 gUnk_08233B1C[];
extern const u8 gUnk_08233C6C[];
extern const u8 gUnk_08233DBC[];
extern const u8 gUnk_08233EF4[];
extern const u8 gUnk_08234020[];
extern const u8 gUnk_0823413C[];
extern const u8 gUnk_08234248[];
extern const u8 gUnk_08234340[];
extern const u8 gUnk_0823442C[];
extern const u8 gUnk_082344FC[];
extern const u8 gUnk_082345B8[];
extern const u8 gUnk_0823466C[];
extern const u8 gUnk_0823471C[];
extern const u8 gUnk_082347C8[];
extern const u8 gUnk_08234870[];
extern const u8 gUnk_08234924[];
extern const u8 gUnk_082349E4[];
extern const u8 gUnk_08234AB0[];
extern const u8 gUnk_08234B78[];
extern const u8 gUnk_08234C40[];
extern const u8 gUnk_08234D14[];
extern const u8 gUnk_08234DF0[];
extern const u8 gUnk_08234ED8[];
extern const u8 gUnk_08234FCC[];
extern const u8 gUnk_082350D4[];
extern const u8 gUnk_082351DC[];
extern const u8 gUnk_08235300[];
extern const u8 gUnk_08235420[];
extern const u8 gUnk_0823553C[];
extern const u8 gUnk_0823564C[];
extern const u8 gUnk_08235758[];
extern const u8 gUnk_08235858[];
extern const u8 gUnk_08235948[];
extern const u8 gUnk_08235A24[];
extern const u8 gUnk_08235AF0[];
extern const u8 gUnk_08235BA8[];

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
ProcPtr NewefxRestRST(struct Anim *anim, int unk44, int unk48, int frame, int speed);
void NewEfxRestWINH(struct Anim *anim, int a, s16 b, u32 c);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern int gEfxBgSemaphore;
extern u16 Pal_NosferatuBg[];
extern u32 gEfxHpBarResireFlag;
extern const u16 gFrameConfig_081E8570[];

void StartSpellAnimNosferatu(struct Anim * anim);
void efxResire_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxResireBG(struct Anim * anim, int type);
void StartSubSpell_efxResireBG2(struct Anim * anim);
void efxResireBG_Loop_A(struct ProcEfxBG * proc);
void efxResireBG_Loop_B(struct ProcEfxBG * proc);
void efxResireBG_Loop_C(struct ProcEfxBG * proc);
void efxResireBG_Loop_D(struct ProcEfxBG * proc);
void efxResireBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxResireRST(struct Anim * anim, ProcPtr efxproc, int c);
void efxResireRST_Loop(struct ProcEfxRST * proc);

extern const u16 StartSubSpell_efxResireBG_frames[];
extern const u16 StartSubSpell_efxResireBG2_frames[];

CONST_DATA struct ProcCmd ProcScr_efxResire[] = {
    PROC_19,
    PROC_REPEAT(efxResire_Loop_Main),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxResireBG[] = {
    PROC_19,
    PROC_REPEAT(efxResireBG_Loop_A),
    PROC_REPEAT(efxResireBG_Loop_B),
    PROC_REPEAT(efxResireBG_Loop_C),
    PROC_REPEAT(efxResireBG_Loop_D),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxResireBG2[] = {
    PROC_19,
    PROC_REPEAT(efxResireBG2_Loop),
    PROC_END,
};

CONST_DATA u16 * ImgArray_NosferatuBg[] = {
    (u16 *) gUnk_0822A27C,
    (u16 *) gUnk_0822A27C,
    (u16 *) gUnk_0822A27C,
    (u16 *) gUnk_0822A27C,
    (u16 *) gUnk_0822A27C,
    (u16 *) gUnk_0822A27C,
    (u16 *) gUnk_0822A27C,
    (u16 *) gUnk_0822A27C,
    (u16 *) gUnk_0822AD4C,
    (u16 *) gUnk_0822AD4C,
    (u16 *) gUnk_0822AD4C,
    (u16 *) gUnk_0822B8F4,
    (u16 *) gUnk_0822B8F4,
    (u16 *) gUnk_0822C44C,
    (u16 *) gUnk_0822C44C,
    (u16 *) gUnk_0822CF00,
    (u16 *) gUnk_0822CF00,
    (u16 *) gUnk_0822D9D0,
    (u16 *) gUnk_0822D9D0,
    (u16 *) gUnk_0822D9D0,
    (u16 *) gUnk_0822E694,
    (u16 *) gUnk_0822E694,
    (u16 *) gUnk_0822E694,
    (u16 *) gUnk_0822EF98,
    (u16 *) gUnk_0822EF98,
    (u16 *) gUnk_0822EF98,
    (u16 *) gUnk_0822EF98,
    (u16 *) gUnk_0822EF98,
    (u16 *) gUnk_0822F4EC,
    (u16 *) gUnk_0822F4EC,
    (u16 *) gUnk_0822F4EC,
    (u16 *) gUnk_0822F4EC,
    (u16 *) gUnk_0822F4EC,
    (u16 *) gUnk_0822F4EC,
    (u16 *) gUnk_0822F4EC,
    (u16 *) gUnk_0822F4EC,
    (u16 *) gUnk_0822FE04,
    (u16 *) gUnk_0822FE04,
    (u16 *) gUnk_0822FE04,
    (u16 *) gUnk_0822FE04,
    (u16 *) gUnk_08230A38,
    (u16 *) gUnk_08230A38,
    (u16 *) gUnk_08230A38,
    (u16 *) gUnk_082316DC,
    (u16 *) gUnk_082316DC,
    (u16 *) gUnk_082316DC,
    (u16 *) gUnk_082322D0,
    (u16 *) gUnk_082322D0,
    (u16 *) gUnk_082322D0,
    (u16 *) gUnk_082322D0,
    (u16 *) gUnk_082322D0,
};

CONST_DATA u16 * TsaArray_NosferatuBg[] = {
    (u16 *) gUnk_08232BD0,
    (u16 *) gUnk_08232D00,
    (u16 *) gUnk_08232DAC,
    (u16 *) gUnk_08232E5C,
    (u16 *) gUnk_08232F14,
    (u16 *) gUnk_08232FD4,
    (u16 *) gUnk_082330A0,
    (u16 *) gUnk_08233180,
    (u16 *) gUnk_08233268,
    (u16 *) gUnk_08233370,
    (u16 *) gUnk_0823348C,
    (u16 *) gUnk_082335C8,
    (u16 *) gUnk_08233718,
    (u16 *) gUnk_08233870,
    (u16 *) gUnk_082339C8,
    (u16 *) gUnk_08233B1C,
    (u16 *) gUnk_08233C6C,
    (u16 *) gUnk_08233DBC,
    (u16 *) gUnk_08233EF4,
    (u16 *) gUnk_08234020,
    (u16 *) gUnk_0823413C,
    (u16 *) gUnk_08234248,
    (u16 *) gUnk_08234340,
    (u16 *) gUnk_0823442C,
    (u16 *) gUnk_082344FC,
    (u16 *) gUnk_082345B8,
    (u16 *) gUnk_0823466C,
    (u16 *) gUnk_0823471C,
    (u16 *) gUnk_082347C8,
    (u16 *) gUnk_08234870,
    (u16 *) gUnk_08234924,
    (u16 *) gUnk_082349E4,
    (u16 *) gUnk_08234AB0,
    (u16 *) gUnk_08234B78,
    (u16 *) gUnk_08234C40,
    (u16 *) gUnk_08234D14,
    (u16 *) gUnk_08234DF0,
    (u16 *) gUnk_08234ED8,
    (u16 *) gUnk_08234FCC,
    (u16 *) gUnk_082350D4,
    (u16 *) gUnk_082351DC,
    (u16 *) gUnk_08235300,
    (u16 *) gUnk_08235420,
    (u16 *) gUnk_0823553C,
    (u16 *) gUnk_0823564C,
    (u16 *) gUnk_08235758,
    (u16 *) gUnk_08235858,
    (u16 *) gUnk_08235948,
    (u16 *) gUnk_08235A24,
    (u16 *) gUnk_08235AF0,
    (u16 *) gUnk_08235BA8,
};

CONST_DATA struct ProcCmd ProcScr_efxResireRST[] = {
    PROC_19,
    PROC_REPEAT(efxResireRST_Loop),
    PROC_END,
};

// 9.99 efxmagic-nosferatu:StartSpellAnimNosferatu
void StartSpellAnimNosferatu(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_efxResire, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-nosferatu:efxResire_Loop_Main
void efxResire_Loop_Main(struct ProcEfx * proc)
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
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 10, 0, 16, 0);
        NewEfxALPHA(anim, 35, 20, 16, 0, 0);
        StartSubSpell_efxResireBG2(anim);
        PlaySFX(0x124, 0x100, anim->xPosition, 1);
        return;
    }

    if (proc->timer == duration + 15)
    {
        StartSubSpell_efxResireRST(anim, NewefxRestRST(anim, 42, 15, 0, 2), 30);
        NewEfxRestWINH(anim, 43, gDispIo.bg_off[BG_1].x, 0);
        return;
    }

    if (proc->timer == duration + 60)
    {
        StartSubSpell_efxResireBG(anim, proc->hitted);
        PlaySFX(0x125, 0x100, anim->xPosition, 1);
        return;
    }

    if (proc->timer == duration + 65)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimResireHitEffects(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
            return;
        }
    }
    else if ((proc->timer != duration + 110) && (proc->timer == duration + 130))
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-nosferatu:StartSubSpell_efxResireBG
void StartSubSpell_efxResireBG(struct Anim * anim, int type)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxResireBG, PROC_TREE_3);
    proc->anim = anim;
    proc->unk29 = type;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxResireBG_frames;
    proc->tsal = TsaArray_NosferatuBg;
    proc->tsar = TsaArray_NosferatuBg;
    proc->img = ImgArray_NosferatuBg;

    SpellFx_RegisterBgPal(Pal_NosferatuBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            SetBgOffset(BG_1, 24, 0);
        }
        else
        {
            SetBgOffset(BG_1, 232, 0);
        }
    }

    return;
}

// 9.99 efxmagic-nosferatu:StartSubSpell_efxResireBG2
void StartSubSpell_efxResireBG2(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxResireBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxResireBG2_frames;
    proc->tsal = TsaArray_NosferatuBg;
    proc->tsar = TsaArray_NosferatuBg;
    proc->img = ImgArray_NosferatuBg;

    SpellFx_RegisterBgPal(Pal_NosferatuBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    SetWinEnable(0, 0, 0);

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            SetBgOffset(BG_1, 24, 0);
        }
        else
        {
            SetBgOffset(BG_1, 232, 0);
        }
    }

    return;
}

// 9.99 efxmagic-nosferatu:efxResireBG_Loop_A
void efxResireBG_Loop_A(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();

            if (proc->unk29 == 1)
            {
                gEfxBgSemaphore--;

                SpellFx_ClearColorEffects();
                RegisterEfxSpellCastEnd();

                Proc_End(proc);
            }
            else
            {
                proc->timer = 0;
                proc->terminator = 1;
                Proc_Break(proc);
            }
        }
    }

    return;
}

// 9.99 efxmagic-nosferatu:efxResireBG_Loop_B
void efxResireBG_Loop_B(struct ProcEfxBG * proc)
{
    if (gEfxHpBarResireFlag == 2)
    {
        gEfxBgSemaphore--;

        SpellFx_ClearColorEffects();
        RegisterEfxSpellCastEnd();

        Proc_End(proc);
    }
    else
    {
        proc->timer++;

        if (proc->timer > proc->terminator)
        {
            proc->timer = proc->terminator;
        }

        if ((proc->timer == proc->terminator) && (gEfxHpBarResireFlag == 1))
        {
            proc->timer = 0;
            proc->terminator = 0;
            proc->frame = 0;
            proc->frame_config = gFrameConfig_081E8570;
            proc->tsal = TsaArray_NosferatuBg;
            proc->tsar = TsaArray_NosferatuBg;
            proc->img = ImgArray_NosferatuBg;

            if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
            {
                proc->terminator = EfxGetCamMovDuration();
                NewEfxFarAttackWithDistance(proc->anim, -1);
            }

            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-nosferatu:efxResireBG_Loop_C
void efxResireBG_Loop_C(struct ProcEfxBG * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
        {
            if (GetAnimPosition(proc->anim) == EKR_POS_L)
            {
                SetBgOffset(BG_1, 232, 0);
            }
            else
            {
                SetBgOffset(BG_1, 24, 0);
            }
        }

        proc->timer = 0;
        PlaySFX(0x126, 0x100, anim->xPosition, 1);

        Proc_Break(proc);
    }

    return;
}

// 9.99 efxmagic-nosferatu:efxResireBG_Loop_D
void efxResireBG_Loop_D(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();

            gEfxBgSemaphore--;

            SpellFx_ClearColorEffects();
            RegisterEfxSpellCastEnd();

            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-nosferatu:efxResireBG2_Loop
void efxResireBG2_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
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

// 9.99 efxmagic-nosferatu:StartSubSpell_efxResireRST
void StartSubSpell_efxResireRST(struct Anim * anim, ProcPtr efxproc, int c)
{
    struct ProcEfxRST * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxResireRST, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->duration = c;
    proc->efxproc = efxproc;

    return;
}

// 9.99 efxmagic-nosferatu:efxResireRST_Loop
void efxResireRST_Loop(struct ProcEfxRST * proc)
{
    struct ProcEfx * otherProc = proc->efxproc;

    otherProc->frame = Interpolate(INTERPOLATE_RSQUARE, 0, 128, proc->timer, proc->duration);

    proc->timer++;

    if (proc->timer > proc->duration)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
