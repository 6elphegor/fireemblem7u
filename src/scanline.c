#include "gbafe.h"

u16 EWRAM_DATA gManimScanlineBufA[DISPLAY_HEIGHT * 2] = { 0 };
u16 EWRAM_DATA gManimScanlineBufB[DISPLAY_HEIGHT * 2] = { 0 };
u16 * EWRAM_DATA gManimScanlineBufs[2] = { 0 };
u16 * EWRAM_DATA gManimActiveScanlineBuf = NULL;

void InitScanlineEffect(void)
{
    InitScanlineBuf(gManimScanlineBufA);
    InitScanlineBuf(gManimScanlineBufB);

    gManimScanlineBufs[0] = gManimScanlineBufA;
    gManimScanlineBufs[1] = gManimScanlineBufB;

    gManimActiveScanlineBuf = gManimScanlineBufs[0];
}

void sub_0807689C(void)
{
    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);
    SetWin0Layers(0, 0, 0, 0, 0);
    SetWOutLayers(1, 1, 1, 1, 1);

    SetOnHBlankA(sub_08076A10);
}

void sub_080769CC(int x, int y, int radius)
{
    InitScanlineBuf(gManimScanlineBufs[1]);
    MapAnimScanlineCore(gManimScanlineBufs[1], x, y, radius);
    SwapScanlineBufs();
}

void ResetScanLineHBlank(void)
{
    SetOnHBlankA(NULL);
}

void sub_08076A10(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gManimActiveScanlineBuf = gManimScanlineBufs[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    REG_WIN0H = gManimActiveScanlineBuf[vcount];
}

void sub_08076A78(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gManimActiveScanlineBuf = gManimScanlineBufs[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    REG_WIN0H = gManimActiveScanlineBuf[vcount];
    REG_BG2HOFS = gManimActiveScanlineBuf[DISPLAY_HEIGHT + vcount];
}

void sub_08076AFC(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gManimActiveScanlineBuf = gManimScanlineBufs[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    ((vu16 *)PLTT)[0x10 * (1 + 0) + 1] = gManimActiveScanlineBuf[vcount];
    ((vu16 *)PLTT)[0x10 * (1 + 1) + 1] = gManimActiveScanlineBuf[DISPLAY_HEIGHT + vcount];
}

void sub_08076B80(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gManimActiveScanlineBuf = gManimScanlineBufs[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    REG_BLDALPHA = gManimActiveScanlineBuf[vcount];
}

void sub_08076BE8(void)
{
    u16 vcount = REG_VCOUNT;

    if (vcount >= DISPLAY_HEIGHT)
    {
        gManimActiveScanlineBuf = gManimScanlineBufs[0];
        vcount = 0;
    }
    else
    {
        vcount++;
    }

    *(vu16 *)0x04000054 = gManimActiveScanlineBuf[vcount];
}

void StartManimFrameGradientScanlineEffect2(u16 y_top, u16 y_bottom, u16 color_a, u16 color_b)
{
    #define RGB_HALVED(color, component_mask) \
        ((((component_mask) & (color)) >> 1) & (component_mask))

    PrepareGradientScanlineBuf(
        gManimScanlineBufs[1], y_top, y_bottom, color_a,
        RGB_HALVED(color_a, 0x1F) | RGB_HALVED(color_a, 0x1F << 5) | RGB_HALVED(color_a, 0x1F << 10));
    PrepareGradientScanlineBuf(
        gManimScanlineBufs[1] + DISPLAY_HEIGHT, y_top, y_bottom, color_b,
        RGB_HALVED(color_b, 0x1F) | RGB_HALVED(color_b, 0x1F << 5) | RGB_HALVED(color_b, 0x1F << 10));
    SwapScanlineBufs();

    SetOnHBlankA(sub_08076AFC);

    #undef RGB_HALVED
}

void sub_08076D8C(int x, int y, int a, int b, u8 const * lut)
{
    int var;

    InitScanlineBuf(gManimScanlineBufs[1]);

    for (; *lut != 0xFF && y >= 0; y--)
    {
        var = Div(*lut * a, b);
        lut++;

        if (var > 0)
        {
            SetScanlineBufWinR(gManimScanlineBufs[1], x + var - 1, y);
            SetScanlineBufWinL(gManimScanlineBufs[1], x - var, y);
        }
    }

    if (var > 0)
    {
        while (y >= 0)
        {
            SetScanlineBufWinR(gManimScanlineBufs[1], x + var - 1, y);
            SetScanlineBufWinL(gManimScanlineBufs[1], x - var, y);
            y--;
        }
    }
}

void PrepareSineWaveScanlineBuf(u16 * buf, s16 phase, s16 amplitude, s16 frequency)
{
    int i;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
        *buf++ = (SIN_Q12(i * frequency + phase) * amplitude) >> 12;
}

void sub_08076EC4(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int offset)
{
    int i;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
        *buf++ = ((SIN_Q12(i * frequency + phase) * amplitude) >> 12) + offset;
}

void sub_08076F44(u16 * buf, s16 phase, s16 amplitude, s16 frequency)
{
    int i;

    buf++;

    for (i = 1; i < DISPLAY_HEIGHT; i += 2)
    {
        *buf = (SIN_Q12(i * frequency + phase) * amplitude) >> 12;
        buf += 2;
    }
}

void sub_08076FC4(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int offset)
{
    int i;

    buf++;

    for (i = 1; i < DISPLAY_HEIGHT; i += 2)
    {
        *buf = ((SIN_Q12(i * frequency + phase) * amplitude) >> 12) + offset;
        buf += 2;
    }
}

void PrepareSineWaveScanlineBufExt(u16 * buf, s16 phase, s16 amplitude, s16 frequency, int y_start, int y_end)
{
    int i;

    for (i = y_start; i < y_end; i++)
        *buf++ = (SIN_Q12(i * frequency + phase) * amplitude) >> 12;
}

void SwapScanlineBufs(void)
{
    u16 * tmp = gManimScanlineBufs[0];
    gManimScanlineBufs[0] = gManimScanlineBufs[1];
    gManimScanlineBufs[1] = tmp;
}

void InitScanlineBuf(u16 * buf)
{
    int i;
    u16 * it = buf;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
        *it++ = DISPLAY_WIDTH | (DISPLAY_WIDTH << 8);
}

void SetScanlineBufWinL(u16 * buf, int x, int y)
{
    if (y < 0 || y >= DISPLAY_HEIGHT)
        return;

    if (x < 0)
        x = 0;

    if (x > DISPLAY_WIDTH)
        x = DISPLAY_WIDTH;

    *((u8 *)buf + (y << 1) + 1) = x;
}

void SetScanlineBufWinR(u16 * buf, int x, int y)
{
    if (y < 0 || y >= DISPLAY_HEIGHT)
        return;

    if (x < 0)
        x = 0;

    if (x > DISPLAY_WIDTH)
        x = DISPLAY_WIDTH;

    *((u8 *)buf + (y << 1)) = x;
}

void MapAnimScanlineCore(u16 * buf, int x, int y, int radius)
{
    int var = radius;
    int i;

    for (i = 0; var >= i; i++)
    {
        SetScanlineBufWinR(buf, x + var, y + i);
        SetScanlineBufWinR(buf, x + var, y - i);
        SetScanlineBufWinR(buf, x + i, y + var);
        SetScanlineBufWinR(buf, x + i, y - var);

        SetScanlineBufWinL(buf, x - var, y + i);
        SetScanlineBufWinL(buf, x - var, y - i);
        SetScanlineBufWinL(buf, x - i, y + var);
        SetScanlineBufWinL(buf, x - i, y - var);

        radius -= (i << 1) - 1;

        if (radius < 0)
        {
            radius = radius + ((var - 1) << 1);
            var = var - 1;
        }
    }
}

void PrepareGradientScanlineBuf(u16 * buf, u16 y_top, u16 y_bottom, u16 color_a, u16 color_b)
{
    int i;
    int scanline;
    int r, g, b;

    int scanlines = y_bottom - y_top;

    scanline = 0;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        if (i < y_top)
        {
            *buf++ = color_a;
            continue;
        }

        if (i > y_bottom)
        {
            *buf++ = color_b;
            continue;
        }

        r = Interpolate(0, color_a & 0x001F, color_b & 0x001F, scanline, scanlines);
        g = Interpolate(0, color_a & 0x03E0, color_b & 0x03E0, scanline, scanlines);
        b = Interpolate(0, color_a & 0x7C00, color_b & 0x7C00, scanline, scanlines);

        *buf++ = (r & 0x001F) | (g & 0x03E0) | (b & 0x7C00);

        scanline++;
    }
}

void ManimShiftingSineWave_Init(struct ManimSineWaveProc * proc)
{
    proc->phase = 0;
}

void ManimShiftingSineWave_Main(struct ManimSineWaveProc * proc)
{
    PrepareSineWaveScanlineBuf(gManimScanlineBufs[1] + DISPLAY_HEIGHT, proc->phase++, 0x10, 8);
    SwapScanlineBufs();
}

void sub_0807744C(void)
{
    int i;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
        gManimScanlineBufs[0][i] = 0x1000;

    for (i = 8; i < DISPLAY_HEIGHT - 8; i++)
        gManimScanlineBufs[0][i] = 0x10;

    for (i = 0; i <= 32; i++)
    {
        *(gManimScanlineBufs[0] + (i + 8)) = ((0x10 - (i >> 1)) << 8) | (i >> 1);
        *(gManimScanlineBufs[0] - (i - DISPLAY_HEIGHT + 8)) = ((0x10 - (i >> 1)) << 8) | (i >> 1);
    }
}

u16 * GetScanlineBuf(int buf_id, int scanline)
{
    return &gManimScanlineBufs[buf_id][scanline];
}

ASM_FUNC("asm/nonmatching/code_0807754C.s");
ASM_FUNC("asm/nonmatching/code_0807764C.s");
ASM_FUNC("asm/nonmatching/code_08077680.s");
ASM_FUNC("asm/nonmatching/code_080777E4.s");
ASM_FUNC("asm/nonmatching/code_08077860.s");
ASM_FUNC("asm/nonmatching/code_080778C8.s");
ASM_FUNC("asm/nonmatching/code_08077910.s");
ASM_FUNC("asm/nonmatching/code_08077960.s");
ASM_FUNC("asm/nonmatching/code_080779F8.s");
ASM_FUNC("asm/nonmatching/code_08077ADC.s");
ASM_FUNC("asm/nonmatching/code_08077B74.s");
ASM_FUNC("asm/nonmatching/code_08077C0C.s");
ASM_FUNC("asm/nonmatching/code_08077CA4.s");
ASM_FUNC("asm/nonmatching/code_08077D3C.s");
ASM_FUNC("asm/nonmatching/code_08077DE8.s");
ASM_FUNC("asm/nonmatching/code_08077EB8.s");
ASM_FUNC("asm/nonmatching/code_080780C4.s");
