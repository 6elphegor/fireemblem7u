#include "gbafe.h"

void StartSpellAnimSpell11(struct Anim *anim);
void StartSpellAnimSpell21(struct Anim * anim);
void StartSpellAnimThorsIre(struct Anim * anim);
void StartSpellAnimThunder(struct Anim *anim);
void sub_08056938(struct Anim * anim);
void sub_08056994(struct Anim * anim);
void sub_080569F0(struct Anim * anim);
void sub_08056A4C(struct Anim * anim);
void sub_08056AA8(struct Anim * anim);
void sub_08056B04(struct Anim * anim);
void sub_08056B60(struct Anim * anim);
void sub_08056BBC(struct Anim * anim);
void sub_08056C18(struct Anim * anim);
void sub_08056C74(struct Anim * anim);
void sub_08056CD0(struct Anim * anim);
void sub_08059408(struct Anim * anim);
void sub_0805BBEC(struct Anim * anim);

typedef void (*SpellAnimFunc)(struct Anim * anim);

/* auto-decls */
extern const SpellAnimFunc gEkrSpellAnimLut[];
extern int gEfxBgSemaphore;
extern const struct ProcCmd ProcScr_EfxRestWINH[];
extern const struct ProcCmd ProcScr_efxCircleWIN[];
extern const struct ProcCmd ProcScr_efxMagicQUAKE[];

struct ProcEfxMagicQuake
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2c);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ STRUCT_PAD(0x30, 0x5c);
    /* 5C */ struct Anim * anim;
    /* 60 */ ProcPtr pQuakePureProc;
};
PROC_SIZE_CHECK(struct ProcEfxMagicQuake);

struct ProcEfxCircleWIN
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2c);
    /* 2C */ s16 timer;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ STRUCT_PAD(0x34, 0x3a);
    /* 3A */ u16 unk_3a;
    /* 3C */ STRUCT_PAD(0x3c, 0x44);
    /* 44 */ int unk_44;
    /* 48 */ STRUCT_PAD(0x48, 0x54);
    /* 54 */ u16 * unk_54;
    /* 58 */ int unk_58;
    /* 5C */ struct Anim * anim;
};
PROC_SIZE_CHECK(struct ProcEfxCircleWIN);

ProcPtr NewefxRestRST(struct Anim *anim, int unk44, int unk48, int frame, int speed);
void efxRestRSTMain(struct ProcEfx *proc);
void NewEfxTwobaiRST(struct Anim *anim, int unk44);
void EfxTwobaiRSTMain(struct ProcEfx *proc);
void NewDummvRST(struct Anim *anim, int unk44);
void DummvRSTMain(struct ProcEfx *proc);
void NewEfxRestWIN(struct Anim *anim, int unk44, void *unk54, void *unk58);
void EfxRestWINMain(struct ProcEfx *proc);
void EfxMagicHBlank_08055BE0(void);
void EfxMagicHBlank_08055C08(void);
void EfxMagicHBlank_08055C30(void);
void EfxMagicHBlank_08055C6C(void);
void EfxMagicHBlank_08055CA8(void);
void NewEfxRestWINH(struct Anim *anim, int a, s16 b, u32 c);
void EfxRestWINH_Loop_B(struct ProcEfx *proc);
void EfxALPHAMain(struct ProcEfxALPHA * proc);
void StartSubSpell_efxCircleWIN(struct Anim * anim, int terminator, u16 * c, u16 d, u16 e);
void EfxCircleWINMain(struct ProcEfxCircleWIN * proc);
void Loop6C_efxMagicQUAKE(struct ProcEfxMagicQuake * proc);



// 0.87 efxmagic:StartSpellAnimation
void StartSpellAnimation(struct Anim *anim)
{
    s16 index = gEkrSpellAnimIndex[GetAnimPosition(anim)];

#if BUGFIX
    if (gEkrSpellAnimLut[index](anim) == NULL)
        return;
#endif

    gEkrSpellAnimLut[index](anim);
}

void sub_080558B8(void)
{
}

// 0.94 efxmagic:NewefxRestRST
ProcPtr NewefxRestRST(struct Anim *anim, int unk44, int unk48, int frame, int speed)
{
    struct ProcEfx *proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxRestRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0,
    proc->step = 0;
    proc->unk44 = unk44;
    proc->unk48 = unk48;
    proc->frame = frame;
    proc->speed = speed;

    return proc;
}

void efxRestRST_OnEnd(void)
{
    gEfxBgSemaphore--;
}

// 0.93 efxmagic:efxRestRSTMain
void efxRestRSTMain(struct ProcEfx *proc)
{
    u8 val1;
    int val2;
    u32 i;
    u16 *buf;

    if (gEkrBg1ScrollFlip == 0)
        buf = gpBg1ScrollOffsetList1;
    else
        buf = gpBg1ScrollOffsetList2;

    val1 = proc->step;
    proc->step += proc->speed;

    for (i = 0; i < 0x78; buf++, i++) {
        val1 += proc->unk48;
        *buf = (((EkrBg3HfScrollingConf[val1] * proc->frame) << 8) >> 0x10) + gDispIo.bg_off[1].x;
    }

    if (++proc->timer == proc->unk44)
        Proc_End(proc);
}

// 0.94 efxmagic:NewEfxTwobaiRST
void NewEfxTwobaiRST(struct Anim *anim, int unk44)
{
    u32 i, j;
    u16 *buf;
    struct ProcEfx *proc;
    proc = Proc_Start(ProcScr_efxTwobaiRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = unk44;

    for (i = 0; i < 0x78; i++)
        gpBg1ScrollOffsetList2[i] = -(i / 2);

    buf = gpBg1ScrollOffsetList1;
    for (j = 0; j < 0x78; buf++, j++)
        *buf = -(j / 2);
}

// 1.00 efxmagic:EfxTwobaiRSTMain
void EfxTwobaiRSTMain(struct ProcEfx *proc)
{
    if (++proc->timer == proc->unk44)
        Proc_Break(proc);
}

// 0.88 efxmagic:NewDummvRST
void NewDummvRST(struct Anim *anim, int unk44)
{
    struct ProcEfx *proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_DummvRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = unk44;
}

void DummvRST_OnEnd(void)
{
    gEfxBgSemaphore--;
}

// 0.92 efxmagic:DummvRSTMain
void DummvRSTMain(struct ProcEfx *proc)
{
    u32 i;
    u16 *buf;

    if (gEkrBg1ScrollFlip == 0)
        buf = gpBg1ScrollOffsetList1;
    else
        buf = gpBg1ScrollOffsetList2;

    for (i = 0; i < 0x78; i++)
        buf[i] = gDispIo.bg_off[1].x;

    if (++proc->timer == proc->unk44)
        Proc_End(proc);
}

// 0.92 efxmagic:NewEfxRestWIN
void NewEfxRestWIN(struct Anim *anim, int unk44, void *unk54, void *unk58)
{
    struct ProcEfx *proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_EfxRestWIN, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = unk44;
    proc->unk54 = unk54;
    proc->unk58 = unk58;

    if (GetAnimPosition(GetAnimAnotherSide(anim)) == EKR_POS_L)
        proc->unk32 = 0xFFB8;
    else
        proc->unk32 = 0xFFF8;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(anim) == EKR_POS_L)
            proc->unk32 += 0x18;
        else
            proc->unk32 -= 0x18;
    }
}

// 0.93 efxmagic:EfxRestWINMain
void EfxRestWINMain(struct ProcEfx *proc)
{
    u32 i;
    u16 val2;
    u16 *buf;
    s16 *buf2, *base;

    if (gEkrBg2ScrollFlip == 0)
        buf = gpBg2ScrollOffsetTable1;
    else
        buf = gpBg2ScrollOffsetTable2;

    base = proc->unk54;
    val2 = base[proc->step];
    buf2 = proc->unk58[val2];

    if (val2 != 0xFFFF) {
        proc->step++;
        for (i = 0; i < 0x78; buf2 = buf2 + 2, buf++, i++) {
            if (buf2[0] == 0x7FFF)
                buf[0] = 0;
            else {
                s16 tmp3 = buf2[0] + proc->unk32;
                s16 tmp4 = buf2[1] + proc->unk32;
                buf[0] = (tmp3 * 0x100) | tmp4;
            }
        }
    } else {
        for (i = 0; i < 0x78; i++)
            *buf++ = 0;
    }

    proc->timer++;
    if (proc->timer == proc->unk44) {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

// 9.99 efxmagic:EfxMagicHBlank_805B724
void EfxMagicHBlank_08055BE0(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK))
        REG_BG1HOFS = *gpBg1ScrollOffset++;
}

// 9.99 efxmagic:EfxMagicHBlank_805B750
void EfxMagicHBlank_08055C08(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK))
        REG_BG1VOFS = *gpBg1ScrollOffset++;
}

// 9.99 efxmagic:EfxMagicHBlank_805B77C
void EfxMagicHBlank_08055C30(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
        REG_BG2VOFS = *gpBg2ScrollOffset++;
        REG_BG1HOFS = *gpBg1ScrollOffset++;
    }
}

// 9.99 efxmagic:EfxMagicHBlank_805B7BC
void EfxMagicHBlank_08055C6C(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
        REG_BG2VOFS = *gpBg2ScrollOffset++;
        REG_BG1VOFS = *gpBg1ScrollOffset++;
    }
}

// 9.99 efxmagic:EfxMagicHBlank_805B7FC
void EfxMagicHBlank_08055CA8(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
        REG_BG2VOFS = *gpBg2ScrollOffset++;
    }
}

// 0.82 efxmagic:NewEfxRestWINH
void NewEfxRestWINH(struct Anim *anim, int a, s16 b, u32 c)
{
    u32 i;
    u16 *buf;
    struct ProcEfx *proc;

    gEfxBgSemaphore++;

    if (c == 2) {
        buf = gpBg2ScrollOffsetTable2;
        for (i = 0; i < 0xA0; buf++, i++)
            *buf = b;

        buf = gpBg2ScrollOffsetTable1;
        for (i = 0; i < 0xA0; buf++, i++)
            *buf = b;

        gEkrBg2ScrollFlip = 0;
        gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable2;
        gpBg2ScrollOffset = gpBg2ScrollOffsetTable2;
    }

    buf = gpBg1ScrollOffsetList2;
    for (i = 0; i < 0xA0; buf++, i++)
        *buf = b;

    buf = gpBg1ScrollOffsetList1;
    for (i = 0; i < 0xA0; buf++, i++)
        *buf = b;

    gEkrBg1ScrollFlip = 0;
    gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList2;
    gpBg1ScrollOffset = gpBg1ScrollOffsetList2;

    switch (c) {
    case 0:
        if (CheckInEkrDragon() == 0)
            SetOnHBlankA(EfxMagicHBlank_08055BE0);
        else
            SetOnHBlankA(EfxMagicHBlank_08055C30);
        break;

    case 1:
        if (CheckInEkrDragon() == 0)
            SetOnHBlankA(EfxMagicHBlank_08055C08);
        else
            SetOnHBlankA(EfxMagicHBlank_08055C6C);
        break;

    case 2:
        if (CheckInEkrDragon() == 0)
            SetOnHBlankA(EfxMagicHBlank_08055C08);
        break;
    }

    proc = Proc_Start(ProcScr_EfxRestWINH, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = a;
    proc->unk48 = c;
}

// 1.00 efxmagic:NewEfxRestWINH_
void NewEfxRestWINH_(struct Anim *anim, int a, int b)
{
    NewEfxRestWINH(anim, a, 0, b);
}

void EfxRestWINH_Loop_A(ProcPtr proc)
{
    Proc_Break(proc);
}

// 0.77 efxmagic:sub_805B958
void EfxRestWINH_Loop_B(struct ProcEfx *proc)
{
    if (gBmSt.main_loop_ended != false) {
        if (proc->unk48 == 0x2) {
            if (gEkrBg2ScrollFlip == 1) {
                gEkrBg2ScrollFlip = 0;
                gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable2;
            } else {
                gEkrBg2ScrollFlip = 1;
                gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable1;
            }
        }

        if (gEkrBg1ScrollFlip == 1) {
            gEkrBg1ScrollFlip = 0;
            gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList2;
        } else {
            gEkrBg1ScrollFlip = 1;
            gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList1;
        }
    }

    gpBg2ScrollOffset = gpBg2ScrollOffsetStart;
    gpBg1ScrollOffset = gpBg1ScrollOffsetStart;

    if (++proc->timer == proc->unk44) {
        gEfxBgSemaphore--;
        if (CheckInEkrDragon() == 0)
            SetOnHBlankA(NULL);
        else
            SetOnHBlankA(EfxMagicHBlank_08055CA8);
        Proc_Break(proc);
    }
}

// 0.94 efxmagic:NewEfxALPHA
void NewEfxALPHA(struct Anim * anim, int a, int b, int c, int d, int e)
{
    struct ProcEfxALPHA * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxALPHA, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk2E = a;
    proc->unk30 = a + b;
    proc->unk44 = c;
    proc->unk48 = d;
    proc->unk4C = e;
}

// 0.50 efxmagic:EfxALPHAMain
void EfxALPHAMain(struct ProcEfxALPHA * proc)
{
    int bldA;
    int bldB;

    proc->timer++;

    if (proc->timer < proc->unk2E)
    {
        return;
    }

    bldA = Interpolate(INTERPOLATE_LINEAR, proc->unk44, proc->unk48, (proc->timer - proc->unk2E), (proc->unk30 - proc->unk2E));

    switch (proc->unk4C)
    {
        case 0:
            SetBlendAlpha(bldA, 16);
            break;

        case 1:
            SetBlendBrighten(bldA);
            break;

        case 2:
            bldB = Interpolate(INTERPOLATE_LINEAR, 8, 16, (proc->timer - proc->unk2E), (proc->unk30 - proc->unk2E));
            SetBlendAlpha(bldA, bldB);
            break;
    }

    if (proc->timer >= proc->unk30)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// 0.95 efxmagic:sub_805BB24
void StartSubSpell_efxCircleWIN(struct Anim * anim, int terminator, u16 * c, u16 d, u16 e)
{
    struct ProcEfxCircleWIN * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxCircleWIN, PROC_TREE_3);

    proc->anim = anim;

    proc->timer = 0;
    proc->unk_2e = 0;

    proc->unk_44 = terminator;
    proc->unk_54 = c;

    GetAnimAnotherSide(anim);

    proc->unk_32 = d;
    proc->unk_3a = e;

    return;
}

// 0.85 efxmagic:EfxCircleWINMain
void EfxCircleWINMain(struct ProcEfxCircleWIN * proc)
{
    u16 * unk_54;
    struct Vec2 * vec;
    s16 a;
    s16 b;
    s16 x;
    s16 y;
    u16 var;
    u32 i;

    u16 * buf = (gEkrBg2ScrollFlip == 0) ? gpBg2ScrollOffsetTable1 : gpBg2ScrollOffsetTable2;

    unk_54 = proc->unk_54;
    var = unk_54[proc->unk_2e];

    vec = sub_08013450(var);

    if (unk_54[proc->unk_2e + 1] != 0xFFFF)
    {
        proc->unk_2e++;
    }

    a = proc->unk_3a - var;

    if (a < 0)
    {
        a = 0;
    }

    b = var + proc->unk_3a;

    if (b > DISPLAY_HEIGHT)
    {
        b = DISPLAY_HEIGHT;
    }

    for (i = 0; i < DISPLAY_HEIGHT; buf++, i++)
    {
        if ((a > i) || (b < i))
        {
            *buf = 0;
        }
        else
        {
            x = vec->x + proc->unk_32;

            if (x < 0)
            {
                x = 0;
            }

            y = vec->y + proc->unk_32;

            if (y > DISPLAY_WIDTH)
            {
                y = DISPLAY_WIDTH;
            }

            *buf = y | (x << 8);
            vec++;
        }
    }

    proc->timer++;

    if (proc->timer == proc->unk_44)
    {
        gEfxBgSemaphore--;
        SetBlendNone();
        Proc_Break(proc);
    }

    return;
}

// 0.93 efxmagic:StartSpellThing_MagicQuake
void StartSpellThing_MagicQuake(struct Anim * anim, int terminator, int c)
{
    struct ProcEfxMagicQuake * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMagicQUAKE, PROC_TREE_3);
    proc->anim = anim;
    proc->pQuakePureProc = NewEfxQuakePure(c, 0);
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

// 0.68 efxmagic:Loop6C_efxMagicQUAKE
void Loop6C_efxMagicQUAKE(struct ProcEfxMagicQuake * proc)
{
    s16 x1;
    s16 y1;
    s16 x2;
    s16 y2;

    SetBgOffset(2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    SetBgOffset(0, gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x, gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);

    EkrGauge_Setxy323A(-(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
    EkrDispUP_SetPositionSync(-(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));

    if (CheckInEkrDragon() != 0)
    {
        SetBgOffset(BG_3, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    }

    if (CheckInEkrDragon() != 0)
    {
        x1 = (gEkrXPosReal[0] - gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y1 = (gEkrYPosReal[0] - gEkrBg2QuakeVec.y);
    }
    else
    {
        x1 = (gEkrXPosReal[0] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y1 = (gEkrYPosReal[0] - gEkrBg2QuakeVec.y);
    }

    x2 = ((gEkrXPosReal[1] + gEkrBg2QuakeVec.x) - gEkrBgPosition);
    y2 = (gEkrYPosReal[1] - gEkrBg2QuakeVec.y);

    SetEkrFrontAnimPostion(0, x1, y1);
    SetEkrFrontAnimPostion(1, x2, y2);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;

        SetBgOffset(BG_2, 0, 0);
        SetBgOffset(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);

        EkrGauge_Setxy323A(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        EkrDispUP_SetPositionSync(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);

        if (CheckInEkrDragon() != 0)
        {
            SetBgOffset(BG_3, 0, 0);
        }

        x1 = (gEkrXPosReal[0] - gEkrBgPosition);
        y1 = gEkrYPosReal[0];

        x2 = (gEkrXPosReal[1] - gEkrBgPosition);
        y2 = gEkrYPosReal[1];

        SetEkrFrontAnimPostion(0, x1, y1);
        SetEkrFrontAnimPostion(1, x2, y2);

        Proc_End(proc->pQuakePureProc);

        Proc_Break(proc);
    }

    return;
}

SECTION(".rodata.08BA14E4")
const struct ProcCmd ProcScr_efxRestRST[] = {
    PROC_19,
    PROC_SET_END_CB(efxRestRST_OnEnd),
    PROC_REPEAT(efxRestRSTMain),
    PROC_END,
};

SECTION(".rodata.08BA1504")
const struct ProcCmd ProcScr_efxTwobaiRST[] = {
    PROC_19,
    PROC_REPEAT(EfxTwobaiRSTMain),
    PROC_END,
};

SECTION(".rodata.08BA151C")
const struct ProcCmd ProcScr_DummvRST[] = {
    PROC_19,
    PROC_SET_END_CB(DummvRST_OnEnd),
    PROC_REPEAT(DummvRSTMain),
    PROC_END,
};

SECTION(".rodata.08BA153C")
const struct ProcCmd ProcScr_EfxRestWIN[] = {
    PROC_19,
    PROC_REPEAT(EfxRestWINMain),
    PROC_END,
};

SECTION(".rodata.08BA1574")
const struct ProcCmd ProcScr_efxALPHA[] = {
    PROC_19,
    PROC_REPEAT(EfxALPHAMain),
    PROC_END,
};

SECTION(".rodata.08BA158C")
const struct ProcCmd ProcScr_efxCircleWIN[] = {
    PROC_19,
    PROC_REPEAT(EfxCircleWINMain),
    PROC_END,
};

SECTION(".rodata.08BA15A4")
const struct ProcCmd ProcScr_efxMagicQUAKE[] = {
    PROC_19,
    PROC_REPEAT(Loop6C_efxMagicQUAKE),
    PROC_END,
};

SECTION(".rodata.08BA1554")
const struct ProcCmd ProcScr_EfxRestWINH[] = {
    PROC_19,
    PROC_REPEAT(EfxRestWINH_Loop_A),
    PROC_REPEAT(EfxRestWINH_Loop_B),
    PROC_END,
};

#if MOD_CLAUDE
void StartSpellAnimDandelion(struct Anim * anim);
#endif

SECTION(".rodata.08BA13D0")
const SpellAnimFunc gEkrSpellAnimLut[] = {
    StartSpellAnimDummy,
    StartSpellAnimHandAxe,
    StartSpellAnimArrow,
    sub_08056938,
    sub_08056994,
    sub_080569F0,
    sub_08056A4C,
    sub_08056AA8,
    sub_08056B04,
    sub_08056B60,
    sub_08056BBC,
    sub_08056C18,
    sub_08056C74,
    sub_08056CD0,
    StartSpellAnimSong,
    StartSpellAnimDance,
    StartSpellAnimBallista,
    StartSpellAnimSpell11,
    StartSpellAnimHurtmut,
    StartSpellAnimFireBreath,
    StartSpellAnimIceBreath,
    StartSpellAnimDarkBreath,
    StartSpellAnimFire,
    StartSpellAnimElfire,
    StartSpellAnimBolganone,
    StartSpellAnimThunder,
    StartSpellAnimBolting,
    StartSpellAnimFimbulvetr,
    sub_08059408,
    StartSpellAnimFlux,
    StartSpellAnimNosferatu,
    StartSpellAnimLightning,
    StartSpellAnimPurge,
    StartSpellAnimSpell21,
    StartSpellAnimDivine,
    sub_0805BBEC,
    StartSpellAnimEclipse,
    StartSpellAnimFenrir,
    StartSpellAnimHeal,
    StartSpellAnimMend,
    StartSpellAnimRecover,
    StartSpellAnimPhysic,
    StartSpellAnimFortify,
    StartSpellAnimLatona,
    StartSpellAnimRestore,
    StartSpellAnimSilence,
    StartSpellAnimSleep,
    StartSpellAnimHammerne,
    StartSpellAnimBerserk,
    StartSpellAnimBarrier,
    NULL,
    StartSpellAnimShine,
    StartSpellAnimLuna,
    StartSpellAnimExcalibur,
    StartSpellAnimGespenst,
    StartSpellAnimAura,
    StartSpellAnimLuce,
    StartSpellAnimEreshkigal,
    StartSpellAnimFillasMight,
    StartSpellAnimThorsIre,
    StartSpellAnimNinisGrace,
    StartSpellAnimSetsLitany,
    NULL,
    NULL,
#if MOD_CLAUDE
    StartSpellAnimDandelion, // SPELLANIM_DANDELION (src/mod/claude_petal.c)
#endif
};
