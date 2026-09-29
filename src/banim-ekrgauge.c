#include "gbafe.h"

/**
 * Battle HP / hit / damage / crit gauge (fireemblem8u: banim-ekrgauge.c)
 */

struct ProcEkrGauge {
    PROC_HEADER;

    /* 29 */ u8 battle_init;
    /* 2A */ u8 valid;
    STRUCT_PAD(0x2B, 0x32);
    /* 32 */ s16 unk32;
    STRUCT_PAD(0x34, 0x3A);
    /* 3A */ s16 unk3A;
    STRUCT_PAD(0x3C, 0x44);
    /* 44 */ int unk44;
    /* 48 */ int unk48;
    /* 4C */ int unk4C;
    /* 50 */ int unk50;
};
PROC_SIZE_CHECK(struct ProcEkrGauge);

struct EkrGaugeStruct1 {
    STRUCT_PAD(0x00, 0x3C);
    /* 3C */ const void * unk3C;
};

extern struct ProcEkrGauge * gpProcEkrGauge;

extern s16 gEkrGaugeHp[2];
extern u16 gEkrGaugeHpBak[2];
extern s16 gEkrGaugeHit[2];
extern s16 gEkrGaugeDmg[2];
extern s16 gEkrGaugeCrt[2];
extern u16 gEkrGaugeDecoder[];
extern u16 gObjBuf_EkrSideHitDmgCrit[];

extern const u16 Pal_EkrGaugeNumbers[];
extern const u16 Img_EkrGaugeNumbers[];
extern const u16 Pal_EfxHpBarPurple[];
extern const u16 Pal_EfxHpBar[];
extern const u16 Pal_EfxSideHitDmgCrit[];
extern const u8 Img_EfxSideHitDmgCrit[];
extern const u8 Img_EfxWTAArrow[];

void EnableEkrGauge(void);
void DisableEkrGauge(void);
void ModDec(s16 val, u16 buf[]);
extern const u8 Tsa_EkrGaugeLeft[];
extern const u8 Tsa_EkrGaugeRight[];
extern s16 gBanimMaxHP[2];
extern s16 gBanimWtaBonus[2];
extern u8 gUnk_Banim_02016DC8[];
extern u16 gUnk_Banim_02016E48[];
extern u16 gUnk_Banim_02017048[];
extern u16 gUnk_Banim_02017248[];
extern u16 gUnk_Banim_02017448[];
s16 EkrEfxIsUnitHittedNow(int pos);
void sub_0804C118(void * _src, void * _dst);
void sub_0804C504(struct EkrGaugeStruct1 * buf, int a, int b);

void ekrGaugeMain(struct ProcEkrGauge * proc);

CONST_DATA struct ProcCmd ProcScr_ekrGauge[] = {
    PROC_19,
    PROC_REPEAT(ekrGaugeMain),
    PROC_END,
};

CONST_DATA const u8 AnimSprite_EkrGaugeHpBar[] = {
    0, 0x40, 0, 0x40, 0x80, 1, 0, 0,
    0, 0, 0, 0, 0, 0x40, 0, 0x40,
    0x84, 1, 0x20, 0, 0, 0, 0, 0,
    0, 0x40, 0, 0x40, 0x88, 1, 0x40, 0,
    0, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
};

CONST_DATA const u8 AnimSprite_EkrGaugeHpNum[] = {
    0, 0x40, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
};

CONST_DATA const u8 AnimSprite_EkrGaugeName[] = {
    0, 0x40, 0, 0x40, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0x40, 0, 0x40,
    4, 0, 0, 0, 8, 0, 0, 0,
    0, 0x40, 0, 0x40, 8, 0, 0, 0,
    0x10, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
};

CONST_DATA const u8 AnimSprite_EkrGaugeStatsL[] = {
    0, 0x40, 0, 0x80, 0, 0, 0x95, 0xFF,
    0xF8, 0xFF, 0, 0, 0, 0, 0, 0x40,
    8, 0, 0xB5, 0xFF, 0xF8, 0xFF, 0, 0,
    0, 0x40, 0, 0x40, 4, 0, 0x95, 0xFF,
    8, 0, 0, 0, 0, 0x40, 0, 0,
    8, 0, 0xB5, 0xFF, 8, 0, 0, 0,
    1, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0,
};

CONST_DATA const u8 AnimSprite_EkrGaugeStatsR[] = {
    0, 0x40, 0, 0x80, 0, 0, 0x3B, 0,
    0xF8, 0xFF, 0, 0, 0, 0, 0, 0x40,
    8, 0, 0x5B, 0, 0xF8, 0xFF, 0, 0,
    0, 0x40, 0, 0x40, 4, 0, 0x3B, 0,
    8, 0, 0, 0, 0, 0x40, 0, 0,
    8, 0, 0x5B, 0, 8, 0, 0, 0,
    1, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0,
};

CONST_DATA const u8 AnimSprite_EkrGaugeWeapon[] = {
    0, 0, 0, 0x40, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
};

CONST_DATA const u8 AnimSprite_EkrGaugeWtaUp0[] = {
    0, 0x80, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
};

CONST_DATA const u8 AnimSprite_EkrGaugeWtaUp1[] = {
    0, 0x80, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
};

CONST_DATA const u8 AnimSprite_EkrGaugeWtaUp2[] = {
    0, 0x80, 0, 0, 1, 0, 0, 0,
    0xFF, 0xFF, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
};

CONST_DATA const u8 AnimSprite_EkrGaugeWtaDown0[] = {
    0, 0x80, 0, 0, 2, 0, 0, 0,
    0, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
};

CONST_DATA const u8 AnimSprite_EkrGaugeWtaDown1[] = {
    0, 0x80, 0, 0, 3, 0, 0, 0,
    0, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
};

CONST_DATA const u8 AnimSprite_EkrGaugeWtaDown2[] = {
    0, 0x80, 0, 0, 3, 0, 0, 0,
    1, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
};

void sub_0804C118(void * _src, void * _dst)
{
    u16 * src = _src;
    u16 * dst = _dst;
    u32 i;

    for (i = 0; i < 11; i++) {
        u32 val = *src == 0xFF ? 0xF : *src;
        CpuFastCopy(&PAL_BUF_COLOR(Pal_EkrGaugeNumbers, val, 0), &PAL_BUF_COLOR(dst, i, 0), 0x10 * sizeof(u16));
        src++;
    }

    CpuFastFill(0, &PAL_BUF_COLOR(dst, 0xC, 0), 0x10 * sizeof(u16));
}

void ModDec(s16 val, u16 buf[])
{
    if (val == -1) {
        buf[0] = 11;
        buf[1] = 10;
        buf[2] = 10;
        return;
    }

    buf[0] = Div(val, 100);

    val = val - 100 * buf[0];
    buf[1] = Div(val, 10);

    val -= buf[1] * 10;
    buf[2] = val;

    if (buf[0] + buf[1] == 0)
        buf[1] = 11;

    if (buf[0] == 0)
        buf[0] = 11;
}

void NewEkrGauge(void)
{
    u32 i, j;

    gpProcEkrGauge = Proc_Start(ProcScr_ekrGauge, PROC_TREE_1);

    EkrGauge_0804CC68(0);
    EkrGauge_Clr4C50();
    DisableEkrGauge();
    EkrGauge_ClrInitFlag();
    EkrGauge_Clr323A(gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);

    if (gEkrGaugeHp[0] > 0x50)
        CpuCopy16(Pal_EfxHpBarPurple, PAL_OBJ(0xB), 0x10 * sizeof(u16));
    else
        CpuCopy16(Pal_EfxHpBar + gBanimFactionPal[POS_L] * 0x10, PAL_OBJ(0xB), 0x10 * sizeof(u16));

    if (gEkrGaugeHp[1] > 0x50)
        CpuCopy16(Pal_EfxHpBarPurple, PAL_OBJ(0xC), 0x10 * sizeof(u16));
    else
        CpuCopy16(Pal_EfxHpBar + gBanimFactionPal[POS_R] * 0x10, PAL_OBJ(0xC), 0x10 * sizeof(u16));

    gEkrGaugeHpBak[0] |= 0xFFFF;
    gEkrGaugeHpBak[1] |= 0xFFFF;

    LZ77UnCompVram(Img_EfxSideHitDmgCrit, (void *)(VRAM + 0x13800));
    LZ77UnCompVram(Img_EfxWTAArrow, (void *)(VRAM + 0x13C00));

    CpuFastCopy(Pal_EfxSideHitDmgCrit + gBanimFactionPal[POS_L] * 0x10, PAL_OBJ(0x5), 0x10 * sizeof(u16));
    CpuFastCopy(Pal_EfxSideHitDmgCrit + gBanimFactionPal[POS_R] * 0x10, PAL_OBJ(0x6), 0x10 * sizeof(u16));

    EnablePalSync();

    ModDec(gEkrGaugeHit[0], &gEkrGaugeDecoder[0x0]);
    ModDec(gEkrGaugeDmg[0], &gEkrGaugeDecoder[0x3]);
    ModDec(gEkrGaugeCrt[0], &gEkrGaugeDecoder[0x6]);

    ModDec(gEkrGaugeHit[1], &gEkrGaugeDecoder[0x9]);
    ModDec(gEkrGaugeDmg[1], &gEkrGaugeDecoder[0xC]);
    ModDec(gEkrGaugeCrt[1], &gEkrGaugeDecoder[0xF]);

    CpuFastFill(0, gObjBuf_EkrSideHitDmgCrit, 0x400);

    for (i = 0; i < 6; i++) {
        for (j = 0; j < 3; j++) {
            int r4 = i * 0x40 + j * 0x10;

            CpuCopy16(
                Img_EkrGaugeNumbers + gEkrGaugeDecoder[i * 3 + j] * 0x10,
                gObjBuf_EkrSideHitDmgCrit + r4,
                0x10 * sizeof(u16));
        }
    }

    RegisterDataMove(gObjBuf_EkrSideHitDmgCrit, (void *)(VRAM + 0x13A00), 0xC0 * sizeof(u16));
    RegisterDataMove(gObjBuf_EkrSideHitDmgCrit + 0xC0, (void *)(VRAM + 0x13E00), 0xC0 * sizeof(u16));

    InitIcons();
    ApplyIconPalette(0, 0x1D);
    ApplyIconPalette(0, 0x1E);
    PutIconObjImg(GetItemIconId(gpEkrBattleUnitLeft->weaponBefore), 0x1DC);
    PutIconObjImg(GetItemIconId(gpEkrBattleUnitRight->weaponBefore), 0x1DE);
    ApplyPalette(Pal_MiscUiGraphics, 0x10);
}

void EndEkrGauge(void)
{
    Proc_End(gpProcEkrGauge);
}

void EkrGauge_Clr4C50(void)
{
    gpProcEkrGauge->unk4C = 0;
    gpProcEkrGauge->unk50 = 0;
}

void EkrGauge_Set4C50(void)
{
    gpProcEkrGauge->unk4C = 1;
    gpProcEkrGauge->unk50 = 1;
}

void EkrGauge_Set4C(void)
{
    gpProcEkrGauge->unk4C = 1;
}

void EkrGauge_Set50(void)
{
    gpProcEkrGauge->unk50 = 1;
}

void EkrGauge_0804CC68(u16 val)
{
    gpProcEkrGauge->unk44 = val * 0x400;
}

void EkrGauge_Clr323A(s16 x, s16 y)
{
    gpProcEkrGauge->unk32 = x;
    gpProcEkrGauge->unk3A = y;
    gpProcEkrGauge->battle_init = false;
}

void EkrGauge_Setxy323A(s16 x, s16 y)
{
    gpProcEkrGauge->unk32 = x;
    gpProcEkrGauge->unk3A = y;
    gpProcEkrGauge->battle_init = true;
}

void EkrGauge_SetInitFlag(void)
{
    gpProcEkrGauge->battle_init = true;
}

void EkrGauge_ClrInitFlag(void)
{
    gpProcEkrGauge->battle_init = false;
}

void EnableEkrGauge(void)
{
    gpProcEkrGauge->valid = true;
}

void DisableEkrGauge(void)
{
    gpProcEkrGauge->valid = false;
}

void sub_0804C504(struct EkrGaugeStruct1 * buf, int a, int b)
{
    if (a > 0) {
        if (b != 1) {
            unsigned int temp = 1;
            if (b < temp) {
                buf->unk3C = AnimSprite_EkrGaugeWtaUp0;
                return;
            }
        } else {
            buf->unk3C = AnimSprite_EkrGaugeWtaUp1;
            return;
        }

        buf->unk3C = AnimSprite_EkrGaugeWtaUp2;
    } else {
        if (b != 1) {
            unsigned int temp = 1;
            if (b < temp) {
                buf->unk3C = AnimSprite_EkrGaugeWtaDown0;
                return;
            }
        } else {
            buf->unk3C = AnimSprite_EkrGaugeWtaDown1;
            return;
        }

        buf->unk3C = AnimSprite_EkrGaugeWtaDown2;
    }
}

// FAKEMATCH (found by an Opus 5.5 agent): spill slots are assigned by pseudo
// number; the unused locals shift x and r7_ to the numbers the original had.
void ekrGaugeMain(struct ProcEkrGauge * proc)
{
    struct Anim AStack_130;
    u16 auStack_e8[12];
    u16 local_d0[4];
    struct AnimSpriteData auStack_c8[8];
    s16 r4;
    s32 r6;
    s32 r7;
    s32 r8;
    s32 r9;
    s32 i;
    s32 j;
    s16 r7_;
    s16 r6_;
    s16 r8_;
    s16 sp_d4;
    s32 hp_changed;
    s32 spDC;
#if !NONMATCHING
    s32 unused_pad0, unused_pad1, unused_pad2, unused_pad3, unused_pad4, unused_pad5, unused_pad6;
    s32 unused_pad7, unused_pad8, unused_pad9, unused_pad10, unused_pad11, unused_pad12;
#endif
    s32 x;
    s32 y;
    s32 clk;
    s16 uVar8;
    s16 sVar16;
    s16 sVar5;
    s16 uVar15;

    hp_changed = 0;
    clk = DivRem(GetGameTime() / 8, 3);

    if (proc->valid == 1)
        return;

    if (proc->battle_init == 0) {

        r4 = proc->unk3A >> 3;
        r7 = (r4 << 5) + 0x1A0;

        if (r7 < 0)
            r7 = 0;

        r6 = r4 + 7;
        if (r6 > 7)
            r6 = 7;

        r8 = (7 - r6) * 30;

        switch (gEkrDistanceType) {
            case 0:
            case 1:
            case 2:
                r9 = 0;
                spDC = 15;
                break;

            case 3:
            case 4:
            default:
                spDC = 8;
                r9 = 8;
                break;
        }

        FillBGRect(gBg0Tm + 0x1A0, 30, 8, 0, 0x9F);

        if (0 == proc->unk4C) {
            EfxTmCpyBG(Tsa_EkrGaugeLeft + r8, gBg0Tm + r7 + r9, 15, r6, -1, -1);
            sub_0806693C(gBg0Tm + r7 + r9, 15, r6, 2, 0x80);
        }

        if (0 == proc->unk50) {
            EfxTmCpyBG(Tsa_EkrGaugeRight + r8, gBg0Tm + r7 + spDC, 16, r6, -1, -1);
            sub_0806693C(gBg0Tm + r7 + spDC, 16, r6, 3, 0x80);
        }

        EnableBgSync(BG0_SYNC_BIT);
    }

    if ((s16)gEkrGaugeHpBak[0] != gEkrGaugeHp[0])
        hp_changed = 1;

    if ((s16)gEkrGaugeHpBak[1] != gEkrGaugeHp[1])
        hp_changed = 1;

    gEkrGaugeHpBak[0] = gEkrGaugeHp[0];
    gEkrGaugeHpBak[1] = gEkrGaugeHp[1];

    r7_ = gEkrGaugeHp[0];
    r6_ = gBanimMaxHP[0];
    r8_ = gEkrGaugeHp[1];
    sp_d4 = gBanimMaxHP[1];

    switch (gEkrDistanceType) {
        case 3:
            if (gBanimValid[EKR_POS_L] == 1) {
                x = proc->unk32 + 0x38;
            } else {
                x = proc->unk32 - 0x38;
            }
            break;

        case 0:
        case 1:
        case 2:
            x = proc->unk32;
            break;

        case 4:
        default:
            x = proc->unk32 - 0x38;
            break;
    }

    if (proc->battle_init == 0) {
        y = proc->unk3A & 0xFFF8;
    } else {
        y = proc->unk3A;
    }

    local_d0[0] = Div(gEkrGaugeHp[0], 10);
    local_d0[1] = gEkrGaugeHp[0] - local_d0[0] * 10;

    if (local_d0[0] == 0) {
        local_d0[0] = 0xb;
    }

    local_d0[2] = Div(gEkrGaugeHp[1], 10);
    local_d0[3] = gEkrGaugeHp[1] - local_d0[2] * 10;

    if (local_d0[2] == 0) {
        local_d0[2] = 0xb;
    }

    if (gEkrGaugeHp[0] > 0x50) {
        local_d0[0] = 0xc;
        local_d0[1] = 0xc;
    }

    if (gEkrGaugeHp[1] > 0x50) {
        local_d0[2] = 0xc;
        local_d0[3] = 0xc;
    }

    if (hp_changed == 1) {
        CpuFastFill(0, gUnk_Banim_02016DC8, 0x80);

        for (i = 0; i < 2; i++) {
            for (j = 0; j < 2; j++) {
                CpuCopy16(
                    Img_EkrGaugeNumbers + local_d0[i * 2 + j] * 0x10,
                    (u16 *)gUnk_Banim_02016DC8 + ((i * 0x20) + (j * 0x10)),
                    0x20
                );
            }
        }

        RegisterDataMove(gUnk_Banim_02016DC8 + 0x00, (void *)(VRAM + 0x139C0), 0x40);
        RegisterDataMove((u16 *)gUnk_Banim_02016DC8 + 0x20, (void *)(VRAM + 0x13DC0), 0x40);
    }

    AStack_130.oam2Base = 0x51CE;
    AStack_130.oam2Base |= proc->unk44;

    AStack_130.xPosition = x + 9;
    AStack_130.yPosition = y + 0x91;
    AStack_130.state2 = 0;

    if (EkrEfxIsUnitHittedNow(EKR_POS_L) != 1) {
        AStack_130.pSpriteData = AnimSprite_EkrGaugeHpNum;
        AStack_130.oamBase = 0;
    } else {
        AStack_130.pSpriteData = auStack_c8;
        AStack_130.oamBase = 0x200;
        AStack_130.xPosition = AStack_130.xPosition - 8;
        AStack_130.yPosition = AStack_130.yPosition - 8;
        BanimUpdateSpriteRotScale((void *)AnimSprite_EkrGaugeHpNum, auStack_c8, 0x100, 0x80, 1);
    }

    if (proc->unk4C == 0) {
        AnimDisplay(&AStack_130);
    }

    AStack_130.oamBase = 0;

    AStack_130.oam2Base = 0x61EE;
    AStack_130.oam2Base |= proc->unk44;

    AStack_130.xPosition = x + 0x81;
    AStack_130.yPosition = y + 0x91;
    AStack_130.state2 = 0;

    if (EkrEfxIsUnitHittedNow(EKR_POS_R) != 1) {
        AStack_130.pSpriteData = AnimSprite_EkrGaugeHpNum;
        AStack_130.oamBase = 0;
    } else {
        AStack_130.pSpriteData = auStack_c8;
        AStack_130.oamBase = 0x200;
        AStack_130.xPosition = AStack_130.xPosition - 8;
        AStack_130.yPosition = AStack_130.yPosition - 8;
        BanimUpdateSpriteRotScale((void *)AnimSprite_EkrGaugeHpNum, auStack_c8, 0x100, 0x80, 1);
    }

    if (proc->unk50 == 0) {
        AnimDisplay(&AStack_130);
    }

    uVar15 = (r7_ - 0x28);
    uVar8 = (r6_ - 0x28);
    sVar16 = (r7_);
    sVar5 = (r6_);

    if (uVar15 > 0x28)
        uVar15 = 0x28;

    if (uVar8 > 0x28)
        uVar8 = 0x28;

    if (uVar15 < 0)
        uVar15 = 0;

    if (uVar8 < 0)
        uVar8 = 0;

    if (sVar16 > 0x28)
        sVar16 = 0x28;

    if (sVar5 > 0x28)
        sVar5 = 0x28;

    AStack_130.oam2Base = 0xb000;
    AStack_130.oam2Base |= proc->unk44;

    AStack_130.oamBase = 0;
    AStack_130.xPosition = x + 0x1d;
    AStack_130.pSpriteData = AnimSprite_EkrGaugeHpBar;

    if (proc->unk4C == 0) {
        if (uVar8 != 0) {
            sub_08066CA0(auStack_e8, uVar15, uVar8);
            if (hp_changed == 1) {
                sub_0804C118(auStack_e8, gUnk_Banim_02016E48);
            }

            AStack_130.yPosition = y + 0x8e;
            AStack_130.oam2Base &= 0xfc00;
            AStack_130.oam2Base |= 0;
            AStack_130.state2 = 0;

            AnimDisplay(&AStack_130);
        }

        sub_08066CA0(auStack_e8, sVar16, sVar5);

        if (hp_changed == 1) {
            sub_0804C118(auStack_e8, gUnk_Banim_02017248);
        }

        if (uVar8 != 0) {
            AStack_130.yPosition = y + 0x95;
        } else {
            AStack_130.yPosition = y + 0x91;
        }

        AStack_130.oam2Base &= 0xfc00;
        AStack_130.oam2Base |= 0x20;
        AStack_130.state2 = 0;

        AnimDisplay(&AStack_130);
    }

    uVar15 = (r8_ - 0x28);
    uVar8 = (sp_d4 - 0x28);
    sVar16 = (r8_);
    sVar5 = (sp_d4);

    if (uVar15 > 0x28)
        uVar15 = 0x28;

    if (uVar8 > 0x28)
        uVar8 = 0x28;

    if (uVar15 < 0)
        uVar15 = 0;

    if (uVar8 < 0)
        uVar8 = 0;

    if (sVar16 > 0x28)
        sVar16 = 0x28;

    if (sVar5 > 0x28)
        sVar5 = 0x28;

    AStack_130.oam2Base = 0xc000;
    AStack_130.oam2Base |= proc->unk44;

    AStack_130.oamBase = 0;
    AStack_130.xPosition = x + 0x95;
    AStack_130.pSpriteData = AnimSprite_EkrGaugeHpBar;

    if (proc->unk50 == 0) {
        if (uVar8 != 0) {
            sub_08066CA0(auStack_e8, uVar15, uVar8);
            if (hp_changed == 1) {
                sub_0804C118(auStack_e8, gUnk_Banim_02017048);
            }

            AStack_130.yPosition = y + 0x8e;
            AStack_130.oam2Base &= 0xfc00;
            AStack_130.oam2Base |= 0x10;
            AStack_130.state2 = 0;

            AnimDisplay(&AStack_130);
        }

        sub_08066CA0(auStack_e8, sVar16, sVar5);

        if (hp_changed == 1) {
            sub_0804C118(auStack_e8, gUnk_Banim_02017448);
        }

        if (uVar8 != 0) {
            AStack_130.yPosition = y + 0x95;
        } else {
            AStack_130.yPosition = y + 0x91;
        }

        AStack_130.oam2Base &= 0xfc00;
        AStack_130.oam2Base |= 0x30;
        AStack_130.state2 = 0;

        AnimDisplay(&AStack_130);
    }

    if (hp_changed == 1) {
        RegisterDataMove((void *)gUnk_Banim_02016E48, (void *)(VRAM + 0x13000), 0x800);
    }

    if (proc->unk4C == 0) {
        AStack_130.oamBase = 0;
        AStack_130.pSpriteData = AnimSprite_EkrGaugeName;
        AStack_130.oam2Base = 0x51D0;
        AStack_130.oam2Base |= proc->unk44;

        AStack_130.xPosition = x + 0xf;
        AStack_130.yPosition = y + 0x70;
        AStack_130.state2 = 0;
        AnimDisplay(&AStack_130);
        AStack_130.oamBase = 0;

        AStack_130.pSpriteData = AnimSprite_EkrGaugeStatsL;
        AStack_130.oam2Base = 0x51C0;
        AStack_130.oam2Base |= proc->unk44;

        AStack_130.xPosition = x + 0x65;
        AStack_130.yPosition = y + 0x78;
        AStack_130.state2 = 0;
        AnimDisplay(&AStack_130);
    }

    if (proc->unk50 == 0) {
        AStack_130.oamBase = 0;
        AStack_130.pSpriteData = AnimSprite_EkrGaugeName;
        AStack_130.oam2Base = 0x61F0;
        AStack_130.oam2Base |= proc->unk44;

        AStack_130.xPosition = x + 0xd7;
        AStack_130.yPosition = y + 0x70;
        AStack_130.state2 = 0;
        AnimDisplay(&AStack_130);

        AStack_130.oamBase = 0;
        AStack_130.pSpriteData = AnimSprite_EkrGaugeStatsR;
        AStack_130.oam2Base = 0x61C0;
        AStack_130.oam2Base |= proc->unk44;

        AStack_130.xPosition = x + 0x87;
        AStack_130.yPosition = y + 0x78;
        AStack_130.state2 = 0;
        AnimDisplay(&AStack_130);
    }

    if (proc->unk4C == 0) {
        AStack_130.oamBase = 0;
        if (gBanimWtaBonus[0] != 0) {
            sub_0804C504((void *)&AStack_130, gBanimWtaBonus[0], clk);
            AStack_130.oam2Base = 0x1ca;
            AStack_130.oam2Base |= proc->unk44;

            AStack_130.xPosition = x + 0x35;
            AStack_130.yPosition = y + 0x7a;
            AStack_130.state2 = 0;
            AnimDisplay(&AStack_130);
        }

        AStack_130.pSpriteData = AnimSprite_EkrGaugeWeapon;
        AStack_130.oam2Base = 0xD1DC;
        AStack_130.oam2Base |= proc->unk44;

        AStack_130.xPosition = x + 0x2b;
        AStack_130.yPosition = y + 0x7a;
        AStack_130.state2 = 0;
        AnimDisplay(&AStack_130);
    }

    if (proc->unk50 == 0) {
        AStack_130.oamBase = 0;
        if (gBanimWtaBonus[1] != 0) {
            sub_0804C504((void *)&AStack_130, gBanimWtaBonus[1], clk);
            AStack_130.oam2Base = 0x1ca;
            AStack_130.oam2Base |= proc->unk44;

            AStack_130.xPosition = x + 0x84;
            AStack_130.yPosition = y + 0x7a;
            AStack_130.state2 = 0;
            AnimDisplay(&AStack_130);
        }

        AStack_130.pSpriteData = AnimSprite_EkrGaugeWeapon;
        AStack_130.oam2Base = 0xE1DE;
        AStack_130.oam2Base |= proc->unk44;

        AStack_130.xPosition = x + 0x7a;
        AStack_130.yPosition = y + 0x7a;
        AStack_130.state2 = 0;
        AnimDisplay(&AStack_130);
    }
}
