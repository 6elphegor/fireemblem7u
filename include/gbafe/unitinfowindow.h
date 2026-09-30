#pragma once

#include "global.h"
#include "proc.h"
#include "text.h"

// FE8U: unitinfowindow.c

enum { UNITINFOWINDOW_LINES_MAX = 5 };

struct UnitInfoWindowProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit * unit;

    /* 30 */ struct Text name;
    /* 38 */ struct Text lines[UNITINFOWINDOW_LINES_MAX];

    /* 60 */ u8 x;
    /* 61 */ u8 y;
    /* 62 */ u8 xUnitSprite;
    /* 63 */ u8 xNameText;
};
PROC_SIZE_CHECK(struct UnitInfoWindowProc);

void UnitInfoWindow_OnLoop(struct UnitInfoWindowProc * proc);
struct UnitInfoWindowProc * NewUnitInfoWindow(ProcPtr parent);
void UnitInfoWindow_PositionUnitName(struct UnitInfoWindowProc * proc);
struct UnitInfoWindowProc * UnitInfoWindow_DrawBase(struct UnitInfoWindowProc * proc, struct Unit * unit, int x, int y, int width, int lines);
int GetUnitInfoWindowX(struct Unit * unit, int width);
void DrawUnitHpText(struct Text * text, struct Unit * unit);
void DrawUnitConText(struct Text * text, struct Unit * unit);
void DrawUnitAidText(struct Text * text, struct Unit * unit);
void PutUnitAidIconForTextAt(struct Unit * unit, int x, int y);
void DrawUnitStatusText(struct Text * text, struct Unit * unit);
void DrawUnitResChangeText(struct Text * text, struct Unit * unit, int bonus);
void DrawUnitResUnkText(struct Text * text, struct Unit * unit, int unused);
void DrawAccuracyText(struct Text * text, int accuracy);
void StartUnitInventoryInfoWindow(ProcPtr parent);
void RefreshUnitInventoryInfoWindow(struct Unit * unit);
void RefreshUnitStealInventoryInfoWindow(struct Unit * unit);
void RefreshHammerneUnitInfoWindow(struct Unit * unit);
void StartUnitHpInfoWindow(ProcPtr parent);
void RefreshUnitHpInfoWindow(struct Unit * unit);
void StartUnitHpStatusInfoWindow(ProcPtr parent);
void RefreshUnitHpStatusInfoWindow(struct Unit * unit);
void StartUnitResChangeInfoWindow(ProcPtr parent);
void RefreshUnitResChangeInfoWindow(struct Unit * unit);
void StartUnitStaffOffenseInfoWindow(ProcPtr parent);
void RefreshUnitStaffOffenseInfoWindow(struct Unit * unit, int hit);
void StartUnitRescueInfoWindowsCore(ProcPtr parent);
void RefreshUnitTakeRescueInfoWindows(ProcPtr parent);
void RefreshUnitRescueInfoWindows(struct Unit * unit);
void RefreshUnitTakeInfoWindows(struct Unit * unit);
void StartUnitGiveInfoWindows(ProcPtr parent);
void RefreshUnitGiveInfoWindows(struct Unit * unit);
