#pragma once

enum
{
    // window_theme (including PlaySt::config_window_theme)

    UI_WINDOW_THEME_BLUE,
    UI_WINDOW_THEME_RED,
    UI_WINDOW_THEME_GRAY,
    UI_WINDOW_THEME_GREEN,
};

enum
{
    // PutUiWindowFrame param window_kind

    UI_WINDOW_REGULAR,
    UI_WINDOW_FILL,
    UI_WINDOW_SABLE,
};

void ApplyUiWindowFramePal(int palid);
void UnpackUiWindowFrameImg(void *dest);
void ApplyUiStatBarPal(int palid);
void UnpackUiWindowFrameGraphics2(int window_theme);
void PutUiWindowFrame(u16 * tm, int x, int y, int width, int height, int tilebase, int window_kind);
void DrawUiFrame2(int x, int y, int width, int height, int window_kind);
void PutUiHand(int x, int y);
void PutUnkUiHand(int x, int y);
void DisplayFrozenUiHand(int x, int y);
int GetUiHandPrevX(void);
int GetUiHandPrevY(void);
void ClearUi(void); // FE8U: ClearBg0Bg1
// DrawUiItemHover
// ClearUiItemHover
void DrawUiItemHover(int x, int y, int width);
void ClearUiItemHover(int x, int y, int width);
// UnpackUnkUiFrame
void UnpackUnkUiFrame(void * vram, int palid, int palcount);
void DisplayUiHandExt(s32 x, s32 y, u32 objTileOffset);
void DisplayFrozenUiHandExt(s32 x, s32 y, u32 objTileOffset);
void UnpackUiWindowFrameGraphics(void);

// ??? gUnk_08C09944
// ??? gUnk_08C09B0C
extern u16 const * const gUiWindowFrameModelLut[];
extern u16 const * const gUiWindowFramePalLut[];
extern u8 const * const gUiWindowFrameImgLut[];
extern u16 const * const gUiStatBarPalLut[];
// ??? gUnk_08C09BB4
// ??? gUnk_08C09BBC
// ??? gUnk_08C09BDC
// ??? gUnk_08C09BF4
// ??? gUnk_08C09C34
// ??? gUnk_08C09C3C
// ??? gUnk_08C09C54
// ??? gUnk_08C09C64
// ??? gUnk_08C09C74
// ??? gUnk_08C09C80
// ??? gUnk_08C09CB0
