#include "gbafe.h"

/**
 * Class reel (opening) spell animations (fireemblem8u: banim-efxop.c)
 */

typedef void (* SpellAnimFunc)(struct Anim * anim);

EWRAM_DATA ProcPtr gpActiveClassReelSpellProc = NULL;
EWRAM_DATA ProcPtr gpActiveCRSpellBgColorProc = NULL;

extern SpellAnimFunc gClassReelSpellAnimFuncLut[];

extern struct ProcCmd ProcScr_efxopFire[];
extern struct ProcCmd ProcScr_efxopFireBG[];
extern struct ProcCmd ProcScr_efxopFireOBJ[];
extern struct ProcCmd ProcScr_efxopThunder[];
extern struct ProcCmd ProcScr_efxopThunderBG[];
extern struct ProcCmd ProcScr_efxopThunderBGCOL[];
extern struct ProcCmd ProcScr_efxopThunderOBJ[];
extern struct ProcCmd ProcScr_efxopLive[];
extern struct ProcCmd ProcScr_efxopLiveBG[];
extern struct ProcCmd ProcScr_efxopLiveBGCOL[];
extern struct ProcCmd ProcScr_efxopLiveALPHA[];
extern struct ProcCmd ProcScr_efxopLiveOBJ[];
extern struct ProcCmd ProcScr_efxopLightning[];
extern struct ProcCmd ProcScr_efxopLightningBG[];

extern u16 * TsaArray_Fire_ClassReel[];
extern u16 * TsaArray_Thunder_ClassReel[];
extern u16 * TsaArray_Live_ClassReel[];
extern u16 * ImgArray_Light_ClassReel[];
extern u16 * PalArray_Light_ClassReel[];
extern u16 * TsaArray_Light_ClassReel[];

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
extern AnimScr AnimScr_EfxFireOBJ_R_Front[];
extern AnimScr AnimScr_EfxFireOBJ_L_Front[];
extern u16 Pal_ThunderSpellBg[];
extern u16 Img_ThunderSpellBg[];
extern AnimScr AnimScr_EfxThunderOBJ_L[];
extern AnimScr AnimScr_EfxThunderOBJ_R[];
extern u16 Pal_BoltingSprites[];
extern u16 Img_BoltingSprites[];
extern u16 Img_HealSpellBg[];
extern u16 Pal_HealSpellBg[];
extern AnimScr AnimScr_EfxLiveOBJ1[];
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

struct Anim * CRSpellCreateFrontAnim(struct Anim * anim, u16 scrIdx, void * scrA, void * scrB)
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
        u16 ** tsaL = proc->tsal;
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
        u16 ** tsaL = proc->tsal;
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
        u16 ** tsaL = proc->tsal;
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
    AnimScr * scr;

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
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

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
