#pragma once

#include "global.h"
#include "proc.h"
#include "text.h"

// Battle forecast (FE8U: bksel.c)

struct BattleUnit;
struct HelpBoxProc;
struct HelpBoxInfo;

struct BattleForecastProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2C;
    /* 30 */ s8 x;
    /* 31 */ s8 y;
    /* 32 */ u8 frameKind;
    /* 33 */ s8 ready;
    /* 34 */ s8 needContentUpdate;
    /* 35 */ s8 side; // -1 is left, +1 is right
    /* 36 */ s8 slide_offset;
    /* 38 */ struct Text unitNameTextA;
    /* 40 */ struct Text unitNameTextB;
    /* 48 */ struct Text itemNameText;
    /* 50 */ s8 hitCountA;
    /* 51 */ s8 hitCountB;
    /* 52 */ s8 isEffectiveA;
    /* 53 */ s8 isEffectiveB;
};

int GetBattleForecastPanelSide(void);
void InitBattleForecastIconPaletteBuffer(void);
void InitBattleForecastLabels(void);
void PutBattleForecastUnitName(u16 * dest, struct Text * text, struct Unit * unit);
void PutBattleForecastItemName(u16 * dest, struct Text * text, int item);
void BattleForecastHitCountUpdate(struct BattleUnit * bu, u8 * hitsCounter, int * usesCounter);
void InitBattleForecastBattleStats(struct BattleForecastProc * proc);
void DrawBattleForecastContentsStandard(struct BattleForecastProc * proc);
void DrawBattleForecastContentsExtended(struct BattleForecastProc * proc);
void DrawBattleForecastContents(struct BattleForecastProc * proc);
const u16 * GetFactionBattleForecastFramePalette(int faction);
void InitBattleForecastFramePalettes(void);
void BattleForecast_Init(struct BattleForecastProc * proc);
void BattleForecast_OnEnd(void);
void PutBattleForecastTilemaps(struct BattleForecastProc * proc);
void PutBattleForecastWeaponTriangleArrows(struct BattleForecastProc * proc);
void PutBattleForecastMultipliers(struct BattleForecastProc * proc);
void UpdateBattleForecastEffectivenessPalettes(struct BattleForecastProc * proc);
void BattleForecast_LoopDisplay(struct BattleForecastProc * proc);
void BattleForecast_OnNewBattle(struct BattleForecastProc * proc);
void BattleForecast_LoopSlideIn(struct BattleForecastProc * proc);
void BattleForecast_LoopSlideOut(struct BattleForecastProc * proc);
bool Bksel_WaitMapEventEngine(void);
void NewBattleForecast(ProcPtr proc);
void UpdateBattleForecastContents(void);
void CloseBattleForecast(void);
u8 StartBattleForecastHelpBox(ProcPtr parent, void * target);
u16 GetBkselHelpBoxMsg(int wt, s8 isEffective);
void HbPopulate_BkselWTriEffA(struct HelpBoxProc * proc);
void HbPopulate_BkselWTriEffB(struct HelpBoxProc * proc);

extern struct ProcCmd CONST_DATA gProcScr_BKSEL[];

extern struct Text gaBattleForecastTextStructs[6];
extern u16 gBkselPals[8][16];
