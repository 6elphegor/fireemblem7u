#pragma once

#include "global.h"
#include "proc.h"
#include "text.h"

struct Unit;

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

struct MenuProc * StartMenu(const struct MenuDef * def, ProcPtr parent);
struct MenuProc * StartSemiCenteredOrphanMenu(const struct MenuDef * def, int xSubject, int xTileLeft, int xTileRight);
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
void sub_08023F64(struct Unit * unit);   /* MakeTakeTargetList */
void sub_08024018(struct Unit * unit);   /* MakeGiveTargetList */

/* ---- misc externals ---- */

void HideMoveRangeGraphics(void);
void DisplayMoveRangeGraphics(int config);
void StartUnitListScreenField(void);
void NewChapterStatusScreen(ProcPtr parent);
void EventGotoLabel(ProcPtr proc, int label);
int GetSomeFacingDirection(int xFrom, int yFrom, int xTo, int yTo);
void Make6CKOIDOAMM(struct Unit * unit, int facing);

/* ---- bmmenu.c ---- */

extern const struct MenuDef gUnitActionMenuDef;
extern struct ProcCmd CONST_DATA gProcScr_BackToUnitMenu[];

u8 MapMenu_UnitCommand(struct MenuProc * menu, struct MenuItemProc * menuItem);
void MakeUnitRescueTransferGraphics(struct Unit * from, struct Unit * to);
