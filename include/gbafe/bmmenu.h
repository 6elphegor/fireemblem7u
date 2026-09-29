#pragma once

#include "global.h"
#include "proc.h"
#include "text.h"
#include "bmtarget.h"
#include "bmarch.h"

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
ProcPtr EndMenu(struct MenuProc * proc);
void EndAllMenus(void);

/* ---- target selection (fireemblem8u uiselecttarget.h) ---- */

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
ProcPtr NewTargetSelection_Specialized(const struct SelectInfo * info, u8 (* onSelect)(ProcPtr, struct SelectTarget *));
ProcPtr EndTargetSelection(ProcPtr proc);

/* target list builders: see bmtarget.h */

/* ---- misc externals ---- */

void HideMoveRangeGraphics(void);
void DisplayMoveRangeGraphics(int config);
void StartUnitListScreenField(void);
void NewChapterStatusScreen(ProcPtr parent);
int GetSomeFacingDirection(int xFrom, int yFrom, int xTo, int yTo);
void Make6CKOIDOAMM(struct Unit * unit, int facing);

int GetUnitWeaponReach(struct Unit * unit, int slot);
void BuildUnitStandingRangeForReach(struct Unit * unit, int reach);
void DrawItemMenuLine(struct Text * text, int item, s8 isUsable, u16 * tm);
void UpdateMenuItemPanel(int slot);
void StartEquipInfoWindow(ProcPtr parent, struct Unit * unit, int x, int y);   /* FE8U: ForceMenuItemPanel */
s8 sub_080790B8(void);
s8 sub_080790BC(void);
void ChangeActiveUnitFacing(int x, int y);
void InitObstacleBattleUnit(void);
void BattleGenerateSimulation(struct Unit * actor, struct Unit * target, int x, int y, int itemSlot);
void BattleGenerateBallistaSimulation(struct Unit * actor, struct Unit * target, int x, int y);
void UpdateBattleForecastContents(void);
void CloseBattleForecast(void);
ProcPtr StartTradeMenu(struct Unit * unit, struct Unit * other, int unk);
s8 CanUnitSeize(struct Unit * unit);   /* FE8U: CanUnitSeize */
int GetAvailableTileEventCommand(s8 x, s8 y);
s8 IsUnitMagicSealed(struct Unit * unit);
s8 CanUnitUseItem(struct Unit * unit, int item);

int GetItemEffect(int item);
int GetItemCantUseMsgid(struct Unit * unit, int item);
void DoItemUse(struct Unit * unit, int item);

int GetUnitItemUseReachBits(struct Unit * unit, int slot);
int GetUnitKeyItemSlotForTerrain(struct Unit * unit, int terrain);
s8 CanUnitUseChestKeyItem(struct Unit * unit);
int GetConvoyItemCount(void);
s8 sub_08079D9C(void);   /* HasConvoyAccess */
void StartBmSupply(struct Unit * unit, ProcPtr parent);
void StartAvailableTileEvent(s8 x, s8 y);
s8 ArenaIsUnitAllowed(struct Unit * unit);
void StartArenaScreen(void);   /* StartArenaScreen */

void SetWorkingBmMap(u8 ** map);
void StartUnitInventoryInfoWindow(ProcPtr parent);
void StartSubtitleHelp(ProcPtr parent, const char * str);
void RefreshUnitStealInventoryInfoWindow(struct Unit * unit);
void StartUnitHpInfoWindow(ProcPtr parent);   /* StartUnitHpInfoWindow */
void RefreshUnitTakeRescueInfoWindows(ProcPtr parent);   /* RefreshUnitTakeRescueInfoWindows */
void StartUnitGiveInfoWindows(ProcPtr parent);   /* StartUnitGiveInfoWindows */
void RefreshUnitHpInfoWindow(struct Unit * unit);
void RefreshUnitRescueInfoWindows(struct Unit * unit);
void RefreshUnitGiveInfoWindows(struct Unit * unit);
void RefreshUnitTakeInfoWindows(struct Unit * unit);
void RefreshUnitInventoryInfoWindow(struct Unit * unit);

/* ---- bmmenu.c ---- */

extern const struct MenuDef gUnitActionMenuDef;
extern const struct ProcCmd gProcScr_BackToUnitMenu[];

u8 MapMenu_UnitCommand(struct MenuProc * menu, struct MenuItemProc * menuItem);
void MakeUnitRescueTransferGraphics(struct Unit * from, struct Unit * to);

u8 MenuAlwaysEnabled(const struct MenuItemDef *, int number);
u8 MenuAlwaysDisabled(const struct MenuItemDef *, int number);
u8 MenuAlwaysNotShown(const struct MenuItemDef *, int number);
extern const char gUnk_081C3D28[];
extern const char gUnk_081C3D40[];
extern const char gUnk_081C3D58[];
extern const char gUnk_081C3D70[];
extern const char gUnk_081C3D7C[];
extern const char gUnk_081C3D94[];
extern const char gUnk_081C3D98[];
extern const char gUnk_081C3DAC[];
extern const char gUnk_081C3DB8[];
extern const char gUnk_081C3DC8[];
extern const char gUnk_081C3DDC[];
extern const char gUnk_081C3DE8[];
extern const char gUnk_081C3DEC[];
extern const char gUnk_081C3E00[];
extern const char gUnk_081C3E10[];
extern const char gUnk_081C3E20[];
extern const char gUnk_081C3E2C[];
extern const char gUnk_081C3E34[];
extern const char gUnk_081C3E3C[];
extern const char gUnk_081C3E48[];

u8 CallEvent_CompleteTraining(struct MenuProc * menu, struct MenuItemProc * menuItem);
extern const char gUnk_081C3CF0[];
extern const char gUnk_081C3D0C[];
u8 sub_08021610(void);

u8 MenuCancelSelect(struct MenuProc * menu, struct MenuItemProc * item);

int Menu_SwitchIn(struct MenuProc * menu, struct MenuItemProc * menuItem);
int Menu_SwitchOut_DoNothing(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 StartFightBallistaReview(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 StartFightItemReview(struct MenuProc * menu, struct MenuItemProc * menuItem);
extern const char gUnk_081C3E54[];
extern const char gUnk_081C3E60[];

u8 ConvoyMenu_HelpBox(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 ItemMenu_ButtonBPressed(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 MenuAutoHelpBoxSelect(struct MenuProc * menu);
u8 MenuStdHelpBox(struct MenuProc * menu, struct MenuItemProc * item);

extern const char gUnk_081C3E70[];
extern const char gUnk_081C3E78[];
extern const char gUnk_081C3E80[];
extern const char gUnk_081C3E88[];
extern const char gUnk_081C3E90[];
extern const char gUnk_081C3E98[];
extern const char gUnk_081C3EA0[];
extern const char gUnk_081C3EA8[];
extern const char gUnk_081C3EB0[];
extern const char gUnk_081C3EBC[];
extern const char gUnk_081C3EC4[];
extern const char gUnk_081C3ED0[];
extern const char gUnk_081C3EDC[];
extern const char gUnk_081C3EE8[];
extern const char gUnk_081C3EF4[];
extern const char gUnk_081C3EFC[];
extern const char gUnk_081C3F08[];
extern const char gUnk_081C3F14[];
extern const char gUnk_081C3F20[];
extern const char gUnk_081C3F2C[];
extern const char gUnk_081C3F34[];
extern const char gUnk_081C3F3C[];
extern const char gUnk_081C3F44[];
extern const char gUnk_081C3F4C[];
extern const char gUnk_081C3F54[];
extern const char gUnk_081C3F5C[];
extern const char gUnk_081C3F64[];
extern const char gUnk_081C3F70[];
extern const char gUnk_081C3F7C[];
extern const char gUnk_081C3F84[];
extern const char gUnk_081C3F8C[];
extern const char gUnk_081C3F94[];
extern const char gUnk_081C3F9C[];

u8 ItemMenu_HelpBox(struct MenuProc * menu, struct MenuItemProc * menuItem);

u8 GenericSelection_BackToUM(ProcPtr proc, struct SelectTarget * target);
u8 GenericSelection_BackToUM_CamWait(ProcPtr proc, struct SelectTarget * target);
void HealMapSelect_Init(ProcPtr proc);
u8 HealMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget * target);
void WarpUnitMapSelect_Init(ProcPtr menu);
u8 WarpUnitMapSelect_SwitchIn(ProcPtr proc, struct SelectTarget * target);

u8 CommandEffectEndPlayerPhase(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 MapMenu_OptionsCommand(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 MapMenu_StatusCommand(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 MapMenu_SuspendCommand(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 MapMenu_Suspend_Available(const struct MenuItemDef * def, int number);
extern const char gUnk_081C3FAC[];
extern const char gUnk_081C3FB4[];
extern const char gUnk_081C3FBC[];
extern const char gUnk_081C3FC4[];

extern const char gUnk_081D57A0[];
extern const char gUnk_081D57AC[];
extern const char gUnk_081D57B8[];
u8 sub_08049280(const struct MenuItemDef * def, int number);
u8 sub_080492CC(struct MenuProc * menu, struct MenuItemProc * menuItem);
u8 sub_080492EC(struct MenuProc * menu, struct MenuItemProc * menuItem);
int sub_08049300(struct MenuProc * menu, struct MenuItemProc * menuItem);

u8 sub_08049364(struct MenuProc * menu, struct MenuItemProc * menuItem);
