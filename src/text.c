#include "gbafe.h"

struct DebugTextSt
{
    /* 00 */ u32 vramoff;
    /* 04 */ s16 bg;
    /* 06 */ u16 chr;
    /* 08 */ u32 x;
    /* 0C */ u32 line;
    /* 10 */ u32 top;
    /* 14 */ char buf[256][32];
};

struct SpecialCharSt
{
    /* 00 */ s8 color;
    /* 01 */ s8 id;
    /* 02 */ s16 chr_position;
};

extern struct DebugTextSt gDebugTextSt;
extern char gNumberStr[];
extern int gDebugObjChr;
extern int gDebugObjPal;
extern u8 const Img_DebugFont[];
extern char const gHexDigits[];

void DebugInitBg(int bg, int vramoff)
{
    if (vramoff == 0)
        vramoff = 0x5800;

    SetBgChrOffset(bg, 0);
    SetBgScreenSize(bg, 0);
    RegisterDataMove(Img_DebugFont, (void *)(VRAM + (vramoff & 0x1FFFF)), 0x800);

    gPal[0] = 0;
    gPal[2] = RGB(31, 31, 31);
    EnablePalSync();

    TmFill(GetBgTilemap(bg), 0);

    gDebugTextSt.bg = bg;
    gDebugTextSt.vramoff = vramoff;
    gDebugTextSt.chr = GetBgChrId(bg, vramoff);
}

ASM_FUNC("asm/nonmatching/code_08004F70.s");

void DebugPutFmt(u16 * tm, char const * fmt, ...)
{
    char buf[0x100];
    DebugPutStr(tm, buf);
}

void DebugScreenInit(void)
{
    int i;

    for (i = 0; i < 0x100; i++)
        gDebugTextSt.buf[i & 0xFF][0] = 0;

    gDebugTextSt.x = 0;
    gDebugTextSt.line = 0;

    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);
}

void DebugPrintFmt(char const * fmt, ...)
{
    char buf[0x100];
    DebugPrintStr(buf);
}

void ClearNumberStr(void)
{
    u32 * ptr = (u32 *) gNumberStr;
    u32 const spaces = 0x20202020;

    *ptr++ = spaces;
    *ptr++ = spaces;
    gNumberStr[8] = 0;
}

void GenNumberStr(int number)
{
    int i;

    ClearNumberStr();

    for (i = 7; i >= 0; i--)
    {
        gNumberStr[i] = '0' + number % 10;
        number /= 10;

        if (number == 0)
            break;
    }
}

void GenNumberOrBlankStr(int number)
{
    ClearNumberStr();

    if (number == 255 || number == -1)
    {
        gNumberStr[7] = ':';
        gNumberStr[6] = ':';
    }
    else
    {
        GenNumberStr(number);
    }
}

void DebugPrintNumber(int number, int length)
{
    GenNumberStr(number);
    DebugPrintStr(gNumberStr + 8 - length);
}

void GenNumberHexStr(int number)
{
    int i;

    ClearNumberStr();

    for (i = 7; i >= 0; i--)
    {
        gNumberStr[i] = gHexDigits[number & 0xF];
        number >>= 4;

        if (number == 0)
            break;
    }
}

void DebugPrintNumberHex(int number, int length)
{
    GenNumberHexStr(number);
    DebugPrintStr(gNumberStr + 8 - length);
}

void DebugPrintStr(char const * str)
{
    while (*str != 0)
    {
        int c = *str;

        if (gDebugTextSt.x == 0x30)
            c = 0;
        else
            str++;

        if (c == '\n')
            c = 0;

        gDebugTextSt.buf[gDebugTextSt.line & 0xFF][gDebugTextSt.x] = c;
        gDebugTextSt.x++;

        if (c == 0)
        {
            gDebugTextSt.x = 0;
            gDebugTextSt.line++;
        }
    }

    if (gDebugTextSt.line > gDebugTextSt.top + 20)
        gDebugTextSt.top = gDebugTextSt.line - 20;
}

void DebugPutScreen(void)
{
    int i;

    TmFill(gBg2Tm, 0);

    for (i = 0; i < 20; i++)
    {
        u16 * tm = gBg2Tm + i * 0x20;

        if (gDebugTextSt.buf[(i + gDebugTextSt.top) & 0xFF][0] != 0)
        {
            int j = 0;

            while (gDebugTextSt.buf[(i + gDebugTextSt.top) & 0xFF][j] != 0)
            {
                u16 chr = gDebugTextSt.buf[(i + gDebugTextSt.top) & 0xFF][j];

                if (chr > 0x60)
                    chr -= 0x40;
                else
                    chr -= 0x20;

                *tm++ = gDebugTextSt.chr + chr;

                j++;
            }
        }
    }

    EnableBgSync(BG2_SYNC_BIT);
}

int DebugUpdateScreen(u16 held, u16 pressed)
{
    int min;
    int max;

    if (pressed & 2)
        return 0;

    DebugPutScreen();

    min = gDebugTextSt.line - 256;
    if (min < 0)
        min = 0;

    max = gDebugTextSt.line - 20;
    if (max < 0)
        max = 0;

    if ((held & 0x40) && min < gDebugTextSt.top)
        gDebugTextSt.top--;

    if ((held & 0x80) && max > gDebugTextSt.top)
        gDebugTextSt.top++;

    return 1;
}

void SetupDebugFontForOBJ(int vramoff, int palid)
{
    if (vramoff < 0)
        vramoff = 0x3000;

    vramoff &= 0xFFFF;

    gDebugObjChr = vramoff / 32;
    gDebugObjPal = (palid & 0xF) << 12;

    RegisterDataMove(Img_DebugFont, (void *)(VRAM + ((vramoff + 0x10000) & 0x1FFFF)), 0x800);

    gPal[(palid + 0x10) * 0x10 + 0] = RGB(0, 0, 0);
    gPal[(palid + 0x10) * 0x10 + 1] = RGB(0, 0, 31);
    gPal[(palid + 0x10) * 0x10 + 2] = RGB(31, 31, 31);

    EnablePalSync();
}

void DebugPutObjStr(int x, int y, char const * str)
{
    while (*str != 0)
    {
        u8 c;

        if (*str > 0x60)
            c = *str - 0x40;
        else
            c = *str - 0x20;

        PutOamHiRam(x, y, Sprite_8x8, c + gDebugObjChr + gDebugObjPal);

        x += 8;
        str++;
    }
}

void DebugPutObjNumber(int x, int y, int number, int length)
{
    GenNumberStr(number);
    DebugPutObjStr(x, y, gNumberStr + 8 - length);
}

void DebugPutObjNumberHex(int x, int y, int number, int length)
{
    GenNumberHexStr(number);
    DebugPutObjStr(x, y, gNumberStr + 8 - length);
}
