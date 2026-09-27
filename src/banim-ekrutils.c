#include "gbafe.h"

/**
 * Battle animation spell effect utilities (fireemblem8u: banim-ekrutils.c)
 */

struct ProcEfxSpdQuake {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ STRUCT_PAD(0x2E, 0x44);
    /* 44 */ const s16 * vecs;
    /* 48 */ STRUCT_PAD(0x48, 0x5C);
    /* 5C */ struct Anim * anim;
};

enum {
    EKR_HITTED = 0,
    EKR_MISS,
};

extern u32 gEfxSpellAnimExists;
extern u32 gEfxHpBarResireFlag;
extern u32 gUnknown_0201775C;
extern int gUnknown_0201FABC;
extern s16 gEfxHpLutOff[];
extern u8 gSpellAnimBgfx[0x1D00];
extern u8 gBuf_Banim[0x2000];
extern u16 gTmA_Banim[0xB58 / sizeof(u16)];
extern const s16 gEfxQuakeVecs[];
extern const s16 gEfxQuakeVecs2[];

void NewEfxHPBar(struct Anim * anim);
void NewEfxHpBarResire(struct Anim * anim);
void NewEfxHitQuake(struct Anim * anim1, struct Anim * anim2, int kind);
void NewEfxFlashHPBar(struct Anim * anim, int duartion, int duartion2);
void NewEfxFlashUnit(struct Anim * anim, u16 dura1, u16 dura2, int c);
void NewEfxNoDmage(struct Anim * anim1, struct Anim * anim2, int death);
void NewEfxAvoid(struct Anim * anim);
void NewEfxStatusCHG(struct Anim * anim);
void sub_0804E6DC(int pos);

void sub_08050844(struct ProcEfxSpdQuake * proc);
void sub_08050918(struct ProcEfxSpdQuake * proc);

#define GetRoundFlagByAnim(aAnim) (GetBattleAnimRoundTypeFlags((aAnim->nextRoundId - 1) * 2 + GetAnimPosition(aAnim)))

CONST_DATA struct ProcCmd ProcScr_efxSPDQuake[] = {
    PROC_19,
    PROC_REPEAT(sub_08050844),
    PROC_REPEAT(sub_08050918),
    PROC_END,
};

void SpellFx_Begin(void)
{
    gEfxSpellAnimExists = true;
}

void SpellFx_Finish(void)
{
    gEfxSpellAnimExists = false;
}

void SpellFx_SetBG1Position(void)
{
    SetBgOffset(BG_1, 0, 0);
}

void SpellFx_ClearBG1(void)
{
    CpuFastFill16(0, gBg1Tm, 0x800);
    EnableBgSync(BG1_SYNC_BIT);
}

void SpellFx_SetSomeColorEffect(void)
{
    SetBlendConfig(1, 0x10, 0x10, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);
    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0, 0xF0, 0xA0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 1);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;
    gDispIo.blend_ct.target2_enable_bd = 1;
}

void SpellFx_ClearColorEffects(void)
{
    SetBlendNone();
}

void StartBattleAnimHitEffectsDefault(struct Anim * anim, int type)
{
    StartBattleAnimHitEffects(anim, type, 3, 4);
}

void sub_08050150(struct Anim * anim, int type)
{
    StartBattleAnimHitEffects(anim, type, 5, 5);
}

void StartBattleAnimHitEffects(struct Anim * anim, int type, int a, int b)
{
    struct Anim *animr7, *animr9, *animr5, *animr8;
    int val1, val2;
    s16 roundt1, roundt2;

    if (GetAnimPosition(anim) == EKR_POS_L) {
        animr7 = gAnims[2];
        animr9 = gAnims[3];
        animr5 = gAnims[0];
        animr8 = gAnims[1];
    } else {
        animr7 = gAnims[0];
        animr9 = gAnims[1];
        animr5 = gAnims[2];
        animr8 = gAnims[3];
    }

    switch (type) {
    case EKR_HITTED:
        roundt1 = GetRoundFlagByAnim(animr7);
        roundt2 = GetRoundFlagByAnim(animr5);

        if (roundt1 & ANIM_ROUND_POISON) {
            if (GetUnitEfxDebuff(animr7) == UNIT_STATUS_NONE)
                SetUnitEfxDebuff(animr7, UNIT_STATUS_POISON);
        }

        if (roundt2 & ANIM_ROUND_POISON) {
            if (GetUnitEfxDebuff(animr5) == UNIT_STATUS_NONE)
                SetUnitEfxDebuff(animr5, UNIT_STATUS_POISON);
        }

        if (roundt1 & ANIM_ROUND_DEVIL || roundt2 & ANIM_ROUND_DEVIL) {
            struct Anim *tmp;
            tmp = animr5;
            animr5 = animr7;
            animr7 = tmp;
            animr8 = animr9;
        }

        val1 = gEfxHpLutOff[GetAnimPosition(animr5)];
        val2 = gEfxHpLutOff[GetAnimPosition(animr5)];
        val2++;

        val1 = GetEfxHp(val1 * 2 + GetAnimPosition(animr5));
        val2 = GetEfxHp(val2 * 2 + GetAnimPosition(animr5));

        if (val1 != val2) {
            NewEfxHPBar(animr5);

            if (CheckRoundCrit(animr7) == 1)
                NewEfxHitQuake(animr5, animr7, b);
            else
                NewEfxHitQuake(animr5, animr7, a);

            NewEfxFlashHPBar(animr5, 0, 5);
            NewEfxFlashUnit(animr5, 0, 8, 0);
        } else {
            NewEfxNoDmage(animr5, animr8, 0);
        }
        break;

    case EKR_MISS:
        NewEfxAvoid(animr5);
        break;
    }
}

void StartBattleAnimResireHitEffects(struct Anim * anim, int type)
{
    int val1, val2;
    struct Anim * animR7, * animR5, * animR8;

    if (GetAnimPosition(anim) == EKR_POS_L) {
        animR7 = gAnims[2];
        animR5 = gAnims[0];
        animR8 = gAnims[1];
    } else {
        animR7 = gAnims[0];
        animR5 = gAnims[2];
        animR8 = gAnims[3];
    }

    val1 = gEfxHpLutOff[GetAnimPosition(animR5)];
    val2 = gEfxHpLutOff[GetAnimPosition(animR5)];
    val2++;

    {
        val1 = GetEfxHp(val1 * 2 + GetAnimPosition(animR5));
        val2 = GetEfxHp(val2 * 2 + GetAnimPosition(animR5));
    }

    switch (type) {
    case EKR_HITTED:
        if (val1 != val2) {
            NewEfxHpBarResire(animR5);

            if (CheckRoundCrit(animR7) == 1)
                NewEfxHitQuake(animR5, animR7, 4);
            else
                NewEfxHitQuake(animR5, animR7, 3);

            NewEfxFlashHPBar(animR5, 0, 5);
            NewEfxFlashUnit(animR5, 0, 8, 0);
        } else {
            gEfxHpBarResireFlag = 2;
            NewEfxNoDmage(animR5, animR8, 1);
        }
        break;

    case EKR_MISS:
        NewEfxAvoid(animR5);
        break;
    }
}

void StartBattleAnimStatusChgHitEffects(struct Anim * anim, int type)
{
    struct Anim * anim1;

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim1 = gAnims[0];
    else
        anim1 = gAnims[2];

    switch (type) {
    case EKR_HITTED:
        NewEfxStatusCHG(anim1);
        break;

    case EKR_MISS:
        NewEfxAvoid(anim1);
        break;
    }
}

struct Anim * EfxCreateFrontAnim(struct Anim * anim, const AnimScr * scr1, const AnimScr * scr2, const AnimScr * scr3, const AnimScr * scr4)
{
    struct Anim * anim1;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(anim) == EKR_POS_L) {
            anim1 = AnimCreate(scr1, 0x78);
            anim1->oam2Base = 0x2840;
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        } else {
            anim1 = AnimCreate(scr2, 0x78);
            anim1->oam2Base = 0x2840;
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
    } else {
        if (GetAnimPosition(anim) != EKR_POS_L) {
            anim1 = AnimCreate(scr4, 0x78);
            anim1->oam2Base = 0x2840;
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        } else {
            anim1 = AnimCreate(scr3, 0x78);
            anim1->oam2Base = 0x2840;
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
    }
}

void EfxCreateBackAnim(struct Anim * anim, const u16 * src1, const u16 * src2)
{
    const u16 * buf;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        buf = src1;
    else
        buf = src2;

    if (GetAnimPosition(anim) == EKR_POS_L)
        EfxTmCpyBgHFlip(buf, gBg1Tm, 30, 20, 1, 0x100);
    else
        EfxTmCpyBG(buf, gBg1Tm, 30, 20, 1, 0x100);

    EnableBgSync(BG1_SYNC_BIT);
}

void SpellFx_WriteBgMap(struct Anim * anim, const u16 * src1, const u16 * src2)
{
    u16 * buf;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        LZ77UnCompWram(src1, gEkrTsaBuffer);
    else
        LZ77UnCompWram(src2, gEkrTsaBuffer);

    buf = gEkrTsaBuffer;
    if (GetAnimPosition(anim) == EKR_POS_L)
        EfxTmCpyBgHFlip(buf, gBg1Tm, 30, 20, 1, 0x100);
    else
        EfxTmCpyBG(buf, gBg1Tm, 30, 20, 1, 0x100);

    EnableBgSync(BG1_SYNC_BIT);
}

void SpellFx_WriteBgMapExt(struct Anim * anim, const u16 * src, int width, int height)
{
    LZ77UnCompWram(src, gEkrTsaBuffer);

    if (GetAnimPosition(anim) == EKR_POS_L)
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBg1Tm, width, height, 1, 0x100);
    else
        EfxTmCpyBG(gEkrTsaBuffer, gBg1Tm, width, height, 1, 0x100);

    EnableBgSync(BG1_SYNC_BIT);
}

void SpellFx_RegisterObjGfx(const void * img, u32 size)
{
    void * dst = (void *)0x06010800;
    LZ77UnCompWram(img, gBuf_Banim);
    RegisterDataMove(gBuf_Banim, dst, size);
}

void SpellFx_RegisterObjPal(const u16 * pal, u32 size)
{
    CpuFastCopy(pal, PAL_OBJ(2), size);
    EnablePalSync();
}

void SpellFx_RegisterBgGfx(const void * img, u32 size)
{
    void * dst = (void *)0x06002000;
    LZ77UnCompWram(img, gSpellAnimBgfx);
    RegisterDataMove(gSpellAnimBgfx, dst, size);
}

void SpellFx_RegisterBgPal(const u16 * pal, u32 size)
{
    CpuFastCopy(pal, PAL_BG(1), size);
    EnablePalSync();
}

void sub_08050650(const u16 * src, u16 * dst, u32 cur, u32 len_src, u32 len_dst)
{
    u32 i;
    for (i = 0; i < len_dst; i++, cur++) {
        if (cur >= len_src)
            cur = 0;

        dst[i] = src[cur];
    }
}

void sub_0805067C(const u16 * src, u16 * dst, u32 cur, u32 len_src, u32 len_dst)
{
    u32 i;
    for (i = 0; i < len_dst; i++, cur++) {
        if (cur >= len_src)
            cur = 0;

        dst[i + 0x10] = src[cur];
    }

    EnablePalSync();
}

void sub_080506AC(const u16 * src, u16 * dst, u32 a, u32 b, u32 c)
{
    u32 i;
    for (i = 0; i < c; i++, a++) {
        if (a >= b)
            a = 0;

        dst[i + 0x120] = src[a];
    }

    EnablePalSync();
}

s16 EfxAdvanceFrameLut(s16 * ptime, s16 * pcount, const s16 lut[])
{
    u16 count;
    u16 time;
    s16 iframe;
    u16 tmp, time2, count2;
    u16 uframe;
#ifndef NONMATCHING
    register u32 r6 asm("r6");
#else
    u32 r6;
#endif

    time = *ptime;
    r6 = time;
    if (r6 == 0) {
        count = *pcount;
        uframe = lut[count * 2];
        iframe = lut[count * 2];

        if (-1 == iframe)
            return iframe;

        if (-6 == iframe)
            return iframe;

        if (-5 == iframe)
            return iframe;

        if (-4 == iframe)
            return iframe;

        if (-2 == iframe) {
            *pcount = r6;
            uframe = lut[0];
        } else if (-3 == iframe) {
            *pcount = count - 1;
            tmp = *pcount;
            uframe = lut[tmp * 2];
        }

        count2 = *pcount;
        time2 = lut[count2 * 2 + 1];
        *pcount = count2 + 1;
        *ptime = time2 - 1;
        return uframe;
    } else {
        --*ptime;
        return -7;
    }
}

void sub_0805076C(void)
{
    gUnknown_0201775C = true;
}

int EfxGetCamMovDuration(void)
{
    if (gEkrDistanceType == EKR_DISTANCE_FARFAR)
        return 0x18;
    else if (gEkrDistanceType == EKR_DISTANCE_FAR)
        return 0x10;
    else
        return 0x0;
}

void sub_08050798(u32 val)
{
    u16 * dst = gTmA_Banim;
    CpuFill32(val, dst, sizeof(gTmA_Banim));
}

void EfxTmFill(u32 val)
{
    u16 * dst = gEfxFrameTmap;
    CpuFill32(val, dst, sizeof(gEfxFrameTmap));
}

void SetEkrFrontAnimPostion(int pos, s16 x, s16 y)
{
    struct Anim * anim;
    u16 ux = x;
    u16 uy = y;

    if (EKR_POS_L == pos) {
        anim = gAnims[0];
        anim->xPosition = ux;
        anim->yPosition = uy;

        anim = gAnims[1];
        anim->xPosition = ux;
        anim->yPosition = uy;
    } else {
        anim = gAnims[2];
        anim->xPosition = ux;
        anim->yPosition = uy;

        anim = gAnims[3];
        anim->xPosition = ux;
        anim->yPosition = uy;
    }
}

int sub_08050808(void)
{
    return gUnknown_0201FABC;
}

void sub_08050814(int a)
{
    gUnknown_0201FABC = a;
}

void NewEfxspdquake(struct Anim * anim)
{
    struct ProcEfxSpdQuake * proc;
    proc = Proc_Start(ProcScr_efxSPDQuake, PROC_TREE_1);
    proc->anim = anim;
    proc->timer = 0;
    proc->vecs = gEfxQuakeVecs;
}

void sub_08050844(struct ProcEfxSpdQuake * proc)
{
    const s16 * vecs = proc->vecs;
    s16 dx = vecs[proc->timer * 2 + 0];
    s16 dy = vecs[proc->timer * 2 + 1];
    struct Anim * anim;

    anim = gAnims[0];
    anim->xPosition += dx;
    anim->yPosition += dy;
    anim = gAnims[1];
    anim->xPosition += dx;
    anim->yPosition += dy;
    anim = gAnims[2];
    anim->xPosition += dx;
    anim->yPosition += dy;
    anim = gAnims[3];
    anim->xPosition += dx;
    anim->yPosition += dy;

    gDispIo.bg_off[2].y -= dx;
    gDispIo.bg_off[2].x -= dy;

    if (sub_08050808() == 0) {
        Proc_Break(proc);
        return;
    }

    if (sub_08050808() == 2) {
        proc->vecs = gEfxQuakeVecs2;
        proc->timer = 0;
        sub_08050814(3);
        return;
    }

    ++proc->timer;
    if (vecs[proc->timer * 2 + 0] == 0x7FFF)
        proc->timer = 0;
}

void sub_08050918(struct ProcEfxSpdQuake * proc)
{
    int x1 = gEkrXPosReal[0] - gEkrBgPosition;
    int x2 = gEkrYPosReal[0];
    int y1 = gEkrXPosReal[1] - gEkrBgPosition;
    int y2 = gEkrYPosReal[1];

    SetEkrFrontAnimPostion(EKR_POS_L, x1, x2);
    SetEkrFrontAnimPostion(EKR_POS_R, y1, y2);

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
        SetBgOffset(BG_2, 0, 0);
        break;

    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
        sub_0804E6DC(gEkrBgPosition);
        break;
    }

    Proc_Break(proc);
}
