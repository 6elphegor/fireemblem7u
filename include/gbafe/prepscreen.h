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

struct SioPidPool {
    u8 pids[8];
};

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

struct ProcPrepMenuDesc {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ u16 unk4C;

    STRUCT_PAD(0x4E, 0x58);

    /* 58 */ int msg;
};

// ResetPrepMenuDescTexts
// ParsePrepMenuDescTexts
// DrawPrepMenuDescTexts
void PrepMenuDescOnInit(struct ProcPrepMenuDesc * proc);
void sub_0808E60C(struct ProcPrepMenuDesc * proc);
void PrepMenuDescOnParse(struct ProcPrepMenuDesc * proc);
void PrepMenuDescOnDraw(void);
void StartPrepMenuDescHandler(int msg, ProcPtr parent);
// StartPrepAtSubMenuUI
// DrawAtMenuUpfx
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
void sub_0808F690(ProcPtr proc);
void NullExpForChar100AndResetScreen(ProcPtr proc);
void PrepPromoteDebugMaybe(struct ProcAtMenu *proc);
void sub_0808F7A8(struct ProcAtMenu *proc);
// sub_8090104
// sub_8090118
// sub_8090130
// sub_0808F808
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
void sub_0809019C(void);
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

void PrepMuralBackground_Init(struct ProcPrepMuralBackground *proc);
void PrepMuralBackground_Loop(struct ProcPrepMuralBackground *proc);
struct ProcPrepMuralBackground * StartPrepMuralBackground(ProcPtr parent, int pal_bank);
void EndPrepMuralBackground(void);
// sub_080907D4

struct SallyCirProc {
    PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2A */ s8 unk_2a;
    /* 2C */ int unk_2c;
};

void SallyCir_Init(struct SallyCirProc *proc);
void SallyCir_Loop(struct SallyCirProc *proc);
void SallyCir_OnEnd(struct SallyCirProc *proc);
ProcPtr StartSallyCirProc(ProcPtr parent, u8 unk);
// sub_08090A58
// sub_08090B18
// sub_8091588
// GetConvoyItemCount_
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
// CheckValidLinkArenaItemSwap
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
    PROC_HEADER;
};

void PrepItemScreen_OnHBlank(void);
void PrepItemScreen_Init(struct PrepItemScreenProc * proc);
void PrepItemScreen_DrawFunds(void);
void PrepItemScreen_HideFunds(void);
void PrepItemScreen_SetupGfx(struct PrepItemScreenProc * proc);
void PrepItemScreen_OnEnd(struct PrepItemScreenProc * proc);
// sub_08091868
// sub_080918B4
// sub_080918D4
// sub_080918F4
// sub_08091914
// sub_08091944
// sub_08091994
void PrepItemScreen_Reinit(struct PrepItemScreenProc * proc);
// sub_08091AD8
// sub_08091C48
void PrepItemScreen_StartStatScreen(struct PrepItemScreenProc * proc);
void PrepItemScreen_ResumeFromStatScreen(struct PrepItemScreenProc * proc);
void sub_08091DBC(struct PrepItemScreenProc * proc);
// sub_08091F04
// sub_08092010
void sub_0809210C(struct PrepItemScreenProc * proc);
void sub_0809218C(struct PrepItemScreenProc * proc);
void sub_080921E8(struct PrepItemScreenProc * proc);
void sub_08092220(struct PrepItemScreenProc * proc);
// sub_08092578
void sub_080925D0(struct PrepItemScreenProc * proc);
void sub_080926F8(struct PrepItemScreenProc * proc);
void PrepItemScreen_Loop_MainKeyHandler(struct PrepItemScreenProc * proc);
void StartPrepItemTradeScreen(struct PrepItemScreenProc * proc);
void sub_0809288C(struct PrepItemScreenProc * proc);
void sub_080928A4(struct PrepItemScreenProc * proc);
void StartPrepArmory(struct PrepItemScreenProc * proc);
void sub_080928D4(struct PrepItemScreenProc * proc);
// UpdatePrepItemScreenFace
// EndPrepItemScreenFace
// StartPrepItemScreen
// sub_080929D0
// sub_08092AE4
// sub_08092B6C
// sub_08092C34
// PrepItem_DrawSMS
// PrepItemDrawPopupBox
// sub_08092ED4
// PrepItemScreen_GiveAll

struct ProcPrepUnit {
    PROC_HEADER;
};

void PrepUnit_DrawUnitListNames(struct ProcPrepUnit *proc, int line);
void PrepUpdateMenuTsaScroll(int val);
void PrepUnit_DrawSMSAndObjs(struct ProcPrepUnit *proc);
void PrepUnit_InitTexts(void);
void PrepUnit_InitGfx(void);
// sub_08093250
void PrepUnit_InitSMS(struct ProcPrepUnit *proc);
void PrepUnit_DrawLeftUnitName(struct Unit *unit);
void PrepUnit_DrawLeftUnitNameCur(struct ProcPrepUnit *proc);
void PrepUnit_DrawUnitItems(struct Unit *unit);
void PrepUnit_DrawPickLeftBar(struct ProcPrepUnit *proc, s8 val);
bool PrepCheckCanSelectUnit(struct ProcPrepUnit *proc, struct Unit *unit);
bool PrepCheckCanUnselectUnit(struct ProcPrepUnit *proc, struct Unit *unit);
bool PrepUnit_HandlePressA(struct ProcPrepUnit *proc);
// sub_08093734
bool ShouldPrepUnitMenuScroll(struct ProcPrepUnit *proc);
// sub_080937CC
// sub_08093814
void ProcPrepUnit_OnInit(struct ProcPrepUnit *proc);
void ProcPrepUnit_InitScreen(struct ProcPrepUnit *proc);
void sub_08093A7C(struct ProcPrepUnit *proc);
void ProcPrepUnit_Idle(struct ProcPrepUnit *proc);
void sub_08093D54(struct ProcPrepUnit *proc);
void sub_08093D9C(struct ProcPrepUnit *proc);
// nullsub_11
void sub_08093DE8(struct ProcPrepUnit *proc);
void sub_08093E00(struct ProcPrepUnit *proc);
void sub_08093E2C(struct ProcPrepUnit *proc);
void ProcPrepUnit_OnEnd(struct ProcPrepUnit *proc);
void ProcPrepUnit_OnGameStart(struct ProcPrepUnit *proc);
void sub_08093ED8(struct ProcPrepUnit *proc);
void sub_08093EF8(struct ProcPrepUnit *proc);
void PrepUnitDisableDisp(struct ProcPrepUnit *proc);
void PrepUnitEnableDisp(struct ProcPrepUnit *proc);
void sub_08093F84(struct ProcPrepUnit *proc);
void sub_08093FA0(struct ProcPrepUnit *proc);

// PrepItemTrade_ApplyItemSwap
// PrepItemTrade_DpadKeyHandler
// DrawPrepScreenItems
// DrawPrepScreenItemIcons
// sub_08094350
// sub_08094630
// PrepItemTrade_OnEnd
// StartPrepItemTradeScreenProc
// sub_0809496C
// PrepItemUseTryMoveHand
// DrawPrepScreenItemUseStatLabels
// DrawPrepScreenItemUseStatBars
// sub_08094D74
// sub_8095750
// sub_08094FB4
// PrepItemUse_OnInit
// sub_8095830
// sub_8095B64
// sub_8095C90
// sub_8095CA8
// sub_8095D1C
// sub_8095D38
// sub_8095D58
// PrepItemUse_HandleItemEffect
// PrepItemUse_ExecPromotionItem
// PrepItemUse_WaitPromotionDone
// PrepItemUse_PostPromotion
// PrepItemUse_ResetBgmAfterPromo
// sub_08095894
// StartPrepItemUseScreen
// PrepItemUseBooster_OnDraw
// PrepItemUseBooster_OnInit
// PrepItemUseBooster_IDLE
// PrepItemUseBooster_OnEnd
// sub_80963FC
// sub_08095C28
// StoreConvoyWeaponIconGraphics
// sub_08095CA8
// sub_08095DC0
// sub_08095E24
// sub_08095ED8
// sub_08095F14
// sub_08095F90
// sub_08095FCC
// sub_08096054
// sub_08096110
// sub_08096160
// sub_08096198
// sub_080961D0
// sub_08096260
// sub_8096A78
// sub_08096604
// sub_08096668
// sub_0809689C
// sub_08096950
// sub_080969F4
// sub_08096A98
// sub_08096B1C
// sub_08096BB0
// sub_08096C54
// sub_08096C60
// sub_08096DC0
// sub_0809714C
// sub_080971E8
// sub_08097204
// sub_08097324
// sub_8097BBC
// StartPrepItemSupplyProc
// sub_08097488
// sub_080974A8
// StartBmSupply
// MaybeStartSelectConvoyItemProc
// PrepItemList_Init
// sub_08097554
// PrepItemList_DrawCurrentOwnerText
// sub_08097660
// sub_080976F0
// sub_08097A6C
// sub_08097A9C
// sub_08097B64
// sub_08097C08
// sub_08097CAC
// sub_08097D30
// sub_8098558
// sub_08097DD4
// sub_08097E68
// sub_08098274
// sub_08098320
// sub_0809835C
// sub_08098418
// PrepItemList_StartTradeScreen
// StartPrepItemListScreenProc
// WmSell_DrawSupplyDialogueSpriteText
// sub_080985D4
// sub_08098618
// WmSell_Init
// sub_08098660
// sub_0809871C
// sub_08098790
// WmSell_DrawItemGoldValue
// sub_08098868
// sub_080988A8
// sub_08098908
// sub_08098B7C
// sub_08098C18
// sub_08098C78
// sub_08098DCC
// sub_08098E18
// sub_08098EA8
// WmSell_OnEnd
// StartWorldMapSellScreen
// sub_08098F88
// FortuneSubMenu_Init_Null
// nullsub_79
// FortuneSubMenu_Unused_SetAvailableOptions
// FortuneSubMenu_Unused_SetupText
// sub_08098FC4
// sub_08099068
// sub_8099B2C
// sub_08099198
// StartFortuneSubMenu
// sub_080991F8
// GetChapterDivinationTextIdHectorStory
// GetChapterDivinationTextIdBeginning
// sub_8099C44
// sub_080992A0
// GetChapterDivinationPortrait
// sub_080992D8
// sub_080992F4
// sub_0809931C
// sub_08099330
// sub_08099340
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

extern EWRAM_DATA struct SioPidPool gSioPidPool;
extern EWRAM_OVERLAY(0) struct Text gPrepMainMenuTexts[10];

extern CONST_DATA u16 gBgConfig_PrepScreen[];
extern CONST_DATA int Msgs_PrepMainMenuHelpbox[][3];
extern struct ProcCmd ProcScr_PrepMenuDescHandler[];
// ??? ProcScr_AtMenu
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
