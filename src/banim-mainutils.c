#include "gbafe.h"

CONST_DATA AnimScr AnimScr_DefaultAnim[] = {
    ANIMSCR_FRAME(1, NULL, 0x57F0),
    ANIMSCR_BLOCKED
};

CONST_DATA void * TsaConfs_BanimTmA[] =
{
    TsaConf_BanimTmA1,
    TsaConf_BanimTmA2,
    TsaConf_BanimTmA3,
    TsaConf_BanimTmA4,
    TsaConf_BanimTmA3,
    TsaConf_BanimTmA4,
    TsaConf_BanimTmA3,
    TsaConf_BanimTmA4,
    TsaConf_BanimTmA1,
    TsaConf_BanimTmA2,
};

const u8 BanimDefaultModeConfig[ANIM_ROUND_MAX * 4] = {
    /**
     * 00: front mode
     * 01: front priority
     * 02: back mode
     * 03: back priority
    */

    /* ANIM_ROUND_HIT_CLOSE */
    BANIM_MODE_NORMAL_ATK, 0x64, BANIM_MODE_NORMAL_ATK_PRIORITY_L, 0x3C,

    /* ANIM_ROUND_CRIT_CLOSE */
    BANIM_MODE_CRIT_ATK, 0x64, BANIM_MODE_CRIT_ATK_PRIORITY_L, 0x3C,

    /* ANIM_ROUND_NONCRIT_FAR */
    BANIM_MODE_RANGED_ATK, 0x64, BANIM_MODE_INVALID, 0x3C,

    /* ANIM_ROUND_CRIT_FAR */
    BANIM_MODE_RANGED_CRIT_ATK, 0x64, BANIM_MODE_INVALID, 0x3C,

    /* ANIM_ROUND_TAKING_MISS_CLOSE */
    BANIM_MODE_CLOSE_DODGE, 0x28, BANIM_MODE_INVALID, 0x28,

    /* ANIM_ROUND_TAKING_MISS_FAR */
    BANIM_MODE_RANGED_DODGE, 0x28, BANIM_MODE_INVALID, 0x28,

    /* ANIM_ROUND_TAKING_HIT_CLOSE */
    BANIM_MODE_STANDING, 0x50, BANIM_MODE_INVALID, 0x28,

    /* ANIM_ROUND_STANDING */
    BANIM_MODE_STANDING2, 0x50, BANIM_MODE_INVALID, 0x28,

    /* ANIM_ROUND_TAKING_HIT_FAR */
    BANIM_MODE_RANGED_STANDING, 0x50, BANIM_MODE_INVALID, 0x28,

    /* ANIM_ROUND_MISS_CLOSE */
    BANIM_MODE_MISSED_ATK, 0x64, BANIM_MODE_INVALID, 0x28,
};

const u8 BattleTypeToAnimModeEndOfDodge[5] = {
    [EKR_DISTANCE_CLOSE]      = BANIM_MODE_CLOSE_DODGE,
    [EKR_DISTANCE_FAR]        = BANIM_MODE_STANDING,
    [EKR_DISTANCE_FARFAR]     = BANIM_MODE_STANDING,
    [EKR_DISTANCE_MONOCOMBAT] = BANIM_MODE_CLOSE_DODGE,
    [EKR_DISTANCE_PROMOTION]  = BANIM_MODE_CLOSE_DODGE
};

const u8 BanimTypesPosLeft[5] = {
    [EKR_DISTANCE_CLOSE]      = 0x5C,
    [EKR_DISTANCE_FAR]        = 0x44,
    [EKR_DISTANCE_FARFAR]     = 0x44,
    [EKR_DISTANCE_MONOCOMBAT] = 0x78,
    [EKR_DISTANCE_PROMOTION]  = 0x5C
};

const u8 BanimTypesPosRight[5] = {
    [EKR_DISTANCE_CLOSE]      = 0x94,
    [EKR_DISTANCE_FAR]        = 0xAC,
    [EKR_DISTANCE_FARFAR]     = 0xAC,
    [EKR_DISTANCE_MONOCOMBAT] = 0x78,
    [EKR_DISTANCE_PROMOTION]  = 0x94
};

void AnimScrAdvance(struct Anim * anim)
{
    u32 inst;

    if (CheckRound1(anim->currentRoundType) == false)
        return;

    if (anim->pScrCurrent == AnimScr_DefaultAnim)
        return;

    while (1) {
        inst = ANINS_GET_TYPE(*anim->pScrCurrent);

        if (inst == ANIM_INS_TYPE_STOP) {
            anim->pScrCurrent -= 3;
            break;
        }

        if (inst == ANIM_INS_TYPE_COMMAND) {
            anim->pScrCurrent -= 3;
            break;
        }

        if (inst == ANIM_INS_TYPE_FRAME)
            anim->pScrCurrent += 3;
    }
}

struct ProcCmd CONST_DATA ProcScr_EkrChienCHR[] =
{
    PROC_19,
    PROC_REPEAT(EkrChienCHRMain),
    PROC_END,
};

void NewEkrChienCHR(struct Anim * anim)
{
    struct ProcEkrChienCHR * proc;
    proc = Proc_Start(ProcScr_EkrChienCHR, PROC_TREE_3);
    proc->anim = anim;
}

void EkrChienCHRMain(struct ProcEkrChienCHR * proc)
{
    RegisterAISSheetGraphics(proc->anim);
    Proc_Break(proc);
}

void RegisterAISSheetGraphics(struct Anim * anim)
{
    void * buf;
    buf = OBJ_VRAM0 + OAM2_CHR(anim->oam2Base) * CHR_SIZE;
    LZ77UnCompWram(anim->pImgSheet, anim->pImgSheetBuf);
    RegisterDataMove(anim->pImgSheetBuf, buf, 0x2000);
}

void ApplyBanimUniquePalette(u32 * buf, int pos)
{
    u32 i;
    if (gBanimUniquePaletteDisabled[pos] == 0)
        return;

    for (i = 0; i < 8; i++)
        buf[i] = buf[i + 0x20];
}

int GetBanimPalette(int banim_id, int pos)
{
    u32 jid;
    struct BattleUnit * bu;

    if (POS_L == pos)
        bu = gpEkrBattleUnitLeft;
    else
        bu = gpEkrBattleUnitRight;

    jid = UNIT_CLASS_ID(&bu->unit);
    switch (jid) {
    case CLASS_ARCHER:
        return 0x24;
    
    case CLASS_ARCHER_F:
        return 0x26;
    
    case CLASS_SNIPER:
        return 0x28;
    
    case CLASS_SNIPER_F:
        return 0x2A;
    
    default:
        return banim_id;
    }
}
#if NONMATCHING
void UpdateBanimFrame(void)
{
    int val, bid, bid_pal, chara_pal;
    struct BattleAnim * _banim, * banim = banim_data;
    struct BattleAnimCharaPal * cbapt = character_battle_animation_palette_table;

    gpImgSheet[1] = NULL;
    gpImgSheet[0] = NULL;

    if (gBanimValid[POS_L] == true)
    {
        bid = gBanimIdx[EKR_POS_L];
        bid_pal = gBanimFactionPal[EKR_POS_L];
        chara_pal = gBanimUniquePal[EKR_POS_L];

        _banim = &banim[bid];
        LZ77UnCompWram(_banim->script, gBanimScrLeft);
        gpBanimModesLeft = _banim->modes;

        _banim = &banim[GetBanimPalette(bid, 0)];
        LZ77UnCompWram(_banim->pal, gBanimPaletteLeft);

        if (chara_pal != -1)
        {
            LZ77UnCompWram(cbapt[chara_pal].pal, gBanimPaletteLeft);
            ApplyBanimUniquePalette((u32 *)gBanimPaletteLeft, POS_L);
        }

        gpEfxUnitPaletteBackup[POS_L] = &PAL_BUF_COLOR(gBanimPaletteLeft, bid_pal, 0);
        CpuFastCopy(&PAL_BUF_COLOR(gBanimPaletteLeft, bid_pal, 0), PAL_OBJ(0x7), 0x20);
        CpuFastCopy(gBanimTriAtkPalettes[0], PAL_OBJ(0x8), 0x20);

        EnablePalSync();
        LZ77UnCompWram(banim[bid].oam_l, gBanimOaml);
        gBanimOaml[0x57F0 / 4] = 1;
    }

    if (gBanimValid[EKR_POS_R] == true)
    {
        bid = gBanimIdx[EKR_POS_R];
        bid_pal = gBanimFactionPal[EKR_POS_R];
        chara_pal = gBanimUniquePal[EKR_POS_R];

        LZ77UnCompWram(banim[bid].script, gBanimScrRight);
        gpBanimModesRight = banim[bid].modes;
        LZ77UnCompWram(banim[GetBanimPalette(bid, 1)].pal, gBanimPaletteRight);

        if (chara_pal != -1)
        {
            LZ77UnCompWram(cbapt[chara_pal].pal, gBanimPaletteRight);
            ApplyBanimUniquePalette((u32 *)gBanimPaletteRight, POS_R);
        }

        gpEfxUnitPaletteBackup[POS_R] = &PAL_BUF_COLOR(gBanimPaletteRight, bid_pal, 0);
        CpuFastCopy(&PAL_BUF_COLOR(gBanimPaletteRight, bid_pal, 0), PAL_OBJ(0x9), 0x20);
        CpuFastCopy(gBanimTriAtkPalettes[1], PAL_OBJ(0xA), 0x20);

        EnablePalSync();
        LZ77UnCompWram(banim[bid].oam_r, gBanimOamr2);
        gBanimOamr2[0x57F0 / 4] = 1;
    }

    if (gpEkrTriangleUnits[0] != NULL)
    {
        bid = GetBattleAnimationId_WithUnique(gpEkrTriangleUnits[POS_L], gpEkrTriangleUnits[POS_L]->pClassData->pBattleAnimDef, 0, &val);
        gBanimTriAtkPalettes[POS_L] = banim[bid].pal;

        bid = GetBattleAnimCharacterUniquePalIndex(gpEkrTriangleUnits[POS_L], val);
        if (bid != -1)
            gBanimTriAtkPalettes[POS_L] = cbapt[bid].pal;

        bid = GetBattleAnimationId_WithUnique(gpEkrTriangleUnits[POS_R], gpEkrTriangleUnits[POS_R]->pClassData->pBattleAnimDef, 0, &val);
        gBanimTriAtkPalettes[POS_R] = banim[bid].pal;

        bid = GetBattleAnimCharacterUniquePalIndex(gpEkrTriangleUnits[POS_R], val);
        if (bid != -1)
            gBanimTriAtkPalettes[POS_R] = cbapt[bid].pal;
    }
}
#else
ASM_FUNC("asm/nonmatching/code_08054024.s");
#endif

extern s16 gEfxHpLutOff[];
extern const u16 BanimLeftDefaultPos[];
extern u8 gBanimLeftImgSheetBuf[];
extern u8 gBanimRightImgSheetBuf[];

void InitMainAnims(void)
{
    struct Anim * anim1, *anim2;

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_MONOCOMBAT:
    case EKR_DISTANCE_PROMOTION:
        InitBattleAnimFrame(ANIM_ROUND_TAKING_HIT_CLOSE, ANIM_ROUND_TAKING_HIT_CLOSE);
        break;

    case EKR_DISTANCE_FAR:
        InitBattleAnimFrame(ANIM_ROUND_TAKING_HIT_FAR, ANIM_ROUND_TAKING_HIT_FAR);
        break;

    case EKR_DISTANCE_FARFAR:
        InitBattleAnimFrame(ANIM_ROUND_TAKING_HIT_FAR, ANIM_ROUND_TAKING_HIT_FAR);

        if (GetBanimInitPosReal() == EKR_POS_L) {
            anim1 = gAnims[2];
            anim1->xPosition = 0x180;

            anim2 = gAnims[3];
            anim2->xPosition = 0x180;
        } else {
            anim1 = gAnims[0];
            anim1->xPosition = 0x180;

            anim2 = gAnims[1];
            anim2->xPosition = 0x180;
        }
        break;

    default:
        break;
    }

    gEfxHpLutOff[0] = 0;
    gEfxHpLutOff[1] = 0;
}

void InitBattleAnimFrame(int round_type_left, int round_type_right)
{
    gAnims[0] = NULL;
    gAnims[1] = NULL;
    gAnims[2] = NULL;
    gAnims[3] = NULL;

    if (gBanimValid[EKR_POS_L] == true)
        InitLeftAnim(round_type_left);

    if (gBanimValid[EKR_POS_R] == true)
        InitRightAnim(round_type_right);

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION) {
        gAnims[0]->state |= ANIM_BIT_HIDDEN;
        gAnims[1]->state |= ANIM_BIT_HIDDEN;
    }
}

void InitLeftAnim(int round_type)
{
    struct Anim * anim;
    u32 frame_front = BanimDefaultModeConfig[round_type * 4 + 0];
    u32 priority_front = BanimDefaultModeConfig[round_type * 4 + 1];
    u32 frame_back = BanimDefaultModeConfig[round_type * 4 + 2];
    u32 priority_back = BanimDefaultModeConfig[round_type * 4 + 3];
    u32 r4 = BanimTypesPosLeft[gEkrDistanceType];

    void *array[2];
    array[0] = &&label1;
    array[1] = &&label2;

    gEkrXPosBase[0] = -BanimLeftDefaultPos[gEkrDistanceType];
    gEkrYPosBase[0] = 0;
    gEkrXPosReal[0] = gEkrXPosBase[0] + r4;
    gEkrYPosReal[0] = 0x58;

label1:
    {
        u32 idx = gpBanimModesLeft[frame_front];
        void *scr = gBanimScrLeft + idx;
        if (frame_front == 0xFF)
            scr = AnimScr_DefaultAnim;
        do anim = AnimCreate(scr, priority_front); while (0);
        anim->xPosition = gEkrXPosReal[0] - gEkrBgPosition;
        anim->yPosition = gEkrYPosReal[0];
        anim->oam2Base = OAM2_PAL(0x7) + OAM2_LAYER(0x2) + OAM2_CHR(0x4000 / 0x20);
        anim->state2 |= ANIM_BIT2_0400 | ANIM_BIT2_BACK_FRAME;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = round_type;
        anim->pImgSheetBuf = gBanimLeftImgSheetBuf;
        anim->pSpriteDataPool = gBanimOaml;
        gAnims[0] = anim;
    }

label2:
    {
        u32 idx = gpBanimModesLeft[frame_back];
        void *scr = gBanimScrLeft + idx;
        if (frame_back == 0xFF)
            scr = AnimScr_DefaultAnim;
        anim = AnimCreate(scr, priority_back);
        anim->xPosition = gEkrXPosReal[0] - gEkrBgPosition;
        anim->yPosition = gEkrYPosReal[0];
        anim->oam2Base = OAM2_PAL(0x7) + OAM2_LAYER(0x2) + OAM2_CHR(0x4000 / 0x20);
        anim->state2 |= ANIM_BIT2_0400 | ANIM_BIT2_FRONT_FRAME;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = round_type;
        anim->pImgSheetBuf = gBanimLeftImgSheetBuf;
        anim->pSpriteDataPool = gBanimOaml;
        gAnims[1] = anim;
    }
}

void InitRightAnim(int round_type)
{
    struct Anim * anim;
    u32 frame_front = BanimDefaultModeConfig[round_type * 4 + 0];
    u32 priority_front = BanimDefaultModeConfig[round_type * 4 + 1];
    u32 frame_back = BanimDefaultModeConfig[round_type * 4 + 2];
    u32 priority_back = BanimDefaultModeConfig[round_type * 4 + 3];
    u32 r2 = BanimTypesPosRight[gEkrDistanceType];

    void *array[2];
    array[0] = &&label1;
    array[1] = &&label2;
    
    gEkrXPosBase[1] = 0;
    gEkrYPosBase[1] = 0;
    gEkrXPosReal[1] = r2;
    gEkrYPosReal[1] = 0x58;

label1:
    {
        u32 idx = gpBanimModesRight[frame_front];
        void *scr = gBanimScrRight + idx;
        if (frame_front == 0xFF)
            scr = AnimScr_DefaultAnim;
        do anim = AnimCreate(scr, priority_front); while (0);
        anim->xPosition = gEkrXPosReal[1] - gEkrBgPosition;
        anim->yPosition = gEkrYPosReal[1];
        anim->oam2Base = OAM2_PAL(0x9) + OAM2_LAYER(0x2) + OAM2_CHR(0x6000 / 0x20);
        anim->state2 |= ANIM_BIT2_POS_RIGHT | ANIM_BIT2_0400;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = round_type;
        anim->pImgSheetBuf = gBanimRightImgSheetBuf;
        anim->pSpriteDataPool = gBanimOamr2;
        gAnims[2] = anim;
    }

label2:
    {
        u32 idx = gpBanimModesRight[frame_back];
        void *scr = gBanimScrRight + idx;
        if (frame_back == 0xFF)
            scr = AnimScr_DefaultAnim;
        anim = AnimCreate(scr, priority_back);
        anim->xPosition = gEkrXPosReal[1] - gEkrBgPosition;
        anim->yPosition = gEkrYPosReal[1];
        anim->oam2Base = OAM2_PAL(0x9) + OAM2_LAYER(0x2) + OAM2_CHR(0x6000 / 0x20);
        anim->state2 |= ANIM_BIT2_FRONT_FRAME | ANIM_BIT2_POS_RIGHT | ANIM_BIT2_0400;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = round_type;
        anim->pImgSheetBuf = gBanimRightImgSheetBuf;
        anim->pSpriteDataPool = gBanimOamr2;
        gAnims[3] = anim;
    }
}

void SwitchAISFrameDataFromBARoundType(struct Anim * anim, int type)
{
    u32 frame, priority;
    const u32 *scr;

    if (GetAISLayerId(anim) == 0) {
        frame    = BanimDefaultModeConfig[4 * type + 0];
        priority = BanimDefaultModeConfig[4 * type + 1];
    } else {
        frame    = BanimDefaultModeConfig[4 * type + 2];
        priority = BanimDefaultModeConfig[4 * type + 3];
    }

    if (frame != 0xFF) {
        if (GetAnimPosition(anim) == EKR_POS_L) {
            scr = gpBanimModesLeft;
            scr = (void *)gBanimScrLeft + scr[frame];
        } else
            scr = (void *)gBanimScrRight + gpBanimModesRight[frame];

        anim->pScrStart = scr;
        anim->pScrCurrent = scr;
    } else {
        anim->pScrStart = AnimScr_DefaultAnim;
        anim->pScrCurrent = AnimScr_DefaultAnim;
        anim->state3 = 0;
    }

    anim->drawLayerPriority = priority;
    anim->oam2Base &= ~0xC00;
    anim->oam2Base |= 0x800;
    anim->timer = 0;
    anim->state2 &= ANIM_BIT2_FRONT_FRAME | ANIM_BIT2_POS_RIGHT | ANIM_BIT2_0400;
    anim->currentRoundType = type;
    anim->commandQueueSize = 0;
    anim->pSpriteDataPool = gBanimOaml + GetAnimPosition(anim) * 0x5800 / 4;
    AnimSort();
}

int GetAISLayerId(struct Anim * anim)
{
    if (!(anim->state2 & ANIM_BIT2_FRONT_FRAME))
        return 0;

    return 1;
}

int GetAnimPosition(struct Anim * anim)
{
    if (!(anim->state2 & ANIM_BIT2_POS_RIGHT))
        return EKR_POS_L;

    return EKR_POS_R;
}

int CheckRoundMiss(s16 type)
{
    switch(type) {
    case ANIM_ROUND_TAKING_MISS_CLOSE:
    case ANIM_ROUND_TAKING_MISS_FAR:
        return true;

    case ANIM_ROUND_HIT_CLOSE:
    case ANIM_ROUND_CRIT_CLOSE:
    case ANIM_ROUND_NONCRIT_FAR:
    case ANIM_ROUND_CRIT_FAR:
    case ANIM_ROUND_TAKING_HIT_CLOSE:
    case ANIM_ROUND_STANDING:
    case ANIM_ROUND_TAKING_HIT_FAR:
    case ANIM_ROUND_MISS_CLOSE:
    default:
        return false;
    }
}

int CheckRound1(s16 type)
{
    switch(type) {
    case ANIM_ROUND_TAKING_HIT_CLOSE:
    case ANIM_ROUND_STANDING:
    case ANIM_ROUND_TAKING_HIT_FAR:
        return true;

    case ANIM_ROUND_HIT_CLOSE:
    case ANIM_ROUND_CRIT_CLOSE:
    case ANIM_ROUND_NONCRIT_FAR:
    case ANIM_ROUND_CRIT_FAR:
    case ANIM_ROUND_TAKING_MISS_CLOSE:
    case ANIM_ROUND_TAKING_MISS_FAR:
    case ANIM_ROUND_MISS_CLOSE:
    default:
        return false;
    }
}

int CheckRound2(s16 type)
{
    switch(type) {
    case ANIM_ROUND_HIT_CLOSE:
    case ANIM_ROUND_CRIT_CLOSE:
    case ANIM_ROUND_NONCRIT_FAR:
    case ANIM_ROUND_CRIT_FAR:
    case ANIM_ROUND_MISS_CLOSE:
        return true;

    case ANIM_ROUND_TAKING_MISS_CLOSE:
    case ANIM_ROUND_TAKING_MISS_FAR:
    case ANIM_ROUND_TAKING_HIT_CLOSE:
    case ANIM_ROUND_STANDING:
    case ANIM_ROUND_TAKING_HIT_FAR:
    default:
        return false;
    }
}

int CheckRoundCrit(struct Anim * anim)
{
    switch(anim->currentRoundType) {
    case ANIM_ROUND_CRIT_CLOSE:
    case ANIM_ROUND_CRIT_FAR:
        return true;

    case ANIM_ROUND_HIT_CLOSE:
    case ANIM_ROUND_NONCRIT_FAR:
    case ANIM_ROUND_TAKING_MISS_CLOSE:
    case ANIM_ROUND_TAKING_MISS_FAR:
    case ANIM_ROUND_TAKING_HIT_CLOSE:
    case ANIM_ROUND_STANDING:
    case ANIM_ROUND_TAKING_HIT_FAR:
    case ANIM_ROUND_MISS_CLOSE:
    default:
        return false;
    }
}

struct Anim *GetAnimAnotherSide(struct Anim * anim)
{
    return gAnims[(1 ^ GetAnimPosition(anim)) * 2];
}

s16 GetAnimRoundType(struct Anim * anim)
{
    return GetBattleAnimRoundType((anim->nextRoundId - 1) * 2 + GetAnimPosition(anim));
}

s16 GetAnimNextRoundType(struct Anim * anim)
{
    return GetBattleAnimRoundType(anim->nextRoundId * 2 + GetAnimPosition(anim));
}

s16 GetAnimRoundTypeAnotherSide(struct Anim * anim)
{
    return GetBattleAnimRoundType((anim->nextRoundId - 1) * 2 + (1 ^ GetAnimPosition(anim)));
}

s16 GetAnimNextRoundTypeAnotherSide(struct Anim * anim)
{
    return GetBattleAnimRoundType(anim->nextRoundId * 2 + (1 ^ GetAnimPosition(anim)));
}

void SetAnimStateHidden(int pos)
{
    if (pos == EKR_POS_L) {
        struct Anim * anim;

        anim = gAnims[0];
        anim->state |= ANIM_BIT_HIDDEN;

        anim = gAnims[1];
        anim->state |= ANIM_BIT_HIDDEN;
        return;
    }

    if (pos == EKR_POS_R) {
        struct Anim * anim;

        anim = gAnims[2];
        anim->state |= ANIM_BIT_HIDDEN;

        anim = gAnims[3];
        anim->state |= ANIM_BIT_HIDDEN;
        return;
    }
}

void SetAnimStateUnHidden(int pos)
{
    if (pos == EKR_POS_L) {
        struct Anim * anim;

        anim = gAnims[0];
        anim->state &= ~ANIM_BIT_HIDDEN;

        anim = gAnims[1];
        anim->state &= ~ANIM_BIT_HIDDEN;
        return;
    }

    if (pos == EKR_POS_R) {
        struct Anim * anim;

        anim = gAnims[2];
        anim->state &= ~ANIM_BIT_HIDDEN;

        anim = gAnims[3];
        anim->state &= ~ANIM_BIT_HIDDEN;
        return;
    }
}
