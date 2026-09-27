#pragma once

#include "global.h"
#include "gbafe/proc.h"
#include "gbafe/text.h"
#include "gbafe/unit.h"

enum
{
    UNITLIST_MODE_FIELD = 0,
    UNITLIST_MODE_PREPMENU = 1,
    UNITLIST_MODE_SOLOANIM = 3,
};

struct UnitListScreenProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 helpActive;
    /* 2C */ u8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 page;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 36 */ u8 pageTarget;
    /* 37 */ u8 unk_37;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 mode;
    /* 3A */ u8 allyCount;
    /* 3B */ u8 deployedCount;
    /* 3C */ u16 unk_3c;
    /* 3E */ u16 unk_3e;
    /* 40 */ ProcPtr pSpriteProc;
    /* 44 */ ProcPtr pMuralProc;
};

struct UnitListScreenSpritesProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct UnitListScreenProc * unk_2c;
    /* 30 */ u8 unk_30;
    /* 34 */ ProcPtr unk_34;
    /* 38 */ u16 unk_38;
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ u8 unk_3c;
};

struct UnitListScreenField
{
    /* 00 */ u8 sortKey;
    /* 04 */ int labelString;
    /* 08 */ u8 xColumn;
    /* 0C */ u32 helpTextId;
};

extern struct UnitListScreenField gUnitListScreenFields[][9];

struct SortedUnitEnt
{
    /* 00 */ struct Unit * unit;
    /* 04 */ s16 battleAttack;
    /* 06 */ s16 battleHitRate;
    /* 08 */ s16 battleAvoidRate;
    /* 0A */ u8 supportCount;
};

extern struct SortedUnitEnt gSortedUnitsBuf[0x40];
extern struct SortedUnitEnt * gSortedUnits[0x40];
extern u16 gUnknown_0200D7E0[0x20][0x20];
extern u16 gUnknown_0200DFE0[2][0x20];
extern struct Text gUnknown_0200E060[7];
extern struct Text gUnknown_0200E098[7][3];
extern struct Text gUnknown_0200E140;
extern struct Text gUnknown_0200E148;
extern struct Text gUnknown_0200E150;
extern u8 gUnknown_0200E158[0x1000];
extern u8 gUnknown_0200F158;
extern u32 gUnknown_0200F15C[8];

extern u16 const * gSpriteArray_08A17B58[];
extern u16 const Sprite_08A17B64[];
extern u16 const Sprite_08CC3490[];
extern u16 const Sprite_08A17B6C[];
extern u16 const * gSpriteArray_08A17C20[];
extern u16 gUnknown_02013460[];

/* unit stack (defined in asm) */
void InitUnitStack(void * buf);
void PushUnit(struct Unit * unit);
void LoadPlayerUnitsFromUnitStack(void);

void sub_809014C(void);
void sub_80901BC(u8 x, u8 y, u8 width);
void sub_8090238(u8 key);
void sub_8090324(int itemIconId);
void sub_8090358(u16 arg_0);
void sub_08088E80(u8 side, u8 frame, s8 visible);
void sub_8090418(struct UnitListScreenProc * proc, s8 unk);
void sub_8090514(s8 flag);
void UnitList_StartStatScreen(struct UnitListScreenProc * proc);
void UnitList_ResetFromStatScreen(struct UnitListScreenProc * proc);
void UnitList_ResetDispFromStatScreen(void);
void UnitListScreenSprites_Init(struct UnitListScreenSpritesProc * proc);
void UnitListScreenSprites_Main(struct UnitListScreenSpritesProc * proc);
void UnitListScreenSprites_Dummy(void);
void sub_8090B48(struct Unit * unit, struct UnitListScreenProc * proc);
void sub_8090C58(struct UnitListScreenProc * proc);
void sub_8090D00(struct UnitListScreenProc * proc);
void sub_8090D80(struct UnitListScreenProc * proc);
void UnitList_Init(struct UnitListScreenProc * proc);
void UnitList_DeployUnit(struct Unit * unit, struct UnitListScreenProc * proc);
void UnitList_UndeployUnit(struct Unit * unit, struct UnitListScreenProc * proc);
void UnitList_TogglePrepDeployState(struct UnitListScreenProc * proc);
void UnitList_ToggleSoloAnimState(struct Unit * unit, int step);
void sub_809144C(struct UnitListScreenProc * proc);
