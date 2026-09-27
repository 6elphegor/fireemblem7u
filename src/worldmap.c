#include "gbafe.h"

// FE7 world map (no FE8 counterpart)

struct WmSt {
    /* 00 */ u8 mode;
    /* 01 */ u8 unk_01;
    /* 02 */ s8 unk_02;
    /* 04 */ s16 x;
    /* 06 */ s16 y;
    /* 08 */ s16 tx;
    /* 0A */ s16 ty;
};

struct WmCanvas {
    /* 000 */ u16 tiles[32][32];
    /* 800 */ u16 nextTile;
    /* 802 */ s16 offX;
    /* 804 */ s16 offY;
};

extern struct WmSt gWmSt;
extern struct WmCanvas gWmCanvas;

bool sub_080AAD18(int x, int y, int x1, int y1, int x2, int y2, int x3, int y3);
void sub_080B5D9C(int mode, int x, int y);
void sub_080B5E80(int mode, int x, int y);
void sub_080B5BFC(int x1, int y1, int x2, int y2);
void WmCanvas_PutPixel(int x, int y, u8 color);
void WmUpdateCamera(int x, int y);

s8 WmGetUnk02(void)
{
    return gWmSt.unk_02;
}

void WmSetUnk02(s8 value)
{
    gWmSt.unk_02 = value;
}

void WmCanvas_Init(void)
{
    CpuFastFill(-1, gWmCanvas.tiles, sizeof(gWmCanvas.tiles));
    CpuFastFill(0, (void *) (VRAM + 0x1000), 0x5000);

    TmFill(gBg2Tm, 0);

    gWmCanvas.nextTile = 0;
    gWmCanvas.offX = 0;
    gWmCanvas.offY = 0;

    SetBgOffset(2, 0, 0);
    EnableBgSync(BG2_SYNC_BIT);
}

void WmCanvas_Scroll(int dx, int dy)
{
    gWmCanvas.offX += dx;
    gWmCanvas.offY += dy;

    SetBgOffset(2, gWmCanvas.offX, gWmCanvas.offY);
}

ASM_FUNC("asm/nonmatching/code_080B3070.s");

void WmCanvas_FillQuad(int x0, int y0, int x1, int y1, int x2, int y2, int x3, int y3, u8 color)
{
    int x, y;
    int xmin, xmax, ymin, ymax;

    ymin = y0;
    if (ymin > y1) ymin = y1;
    if (ymin > y2) ymin = y2;
    if (ymin > y3) ymin = y3;

    ymax = y0;
    if (ymax < y1) ymax = y1;
    if (ymax < y2) ymax = y2;
    if (ymax < y3) ymax = y3;

    xmin = x0;
    if (xmin > x1) xmin = x1;
    if (xmin > x2) xmin = x2;
    if (xmin > x3) xmin = x3;

    xmax = x0;
    if (xmax < x1) xmax = x1;
    if (xmax < x2) xmax = x2;
    if (xmax < x3) xmax = x3;

    for (y = ymin; y <= ymax; y++)
    {
        for (x = xmin; x <= xmax; x++)
        {
            if (sub_080AAD18(x, y, x0, y0, x1, y1, x2, y2))
                WmCanvas_PutPixel(x, y, color);
            else if (sub_080AAD18(x, y, x0, y0, x2, y2, x3, y3))
                WmCanvas_PutPixel(x, y, color);
        }
    }
}

void WmSetCamera(u8 mode, int x, int y)
{
    gWmSt.mode = mode;

    if (mode == 1)
    {
        gWmSt.tx = x;
        gWmSt.ty = y;

        if (gWmSt.tx < 0)
            gWmSt.tx = 0;

        if (gWmSt.tx > 0x310)
            gWmSt.tx = 0x310;

        if (gWmSt.ty < 0)
            gWmSt.ty = 0;

        if (gWmSt.ty > 0x210)
            gWmSt.ty = 0x210;

        gWmSt.x = gWmSt.tx;
        gWmSt.y = gWmSt.ty;
    }
    else
    {
        gWmSt.x = 0;
        gWmSt.tx = 0;
        gWmSt.y = 0;
        gWmSt.ty = 0;
    }

    sub_080B5D9C(gWmSt.mode, gWmSt.x, gWmSt.y);
}

void WmRedrawMap(void)
{
    sub_080B5E80(gWmSt.mode, gWmSt.x / 8, gWmSt.y / 8);
}

void WmMoveCamera(int dx, int dy)
{
    if (gWmSt.mode == 1)
    {
        gWmSt.tx += dx;
        gWmSt.ty += dy;

        if (gWmSt.tx < 0)
            gWmSt.tx = 0;

        if (gWmSt.tx > 0x310)
            gWmSt.tx = 0x310;

        if (gWmSt.ty < 0)
            gWmSt.ty = 0;

        if (gWmSt.ty > 0x210)
            gWmSt.ty = 0x210;

        WmCanvas_Scroll(gWmSt.tx - gWmSt.x, gWmSt.ty - gWmSt.y);
    }
}

ASM_FUNC("asm/nonmatching/code_080B3338.s");

int WmGetCameraX(void)
{
    return gWmSt.x;
}

int WmGetCameraY(void)
{
    return gWmSt.y;
}

ASM_FUNC("asm/nonmatching/code_080B33D0.s");
ASM_FUNC("asm/nonmatching/code_080B36A0.s");
ASM_FUNC("asm/nonmatching/code_080B36FC.s");
ASM_FUNC("asm/nonmatching/code_080B3720.s");
ASM_FUNC("asm/nonmatching/code_080B37A4.s");
ASM_FUNC("asm/nonmatching/code_080B37C4.s");
ASM_FUNC("asm/nonmatching/code_080B3858.s");
ASM_FUNC("asm/nonmatching/code_080B3918.s");
ASM_FUNC("asm/nonmatching/code_080B3940.s");
ASM_FUNC("asm/nonmatching/code_080B39D8.s");
ASM_FUNC("asm/nonmatching/code_080B3AFC.s");
ASM_FUNC("asm/nonmatching/code_080B3B70.s");
ASM_FUNC("asm/nonmatching/code_080B3BE8.s");
ASM_FUNC("asm/nonmatching/code_080B3C04.s");
ASM_FUNC("asm/nonmatching/code_080B3C18.s");
ASM_FUNC("asm/nonmatching/code_080B3C58.s");
ASM_FUNC("asm/nonmatching/code_080B3C90.s");
ASM_FUNC("asm/nonmatching/code_080B3CD0.s");
ASM_FUNC("asm/nonmatching/code_080B3D20.s");
ASM_FUNC("asm/nonmatching/code_080B3D78.s");
ASM_FUNC("asm/nonmatching/code_080B3DA4.s");
ASM_FUNC("asm/nonmatching/code_080B3DB8.s");
ASM_FUNC("asm/nonmatching/code_080B3DFC.s");
ASM_FUNC("asm/nonmatching/code_080B3E20.s");
ASM_FUNC("asm/nonmatching/code_080B3E78.s");
ASM_FUNC("asm/nonmatching/code_080B3E98.s");
ASM_FUNC("asm/nonmatching/code_080B3EB4.s");
ASM_FUNC("asm/nonmatching/code_080B42D4.s");
ASM_FUNC("asm/nonmatching/code_080B42FC.s");
ASM_FUNC("asm/nonmatching/code_080B4310.s");
ASM_FUNC("asm/nonmatching/code_080B4328.s");
ASM_FUNC("asm/nonmatching/code_080B437C.s");
ASM_FUNC("asm/nonmatching/code_080B43EC.s");
ASM_FUNC("asm/nonmatching/code_080B4510.s");
ASM_FUNC("asm/nonmatching/code_080B4610.s");
ASM_FUNC("asm/nonmatching/code_080B467C.s");
ASM_FUNC("asm/nonmatching/code_080B4738.s");
ASM_FUNC("asm/nonmatching/code_080B47E0.s");
ASM_FUNC("asm/nonmatching/code_080B4828.s");
ASM_FUNC("asm/nonmatching/code_080B4890.s");
ASM_FUNC("asm/nonmatching/code_080B4904.s");
ASM_FUNC("asm/nonmatching/code_080B4ADC.s");
ASM_FUNC("asm/nonmatching/code_080B4B14.s");
ASM_FUNC("asm/nonmatching/code_080B4B50.s");
ASM_FUNC("asm/nonmatching/code_080B4B8C.s");
ASM_FUNC("asm/nonmatching/code_080B4C28.s");
ASM_FUNC("asm/nonmatching/code_080B4C60.s");
ASM_FUNC("asm/nonmatching/code_080B4D14.s");
ASM_FUNC("asm/nonmatching/code_080B4D4C.s");
ASM_FUNC("asm/nonmatching/code_080B4E88.s");
ASM_FUNC("asm/nonmatching/code_080B4F44.s");
ASM_FUNC("asm/nonmatching/code_080B4F58.s");
ASM_FUNC("asm/nonmatching/code_080B4F68.s");
ASM_FUNC("asm/nonmatching/code_080B4F6C.s");
ASM_FUNC("asm/nonmatching/code_080B4F70.s");
ASM_FUNC("asm/nonmatching/code_080B4F74.s");
ASM_FUNC("asm/nonmatching/code_080B4F78.s");
ASM_FUNC("asm/nonmatching/code_080B4F9C.s");
ASM_FUNC("asm/nonmatching/code_080B4FE4.s");
ASM_FUNC("asm/nonmatching/code_080B5030.s");
ASM_FUNC("asm/nonmatching/code_080B50C4.s");
ASM_FUNC("asm/nonmatching/code_080B5280.s");
ASM_FUNC("asm/nonmatching/code_080B52CC.s");
ASM_FUNC("asm/nonmatching/code_080B52D0.s");
ASM_FUNC("asm/nonmatching/code_080B5350.s");
ASM_FUNC("asm/nonmatching/code_080B5420.s");
ASM_FUNC("asm/nonmatching/code_080B5430.s");
ASM_FUNC("asm/nonmatching/code_080B5554.s");
ASM_FUNC("asm/nonmatching/code_080B558C.s");
ASM_FUNC("asm/nonmatching/code_080B55BC.s");
ASM_FUNC("asm/nonmatching/code_080B55E4.s");
ASM_FUNC("asm/nonmatching/code_080B5624.s");
ASM_FUNC("asm/nonmatching/code_080B5630.s");
ASM_FUNC("asm/nonmatching/code_080B5644.s");
ASM_FUNC("asm/nonmatching/code_080B565C.s");
ASM_FUNC("asm/nonmatching/code_080B5760.s");
ASM_FUNC("asm/nonmatching/code_080B57AC.s");
ASM_FUNC("asm/nonmatching/code_080B5844.s");
ASM_FUNC("asm/nonmatching/code_080B58A0.s");
ASM_FUNC("asm/nonmatching/code_080B5934.s");
ASM_FUNC("asm/nonmatching/code_080B5990.s");
ASM_FUNC("asm/nonmatching/code_080B5A84.s");
ASM_FUNC("asm/nonmatching/code_080B5B00.s");
ASM_FUNC("asm/nonmatching/code_080B5B44.s");
ASM_FUNC("asm/nonmatching/code_080B5B6C.s");
ASM_FUNC("asm/nonmatching/code_080B5B80.s");
ASM_FUNC("asm/nonmatching/code_080B5BFC.s");
ASM_FUNC("asm/nonmatching/code_080B5D40.s");
ASM_FUNC("asm/nonmatching/code_080B5D9C.s");
ASM_FUNC("asm/nonmatching/code_080B5E80.s");
ASM_FUNC("asm/nonmatching/code_080B5FC0.s");
ASM_FUNC("asm/nonmatching/code_080B5FE0.s");
ASM_FUNC("asm/nonmatching/code_080B6034.s");
ASM_FUNC("asm/nonmatching/code_080B608C.s");
ASM_FUNC("asm/nonmatching/code_080B6190.s");
ASM_FUNC("asm/nonmatching/code_080B620C.s");
ASM_FUNC("asm/nonmatching/code_080B6264.s");
ASM_FUNC("asm/nonmatching/code_080B6278.s");
ASM_FUNC("asm/nonmatching/code_080B6288.s");
ASM_FUNC("asm/nonmatching/code_080B6298.s");
ASM_FUNC("asm/nonmatching/code_080B62C4.s");
