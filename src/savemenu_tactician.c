#include "gbafe.h"

void sub_08042C58(ProcPtr parent); // StartTacticianNameSelect
void sub_080A7194(struct ProcTactInfo *proc); // StartTactBirthSelect
void sub_080A73E4(struct ProcTactInfo *proc); // StartTactGenderSelect

struct TactInfoTextSt {
	struct Font font;
	struct Text texts[3];
};

EWRAM_OVERLAY(0) struct TactInfoTextSt gTactInfoSt = {};

// tactician config position

struct TactInfoPosEnt {
	s16 x, y;
	u8 shadow_len;
};

CONST_DATA struct TactInfoPosEnt TactInfoPos[] = {
	{ 0x6C, 0x28, 8 },
	{ 0x3C, 0x48, 6 },
	{ 0x9C, 0x48, 4 },
};

// tactician config msg
CONST_DATA int TactInfoHelpboxMsgs[] = {
	0x3DF, // name
	0x3E1, // birth month
	0x3E2, // gender
};

struct ProcCmd CONST_DATA ProcScr_TactInfo[] = {
	PROC_YIELD,
	PROC_CALL(TactInfo_Init),
	PROC_CALL(TactInfo_CheckParticipantDialogue),
	PROC_YIELD,
	PROC_CALL(TactInfo_HandleCheckParticipantPrompt),
PROC_LABEL(PL_TACTINFO_0),
	PROC_CALL(TactInfo_SetupGfx),
	PROC_CALL_ARG(NewFadeIn, 4),
	PROC_WHILE(FadeInExists),
	PROC_CALL(TactInfo_IntroDialogue1),
	PROC_YIELD,
	PROC_CALL(TactInfo_IntroDialogue2),
	PROC_YIELD,
	PROC_CALL(TactInfo_HandleIntroDialoguePrompt),
PROC_LABEL(PL_TACTINFO_1),
	PROC_CALL(sub_080A6AC4),
	PROC_YIELD,
	PROC_CALL(sub_080A6B00),
PROC_LABEL(PL_TACTINFO_2),
	PROC_CALL(sub_080A69E0),
	PROC_REPEAT(sub_080A6B4C),
PROC_LABEL(PL_TACTINFO_4),
	PROC_CALL_ARG(NewFadeOut, 8),
	PROC_WHILE(FadeOutExists),
	PROC_CALL(TactInfo_EndMuralBG),
	PROC_CALL(sub_08042C58), // StartTacticianNameSelect
	PROC_YIELD,
	PROC_CALL(TactInfo_SetupGfx),
	PROC_CALL_ARG(NewFadeIn, 8),
	PROC_WHILE(FadeInExists),
	PROC_GOTO(PL_TACTINFO_2),
PROC_LABEL(PL_TACTINFO_FADE_END),
	PROC_CALL_ARG(NewFadeOut, 4),
	PROC_WHILE(FadeOutExists),
	PROC_CALL(TactInfo_EndMuralBG),
PROC_LABEL(PL_TACTINFO_END),
	PROC_YIELD,
	PROC_CALL(TactInfo_UpdateSaveData),
	PROC_SLEEP(10),
	PROC_END,
};


void TactInfo_StartHelpbox(struct ProcTactInfo *proc)
{
	if (proc->do_helpbox == false) {
		LoadHelpBoxGfx(OBJ_VRAM0 + 0x6000, 0xD);
		proc->do_helpbox = true;
	}

	StartHelpBox(
		TactInfoPos[proc->cur_index].x,
		TactInfoPos[proc->cur_index].y,
		TactInfoHelpboxMsgs[proc->cur_index]
	);
}


void TactInfo_CloseHelpbox(struct ProcTactInfo *proc)
{
	CloseHelpBox();
	proc->do_helpbox = false;
}

void sub_080A66C4(void)
{
	if (IsSubtitleHelpActive() != false)
		EndSubtitleHelp();
}

void sub_080A66D8(ProcPtr proc)
{
	if (IsSubtitleHelpActive() == false)
		sub_080327C4(proc, DecodeMsg(0x78F));
}


void UpdateTactMainHandShadow(int index, ProcPtr proc)
{
	ShowSysHandCursor(
		TactInfoPos[index].x,
		TactInfoPos[index].y,
		TactInfoPos[index].shadow_len,
		0x0C00);
}


void UpdateTactMainHandPosition(int index)
{
	SetUiCursorHandConfig(
		0,
		TactInfoPos[index].x,
		TactInfoPos[index].y,
		0);
}


void sub_080A6748(void)
{
	int i;
	struct Font *font = &gTactInfoSt.font;
	char const *str;

	InitSpriteTextFont(font, OBJ_VRAM0 + 0x1000, 0xF);
	SetTextFont(font);
	SetTextFontGlyphs(TEXT_GLYPHS_TALK);

	for (i = 0; i < 3; i++) {
		InitSpriteText(gTactInfoSt.texts + i);
		SpriteText_DrawBackgroundExt(gTactInfoSt.texts + i, 0);
	}

	ApplyPalette(Pal_08194714, 0x1F);

	Text_InsertDrawString(gTactInfoSt.texts, 0x00, TEXT_COLOR_SYSTEM_GREEN, GetTacticianName());

	str = DecodeMsg(TactGetMsg_Birth(gPlaySt.tact_birth));
	Text_InsertDrawString(gTactInfoSt.texts, GetStringTextCenteredPos(0x40, str) + 0x40, TEXT_COLOR_SYSTEM_GREEN, str);

	str = DecodeMsg(TactGetMsg_Gender(gPlaySt.tact_gender));
	Text_InsertDrawString(gTactInfoSt.texts, GetStringTextCenteredPos(0x40, str) + 0x80, TEXT_COLOR_SYSTEM_GREEN, str);

	PutIcon(
		gBg0Tm + TM_OFFSET(0xE, 0x5),
		TacticianAffins[gPlaySt.tact_birth] + 0x79,
		0x5000
	);

	SetTextFont(NULL);
}

void TactInfoFx_Thread(struct ProcTactInfo *proc)
{
	int i;

	for (i = 0; i < 2; i++)
		PutSpriteExt(4, 0x80 + 0x20 * i, 0x28, Sprite_32x16, 0xF880 + 4 * i);

	for (i = 0; i < 2; i++)
		PutSpriteExt(4, 0x38 + 0x20 * i, 0x48, Sprite_32x16, 0xF888 + 4 * i);

	for (i = 0; i < 2; i++)
		PutSpriteExt(4, 0x90 + 0x20 * i, 0x48, Sprite_32x16, 0xF890 + 4 * i);
}


void TactInfo_Init(struct ProcTactInfo *proc)
{
	proc->cur_index = 0;
	proc->do_helpbox = 0;

	SetTacticianName(DecodeMsg(0x790));

	gPlaySt.tact_birth = 0;
	gPlaySt.tact_gender = 0;
}


void TactInfo_SetupGfx(struct ProcTactInfo *proc)
{
	InitBgs(NULL);
	ApplySystemObjectsGraphics();
	SetBlendNone();
	ResetText();
	UnpackUiWindowFrameGraphics();
	InitIcons();
	ApplyIconPalettes(4);

	gDispIo.bg0_ct.priority = 0;
	gDispIo.bg1_ct.priority = 2;
	gDispIo.bg2_ct.priority = 3;
	gDispIo.bg3_ct.priority = 3;
	SetBlendNone();

	Decompress(Img_TactInfoBg, (void *)(BG_VRAM + 0x1000));
	ApplyPalette(Pal_TactInfoBg, 0xF);
	TmApplyTsa(gBg2Tm, Tsa_TactInfoBg, 0xF080);

	StartUiCursorHand(proc);
	StartMuralBackgroundExt(
		NULL,
		(void *)(BG_VRAM + BGCHR_TACTICIAN_BGSCROLL * 0x20),
		BGPAL_TACTICIAN_BGSCROLL, 1);

	// ?
	sub_080A6748();
	StartParallelWorker(TactInfoFx_Thread, proc);
	StartHelpPromptSprite(0xB4, 0x10, proc);
}

void sub_080A69E0(struct ProcTactInfo *proc)
{
	EndSysHandCursor();
	ResetSysHandCursor(proc);
	DisplaySysHandCursorTextShadow(0x600, OBPAL_TACTICIAN_TEXTSHADOW);
	DisableUiCursorHand(0);
	sub_080A66D8(proc);
	UpdateTactMainHandShadow(proc->cur_index, proc);
}

void TactInfo_IntroDialogue1(struct ProcTactInfo *proc)
{
	if (!IsGamePlayedThrough()) {
		EndSysHandCursor();
		sub_080A66C4();
		StartBoxDialogueExt(0x30, 0x5A, 0x791, OBJ_VRAM0 + 0x6000, 0xD, proc);
		SetDialogueBoxConfig(0x70);
	}
}


void TactInfo_IntroDialogue2(struct ProcTactInfo *proc)
{
	EndSysHandCursor();
	sub_080A66C4();
	StartBoxDialogueExt(0x70, 0x5A, 0x792, OBJ_VRAM0 + 0x6000, 0xD, proc);
	SetDialogueBoxConfig(0x70);
	SetTalkChoiceResult(TALK_RESULT_YES);
}


void TactInfo_HandleIntroDialoguePrompt(struct ProcTactInfo *proc)
{
	if (GetTalkChoiceResult() == TALK_RESULT_YES)
		Proc_Goto(proc, PL_TACTINFO_2);

	if (GetTalkChoiceResult() == TALK_RESULT_NO || GetTalkChoiceResult() == TALK_RESULT_CANCEL)
		Proc_Goto(proc, PL_TACTINFO_FADE_END);
}

void sub_080A6AC4(struct ProcTactInfo *proc)
{
	EndSysHandCursor();
	sub_080A66C4();
	StartBoxDialogueExt(0x60, 0x5A, 0x793, OBJ_VRAM0 + 0x6000, 0xD, proc);
	SetDialogueBoxConfig(0xF0);
	SetTalkChoiceResult(TALK_RESULT_YES);
}


void sub_080A6B00(struct ProcTactInfo *proc)
{
	if (GetTalkChoiceResult() == TALK_RESULT_NO || GetTalkChoiceResult() == TALK_RESULT_CANCEL)
		Proc_Goto(proc, PL_TACTINFO_2);

	if (GetTalkChoiceResult() == TALK_RESULT_YES)
		Proc_Goto(proc, PL_TACTINFO_FADE_END);
}

void TactInfo_EndMuralBG(struct ProcTactInfo *proc)
{
	EndMuralBackground();
	EndMuralBackground_();
	EndAllProcChildren(proc);
}

void sub_080A6B4C(struct ProcTactInfo *proc)
{
	// FE7U has no blood type entry: 0 = name, 1 = birth month, 2 = gender
	int index_pre = proc->cur_index;

	if (proc->do_helpbox == false) {
		if (gpKeySt->pressed & A_BUTTON) {
			PlaySoundEffect(SONG_38A);

			switch (proc->cur_index) {
			case 0:
				Proc_Goto(proc, PL_TACTINFO_4);
				return;

			case 1:
				sub_080A7194(proc);
				break;

			case 2:
				sub_080A73E4(proc);
				break;

			default:
				return;
			}

			UpdateTactMainHandPosition(proc->cur_index);
			Proc_Goto(proc, PL_TACTINFO_2);
			return;
		}

		if (gpKeySt->pressed & (B_BUTTON | START_BUTTON)) {
			Proc_Goto(proc, PL_TACTINFO_1);
			PlaySoundEffect(SONG_38A);
			return;
		}

		if (gpKeySt->pressed & R_BUTTON) {
			TactInfo_StartHelpbox(proc);
			return;
		}
	} else if (gpKeySt->pressed & (B_BUTTON | R_BUTTON))
		TactInfo_CloseHelpbox(proc);

	if (gpKeySt->repeated & DPAD_DOWN) {
		if (proc->cur_index == 0)
			proc->cur_index = 1;
	}

	if (gpKeySt->repeated & DPAD_UP) {
		if (proc->cur_index > 0)
			proc->cur_index = 0;
	}

	if (gpKeySt->repeated & DPAD_LEFT) {
		if (proc->cur_index > 1)
			proc->cur_index--;
	}

	if (gpKeySt->repeated & DPAD_RIGHT) {
		if (proc->cur_index == 1)
			proc->cur_index = 2;
	}

	if (index_pre != proc->cur_index) {
		if (proc->do_helpbox != false)
			TactInfo_StartHelpbox(proc);

		UpdateTactMainHandShadow(proc->cur_index, proc);
		PlaySoundEffect(SONG_385);
	}
}


void TactInfo_UpdateSaveData(struct ProcTactInfo *proc)
{
	WriteGameSave(ReadLastGameSaveId());
}

void TactInfo_CheckParticipantDialogue(struct ProcTactInfo *proc)
{
	if (gPlaySt.chapterModeIndex == 1) {
		Proc_Goto(proc, PL_TACTINFO_0);
		return;
	}

	InitBgs(NULL);
	ApplySystemObjectsGraphics();
	SetBlendNone();
	SetDispEnable(1, 1, 1, 1, 1);

	/**
	 * 軍師を参加させますか？
	 */
	StartBoxDialogueExt(0x38, 0x20, 0x794, OBJ_VRAM0 + 0x6000, 0xD, proc);
	SetDialogueBoxConfig(0xF0);
	SetTalkChoiceResult(TALK_RESULT_NO);
}


void TactInfo_HandleCheckParticipantPrompt(struct ProcTactInfo *proc)
{
	if (GetTalkChoiceResult() == TALK_RESULT_NO || GetTalkChoiceResult() == TALK_RESULT_CANCEL) {
		gPlaySt.tact_enabled = false;
		Proc_Goto(proc, PL_TACTINFO_END);
	}
}

void StartTacticianInfo(ProcPtr parent)
{
	Proc_StartBlocking(ProcScr_TactInfo, parent);
}



CONST_DATA int Msgs_TactBirth[] = {
	0x795,
	0x796,
	0x797,
	0x798,
	0x799,
	0x79A,
	0x79B,
	0x79C,
	0x79D,
	0x79E,
	0x79F,
	0x7A0,
};

int TactGetMsg_Birth(int index)
{
	return Msgs_TactBirth[index];
}


CONST_DATA int Msgs_TactGender[] = {
	0x7A5,
	0x7A6,
};

int TactGetMsg_Gender(int index)
{
	return Msgs_TactGender[index];
}


CONST_DATA int Msgs_TactAffin[] = {
	0,
	0x1123,
	0x1124,
	0x1125,
	0x1126,
	0x1127,
	0x1128,
	0x1129,
};

int TactGetMsg_Affin(int index)
{
	return Msgs_TactAffin[index];
}


void Tact_ClearNrVrams(void *vram, u32 chr, u32 nr_chrs)
{
	CpuFastFill(0, vram + chr * CHR_SIZE, nr_chrs * CHR_SIZE);
	CpuFastFill(0, vram + chr * CHR_SIZE + CHR_LINE * CHR_SIZE, nr_chrs * CHR_SIZE);
}

void TactBlood_Init(struct ProcTactBlood *proc)
{
	// FE7U: blood type selection was removed; only this empty stub remains
}

