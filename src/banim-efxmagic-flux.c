#include "gbafe.h"

/* auto-decls */
void NewEfxSpellCast(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);
void RegisterEfxSpellCastEnd(void);
extern const struct ProcCmd gProcScr_efxMistyrain[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd gProcScr_efxMistyrainBG[];
extern u16 * gUnknown_08BA1E64[];
extern u16 * gUnknown_08BA1F08[];
extern u16 Pal_08227108[];
extern u16 Pal_08227128[];
extern const struct ProcCmd ProcScr_efxMistyrainOBJ[];
extern AnimScr FramScr_Unk5D4F90[];
extern const struct ProcCmd gProcScr_efxMistyrainOBJ2[];
extern u32 AnimScr_EfxMistyRainObj1[];
extern u16 Pal_FluxAnimSprites[];
extern u16 Img_FluxAnimSprites_Orb[];
extern u32 AnimScr_EfxMistyRainObj2[];
extern u16 Img_FluxAnimSprites_Tendrils[];
extern u32 AnimScr_EfxMistyRainObj3[];
extern u16 Img_FluxAnimSprites_SigilVoid[];
extern u32 AnimScr_EfxMistyRainObj4[];
extern u32 AnimScr_EfxMistyRainObj5[];

void StartSpellAnimFlux(struct Anim * anim);
void efxMistyRain_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxMistyrainBG(struct Anim * anim);
void StartSubSpell_efxMistyrainBG2(struct Anim * anim);
void efxMistyRainBg_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxMistyRainOBJ(struct Anim * anim);
struct ProcEfxOBJ * StartSubSpell_efxMistyrainOBJ2(struct Anim * anim);
void efxMistyRainObj_OnEnd(struct ProcEfxOBJ * proc);
void efxMistyRainObj_080597A4(struct ProcEfxOBJ * proc);
void efxMistyRainObj_080597E0(struct ProcEfxOBJ * proc);
void efxMistyRainObj_0805981C(struct ProcEfxOBJ * proc);
void efxMistyRainObj2_08059858(struct ProcEfxOBJ * proc);
void efxMistyRainObj2_08059884(struct ProcEfxOBJ * proc);

extern const u16 StartSubSpell_efxMistyrainBG_frames[];
extern const u16 StartSubSpell_efxMistyrainBG2_frames[];

// 9.99 efxmagic-flux:StartSpellAnimFlux
void StartSpellAnimFlux(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(gProcScr_efxMistyrain, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

// 9.99 efxmagic-flux:efxMistyRain_Loop_Main
void efxMistyRain_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        PlaySFX(0x10a, 0x100, proc->anim->xPosition, 1);
        StartSubSpell_efxMistyrainBG(anim);
    }
    else if (proc->timer == 16)
    {
        StartSubSpell_efxMistyRainOBJ(proc->anim);
    }
    else if (proc->timer == 74)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else
    {
        if (proc->timer == duration + 75)
        {
            proc->unk_64 = StartSubSpell_efxMistyrainOBJ2(anim);
        }
        else if (proc->timer == duration + 94)
        {
            PlaySFX(0x2E1, 0x100, anim->xPosition, 1);
            StartSubSpell_efxMistyrainBG2(proc->anim);
        }
        else if (proc->timer == duration + 114)
        {
            Proc_End(proc->unk_64);
        }
        else if (proc->timer == duration + 131)
        {
            NewEfxFlashBgWhite(proc->anim, 6);
            anim->state3 |= 9;

            StartBattleAnimHitEffectsDefault(anim, proc->hitted);

            if (!proc->hitted)
            {
                EfxPlayHittedSFX(anim);
            }
        }
        else if (proc->timer == duration + 164)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }

    return;
}

// 9.99 efxmagic-flux:StartSubSpell_efxMistyrainBG
void StartSubSpell_efxMistyrainBG(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gProcScr_efxMistyrainBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxMistyrainBG_frames;
    proc->tsar = proc->tsal = gUnknown_08BA1E64;
    proc->img = gUnknown_08BA1F08;
    SpellFx_RegisterBgPal(Pal_08227108, 0x20);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            SetBgOffset(1, 232, 0);
        }
        else
        {
            SetBgOffset(1, 24, 0);
        }
    }

    if (GetAnimPosition(proc->anim) == 0)
        gDispIo.bg_off[1].x += 4;
    else
        gDispIo.bg_off[1].x -= 4;

    gDispIo.bg_off[1].y += 8;

    return;
}

// 9.99 efxmagic-flux:StartSubSpell_efxMistyrainBG2
void StartSubSpell_efxMistyrainBG2(struct Anim * anim)
{
    // clang-format off
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gProcScr_efxMistyrainBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = StartSubSpell_efxMistyrainBG2_frames;
    proc->tsar = proc->tsal = gUnknown_08BA1E64;
    proc->img = gUnknown_08BA1F08;

    SpellFx_RegisterBgPal(Pal_08227128, 0x20);
    SpellFx_SetSomeColorEffect();

    SetBlendAlpha(10, 7);

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            SetBgOffset(1, 232, 0);
        }
        else
        {
            SetBgOffset(1, 24, 0);
        }
    }

    return;
}

// 9.99 efxmagic-flux:efxMistyRainBg_Loop
void efxMistyRainBg_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut(&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaLeft = proc->tsal;
        u16 ** tsaRight = proc->tsar;
        SpellFx_RegisterBgGfx(proc->img[ret], 0x2000);
        SpellFx_WriteBgMap(proc->anim, tsaLeft[ret], tsaRight[ret]);
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_End(proc);
    }

    return;
}

// 9.99 efxmagic-flux:StartSubSpell_efxMistyRainOBJ
void StartSubSpell_efxMistyRainOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    u32 * script;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMistyrainOBJ, PROC_TREE_3);
    proc->anim = anim;

    GetAnimAnotherSide(anim);
    script = FramScr_Unk5D4F90;
    proc->anim2 = EfxCreateFrontAnim(proc->anim, script, script, script, script);

    return;
}

// 9.99 efxmagic-flux:StartSubSpell_efxMistyrainOBJ2
struct ProcEfxOBJ * StartSubSpell_efxMistyrainOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    u32 * script;

    gEfxBgSemaphore++;

    proc = Proc_Start(gProcScr_efxMistyrainOBJ2, PROC_TREE_3);
    proc->anim = anim;
    GetAnimAnotherSide(anim);

    script = FramScr_Unk5D4F90;
    proc->anim2 = EfxCreateFrontAnim(proc->anim, script, script, script, script);
    proc->anim2->yPosition -= 4;

    return proc;
}

// 9.99 efxmagic-flux:efxMistyRainObj_OnEnd
void efxMistyRainObj_OnEnd(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

// 9.99 efxmagic-flux:efxMistyRainObj_805F24C
void efxMistyRainObj_080597A4(struct ProcEfxOBJ * proc)
{
    proc->anim2->pScrStart = AnimScr_EfxMistyRainObj1;
    proc->anim2->pScrCurrent = AnimScr_EfxMistyRainObj1;

    proc->anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_FluxAnimSprites, 0x20);
    SpellFx_RegisterObjGfx(Img_FluxAnimSprites_Orb, 0x1000);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-flux:efxMistyRainObj_805F288
void efxMistyRainObj_080597E0(struct ProcEfxOBJ * proc)
{
    proc->anim2->pScrStart = AnimScr_EfxMistyRainObj2;
    proc->anim2->pScrCurrent = AnimScr_EfxMistyRainObj2;

    proc->anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_FluxAnimSprites, 0x20);
    SpellFx_RegisterObjGfx(Img_FluxAnimSprites_Tendrils, 0x1000);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-flux:efxMistyRainObj_805F2C4
void efxMistyRainObj_0805981C(struct ProcEfxOBJ * proc)
{
    proc->anim2->pScrStart = AnimScr_EfxMistyRainObj3;
    proc->anim2->pScrCurrent = AnimScr_EfxMistyRainObj3;

    proc->anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_FluxAnimSprites, 0x20);
    SpellFx_RegisterObjGfx(Img_FluxAnimSprites_SigilVoid, 0x1000);

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-flux:efxMistyRainObj2_805F300
void efxMistyRainObj2_08059858(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;
    anim->pScrStart = AnimScr_EfxMistyRainObj4;
    anim->pScrCurrent = AnimScr_EfxMistyRainObj4;

    anim->timer = 0;

    anim->drawLayerPriority = 20;

    AnimSort();

    proc->timer = 39;

    Proc_Break(proc);

    return;
}

// 9.99 efxmagic-flux:efxMistyRainObj2_805F32C
void efxMistyRainObj2_08059884(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 40)
    {
        anim->pScrStart = AnimScr_EfxMistyRainObj5;
        anim->pScrCurrent = AnimScr_EfxMistyRainObj5;
        anim->timer = 0;

        proc->timer = 0;
    }

    return;
}

SECTION(".rodata.08BA1E34")
const struct ProcCmd gProcScr_efxMistyrain[] = {
    PROC_19,
    PROC_REPEAT(efxMistyRain_Loop_Main),
    PROC_END,
};

SECTION(".rodata.08BA1E4C")
const struct ProcCmd gProcScr_efxMistyrainBG[] = {
    PROC_19,
    PROC_REPEAT(efxMistyRainBg_Loop),
    PROC_END,
};

SECTION(".rodata.08BA1FAC")
const struct ProcCmd ProcScr_efxMistyrainOBJ[] = {
    PROC_19,
    PROC_SET_END_CB(efxMistyRainObj_OnEnd),
    PROC_REPEAT(efxMistyRainObj_080597A4),
    PROC_SLEEP(32),
    PROC_REPEAT(efxMistyRainObj_080597E0),
    PROC_SLEEP(11),
    PROC_REPEAT(efxMistyRainObj_0805981C),
    PROC_SLEEP(22),
    PROC_END,
};

SECTION(".rodata.08BA1FF4")
const struct ProcCmd gProcScr_efxMistyrainOBJ2[] = {
    PROC_19,
    PROC_SET_END_CB(efxMistyRainObj_OnEnd),
    PROC_REPEAT(efxMistyRainObj2_08059858),
    PROC_SLEEP(14),
    PROC_REPEAT(efxMistyRainObj2_08059884),
    PROC_END,
};
