#include "gbafe.h"

/**
 * Triangle attack battle animations (fireemblem8u: banim-ekrtriangle.c)
 */

enum {
    EKR_TRI_JTYPE_DEFAULT = 0,
    EKR_TRI_JTYPE_PROMOTED = 1,
};

enum {
    EKR_TRI_WTYPE_DEFAULT = 0,
    EKR_TRI_WTYPE_ALTERNATIVE = 1,
    EKR_TRI_WTYPE_ALTERNATIVE2 = 2,
};

struct ProcEkrTriangle {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcEkrTriClass {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;

    STRUCT_PAD(0x2E, 0x44);

    /* 44 */ int etype1;
    /* 48 */ int etype2;
    /* 4C */ int ewtype1;
    /* 50 */ int ewtype2;

    STRUCT_PAD(0x54, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcEkrTriPegasusKnightBG {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;

    STRUCT_PAD(0x2E, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const s16 * frame_config;
    /* 4C */ const u16 ** tsalut_left;
    /* 50 */ const u16 ** tsalut_right;

    STRUCT_PAD(0x54, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcEkrTriArmorKnightOBJ2 {
    PROC_HEADER;

    /* 29 */ u8 unk29;
    /* 2A */ u8 unk2A;

    STRUCT_PAD(0x2B, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 unk30;
    /* 32 */ s16 unk32;
    /* 34 */ s16 unk34;

    STRUCT_PAD(0x36, 0x5C);

    /* 5C */ struct Anim * anim;
    /* 60 */ struct Anim * anim2;
    /* 64 */ struct Anim * anim3;
};

struct ProcEfxTriagnleQUAKE {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;

    STRUCT_PAD(0x30, 0x5C);

    /* 5C */ struct Anim * anim;
    /* 60 */ ProcPtr qproc;
};

extern int gEkrTriangleInvalid;
extern int gEfxBgSemaphore;
extern u8 gSpellAnimBgfx[];
extern u8 gBuf_Banim[];

extern CONST_DATA struct ProcCmd ProcScr_ekrTriangle[];
extern CONST_DATA struct ProcCmd ProcScr_ekrTriPegasusKnight[];
extern CONST_DATA struct ProcCmd ProcScr_ekrTriPegasusKnightBG[];
extern CONST_DATA struct ProcCmd ProcScr_EkrTriPegasusKnightOBJ[];
extern CONST_DATA struct ProcCmd ProcScr_EkrTriArmorKnight[];
extern CONST_DATA struct ProcCmd ProcScr_EkrTriArmorKnightOBJ[];
extern CONST_DATA struct ProcCmd ProcScr_EkrTriArmorKnightOBJ2[];
extern CONST_DATA struct ProcCmd ProcScr_EfxTriangleQUAKE[];

extern const s16 FrameLut_EkrTriPegagusBGLeft[];
extern const s16 FrameLut_EkrTriPegagusBGRight[];
extern CONST_DATA const u16 * TsaLut_EkrTriPegagusBG[];
extern const u8 Img_TriPegasusKnightBG[];
extern const u8 Img_TriFalconKnightSwordBG[];
extern const u8 Img_TriFalconKnightLanceBG[];
extern AnimScr AnimScr_TriAtkLeft[];
extern AnimScr AnimScr_TriAtkRight[];
extern const u8 Img_TriPegasusKnightOBJ[];
extern const u8 Img_TriFalconKnightSwordOBJ[];
extern const u8 Img_TriFalconKnightLanceOBJ[];
extern AnimScr AnimScr_TriKnightOBJ[];
extern const u8 Img_TriKnightOBJ[];
extern AnimScr AnimScr_TriGenerialLanceOBJ[];
extern const u8 Img_TriGenerialLanceOBJ[];
extern AnimScr AnimScr_TriGenerialAxeOBJ[];
extern const u8 Img_TriGenerialAxeOBJ[];
extern AnimScr AnimScr_TriGenerialHandAxeOBJ[];
extern const u8 Img_TriGenerialHandAxeOBJ[];
extern AnimScr AnimScr_TriKnightAtkOBJ[];
extern const u8 Img_TriKnightAtkOBJ[];
extern AnimScr AnimScr_TriGenerialLanceAtkOBJ[];
extern const u8 Img_TriGenerialLanceAtkOBJ[];
extern AnimScr AnimScr_TriGenerialAxeAtkOBJ[];
extern const u8 Img_TriGenerialAxeAtkOBJ[];
extern AnimScr AnimScr_TriGenerialHandAxeAtkOBJ[];
extern const u8 Img_TriGenerialHandAxeAtkOBJ[];

void PlaySFX(int songid, int volume, int locate, int type);

ProcPtr NewEkrTriPegasusKnight(struct Anim * anim, u32 ekr1, u32 ekr2, u32 banim1, u32 ewtype2);
void NewEkrTriPegasusKnightBG(struct Anim * anim, u32 pos, u32 etype, u32 ewtype);
void NewEkrTriPegasusKnightOBJ(struct Anim * anim, u32 pos, u32 etype, u32 ewtype);
ProcPtr NewEkrTriArmorKnight(struct Anim * anim, u32 ekr1, u32 ekr2, u32 banim1, u32 ewtype2);
void NewEkrTriArmorKnightOBJ(struct Anim * anim, u32 etype1, u32 etype2, u32 ewtype1, u32 ewtype2);
void NewEkrTriArmorKnightOBJ2(struct Anim * anim, u32 pos, u32 etype, u32 ewtype);
void NewEfxTriangleQUAKE(struct Anim * anim, int duration);

bool CheckEkrTriangleInvalid(void)
{
    if (gEkrTriangleInvalid == true)
        return true;

    return false;
}

void nullsub_10(void)
{
    return;
}

void NewEkrTriangle(struct Anim * anim)
{
    struct ProcEkrTriangle * proc;

    proc = Proc_Start(ProcScr_ekrTriangle, PROC_TREE_3);
    proc->anim = anim;
    gEkrTriangleInvalid = false;
}

void EkrTriangleMain(struct ProcEkrTriangle * proc)
{
    int jid, jid1, jid2, wpn_type;
    int etype2;
    int ewtype1;
    int ewtype2;
    int etype1;
    struct Unit * unit;
    u16 wpn;
    s32 knight = 0x14;

    etype1 = 0;
    etype2 = 0;
    ewtype1 = 0;
    ewtype2 = 0;

    jid = (GetAnimPosition(proc->anim) == POS_L)
        ? gpEkrBattleUnitLeft->unit.pClassData->number
        : gpEkrBattleUnitRight->unit.pClassData->number;

    if (jid >= knight)
    {
        if (jid <= 0x17)
        {
            unit = gpEkrTriangleUnits[0];
            jid1 = unit->pClassData->number;

            if (jid1 == 0x14)
                etype1 = EKR_TRI_JTYPE_DEFAULT;
            if (jid1 == 0x15)
                etype1 = EKR_TRI_JTYPE_DEFAULT;
            if (jid1 == 0x16)
                etype1 = EKR_TRI_JTYPE_PROMOTED;
            if (jid1 == 0x17)
                etype1 = EKR_TRI_JTYPE_PROMOTED;

            wpn = GetUnitEquippedWeapon(unit);
            if (wpn == 0)
                wpn_type = ITYPE_LANCE;
            else
                wpn_type = GetItemType(wpn);

            switch (wpn_type) {
            case ITYPE_LANCE:
                ewtype1 = EKR_TRI_WTYPE_DEFAULT;
                break;

            case ITYPE_AXE:
                ewtype1 = GetItemIndex(wpn) == 0x28
                            ? EKR_TRI_WTYPE_ALTERNATIVE2
                            : EKR_TRI_WTYPE_ALTERNATIVE;
            default:
                break;
            }

            unit = gpEkrTriangleUnits[1];
            jid2 = unit->pClassData->number;

            if (jid2 == 0x14)
                etype2 = EKR_TRI_JTYPE_DEFAULT;
            if (jid2 == 0x15)
                etype2 = EKR_TRI_JTYPE_DEFAULT;
            if (jid2 == 0x16)
                etype2 = EKR_TRI_JTYPE_PROMOTED;
            if (jid2 == 0x17)
                etype2 = EKR_TRI_JTYPE_PROMOTED;

            wpn = GetUnitEquippedWeapon(unit);
            if (wpn == 0)
                wpn_type = ITYPE_LANCE;
            else
                wpn_type = GetItemType(wpn);

            switch (wpn_type) {
            case ITYPE_LANCE:
                ewtype2 = EKR_TRI_WTYPE_DEFAULT;
                break;

            case ITYPE_AXE:
                ewtype2 = GetItemIndex(wpn) == 0x28
                            ? EKR_TRI_WTYPE_ALTERNATIVE2
                            : EKR_TRI_WTYPE_ALTERNATIVE;
                break;

            default:
                break;
            }

            NewEkrTriArmorKnight(proc->anim, etype1, etype2, ewtype1, ewtype2);

            if (GetItemIndex(gpEkrBattleUnitRight->weaponBefore) == 0x28)
                gEkrTriangleInvalid = false;
            else
                gEkrTriangleInvalid = true;

            goto proc_break;
        }
    }

    unit = gpEkrTriangleUnits[0];
    jid1 = unit->pClassData->number;

    if (jid1 == 0x32)
        etype1 = EKR_TRI_JTYPE_DEFAULT;
    if (jid1 == 0x33)
        etype1 = EKR_TRI_JTYPE_PROMOTED;

    wpn = GetUnitEquippedWeapon(unit);
    if (wpn == 0)
        wpn_type = ITYPE_LANCE;
    else
        wpn_type = GetItemType(wpn);

    switch (wpn_type) {
    case ITYPE_LANCE:
        ewtype1 = EKR_TRI_WTYPE_DEFAULT;
        break;

    case ITYPE_SWORD:
        ewtype1 = EKR_TRI_WTYPE_ALTERNATIVE;
        break;

    default:
        break;
    }

    unit = gpEkrTriangleUnits[1];
    jid2 = unit->pClassData->number;

    if (jid2 == 0x32)
        etype2 = 0;
    if (jid2 == 0x33)
        etype2 = 1;

    wpn = GetUnitEquippedWeapon(unit);
    if (wpn == 0)
        wpn_type = ITYPE_LANCE;
    else
        wpn_type = GetItemType(wpn);

    switch (wpn_type) {
    case ITYPE_LANCE:
        ewtype2 = 0;
        break;

    case ITYPE_SWORD:
        ewtype2 = 1;
        break;
    }

    NewEkrTriPegasusKnight(proc->anim, etype1, etype2, ewtype1, ewtype2);

    if (jid == 0x32)
        gEkrTriangleInvalid = false;
    else
        gEkrTriangleInvalid = true;

proc_break:
    Proc_Break(proc);
}

ProcPtr NewEkrTriPegasusKnight(struct Anim * anim, u32 ekr1, u32 ekr2, u32 banim1, u32 ewtype2)
{
    struct ProcEkrTriClass * proc;

    proc = Proc_Start(ProcScr_ekrTriPegasusKnight, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->etype1 = ekr1;
    proc->etype2 = ekr2;
    proc->ewtype1 = banim1;
    proc->ewtype2 = ewtype2;
    return proc;
}

void EkrTriPegasusKnightMain(struct ProcEkrTriClass * proc)
{
    struct Anim * anim1 = GetAnimAnotherSide(proc->anim);

    if (++proc->timer == 0xA)
        NewEkrTriPegasusKnightOBJ(proc->anim, POS_L, proc->etype1, proc->ewtype1);

    if (proc->timer == 0x1C)
        NewEfxFlashBgWhite(anim1, 0x6);

    if (proc->timer == 0x22)
    {
        NewEkrTriPegasusKnightBG(anim1, POS_L, proc->etype1, proc->ewtype1);
        NewEkrTriPegasusKnightOBJ(proc->anim, POS_R, proc->etype2, proc->ewtype2);
        PlaySFX(0x268, 0x100, proc->anim->xPosition, 0x1);
    }

    if (proc->timer == 0x33)
        NewEfxFlashBgWhite(anim1, 0x6);

    if (proc->timer == 0x39)
    {
        NewEkrTriPegasusKnightBG(anim1, POS_R, proc->etype2, proc->ewtype2);
        PlaySFX(0x268, 0x100, proc->anim->xPosition, 0x1);
    }

    if (proc->timer == 0x43)
    {
        gEkrTriangleInvalid = true;
        Proc_Break(proc);
    }
}

void NewEkrTriPegasusKnightBG(struct Anim * anim, u32 pos, u32 etype, u32 ewtype)
{
    u16 * pal;
    const u8 * img;
    struct ProcEkrTriPegasusKnightBG * proc;

    proc = Proc_Start(ProcScr_ekrTriPegasusKnightBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    if (pos == POS_L)
    {
        pal = gBanimTriAtkPalettes[POS_L];
        proc->frame_config = FrameLut_EkrTriPegagusBGLeft;
    }
    else
    {
        pal = gBanimTriAtkPalettes[POS_R];
        proc->frame_config = FrameLut_EkrTriPegagusBGRight;
    }

    proc->tsalut_left = TsaLut_EkrTriPegagusBG;
    proc->tsalut_right = TsaLut_EkrTriPegagusBG;

    LZ77UnCompWram(pal, gSpellAnimBgfx);
    SpellFx_RegisterBgPal((u16 *)gSpellAnimBgfx, 0x20);

    img = Img_TriPegasusKnightBG;
    if (etype != EKR_TRI_JTYPE_DEFAULT)
    {
        img = Img_TriFalconKnightSwordBG;
        if (ewtype == EKR_TRI_WTYPE_DEFAULT)
            img = Img_TriFalconKnightLanceBG;
    }

    SpellFx_RegisterBgGfx(img, 0x2000);
}

void EkrTriPegasusKnightBgMain(struct ProcEkrTriPegasusKnightBG * proc)
{
    int ret = EfxAdvanceFrameLut(&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        const u16 ** buf1 = proc->tsalut_left;
        const u16 ** buf2 = proc->tsalut_right;

        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        Proc_Break(proc);
    }
}

void NewEkrTriPegasusKnightOBJ(struct Anim * anim, u32 pos, u32 etype, u32 ewtype)
{
    struct ProcEfxOBJ * proc;
    u16 * pal;
    AnimScr * scr;
    const u8 * img;

    proc = Proc_Start(ProcScr_EkrTriPegasusKnightOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (pos == POS_L)
    {
        proc->terminator = 0x12;
        pal = gBanimTriAtkPalettes[POS_L];
        scr = AnimScr_TriAtkLeft;
    }
    else
    {
        proc->terminator = 0x11;
        pal = gBanimTriAtkPalettes[POS_R];
        scr = AnimScr_TriAtkRight;
    }

    proc->anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);

    LZ77UnCompWram(pal, gBuf_Banim);
    SpellFx_RegisterObjPal((u16 *)gBuf_Banim, 0x20);

    img = Img_TriPegasusKnightOBJ;
    if (etype != EKR_TRI_JTYPE_DEFAULT)
    {
        img = Img_TriFalconKnightSwordOBJ;
        if (ewtype == EKR_TRI_WTYPE_DEFAULT)
            img = Img_TriFalconKnightLanceOBJ;
    }

    SpellFx_RegisterObjGfx(img, 0x1000);
}

void EkrTriPegasusKnightObjMain(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

ProcPtr NewEkrTriArmorKnight(struct Anim * anim, u32 ekr1, u32 ekr2, u32 banim1, u32 ewtype2)
{
    struct ProcEkrTriClass * proc;

    proc = Proc_Start(ProcScr_EkrTriArmorKnight, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->etype1 = ekr1;
    proc->etype2 = ekr2;
    proc->ewtype1 = banim1;
    proc->ewtype2 = ewtype2;
    return proc;
}

void EkrTriArmorKnightMain(struct ProcEkrTriClass * proc)
{
    if (++proc->timer == 0x1)
    {
        NewEkrTriArmorKnightOBJ(proc->anim, proc->etype1, proc->etype2, proc->ewtype1, proc->ewtype2);
        PlaySFX(0x0E2, 0x100, proc->anim->xPosition, 0x1);
    }

    if (proc->timer == 0x30)
    {
        NewEkrTriArmorKnightOBJ2(proc->anim, 0, proc->etype1, proc->ewtype1);
        PlaySFX(0x0E2, 0x100, proc->anim->xPosition, 0x1);
    }

    if (proc->timer == 0x3C)
    {
        NewEfxFlashBgWhite(proc->anim, 0x4);
        NewEfxTriangleQUAKE(proc->anim, 0xA);
    }

    if (proc->timer == 0x4F)
    {
        NewEkrTriArmorKnightOBJ2(proc->anim, 1, proc->etype2, proc->ewtype2);
        PlaySFX(0x0E2, 0x100, proc->anim->xPosition, 0x1);
    }

    if (proc->timer == 0x5B)
        gEkrTriangleInvalid = true;

    if (proc->timer == 0x60)
    {
        NewEfxFlashBgWhite(proc->anim, 0x4);
        NewEfxTriangleQUAKE(proc->anim, 0xA);
    }

    if (proc->timer == 0x78)
        Proc_Break(proc);
}

void NewEkrTriArmorKnightOBJ(struct Anim * anim, u32 etype1, u32 etype2, u32 ewtype1, u32 ewtype2)
{
    struct ProcEfxOBJ * proc;
    struct Anim * anim2;
    u16 * pal;
    AnimScr * scr;
    const u8 * img;

    proc = Proc_Start(ProcScr_EkrTriArmorKnightOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x14;

    pal = gBanimTriAtkPalettes[0];

    if (etype1 == EKR_TRI_JTYPE_DEFAULT)
    {
        scr = AnimScr_TriKnightOBJ;
        img = Img_TriKnightOBJ;
    }
    else
    {
        switch (ewtype1) {
        case EKR_TRI_WTYPE_DEFAULT:
            scr = AnimScr_TriGenerialLanceOBJ;
            img = Img_TriGenerialLanceOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE:
            scr = AnimScr_TriGenerialAxeOBJ;
            img = Img_TriGenerialAxeOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE2:
        default:
            scr = AnimScr_TriGenerialHandAxeOBJ;
            img = Img_TriGenerialHandAxeOBJ;
            break;
        }
    }

    anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = anim2;
    anim2->oam2Base = OAM2_PAL(0x8) + OAM2_LAYER(0x2) + OAM2_CHR(0x0800 / 0x20);
    LZ77UnCompWram(pal, gBuf_Banim);
    CpuFastCopy(gBuf_Banim, PAL_OBJ(0x8), 0x20);
    LZ77UnCompWram(img, gBuf_Banim);

    pal = gBanimTriAtkPalettes[1];

    if (etype2 == EKR_TRI_JTYPE_DEFAULT)
    {
        scr = AnimScr_TriKnightOBJ;
        img = Img_TriKnightOBJ;
    }
    else
    {
        switch (ewtype2) {
        case EKR_TRI_WTYPE_DEFAULT:
            scr = AnimScr_TriGenerialLanceOBJ;
            img = Img_TriGenerialLanceOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE:
            scr = AnimScr_TriGenerialAxeOBJ;
            img = Img_TriGenerialAxeOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE2:
        default:
            scr = AnimScr_TriGenerialHandAxeOBJ;
            img = Img_TriGenerialHandAxeOBJ;
            break;
        }
    }

    anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim3 = anim2;
    anim2->oam2Base = OAM2_PAL(0xA) + OAM2_LAYER(0x2) + OAM2_CHR(0x1000 / 0x20);
    LZ77UnCompWram(pal, &gBuf_Banim[0x800]);
    CpuFastCopy(&gBuf_Banim[0x800], PAL_OBJ(0xA), 0x20);
    LZ77UnCompWram(img, &gBuf_Banim[0x800]);

    {
        u16 * dst = (void *)OBJ_VRAM0 + 0x800;
        RegisterDataMove(gBuf_Banim, dst, 0x1000);
    }

    EnablePalSync();

    proc->anim2->xPosition = proc->anim->xPosition + 0x20;
    proc->anim3->xPosition = proc->anim->xPosition - 0x20;
}

void EkrTriArmorKnightObjMain(struct ProcEfxOBJ * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x20, 0x0, proc->timer, proc->terminator);

    proc->anim2->xPosition = proc->anim->xPosition + ret;
    proc->anim3->xPosition = proc->anim->xPosition - ret;

    if (++proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        AnimDelete(proc->anim3);
        Proc_Break(proc);
    }
}

void NewEkrTriArmorKnightOBJ2(struct Anim * anim, u32 pos, u32 etype, u32 ewtype)
{
    struct ProcEkrTriArmorKnightOBJ2 * proc;
    struct Anim * anim2, * _anim;
    u16 * pal;
    AnimScr * scr;
    const u8 * buf;

    proc = Proc_Start(ProcScr_EkrTriArmorKnightOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x5;
    proc->unk29 = pos;
    proc->unk2A = etype;

    if (pos == 0)
        pal = gBanimTriAtkPalettes[POS_L];
    else
        pal = gBanimTriAtkPalettes[POS_R];

    if (etype == EKR_TRI_JTYPE_DEFAULT)
    {
        scr = AnimScr_TriKnightAtkOBJ;
        buf = Img_TriKnightAtkOBJ;
    }
    else
    {
        switch (ewtype) {
        case EKR_TRI_WTYPE_DEFAULT:
            scr = AnimScr_TriGenerialLanceAtkOBJ;
            buf = Img_TriGenerialLanceAtkOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE:
            scr = AnimScr_TriGenerialAxeAtkOBJ;
            buf = Img_TriGenerialAxeAtkOBJ;
            break;

        case EKR_TRI_WTYPE_ALTERNATIVE2:
        default:
            scr = AnimScr_TriGenerialHandAxeAtkOBJ;
            buf = Img_TriGenerialHandAxeAtkOBJ;
            break;
        }
    }

    anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = anim2;

    if (pos == 0)
    {
        anim2->yPosition += 0xA;
        proc->anim2->drawLayerPriority = 0x78;
        AnimSort();
        _anim = proc->anim;
        proc->unk32 = _anim->xPosition + 0x10;
        proc->unk34 = _anim->xPosition - 0x10;
        proc->anim2->xPosition = proc->unk32;
    }
    else
    {
        anim2->yPosition += 0x2;
        proc->anim2->drawLayerPriority = 0x14;
        AnimSort();
        _anim = proc->anim;
        proc->unk32 = _anim->xPosition - 0x0C;
        proc->unk34 = _anim->xPosition - 0x10;
        proc->anim2->xPosition = proc->unk32;
    }

    LZ77UnCompWram(pal, gBuf_Banim);
    SpellFx_RegisterObjPal((u16 *)gBuf_Banim, 0x20);
    SpellFx_RegisterObjGfx(buf, 0x1000);
}

void EkrTriArmorKnightObj2Main1(struct ProcEkrTriArmorKnightOBJ2 * proc)
{
    int ret = Interpolate(INTERPOLATE_SQUARE, proc->unk32, proc->unk34, proc->timer, proc->terminator);

    proc->anim2->xPosition = ret;

    if (++proc->timer > proc->terminator)
    {
        proc->timer = 0;
        proc->terminator = 0x14;
        Proc_Break(proc);
    }
}

void EkrTriArmorKnightObj2Main2(struct ProcEkrTriArmorKnightOBJ2 * proc)
{
    if (++proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

void NewEfxTriangleQUAKE(struct Anim * anim, int duration)
{
    struct ProcEfxTriagnleQUAKE * proc;

    gEfxBgSemaphore = gEfxBgSemaphore + 1;
    proc = Proc_Start(ProcScr_EfxTriangleQUAKE, PROC_TREE_3);
    proc->anim = anim;
    proc->qproc = NewEfxQuakePure(0, 0);
    proc->timer = 0;
    proc->terminator = duration;
}

void EfxTriangleQUAKEMain(struct ProcEfxTriagnleQUAKE * proc)
{
    s16 ix1, iy1;
    s16 ix2, iy2;

    SetBgOffset(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    SetBgOffset(BG_0,
        gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x,
        gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);
    EkrGauge_0804CC8C(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
    EkrDispUP_SetPositionSync(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));

    ix1 = (gEkrXPosReal[0] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
    iy1 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
    ix2 = (gEkrXPosReal[1] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
    iy2 = gEkrYPosReal[1] - gEkrBg2QuakeVec.y;

    SetEkrFrontAnimPostion(0, ix1, iy1);
    SetEkrFrontAnimPostion(1, ix2, iy2);

    if (++proc->timer > proc->terminator)
    {
        gEfxBgSemaphore = gEfxBgSemaphore - 1;

        SetBgOffset(BG_2, 0, 0);
        SetBgOffset(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
        EkrGauge_0804CC8C(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        EkrDispUP_SetPositionSync(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);

        ix1 = gEkrXPosReal[0] - gEkrBgPosition;
        iy1 = gEkrYPosReal[0];
        ix2 = gEkrXPosReal[1] - gEkrBgPosition;
        iy2 = gEkrYPosReal[1];

        SetEkrFrontAnimPostion(0, ix1, iy1);
        SetEkrFrontAnimPostion(1, ix2, iy2);

        Proc_End(proc->qproc);
        Proc_Break(proc);
    }
}
