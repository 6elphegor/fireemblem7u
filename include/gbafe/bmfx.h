#pragma once

#include "global.h"
#include "proc.h"

struct ProcBmFx {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 timer;

    STRUCT_PAD(0x4E, 0x64);

    /* 64 */ s16 xPos;
    /* 66 */ s16 yPos;
};

// GetSomeFacingDirection
// Make6CMOVEUNITForUnitBeingRescued
// Loop6C_KOIDO
// Make6CKOIDO
// Make6CKOIDOAMM
// bmxfade_init
// bmxfade_loop
// Destruct6CBMXFADE
// StartMapFade
// IsMapFadeActive
// GetPlayerStartCursorPosition
// GetEnemyStartCursorPosition
// ProcFun_ResetCursorPosition
// ADJUSTFROMXI_MoveCameraOnSomeUnit
// ConvoyMenuProc_StarMenu
// ConvoyMenuProc_MenuEnd
// ConvoyMenuProc_MaybeStartSelectConvoyItem
// ConvoyMenuProc_SendToConvoyReal
// ConvoyMenuProc_SetupActiveUnit
// ConvoyMenuProc_ExecBootlegPopup
// HandleGiveUnitItem
// sub_801DD54
// MenuCommand_DrawExtraItem
// SendToConvoyMenu_NormalEffect
// MenuCommand_SendItemToConvoy
// sub_801DE18
// sub_801DE6C
// SendToConvoyMenu_Idle
// SetVisionWithFade
// SetVision
// FillWarpRangeMap
// sub_801E110
// StartEquipInfoWindow
// UpdateMenuItemPanel
// EndMenuItemPanel
// PrepUnitSwapProc_Init
// PrepUnitSwapProc_MainLoop
// PrepUnitSwapProc_OnEnd
// StartPrepUnitSwap
// sub_801E83C
// PhaseIntroVMatchHi
// PhaseIntroVMatchMid
// PhaseIntroVMatchLo
// PhaseIntroText_PutText
// PhaseIntroInitText
// PhaseIntroText_InLoop
// PhaseIntroText_OutLoop
// sub_801EA54
// sub_801EA6C
// PhaseIntroSquares_InLoop
// PhaseIntroSquares_OutLoop
// sub_801EC1C
// PhaseIntroBlendBox_InLoop
// PhaseIntroBlendBox_OutLoop
// PhaseIntro_EndIfNoUnits
// PhaseIntro_InitGraphics
// PhaseIntro_InitDisp
// PhaseIntro_WaitForEnd
// ChangeActiveUnitFacing
// GasTrapSpriteAnim_Init
// StartGasTrapAnim
// FireTrapSpriteAnim_Init
// StartFireTrapAnim1
// StartFireTrapAnim2
// ProcUnkTrapAnimFunc
// StartUnkTrapAnim
// ArrowTrapSpriteAnim_Init
// StartArrowTrapAnim
// ProcShowMapChange_MoveCamera
// ProcShowMapChange_UpdateGame
// StartShowMapChangeAnim
// PikeTrapSpriteAnim_Init
// StartPikeTrapAnim
// ProcPopup2_Init
// ProcPopup2_Loop
// NewPopup2_PlanA
// sub_801F514
// sub_801F650
// NewPopup2_DropItem
// NewPopup2_SendItem

enum
{
    BGCHR_CHAPTERINTRO_80 = 0x80,
    BGCHR_CHAPTERINTRO_100 = 0x100,
    BGCHR_CHAPTERINTRO_MOTIF = 0x400,
    BGCHR_CHAPTERINTRO_FOG = 0x500,

    BGPAL_CHAPTERINTRO_0 = 0,
    BGPAL_CHAPTERINTRO_1 = 1,
    BGPAL_CHAPTERINTRO_FOG = 4,
    BGPAL_CHAPTERINTRO_MOTIF = 5,

    OBPAL_CHAPTERINTRO_7 = 7,
    OBPAL_CHAPTERINTRO_10 = 10,
};

struct ProcChapterIntrofx {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 timer, unk_4E;
    /* 50 */ s16 skipped;
    /* 52 */ u16 fasten;
};

struct ProcChapterIntroDeamon {
    PROC_HEADER_EXT(struct ProcChapterIntrofx);

    STRUCT_PAD(0x29, 0x50);

    /* 50 */ s16 skipped;
};

void ChapterIntro_Bg3Scroll_Loop(ProcPtr proc);
void ChapterIntroDeamon_Init(struct ProcChapterIntroDeamon * proc);
void ChapterIntroDeamon_Loop(struct ProcChapterIntroDeamon * proc);
void PutChapterIntroMotif(void);
void PutScreenFogEffect(void);
void PutScreenFogEffectOverlayed(void);
void ChapterIntro_Init(struct ProcChapterIntrofx * proc);
void ChapterIntro_BeginFadeIn(struct ProcChapterIntrofx * proc);
void ChapterIntro_LoopFadeIn(struct ProcChapterIntrofx * proc);
void ChapterIntro_BeginMotifFadeIn(struct ProcChapterIntrofx * proc);
void ChapterIntro_LoopMotifFadeIn(struct ProcChapterIntrofx * proc);
void ChapterIntro_BeginHOpenText(struct ProcChapterIntrofx * proc);
void ChapterIntro_LoopHOpenText(struct ProcChapterIntrofx * proc);
void ChapterIntro_BeginVOpenText(struct ProcChapterIntrofx * proc);
void ChapterIntro_LoopVOpenText(struct ProcChapterIntrofx * proc);
void sub_0801FA30(struct ProcChapterIntrofx * proc);
void sub_0801FA88(struct ProcChapterIntrofx * proc);
void ChapterIntro_Begin_0801FF18(struct ProcChapterIntrofx * proc);
void sub_0801FAD4(struct ProcChapterIntrofx * proc);
void ChapterIntro_801FFA8(void);
void ChapterIntro_0801FFD0(struct ProcChapterIntrofx * proc);
void ChapterIntro_InitMapDisplay(struct ProcChapterIntrofx * proc);
void ChapterIntro_BeginFadeToMap(struct ProcChapterIntrofx * proc);
void ChapterIntro_LoopFadeToMap(struct ProcChapterIntrofx * proc);
void ChapterIntro_BeginCloseText(struct ProcChapterIntrofx * proc);
void ChapterIntro_LoopCloseText(struct ProcChapterIntrofx * proc);
void ChapterIntro_BeginFastCloseText(struct ProcChapterIntrofx * proc);
void ChapterIntro_LoopFastCloseText(struct ProcChapterIntrofx * proc);
void ChapterIntro_BeginFadeOut(struct ProcChapterIntrofx * proc);
void ChapterIntro_LoopFadeOut(struct ProcChapterIntrofx * proc);
void ChapterIntro_BeginFastFadeToMap(struct ProcChapterIntrofx * proc);
void ChapterIntro_LoopFastFadeToMap(struct ProcChapterIntrofx * proc);
void ChapterIntro_SetSkipTarget(int skip, struct ProcChapterIntrofx * proc);
void ChapterIntro_SetTimer(int timer, struct ProcChapterIntrofx * proc);
void ChapterIntro_TickTimer(struct ProcChapterIntrofx * proc);
void ChapterIntro_SetFasten(struct ProcChapterIntrofx * proc);
// ChapterIntro_8021188
// GameOverScreen_RandomScroll_Init
// sub_08020158
// GameOverScreenHBlank
// sub_0802020C
// GameOverScreen_LoopFadeIn
// GameOverScreen_BeginIdle
// sub_08020394
// GameOverScreen_BeginFadeOut
// GameOverScreen_LoopFadeOut
// sub_08020434
// sub_80208E0
// sub_0802049C
// sub_08020568
// sub_080205E0
// StartLightRuneAnim3
// ProcDanceAnim_Init
// ProcDanceAnim_Loop
// ProcDanceAnim_ResetTimer
// ProcDanceAnim_Loop_Blend
// StartDanceringAnim
// ProcEventWrapAnim_Init
// ProcEventWrapAnim_Loop
// ProcEventWrapAnim_End
// StartEventWarpAnim
// StartWarpEffect_08020A64
bool WarpEffectExists(ProcPtr proc);
// sub_08020AD0
// sub_08020B84
// sub_8021064
// sub_08020C14
// nullsub_40
// ProcWhiteCircleFx_Loop
// sub_08020D18
// sub_08020D6C
// ProcEmitSingleStar_Init
// sub_08020E68
// Calcs_Interpolate
// sub_08020F24
// sub_0802107C
// StartEmitStarsAnim
// ClearEmitedStars
// sub_80215D0
void SwingSwordfx_Init(struct ProcBmFx * proc);
void SwingSwordfx_Loop(struct ProcBmFx * proc);
void SwingSwordfx_End(struct ProcBmFx * proc);
// StartSwingSwordfx
void ProcMineFxFunc();
void StartMineAnim(ProcPtr proc, int x_target, int y_target);
void sub_08021374(u16 * tilemap, int x, int y);
void sub_080213A8(struct Proc * proc);
void sub_08021480(struct Proc * proc);
void sub_080214DC();
void NinianStartTransformToHunman(struct Proc * parent, int x, int y);

extern struct BmBgxConf CONST_DATA BmBgfxConf_GameTitle[];
extern struct BmBgxConf CONST_DATA BmBgfxConf_OpAnim[];
extern struct BmBgxConf CONST_DATA BmBgfxConf_DeadDragonFlame[];
extern struct BmBgxConf CONST_DATA BmBgfxConf_DragonFlame[];
