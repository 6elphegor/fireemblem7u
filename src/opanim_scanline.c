#include "gbafe.h"

EWRAM_OVERLAY(gamestart) struct OpScanlineSt OpScanlineSt = {};
EWRAM_OVERLAY(gamestart) u8 OpScanlineBuf[0x280] = {};
EWRAM_OVERLAY(gamestart) u8 * gpOpScanlineBufs[2] = {};

void sub_080BB070(void)
{
    gUnkOpAnim_0200750C.unk_00 = 0xF8;
    gUnkOpAnim_0200750C.unk_04 = 0x04;
}

void InitOpScanlineBuf(void)
{
    CpuFastFill(0, OpScanlineBuf, 0x280);

    gpOpScanlineBufs[0] = OpScanlineBuf;
    gpOpScanlineBufs[1] = OpScanlineBuf + 0x140;

    OpScanlineSt.unk_00 = 0;
    OpScanlineSt.unk_04 = 0x300;
    OpScanlineSt.unk_08 = 0x200;
    OpScanlineSt.unk_0C = 0x200;
    OpScanlineSt.unk_10 = 0x300;
    OpScanlineSt.unk_18 = 0;
    OpScanlineSt.unk_14 = 0;
}

void SwapOpScanlineBufs(void)
{
    u8 * buf = gpOpScanlineBufs[0];

    gpOpScanlineBufs[0] = gpOpScanlineBufs[1];
    gpOpScanlineBufs[1] = buf;
}

#if 0
void sub_080BB0E0(void)
{
    int i;
    int r8;

    signed long long __unk_00 = OpScanlineSt.unk_04;
    signed long long __unk_08 = OpScanlineSt.unk_00;
    signed long long __unk_10 = OpScanlineSt.unk_0C;
    signed long long __unk_18 = OpScanlineSt.unk_10;

    if (OpScanlineSt.unk_18 == 0)
    {
        for (i = 1; i < 0xA0; i = i + 2)
        {
            int val = i * __unk_00 + __unk_08;

            gpOpScanlineBufs[0][i + 0x00] = ((SIN_Q12(val + 0x00) + 0xFFF) * __unk_10) >> 20;
            gpOpScanlineBufs[0][i + 0xA0] = ((SIN_Q12(val + 0x40) + 0xFFF) * __unk_18) >> 20;
        }
    }
    else
    {
        for (i = 9; i < 0x80; i = i + 2)
        {
            r8 = ((OpScanlineSt.unk_14 - i) * (OpScanlineSt.unk_14 - i) * 0x100) / (OpScanlineSt.unk_18 * OpScanlineSt.unk_18);

            if (r8 > 0)
            {
                int val = i * __unk_00 + __unk_08;

                gpOpScanlineBufs[0][i + 0x00] = ((SIN_Q12(val + 0x00) + 0xFFF) * __unk_18 * r8) >> 20;
                gpOpScanlineBufs[0][i + 0xA0] = ((SIN_Q12(val + 0x40) + 0xFFF) * __unk_10 * r8) >> 20;
            }
        }
    }

    SwapOpScanlineBufs();
    OpScanlineSt.unk_00 += OpScanlineSt.unk_08;
}
#endif

ASM_FUNC("asm/nonmatching/code_080BB0E0.s");

void sub_080BB2AC(void)
{
    CpuFastFill(0x00100010, gUnkOpAnim_02007300, 0x200);

    gUnkOpAnim_02007500[0] = gUnkOpAnim_02007300;
    gUnkOpAnim_02007500[1] = gUnkOpAnim_02007300 + 0x80;

    gUnkOpAnim_02007508 = 0;

    InitOpScanlineBuf();

    gUnkOpAnim_0200751C = 0xA0;
    gUnkOpAnim_02007520 = 0xA0;

    OpScanlineSt.unk_18 = 0;
    OpScanlineSt.unk_14 = 0x50;
    OpScanlineSt.unk_04 = 0x1000;
    OpScanlineSt.unk_08 = 0x400;
}

void sub_080BB31C(void)
{
    u16 * buf = gUnkOpAnim_02007500[0];

    gUnkOpAnim_02007500[0] = gUnkOpAnim_02007500[1];
    gUnkOpAnim_02007500[1] = buf;
}

void sub_080BB32C(void)
{
    int val = ((gUnkOpAnim_02007508 << 3) >> 6) + 0x1000;
    *gUnkOpAnim_02007500[0] = val;
    sub_080BB31C();
}

void HBlank_80BBDD0(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > 0x9F)
        vcount = 0;

    if (vcount & 1)
    {
        if (gUnkOpAnim_03001620 & 1)
        {
            REG_BG0HOFS = gpOpScanlineBufs[1][vcount];
            REG_BG0VOFS = gpOpScanlineBufs[1][vcount + 0xA0];
        }

        if (gUnkOpAnim_03001620 & 2)
        {
            REG_BG1HOFS = gpOpScanlineBufs[1][vcount];
            REG_BG1VOFS = gpOpScanlineBufs[1][vcount + 0xA0];
        }

        if (gUnkOpAnim_03001620 & 4)
        {
            REG_BG2HOFS = gpOpScanlineBufs[1][vcount];
            REG_BG2VOFS = gpOpScanlineBufs[1][vcount + 0xA0] + gDispIo.bg_off[2].y;
        }

        if (gUnkOpAnim_03001620 & 8)
        {
            REG_BG3HOFS = gpOpScanlineBufs[1][vcount];
            REG_BG3VOFS = gpOpScanlineBufs[1][vcount + 0xA0];
        }
    }

    if (gUnkOpAnim_03001620 & 0x180)
    {
        if (vcount == 0x83)
        {
            REG_BLDCNT = 0xF40;
            REG_BLDALPHA = 0x1000;
        }

        if (vcount > 0x83)
        {
            if (vcount <= 0x93)
            {
                int val = ((vcount - 0x84) * gUnkOpAnim_020072BC) >> 4;
                REG_BLDALPHA = val + ((0x10 - val) << 8);
            }

            if (vcount == 0x94)
                REG_BLDALPHA = gUnkOpAnim_020072BC + ((0x10 - gUnkOpAnim_020072BC) << 8);
        }

        if (vcount == 0)
        {
            REG_BLDCNT = *(u16 *)&gDispIo.blend_ct;
            REG_BLDALPHA = (gDispIo.blend_coef_b << 8) | gDispIo.blend_coef_a;
            *(vu16 *)REG_ADDR_BLDY = gDispIo.blend_y;
        }
    }

    if (gUnkOpAnim_03001620 & 0x10)
        REG_BG1VOFS = -((vcount & 1) + (vcount >> 1));

    if (gUnkOpAnim_03001620 & 0x60)
    {
        if (vcount == 0x9F)
            REG_BLDCNT = 0x441;

        if (vcount == 1)
            REG_BLDALPHA = *gUnkOpAnim_02007500[1];
    }
}
