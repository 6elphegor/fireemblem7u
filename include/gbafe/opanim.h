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
    /* 44 */ s8 unk_44;
    /* 45 */ STRUCT_PAD(0x45, 0x4C);
    /* 4C */ s16 unk_4C;
};

struct OpAnimImgEntry {
    /* 00 */ void const * img0;
    /* 04 */ void const * img1;
    /* 08 */ void const * tsa;
};

struct OpAnimSubProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int unk_2C;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ struct OpAnimImgEntry const * unk_3C;
};

struct OpAnimTextEntry {
    /* 00 */ void const * img[2];
    /* 08 */ int duration;
};

struct OpAnimTextProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ struct OpAnimTextEntry const * entry;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3C;
};

struct OpAnimCloudProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2A);
    /* 2A */ u16 unk_2A;
    /* 2C */ u16 unk_2C;
    /* 2E */ u16 unk_2E;
    /* 30 */ u16 unk_30;
    /* 32 */ u16 unk_32[4];
    /* 3A */ u16 unk_3A[4];
};

struct OpAnimBirdProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ ProcPtr anim[2];
    /* 34 */ int x[2];
    /* 3C */ int y[2];
    /* 44 */ int vx[2];
    /* 4C */ int vy[2];
};

struct OpAnimBgHeader {
    /* 00 */ u16 const * pal;
    /* 04 */ int pal_bank;
    /* 08 */ int pal_count;
    /* 0C */ void const * img;
    /* 10 */ int chr_offset;
    /* 14 */ int rows;
};

struct OpAnimBgFrame {
    /* 00 */ void const * img;
    /* 04 */ u16 const * tsa;
};

struct OpAnimBgConf {
    /* 00 */ struct OpAnimBgHeader const * header;
    /* 04 */ struct OpAnimBgFrame const * frames;
};

struct OpAnimBgProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ struct OpAnimBgConf const * conf;
    /* 30 */ int bg;
    /* 34 */ int count;
    /* 38 */ int pos;
    /* 3C */ int speed;
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
void OpeningSeqence_Loop_B(struct OpAnimProc * proc);
void OpAnim_DrawWater(struct OpAnimProc * proc);
void OpeningSeqence_Loop_A(struct OpAnimProc * proc);
void sub_080BBBA4(struct OpAnimProc * proc);
void sub_080BBBB8(struct OpAnimProc * proc);
void sub_080BBC5C(void);
void sub_080BBC80(void);
void sub_080BBD28(void);
void sub_080BBDD0(void);
void sub_080BBE40(void);
void sub_080BBE50(struct OpAnimProc * proc);
void sub_080BBE7C(struct OpAnimProc * proc);
void OpeningSeqence_Loop_C(struct OpAnimProc * proc);
void sub_080BC0A4(struct OpAnimProc * proc);
void OpeningSeqence_Loop_D(struct OpAnimProc * proc);
void sub_080BC0F8(void);
void sub_080BC104(struct OpAnimProc * proc);
void sub_080BC164(struct OpAnimProc * proc);
void OpeningSeqence_Loop_E(struct OpAnimProc * proc);
void OpeningSeqence_Loop_F(struct OpAnimProc * proc);
void sub_080BC2D4(void);
s8 sub_080BC2D8(struct ProcBmBgfx * proc);
void OpAnim_DrawCloud(struct OpAnimProc * proc);
void sub_080BC474(struct OpAnimProc * proc);
void OpeningSeqence_Loop_G(struct OpAnimProc * proc);
void sub_080BC570(struct Proc * proc);
// sub_80BCFC4
void sub_080BC5B8(ProcPtr proc);
void sub_080BCAE8(ProcPtr proc);
void sub_080BCAFC(void);
void sub_080BC5CC(void);
void sub_080BCB34(int a, int b, int c, int d, int e);
void sub_080BCBFC(int a, int b, int c, int d, int e);
void sub_080BCE20(ProcPtr proc);
// sub_080BC5CC
int sub_080BC5E0(struct OpAnimImgEntry const * list);
void sub_080BC5F4(struct OpAnimSubProc * proc);
bool sub_080BC6A8(struct OpAnimSubProc * proc);
void sub_080BC790(struct OpAnimSubProc * proc);
void sub_080BC7E4(struct OpAnimSubProc * proc);
void sub_080BC8C0(struct OpAnimSubProc * proc);
void sub_080BC8F8(struct OpAnimSubProc * proc);
void sub_080BC94C(void);
void sub_080BC960(struct OpAnimProc * proc);
void sub_080BC994(void);
void sub_080BC9A8(struct OpAnimSubProc * proc);
void sub_080BC9B8(struct OpAnimSubProc * proc);
void sub_080BCA6C(int a, ProcPtr parent);
void sub_080BCA84(struct OpAnimSubProc * proc);
void sub_080BCA94(struct OpAnimSubProc * proc);
void sub_080BCB1C(u8 const * src, int offset);
void sub_080BCCC4(struct OpAnimTextProc * proc);
void sub_080BCCF0(struct OpAnimTextProc * proc);
void sub_080BCDB4(struct OpAnimTextProc * proc);
void sub_080BCDD8(struct OpAnimTextProc * proc);
void sub_080BCE14(struct OpAnimTextProc * proc);
void sub_080BCE34(struct OpAnimCloudProc * proc);
// sub_80BD904
// sub_80BD928
// sub_80BD96C
// sub_80BD978
void sub_080BCE60(struct OpAnimCloudProc * proc);
void sub_080BCFCC(int a, int b, ProcPtr parent);
void sub_080BCFE8(u16 const * src1, u16 const * src2, int pal, int k);
void Proc_08DB9398_Loop(struct OpAnimSubProc * proc);
void sub_080BD0D4(void * a, const u16 * pal, int pal_bank, int size, ProcPtr parent);
void sub_080BD168(struct OpAnimSubProc * proc);
void sub_080BD1A4(struct OpAnimSubProc * proc);
void sub_080BD1DC(int a, u16 const * pal, int c, int d, int e, int f, ProcPtr parent);
void sub_080BD310(struct OpAnimBirdProc * proc);
void sub_080BD364(struct OpAnimBirdProc * proc);
void sub_080BD424(int a, int b, int angle, int speed, ProcPtr parent);
void sub_080BD4C4(struct OpAnimSubProc * proc);
void sub_080BD4F4(struct OpAnimSubProc * proc);
void sub_080BD548(ProcPtr proc);
void sub_080BD55C(void);
int sub_080BD570(struct OpAnimTextEntry const * entry);
void sub_080BD588(int bg, struct OpAnimBgConf const * conf, int row);
void sub_080BD688(struct OpAnimBgProc * proc, int speed);
void sub_080BD68C(struct OpAnimBgProc * proc);
void sub_080BD698(struct OpAnimBgProc * proc);
ProcPtr sub_080BD764(struct OpAnimBgConf const * conf, int bg, int pos, int speed, ProcPtr parent);

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
extern u16 gUnkOpAnim_020072C0[0x20];
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
