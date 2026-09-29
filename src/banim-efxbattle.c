#include "gbafe.h"
#include "gbafe/banim_ekrdragon.h"

// ROM data referenced below, defined in data/ (see tools/datasplit.py)
extern const u8 gUnk_081D8166[];
extern const u8 gUnk_081D8178[];
extern const u8 gUnk_081D819A[];
extern const u8 gUnk_081D81AC[];
extern const u8 gUnk_081D81BE[];

/**
 * Battle camera scrolling and screen quakes (fireemblem8u: banim-efxbattle.c)
 */

struct ProcEfxFarAttack {
    PROC_HEADER;

    /* 29 */ u8 pos;
    /* 2A */ u16 unk_2a;
    /* 2C */ s16 timer;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 terminator;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;
    /* 36 */ s16 unk_36;
    /* 38 */ s16 unk_38;
};

struct ProcEfxQuake {
    PROC_HEADER;

    /* 29 */ u8 quake_ui;
    /* 2A */ u8 kind;
    /* 2C */ s16 timer;
    /* 30 */ int unk_30;
    /* 34 */ s16 ix;
    /* 36 */ s16 unk_36;
    /* 38 */ s16 unk_38;
    /* 3A */ s16 unk_3a;
    /* 3C */ s16 iy;
    /* 3E */ s16 unk_3e;
    /* 40 */ int unk_40;
    /* 44 */ const s16 * vec;
    /* 48 */ int unk_48;
    STRUCT_PAD(0x4C, 0x5C);
    /* 5C */ struct Anim * anim_l;
    /* 60 */ struct Anim * anim_r;
    /* 64 */ struct Anim * unk_64;
};

extern const s16 gEfxQuakeVecs0[];
extern const s16 gEfxQuakeVecs[];
extern const s16 gEfxQuakeVecs1[];
extern const s16 gEfxQuakeVecs2[];
extern const s16 gEfxQuakeVecs3[];
extern const s16 gEfxQuakeVecs4[];
extern const s16 gEfxQuakeVecs5[];
extern const s16 gEfxHitQuakeVecs4[];
extern const s16 gEfxHitQuakeVecs5[];

extern const u32 AnimScr_EkrMainMini_R_Far[];
extern const u32 AnimScr_EkrMainMini_L_Far[];

extern s16 gEkrDistanceType;
extern u32 gEkrInitPosReal;
extern int gEfxQuakeExist;
extern int gEfxHitQuakeExist;
extern int gEfxFarAttackExist;
extern u32 gUnknown_0201775C;
extern u16 gTmA_Banim[0xB58 / sizeof(u16)];
extern void * gUnknown_0200003C[2];
extern u16 * gBanimTerrainPaletteMaybe[2];
extern u16 gEfxTerrainPalette[0x10];

int GetBattleAnimArenaFlag(void);
void sub_08055320(struct BanimUnkStructComm * conf);
void sub_08055468(s16 distance, s16 pos);
void sub_080554FC(int x);

void sub_0804E6DC(int xPos);

void efxHitQuakePure_Loop_Null(void);
void efxHitQuake_Loop(struct ProcEfxQuake * proc);
void efxQuakePure_Loop(struct ProcEfxQuake * proc);
void efxQuake_Loop(struct ProcEfxQuake * proc);
void sub_0804E5AC(struct ProcEfxFarAttack * proc);
void sub_0804E5DC(struct ProcEfxFarAttack * proc);
void sub_0804E648(struct ProcEfxFarAttack * proc);

CONST_DATA struct ProcCmd ProcScr_efxFarAttack[] = {
    PROC_19,
    PROC_REPEAT(sub_0804E5AC),
    PROC_REPEAT(sub_0804E5DC),
    PROC_REPEAT(sub_0804E648),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_EfxQuakePure[] = {
    PROC_19,
    PROC_REPEAT(efxQuakePure_Loop),
    PROC_END,
};

CONST_DATA const void * EfxQuakePureVecs[] = {
    gEfxQuakeVecs0,
    NULL,
    gEfxQuakeVecs,
    NULL,
    gEfxQuakeVecs1,
    NULL,
    gEfxQuakeVecs2,
    NULL,
    gEfxQuakeVecs3,
    NULL,
    gEfxQuakeVecs4,
    NULL,
    (const void *) gUnk_081D8166,
    NULL,
    (const void *) gUnk_081D8178,
    NULL,
    (const void *) gUnk_081D819A,
    NULL,
    (const void *) gUnk_081D81AC,
    NULL,
    (const void *) gUnk_081D81BE,
    NULL,
};

CONST_DATA struct ProcCmd ProcScr_efxHitQuakePure[] = {
    PROC_19,
    PROC_REPEAT(efxHitQuakePure_Loop_Null),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_efxQuake[] = {
    PROC_19,
    PROC_REPEAT(efxQuake_Loop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_EfxHitQuake[] = {
    PROC_19,
    PROC_REPEAT(efxHitQuake_Loop),
    PROC_END,
};

void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg)
{
    struct ProcEfxFarAttack * proc;
    u32 val;

    switch (gEkrDistanceType)
    {
        case 1:
        case 2:
            proc = Proc_Start(ProcScr_efxFarAttack, PROC_TREE_3);
            proc->pos = GetAnimPosition(anim);
            proc->timer = 0;

            if (arg != -1)
            {
                proc->unk_2e = arg >> 1;
                proc->terminator = arg - (arg >> 1);
            }
            else
            {
                if (gEkrDistanceType == 1)
                {
                    proc->unk_2e = 5;
                    proc->terminator = 5;
                }
                else
                {
                    proc->unk_2e = 7;
                    proc->terminator = 7;
                }
            }

            if (gEkrDistanceType == 1)
                val = 0x20;
            else
                val = 0xf0;

            if (proc->pos == EKR_POS_L)
            {
                proc->unk_32 = -val;
                proc->unk_34 = (-val >> 1);
                proc->unk_36 = (-val >> 1);
                proc->unk_38 = 0;
            }
            else
            {
                proc->unk_32 = 0;
                proc->unk_34 = (-val >> 1);
                proc->unk_36 = (-val >> 1);
                proc->unk_38 = -val;
            }

            gEkrBgPosition = proc->unk_32;
            gEfxFarAttackExist = 1;

            break;

        case 0:
        case 3:
        case 4:
            break;
    }
}

void sub_0804E574(struct ProcEfxFarAttack * unused, int x)
{
    struct Anim * anim = gAnims[0];
    x = -x;

    anim->xPosition = x + gEkrXPosReal[0];

    anim = gAnims[1];
    anim->xPosition = x + gEkrXPosReal[0];

    anim = gAnims[2];
    anim->xPosition = x + gEkrXPosReal[1];

    anim = gAnims[3];
    anim->xPosition = x + gEkrXPosReal[1];
}

void sub_0804E5AC(struct ProcEfxFarAttack * proc)
{
    sub_0804E574(proc, proc->unk_32);
    EkrDragonTmCpyExt(proc->unk_32, 0);
    sub_0804E6DC(proc->unk_32);

    proc->timer = 0;

    Proc_Break(proc);
}

void sub_0804E5DC(struct ProcEfxFarAttack * proc)
{
    u32 ret = Interpolate(INTERPOLATE_SQUARE, proc->unk_32, proc->unk_34, proc->timer, proc->unk_2e);
    gEkrBgPosition = ret;

    sub_0804E574(proc, ret);
    EkrDragonTmCpyExt(gEkrBgPosition, 0);
    sub_0804E6DC(gEkrBgPosition);

    if (GetBattleAnimArenaFlag() != 0)
        sub_080554FC(gEkrBgPosition);

    proc->timer++;

    if (proc->timer > proc->unk_2e)
    {
        proc->timer = 1;
        Proc_Break(proc);
    }
}

void sub_0804E648(struct ProcEfxFarAttack * proc)
{
    u32 ret = Interpolate(INTERPOLATE_RSQUARE, proc->unk_36, proc->unk_38, proc->timer, proc->terminator);
    gEkrBgPosition = ret;

    sub_0804E574(proc, ret);
    EkrDragonTmCpyExt(gEkrBgPosition, 0);
    sub_0804E6DC(gEkrBgPosition);

    if (GetBattleAnimArenaFlag() != 0)
        sub_080554FC(gEkrBgPosition);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        if (proc->pos == EKR_POS_L)
            gEkrInitPosReal = EKR_POS_R;
        else
            gEkrInitPosReal = EKR_POS_L;

        gEfxFarAttackExist = false;

        Proc_Break(proc);
    }
}

void sub_0804E6DC(int xPos)
{
    u16 * p;
    int a;
    int x;

    if (CheckInEkrDragon() != 0 || GetBattleAnimArenaFlag() != 0)
        return;

    a = (xPos >> 3);
    x = xPos & 7;
    SetBgOffset(2, x, 0);

    p = gTmA_Banim + 33 + a;
    EfxTmCpyExt(p + 132, 66, gBg2Tm, 32, 32, 20, -1, -1);

    EnableBgSync(BG2_SYNC_BIT);
}

static inline void SetEkrBg2QuakeVec(int a, int b)
{
    gEkrBg2QuakeVec.x = a;
    gEkrBg2QuakeVec.y = b;
}

ProcPtr NewEfxQuakePure(int index, int kind)
{
    struct ProcEfxQuake * proc = Proc_Start(ProcScr_EfxQuakePure, PROC_TREE_3);
    proc->vec = (const s16 *)EfxQuakePureVecs[index * 2];
    proc->quake_ui = (intptr_t)EfxQuakePureVecs[index * 2 + 1];
    proc->kind = kind;
    proc->timer = 0;
    return proc;
}

void efxQuakePure_Loop(struct ProcEfxQuake * proc)
{
    const s16 * vec = proc->vec;

    if (vec[proc->timer * 2 + 0] != INT16_MAX)
    {
        gEkrBg2QuakeVec.x = vec[proc->timer * 2 + 0];
        gEkrBg2QuakeVec.y = vec[proc->timer * 2 + 1];
        proc->timer++;
    }
    else
    {
        switch (proc->kind) {
        case 0:
            proc->timer = 0;
            gEkrBg2QuakeVec.x = vec[0];
            gEkrBg2QuakeVec.y = vec[1];
            break;

        case 1:
            gEkrBg2QuakeVec.x = gEkrBg2QuakeVec.y = 0;
            break;
        }
    }
}

ProcPtr NewEfxHitQuakePure(void)
{
    return Proc_Start(ProcScr_efxHitQuakePure, PROC_TREE_3);
}

void efxHitQuakePure_Loop_Null(void)
{
    return;
}

ProcPtr NewEfxQuake(int kind)
{
    struct ProcEfxQuake * proc;

    if (gEfxFarAttackExist == 1)
        return NULL;

    gEfxQuakeExist = 1;
    proc = Proc_Start(ProcScr_efxQuake, PROC_TREE_3);
    proc->timer = 0;
    proc->anim_l = gAnims[0];
    proc->anim_r = gAnims[2];

    switch (kind) {
    case 0:
        proc->vec = gEfxQuakeVecs0;
        proc->quake_ui = 0;
        break;

    case 1:
        proc->vec = gEfxQuakeVecs;
        proc->quake_ui = 0;
        break;

    case 2:
        proc->vec = gEfxQuakeVecs1;
        proc->quake_ui = 0;
        break;

    case 3:
        proc->vec = gEfxQuakeVecs2;
        proc->quake_ui = 0;
        break;

    case 4:
        proc->vec = gEfxQuakeVecs3;
        proc->quake_ui = 0;
        break;

    case 5:
        proc->vec = gEfxQuakeVecs4;
        proc->quake_ui = 1;
        break;

    case 6:
        proc->vec = gEfxQuakeVecs5;
        proc->quake_ui = 1;
        break;

    default:
        proc->vec = gEfxQuakeVecs0;
        proc->quake_ui = 0;
        break;
    }

    proc->ix = 0;
    proc->iy = 0;
    return proc;
}

void efxQuake_Loop(struct ProcEfxQuake * proc)
{
    int x1;
    int y1;
    int x2;
    int y2;

    const s16 * vec = proc->vec;
    u16 timer = proc->timer;

    if (vec[proc->timer * 2 + 0] == INT16_MAX)
    {
        x1 = gEkrXPosReal[0] - gEkrBgPosition;
        y1 = gEkrYPosReal[0];
        x2 = gEkrXPosReal[1] - gEkrBgPosition;
        y2 = gEkrYPosReal[1];

        SetEkrFrontAnimPostion(0, x1, y1);
        SetEkrFrontAnimPostion(1, x2, y2);

        SetBgOffset(2, 0, 0);

        if (CheckInEkrDragon() != 0)
            SetBgOffset(3, proc->ix, proc->iy);

        gEfxQuakeExist = 0;
        Proc_End(proc);
    }
    else
    {
        gEkrBg2QuakeVec.x = vec[proc->timer * 2 + 0];
        gEkrBg2QuakeVec.y = vec[proc->timer * 2 + 1];
        proc->timer = timer + 1;

        SetBgOffset(2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);

        if (CheckInEkrDragon() != 0)
            SetBgOffset(3, proc->ix + gEkrBg2QuakeVec.x, proc->iy + gEkrBg2QuakeVec.y);

        if (CheckInEkrDragon() != 0)
        {
            x1 = (gEkrXPosReal[0] - gEkrBg2QuakeVec.x) - gEkrBgPosition;
            y1 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
        }
        else
        {
            x1 = (gEkrXPosReal[0] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
            y1 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
        }

        x2 = (gEkrXPosReal[1] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y2 = gEkrYPosReal[1] - gEkrBg2QuakeVec.y;

        switch (gEkrDistanceType) {
        case 0:
            SetEkrFrontAnimPostion(0, x1, y1);
            SetEkrFrontAnimPostion(1, x2, y2);
            break;

        case 1:
        case 2:
            if (GetAnimPosition(proc->anim_l) == 0)
                SetEkrFrontAnimPostion(0, x1, y1);
            else
                SetEkrFrontAnimPostion(1, x2, y2);
            break;
        }
    }
}

void NewEfxHitQuake(struct Anim * anim1, struct Anim * anim2, int kind)
{
    s16 x;
    struct ProcEfxQuake * proc;
    struct Anim * anim;

    if (gEfxHitQuakeExist != 0)
        return;

    gEfxHitQuakeExist = 1;
    proc = Proc_Start(ProcScr_EfxHitQuake, PROC_TREE_3);
    proc->anim_l = anim1;
    proc->anim_r = anim2;
    proc->timer = 0;
    proc->quake_ui = 1;

    if (kind == 0)
        proc->vec = gEfxQuakeVecs0;
    else if (kind == 1)
        proc->vec = gEfxQuakeVecs;
    else if (kind == 2)
        proc->vec = gEfxQuakeVecs1;
    else if (kind == 3)
        proc->vec = gEfxQuakeVecs2;
    else if (kind == 4)
        proc->vec = gEfxHitQuakeVecs4;
    else if (kind == 5)
        proc->vec = gEfxHitQuakeVecs5;
    else
        proc->vec = gEfxQuakeVecs0;

    proc->unk_48 = 1;

    if (CheckInEkrDragon() != 0)
    {
        proc->unk_64 = NULL;
        return;
    }

    if (GetBattleAnimArenaFlag() != 0)
    {
        proc->unk_64 = NULL;
        return;
    }

    if (gEkrDistanceType == 0)
    {
        proc->unk_64 = NULL;
        return;
    }

    x = gEkrBgPosition - gEkrXPosBase[GetAnimPosition(proc->anim_l)];

    if (GetAnimPosition(anim1) == 0)
    {
        proc->unk_36 = 64;
        proc->unk_3e = 104;
        anim = AnimCreate(AnimScr_EkrMainMini_R_Far, 5);
    }
    else
    {
        proc->unk_36 = 176;
        proc->unk_3e = 104;
        anim = AnimCreate(AnimScr_EkrMainMini_L_Far, 5);
    }

    anim->xPosition = proc->unk_36 - x;
    anim->yPosition = proc->unk_3e;

    if (gUnknown_0201775C == 1)
        anim->oam2Base = OAM2_CHR(0xC0) + OAM2_LAYER(1) + OAM2_PAL(3);
    else
        anim->oam2Base = OAM2_CHR(0xC0) + OAM2_LAYER(3) + OAM2_PAL(3);

    proc->unk_64 = anim;

    RegisterDataMove(gUnknown_0200003C[GetAnimPosition(anim1)], (void *)0x06011800, 0x800);

    if (gEkrSpellAnimIndex[GetAnimPosition(anim2)] == 0x39)
        CpuFastCopy(gBanimTerrainPaletteMaybe[GetAnimPosition(anim2)], gEfxTerrainPalette, 0x20);

    CpuFastCopy(gBanimTerrainPaletteMaybe[GetAnimPosition(anim1)], PAL_OBJ(0x3), 0x20);
    EnablePalSync();

    sub_08055468(gEkrDistanceType, GetAnimPosition(anim1));
    sub_0804E6DC(gEkrBgPosition);
}

void efxHitQuake_Loop(struct ProcEfxQuake * proc)
{
    int x1;
    int y1;
    int x2;
    int y2;

    const s16 * vec = proc->vec;

    if (vec[proc->timer * 2 + 0] == INT16_MAX)
    {
        switch (gEkrDistanceType)
        {
            case 0:
                SetBgOffset(2, 0, 0);

                if (CheckInEkrDragon() != 0)
                    SetBgOffset(3, 0, 0);

                break;

            case 1:
            case 2:
                if (CheckInEkrDragon() != 0)
                    SetBgOffset(3, 0, 0);

                sub_0804E6DC(gEkrBgPosition);
                break;
        }

        if (proc->unk_64 != NULL)
        {
            AnimDelete(proc->unk_64);
            sub_08055320(&EkrMainMiniConf_0201FAD0);
        }

        x1 = gEkrXPosReal[0] - gEkrBgPosition;
        y1 = gEkrYPosReal[0];
        x2 = gEkrXPosReal[1] - gEkrBgPosition;
        y2 = gEkrYPosReal[1];

        SetEkrFrontAnimPostion(0, x1, y1);
        SetEkrFrontAnimPostion(1, x2, y2);

        gEfxHitQuakeExist = 0;

        if (proc->quake_ui == 1)
        {
            if (CheckInEkrDragon() != 0)
                SetBgOffset(3, 0, 0);

            SetBgOffset(0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
            EkrGauge_0804CC8C(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
            EkrDispUP_SetPositionSync(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        }

        Proc_End(proc);
    }
    else
    {
        int x;
        int y;

        if ((proc->timer == 0) && (proc->unk_64 != NULL))
            FillBGRect(GetAnimPosition(proc->anim_l) * 15 + gBg2Tm + 0x160, 0xf, 5, 0, 0);

        gEkrBg2QuakeVec.x = x = vec[proc->timer * 2 + 0];
        gEkrBg2QuakeVec.y = y = vec[proc->timer * 2 + 1];
        proc->timer++;

        if (proc->unk_64 != NULL)
        {
            s16 hm = gEkrBgPosition - gEkrXPosBase[GetAnimPosition(proc->anim_l)];
            struct Anim * anim = proc->unk_64;

            anim->xPosition = (proc->unk_36 + gEkrBg2QuakeVec.x) - hm;
            anim->yPosition = proc->unk_3e - gEkrBg2QuakeVec.y;
        }
        else
        {
            SetBgOffset(2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
        }

        if (proc->quake_ui == 1)
        {
            if (CheckInEkrDragon() != 0)
                SetBgOffset(3, -x, y);

            SetBgOffset(0, gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x, gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);
            EkrGauge_0804CC8C(-(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
            EkrDispUP_SetPositionSync(
                -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
        }

        if (CheckInEkrDragon() != 0)
            SetBgOffset(3, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);

        if (CheckInEkrDragon() != 0)
        {
            x1 = (gEkrXPosReal[0] - gEkrBg2QuakeVec.x) - gEkrBgPosition;
            y1 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
        }
        else
        {
            x1 = (gEkrXPosReal[0] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
            y1 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
        }

        x2 = (gEkrXPosReal[1] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y2 = gEkrYPosReal[1] - gEkrBg2QuakeVec.y;

        switch (gEkrDistanceType)
        {
            case 0:
                SetEkrFrontAnimPostion(0, x1, y1);
                SetEkrFrontAnimPostion(1, x2, y2);
                break;

            case 1:
            case 2:
                if (GetAnimPosition(proc->anim_l) == 0)
                    SetEkrFrontAnimPostion(0, x1, y1);
                else
                    SetEkrFrontAnimPostion(1, x2, y2);

                break;
        }
    }
}
