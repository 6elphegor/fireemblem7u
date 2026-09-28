#include "gbafe.h"

// ROM data referenced below, defined in data/ (see tools/datasplit.py)
extern const u8 gUnk_08CE6C10[];
extern const u8 gUnk_08CE6C18[];
extern const u8 gUnk_08CE6C20[];
extern const u8 gUnk_08CE6C28[];
extern const u8 gUnk_08CE6C30[];
extern const u8 gUnk_08CE6C38[];
extern const u8 gUnk_08CE6C46[];
extern const u8 gUnk_08CE6C54[];
extern const u8 gUnk_08CE6C5C[];
extern const u8 gUnk_08CE6C64[];
extern const u8 gUnk_08CE6C72[];
extern const u8 gUnk_08CE6C7A[];
extern const u8 gUnk_08CE6C82[];
extern const u8 gUnk_08CE6C8A[];
extern const u8 gUnk_08CE6C92[];
extern const u8 gUnk_08CE6C9A[];
extern const u8 gUnk_08CE6CA8[];
extern const u8 gUnk_08CE6CB0[];
extern const u8 gUnk_08CE6CB8[];
extern const u8 gUnk_08CE6CC0[];
extern const u8 gUnk_08CE6CC8[];
extern const u8 gUnk_08CE6CD0[];
extern const u8 gUnk_08CE6CDE[];
extern const u8 gUnk_08CE6CE6[];
extern const u8 gUnk_08CE6CEE[];
extern const u8 gUnk_08CE6CF6[];
extern const u8 gUnk_08CE6CFE[];
extern const u8 gUnk_08CE6D0C[];
extern const u8 gUnk_08CE6D1A[];
extern const u8 gUnk_08CE6D22[];
extern const u8 gUnk_08CE6D2A[];
extern const u8 gUnk_08CE6D32[];
extern const u8 gUnk_08CE6D40[];
extern const u8 gUnk_08CE6D48[];
extern const u8 gUnk_08CE6D50[];
extern const u8 gUnk_08CE6D58[];
extern const u8 gUnk_08CE6D60[];
extern const u8 gUnk_08CE6D68[];
extern const u8 gUnk_08CE6D70[];
extern const u8 gUnk_08CE6D78[];

// FE8U: classdisplayfont.c

struct ClassDisplayFont {
    u16 const * sprite;
    s8 xBase;
    s8 width;
    s8 yBase;
};

CONST_DATA struct ClassDisplayFont gClassDisplayFontData[] = {
    { (u16 *) gUnk_08CE6C10, 0, 8, 0 },
    { (u16 *) gUnk_08CE6C18, 0, 8, 0 },
    { (u16 *) gUnk_08CE6C20, 0, 7, 0 },
    { (u16 *) gUnk_08CE6C28, 0, 8, 0 },
    { (u16 *) gUnk_08CE6C30, 0, 7, 0 },
    { (u16 *) gUnk_08CE6C38, 1, 7, 0 },
    { (u16 *) gUnk_08CE6C46, 1, 10, 0 },
    { (u16 *) gUnk_08CE6C54, 0, 8, 0 },
    { (u16 *) gUnk_08CE6C5C, 0, 7, 0 },
    { (u16 *) gUnk_08CE6C64, 1, 8, 0 },
    { (u16 *) gUnk_08CE6C72, 0, 8, 0 },
    { (u16 *) gUnk_08CE6C7A, 0, 6, 0 },
    { (u16 *) gUnk_08CE6C82, 0, 14, 0 },
    { (u16 *) gUnk_08CE6C8A, 0, 8, 0 },
    { (u16 *) gUnk_08CE6C92, 0, 8, 0 },
    { (u16 *) gUnk_08CE6C9A, 2, 12, 0 },
    { NULL, 0, 0, 0 },
    { (u16 *) gUnk_08CE6CA8, 0, 7, 0 },
    { (u16 *) gUnk_08CE6CB0, 0, 6, 0 },
    { (u16 *) gUnk_08CE6CB8, 0, 7, 0 },
    { (u16 *) gUnk_08CE6CC0, 0, 9, 0 },
    { (u16 *) gUnk_08CE6D68, 0, 10, 0 },
    { (u16 *) gUnk_08CE6CC8, 0, 12, 0 },
    { NULL, 0, 0, 0 },
    { (u16 *) gUnk_08CE6CD0, 0, 8, 0 },
    { NULL, 0, 0, 0 },
    { (u16 *) gUnk_08CE6CDE, 1, 15, 0 },
    { (u16 *) gUnk_08CE6CE6, 1, 14, 0 },
    { (u16 *) gUnk_08CE6D70, 1, 14, 0 },
    { (u16 *) gUnk_08CE6CEE, 1, 15, 0 },
    { NULL, 0, 0, 0 },
    { (u16 *) gUnk_08CE6CF6, 1, 15, 0 },
    { (u16 *) gUnk_08CE6CFE, 1, 13, 0 },
    { (u16 *) gUnk_08CE6D0C, 0, 15, 6 },
    { NULL, 0, 0, 0 },
    { NULL, 0, 0, 0 },
    { (u16 *) gUnk_08CE6D1A, 1, 15, 0 },
    { (u16 *) gUnk_08CE6D22, 0, 12, 0 },
    { (u16 *) gUnk_08CE6D2A, 0, 15, 0 },
    { (u16 *) gUnk_08CE6D32, 0, 14, 6 },
    { NULL, 0, 0, 0 },
    { (u16 *) gUnk_08CE6D40, 2, 12, 0 },
    { NULL, 0, 0, 0 },
    { (u16 *) gUnk_08CE6D78, 1, 14, 0 },
    { (u16 *) gUnk_08CE6D48, 2, 12, 0 },
    { (u16 *) gUnk_08CE6D50, 1, 13, 0 },
    { NULL, 0, 0, 0 },
    { (u16 *) gUnk_08CE6D58, 1, 15, 0 },
    { (u16 *) gUnk_08CE6D60, 0, 16, 0 },
    { NULL, 0, 0, 0 },
    { NULL, 0, 0, 0 },
    { NULL, 0, 0, 0 },
};

struct ClassDisplayFont const * GetClassDisplayFontInfo(u8 chr)
{
    if (chr == ' ')
        return NULL;

    if ((u8) (chr - 'a') < 26)
        return &gClassDisplayFontData[chr - 'a'];

    if ((u8) (chr - 'A') < 26)
        return &gClassDisplayFontData[chr - 'A' + 26];

    return NULL;
}
