#include "gbafe.h"

extern const u16 gUnk_08CE6058[], gUnk_08CE6060[], gUnk_08CE6068[], gUnk_08CE6070[],
    gUnk_08CE6088[], gUnk_08CE6090[], gUnk_08CE6098[], gUnk_08CE60A0[], gUnk_08CE60A8[],
    gUnk_08CE60B0[], gUnk_08CE60B8[], gUnk_08CE60C0[];

SECTION(".rodata.08CE6078")
const u16 * const SpriteLut_GaugePips[] = {
    gUnk_08CE6058,
    gUnk_08CE6060,
    gUnk_08CE6068,
    gUnk_08CE6070,
};

SECTION(".rodata.08CE60C8")
const u16 * const SpriteLut_ClassIntroIcons[] = {
    gUnk_08CE6088,
    gUnk_08CE6090,
    gUnk_08CE6098,
    gUnk_08CE60A0,
    gUnk_08CE60A8,
    gUnk_08CE60B0,
    gUnk_08CE60B8,
    gUnk_08CE60C0,
};

extern const u16 gUnk_08CC3464[], gUnk_08CC346C[], gUnk_08CC3474[], gUnk_08CC34C4[],
    gUnk_08CC34D8[], gUnk_08CC34EC[], gUnk_08CC3500[], gUnk_08CC3514[], gUnk_08CC3528[],
    gUnk_08CC353C[];

SECTION(".rodata.08CC347C")
const u16 * const gSpriteArray_08A17B58[] = {
    gUnk_08CC3464,
    gUnk_08CC346C,
    gUnk_08CC3474,
};

SECTION(".rodata.08CC3550")
const u16 * const gSpriteArray_08A17C20[] = {
    gUnk_08CC353C,
    gUnk_08CC34C4,
    gUnk_08CC34D8,
    gUnk_08CC34EC,
    gUnk_08CC3500,
    gUnk_08CC3514,
    gUnk_08CC3528,
    gUnk_08CC3528,
    gUnk_08CC3528,
    gUnk_08CC3528,
};

extern const u8 Img_UiWindowFrame1[], Img_UiWindowFrame2[], Img_UiWindowFrame3[],
    Img_UiWindowFrame4[];
extern const u16 Pal_081D69E4[], Pal_081D72A4[], Pal_081D7B20[], UiWindowFrameTile1[],
    UiWindowFrameTile2[], UiWindowFrameTile3[], gUnk_081D6110[], gUnk_081D6A04[], gUnk_081D72C4[],
    gUnk_081D7B40[];

SECTION(".rodata.08B9A824")
const u16 * const gUiWindowFrameModelLut[] = {
    UiWindowFrameTile1,
    UiWindowFrameTile2,
    UiWindowFrameTile3,
};

SECTION(".rodata.08B9A830")
const u16 * const gUiWindowFramePalLut[] = {
    Pal_UiWindowFrame1,
    Pal_081D69E4,
    Pal_081D72A4,
    Pal_081D7B20,
};

SECTION(".rodata.08B9A850")
const u16 * const gUiStatBarPalLut[] = {
    gUnk_081D6110,
    gUnk_081D6A04,
    gUnk_081D72C4,
    gUnk_081D7B40,
};

SECTION(".rodata.08B9A840")
const u8 * const gUiWindowFrameImgLut[] = {
    Img_UiWindowFrame1,
    Img_UiWindowFrame2,
    Img_UiWindowFrame3,
    Img_UiWindowFrame4,
};
