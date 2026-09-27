#pragma once

#include "global.h"
#include "proc.h"
#include "text.h"

struct Unit;
struct Trap;

/* ---- uimenu (struct layouts as in fireemblem8u) ---- */

enum { MENU_ITEM_MAX = 11 };

struct MenuDef;
struct MenuItemDef;
struct MenuProc;
struct MenuItemProc;

struct MenuRect { s8 x, y, w, h; };

struct MenuItemDef {
    /* 00 */ const char * name;
    /* 04 */ u16 nameMsgId, helpMsgId;
    /* 08 */ u8 color, overrideId;
    /* 0C */ u8 (* isAvailable)(const struct MenuItemDef *, int number);
    /* 10 */ int (* onDraw)(struct MenuProc *, struct MenuItemProc *);
    /* 14 */ u8 (* onSelected)(struct MenuProc *, struct MenuItemProc *);
    /* 18 */ u8 (* onIdle)(struct MenuProc *, struct MenuItemProc *);
    /* 1C */ int (* onSwitchIn)(struct MenuProc *, struct MenuItemProc *);
    /* 20 */ int (* onSwitchOut)(struct MenuProc *, struct MenuItemProc *);
};

struct MenuDef {
    /* 00 */ struct MenuRect rect;
    /* 04 */ u8 style;
    /* 08 */ const struct MenuItemDef * menuItems;
    /* 0C */ void (* onInit)(struct MenuProc *);
    /* 10 */ void (* onEnd)(struct MenuProc *);
    /* 14 */ void (* _u14)(struct MenuProc *);
    /* 18 */ u8 (* onBPress)(struct MenuProc *, struct MenuItemProc *);
    /* 1C */ u8 (* onRPress)(struct MenuProc *);
    /* 20 */ u8 (* onHelpBox)(struct MenuProc *, struct MenuItemProc *);
};

struct MenuProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct MenuRect rect;
    /* 30 */ const struct MenuDef * def;
    /* 34 */ struct MenuItemProc * menuItems[MENU_ITEM_MAX];
    /* 60 */ u8 itemCount;
    /* 61 */ u8 itemCurrent;
    /* 62 */ u8 itemPrevious;
    /* 63 */ u8 state;
    /* 64 */ u8 backBg : 2;
    /* 64 */ u8 frontBg : 2;
    /* 66 */ u16 tileref;
    /* 68 */ u16 unk68;
};

struct MenuItemProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ short xTile;
    /* 2C */ short yTile;
    /* 30 */ const struct MenuItemDef * def;
    /* 34 */ struct Text text;
    /* 3C */ s8 itemNumber;
    /* 3D */ u8 availability;
};

enum {
    MENU_ENABLED  = 1,
    MENU_DISABLED = 2,
    MENU_NOTSHOWN = 3,
};

enum {
    MENU_ACT_SKIPCURSOR = (1 << 0),
    MENU_ACT_END        = (1 << 1),
    MENU_ACT_SND6A      = (1 << 2),
    MENU_ACT_SND6B      = (1 << 3),
    MENU_ACT_CLEAR      = (1 << 4),
    MENU_ACT_ENDFACE    = (1 << 5),
    MENU_ACT_UNUSED6    = (1 << 6),
    MENU_ACT_DOOM       = (1 << 7),
};

struct MenuProc * StartMenu(const struct MenuDef * def);   /* FE8U: StartOrphanMenu */
struct MenuProc * StartSemiCenteredOrphanMenu(const struct MenuDef * def, int xSubject, int xTileLeft, int xTileRight);
struct MenuProc * StartLockingMenuExt(const struct MenuDef * def, struct MenuRect rect, ProcPtr parent);   /* FE8U: StartMenuAt */
u8 MenuFrozenHelpBox(struct MenuProc * proc, int msgid);
void EndAllMenus(void);

/* ---- target selection (fireemblem8u uiselecttarget.h) ---- */

struct SelectTarget {
    /* 00 */ s8 x, y;
    /* 02 */ s8 uid;
    /* 03 */ s8 extra;
    /* 04 */ struct SelectTarget * next;
    /* 08 */ struct SelectTarget * prev;
};

struct SelectInfo {
    /* 00 */ void (* onInit)(ProcPtr proc);
    /* 04 */ void (* onEnd)(ProcPtr proc);
    /* 08 */ void (* onUnk08)(ProcPtr proc);
    /* 0C */ u8 (* onSwitchIn)(ProcPtr proc, struct SelectTarget * target);
    /* 10 */ u8 (* onSwitchOut)(ProcPtr proc, struct SelectTarget * target);
    /* 14 */ u8 (* onSelect)(ProcPtr proc, struct SelectTarget * target);
    /* 18 */ u8 (* onCancel)(ProcPtr proc, struct SelectTarget * target);
    /* 1C */ u8 (* onHelp)(ProcPtr proc, struct SelectTarget * target);
};

ProcPtr StartMapSelect(const struct SelectInfo * info);   /* NewTargetSelection */
ProcPtr EndTargetSelection(ProcPtr proc);
int CountTargets(void);                                    /* GetSelectTargetCount */

/* ---- target list builders (bmtarget) ---- */

void MakeRescueTargetList(struct Unit * unit);
void MakeDropTargetList(struct Unit * unit);
void MakeTakeTargetList(struct Unit * unit);   /* MakeTakeTargetList */
void MakeGiveTargetList(struct Unit * unit);   /* MakeGiveTargetList */

/* ---- misc externals ---- */

void HideMoveRangeGraphics(void);
void DisplayMoveRangeGraphics(int config);
void StartUnitListScreenField(void);
void NewChapterStatusScreen(ProcPtr parent);
void EventGotoLabel(ProcPtr proc, int label);
int GetSomeFacingDirection(int xFrom, int yFrom, int xTo, int yTo);
void Make6CKOIDOAMM(struct Unit * unit, int facing);

void BmMapFillg(u8 ** map, int value);
void MapAddInBoundedRange(short x, short y, short minRange, short maxRange);
int GetUnitWeaponReach(struct Unit * unit, int slot);
void BuildUnitStandingRangeForReach(struct Unit * unit, int reach);
void ListAttackTargetsForWeapon(struct Unit * unit, int item);
void DrawItemMenuLine(struct Text * text, int item, s8 isUsable, u16 * tm);
void UpdateMenuItemPanel(int slot);
void StartEquipInfoWindow(ProcPtr parent, struct Unit * unit, int x, int y);   /* FE8U: ForceMenuItemPanel */
void sub_080790B8(void);
void sub_080790BC(void);
void ChangeActiveUnitFacing(int x, int y);
void InitObstacleBattleUnit(void);
void BattleGenerateSimulation(struct Unit * actor, struct Unit * target, int x, int y, int itemSlot);
void BattleGenerateBallistaSimulation(struct Unit * actor, struct Unit * target, int x, int y);
void UpdateBattleForecastContents(void);
void CloseBattleForecast(void);
void MakeTradeTargetList(struct Unit * unit);
void sub_0802B678(struct Unit * unit, struct Unit * other, int unk);   /* FE8U: StartTradeMenu */
s8 sub_08034884(struct Unit * unit);   /* FE8U: CanUnitSeize */
int GetAvailableTileEventCommand(s8 x, s8 y);
s8 IsUnitMagicSealed(struct Unit * unit);
void MakeTargetListForRefresh(struct Unit * unit);
s8 CanUnitUseItem(struct Unit * unit, int item);

int GetItemEffect(int item);
int GetItemCantUseMsgid(struct Unit * unit, int item);
void DoItemUse(struct Unit * unit, int item);

int GetUnitItemUseReachBits(struct Unit * unit, int slot);
void MakeTalkTargetList(struct Unit * unit);   /* MakeTalkTargetList */
void MakeTargetListForSupport(struct Unit * unit);   /* MakeTargetListForSupport */
int GetUnitKeyItemSlotForTerrain(struct Unit * unit, int terrain);
void MakeTargetListForDoorAndBridges(struct Unit * unit, int terrain);
s8 CanUnitUseChestKeyItem(struct Unit * unit);
int GetConvoyItemCount(void);
s8 sub_08079D9C(void);   /* HasConvoyAccess */
void StartBmSupply(struct Unit * unit, ProcPtr parent);
void StartAvailableTileEvent(s8 x, s8 y);
s8 ArenaIsUnitAllowed(struct Unit * unit);
void sub_080B267C(void);   /* StartArenaScreen */

void FillBallistaRangeMaybe(struct Unit * unit);
void SetWorkingBmMap(u8 ** map);
int GetItemMinRange(int item);
int GetItemMaxRange(int item);
void MakeTargetListForSteal(struct Unit * unit);
void StartUnitInventoryInfoWindow(ProcPtr parent);
void StartSubtitleHelp(ProcPtr parent, const char * str);
void RefreshUnitStealInventoryInfoWindow(struct Unit * unit);
s8 IsItemStealable(int item);
void sub_08031DFC(ProcPtr parent);   /* StartUnitHpInfoWindow */
void sub_0803202C(ProcPtr parent);   /* RefreshUnitTakeRescueInfoWindows */
void sub_080321E0(ProcPtr parent);   /* StartUnitGiveInfoWindows */
void RefreshUnitHpInfoWindow(struct Unit * unit);
void RefreshUnitRescueInfoWindows(struct Unit * unit);
void RefreshUnitGiveInfoWindows(struct Unit * unit);
void RefreshUnitTakeInfoWindows(struct Unit * unit);
void RefreshUnitInventoryInfoWindow(struct Unit * unit);
void RideBallista(struct Unit * unit);
void TryRemoveUnitFromBallista(struct Unit * unit);
struct MuProc * StartMu(struct Unit * unit);
s8 sub_080347E4(struct Trap * trap);   /* IsBallista */
int sub_0803483C(struct Trap * trap);  /* GetBallistaItemUses */

/* ---- bmmenu.c ---- */

extern const struct MenuDef gUnitActionMenuDef;
extern struct ProcCmd CONST_DATA gProcScr_BackToUnitMenu[];

u8 MapMenu_UnitCommand(struct MenuProc * menu, struct MenuItemProc * menuItem);
void MakeUnitRescueTransferGraphics(struct Unit * from, struct Unit * to);
