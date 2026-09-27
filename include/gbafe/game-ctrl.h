#pragma once

#include "global.h"
#include "proc.h"

enum game_actions {
    GAME_ACTION_EVENT_RETURN = 0, /* Return form event command */
    GAME_ACTION_CLASS_REEL = 1,
    GAME_ACTION_USR_SKIPPED = 2,  /* User press button A/B/START to skip op-anim */
    GAME_ACTION_PLAYED_THROUGH = 3, /* Return if game played through */
    GAME_ACTION_4 = 4,
    GAME_ACTION_5 = 5,
    GAME_ACTION_6 = 6,
    GAME_ACTION_EXTRA_MAP = 7,
    GAME_ACTION_8 = 8,
    GAME_ACTION_9 = 9,
    GAME_ACTION_A = 0xA,
    GAME_ACTION_B = 0xB,
    GAME_ACTION_C = 0xC,
};

struct GameCtrlProc
{
    PROC_HEADER;

    /* 29 */ u8 next_action;
    /* 2A */ u8 next_chapter;
    /* 2B */ u8 idle_status;
    /* 2C */ u8 unk_2C;

    /* 2E */ s16 unk_2E;
    /* 30 */ u8 chapter_id;
};

// GetTitleClassReelSet
// GC_StartClassReel
// GC_CheckSramResetKeyCombo
// GC_InitSramResetScreen
// GC_InitFastStartCheck
// GC_FastStartCheck
// EndProcIfNotMarkedB
void sub_080126E4(ProcPtr);
// GC_RestoreMainBGM
// sub_08012738
// GC_PostIntro
// sub_080127C4
// GC_PostMainMenu
// sub_080128B0
// sub_080128C8
// sub_080128D4
// sub_080128F0
// GC_StartExtraMap
// sub_8012FCC
// sub_08012934
// GC_CheckForGameEnded
// GC_PostLoadSuspend
// GC_InitNextChapter
// GC_CallPostChapterSaveMenu
// GC_SetEliwoodMode
// GC_DarkenScreen
// sub_08012A70
// sub_08012AA8
// GC_RememberChapterId
// GC_RestoreChapterId
// StartGame
// GetGameControl
void SetNextGameAction(int action);
void SetNextChapterId(int chapter_id);
// HasNextChapter
// sub_08012B88
// sub_08012BAC
// sub_08012BD0
void ForceEnableSounds(void);
// sub_08012C10
