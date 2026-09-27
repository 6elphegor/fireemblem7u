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
extern struct Font gDefaultFont;
extern struct Font * gActiveFont;
extern u8 gLang;
extern struct SpecialCharSt sSpecialCharStList[];
extern struct Glyph const * const TextGlyphs_System[];
extern struct Glyph const * const TextGlyphs_Talk[];
extern u16 const * const TextColorLutTable[];
extern struct Glyph const * const TextGlyphs_Special[];
extern u16 const Pal_GreenTextColors[];
extern struct ProcCmd CONST_DATA ProcScr_TextPrint[];
extern struct ProcCmd CONST_DATA ProcScr_GreenTextColor[];

struct TextPrintProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Text * text;
    /* 30 */ char const * str;
    /* 34 */ s8 interval;
    /* 35 */ s8 clock;
    /* 36 */ s8 char_per_tick;
};

u8 * GetTextDrawDest(struct Text * text);
u16 const * GetColorLut(int color);
void DrawTextGlyph(struct Text * text, struct Glyph const * glyph);
void DrawTextGlyphNoClear(struct Text * text, struct Glyph const * glyph);
void Text_DrawStringAscii(struct Text * text, char const * str);
char const * Text_DrawCharacterAscii(struct Text * text, char const * str);
char const * GetCharTextLenAscii(char const * str, int * out_width);
int GetStringTextLenAscii(char const * str);
u8 * GetSpriteTextDrawDest(struct Text * text);
void DrawSpriteTextGlyph(struct Text * text, struct Glyph const * glyph);
int GetSpecialCharChr(int color, int id);
void DrawSpecialCharGlyph(int chr, int color, struct Glyph const * glyph);

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

void DebugPutStr(u16 * tm, char const * str)
{
    while (*str != 0)
    {
        int chr;

        if (*str > 0x60)
        {
            chr = gDebugTextSt.chr + (u16) -0x40;
            *tm = *str + chr;
        }
        else
        {
            chr = gDebugTextSt.chr + (u16) -0x20;
            *tm = *str + chr;
        }

        tm++;
        str++;
    }

    EnableBgSyncById(gDebugTextSt.bg);
}

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
    static char const hex_digits[] = "0123456789ABCDEF";
    int i;

    ClearNumberStr();

    for (i = 7; i >= 0; i--)
    {
        gNumberStr[i] = hex_digits[number & 0xF];
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

int GetLang(void)
{
    return 0;
}

void SetLang(int lang)
{
    gLang = lang;
}

void ResetText(void)
{
    InitTextFont(&gDefaultFont, (void *)(VRAM + 0x1000), 0x80, 0);
    sSpecialCharStList[0].color = -1;
}

void InitTextFont(struct Font * font, void * draw_dest, int chr, int palid)
{
    if (font == NULL)
        font = &gDefaultFont;

    font->draw_dest = draw_dest;
    font->get_draw_dest = GetTextDrawDest;
    font->palid = palid;
    font->tileref = TILEREF(chr, palid);
    font->chr_counter = 0;
    font->lang = GetLang();

    SetTextFont(font);
    InitSystemTextFont();
}

void SetTextFontGlyphs(int glyphset)
{
    if (glyphset == TEXT_GLYPHS_SYSTEM)
        gActiveFont->glyphs = TextGlyphs_System;
    else
        gActiveFont->glyphs = TextGlyphs_Talk;
}

void ResetTextFont(void)
{
    gActiveFont->chr_counter = 0;
    sSpecialCharStList[0].color = -1;
}

void SetTextFont(struct Font * font)
{
    if (font == NULL)
        gActiveFont = &gDefaultFont;
    else
        gActiveFont = font;
}

void InitText(struct Text * text, int width)
{
    text->chr_position = gActiveFont->chr_counter;
    text->tile_width = width;
    text->db_id = 0;
    text->db_enabled = FALSE;
    text->is_printing = FALSE;

    gActiveFont->chr_counter += width;

    ClearText(text);
}

void InitTextDb(struct Text * text, int width)
{
    text->chr_position = gActiveFont->chr_counter;
    text->tile_width = width;
    text->db_id = 0;
    text->db_enabled = TRUE;
    text->is_printing = FALSE;

    gActiveFont->chr_counter += width * 2;
}

void InitTextList(struct TextInitInfo const * info)
{
    while (info->text != NULL)
    {
        InitText(info->text, info->width);
        info++;
    }
}

void ClearText(struct Text * text)
{
    text->x = 0;
    text->color = TEXT_COLOR_SYSTEM_WHITE;

    CpuFastFill16(0, gActiveFont->get_draw_dest(text), text->tile_width * 2 * CHR_SIZE);
}

void ClearTextPart(struct Text * text, int tile_off, int tile_width)
{
    u8 * dest = gActiveFont->draw_dest + (text->db_id * text->tile_width + text->chr_position + tile_off) * 2 * CHR_SIZE;
    CpuFastFill16(0, dest, tile_width * 2 * CHR_SIZE);
}

int Text_GetChrOffset(struct Text * text)
{
    return (text->db_id * text->tile_width + text->chr_position) * 2;
}

int Text_GetCursor(struct Text * text)
{
    return text->x;
}

void Text_SetCursor(struct Text * text, int x)
{
    text->x = x;
}

void Text_Skip(struct Text * text, int x)
{
    text->x += x;
}

void Text_SetColor(struct Text * text, int color)
{
    text->color = color;
}

int Text_GetColor(struct Text * text)
{
    return text->color;
}

void Text_SetParams(struct Text * text, int x, int color)
{
    text->x = x;
    text->color = color;
}

void PutText(struct Text * text, u16 * tm)
{
    int i;
    int tileref = gActiveFont->tileref + (text->db_id * text->tile_width + text->chr_position) * 2;

    for (i = 0; i < text->tile_width; i++)
    {
        tm[0x00] = tileref++;
        tm[0x20] = tileref++;
        tm++;
    }

    if (*(s8 *) &text->db_enabled != 0)
        text->db_id ^= 1;
}

void PutBlankText(struct Text * text, u16 * tm)
{
    int i;

    for (i = 0; i < text->tile_width; i++)
    {
        tm[0x00] = 0;
        tm[0x20] = 0;
        tm++;
    }
}

int GetStringTextLen(char const * str)
{
    int width = 0;
    struct Glyph const * glyph;
    u8 byte1;
    u8 byte2;

    if (gActiveFont->lang != 5)
        return GetStringTextLenAscii(str);

    while (*str != 0 && *str != 1)
    {
        byte1 = *str++;

        if (byte1 >= 0x20)
        {
            byte2 = *str++;
            glyph = gActiveFont->glyphs[byte2 - 0x40];

            while (glyph != NULL)
            {
                if (glyph->sjis_byte_1 == byte1)
                {
                    width += glyph->width;
                    break;
                }

                glyph = glyph->next;
            }
        }
    }

    return width;
}

char const * GetCharTextLen(char const * str, int * out_width)
{
    struct Glyph const * glyph;
    u8 byte1;
    u8 byte2;

    if (gActiveFont->lang != 5)
        return GetCharTextLenAscii(str, out_width);

    byte1 = *str++;
    byte2 = *str++;

    glyph = gActiveFont->glyphs[byte2 - 0x40];

    while (glyph != NULL)
    {
        if (glyph->sjis_byte_1 == byte1)
        {
            *out_width = glyph->width;
            break;
        }

        glyph = glyph->next;
    }

    return str;
}

int GetStringTextCenteredPos(int area_length, char const * str)
{
    return (area_length - GetStringTextLen(str)) / 2;
}

void GetStringTextBox(char const * str, int * out_width, int * out_height)
{
    *out_width = 0;
    *out_height = 0;

    str = MsgExpand();

    while (*str != 0 && *str != 1)
    {
        int width = GetStringTextLen(str);

        if (*out_width < width)
            *out_width = width;

        *out_height += 16;

        str = GetStringLineEnd(str);

        if (*str == 0)
            break;

        str++;
    }
}

char const * GetStringLineEnd(char const * str)
{
    while (*str > 1)
        str++;

    return str;
}

void Text_DrawString(struct Text * text, char const * str)
{
    struct Glyph const * glyph;
    u8 byte1;
    u8 byte2;

    if (gActiveFont->lang != 5)
    {
        Text_DrawStringAscii(text, str);
        return;
    }

    while (*str != 0 && *str != 1)
    {
        byte1 = *str++;

        if (byte1 >= 0x20)
        {
            byte2 = *str++;

        retry:
            glyph = gActiveFont->glyphs[byte2 - 0x40];

            while (glyph != NULL)
            {
                if (glyph->sjis_byte_1 == byte1)
                {
                    gActiveFont->draw_glyph(text, glyph);
                    break;
                }

                glyph = glyph->next;

                if (glyph == NULL)
                {
                    byte1 = 0x81;
                    byte2 = 0xA7;
                    goto retry;
                }
            }
        }
    }
}

void Text_DrawNumber(struct Text * text, int number)
{
    if (number == 0)
    {
        Text_DrawCharacter(text, "0");
        return;
    }

    while (number != 0)
    {
        u16 c = '0' + number % 10;
        number /= 10;

        Text_DrawCharacter(text, (char const *) &c);
        text->x -= 15;
    }
}

void Text_DrawNumberOrBlank(struct Text * text, int number)
{
    if (number == 255 || number == -1)
    {
        Text_Skip(text, -8);
        Text_DrawString(text, DecodeMsg(0x127C));
        return;
    }

    Text_DrawNumber(text, number);
}

char const * Text_DrawCharacter(struct Text * text, char const * str)
{
    struct Glyph const * glyph;
    u8 byte1;
    u8 byte2;

    if (gActiveFont->lang != 5)
        return Text_DrawCharacterAscii(text, str);

    byte1 = *str++;
    byte2 = *str++;

retry:
    glyph = gActiveFont->glyphs[byte2 - 0x40];

    while (glyph != NULL)
    {
        if (glyph->sjis_byte_1 == byte1)
        {
            gActiveFont->draw_glyph(text, glyph);
            break;
        }

        glyph = glyph->next;
    }

    if (glyph == NULL)
    {
        byte1 = 0x81;
        byte2 = 0xA7;
        goto retry;
    }

    return str;
}

u8 * GetTextDrawDest(struct Text * text)
{
    int chr = text->db_id * text->tile_width + text->chr_position + text->x / 8;
    return gActiveFont->draw_dest + chr * 2 * CHR_SIZE;
}

u16 const * GetColorLut(int color)
{
    return TextColorLutTable[color];
}

void DrawTextGlyph(struct Text * text, struct Glyph const * glyph)
{
    u8 * draw_dest = gActiveFont->get_draw_dest(text);
    int subx = text->x & 7;
    u32 const * bitmap = glyph->bitmap;

    DrawGlyphRam(GetColorLut(text->color), draw_dest, bitmap, subx);
    text->x += glyph->width;
}

void DrawTextGlyphNoClear(struct Text * text, struct Glyph const * glyph)
{
    int i;

    u32 * dst = (u32 *) gActiveFont->get_draw_dest(text);
    int subx = text->x & 7;
    u32 const * bitmap = glyph->bitmap;

    u64 row;

    u16 const * mask_lut = GetColorLut(TEXT_COLOR_MASK);
    u16 const * color_lut = GetColorLut(text->color);

    for (i = 0; i < 16; i++)
    {
        row = (u64) *bitmap << subx * 2;

        dst[0x00] &= mask_lut[row & 0xFF] | (mask_lut[(row >> 8) & 0xFF] << 16);
        dst[0x00] |= color_lut[row & 0xFF] | (color_lut[(row >> 8) & 0xFF] << 16);

        dst[0x10] &= mask_lut[(row >> 16) & 0xFF] | (mask_lut[(row >> 24) & 0xFF] << 16);
        dst[0x10] |= color_lut[(row >> 16) & 0xFF] | (color_lut[(row >> 24) & 0xFF] << 16);

        dst[0x20] &= mask_lut[(row >> 32) & 0xFF] | (mask_lut[(row >> 40) & 0xFF] << 16);
        dst[0x20] |= color_lut[(row >> 32) & 0xFF] | (color_lut[(row >> 40) & 0xFF] << 16);

        dst++;
        bitmap++;
    }

    text->x += glyph->width;
}

void InitSystemTextFont(void)
{
    ApplyPalette(Pal_Text, gActiveFont->palid);
    PAL_COLOR(gActiveFont->palid, 0) = 0;

    gActiveFont->draw_glyph = DrawTextGlyph;
    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);
}

void InitTalkTextFont(void)
{
    ApplyPalette(Pal_Text + 0x10, gActiveFont->palid);
    PAL_COLOR(gActiveFont->palid, 0) = 0;

    gActiveFont->draw_glyph = DrawTextGlyph;
    SetTextFontGlyphs(TEXT_GLYPHS_TALK);
}

void SetTextDrawNoClear(void)
{
    gActiveFont->draw_glyph = DrawTextGlyphNoClear;
}

void PutDrawText(struct Text * text, u16 * tm, int color, int x, int tile_width, char const * str)
{
    struct Text tmp_text;

    if (text == NULL)
    {
        text = &tmp_text;
        InitText(text, tile_width);
    }

    Text_SetCursor(text, x);
    Text_SetColor(text, color);
    Text_DrawString(text, str);

    PutText(text, tm);
}

void Text_InsertDrawString(struct Text * text, int x, int color, char const * str)
{
    Text_SetCursor(text, x);
    Text_SetColor(text, color);
    Text_DrawString(text, str);
}

void Text_InsertDrawNumberOrBlank(struct Text * text, int x, int color, int number)
{
    Text_SetCursor(text, x);
    Text_SetColor(text, color);
    Text_DrawNumberOrBlank(text, number);
}

void Text_DrawStringAscii(struct Text * text, char const * str)
{
    while (*str != 0 && *str != 1)
    {
        struct Glyph const * glyph = gActiveFont->glyphs[(u8) *str++];

        if (glyph == NULL)
            glyph = gActiveFont->glyphs['?'];

        gActiveFont->draw_glyph(text, glyph);
    }
}

char const * Text_DrawCharacterAscii(struct Text * text, char const * str)
{
    struct Glyph const * glyph = gActiveFont->glyphs[(u8) *str++];

    if (glyph == NULL)
        glyph = gActiveFont->glyphs['?'];

    gActiveFont->draw_glyph(text, glyph);
    return str;
}

char const * GetCharTextLenAscii(char const * str, int * out_width)
{
    struct Glyph const * glyph = gActiveFont->glyphs[(u8) *str++];

    if (glyph == NULL)
        glyph = gActiveFont->glyphs['?'];

    *out_width = glyph->width;
    return str;
}

int GetStringTextLenAscii(char const * str)
{
    int width = 0;

    while (*str != 0 && *str != 1)
    {
        struct Glyph const * glyph = gActiveFont->glyphs[(u8) *str++];
        width += glyph->width;
    }

    return width;
}

void TextNop(void)
{
}

void InitSpriteTextFont(struct Font * font, u8 * draw_dest, int palid)
{
    font->draw_dest = draw_dest;
    font->get_draw_dest = GetSpriteTextDrawDest;
    font->palid = (palid & 0xF) + 0x10;
    font->tileref = ((uintptr_t) draw_dest & 0x1FFFF) >> 5;
    font->chr_counter = 0;
    font->lang = GetLang();

    SetTextFont(font);

    font->draw_glyph = DrawSpriteTextGlyph;
}

void InitSpriteText(struct Text * text)
{
    text->chr_position = gActiveFont->chr_counter;
    text->tile_width = 32;
    text->db_id = 0;
    text->db_enabled = FALSE;
    text->is_printing = FALSE;

    gActiveFont->chr_counter += 64;

    text->x = 0;
    text->color = 0;
}

void SpriteText_DrawBackground(struct Text * text)
{
    if (text->tile_width != 0)
    {
        text->x = 0;
        CpuFastFill(0x44444444, gActiveFont->get_draw_dest(text), 0x360);
        CpuFastFill(0x44444444, gActiveFont->get_draw_dest(text) + 0x400, 0x360);
    }
}

void SpriteText_DrawBackgroundExt(struct Text * text, u32 line)
{
    text->x = 0;
    CpuFastFill(line, gActiveFont->get_draw_dest(text), 0x800);
}

u8 * GetSpriteTextDrawDest(struct Text * text)
{
    int chr = text->db_id * text->tile_width + text->chr_position + text->x / 8;
    return gActiveFont->draw_dest + chr * CHR_SIZE;
}

void DrawSpriteTextGlyph(struct Text * text, struct Glyph const * glyph)
{
    u64 row;
    int i;
    u32 * dst = (u32 *) gActiveFont->get_draw_dest(text);
    int subx = text->x & 7;
    u32 const * bitmap = glyph->bitmap;
    u16 const * lut = GetColorLut(text->color);

    for (i = 0; i < 8; i++)
    {
        row = (u64) *bitmap << subx * 2;
        bitmap++;

        dst[0x00] |= lut[row & 0xFF] | (lut[(row >> 8) & 0xFF] << 16);
        dst[0x08] |= lut[(row >> 16) & 0xFF] | (lut[(row >> 24) & 0xFF] << 16);
        dst[0x10] |= lut[(row >> 32) & 0xFF] | (lut[(row >> 40) & 0xFF] << 16);

        dst++;
    }

    dst = (u32 *) (gActiveFont->get_draw_dest(text) + 0x400);

    for (i = 0; i < 8; i++)
    {
        row = (u64) *bitmap << subx * 2;
        bitmap++;

        dst[0x00] |= lut[row & 0xFF] | (lut[(row >> 8) & 0xFF] << 16);
        dst[0x08] |= lut[(row >> 16) & 0xFF] | (lut[(row >> 24) & 0xFF] << 16);
        dst[0x10] |= lut[(row >> 32) & 0xFF] | (lut[(row >> 40) & 0xFF] << 16);

        dst++;
    }

    text->x += glyph->width;
}

void TextPrint_OnLoop(struct TextPrintProc * proc)
{
    int i;

    proc->clock--;

    if (proc->clock > 0)
        return;

    proc->clock = proc->interval;

    for (i = 0; i < proc->char_per_tick; i++)
    {
        switch (*proc->str)
        {
        case 0:
        case 1:
            proc->text->is_printing = FALSE;
            Proc_Break(proc);
            return;

        case 4:
            proc->str++;
            Text_Skip(proc->text, 6);
            break;

        default:
            proc->str = Text_DrawCharacter(proc->text, proc->str);
        }
    }
}

char const * StartTextPrint(struct Text * text, char const * str, int interval, int char_per_tick)
{
    struct TextPrintProc * proc;

    if (interval == 0)
        Text_DrawString(text, str);

    if (char_per_tick == 0)
        char_per_tick = 1;

    proc = Proc_Start(ProcScr_TextPrint, PROC_TREE_3);

    proc->text = text;
    proc->str = str;
    proc->char_per_tick = char_per_tick;
    proc->interval = interval;
    proc->clock = 0;

    text->is_printing = TRUE;

    return GetStringLineEnd(str);
}

bool IsTextPrinting(struct Text * text)
{
    return (s8) text->is_printing;
}

void EndTextPrinting(void)
{
    Proc_EndEach(ProcScr_TextPrint);
}

void GreenText_OnLoop(void)
{
    u32 index = (GetGameTime() / 4) % 16;
    PAL_BG_COLOR(0, 14) = *(Pal_GreenTextColors + index);
    EnablePalSync();
}

void StartGreenText(ProcPtr parent)
{
    if (parent != NULL)
        Proc_Start(ProcScr_GreenTextColor, parent);
    else
        Proc_Start(ProcScr_GreenTextColor, PROC_TREE_3);
}

void EndGreenText(void)
{
    Proc_EndEach(ProcScr_GreenTextColor);
}

void PutTextPart(struct Text * text, u16 * tm, int length)
{
    int tileref = gActiveFont->tileref + (text->db_id * text->tile_width + text->chr_position) * 2;
    int i;

    for (i = 0; i < text->tile_width && i < length; i++)
    {
        tm[0x00] = tileref++;
        tm[0x20] = tileref++;
        tm++;
    }

    if (*(s8 *) &text->db_enabled != 0)
        text->db_id ^= 1;
}

void TextNop2(void)
{
}

#if NONMATCHING
// the lut loads get moved next to their uses; the original keeps both loads early (dst ends up in r8)
void DrawSpecialCharGlyph(int chr, int color, struct Glyph const * glyph)
{
    int i;
    u32 * dst = (u32 *) (gActiveFont->draw_dest + chr * 64);
    u32 * src = (u32 *) glyph->bitmap;
    u16 * lut = (u16 *) GetColorLut(color);

    for (i = 0; i < 16; i++)
    {
        u32 bits = *src++;
        u16 lo = lut[bits & 0xFF];
        u16 hi = lut[(bits >> 8) & 0xFF];

        *dst++ = (hi << 16) + lo;
    }
}
#else
ASM_FUNC("asm/nonmatching/code_08006084.s");
#endif

int AddSpecialChar(struct SpecialCharSt * st, int color, int id)
{
    st->color = color;
    st->id = id;
    st->chr_position = gActiveFont->chr_counter++;

    (st + 1)->color = -1;

    DrawSpecialCharGlyph(st->chr_position, color, TextGlyphs_Special[id]);

    return st->chr_position;
}

int GetSpecialCharChr(int color, int id)
{
    struct SpecialCharSt * it = sSpecialCharStList;

    while (TRUE)
    {
        if (it->color < 0)
            return AddSpecialChar(it, color, id);

        if (it->color == color && it->id == id)
            return it->chr_position;

        it++;
    }
}

void PutSpecialChar(u16 * tm, int color, int id)
{
    int chr;

    if (id == TEXT_SPECIAL_NOTHING)
    {
        tm[0x00] = 0;
        tm[0x20] = 0;
        return;
    }

    chr = GetSpecialCharChr(color, id) * 2 + gActiveFont->tileref;

    tm[0x00] = chr;
    tm[0x20] = chr + 1;
}

void PutNumberExt(u16 * tm, int color, int number, int id_zero)
{
    if (number == 0)
    {
        PutSpecialChar(tm, color, id_zero);
        return;
    }

    while (number != 0)
    {
        PutSpecialChar(tm, color, number % 10 + id_zero);
        number /= 10;

        tm--;
    }
}

void PutNumber(u16 * tm, int color, int number)
{
    PutNumberExt(tm, color, number, TEXT_SPECIAL_BIGNUM_0);
}

void PutNumberOrBlank(u16 * tm, int color, int number)
{
    if (number < 0 || number == 0xFF)
        PutTwoSpecialChar(tm - 1, color, TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);
    else
        PutNumber(tm, color, number);
}

void PutNumberTwoChr(u16 * tm, int color, int number)
{
    if (number == 100)
        PutTwoSpecialChar(tm - 1, color, TEXT_SPECIAL_100_A, TEXT_SPECIAL_100_B);
    else if (number < 0 || number == 255)
        PutTwoSpecialChar(tm - 1, color, TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);
    else
        PutNumber(tm, color, number);
}

void PutNumberSmall(u16 * tm, int color, int number)
{
    PutNumberExt(tm, color, number, TEXT_SPECIAL_SMALLNUM_0);
}

void PutNumberBonus(int number, u16 * tm)
{
    if (number == 0)
        return;

    PutSpecialChar(tm, TEXT_COLOR_SYSTEM_GREEN, TEXT_SPECIAL_PLUS);
    PutNumberSmall(tm + ((number >= 10) ? 2 : 1), TEXT_COLOR_SYSTEM_GREEN, number);
}

void SpecialCharTest(void)
{
    int ix, iy;
    int cnt = GetGameTime();

    for (iy = 0; iy < 10; iy++)
        for (ix = 0; ix < 30; ix++)
            PutSpecialChar(gBg0Tm + TM_OFFSET(ix, iy * 2), TEXT_COLOR_SYSTEM_WHITE, (cnt++) & 1);

    EnableBgSync(BG0_SYNC_BIT);
}

inline void PutNumber2DigitExt(u16 * tm, int color, int number, int id_zero)
{
    PutSpecialChar(tm, color, number % 10 + id_zero);
    PutSpecialChar(tm - 1, color, (number / 10) % 10 + id_zero);
}

inline void PutNumber2Digit(u16 * tm, int color, int number)
{
    PutNumber2DigitExt(tm, color, number, TEXT_SPECIAL_BIGNUM_0);
}

inline void PutNumber2DigitSmall(u16 * tm, int color, int number)
{
    PutNumber2DigitExt(tm, color, number, TEXT_SPECIAL_SMALLNUM_0);
}

void PutTime(u16 * tm, int color, int time, bool always_display_punctuation)
{
    u16 hours, minutes, seconds;
    s8 hs = FormatTime(time, &hours, &minutes, &seconds);

    PutNumber(tm + 2, color, hours);
    PutNumber2Digit(tm + 5, color, minutes);
    PutNumber2DigitSmall(tm + 8, color, seconds);

    if (hs == FALSE || always_display_punctuation)
    {
        PutSpecialChar(tm + 3, color, TEXT_SPECIAL_COLON);
        PutSpecialChar(tm + 6, color, TEXT_SPECIAL_DOT);
    }
    else
    {
        PutSpecialChar(tm + 3, color, TEXT_SPECIAL_NOTHING);
        PutSpecialChar(tm + 6, color, TEXT_SPECIAL_NOTHING);
    }
}

void PutTwoSpecialChar(u16 * tm, int color, int id_a, int id_b)
{
    PutSpecialChar(tm++, color, id_a);
    PutSpecialChar(tm, color, id_b);
}
