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

struct EkrGaugeStruct1 {
    STRUCT_PAD(0x00, 0x3C);
    /* 3C */ const void * unk3C;
};

extern struct ProcEkrGauge * gpProcEkrGauge;
extern struct ProcCmd ProcScr_ekrGauge[];

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

extern const u8 AnimSprite_EkrGaugeWtaUp0[];
extern const u8 AnimSprite_EkrGaugeWtaUp1[];
extern const u8 AnimSprite_EkrGaugeWtaUp2[];
extern const u8 AnimSprite_EkrGaugeWtaDown0[];
extern const u8 AnimSprite_EkrGaugeWtaDown1[];
extern const u8 AnimSprite_EkrGaugeWtaDown2[];

void EnableEkrGauge(void);
void DisableEkrGauge(void);
void ModDec(s16 val, u16 buf[]);

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
    EkrGauge_0804CC28();
    DisableEkrGauge();
    EkrGauge_ClrInitFlag();
    EkrGauge_0804CC78(gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);

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

    LZ77UnCompVram(Img_EfxSideHitDmgCrit, (void *)0x6013800);
    LZ77UnCompVram(Img_EfxWTAArrow, (void *)0x6013C00);

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

    RegisterDataMove(gObjBuf_EkrSideHitDmgCrit, (void *)0x6013A00, 0xC0 * sizeof(u16));
    RegisterDataMove(gObjBuf_EkrSideHitDmgCrit + 0xC0, (void *)0x6013E00, 0xC0 * sizeof(u16));

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

void EkrGauge_0804CC28(void)
{
    gpProcEkrGauge->unk4C = 0;
    gpProcEkrGauge->unk50 = 0;
}

void EkrGauge_0804CC38(void)
{
    gpProcEkrGauge->unk4C = 1;
    gpProcEkrGauge->unk50 = 1;
}

void EkrGauge_0804CC48(void)
{
    gpProcEkrGauge->unk4C = 1;
}

void EkrGauge_0804CC58(void)
{
    gpProcEkrGauge->unk50 = 1;
}

void EkrGauge_0804CC68(u16 val)
{
    gpProcEkrGauge->unk44 = val * 0x400;
}

void EkrGauge_0804CC78(s16 x, s16 y)
{
    gpProcEkrGauge->unk32 = x;
    gpProcEkrGauge->unk3A = y;
    gpProcEkrGauge->battle_init = false;
}

void EkrGauge_0804CC8C(s16 x, s16 y)
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

ASM_FUNC("asm/nonmatching/code_0804C550.s");
