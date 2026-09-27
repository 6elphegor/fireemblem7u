#pragma once

#include "global.h"
#include "proc.h"

enum {
	BGCHR_TACTICIAN_BGSCROLL = 0x8000 / 0x20,
	BGPAL_TACTICIAN_BGSCROLL = 0xA,

	OBPAL_TACTICIAN_TEXTSHADOW = 1,
};

enum {
	PL_TACTINFO_0 = 0,
	PL_TACTINFO_1,
	PL_TACTINFO_2,
	PL_TACTINFO_FADE_END,
	PL_TACTINFO_4,
	PL_TACTINFO_END,
};

enum tactinfo_index {
	// ProcTactInfo::cur_index
	TACTINFO_IDX_NAME = 0,
	TACTINFO_IDX_BLOOD,
	TACTINFO_IDX_BIRTH,
	TACTINFO_IDX_GENDER,
};

struct ProcTactInfo {
    PROC_HEADER;

    /* 2C */ int cur_index;
    /* 30 */ bool do_helpbox;
};

void TactInfo_StartHelpbox(struct ProcTactInfo *proc);
void TactInfo_CloseHelpbox(struct ProcTactInfo *proc);
void sub_080A66C4(void);
void sub_080A66D8(ProcPtr proc);
void UpdateTactMainHandShadow(int index, ProcPtr proc);
void UpdateTactMainHandPosition(int index);
void sub_080A6748(void);
void sub_080A6748(void);
void TactInfoFx_Thread(struct ProcTactInfo *proc);
void TactInfo_Init(struct ProcTactInfo *proc);
void TactInfo_SetupGfx(struct ProcTactInfo *proc);
void sub_080A69E0(struct ProcTactInfo *proc);
void TactInfo_IntroDialogue1(struct ProcTactInfo *proc);
void TactInfo_IntroDialogue2(struct ProcTactInfo *proc);
void TactInfo_HandleIntroDialoguePrompt(struct ProcTactInfo *proc);
void sub_080A6AC4(struct ProcTactInfo *proc);
void sub_080A6B00(struct ProcTactInfo *proc);
void TactInfo_EndMuralBG(struct ProcTactInfo *proc);
void sub_080A6B4C(struct ProcTactInfo *proc);
void TactInfo_UpdateSaveData(struct ProcTactInfo *proc);
void TactInfo_CheckParticipantDialogue(struct ProcTactInfo *proc);
void TactInfo_HandleCheckParticipantPrompt(struct ProcTactInfo *proc);
void StartTacticianInfo(ProcPtr parent);
int TactGetMsg_Blood(int index);
int TactGetMsg_Birth(int index);
int TactGetMsg_Gender(int index);
int TactGetMsg_Affin(int index);

struct ProcTactBlood {
    PROC_HEADER;

    /* 2C */ int cur_index;
    /* 30 */ bool do_helpbox;
};

void Tact_ClearNrVrams(void *vram, u32 chr, u32 nr_chrs);
void TactBlood_Init(struct ProcTactBlood *proc);
void TactBlood_Loop(struct ProcTactBlood *proc);
void TactBlood_End(struct ProcTactBlood *proc);
void StartTactBloodSelect(struct ProcTactInfo *proc);
// ??? sub_80A7D9C
// ??? sub_80A7E4C
// ??? sub_80A806C
void StartTactBirthSelect(struct ProcTactInfo *proc);
// ??? sub_80A80B8
// ??? sub_80A8140
// ??? sub_80A82B8
void StartTactGenderSelect(struct ProcTactInfo *proc);
void sub_080A73F8(s32);
// ??? InitModeSelectAnims
// ??? EndModeSelectAnims
// ??? PutModeSelectLabelText
// ??? PutModeSelectCharacterText
// ??? PutModeSelectDifficultyText
// ??? StartModeSelectFace
// ??? LoadModeSelectChapterGfx
// ??? sub_080A7860
// ??? sub_080A7890
// ??? sub_080A793C
// ??? ModeSelectSpriteDraw_Init
// ??? ModeSelectSpriteDraw_Loop
// ??? sub_080A7B7C
// ??? sub_080A7B98
// ??? sub_080A7BB4
// ??? sub_080A7BDC
// ??? sub_080A7C08
// ??? sub_080A7C24
// ??? sub_080A7C4C
// ??? sub_080A7C60
// ??? ModeSelect_InitGfxMaybe
// ??? ModeSelect_Init
// ??? ModeSelect_TransitionSplitOpen
// ??? ModeSelect_TransitionSplitClose
// ??? sub_080A8120
// ??? sub_080A8150
// ??? ModeSelect_Loop_KeyHandler
// ??? ModeSelect_RotateRight
// ??? ModeSelect_RotateLeft
// ??? ModeSelect_Loop_RotateCarousel
// ??? ModeSelect_End
// ??? sub_080A8664
void StartModeSelect(ProcPtr proc);
