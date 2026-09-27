#pragma once

#include "global.h"
#include "proc.h"

// FE8U: bmshop.h

enum {
    SHOP_TYPE_ARMORY        = 0,
    SHOP_TYPE_VENDOR        = 1,
    SHOP_TYPE_SECRET_SHOP   = 2,
};

enum {
    PL_SHOP_ENTRY = 0,
    PL_SHOP_BUY,
    PL_SHOP_BUY_MAIN,
    PL_SHOP_BUY_DONE,
    PL_SHOP_SELL,
    PL_SHOP_SELL_MAIN,
    PL_SHOP_6_UNUSED,
    PL_SHOP_SELL_NOITEM,
    PL_SHOP_ANYTHING_ELSE,
    PL_SHOP_SENDTO_INVENTORY,
    PL_SHOP_SENDTO_INVENTORY_EXT,
    PL_SHOP_BUY_FULL_NO_INEVNTORY,
    PL_SHOP_EXIT,
    PL_SHOP_PREP_ENTRY,
};

#define SHOP_ITEMS_MAX_AMT 20
#define SHOP_TEXT_LINES 5

struct ProcShop {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit * unit;
    /* 30 */ u16 shopItems[20];
    /* 58 */ u16 unk_58;
    /* 5A */ u8 shopItemCount;
    /* 5B */ u8 unitItemCount;
    /* 5C */ u8 head_loc;
    /* 5D */ u8 hand_loc;
    /* 5E */ u8 head_idx;
    /* 5F */ u8 hand_idx;
    /* 60 */ u8 buy_or_sel;
    /* 61 */ u8 shopType;
    /* 62 */ u8 helpTextActive;

    /* 64 */ s16 goldbox_x;
    /* 66 */ s16 goldbox_y;
    /* 68 */ s16 goldbox_oam2;
};

struct ProcShopInit {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 _pad[0x54 - 0x29];
    /* 54 */ struct ProcShop * shopproc;
};

typedef void (* ShopFunc)(ProcPtr, int);

struct ShopState {
    /* 00 */ u16 head_loc;
    /* 02 */ u16 item_cnt;
    /* 04 */ u16 lines;
    /* 06 */ u16 hand_loc;
    /* 08 */ u16 px_per_line;
    /* 0A */ u16 trig;
    /* 0C */ u16 bg2_off;
    /* 10 */ int bg2_base;
    /* 14 */ ShopFunc draw_line;
    /* 18 */ ProcPtr proc;
};

extern u16 CONST_DATA gDefaultShopInventory[];
extern int CONST_DATA gShopDialogueOffsetLut[];
extern int CONST_DATA gShopPortraitLut[];
extern struct ProcCmd CONST_DATA gProcScr_ShopFadeIn[];
extern struct ProcCmd CONST_DATA gProcScr_ShopFadeOut[];
extern struct ProcCmd CONST_DATA gProcScr_Shop[];
extern struct ProcCmd CONST_DATA ProcScr_ShopBuyInit[];
extern struct ProcCmd CONST_DATA ProcScr_ShopSellInit[];
extern u16 CONST_DATA Sprite_ShopGoldBox[];
extern struct ProcCmd CONST_DATA gProcScr_GoldBox[];
extern struct ProcCmd CONST_DATA ProcScr_ShopDrawHand[];
extern struct ShopState * CONST_DATA gShopState;

extern struct Text gShopItemTexts[];
extern struct ShopState sShopState;
extern struct Text gText_GoldBox;

int Shop_GetPortraitIndex(struct ProcShop * proc);
void StartShopDialogue(int baseMsgId, struct ProcShop * proc);
void StartDefaultArmoryScreen(struct Unit * unit, ProcPtr parent);
void StartArmoryScreenOrphaned(struct Unit * unit, u16 * shopItems);
void StartVendorScreenOrphaned(struct Unit * unit, u16 * shopItems);
void StartSecretShopScreenOrphaned(struct Unit * unit, u16 * shopItems);
void StartArmoryScreen2(struct Unit * unit, u16 * shopItems);
void StartShopScreen(struct Unit * unit, const u16 * inventory, u8 shopType, ProcPtr parent);
void UpdateShopItemCounts(struct ProcShop * proc);
void TalkChoice_OnBuy(void);
void TalkChoice_OnSell(void);
void Shop_null_80B4328(struct ProcShop * proc);
void Shop_EntryDialogue(struct ProcShop * proc);
void Shop_HandleEntryDialoguePrompt(struct ProcShop * proc);
void Shop_BuyDialogue(struct ProcShop * proc);
void ShopDrawBuyItemLine(ProcPtr proc, int itemIndex);
void ShopDrawSellItemLine(ProcPtr proc, int itemIndex);
void Shop_InitBuyState(struct ProcShop * proc);
void Shop_Loop_BuyKeyHandler(struct ProcShop * proc);
void Shop_HandleBuyConfirmPrompt_(struct ProcShop * proc);
void Shop_TryAddItemToInventory(struct ProcShop * proc);
void Shop_HandleSendToConvoyPrompt(struct ProcShop * proc);
void Shop_NoSendToConvoyDialogue(struct ProcShop * proc);
void Shop_AddItemToConvoy(struct ProcShop * proc);
void Shop_SendToConvoyDialogue(struct ProcShop * proc);
void Shop_CheckIfConvoyFull(struct ProcShop * proc);
void Shop_ConvoyFullDialogue(struct ProcShop * proc);
void Shop_AnythingElseDialogue(struct ProcShop * proc);
void Shop_SellDialogue(struct ProcShop * proc);
void Shop_InitSellState(struct ProcShop * proc);
void Shop_Loop_SellKeyHandler(struct ProcShop * proc);
void Shop_HandleSellConfirmPrompt(struct ProcShop * proc);
void Shop_SellAnythingElseDialogue(struct ProcShop * proc);
void Shop_AnythingElseRestartDialogue(struct ProcShop * proc);
void Shop_AnythingElseContinueDialogue(struct ProcShop * proc);
void Shop_ExitShopDialogue(struct ProcShop * proc);
void Shop_OnExit(void);
void Shop_PrepEntryDialogue(struct ProcShop * proc);
void Shop_Loop_UnkKeyHandler(struct ProcShop * proc);
void StartShopFadeIn(struct ProcShop * proc);
void StartShopFadeOut(struct ProcShop * proc);
void Shop_Init(struct ProcShop * proc);
void StartUiGoldBox(ProcPtr parent);
void InitGoldBoxText(u16 * tm);
void ClearGoldBoxTextTm2Line(u16 * tm, int lines);
void DisplayGoldBoxText(u16 * tm);
void ShopInitTexts_OnBuy(struct ProcShop * proc);
void DrawShopSoldItems(struct ProcShop * proc);
void InitShopBuyStatus(struct ProcShopInit * proc);
void ShopInitTexts_OnSell(struct ProcShop * proc);
void ShopDrawDefaultSellItemLine(struct ProcShop * proc);
void InitShopSellStatus(struct ProcShopInit * proc);
void DrawShopItemPriceLine(struct Text * text, int item, struct Unit * unit, u16 * tm);
void DrawShopItemLine(struct Text * text, int item, struct Unit * unit, u16 * tm);
u16 GetItemPurchasePrice(struct Unit * unit, int item);
u16 GetItemSellPrice(int item);
s8 IsItemSellable(int item);
void GoldBox_OnLoop(struct ProcShop * proc);
void InitShopScreenConfig(void);
void _DisplayShopUiArrows(void);
void DisplayShopUiArrows(void);
void UnpackUiVArrowGfx(int chr, int pal);
void DisplayUiVArrow(int x, int y, u16 oam2, int flip);
void HandleShopBuyAction(struct ProcShop * proc);
int ShopTryMoveHand(int pos, int pre, s8 scroll);
void ShopSt_SetHeadLocBak(int loc);
int ShopTryScrollPage(int head, int count, int lines, int hand);
int ShopUpdateBg2Offset(int cur, int target, int trig);
void RegisterShopState(u16 head_loc, u16 item_cnt, u16 lines, u16 hand_loc, int bg_off, ShopFunc draw_line, struct ProcShop * proc);
void Shop_TryMoveHandPage(void);
u16 ShopSt_GetHeadLoc(void);
int ShopSt_GetBg2Offset(void);
u16 ShopSt_GetHandLoc(void);
void ShopSt_SetLineHeight(int px);
void ShopSt_SetSetPageScrollTrigOffset(int trig);
s8 IsShopPageScrolling(void);
s8 ShouldDisplayUpArrow(void);
s8 ShouldDisplayDownArrow(void);
