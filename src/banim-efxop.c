#include "gbafe.h"

extern u16 Img_LightningBg_00[], Img_LightningBg_03[], Img_LightningBg_06[], Img_LightningBg_0A[],
    Img_LightningBg_0D[], Img_LightningBg_10[], Img_LightningBg_19[], Img_LightningBg_1C[],
    Tsa_EfxFireBG_L_00[], Tsa_EfxFireBG_L_01[], Tsa_EfxFireBG_L_02[], Tsa_EfxFireBG_L_03[],
    Tsa_EfxFireBG_L_04[], Tsa_EfxFireBG_L_05[], Tsa_EfxFireBG_L_06[], Tsa_EfxFireBG_L_07[],
    Tsa_EfxFireBG_L_08[], Tsa_EfxFireBG_L_09[], Tsa_EfxFireBG_L_0A[], Tsa_EfxFireBG_L_0B[],
    Tsa_EfxThuderBg1[], Tsa_EfxThuderBg2[], Tsa_HealSpellBg[], Tsa_LightningBg_00[],
    Tsa_LightningBg_01[], Tsa_LightningBg_02[], Tsa_LightningBg_03[], Tsa_LightningBg_04[],
    Tsa_LightningBg_05[], Tsa_LightningBg_06[], Tsa_LightningBg_07[], Tsa_LightningBg_08[],
    Tsa_LightningBg_09[], Tsa_LightningBg_0A[], Tsa_LightningBg_0B[], Tsa_LightningBg_0C[],
    Tsa_LightningBg_0D[], Tsa_LightningBg_0E[], Tsa_LightningBg_0F[], Tsa_LightningBg_10[],
    Tsa_LightningBg_11[], Tsa_LightningBg_12[], Tsa_LightningBg_13[], Tsa_LightningBg_14[],
    Tsa_LightningBg_15[], Tsa_LightningBg_16[], Tsa_LightningBg_17[], Tsa_LightningBg_18[],
    Tsa_LightningBg_19[], Tsa_LightningBg_1A[], Tsa_LightningBg_1B[], Tsa_LightningBg_1C[],
    Tsa_LightningBg_1D[], Tsa_LightningBg_1E[], Tsa_LightningBg_1F[], Tsa_LightningBg_20[],
    gUnk_082215D0[], gUnk_082215F0[];

/**
 * Class reel (opening) spell animations (fireemblem8u: banim-efxop.c)
 */

typedef void (* SpellAnimFunc)(struct Anim * anim);

EWRAM_DATA ProcPtr gpActiveClassReelSpellProc = NULL;
EWRAM_DATA ProcPtr gpActiveCRSpellBgColorProc = NULL;

extern const SpellAnimFunc gClassReelSpellAnimFuncLut[];

extern const struct ProcCmd ProcScr_efxopFire[];
extern const struct ProcCmd ProcScr_efxopFireBG[];
extern const struct ProcCmd ProcScr_efxopFireOBJ[];
extern const struct ProcCmd ProcScr_efxopThunder[];
extern const struct ProcCmd ProcScr_efxopThunderBG[];
extern const struct ProcCmd ProcScr_efxopThunderBGCOL[];
extern const struct ProcCmd ProcScr_efxopThunderOBJ[];
extern const struct ProcCmd ProcScr_efxopLive[];
extern const struct ProcCmd ProcScr_efxopLiveBG[];
extern const struct ProcCmd ProcScr_efxopLiveBGCOL[];
extern const struct ProcCmd ProcScr_efxopLiveALPHA[];
extern const struct ProcCmd ProcScr_efxopLiveOBJ[];
extern const struct ProcCmd ProcScr_efxopLightning[];
extern const struct ProcCmd ProcScr_efxopLightningBG[];

extern u16 * const TsaArray_Fire_ClassReel[];
extern u16 * const TsaArray_Thunder_ClassReel[];
extern u16 * const TsaArray_Live_ClassReel[];
extern u16 * const ImgArray_Light_ClassReel[];
extern u16 * const PalArray_Light_ClassReel[];
extern u16 * const TsaArray_Light_ClassReel[];

extern const u16 FrameConf_efxopFireBG[];
extern const u16 FrameConf_efxopThunderBG[];
extern const u16 FrameConf_efxopThunderBGCOL[];
extern const u16 FrameConf_efxopLiveBG[];
extern const u16 FrameConf_efxopLiveBGCOL[];
extern const u16 FrameConf_efxopLightningBG[];

extern u16 Pal_FireSpellBg[];
extern u16 Img_FireSpellBg[];
extern u16 Pal_FireSpellSprites[];
extern u16 Img_FireSpellSprites[];
extern const AnimScr AnimScr_EfxFireOBJ_R_Front[];
extern const AnimScr AnimScr_EfxFireOBJ_L_Front[];
extern u16 Pal_ThunderSpellBg[];
extern u16 Img_ThunderSpellBg[];
extern const AnimScr AnimScr_EfxThunderOBJ_L[];
extern const AnimScr AnimScr_EfxThunderOBJ_R[];
extern u16 Pal_BoltingSprites[];
extern u16 Img_BoltingSprites[];
extern u16 Img_HealSpellBg[];
extern u16 Pal_HealSpellBg[];
extern const AnimScr AnimScr_EfxLiveOBJ1[];
extern u16 Pal_HealSprites_Sparkles[];
extern u16 Img_HealSprites_Sparkles[];

void StartClassReelSpellAnimDummy(struct Anim * anim);
void StartClassReelSpellAnimFire(struct Anim * anim);
void efxopFire_Loop_Main(struct ProcEfx * proc);
void StartCRSubSpell_efxopFireBG(struct Anim * anim, struct ProcEfx * parent);
void efxopFireBG_Loop(struct ProcEfxBG * proc);
void StartCRSubSpell_efxopFireOBJ(struct Anim * anim, struct ProcEfx * parent);
void efxopFireOBJ_Loop(struct ProcEfxOBJ * proc);
void StartClassReelSpellAnimThunder(struct Anim * anim);
void efxopThunder_Loop_Main(struct ProcEfx * proc);
void StartCRSubSpell_efxopThunderBG(struct Anim * anim, struct ProcEfx * unused);
void efxopThunderBG_Loop(struct ProcEfxBG * proc);
void StartCRSubSpell_efxopThunderBGCOL(struct Anim * anim, struct ProcEfx * unused);
void efxopThunderBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartCRSubSpell_efxopThunderOBJ(struct Anim * anim, struct ProcEfx * unused);
void efxopThunderOBJ_Loop(struct ProcEfxOBJ * proc);
void StartClassReelSpellAnimHeal(struct Anim * anim);
void efxopLive_Loop_Main(struct ProcEfx * proc);
void StartCRSubSpell_efxopLiveBG(struct Anim * anim, struct ProcEfx * unused);
void efxopLiveBG_Loop(struct ProcEfxBG * proc);
void StartCRSubSpell_efxopLiveBGCOL(struct Anim * anim, struct ProcEfx * unused);
void efxopLiveBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartCRSubSpell_efxopLiveALPHA(struct Anim * anim, int timer, int c, int d, struct ProcEfx * unused);
void efxopLiveALPHA_Loop_A(struct ProcEfxALPHA * proc);
void efxopLiveALPHA_Loop_B(struct ProcEfxALPHA * proc);
void StartCRSubSpell_efxopLiveOBJ(struct Anim * anim, struct ProcEfx * unused);
void efxopLiveOBJ_Loop(struct ProcEfxOBJ * proc);
void StartClassReelSpellAnimLight(struct Anim * anim);
void efxopLightning_Loop_Main(struct ProcEfx * proc);
void StartCRSubSpell_efxopLightningBG(struct Anim * anim, struct ProcEfx * parent);
void efxopLightningBG_Loop(struct ProcEfxBG * proc);

void ResetClassReelSpell(void)
{
    gpActiveClassReelSpellProc = NULL;
    gpActiveCRSpellBgColorProc = NULL;
}

void EndActiveClassReelSpell(void)
{
    if (gpActiveClassReelSpellProc != NULL) {
        Proc_End(gpActiveClassReelSpellProc);
        gpActiveClassReelSpellProc = NULL;
    }
}

void EndActiveClassReelBgColorProc(void)
{
    if (gpActiveCRSpellBgColorProc != NULL) {
        Proc_End(gpActiveCRSpellBgColorProc);
        gpActiveCRSpellBgColorProc = NULL;
    }
}

void SetActiveClassReelSpell(ProcPtr proc)
{
    gpActiveClassReelSpellProc = proc;
}

void SetActiveCRSpellBgColorProc(ProcPtr proc)
{
    gpActiveCRSpellBgColorProc = proc;
}

struct AnimMagicFxBuffer * GetMagicEffectBufferFor(struct Anim * anim)
{
    return ((struct AnimBuffer *)(anim->pUnk44))->unk_30;
}

void SetCRSpellBgPosition(struct Anim * anim, struct AnimMagicFxBuffer * magicFx)
{
    s16 x;
    s16 y;

    if (GetAnimPosition(anim) == 0)
        x = anim->xPosition - BanimTypesPosLeft[0];
    else
        x = BanimTypesPosRight[0] - anim->xPosition;

    y = 88 - anim->yPosition;

    SetBgOffset(magicFx->bg, x - (s16)magicFx->x_offset_bg, y - (s16)magicFx->y_offset_bg);
}

void ClearCRSpellBgTmBuf(struct Anim * anim)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    CpuFastFill(0, magicFx->bg_tm_buf, 0x800);
    EnableBgSync(1 << magicFx->bg);
}

struct Anim * CRSpellCreateFrontAnim(struct Anim * anim, u16 scrIdx, const AnimScr * scrA, const AnimScr * scrB)
{
    struct Anim * newAnim;

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    if (scrIdx == 0)
        newAnim = AnimCreate(scrA, 120);
    else
        newAnim = AnimCreate(scrB, 120);

    newAnim->oam2Base = (magicFx->obj_pal_id << 12) | magicFx->obj_chr | OAM2_LAYER(2);
    newAnim->xPosition = anim->xPosition;
    newAnim->yPosition = anim->yPosition;

    return newAnim;
}

void CRSpell_WriteBgMap(struct Anim * anim, u16 notFlipped, void * src, u16 isCompressed)
{
    void * buf;
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    if (isCompressed == 1)
        LZ77UnCompWram(src, magicFx->bg_tsa_buf);

    buf = src;

    if (isCompressed == 1)
        buf = magicFx->bg_tsa_buf;

    if (notFlipped == 0)
        EfxTmCpyBgHFlip(buf, magicFx->bg_tm_buf, 30, 20, magicFx->bg_pal_id, magicFx->bg_chr);
    else
        EfxTmCpyBG(buf, magicFx->bg_tm_buf, 30, 20, magicFx->bg_pal_id, magicFx->bg_chr);

    EnableBgSync(1 << magicFx->bg);
}

void CRSpell_RegisterBgGfx(struct Anim * anim, void * src)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    void * dst = (void *)(0x06000000 + magicFx->bg_chr * 0x20);

    LZ77UnCompWram(src, magicFx->bg_img_buf);
    RegisterDataMove(magicFx->bg_img_buf, dst, 0x2000);
}

void CRSpell_RegisterBgPal(struct Anim * anim, u16 * src)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    CpuFastCopy(src, gPal + (magicFx->bg_pal_id * 0x10), 0x20);
    EnablePalSync();
}

void CRSpell_RegisterObjGfx(struct Anim * anim, void * src)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    void * dst = (void *)(0x6010000 + magicFx->obj_chr * 0x20);

    LZ77UnCompWram(src, magicFx->obj_img_buf);
    RegisterDataMove(magicFx->obj_img_buf, dst, 0x1000);
}

void CRSpell_RegisterObjPal(struct Anim * anim, u16 * src)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    CpuFastCopy(src, gPal + 0x100 + (magicFx->obj_pal_id * 0x10), 0x20);
    EnablePalSync();
}

void StartClassReelSpellAnim(struct Anim * anim)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    gClassReelSpellAnimFuncLut[magicFx->magic_func_idx](anim);
}

void StartClassReelSpellAnimDummy(struct Anim * anim)
{
    return;
}

void StartClassReelSpellAnimFire(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopFire, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;
}

void efxopFire_Loop_Main(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopFireBG(proc->anim, proc);
    StartCRSubSpell_efxopFireOBJ(proc->anim, proc);

    Proc_Break(proc);
}

void StartCRSubSpell_efxopFireBG(struct Anim * anim, struct ProcEfx * parent)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopFireBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = FrameConf_efxopFireBG;
    proc->tsal = TsaArray_Fire_ClassReel;

    CRSpell_RegisterBgPal(anim, Pal_FireSpellBg);
    CRSpell_RegisterBgGfx(proc->anim, Img_FireSpellBg);

    magicFx->reset_callback();

    SetCRSpellBgPosition(proc->anim, magicFx);
}

void efxopFireBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0) {
        u16 * const * tsaL = proc->tsal;
        CRSpell_WriteBgMap(proc->anim, 1, *(tsaL + ret), 1);
    } else {
        if (ret == -1) {
            ClearCRSpellBgTmBuf(proc->anim);
            SpellFx_ClearColorEffects();
            Proc_Break(proc);
        }
    }
}

void StartCRSubSpell_efxopFireOBJ(struct Anim * anim, struct ProcEfx * parent)
{
    struct Anim * frontAnim;

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopFireOBJ, parent);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = CRSpellCreateFrontAnim(anim, 1, AnimScr_EfxFireOBJ_R_Front, AnimScr_EfxFireOBJ_L_Front);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
        frontAnim->xPosition = anim->xPosition - 8;
    else
        frontAnim->xPosition = anim->xPosition + 8;

    frontAnim->yPosition = anim->yPosition + 8;

    frontAnim->xPosition += magicFx->x_offset_obj;
    frontAnim->yPosition += magicFx->y_offset_obj;

    CRSpell_RegisterObjPal(proc->anim, Pal_FireSpellSprites);
    CRSpell_RegisterObjGfx(proc->anim, Img_FireSpellSprites);
}

void efxopFireOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 50) {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

void StartClassReelSpellAnimThunder(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopThunder, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;
}

void efxopThunder_Loop_Main(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopThunderBG(proc->anim, proc);
    StartCRSubSpell_efxopThunderBGCOL(proc->anim, proc);
    StartCRSubSpell_efxopThunderOBJ(proc->anim, proc);

    Proc_Break(proc);
}

void StartCRSubSpell_efxopThunderBG(struct Anim * anim, struct ProcEfx * unused)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopThunderBG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = FrameConf_efxopThunderBG;

    proc->tsal = TsaArray_Thunder_ClassReel;

    CRSpell_RegisterBgPal(anim, Pal_ThunderSpellBg);
    CRSpell_RegisterBgGfx(proc->anim, Img_ThunderSpellBg);

    magicFx->reset_callback();

    SetCRSpellBgPosition(proc->anim, magicFx);
}

void efxopThunderBG_Loop(struct ProcEfxBG * proc)
{
    u16 chr = 0;
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(proc->anim);

    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0) {
        u16 * const * tsaL = proc->tsal;
        CRSpell_WriteBgMap(proc->anim, 0, *(tsaL + ret), 1);

        if (ret == 0)
            chr = magicFx->bg_chr + 31;

        if (ret == 1)
            chr = magicFx->bg_chr + 80;

        FillBGRect(magicFx->bg_tm_buf + 0x1E, 2, 20, magicFx->bg_pal_id, chr);
    } else {
        if (ret == -1) {
            ClearCRSpellBgTmBuf(proc->anim);
            SpellFx_ClearColorEffects();
            Proc_Break(proc);
        }
    }
}

void StartCRSubSpell_efxopThunderBGCOL(struct Anim * anim, struct ProcEfx * unused)
{
    struct ProcEfxBGCOL * proc = Proc_Start(ProcScr_efxopThunderBGCOL, PROC_TREE_3);
    SetActiveCRSpellBgColorProc(proc);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = FrameConf_efxopThunderBGCOL;

    proc->pal = Pal_ThunderSpellBg;
}

void efxopThunderBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0) {
        u16 * pal = proc->pal;
        CRSpell_RegisterBgPal(proc->anim, pal + ret * 0x10);
    } else {
        if (ret == -1) {
            EndActiveClassReelBgColorProc();
            Proc_Break(proc);
        }
    }
}

void StartCRSubSpell_efxopThunderOBJ(struct Anim * anim, struct ProcEfx * unused)
{
    struct Anim * frontAnim;

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopThunderOBJ, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    frontAnim = CRSpellCreateFrontAnim(anim, 1, AnimScr_EfxThunderOBJ_L, AnimScr_EfxThunderOBJ_R);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
        frontAnim->xPosition = anim->xPosition + 56;
    else
        frontAnim->xPosition = anim->xPosition - 56;

    frontAnim->xPosition += magicFx->x_offset_obj;
    frontAnim->yPosition += magicFx->y_offset_obj;

    CRSpell_RegisterObjPal(proc->anim, Pal_BoltingSprites);
    CRSpell_RegisterObjGfx(proc->anim, Img_BoltingSprites);
}

void efxopThunderOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 50) {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

void StartClassReelSpellAnimHeal(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopLive, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
}

void efxopLive_Loop_Main(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopLiveOBJ(proc->anim, proc);
    StartCRSubSpell_efxopLiveBG(proc->anim, proc);
    StartCRSubSpell_efxopLiveBGCOL(proc->anim, proc);

    SetBlendAlpha(0, 16);

    StartCRSubSpell_efxopLiveALPHA(proc->anim, 1, 12, 0, proc);
    StartCRSubSpell_efxopLiveALPHA(proc->anim, 35, 25, 1, proc);

    Proc_Break(proc);
}

void StartCRSubSpell_efxopLiveBG(struct Anim * anim, struct ProcEfx * unused)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopLiveBG, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = FrameConf_efxopLiveBG;

    proc->tsal = TsaArray_Live_ClassReel;

    CRSpell_RegisterBgGfx(anim, Img_HealSpellBg);

    magicFx->reset_callback();

    SetCRSpellBgPosition(proc->anim, magicFx);
}

void efxopLiveBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0) {
        u16 * const * tsaL = proc->tsal;
        CRSpell_WriteBgMap(proc->anim, 1, *(tsaL + ret), 0);
    } else {
        if (ret == -1) {
            ClearCRSpellBgTmBuf(proc->anim);
            SpellFx_ClearColorEffects();
            Proc_Break(proc);
        }
    }
}

void StartCRSubSpell_efxopLiveBGCOL(struct Anim * anim, struct ProcEfx * unused)
{
    struct ProcEfxBGCOL * proc = Proc_Start(ProcScr_efxopLiveBGCOL, PROC_TREE_3);
    SetActiveCRSpellBgColorProc(proc);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = FrameConf_efxopLiveBGCOL;

    proc->pal = Pal_HealSpellBg;
}

void efxopLiveBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0) {
        u16 * pal = proc->pal;
        CRSpell_RegisterBgPal(proc->anim, pal + ret * 0x10);
    } else {
        if (ret == -1) {
            EndActiveClassReelBgColorProc();
            Proc_Break(proc);
        }
    }
}

void StartCRSubSpell_efxopLiveALPHA(struct Anim * anim, int timer, int c, int d, struct ProcEfx * unused)
{
    struct ProcEfxALPHA * proc = Proc_Start(ProcScr_efxopLiveALPHA, PROC_TREE_3);
    proc->anim = anim;

    proc->timer = timer;
    proc->unk2E = c;

    proc->unk29 = d;
}

void efxopLiveALPHA_Loop_A(struct ProcEfxALPHA * proc)
{
    if (--proc->timer == 0)
        Proc_Break(proc);
}

void efxopLiveALPHA_Loop_B(struct ProcEfxALPHA * proc)
{
    int bldA;

    if (proc->timer > proc->unk2E) {
        Proc_Break(proc);
        return;
    }

    if (proc->unk29 == 0)
        bldA = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->unk2E);
    else
        bldA = Interpolate(INTERPOLATE_LINEAR, 16, 0, proc->timer, proc->unk2E);

    SetBlendAlpha(bldA, 16);

    proc->timer++;
}

void StartCRSubSpell_efxopLiveOBJ(struct Anim * anim, struct ProcEfx * unused)
{
    struct Anim * frontAnim;
    const AnimScr * scr;

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxopLiveOBJ, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 51;

    scr = AnimScr_EfxLiveOBJ1;
    frontAnim = CRSpellCreateFrontAnim(anim, 1, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition += magicFx->x_offset_obj;
    frontAnim->yPosition += magicFx->y_offset_obj;

    CRSpell_RegisterObjPal(proc->anim, Pal_HealSprites_Sparkles);
    CRSpell_RegisterObjGfx(proc->anim, Img_HealSprites_Sparkles);
}

void efxopLiveOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator) {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

void StartClassReelSpellAnimLight(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopLightning, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;
}

void efxopLightning_Loop_Main(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopLightningBG(proc->anim, proc);
    Proc_Break(proc);
}

void StartCRSubSpell_efxopLightningBG(struct Anim * anim, struct ProcEfx * parent)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);
    struct ProcEfxBG * proc = Proc_Start(ProcScr_efxopLightningBG, parent);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = FrameConf_efxopLightningBG;

    proc->tsal = TsaArray_Light_ClassReel;
    proc->tsar = TsaArray_Light_ClassReel;

    proc->img = ImgArray_Light_ClassReel;
    proc->pal = PalArray_Light_ClassReel;

    magicFx->reset_callback();

    SetCRSpellBgPosition(proc->anim, magicFx);
}

void efxopLightningBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0) {
        u16 * const * tsaL = proc->tsal;
        u16 * const * img = proc->img;
        u16 * const * pal = proc->pal;

        CRSpell_RegisterBgGfx(proc->anim, *(img + ret));
        CRSpell_RegisterBgPal(proc->anim, *(pal + ret));
        CRSpell_WriteBgMap(proc->anim, 0, *(tsaL + ret), 1);
    } else {
        if (ret == -1) {
            ClearCRSpellBgTmBuf(proc->anim);
            SpellFx_ClearColorEffects();
            Proc_Break(proc);
        }
    }
}

void sub_08064A2C(void)
{
    gEkrDragonStatusLeft.type |= 1;
}

SECTION(".rodata.08BA47F8")
const struct ProcCmd ProcScr_efxopFire[] = {
    PROC_19,
    PROC_REPEAT(efxopFire_Loop_Main),
    PROC_SLEEP(50),
    PROC_CALL(EndActiveClassReelSpell),
    PROC_END,
};

SECTION(".rodata.08BA4820")
const struct ProcCmd ProcScr_efxopFireBG[] = {
    PROC_19,
    PROC_REPEAT(efxopFireBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA4868")
const struct ProcCmd ProcScr_efxopFireOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxopFireOBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BA4880")
const struct ProcCmd ProcScr_efxopThunder[] = {
    PROC_19,
    PROC_REPEAT(efxopThunder_Loop_Main),
    PROC_SLEEP(50),
    PROC_CALL(EndActiveClassReelSpell),
    PROC_END,
};

SECTION(".rodata.08BA48A8")
const struct ProcCmd ProcScr_efxopThunderBG[] = {
    PROC_19,
    PROC_REPEAT(efxopThunderBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA48C8")
const struct ProcCmd ProcScr_efxopThunderBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxopThunderBGCOL_Loop),
    PROC_END,
};

SECTION(".rodata.08BA48E8")
const struct ProcCmd ProcScr_efxopThunderOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxopThunderOBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BA4900")
const struct ProcCmd ProcScr_efxopLive[] = {
    PROC_19,
    PROC_REPEAT(efxopLive_Loop_Main),
    PROC_SLEEP(70),
    PROC_CALL(EndActiveClassReelSpell),
    PROC_END,
};

SECTION(".rodata.08BA4928")
const struct ProcCmd ProcScr_efxopLiveBG[] = {
    PROC_19,
    PROC_REPEAT(efxopLiveBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA4944")
const struct ProcCmd ProcScr_efxopLiveBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(efxopLiveBGCOL_Loop),
    PROC_END,
};

SECTION(".rodata.08BA4964")
const struct ProcCmd ProcScr_efxopLiveALPHA[] = {
    PROC_19,
    PROC_REPEAT(efxopLiveALPHA_Loop_A),
    PROC_REPEAT(efxopLiveALPHA_Loop_B),
    PROC_END,
};

SECTION(".rodata.08BA4984")
const struct ProcCmd ProcScr_efxopLiveOBJ[] = {
    PROC_19,
    PROC_REPEAT(efxopLiveOBJ_Loop),
    PROC_END,
};

SECTION(".rodata.08BA499C")
const struct ProcCmd ProcScr_efxopLightning[] = {
    PROC_19,
    PROC_REPEAT(efxopLightning_Loop_Main),
    PROC_SLEEP(50),
    PROC_CALL(EndActiveClassReelSpell),
    PROC_END,
};

SECTION(".rodata.08BA49C4")
const struct ProcCmd ProcScr_efxopLightningBG[] = {
    PROC_19,
    PROC_REPEAT(efxopLightningBG_Loop),
    PROC_END,
};

SECTION(".rodata.08BA47D8")
const SpellAnimFunc gClassReelSpellAnimFuncLut[] = {
    StartClassReelSpellAnimDummy,
    StartClassReelSpellAnimFire,
    StartClassReelSpellAnimThunder,
    StartClassReelSpellAnimHeal,
    StartClassReelSpellAnimLight,
    NULL,
    NULL,
    NULL,
};

SECTION(".rodata.08BA4838")
u16 * const TsaArray_Fire_ClassReel[] = {
    Tsa_EfxFireBG_L_00,
    Tsa_EfxFireBG_L_01,
    Tsa_EfxFireBG_L_02,
    Tsa_EfxFireBG_L_03,
    Tsa_EfxFireBG_L_04,
    Tsa_EfxFireBG_L_05,
    Tsa_EfxFireBG_L_06,
    Tsa_EfxFireBG_L_07,
    Tsa_EfxFireBG_L_08,
    Tsa_EfxFireBG_L_09,
    Tsa_EfxFireBG_L_0A,
    Tsa_EfxFireBG_L_0B,
};

SECTION(".rodata.08BA48C0")
u16 * const TsaArray_Thunder_ClassReel[] = {
    Tsa_EfxThuderBg1,
    Tsa_EfxThuderBg2,
};

SECTION(".rodata.08BA4940")
u16 * const TsaArray_Live_ClassReel[] = {
    Tsa_HealSpellBg,
};

SECTION(".rodata.08BA49DC")
u16 * const ImgArray_Light_ClassReel[] = {
    Img_LightningBg_00,
    Img_LightningBg_00,
    Img_LightningBg_00,
    Img_LightningBg_03,
    Img_LightningBg_03,
    Img_LightningBg_03,
    Img_LightningBg_06,
    Img_LightningBg_06,
    Img_LightningBg_06,
    Img_LightningBg_06,
    Img_LightningBg_0A,
    Img_LightningBg_0A,
    Img_LightningBg_0A,
    Img_LightningBg_0D,
    Img_LightningBg_0D,
    Img_LightningBg_0D,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_10,
    Img_LightningBg_19,
    Img_LightningBg_19,
    Img_LightningBg_19,
    Img_LightningBg_1C,
    Img_LightningBg_1C,
    Img_LightningBg_1C,
    Img_LightningBg_1C,
    Img_LightningBg_1C,
};

SECTION(".rodata.08BA4A60")
u16 * const PalArray_Light_ClassReel[] = {
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215D0,
    gUnk_082215F0,
    gUnk_082215F0,
    gUnk_082215F0,
    gUnk_082215F0,
    gUnk_082215F0,
    gUnk_082215F0,
    gUnk_082215F0,
    gUnk_082215F0,
};

SECTION(".rodata.08BA4AE4")
u16 * const TsaArray_Light_ClassReel[] = {
    Tsa_LightningBg_00,
    Tsa_LightningBg_01,
    Tsa_LightningBg_02,
    Tsa_LightningBg_03,
    Tsa_LightningBg_04,
    Tsa_LightningBg_05,
    Tsa_LightningBg_06,
    Tsa_LightningBg_07,
    Tsa_LightningBg_08,
    Tsa_LightningBg_09,
    Tsa_LightningBg_0A,
    Tsa_LightningBg_0B,
    Tsa_LightningBg_0C,
    Tsa_LightningBg_0D,
    Tsa_LightningBg_0E,
    Tsa_LightningBg_0F,
    Tsa_LightningBg_10,
    Tsa_LightningBg_11,
    Tsa_LightningBg_12,
    Tsa_LightningBg_13,
    Tsa_LightningBg_14,
    Tsa_LightningBg_15,
    Tsa_LightningBg_16,
    Tsa_LightningBg_17,
    Tsa_LightningBg_18,
    Tsa_LightningBg_19,
    Tsa_LightningBg_1A,
    Tsa_LightningBg_1B,
    Tsa_LightningBg_1C,
    Tsa_LightningBg_1D,
    Tsa_LightningBg_1E,
    Tsa_LightningBg_1F,
    Tsa_LightningBg_20,
};
