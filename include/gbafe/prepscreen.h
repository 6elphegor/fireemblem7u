#pragma once

#include "global.h"

enum proc_label_atmenu {
	PL_ATMENU_01 = 1,
	PL_ATMENU_02,
	PL_ATMENU_03,
	PL_ATMENU_04,
	PL_ATMENU_05,
	PL_ATMENU_06,
	PL_ATMENU_07,
	PL_ATMENU_08,
	PL_ATMENU_09,
	PL_ATMENU_0A,
	PL_ATMENU_0B,
	PL_ATMENU_0C,
	PL_ATMENU_0D,
	PL_ATMENU_0E,
	PL_ATMENU_0F,
	PL_ATMENU_10,
};

struct ProcAtMenu {
    PROC_HEADER;
    /* 29 */ u8 unit_count;
    /* 2A */ u8 max_counter; // Total unit number can be on battle
    /* 2B */ u8 cur_counter; // Total unit number to be on battle

    /* 2C */ u8 unk_2C;

    /* 2D */ u8 cur_cmd;
    /* 2E */ u8 hand_pos;     // related to the displayed line maybe (also for handle sprite)
    /* 2F */ u8 cmd_mask;

    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 unk_32;

    /* 33 */ u8 state;
    /* 34 */ u8 do_help;     // 1 if helpBox on

    /* 35 */ u8 unk_35;

    /* 36 */ bool8 end_prep;

    /* 38 */ u8 unk_38[0x3C - 0x38];

    /* 3C */ u16 yDiff; // y Pos offset of Unit SMS

    /* 3E */ u16 unk3E;

    /* 40 */ u32 xDiff;
};
PROC_SIZE_CHECK(struct ProcAtMenu);

struct SioPidPool {
    u8 pids[8];
};
GBA_SIZE_CHECK(struct SioPidPool, 0x8);

extern EWRAM_DATA struct SioPidPool gSioPidPool;

struct PrepUnitList {
    struct Unit *units[0x40];
    int max_num;        /* A counter maybe related to the amount of units in team */
    int latest_pid;     /* Last unit char-id when you leave the prep-unit-screen */
};

extern EWRAM_OVERLAY(0) struct PrepUnitList gPrepUnitList;

struct PrepScreenItemListEnt {
    /* 00 */ u8 pid; // 0 if item is in Supply inventory
    /* 01 */ u8 itemSlot;
    /* 02 */ u16 item;
};

extern EWRAM_OVERLAY(0) struct PrepScreenItemListEnt gPrepScreenItemList[400];
extern EWRAM_OVERLAY(0) struct PrepScreenItemListEnt gPrepScreenExtraItemList[400];

extern EWRAM_OVERLAY(0) u16 Unk_Prep_02012464;
extern EWRAM_OVERLAY(0) u16 Unk_Prep_02012466;

int GetPrepMainMenuInfoxMsg(void);
int PrepOptionCountToRealIndexByMask(int target, int mask);
int GetPrepOptionCount(int mask);
void PutPrepMenuUiImg(int vram, int palId);
void sub_0808DB14(u16 * tm, int b, u32 c, int d);
void PrepScreenMenu_OnPickUnits(struct ProcAtMenu * proc);
void PrepScreenMenu_OnItems(struct ProcAtMenu * proc);
void PrepScreenMenu_OnSupport(struct ProcAtMenu * proc);
void PrepScreenMenu_OnSave(struct ProcAtMenu * proc);
int PrepScreenMenu_OnStartPress(struct ProcAtMenu * proc);
// PrepScreenMenu_808E57C
void sub_0808DC3C(struct ProcAtMenu * proc);
int PrepScreenMenu_OnBPress(struct ProcAtMenu * proc);
void PrepScreenMenu_OnCheckMap(struct ProcAtMenu * proc);
// nullsub_74
// nullsub_75
void nullsub_74(void);
void nullsub_75(void);
void ResetSioPidPool(void);
void RegisterSioPid(u8 val);
void RemoveSioPid(u8 val);
struct Unit * GetUnitFromPrepList(int index);
void RegisterPrepUnitList(int index, struct Unit *);
int PrepGetUnitAmount();
void PrepSetUnitAmount(int);
int PrepGetLatestCharId();
void PrepSetLatestCharId(int val);
// IsCharacterForceDeployed
// CalcForceDeployedUnitCounts
bool IsCharacterForceDeployed(int pid);
s32 CalcForceDeployedUnitCounts(void);
bool SomeLeftoverFunctionThatReturns0(struct Unit *unit);
bool IsUnitInCurrentRoster(struct Unit *unit);
// AtMenu_AddPrepScreenSupportMenuItem
void AtMenu_AddPrepScreenSupportMenuItem(struct ProcAtMenu *proc);
bool CanPrepScreenCheckMap(void);
void InitPrepScreenMainMenu(struct ProcAtMenu *proc);
int GetLatestUnitIndexInPrepListByUId(void);
int PrepGetLatestUnitIndex(void);
void ReorderPlayerUnitsBasedOnDeployment(void);
void SortPlayerUnitsForPrepScreen(void);
void RemoveSomeUnitItems(void);
void MakePrepUnitList(void);
int UnitGetIndexInPrepList(int pid);
void PrepUpdateSMS(void);
void PrepAutoCapDeployUnits(struct ProcAtMenu *proc);
void PrepRestartMuralBackground(void);
void EndMuralBackground_(void);
// nullsub_76
void Prep_DrawChapterGoal(int vram_offset, int pal_bank);
void PrepAtMenu_OnInit(struct ProcAtMenu *proc);

// prep_menu.c
void StartPrepScreenMenu(ProcPtr proc);
void SetPrepScreenMenuOnBPress(const void * func);
void SetPrepScreenMenuOnStartPress(const void * func);
void SetPrepScreenMenuOnEnd(const void * func);
void SetPrepScreenMenuItem(int index, const void * func, int color, int msg, int msg_rtext);
void SetPrepScreenMenuSelectedItem(int index);
void DrawPrepScreenMenuFrameAt(int x, int y);

struct ProcPrepMenuDesc {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ u16 unk4C;

    STRUCT_PAD(0x4E, 0x58);

    /* 58 */ int msg;
};
PROC_SIZE_CHECK(struct ProcPrepMenuDesc);

// ResetPrepMenuDescTexts
// ParsePrepMenuDescTexts
// DrawPrepMenuDescTexts
void PrepMenuDescOnInit(struct ProcPrepMenuDesc * proc);
void sub_0808E60C(struct ProcPrepMenuDesc * proc);
void PrepMenuDescOnParse(struct ProcPrepMenuDesc * proc);
void PrepMenuDescOnDraw(void);
void StartPrepMenuDescHandler(int msg, ProcPtr parent);
// StartPrepAtSubMenuUI
void DrawAtMenuUpfx(int tile, int pal);
void AtMenu_Reinitialize(struct ProcAtMenu *proc);
void EndPrepAtMenuIfNoUnitAvailable(struct ProcAtMenu *proc);
void AtMenu_UpdateDesc(struct ProcAtMenu *proc);
// AtMenu_DrawSubmenuTexts
// CleanupPrepMenuScreen
void AtMenu_SetupCtrlUI(struct ProcAtMenu *proc);
void AtMenu_CtrlLoop(struct ProcAtMenu *proc);
void AtMenuSetUnitStateAndEndFlag(struct ProcAtMenu *proc);
void AtMenu_ResetScreenEffect(struct ProcAtMenu *proc);
void AtMenu_ResetBmUiEffect(struct ProcAtMenu *proc);
void AtMenu_StartSubmenu(struct ProcAtMenu *proc);
void AtMenu_OnSubmenuEnd(struct ProcAtMenu *proc);
// sub_808F7B4
void AtMenu_LockGame(struct ProcAtMenu *proc);
void AtMenu_UnlockGame(struct ProcAtMenu *proc);
// StartPrepAtMenu
// StartPrepAtMenuWithConfig
bool HasConvoyAccess_(int kind);
// sub_0808EF94
// sub_0808EFFC
// sub_808F970
void AtUnkMenu_Reinitialize(struct ProcAtMenu *proc);
void sub_0808F36C(struct ProcAtMenu *proc);
void sub_0808F3B8(struct ProcAtMenu *proc);
void sub_0808F3D0(struct ProcAtMenu *proc);
void sub_0808F43C(struct ProcAtMenu *proc);
void sub_0808F4A8(struct ProcAtMenu *proc);
void sub_0808F52C(struct ProcAtMenu *proc);
void sub_0808F598(struct ProcAtMenu *proc);
void sub_0808F5A0(struct ProcAtMenu *proc);
void ConvoyPromotion_Init(ProcPtr proc);
void IsGameLockLevelReserved(ProcPtr proc);
void NullExpForChar100AndResetScreen(ProcPtr proc);
void PrepPromoteDebugMaybe(struct ProcAtMenu *proc);
void sub_0808F7A8(struct ProcAtMenu *proc);
// sub_8090104
// sub_8090118
// sub_8090130
void sub_0808F808(int xOam1, int yOam0, int config, u16 oam2);
// PrepScreenSprite_OnDraw
// nullsub_77

struct ProcPrepSpecialChar {
    PROC_HEADER;

    u8 unk_29;
    u8 unk_2A;
    u8 unk_2B;

    STRUCT_PAD(0x2C, 0x2F);

    /* 2F */ u8 config;

    STRUCT_PAD(0x30, 0x32);

    /* 32 */ u8 blink_n;
    /* 34 */ u16 timer;
    /* 38 */ ProcPtr approc;
};
PROC_SIZE_CHECK(struct ProcPrepSpecialChar);

void ProcPrepSpChar_OnInit(struct ProcPrepSpecialChar *proc);
void ProcPrepSpChar_Idle(struct ProcPrepSpecialChar *proc);
void ProcPrepSpChar_OnEnd(struct ProcPrepSpecialChar *proc);
void PrepSpecialChar_BlinkButtonStart(void);
ProcPtr StartPrepSpecialCharEffect(ProcPtr parent);
void EndPrepSpecialCharEffect(void);

// sub_0808FABC
void PrepMenu_OnInit(ProcPtr proc);
void PrepMenu_CtrlLoop(ProcPtr proc);
void PrepMenu_ShowFrozenHand(ProcPtr proc);
void PrepMenu_ShowActiveHand(ProcPtr proc);
void PrepMenu_OnEnd(ProcPtr proc);
// PrepMenu_OnEnd
// StartPrepScreenMenu
// SetPrepScreenMenuOnBPress
// SetPrepScreenMenuOnStartPress
// SetPrepScreenMenuOnEnd
// SetPrepScreenMenuItem
// SetPrepScreenMenuSelectedItem
int GetActivePrepMenuItemIndex(void);
// DrawPrepScreenMenuFrameAt
// GetPrepMenuItemAmt
void EndPrepScreenMenu(void);
// ResetPrepMenuScreen
// sub_8090A88
// ShowPrepScreenMenuFrozenHand
// sub_8090AC0
void EnablePrepScreenMenu(void);
void MenuScroll_Init(ProcPtr proc);
void MenuScroll_Loop(ProcPtr proc);
// LockMenuScrollBar
// TryHideMenuScrollBar
// EndMenuScrollBar
// StartMenuScrollBar
// PutMenuScrollBarAt
// UpdateMenuScrollBarConfig
// InitMenuScrollBarImg
ProcPtr StartMenuScrollBar(ProcPtr parent);
void PutMenuScrollBarAt(int x, int y);
void UpdateMenuScrollBarConfig(u8 segments, u16 currentSegment, u16 totalRows, u8 visibleRows);
void InitMenuScrollBarImg(int chr, int pal);
// sub_08090540
// sub_08090580

struct ProcPrepMuralBackground {
    PROC_HEADER;

    /* 2A */ u16 timer;
    /* 2C */ u8 unk_2C;
    /* 2D */ u8 pal_bank;
};
PROC_SIZE_CHECK(struct ProcPrepMuralBackground);

void PrepMuralBackground_Init(struct ProcPrepMuralBackground *proc);
void PrepMuralBackground_Loop(struct ProcPrepMuralBackground *proc);
struct ProcPrepMuralBackground * StartPrepMuralBackground(ProcPtr parent, int pal_bank);
void EndPrepMuralBackground(void);
// SallyCir_OnHBlank

struct SallyCirProc {
    PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2A */ s8 unk_2a;
    /* 2C */ int unk_2c;
};
PROC_SIZE_CHECK(struct SallyCirProc);

void SallyCir_Init(struct SallyCirProc *proc);
void SallyCir_Loop(struct SallyCirProc *proc);
void SallyCir_OnEnd(struct SallyCirProc *proc);
ProcPtr StartSallyCirProc(ProcPtr parent, u8 unk);
// sub_08090A58
// sub_08090B18
// sub_8091588
u8 GetConvoyItemCount_(void);
void ViewCounter_Loop(ProcPtr proc);
// StartViewCounter
void TryLockProc(ProcPtr proc);
void TryUnlockProc(ProcPtr proc);
void PrepHbKeyListener_Loop(ProcPtr proc);
// StartPrepErrorHelpbox
ProcPtr StartPrepErrorHelpbox(int x, int y, int msgId, ProcPtr parent);
// IsWeaponUsable
// CountUnitUsableWeapons
// sub_08090DB0
s8 sub_08090DB0(struct Unit * unit);
s8 CheckValidLinkArenaItemSwap(struct Unit * unitA, int slotA, struct Unit * unitB, int slotB);
// CheckValidLinkArenaItemSupply
// sub_08090EE8
// sub_08090F30
void sub_08090F30(void);

struct PrepItemTypePageEnt {
    /* 00 */ u8 lowerBound;
    /* 01 */ u8 upperBound;
};

// GetPrepPageForItem
// sub_08090F9C
// SomethingPrepListRelated
// sub_0809120C
// sub_08091250
// sub_08091270
// sub_08091298
// sub_080912CC
// CanUnitPrepScreenUse

struct PrepItemScreenProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 hoverUnitIdx;
    /* 2A */ u8 selectedUnitIdx;
    /* 2B */ s8 hasConvoyAccess;
    /* 2C */ u8 helpboxActiveIdx;
    /* 2D */ u8 popupPromptIdx;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ u8 scrollAmount;
    /* 31 */ s8 unitSelected;
    /* 32 */ u16 scrollOffset;
    /* 34 */ u16 xFacePosBySlot[2];
    /* 38 */ u16 yFacePosBySlot[2];
    /* 3C */ u16 faceDispBySlot[2];
    /* 40 */ struct Unit * pUnits[2];
};

extern struct Text gPrepItemTexts[31];

void PrepItemScreen_OnHBlank(void);
void PrepItemScreen_Init(struct PrepItemScreenProc * proc);
void PrepItemScreen_DrawFunds(void);
void PrepItemScreen_HideFunds(void);
void PrepItemScreen_SetupGfx(struct PrepItemScreenProc * proc);
void PrepItemScreen_OnEnd(struct PrepItemScreenProc * proc);
void sub_08091868(u16 * tm);
void sub_080918B4(void);
void sub_080918D4(void);
void sub_080918F4(void);
void sub_08091914(void);
void sub_08091944(int vram, int pal);
void sub_08091994(int vram, int pal);
void PrepItemScreen_Reinit(struct PrepItemScreenProc * proc);
s8 sub_08091AD8(struct PrepItemScreenProc * proc);
void sub_08091C48(struct PrepItemScreenProc * proc);
void PrepItemScreen_StartStatScreen(struct PrepItemScreenProc * proc);
void PrepItemScreen_ResumeFromStatScreen(struct PrepItemScreenProc * proc);
void sub_08091DBC(struct PrepItemScreenProc * proc);
void sub_08091F04(struct PrepItemScreenProc * proc, u16 * tm, struct Unit * unit);
void sub_08092010(struct PrepItemScreenProc * proc);
void sub_0809210C(struct PrepItemScreenProc * proc);
void sub_0809218C(struct PrepItemScreenProc * proc);
void sub_080921E8(struct PrepItemScreenProc * proc);
void sub_08092220(struct PrepItemScreenProc * proc);
void sub_08092578(struct PrepItemScreenProc * proc);
void sub_080925D0(struct PrepItemScreenProc * proc);
void sub_080926F8(struct PrepItemScreenProc * proc);
void PrepItemScreen_Loop_MainKeyHandler(struct PrepItemScreenProc * proc);
void StartPrepItemTradeScreen(struct PrepItemScreenProc * proc);
void StartPrepItemUse(struct PrepItemScreenProc * proc);
void StartPrepItemSupply(struct PrepItemScreenProc * proc);
void StartPrepArmory(struct PrepItemScreenProc * proc);
void StartPrepItemListScreen(struct PrepItemScreenProc * proc);
void UpdatePrepItemScreenFace(int slot, struct Unit * unit, u16 x, u16 y, u16 disp);
void EndPrepItemScreenFace(int slot);
ProcPtr StartPrepItemScreen(ProcPtr parent);
void sub_080929D0(struct Text * text, u16 * tm, struct Unit * unit, u16 flags);
void sub_08092AE4(struct PrepItemScreenProc * proc);
void sub_08092B6C(struct PrepItemScreenProc * proc, u8 row, s8 flag);
bool sub_08092C34(u32 x, int y);
void PrepItem_DrawSMS(struct PrepItemScreenProc * proc);
void PrepItemDrawPopupBox(int x, int y, int w, int h, int oam2);
void sub_08092ED4(struct PrepItemScreenProc * proc, u8 flag);
bool PrepItemScreen_GiveAll(struct Unit * unit);
struct ProcPrepUnit {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 cur_counter; // Total unit number to be on battle
    /* 2A */ u8 max_counter; // Total unit number can be on battle
    /* 2B */ u8 unk_2B;
    /* 2C */ u16 list_num_pre; // pre unit index in prep-list(for scroll)
    /* 2E */ u16 list_num_cur; // current unit index in prep-list
    /* 30 */ u16 yDiff_cur; // y Pos offset of Unit SMS (current)
    /* 32 */ u16 unk_32;
    /* 34 */ u16 unk_34;
    /* 36 */ u8 scroll_val; // each px to scroll at each frame
    /* 37 */ u8 button_blank;
    /* 38 */ u8 pad_38[0x3C - 0x38];
    /* 3C */ u16 unk_3C;
};

extern struct Text gPrepUnitTexts[0x16];

void PrepUnit_DrawUnitListNames(struct ProcPrepUnit *proc, int line);
void PrepUpdateMenuTsaScroll(int val);
void PrepUnit_DrawSMSAndObjs(struct ProcPrepUnit *proc);
void PrepUnit_InitTexts(void);
void PrepUnit_InitGfx(void);
void sub_08093250(ProcPtr parent, u32 obj_offset);
void PrepUnit_InitSMS(struct ProcPrepUnit *proc);
void PrepUnit_DrawLeftUnitName(struct Unit *unit);
void PrepUnit_DrawLeftUnitNameCur(struct ProcPrepUnit *proc);
void PrepUnit_DrawUnitItems(struct Unit *unit);
void PrepUnit_DrawPickLeftBar(struct ProcPrepUnit *proc, s8 val);
s8 PrepCheckCanSelectUnit(struct ProcPrepUnit *proc, struct Unit *unit);
s8 PrepCheckCanUnselectUnit(struct ProcPrepUnit *proc, struct Unit *unit);
s8 PrepUnit_HandlePressA(struct ProcPrepUnit *proc);
void sub_08093734(void);
s8 ShouldPrepUnitMenuScroll(struct ProcPrepUnit *proc);
void sub_080937CC(struct ProcPrepUnit * proc);
void sub_08093814(struct ProcPrepUnit * proc);
void ProcPrepUnit_OnInit(struct ProcPrepUnit *proc);
void ProcPrepUnit_InitScreen(struct ProcPrepUnit *proc);
void sub_08093A7C(struct ProcPrepUnit *proc);
void ProcPrepUnit_Idle(struct ProcPrepUnit *proc);
void PrepUnitScreen_Loop_B(struct ProcPrepUnit *proc);
void PrepUnitScreen_Loop_D(struct ProcPrepUnit *proc);
void nullsub_11(void);
void sub_08093DE8(struct ProcPrepUnit *proc);
void sub_08093E00(struct ProcPrepUnit *proc);
void PrepUnitScreen_Loop_C(struct ProcPrepUnit *proc);
void ProcPrepUnit_OnEnd(struct ProcPrepUnit *proc);
void ProcPrepUnit_OnGameStart(struct ProcPrepUnit *proc);
void sub_08093ED8(struct ProcPrepUnit *proc);
void sub_08093EF8(struct ProcPrepUnit *proc);
void PrepUnitDisableDisp(struct ProcPrepUnit *proc);
void PrepUnitEnableDisp(struct ProcPrepUnit *proc);
void sub_08093F84(struct ProcPrepUnit *proc);
void sub_08093FA0(struct ProcPrepUnit *proc);

struct PrepMenuTradeProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit * units[2];
    /* 34 */ int cursorItemSlot; // 0x0-0x4 = left side, 0x8-0xC = right side
    /* 38 */ int selectedItemSlot;
    /* 3C */ int helpBoxItemSlot;
    /* 40 */ int unk_40;
};

void PrepItemTrade_ApplyItemSwap(struct Unit * unitA, int itemSlotA, struct Unit * unitB, int itemSlotB);
s8 PrepItemTrade_DpadKeyHandler(struct PrepMenuTradeProc * proc);
void DrawPrepScreenItems(u16 * tm, struct Text * th, struct Unit * unit, u8 checkPrepUsability);
void DrawPrepScreenItemIcons(u16 * tm, struct Unit * unit);
void PrepItemTrade_Init(struct PrepMenuTradeProc * proc);
void PrepItemTrade_Loop_MainKeyHandler(struct PrepMenuTradeProc * proc);
void PrepItemTrade_OnEnd(void);
void StartPrepItemTradeScreenProc(struct Unit * unitA, struct Unit * unitB, ProcPtr parent);
void sub_0809496C(struct Unit * unitA, struct Unit * unitB, int rightItemIdx, ProcPtr parent);
struct ProcPrepItemUse {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit * unit;
    /* 30 */ int slot;
    /* 34 */ int unk34;
    /* 38 */ int slot_rtext;
    /* 3C */ int pos_subbox;
    /* 40 */ int game_lock;
};

bool PrepItemUseTryMoveHand(struct ProcPrepItemUse * proc);
void DrawPrepScreenItemUseStatLabels(struct Unit * unit);
void DrawPrepScreenItemUseStatBars(struct Unit * unit, int mask);
void DrawPrepScreenItemUseStatValues(struct Unit * unit);
// sub_8095750
void PrepItemUseParallel_UpdateSMS(struct ProcPrepItemUse * proc);
void PrepItemUse_OnInit(struct ProcPrepItemUse * proc);
// sub_8095830
// sub_8095B64
// sub_8095C90
// sub_8095CA8
// sub_8095D1C
// sub_8095D38
// sub_8095D58
void PrepItemUse_HandleItemEffect(struct ProcPrepItemUse * proc);
// PrepItemUse_ExecPromotionItem
void PrepItemUse_WaitPromotionDone(struct ProcPrepItemUse * proc);
void PrepItemUse_PostPromotion(struct ProcPrepItemUse * proc);
void PrepItemUse_ResetBgmAfterPromo(void);
void sub_08095894(void);
// StartPrepItemUseScreen
struct ProcPrepItemUseBooster {
    /* 00 */ PROC_HEADER;

    /* 2C */ int timer;
    /* 30 */ u8 status_pre[8];
    /* 38 */ u8 status_pst[8];
    /* 40 */ int xpos, ypos, width, height;
};

void PrepItemUseBooster_OnDraw(struct ProcPrepItemUseBooster * proc, int x, int y, int msg, int item);
void PrepItemUseBooster_OnInit(struct ProcPrepItemUseBooster * proc);
void PrepItemUseBooster_IDLE(struct ProcPrepItemUseBooster * proc);
void PrepItemUseBooster_OnEnd(struct ProcPrepItemUseBooster * proc);
struct PrepItemSupplyProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit * unit;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unitInvIdx;
    /* 32 */ s8 scrollAmount;
    /* 33 */ u8 unk_33;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 currentPage;
    /* 36 */ u16 unk_36;
    /* 38 */ u16 unk_38;
    /* 3A */ u16 idxPerPage[9];
    /* 4C */ u16 yOffsetPerPage[9];
};

struct PrepItemSuppyText {
    /* 00 */ struct Font font;
    /* 18 */ struct Text th[18];
};

extern struct PrepItemSuppyText PrepItemSuppyTexts;

// sub_80963FC
void sub_08095C28(int idx, ProcPtr proc);
void StoreConvoyWeaponIconGraphics(int vramOffset, int pal);
void sub_08095CA8(struct Text * textBase, u16 * tm, int yLines, struct Unit * unit);
void sub_08095DC0(u16 * tm, int yLines);
void sub_08095E24(struct Text * textBase, u16 * tm, int yLines, struct Unit * unit);
void PrepItemSupply_OnHBlank(void);
void PrepItemSupply_Init(struct PrepItemSupplyProc * proc);
void sub_08095F90(void);
void sub_08095FCC(struct PrepItemSupplyProc * proc);
void sub_08096054(void);
void PutGiveTakeBoxSprites(void);
void PutGiveSprites(void);
void PutTakeSprites(void);
void Supply_PutHighlightedCategorySprites(struct PrepItemSupplyProc * proc);
void sub_08096260(u16 * tm, u32 chr, int pal);
// sub_8096A78
void sub_08096604(struct PrepItemSupplyProc * proc);
void PrepItemSupply_Loop_GiveTakeKeyHandler(struct PrepItemSupplyProc * proc);
void sub_0809689C(struct PrepItemSupplyProc * proc);
void PrepItemSupply_SwitchPageLeft(struct PrepItemSupplyProc * proc);
void PrepItemSupply_SwitchPageRight(struct PrepItemSupplyProc * proc);
void sub_08096A98(struct PrepItemSupplyProc * proc);
void sub_08096B1C(struct PrepItemSupplyProc * proc);
void PrepItemSupply_ScrollVertical(struct PrepItemSupplyProc * proc, int amount);
void sub_08096C54(void);
void sub_08096C60(struct PrepItemSupplyProc * proc);
void sub_08096DC0(struct PrepItemSupplyProc * proc);
s8 sub_0809714C(struct PrepItemSupplyProc * proc);
void PrepItemSupply_SwitchToUnitInventory(struct PrepItemSupplyProc * proc);
void PrepItemSupply_GiveItemToSupply(struct PrepItemSupplyProc * proc);
void PrepItemSupply_Loop_UnitInvKeyHandler(struct PrepItemSupplyProc * proc);
// sub_8097BBC
void StartPrepItemSupplyProc(struct Unit * unit, ProcPtr parent);
void sub_08097488(void);
void sub_080974A8(void);
void StartBmSupply(struct Unit * unit, ProcPtr parent);
void MaybeStartSelectConvoyItemProc(struct Unit * unit, ProcPtr parent);
struct PrepItemListProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unit;
    /* 30 */ u8 unitInvIdx;
    /* 31 */ s8 scrollAmount;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 currentPage;
    /* 34 */ u16 unk_34;
    /* 36 */ u16 unk_36;
    /* 38 */ u16 idxPerPage[9];
    /* 4A */ u16 yOffsetPerPage[9];
};

void PrepItemList_Init(struct PrepItemListProc * proc);
void sub_08097554(void);
void PrepItemList_DrawCurrentOwnerText(struct PrepItemListProc * proc);
void List_PutHighlightedCategorySprites(struct PrepItemListProc * proc);
void PrepItemList_InitGfx(struct PrepItemListProc * proc);
void PrepItemList_OnEnd(struct PrepItemListProc * proc);
void sub_08097A9C(struct PrepItemListProc * proc);
void PrepItemList_SwitchPageLeft(struct PrepItemListProc * proc);
void PrepItemList_SwitchPageRight(struct PrepItemListProc * proc);
void sub_08097CAC(struct PrepItemListProc * proc);
void PrepItemList_ScrollVertical(struct PrepItemListProc * proc, int amount);
// sub_8098558
void sub_08097DD4(struct PrepItemListProc * proc);
void PrepItemList_Loop_MainKeyHandler(struct PrepItemListProc * proc);
s8 sub_08098274(struct PrepItemListProc * proc);
void PrepItemList_SwitchToUnitInventory(struct PrepItemListProc * proc);
void sub_0809835C(struct PrepItemListProc * proc);
void PrepItemList_Loop_UnitInvKeyHandler(struct PrepItemListProc * proc);
void PrepItemList_StartTradeScreen(struct PrepItemListProc * proc);
// StartPrepItemListScreenProc
struct WmSellProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit * unit;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u16 unk_32;
    /* 34 */ u16 unk_34;
};

void WmSell_DrawSupplyDialogueSpriteText(void);
void sub_080985D4(int index, ProcPtr parent);
void sub_08098618(void);
void WmSell_Init(struct WmSellProc * proc);
void sub_08098660(void);
void WmSell_DrawSellOptionSpriteText(void);
void WmSell_DrawValueSpriteText(void);
void WmSell_DrawItemGoldValue(int item);
void WmSell_DrawPartyFunds(void);
void WmSell_PutSupplyFaceAndText(void);
void WmSell_Setup(struct WmSellProc * proc);
s8 WmSell_MainLoop_HandleDpadKeys(struct WmSellProc * proc);
void sub_08098C18(struct WmSellProc * proc);
void WmSell_OnLoop_MainKeyHandler(struct WmSellProc * proc);
void sub_08098DCC(struct WmSellProc * proc);
void WmSell_ConfirmSellItem(struct WmSellProc * proc);
void WmSell_OnLoop_ConfirmSellKeyHandler(struct WmSellProc * proc);
void WmSell_OnEnd(void);
// StartWorldMapSellScreen
struct PrepProcA1962C {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2C */ int unk_2c;
    /* 30 */ s8 unk_30[4];
};

void sub_08098F88(struct PrepProcA1962C * proc);
// FortuneSubMenu_Init_Null
// nullsub_79
// FortuneSubMenu_Unused_SetAvailableOptions
// FortuneSubMenu_Unused_SetupText
s8 sub_08098FC4(struct PrepProcA1962C * proc);
void sub_08099068(struct PrepProcA1962C * proc);
// sub_8099B2C
void FortuneSubMenu_HandleOptionSwitch(struct PrepProcA1962C * proc);
void StartFortuneSubMenu(int option, ProcPtr parent);
int GetChapterDivinationTextIdHectorStory(void);
int GetChapterDivinationTextIdBeginning(void);
// sub_8099C44
int GetChapterDivinationFee(void);
int GetChapterDivinationPortrait(void);
s8 sub_080992D8(void);
s8 sub_080992F4(void);
s8 sub_0809931C(void);
s8 sub_08099330(void);
s8 sub_08099340(void);
// sub_08099358
// sub_8099DC0
// sub_08099408
// sub_0809945C
// sub_08099474
// sub_08099628
// sub_08099684
// sub_809A0E8
// sub_08099858
// sub_809A270
// sub_080998D8
// sub_08099928
// sub_08099968
// sub_08099A48
// sub_08099AC0
// sub_08099B6C
// sub_809A560
// sub_08099FA0
// sub_809A9FC
// sub_0809A280
// sub_809AD54
// sub_0809A404
// sub_0809A504
// sub_0809A560
// sub_0809A650
// sub_0809A6C0
// sub_0809A824
// sub_0809A83C
// sub_0809A870
// sub_0809A8C8
// sub_0809A8E4
// sub_809B2FC
// sub_809B380
// sub_809B510
// sub_0809AB7C
// sub_809B598
// sub_809B5F8
// sub_0809AC7C
// sub_809B674
// sub_809B6D4
// sub_809B6F8
// sub_0809AD64
// sub_0809ADC0
// sub_0809ADE4
// sub_809B818
// sub_0809AE84
// sub_809B874
// sub_0809AEBC
// sub_0809AEFC
// sub_0809AF94
// sub_809BA00

void StartPrepItemUseScreen(struct Unit * unit, ProcPtr parent);

void StartWorldMapSellScreen(struct Unit * unit, ProcPtr parent);

void StartPrepItemListScreenProc(struct Unit * unit, ProcPtr parent);

void DrawPrepScreenItemUseDesc(struct Unit * unit, int slot);

void PrepItemUse_InitDisplay(struct ProcPrepItemUse * proc);

void PrepItemUse_CtrlLoop(struct ProcPrepItemUse * proc);

void ProcPrepItemUse_OnEnd(void);

void PrepItemUseDrawSubBox(void);

void PrepItemUseClearSubBox(void);

void PrepItemUse_ConfirmWindowInit(struct ProcPrepItemUse * proc);

void PrepItemUse_ConfirmWindowCtrlLoop(struct ProcPrepItemUse * proc);

void PrepItemUse_ExecPromotionItemUnused(struct ProcPrepItemUse * proc);

void sub_08095BF4(void);

void sub_080962A0(struct PrepItemSupplyProc * proc);

void PrepItemSupply_InitGfx(struct PrepItemSupplyProc * proc);

void PrepItemSupply_OnEnd(struct PrepItemSupplyProc * proc);

void FortuneSubMenu_Init_Null(void);

void sub_08098FC0(void);

void FortuneSubMenu_OnOptionSelected(ProcPtr proc);

int GetChapterDivinationTextIdEnding(void);

extern EWRAM_DATA struct SioPidPool gSioPidPool;
extern EWRAM_OVERLAY(0) struct Text gPrepMainMenuTexts[10];

extern CONST_DATA u16 gBgConfig_PrepScreen[];
extern CONST_DATA int Msgs_PrepMainMenuHelpbox[][3];
extern struct ProcCmd ProcScr_PrepMenuDescHandler[];
extern struct ProcCmd CONST_DATA ProcScr_AtMenu[];
extern struct ProcCmd ProcScr_PrepPromoteDebug[];
// ??? ProcScr_AtUnkMenu
// ??? Sprite_08CC3FB6
// ??? Sprite_08CC3FC4
// ??? Sprite_08CC3FCC
// ??? Sprite_08CC3FE6
// ??? Sprites_08CC4060
// ??? ProcScr_PrepSpecialCharEff
// ??? ProcScr_PrepScreenMenuDummyItem
// ??? ProcScr_PrepMenu
// ??? Sprite_MenuScrollContainer
// ??? Sprite_08CC41CC
// ??? Sprite_08CC41D4
// ??? Sprites_08CC421C
// ??? Sprites_08CC4270
// ??? ProcScr_menu_scroll
// ??? ProcScr_PrepMuralBackground
// ??? ProcScr_SallyCir
// ??? ProcScr_ViewCounter
// ??? ProcScr_PrepHelpboxListener
// ??? gPrepItemTypePageLut
// ??? gHelpTextIds_PrepItemScreen
// ??? ProcScr_PrepItemScreen
// ??? Sprite_08CC4818
extern u16 Sprite_08CC482C[];
extern u16 Sprite_08CC4840[];
// ??? ProcScr_PrepUnitScreen
// ??? ProcScr_PrepItemTradeScreen
extern struct ProcCmd ProcScr_PrepItemUseScreen[];
// ??? gUnk_08D8D10C
// ??? gUnk_08D8D118
// ??? ProcScr_PrepItemSupplyScreen
// ??? ProcScr_BmSupplyScreen
// ??? ProcScr_PrepItemListScreen
// ??? gUnk_08D8D410
// ??? gProcScr_PrepWMShopSell
// ??? gUnk_08D8D4E8
// ??? gUnk_08D8D4F8
// ??? gUnk_08D8D51C
// ??? ProcScr_FortuneSubMenu
// ??? gUnk_08D8D5F8
// ??? gUnk_08D8D60C
// ??? gUnk_08D8D620
// ??? gUnk_08D8D634
// ??? gUnk_08D8D674
// ??? gUnk_08D8D688
// ??? gUnk_08D8D720
// ??? gUnk_08D8D738
// ??? gUnk_08D8D744
// ??? gUnk_08D8D84C
// ??? gUnk_08D8DCD4
// ??? sSupportScreenUnits
// ??? ProcScr_SupportScreen
// ??? gUnk_08D8DE48
// ??? gUnk_08D8DEB0
// ??? gUnk_08D8DEB8
// ??? gUnk_08D8DEC6
// ??? gUnk_08D8DED4
// ??? gUnk_08D8DEE2
// ??? gProcScr_SupportUnitSubScreen
// ??? gUnk_08D8E040
// ??? gUnk_08D8E084
// ??? gUnk_08DA4190
// ??? gUnk_08DA41B0
// ??? gUnk_08DA9A98
// ??? gUnk_08DA9AB8
// ??? gUnk_08DA9AD8
// ??? gUnk_08DA9AF8
// ??? gUnk_08DA9B78
// ??? gUnk_08DA9B98
// ??? gUnk_08DA9BB8
// ??? gUnk_08DA9D18
// ??? gUnk_08DA9D38
// ??? gUnk_08DAD284
// ??? gpSramExtraData
// ??? gExtraMapInfo
// ??? gUnk_08DAD29C
