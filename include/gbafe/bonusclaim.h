#pragma once

#include "global.h"

struct BonusClaimEnt {
    /* 00 */ u8 unseen;
    /* 01 */ u8 kind;
    /* 02 */ u8 itemId;
    /* 03 */ char str[0x11]; // Only used in FE8
};
GBA_SIZE_CHECK(struct BonusClaimEnt, 0x14);

extern struct BonusClaimEnt gBonusClaimData[];
extern CONST_DATA struct BonusClaimEnt * gpBonusClaimData;
extern CONST_DATA struct BonusClaimEnt * gpSaveDrawBonusClaimData; // second ROM copy of the same pointer (savedraw)

enum {
    BONUSKIND_ITEM0 = 0,
    BONUSKIND_ITEM1 = 1,
    BONUSKIND_MONEY = 2,
};

struct BonusClaimItemEnt {
    /* 00 */ s8 unk_00;
    /* 01 */ s8 claimable;
};

struct BonusClaimProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 menuIndex;
    /* 2A */ u8 submenuIndex;
    /* 2B */ u8 targets;
    /* 2C */ s16 unk_2c;
    /* 2E */ s8 unk_2e;
    /* 30 */ int timer;
    /* 34 */ ProcPtr unk_34;
};

struct BonusClaimConfig {
    /* 00 */ s8 hasInventorySpace;
    /* 04 */ struct Unit * unit;
};

extern CONST_DATA struct BonusClaimEnt * gpBonusClaimDataUpdated;
extern CONST_DATA struct BonusClaimItemEnt * gpBonusClaimItemList;
extern CONST_DATA int * gpBonusClaimItemCount;
extern CONST_DATA struct Text * gpBonusClaimText;
extern CONST_DATA struct BonusClaimConfig * gpBonusClaimConfig;

void PutChapterBannerSprites(void);
void sub_080ACAF8(void);
void sub_080ACB64(void);
s8 InitBonusClaimData(void);
void DrawBonusClaimItemText(int idx);
void SetBonusItemClaimed(int idx);
void SetupBonusClaimTargets(struct BonusClaimProc * proc);
void sub_080ACF08(void);
void BonusClaim_Init(struct BonusClaimProc * proc);
void BonusClaim_Loop_MainKeyHandler(struct BonusClaimProc * proc);
void BonusClaim_DrawTargetUnitSprites(struct BonusClaimProc * proc);
void sub_080AD484(struct BonusClaimProc * proc);
void BonusClaim_StartSelectTargetSubMenu(struct BonusClaimProc * proc);
bool TryClaimBonusItem(struct BonusClaimProc * proc);
void BonusClaim_Loop_SelectTargetKeyHandler(struct BonusClaimProc * proc);
void BonusClaim_EndSelectTargetSubMenu(struct BonusClaimProc * proc);
void BonusClaim_DrawItemSentPopup(struct BonusClaimProc * proc);
void BonusClaim_Loop_PopupDisplayTimer(struct BonusClaimProc * proc);
void BonusClaim_ClearItemSentPopup(void);
void BonusClaim_OnEnd(struct BonusClaimProc * proc);
void StartBonusClaimScreen(ProcPtr parent);
