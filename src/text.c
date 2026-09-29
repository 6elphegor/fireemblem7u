#include "gbafe.h"

extern const struct Glyph Glyph_Special_00[], Glyph_Special_01[], Glyph_Special_02[],
    Glyph_Special_03[], Glyph_Special_04[], Glyph_Special_05[], Glyph_Special_06[],
    Glyph_Special_07[], Glyph_Special_08[], Glyph_Special_09[], Glyph_Special_0A[],
    Glyph_Special_0B[], Glyph_Special_0C[], Glyph_Special_0D[], Glyph_Special_0E[],
    Glyph_Special_0F[], Glyph_Special_10[], Glyph_Special_11[], Glyph_Special_12[],
    Glyph_Special_13[], Glyph_Special_14[], Glyph_Special_15[], Glyph_Special_16[],
    Glyph_Special_17[], Glyph_Special_18[], Glyph_Special_19[], Glyph_Special_1A[],
    Glyph_Special_1B[], Glyph_Special_1C[], Glyph_Special_1D[], Glyph_Special_1E[],
    Glyph_Special_1F[], Glyph_Special_20[], Glyph_Special_21[], Glyph_Special_22[],
    Glyph_Special_23[], Glyph_Special_24[], Glyph_Special_25[], Glyph_Special_26[],
    Glyph_Special_27[], Glyph_Special_28[], Glyph_Special_29[], Glyph_Special_2A[],
    Glyph_Special_2B[], Glyph_Special_2C[], Glyph_Special_2D[], Glyph_Special_2E[],
    Glyph_Special_2F[], Glyph_Special_30[], Glyph_Special_31[], Glyph_Special_32[],
    Glyph_Special_33[], Glyph_Special_34[], Glyph_Special_35[], Glyph_Special_36[],
    Glyph_Special_37[], Glyph_Special_38[], Glyph_Special_39[], Glyph_Special_3A[],
    Glyph_Special_3B[], Glyph_Special_3C[], Glyph_Special_3D[], Glyph_Special_3E[],
    Glyph_Special_3F[], Glyph_Special_40[], Glyph_Special_41[], Glyph_Special_42[],
    Glyph_Special_43[], Glyph_Special_44[], Glyph_Special_45[], Glyph_Special_46[],
    Glyph_Special_47[], Glyph_Special_48[], Glyph_Special_49[], Glyph_Special_4A[],
    Glyph_Special_4B[], Glyph_Special_4C[], Glyph_Special_4D[], Glyph_Special_4E[],
    Glyph_Special_4F[], Glyph_Special_50[], Glyph_Special_51[], Glyph_Special_52[],
    Glyph_Special_53[], Glyph_Special_54[], Glyph_Special_55[], Glyph_Special_56[],
    Glyph_Special_57[], Glyph_Special_58[], Glyph_Special_59[], Glyph_Special_5A[],
    Glyph_Special_5B[], Glyph_Special_5C[], Glyph_Special_5D[], Glyph_Special_5E[],
    Glyph_Special_5F[], Glyph_Special_60[], Glyph_Special_61[], Glyph_Special_62[],
    Glyph_Special_63[], Glyph_Special_64[], Glyph_Special_65[], Glyph_Special_66[],
    Glyph_Special_67[], Glyph_Special_68[], Glyph_Special_69[], Glyph_Special_6A[],
    Glyph_Special_6B[], Glyph_Special_6C[], Glyph_Special_6D[], Glyph_Special_6E[],
    Glyph_Special_6F[], Glyph_Special_70[], Glyph_Special_71[], Glyph_Special_72[],
    Glyph_Special_73[], Glyph_Special_74[], Glyph_Special_75[], Glyph_Special_76[],
    Glyph_Special_77[], Glyph_Special_78[], Glyph_Special_79[], Glyph_Special_7A[],
    Glyph_Special_7B[], Glyph_Special_7C[], Glyph_Special_7D[], Glyph_Special_7E[],
    Glyph_Special_7F[], Glyph_Special_80[], Glyph_Special_81[], Glyph_Special_82[],
    Glyph_Special_83[], Glyph_Special_84[], Glyph_Special_85[], Glyph_Special_86[],
    Glyph_Special_87[], Glyph_Special_88[], Glyph_Special_89[], Glyph_Special_8A[],
    Glyph_Special_8B[], Glyph_Special_8C[], Glyph_Special_8D[], Glyph_Special_8E[],
    Glyph_Special_8F[], Glyph_Special_90[], Glyph_Special_91[], Glyph_Special_92[],
    Glyph_Special_93[], Glyph_Special_94[], Glyph_Special_95[], Glyph_Special_96[],
    Glyph_Special_97[], Glyph_Special_98[], Glyph_Special_99[], Glyph_Special_9A[],
    Glyph_Special_9B[], Glyph_Special_9C[], Glyph_Special_9D[], Glyph_Special_9E[],
    Glyph_Special_9F[], Glyph_Special_A0[], Glyph_Special_A1[], Glyph_Special_A2[],
    Glyph_Special_A3[], Glyph_Special_A4[], Glyph_Special_A5[], Glyph_Special_A6[],
    Glyph_Special_A7[], Glyph_Special_A8[], Glyph_Special_A9[], Glyph_Special_AA[],
    Glyph_Special_AB[], Glyph_Special_AC[], Glyph_Special_AD[], Glyph_Special_AE[],
    Glyph_Special_AF[], Glyph_Special_B0[], Glyph_Special_B1[], Glyph_Special_B2[],
    Glyph_Special_B3[], Glyph_Special_B4[], Glyph_Special_B5[], Glyph_Special_B6[],
    Glyph_Special_B7[], Glyph_Special_B8[], Glyph_Special_B9[], Glyph_Special_BA[],
    Glyph_Special_BB[], Glyph_Special_BC[], Glyph_Special_BD[], Glyph_Special_BE[],
    Glyph_Special_BF[], Glyph_Special_C0[], Glyph_Special_C1[], Glyph_Special_C2[],
    Glyph_Special_C3[], Glyph_Special_C4[], Glyph_Special_C5[], Glyph_Special_C6[],
    Glyph_Special_C7[], Glyph_Special_C8[], Glyph_Special_C9[], Glyph_Special_CA[],
    Glyph_Special_CB[], Glyph_Special_CC[], Glyph_Special_CD[], Glyph_Special_CE[],
    Glyph_Special_CF[], Glyph_Special_D0[], Glyph_Special_D1[], Glyph_Special_D2[],
    Glyph_Special_D3[], Glyph_Special_D4[], Glyph_Special_D5[], Glyph_Special_D6[],
    Glyph_Special_D7[], Glyph_Special_D8[], Glyph_Special_D9[], Glyph_Special_DA[],
    Glyph_Special_DB[], Glyph_Special_DC[], Glyph_Special_DD[], Glyph_Special_DE[],
    Glyph_Special_DF[], Glyph_Special_E0[], Glyph_Special_E1[], Glyph_Special_E2[],
    Glyph_Special_E3[], Glyph_Special_E4[], Glyph_Special_E5[], Glyph_Special_E6[],
    Glyph_Special_E7[], Glyph_Special_E8[], Glyph_Special_E9[], Glyph_Special_EA[],
    Glyph_Special_EB[], Glyph_Special_EC[], Glyph_Special_ED[], Glyph_Special_EE[],
    Glyph_Special_EF[], Glyph_Special_F0[], Glyph_Special_F1[], Glyph_Special_F2[],
    Glyph_Special_F3[], Glyph_Special_F4[], Glyph_Special_F5[], Glyph_Special_F6[],
    Glyph_Special_F7[], Glyph_Special_F8[], Glyph_Special_F9[], Glyph_Special_FA[],
    Glyph_Special_FB[], Glyph_Special_FC[], Glyph_Special_FD[], Glyph_Special_FE[],
    Glyph_Special_FF[], Glyph_System_1F[], Glyph_System_20[], Glyph_System_21[], Glyph_System_22[],
    Glyph_System_23[], Glyph_System_24[], Glyph_System_25[], Glyph_System_26[], Glyph_System_27[],
    Glyph_System_28[], Glyph_System_29[], Glyph_System_2A[], Glyph_System_2B[], Glyph_System_2C[],
    Glyph_System_2D[], Glyph_System_2E[], Glyph_System_2F[], Glyph_System_30[], Glyph_System_31[],
    Glyph_System_32[], Glyph_System_33[], Glyph_System_34[], Glyph_System_35[], Glyph_System_36[],
    Glyph_System_37[], Glyph_System_38[], Glyph_System_39[], Glyph_System_3A[], Glyph_System_3B[],
    Glyph_System_3C[], Glyph_System_3D[], Glyph_System_3E[], Glyph_System_3F[], Glyph_System_40[],
    Glyph_System_41[], Glyph_System_42[], Glyph_System_43[], Glyph_System_44[], Glyph_System_45[],
    Glyph_System_46[], Glyph_System_47[], Glyph_System_48[], Glyph_System_49[], Glyph_System_4A[],
    Glyph_System_4B[], Glyph_System_4C[], Glyph_System_4D[], Glyph_System_4E[], Glyph_System_4F[],
    Glyph_System_50[], Glyph_System_51[], Glyph_System_52[], Glyph_System_53[], Glyph_System_54[],
    Glyph_System_55[], Glyph_System_56[], Glyph_System_57[], Glyph_System_58[], Glyph_System_59[],
    Glyph_System_5A[], Glyph_System_5B[], Glyph_System_5C[], Glyph_System_5D[], Glyph_System_5E[],
    Glyph_System_5F[], Glyph_System_60[], Glyph_System_61[], Glyph_System_62[], Glyph_System_63[],
    Glyph_System_64[], Glyph_System_65[], Glyph_System_66[], Glyph_System_67[], Glyph_System_68[],
    Glyph_System_69[], Glyph_System_6A[], Glyph_System_6B[], Glyph_System_6C[], Glyph_System_6D[],
    Glyph_System_6E[], Glyph_System_6F[], Glyph_System_70[], Glyph_System_71[], Glyph_System_72[],
    Glyph_System_73[], Glyph_System_74[], Glyph_System_75[], Glyph_System_76[], Glyph_System_77[],
    Glyph_System_78[], Glyph_System_79[], Glyph_System_7A[], Glyph_System_7B[], Glyph_System_7C[],
    Glyph_System_7D[], Glyph_System_7E[], Glyph_System_7F[], Glyph_Talk_1F[], Glyph_Talk_20[],
    Glyph_Talk_21[], Glyph_Talk_22[], Glyph_Talk_23[], Glyph_Talk_24[], Glyph_Talk_25[],
    Glyph_Talk_26[], Glyph_Talk_27[], Glyph_Talk_28[], Glyph_Talk_29[], Glyph_Talk_2A[],
    Glyph_Talk_2B[], Glyph_Talk_2C[], Glyph_Talk_2D[], Glyph_Talk_2E[], Glyph_Talk_2F[],
    Glyph_Talk_30[], Glyph_Talk_31[], Glyph_Talk_32[], Glyph_Talk_33[], Glyph_Talk_34[],
    Glyph_Talk_35[], Glyph_Talk_36[], Glyph_Talk_37[], Glyph_Talk_38[], Glyph_Talk_39[],
    Glyph_Talk_3A[], Glyph_Talk_3B[], Glyph_Talk_3C[], Glyph_Talk_3D[], Glyph_Talk_3E[],
    Glyph_Talk_3F[], Glyph_Talk_40[], Glyph_Talk_41[], Glyph_Talk_42[], Glyph_Talk_43[],
    Glyph_Talk_44[], Glyph_Talk_45[], Glyph_Talk_46[], Glyph_Talk_47[], Glyph_Talk_48[],
    Glyph_Talk_49[], Glyph_Talk_4A[], Glyph_Talk_4B[], Glyph_Talk_4C[], Glyph_Talk_4D[],
    Glyph_Talk_4E[], Glyph_Talk_4F[], Glyph_Talk_50[], Glyph_Talk_51[], Glyph_Talk_52[],
    Glyph_Talk_53[], Glyph_Talk_54[], Glyph_Talk_55[], Glyph_Talk_56[], Glyph_Talk_57[],
    Glyph_Talk_58[], Glyph_Talk_59[], Glyph_Talk_5A[], Glyph_Talk_5B[], Glyph_Talk_5C[],
    Glyph_Talk_5D[], Glyph_Talk_5E[], Glyph_Talk_5F[], Glyph_Talk_60[], Glyph_Talk_61[],
    Glyph_Talk_62[], Glyph_Talk_63[], Glyph_Talk_64[], Glyph_Talk_65[], Glyph_Talk_66[],
    Glyph_Talk_67[], Glyph_Talk_68[], Glyph_Talk_69[], Glyph_Talk_6A[], Glyph_Talk_6B[],
    Glyph_Talk_6C[], Glyph_Talk_6D[], Glyph_Talk_6E[], Glyph_Talk_6F[], Glyph_Talk_70[],
    Glyph_Talk_71[], Glyph_Talk_72[], Glyph_Talk_73[], Glyph_Talk_74[], Glyph_Talk_75[],
    Glyph_Talk_76[], Glyph_Talk_77[], Glyph_Talk_78[], Glyph_Talk_79[], Glyph_Talk_7A[],
    Glyph_Talk_7B[], Glyph_Talk_7C[], Glyph_Talk_7D[], Glyph_Talk_7E[];

extern const u16 gUnk_08B86168[], gUnk_08B86368[], gUnk_08B86568[], gUnk_08B86768[],
    gUnk_08B86968[], gUnk_08B86B68[], gUnk_08B86D68[], gUnk_08B86F68[], gUnk_08B87168[],
    gUnk_08B87368[], gUnk_08B87568[], gUnk_08B87768[], gUnk_08B87968[];

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
extern const struct Glyph * const TextGlyphs_System[];
extern const struct Glyph * const TextGlyphs_Talk[];
extern const u16 * const TextColorLutTable[];
extern const struct Glyph * const TextGlyphs_Special[];
extern u16 const Pal_GreenTextColors[];
extern const struct ProcCmd ProcScr_TextPrint[];
extern const struct ProcCmd ProcScr_GreenTextColor[];

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
#if !PLATFORM_GBA
    // The class reels call this before any font was set: the GBA writes to
    // address 0x22 (the BIOS, ignored)
    if (gActiveFont != NULL)
#endif
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

// FAKEMATCH (found by Astra): register pins and empty asm statements
// keep the two table loads where the original has them.
void DrawSpecialCharGlyph(int chr, int color, struct Glyph const * glyph)
{
    int i;
    u32 * dst = (u32 *) (gActiveFont->draw_dest + chr * 64);
    u32 * src = (u32 *) glyph->bitmap;
    u16 * lut = (u16 *) GetColorLut(color);

    for (i = 0; i < 16; i++)
    {
        u32 bits = *src++;
#if NONMATCHING
        *dst++ = ((u32) lut[(bits >> 8) & 0xFF] << 16) + lut[bits & 0xFF];
#else
        register u32 lo asm("r4") = lut[bits & 0xFF];
        register u32 hi asm("r5") = lut[(bits >> 8) & 0xFF];
        register u32 value asm("r0");

        asm("" : "+r"(lo));
        asm("" : "+r"(hi));
        value = (hi << 16) + lo;
        *dst++ = value;
#endif
    }
}

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

SECTION(".rodata.08B86140")
const struct ProcCmd ProcScr_TextPrint[] = {
    PROC_REPEAT(TextPrint_OnLoop),
    PROC_END,
};

SECTION(".rodata.08B86150")
const struct ProcCmd ProcScr_GreenTextColor[] = {
    PROC_END_IF_DUPLICATE,
    PROC_REPEAT(GreenText_OnLoop),
    PROC_END,
};

SECTION(".rodata.08B8610C")
const u16 * const TextColorLutTable[] = {
    gUnk_08B86168,
    gUnk_08B86368,
    gUnk_08B86568,
    gUnk_08B86768,
    gUnk_08B86968,
    gUnk_08B86B68,
    gUnk_08B86D68,
    gUnk_08B86F68,
    gUnk_08B87168,
    gUnk_08B87368,
    gUnk_08B87568,
    gUnk_08B87768,
    gUnk_08B87968,
};

SECTION(".rodata.08B896B0")
const struct Glyph * const TextGlyphs_System[] = {
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    Glyph_System_1F,
    Glyph_System_20,
    Glyph_System_21,
    Glyph_System_22,
    Glyph_System_23,
    Glyph_System_24,
    Glyph_System_25,
    Glyph_System_26,
    Glyph_System_27,
    Glyph_System_28,
    Glyph_System_29,
    Glyph_System_2A,
    Glyph_System_2B,
    Glyph_System_2C,
    Glyph_System_2D,
    Glyph_System_2E,
    Glyph_System_2F,
    Glyph_System_30,
    Glyph_System_31,
    Glyph_System_32,
    Glyph_System_33,
    Glyph_System_34,
    Glyph_System_35,
    Glyph_System_36,
    Glyph_System_37,
    Glyph_System_38,
    Glyph_System_39,
    Glyph_System_3A,
    Glyph_System_3B,
    Glyph_System_3C,
    Glyph_System_3D,
    Glyph_System_3E,
    Glyph_System_3F,
    Glyph_System_40,
    Glyph_System_41,
    Glyph_System_42,
    Glyph_System_43,
    Glyph_System_44,
    Glyph_System_45,
    Glyph_System_46,
    Glyph_System_47,
    Glyph_System_48,
    Glyph_System_49,
    Glyph_System_4A,
    Glyph_System_4B,
    Glyph_System_4C,
    Glyph_System_4D,
    Glyph_System_4E,
    Glyph_System_4F,
    Glyph_System_50,
    Glyph_System_51,
    Glyph_System_52,
    Glyph_System_53,
    Glyph_System_54,
    Glyph_System_55,
    Glyph_System_56,
    Glyph_System_57,
    Glyph_System_58,
    Glyph_System_59,
    Glyph_System_5A,
    Glyph_System_5B,
    Glyph_System_5C,
    Glyph_System_5D,
    Glyph_System_5E,
    Glyph_System_5F,
    Glyph_System_60,
    Glyph_System_61,
    Glyph_System_62,
    Glyph_System_63,
    Glyph_System_64,
    Glyph_System_65,
    Glyph_System_66,
    Glyph_System_67,
    Glyph_System_68,
    Glyph_System_69,
    Glyph_System_6A,
    Glyph_System_6B,
    Glyph_System_6C,
    Glyph_System_6D,
    Glyph_System_6E,
    Glyph_System_6F,
    Glyph_System_70,
    Glyph_System_71,
    Glyph_System_72,
    Glyph_System_73,
    Glyph_System_74,
    Glyph_System_75,
    Glyph_System_76,
    Glyph_System_77,
    Glyph_System_78,
    Glyph_System_79,
    Glyph_System_7A,
    Glyph_System_7B,
    Glyph_System_7C,
    Glyph_System_7D,
    Glyph_System_7E,
    Glyph_System_7F,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
};

SECTION(".rodata.08B8B5B0")
const struct Glyph * const TextGlyphs_Talk[] = {
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    Glyph_Talk_1F,
    Glyph_Talk_20,
    Glyph_Talk_21,
    Glyph_Talk_22,
    Glyph_Talk_23,
    Glyph_Talk_24,
    Glyph_Talk_25,
    Glyph_Talk_26,
    Glyph_Talk_27,
    Glyph_Talk_28,
    Glyph_Talk_29,
    Glyph_Talk_2A,
    Glyph_Talk_2B,
    Glyph_Talk_2C,
    Glyph_Talk_2D,
    Glyph_Talk_2E,
    Glyph_Talk_2F,
    Glyph_Talk_30,
    Glyph_Talk_31,
    Glyph_Talk_32,
    Glyph_Talk_33,
    Glyph_Talk_34,
    Glyph_Talk_35,
    Glyph_Talk_36,
    Glyph_Talk_37,
    Glyph_Talk_38,
    Glyph_Talk_39,
    Glyph_Talk_3A,
    Glyph_Talk_3B,
    Glyph_Talk_3C,
    Glyph_Talk_3D,
    Glyph_Talk_3E,
    Glyph_Talk_3F,
    Glyph_Talk_40,
    Glyph_Talk_41,
    Glyph_Talk_42,
    Glyph_Talk_43,
    Glyph_Talk_44,
    Glyph_Talk_45,
    Glyph_Talk_46,
    Glyph_Talk_47,
    Glyph_Talk_48,
    Glyph_Talk_49,
    Glyph_Talk_4A,
    Glyph_Talk_4B,
    Glyph_Talk_4C,
    Glyph_Talk_4D,
    Glyph_Talk_4E,
    Glyph_Talk_4F,
    Glyph_Talk_50,
    Glyph_Talk_51,
    Glyph_Talk_52,
    Glyph_Talk_53,
    Glyph_Talk_54,
    Glyph_Talk_55,
    Glyph_Talk_56,
    Glyph_Talk_57,
    Glyph_Talk_58,
    Glyph_Talk_59,
    Glyph_Talk_5A,
    Glyph_Talk_5B,
    Glyph_Talk_5C,
    Glyph_Talk_5D,
    Glyph_Talk_5E,
    Glyph_Talk_5F,
    Glyph_Talk_60,
    Glyph_Talk_61,
    Glyph_Talk_62,
    Glyph_Talk_63,
    Glyph_Talk_64,
    Glyph_Talk_65,
    Glyph_Talk_66,
    Glyph_Talk_67,
    Glyph_Talk_68,
    Glyph_Talk_69,
    Glyph_Talk_6A,
    Glyph_Talk_6B,
    Glyph_Talk_6C,
    Glyph_Talk_6D,
    Glyph_Talk_6E,
    Glyph_Talk_6F,
    Glyph_Talk_70,
    Glyph_Talk_71,
    Glyph_Talk_72,
    Glyph_Talk_73,
    Glyph_Talk_74,
    Glyph_Talk_75,
    Glyph_Talk_76,
    Glyph_Talk_77,
    Glyph_Talk_78,
    Glyph_Talk_79,
    Glyph_Talk_7A,
    Glyph_Talk_7B,
    Glyph_Talk_7C,
    Glyph_Talk_7D,
    Glyph_Talk_7E,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
};

SECTION(".rodata.08B901B0")
const struct Glyph * const TextGlyphs_Special[] = {
    Glyph_Special_00,
    Glyph_Special_01,
    Glyph_Special_02,
    Glyph_Special_03,
    Glyph_Special_04,
    Glyph_Special_05,
    Glyph_Special_06,
    Glyph_Special_07,
    Glyph_Special_08,
    Glyph_Special_09,
    Glyph_Special_0A,
    Glyph_Special_0B,
    Glyph_Special_0C,
    Glyph_Special_0D,
    Glyph_Special_0E,
    Glyph_Special_0F,
    Glyph_Special_10,
    Glyph_Special_11,
    Glyph_Special_12,
    Glyph_Special_13,
    Glyph_Special_14,
    Glyph_Special_15,
    Glyph_Special_16,
    Glyph_Special_17,
    Glyph_Special_18,
    Glyph_Special_19,
    Glyph_Special_1A,
    Glyph_Special_1B,
    Glyph_Special_1C,
    Glyph_Special_1D,
    Glyph_Special_1E,
    Glyph_Special_1F,
    Glyph_Special_20,
    Glyph_Special_21,
    Glyph_Special_22,
    Glyph_Special_23,
    Glyph_Special_24,
    Glyph_Special_25,
    Glyph_Special_26,
    Glyph_Special_27,
    Glyph_Special_28,
    Glyph_Special_29,
    Glyph_Special_2A,
    Glyph_Special_2B,
    Glyph_Special_2C,
    Glyph_Special_2D,
    Glyph_Special_2E,
    Glyph_Special_2F,
    Glyph_Special_30,
    Glyph_Special_31,
    Glyph_Special_32,
    Glyph_Special_33,
    Glyph_Special_34,
    Glyph_Special_35,
    Glyph_Special_36,
    Glyph_Special_37,
    Glyph_Special_38,
    Glyph_Special_39,
    Glyph_Special_3A,
    Glyph_Special_3B,
    Glyph_Special_3C,
    Glyph_Special_3D,
    Glyph_Special_3E,
    Glyph_Special_3F,
    Glyph_Special_40,
    Glyph_Special_41,
    Glyph_Special_42,
    Glyph_Special_43,
    Glyph_Special_44,
    Glyph_Special_45,
    Glyph_Special_46,
    Glyph_Special_47,
    Glyph_Special_48,
    Glyph_Special_49,
    Glyph_Special_4A,
    Glyph_Special_4B,
    Glyph_Special_4C,
    Glyph_Special_4D,
    Glyph_Special_4E,
    Glyph_Special_4F,
    Glyph_Special_50,
    Glyph_Special_51,
    Glyph_Special_52,
    Glyph_Special_53,
    Glyph_Special_54,
    Glyph_Special_55,
    Glyph_Special_56,
    Glyph_Special_57,
    Glyph_Special_58,
    Glyph_Special_59,
    Glyph_Special_5A,
    Glyph_Special_5B,
    Glyph_Special_5C,
    Glyph_Special_5D,
    Glyph_Special_5E,
    Glyph_Special_5F,
    Glyph_Special_60,
    Glyph_Special_61,
    Glyph_Special_62,
    Glyph_Special_63,
    Glyph_Special_64,
    Glyph_Special_65,
    Glyph_Special_66,
    Glyph_Special_67,
    Glyph_Special_68,
    Glyph_Special_69,
    Glyph_Special_6A,
    Glyph_Special_6B,
    Glyph_Special_6C,
    Glyph_Special_6D,
    Glyph_Special_6E,
    Glyph_Special_6F,
    Glyph_Special_70,
    Glyph_Special_71,
    Glyph_Special_72,
    Glyph_Special_73,
    Glyph_Special_74,
    Glyph_Special_75,
    Glyph_Special_76,
    Glyph_Special_77,
    Glyph_Special_78,
    Glyph_Special_79,
    Glyph_Special_7A,
    Glyph_Special_7B,
    Glyph_Special_7C,
    Glyph_Special_7D,
    Glyph_Special_7E,
    Glyph_Special_7F,
    Glyph_Special_80,
    Glyph_Special_81,
    Glyph_Special_82,
    Glyph_Special_83,
    Glyph_Special_84,
    Glyph_Special_85,
    Glyph_Special_86,
    Glyph_Special_87,
    Glyph_Special_88,
    Glyph_Special_89,
    Glyph_Special_8A,
    Glyph_Special_8B,
    Glyph_Special_8C,
    Glyph_Special_8D,
    Glyph_Special_8E,
    Glyph_Special_8F,
    Glyph_Special_90,
    Glyph_Special_91,
    Glyph_Special_92,
    Glyph_Special_93,
    Glyph_Special_94,
    Glyph_Special_95,
    Glyph_Special_96,
    Glyph_Special_97,
    Glyph_Special_98,
    Glyph_Special_99,
    Glyph_Special_9A,
    Glyph_Special_9B,
    Glyph_Special_9C,
    Glyph_Special_9D,
    Glyph_Special_9E,
    Glyph_Special_9F,
    Glyph_Special_A0,
    Glyph_Special_A1,
    Glyph_Special_A2,
    Glyph_Special_A3,
    Glyph_Special_A4,
    Glyph_Special_A5,
    Glyph_Special_A6,
    Glyph_Special_A7,
    Glyph_Special_A8,
    Glyph_Special_A9,
    Glyph_Special_AA,
    Glyph_Special_AB,
    Glyph_Special_AC,
    Glyph_Special_AD,
    Glyph_Special_AE,
    Glyph_Special_AF,
    Glyph_Special_B0,
    Glyph_Special_B1,
    Glyph_Special_B2,
    Glyph_Special_B3,
    Glyph_Special_B4,
    Glyph_Special_B5,
    Glyph_Special_B6,
    Glyph_Special_B7,
    Glyph_Special_B8,
    Glyph_Special_B9,
    Glyph_Special_BA,
    Glyph_Special_BB,
    Glyph_Special_BC,
    Glyph_Special_BD,
    Glyph_Special_BE,
    Glyph_Special_BF,
    Glyph_Special_C0,
    Glyph_Special_C1,
    Glyph_Special_C2,
    Glyph_Special_C3,
    Glyph_Special_C4,
    Glyph_Special_C5,
    Glyph_Special_C6,
    Glyph_Special_C7,
    Glyph_Special_C8,
    Glyph_Special_C9,
    Glyph_Special_CA,
    Glyph_Special_CB,
    Glyph_Special_CC,
    Glyph_Special_CD,
    Glyph_Special_CE,
    Glyph_Special_CF,
    Glyph_Special_D0,
    Glyph_Special_D1,
    Glyph_Special_D2,
    Glyph_Special_D3,
    Glyph_Special_D4,
    Glyph_Special_D5,
    Glyph_Special_D6,
    Glyph_Special_D7,
    Glyph_Special_D8,
    Glyph_Special_D9,
    Glyph_Special_DA,
    Glyph_Special_DB,
    Glyph_Special_DC,
    Glyph_Special_DD,
    Glyph_Special_DE,
    Glyph_Special_DF,
    Glyph_Special_E0,
    Glyph_Special_E1,
    Glyph_Special_E2,
    Glyph_Special_E3,
    Glyph_Special_E4,
    Glyph_Special_E5,
    Glyph_Special_E6,
    Glyph_Special_E7,
    Glyph_Special_E8,
    Glyph_Special_E9,
    Glyph_Special_EA,
    Glyph_Special_EB,
    Glyph_Special_EC,
    Glyph_Special_ED,
    Glyph_Special_EE,
    Glyph_Special_EF,
    Glyph_Special_F0,
    Glyph_Special_F1,
    Glyph_Special_F2,
    Glyph_Special_F3,
    Glyph_Special_F4,
    Glyph_Special_F5,
    Glyph_Special_F6,
    Glyph_Special_F7,
    Glyph_Special_F8,
    Glyph_Special_F9,
    Glyph_Special_FA,
    Glyph_Special_FB,
    Glyph_Special_FC,
    Glyph_Special_FD,
    Glyph_Special_FE,
    Glyph_Special_FF,
};
