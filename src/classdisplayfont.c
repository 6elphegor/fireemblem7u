#include "gbafe.h"

// FE8U: classdisplayfont.c

struct ClassDisplayFont {
    u16 const * sprite;
    s8 xBase;
    s8 width;
    s8 yBase;
};

extern struct ClassDisplayFont CONST_DATA gClassDisplayFontData[];

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
