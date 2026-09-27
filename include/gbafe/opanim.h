#pragma once

#include "global.h"
#include "proc.h"

void sub_080BB070(void);
void InitOpScanlineBuf(void);
void SwapOpScanlineBufs(void);
void sub_080BB0E0(void);
// sub_080BB2AC
// sub_080BB31C
// sub_080BB32C
void HBlank_80BBDD0(void);
void sub_080BB4E8(struct Proc * proc);
void sub_80BBFA0(struct Proc * proc);
void sub_080BB530(struct Proc * proc);
// sub_80BC1E8
void sub_80BC240(struct Proc * proc);
void sub_80BC398(struct Proc * proc);
void sub_080BBA3C(struct Proc * proc);
void OpAnim_DrawWater(struct Proc * proc);
void sub_080BBB30(struct Proc * proc);
void sub_080BBBA4(struct Proc * proc);
void sub_80BC5C4(struct Proc * proc);
// sub_080BBC5C
// sub_80BC688
// sub_80BC730
// sub_080BBDD0
// sub_080BBE40
// sub_080BBE50
// sub_080BBE7C
void sub_80BC8B8(struct Proc * proc);
void sub_080BC0A4(struct Proc * proc);
void sub_080BC0C4(struct Proc * proc);
// sub_80BCB00
void sub_080BC104(struct Proc * proc);
void sub_80BCB6C(struct Proc * proc);
void sub_80BCC0C(struct Proc * proc);
void sub_80BCC9C(struct Proc * proc);
// nullsub_92
// sub_080BC2D8
void OpAnim_DrawCloud(struct Proc * proc);
void sub_80BCE9C(struct Proc * proc);
void sub_080BC494(struct Proc * proc);
// sub_80BCF98
// sub_80BCFC4
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
// sub_080BCA6C
// sub_80BD47C
// sub_080BCA94
// sub_80BD4E0
// sub_80BD4F4
// sub_080BCB1C
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
// sub_080BD1DC
// sub_080BD310
// sub_080BD364
// sub_080BD424
// sub_080BD4C4
// sub_080BD4F4
// sub_080BD548
// sub_080BD570
// sub_080BD588
// sub_080BD688
// sub_080BD68C
// sub_080BD698
// sub_080BD764

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

// ??? gUnk_08DB8FC0
// ??? gUnk_08DB8FC4
// ??? gUnk_08DB8FC8
// ??? gUnk_08DB8FCC
// ??? gUnk_08DB8FD0
// ??? gUnk_08DB9010
extern struct ProcCmd CONST_DATA ProcScr_08DB9030[];
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
