#pragma once

#include "global.h"
#include "proc.h"

#define REG_BLDY_16 (*(u16 volatile *) &REG_BLDY)

enum videoalloc_savemenu {
    BGPAL_SAVEMENU_BG = 0,

    OBJPAL_SAVEMENU_WINDOW = 1,
};

enum save_menu_action_flag_bitfile {
    SAVEMENU_ACTION_BITFILE_0 = 1 << 0,
    SAVEMENU_ACTION_BITFILE_1 = 1 << 1,
    SAVEMENU_ACTION_BITFILE_2 = 1 << 2,
    SAVEMENU_ACTION_BITFILE_3 = 1 << 3,
    SAVEMENU_ACTION_BITFILE_4 = 1 << 4,
    SAVEMENU_ACTION_BITFILE_5 = 1 << 5,
    SAVEMENU_ACTION_BITFILE_6 = 1 << 6, // save screen
    SAVEMENU_ACTION_BITFILE_7 = 1 << 7,
};

struct SaveMenuUnkProc1 {
    PROC_HEADER;

    /* 29 */
};

struct SaveMenuUnkProc2 {
    PROC_HEADER;

    /* 29 */
};

struct SaveMenuProc {
    PROC_HEADER;

    /* 29 */ u8 anim_clock;
    /* 2A */ u8 unk_2A;
    /* 2B */ u8 selected_id;
    /* 2C */ u8 copy_from_id;
    /* 2D */ u8 unk_2D; // proc label
    /* 2E */ u8 unk_2E;
    /* 2F */ u8 unk_2F;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 36 */ u8 unk_36;
    /* 37 */ u8 unk_37[3]; // unsure of length
    /* 3A */ u8 unk_3A[3];
    /* 3D */ u8 unk_3D;
    /* 3E */ u8 in_rtext;
    /* 3F */ u8 unk_3F;
    /* 40 */ u8 unk_40;
    /* 41 */ u8 unk_41;
    /* 42 */ u16 action_flag;
    /* 44 */ u16 unk_44;
    /* 46 */ u16 unk_46;
    /* 48 */ u32 unk_48[3]; // time value
    /* 54 */ u32 unk_54; // time value
    /* 58 */ struct SaveMenuUnkProc2 * proc2;
    /* 5C */ ProcPtr proc3; // sprite anim proc
    /* 60 */ ProcPtr approc;
};

extern u8 gUnk_Savemenu_02000000;
extern u8 gUnk_Savemenu_02000001;

void SaveMenuOnHBlank(void);
void SaveMenu_HandleExtraMiscOption(struct SaveMenuProc * proc);
u8 SaveMenuIndexToValidBitfile(u8 byte, int num);
u8 SaveMenuGetBitfileByMask(u8 byte1, u8 byte2);
u8 BitfileToIndex(u8 byte);
void SaveMenu_StartHelpBox(struct SaveMenuProc * proc);
int sub_080A3474(int slot);
bool SaveMenuPostChapterHandleHelpBox(struct SaveMenuProc * proc);
void SaveMenuPutChapterTitle(struct SaveMenuProc * proc);
// ??? SaveMenu_Init
// ??? ProcSaveMenu_InitScreen
// ??? SaveMenu_LoadExtraMenuGraphics
// ??? SaveMenuInit
// ??? SaveMenuInitUnused
// ??? SaveMenu_080A465C
// ??? Loop6C_savemenu
// ??? SaveMenuWriteNewGame
// ??? sub_080A3CAC
// ??? sub_080A3E98
// ??? sub_80A4D64
// ??? SaveMenuRegisterSlotSelected
// ??? sub_080A4108
// ??? sub_080A43E0
// ??? sub_080A4428
// ??? sub_080A4478
// ??? sub_080A44C0
// ??? sub_080A4504
// ??? sub_080A4554
// ??? sub_080A45A0
// ??? sub_080A474C
// ??? sub_080A47B4
// ??? sub_080A47EC
// ??? sub_080A4830
// ??? sub_80A54C8
// ??? sub_080A4A0C
// ??? SaveMenu_Finish
// ??? sub_80A5764
// ??? sub_80A577C
// ??? sub_80A57A8
// ??? sub_80A57BC
// ??? SaveMenuPostExtraMiscScreen
// ??? sub_080A4B7C
// ??? sub_080A4BD8
// ??? sub_080A4C34
// ??? sub_080A4C94
// ??? sub_080A4D54
// ??? sub_080A4D74
// ??? sub_080A4D94
// ??? sub_80A5A94
void StartMainMenu(/* TODO */);
// ??? sub_080A4DEC
void sub_080A4E0C(ProcPtr);
// ??? sub_80A5B0C
void SaveMenu_SetDifficultyChoice(s32, s32);

/* savedraw */
void sub_080A4E58(void);
// ??? sub_80A5C60
// ??? sub_080A503C
// ??? sub_080A5084
// ??? sub_080A50CC
// ??? sub_80A5DF0
// ??? sub_080A511C
// ??? sub_080A5130
// ??? sub_080A5148
// ??? sub_080A5214
// ??? SaveDraw_Init
// ??? sub_080A54C8
// ??? sub_80A61FC
// ??? sub_80A6278
// ??? sub_080A560C
// ??? sub_80A6430
// ??? SaveDraw_Loop
// ??? StartSaveDraw

/* savedrawfx */
struct ProcSpinRotation {
    PROC_HEADER;

    /* 2A */ u16 ro;
    /* 2C */ int angle;
    /* 30 */ ProcPtr savedraw;

    /* 34 */ u8 unk_34;
    /* 34 */ u8 unk_35;
    /* 34 */ u8 unk_36;
    /* 34 */ u8 unk_37;
    /* 34 */ u8 unk_38;
    /* 34 */ u8 unk_39;
    /* 34 */ u8 unk_3A;
    /* 34 */ u8 unk_3B;
    /* 34 */ u8 unk_3C_unused;
    /* 34 */ u8 unk_3D;
};

void SpinRotation_Init(struct ProcSpinRotation * proc);
void SpinRotation_Loop(struct ProcSpinRotation * proc);
ProcPtr StartSpinRotation(ProcPtr parent);
// ??? SaveDrawCursor_Init
// ??? SaveDrawCursor_Loop
// ??? sub_080A5E8C
// ??? sub_080A5EAC
// ??? StartSaveDrawCursor
// ??? sub_080A5EF0
// ??? SaveMenuDrawSubSelBoxExt
// ??? SaveMenuDrawSubSelBox
// ??? sub_080A5FD0
// ??? sub_080A6004
// ??? sub_080A6018
// ??? sub_080A602C
// ??? SaveMenuModifySaveSlot
// ??? SaveMenuTryMoveSaveSlotCursor
// ??? sub_080A6220
// ??? sub_080A6238
// ??? StartSqMask
// ??? SaveBgUp_Loop
// ??? StartSaveBgUp

/* savemenu_difficulty */
// ??? sub_080A6398
// ??? sub_080A649C
// ??? sub_080A652C
// ??? SaveMenuGetValidMenuAmt
// ??? nullsub_84

/* savemenu */
extern CONST_DATA u16 BgConfig_SaveMenu[];
// ??? gUnk_08DAD354
// ??? gUnk_08DAD384
// ??? ProcScr_SaveMenu
// ??? gUnk_08DAD674
// ??? gUnk_08DAD784
// ??? gpBonusClaimData
// ??? gUnk_08DAD848
// ??? gUnk_08DAD8A8
// ??? gUnk_08DAD8C2
// ??? gUnk_08DAD8FC
// ??? gUnk_08DAD904
// ??? gUnk_08DAD90C
// ??? gUnk_08DAD9D6
// ??? gUnk_08DAD9E4
// ??? gUnk_08DADA10
// ??? ProcScr_SaveDraw
// ??? ProcScr_SpinRotation
// ??? ProcScr_SaveDrawCursor
// ??? gUnk_08DADAAC
// ??? gUnk_08DADAC8
// ??? ProcScr_SaveBgUp
