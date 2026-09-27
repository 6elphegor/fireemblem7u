#pragma once

#include "global.h"
#include "proc.h"

struct OpAnimProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int unk_2C;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ s8 unk_3C;
    /* 3D */ STRUCT_PAD(0x3D, 0x40);
    /* 40 */ ProcPtr unk_40;
    /* 44 */ u8 unk_44;
    /* 45 */ STRUCT_PAD(0x45, 0x4C);
    /* 4C */ s16 unk_4C;
};

void sub_080BB070(void);
void InitOpScanlineBuf(void);
void SwapOpScanlineBufs(void);
void sub_080BB0E0(void);
void sub_080BB2AC(void);
void sub_080BB31C(void);
void sub_080BB32C(void);
void HBlank_80BBDD0(void);
void sub_080BB4E8(struct OpAnimProc * proc);
void sub_080BB524(struct OpAnimProc * proc);
void sub_080BB530(struct OpAnimProc * proc);
void sub_080BB76C(struct OpAnimProc * proc);
void sub_080BB800(struct OpAnimProc * proc);
void sub_080BB814(struct OpAnimProc * proc);
void sub_080BB81C(struct OpAnimProc * proc);
void sub_080BB98C(struct OpAnimProc * proc);
void sub_080BBA3C(struct OpAnimProc * proc);
void OpAnim_DrawWater(struct OpAnimProc * proc);
void sub_080BBB30(struct OpAnimProc * proc);
void sub_080BBBA4(struct OpAnimProc * proc);
void sub_080BBBB8(struct OpAnimProc * proc);
void sub_080BBC5C(void);
void sub_080BBC80(void);
void sub_080BBD28(void);
void sub_080BBDD0(void);
void sub_080BBE40(void);
void sub_080BBE50(struct OpAnimProc * proc);
void sub_080BBE7C(struct OpAnimProc * proc);
void sub_080BBEB0(struct OpAnimProc * proc);
void sub_080BC0A4(struct OpAnimProc * proc);
void sub_080BC0C4(struct OpAnimProc * proc);
void sub_080BC0F8(void);
void sub_080BC104(struct OpAnimProc * proc);
void sub_080BC164(struct OpAnimProc * proc);
void sub_080BC21C(struct OpAnimProc * proc);
void sub_080BC280(struct OpAnimProc * proc);
void sub_080BC2D4(void);
s8 sub_080BC2D8(struct ProcBmBgfx * proc);
void OpAnim_DrawCloud(struct OpAnimProc * proc);
void sub_080BC474(struct Proc * proc);
void sub_080BC494(struct Proc * proc);
// sub_80BCF98
// sub_80BCFC4
void sub_080BC5B8(ProcPtr proc);
void sub_080BCAE8(ProcPtr proc);
void sub_080BCAFC(void);
void sub_080BC5CC(void);
void sub_080BCB34(int a, int b, int c, int d, int e);
void sub_080BCBFC(int a, int b, int c, int d, int e);
void sub_080BCE20(ProcPtr proc);
// sub_080BC5CC
// sub_080BC5E0
// sub_080BC5F4
// sub_080BC6A8
// sub_080BC790
// sub_080BC7E4
// sub_080BC8C0
// sub_080BC8F8
// sub_080BC94C
void sub_080BC960(struct Proc * proc);
// sub_80BD3A0
// sub_080BC9B8
void sub_080BCA6C(int a, ProcPtr parent);
// sub_80BD47C
// sub_080BCA94
// sub_80BD4E0
// sub_80BD4F4
void sub_080BCB1C(u8 const * src, int offset);
// sub_80BD54C
// sub_80BD614
// sub_80BD6DC
// sub_80BD70C
// sub_80BD7C8
// sub_80BD7EC
// sub_80BD830
// sub_80BD83C
// sub_80BD850
// sub_80BD884
// sub_80BD904
// sub_80BD928
// sub_80BD96C
// sub_80BD978
// sub_080BCE34
// sub_080BCE60
// sub_080BCFCC
// sub_080BCFE8
// Proc_08DB9398_Loop
void sub_080BD0D4(void * a, const u16 * pal, int pal_bank, int size, ProcPtr parent);
// sub_080BD168
// sub_080BD1A4
void sub_080BD1DC(int a, u16 const * pal, int c, int d, int e, int f, ProcPtr parent);
// sub_080BD310
// sub_080BD364
void sub_080BD424(int a, int b, int angle, int speed, ProcPtr parent);
// sub_080BD4C4
// sub_080BD4F4
void sub_080BD548(ProcPtr proc);
// sub_080BD570
// sub_080BD588
void sub_080BD688(ProcPtr proc, int val);
// sub_080BD68C
// sub_080BD698
ProcPtr sub_080BD764(void const * a, int b, int c, int d, ProcPtr parent);

struct OpScanlineSt {
    /* 00 */ int unk_00;
    /* 04 */ int unk_04;
    /* 08 */ int unk_08;
    /* 0C */ int unk_0C;
    /* 10 */ int unk_10;
    /* 14 */ int unk_14;
    /* 18 */ int unk_18;
};

extern struct OpScanlineSt OpScanlineSt;

extern u8 OpScanlineBuf[];
extern u8 * gpOpScanlineBufs[2];

struct Struct_02007508 {
    /* 00 */ int unk_00;
    /* 04 */ int unk_04;
    /* 08 */ int unk_08;
    /* 0C */ int unk_0C;
};

extern struct Struct_02007508 gUnkOpAnim_0200750C;

extern u32 gUnkOpAnim_03001620;
extern int gUnkOpAnim_020072BC;
extern u16 gUnkOpAnim_02007300[0x100];
extern u16 * gUnkOpAnim_02007500[2];
extern int gUnkOpAnim_02007508;
extern int gUnkOpAnim_0200751C;
extern int gUnkOpAnim_02007520;

// ??? gUnk_08DB8FC0
// ??? gUnk_08DB8FC4
// ??? gUnk_08DB8FC8
// ??? gUnk_08DB8FCC
// ??? gUnk_08DB8FD0
// ??? gUnk_08DB9010
extern struct ProcCmd CONST_DATA ProcScr_08CEF0E4[];
extern struct ProcCmd CONST_DATA ProcScr_OpeningSeqence[];
extern struct ProcCmd CONST_DATA ProcScr_08DB91A8[];
extern struct ProcCmd CONST_DATA ProcScr_08DB91C0[];
extern struct ProcCmd CONST_DATA ProcScr_08DB9208[];
// ??? gUnk_08DB9228
// ??? gUnk_08DB9248
// ??? gUnk_08DB92C8
// ??? gUnk_08DB9320
// ??? ProcScr_08DB9378
// ??? ProcScr_08DB9398
// ??? gUnk_08DB93B0
// ??? ProcScr_08DB93D0
// ??? gUnk_08DB93F0
// ??? gUnk_08DB941C
// ??? gUnk_08DB947C
// ??? gUnk_08DB9548
// ??? gUnk_08DB95D8
// ??? gUnk_08DB9674
// ??? gUnk_08DB9794
// ??? gUnk_08DB9A7C
