#pragma once

#include "global.h"
#include "proc.h"

// FE8U: prep_sallycursor.c

struct SpriteAnim;
struct Unit;

struct ProcPrepSallyCursor
{
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2C;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int xCursor;
    /* 40 */ int yCursor;

    /* 44 */ STRUCT_PAD(0x44, 0x4A);

    /* 4A */ s16 unk_4A;
    /* 4C */ s16 unk_4C;

    /* 4E */ STRUCT_PAD(0x4E, 0x54);

    /* 54 */ struct SpriteAnim * ap;

    /* 58 */ u32 lastCmd;
};

enum
{
    PREP_MAPMENU_NONE = 0,
    PREP_MAPMENU_VIEW_MAP = 1,
    PREP_MAPMENU_FORMATION = 2,
    PREP_MAPMENU_OPTIONS = 8,
    PREP_MAPMENU_SAVE = 9,
};

enum
{
    PL_SALLYCURSOR_OPEN_MAP_MENU = 0x00,
    PL_SALLYCURSOR_UNIT_SELECTED = 0x01,
    PL_SALLYCURSOR_START_ATMENU = 0x02,
    PL_SALLYCURSOR_UNIT_SWAP = 0x03,
    PL_SALLYCURSOR_CANCEL_SWAP = 0x04,
    PL_SALLYCURSOR_POST_STATSCREEN_IDLE = 0x05,
    PL_SALLYCURSOR_POST_STATSCREEN_MOVE = 0x06,
    PL_SALLYCURSOR_MAP_IDLE = 0x09,
    PL_SALLYCURSOR_0B = 0x0B,
    PL_SALLYCURSOR_0C = 0x0C,

    PL_SALLYCURSOR_ENTER_MAP = 0x32,
    PL_SALLYCURSOR_RETURN_TO_ATMENU = 0x33,
    PL_SALLYCURSOR_POST_SUPPLY_CHANGE = 0x34,
    PL_SALLYCURSOR_SUPPLY_DEPLOY = 0x35,
    PL_SALLYCURSOR_SUPPLY_REMOVE = 0x36,
    PL_SALLYCURSOR_END_PREP = 0x37,
    PL_SALLYCURSOR_CHAPTER_STATUS = 0x38,
    PL_SALLYCURSOR_OPTIONS = 0x39,
    PL_SALLYCURSOR_POST_DEBUG_MENU = 0x3A,
    PL_SALLYCURSOR_SAVE = 0x3B,
    PL_SALLYCURSOR_SHOP = 0x3C,
    PL_SALLYCURSOR_MAP_MENU = 0x3D,
    PL_SALLYCURSOR_REENTER_MAP = 0x3E,
};

extern struct ProcCmd CONST_DATA ProcScr_PrepHelpPrompt[];
extern u8 CONST_DATA Img_PrepHelpButtonSprites[];
extern struct ProcCmd CONST_DATA ProcScr_Config_PrepMapMenu[];

int GetPlayerLeaderUnitId(void);
void Prep_ShowDeployableTiles(void);
void EndPrepScreenMenu_(void);
void PrepMapMenu_OnViewMap(struct ProcPrepSallyCursor * proc);
void PrepMapMenu_OnFormation(struct ProcPrepSallyCursor * proc);
bool PrepMapMenu_OnStartPress(ProcPtr proc);
bool PrepMapMenu_OnBPress(ProcPtr proc);
void SALLYCURSOR_DeploySupplyUnit(void);
void PrepMapMenu_OnOptions(struct ProcPrepSallyCursor * proc);
void SALLYCURSOR_RemoveSupplyUnit(void);
void PrepMapMenu_OnSave(struct ProcPrepSallyCursor * proc);
void PrepScreenProc_SetCameraOnSupply(ProcPtr proc);
void PrepScreenProc_InitMapMenu(struct ProcPrepSallyCursor * proc);
void PrepScreenProc_DimMapImmediate(void);
void PrepScreenProc_StartBrightenMap(ProcPtr proc);
void sub_08030570(ProcPtr proc);
void PrepHelpPrompt_Init(struct ProcPrepSallyCursor * proc);
void PrepHelpPrompt_Loop(void);
void StartPrepHelpPrompt(ProcPtr proc);
void PrepMapMenu_OnEnd(void);
void PrepScreenProc_StartMapMenu(struct ProcPrepSallyCursor * proc);
bool CanCharacterBePrepMoved(int pid);
void sub_0803079C(struct ProcPrepSallyCursor * proc);
void sub_080307C4(struct ProcPrepSallyCursor * proc);
void sub_080307E0(struct ProcPrepSallyCursor * proc);
void sub_08030800(struct ProcPrepSallyCursor * proc);
void sub_0803081C(struct ProcPrepSallyCursor * proc);
void InitPrepScreenUnitsAndCamera(ProcPtr proc);
void InitPrepScreenCursorPosition(void);
void PrepScreenProc_SetupMapIdle(struct ProcPrepSallyCursor * proc);
void PrepScreenProc_MapIdle(struct ProcPrepSallyCursor * proc);
int sub_08030C10(void);
void PrepScreen_StartUnitSwap(struct ProcPrepSallyCursor * proc);
void PrepScreen_UnitSwapIdle(struct ProcPrepSallyCursor * proc);
void sub_08030DFC(ProcPtr proc);
void PrepScreen_StartUnitSwapAnim(ProcPtr proc);
void InitMapChangeGraphicsIfFog(void);
void DisplayMapChangeIfFog(void);
void PrepScreenProc_StartConfigMenu(ProcPtr proc);
void PrepScreenProc_StartShopScreen(ProcPtr proc);
void PrepScreenProc_MapMovementLoop(ProcPtr proc);
void PrepScreenProc_Cleanup(ProcPtr proc);
void sub_080310A8(ProcPtr proc);
void StartPrepSaveScreen(ProcPtr proc);
void sub_08031148(void);
void PrepScreenProc_UpdateBgm(void);
void ShrinkPlayerUnits(void);
void EndPrepScreen(void);
bool IsPrepMapActive(void);
