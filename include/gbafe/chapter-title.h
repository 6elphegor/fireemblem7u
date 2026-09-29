#pragma once

#include "global.h"

struct ChapTitleConfig {
    const u8 * img;
};
GBA_SIZE_CHECK(struct ChapTitleConfig, 0x4);

extern const struct ChapTitleConfig gChapTitleConfig[];

struct ChapTitleGlyph {
    /* 00 */ u8 kern_a;
    /* 01 */ u8 kern_b;
    /* 02 */ u8 advance_a;
    /* 03 */ u8 advance_b;
    /* 04 */ u8 offset;
    /* 05 */ u8 width;
    /* 06 */ u8 y_start;
    /* 07 */ u8 y_end;
};
GBA_SIZE_CHECK(struct ChapTitleGlyph, 0x8);

extern const struct ChapTitleGlyph gChapTitleGlyphs[];
extern const u8 Img_ChapterTitleFont[];

int sprintf(char * buf, const char * fmt, ...); // sprintf

struct ChapTitleSt {
    u16 chr_bg;
    u16 chr_str;
};
GBA_SIZE_CHECK(struct ChapTitleSt, 0x4);

extern struct ChapTitleSt gChapTitleSt;

void PutChapterTitlePalette(int config, int pal_bank);
int GetChapterTitleGlyphOffset(int glyph);
int GetChapterTitleGlyph(const char * str);
void DrawChapterTitleGlyph(u8 * src, u8 * dst, int glyph, int x);
int GetChapterTitleTextX(const char * str);
const char * GetChapterTitleStr(int titleId);
void PutChapterTitleGfx(int chr, u32 titleId);
void PutChapterTitleBG(int chr);
void PutChapterTitleUnkBG(int chr);
void PutChapterTitleNameTsa(u16 * tm, int pal);
void PutChapterTitleBgTsa(u16 * tm, int pal);
void PutChapterTitleBgUnkTsa(u16 * tm, int pal);
int GetChapterTitle(struct PlaySt * playst);
