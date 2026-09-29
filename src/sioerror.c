#include "gbafe.h"

void OnVBlank_SioError(void) {

	INTR_CHECK = 1;
	SyncDispIo();
	SyncBgsAndPal();
	ApplyDataMoves();
	m4aSoundVSync();
	m4aSoundMain();

	return;
}

void OnMain_SioErrorWait(void) {

	u16 key;
	u16 mask;

	RefreshKeySt(gpKeySt);
	key = gpKeySt->pressed;
	mask = 9 & key;

	if (mask != 0) {
		SoftReset(0xFF);
	}
		
	VBlankIntrWait();

	return;
}

struct HelpBoxScrollProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ const char * string;
    /* 30 */ struct Font * font;
    /* 34 */ struct Text * texts[9];

    /* 58 */ int unk_58;
    /* 5C */ s16 pretext_lines;
    /* 5E */ s16 step;
    /* 60 */ u16 speed;
    /* 62 */ s16 chars_per_step;
};

void HelpBoxDrawOneLineExt(struct HelpBoxScrollProc * proc);

void PutSioErrorMessage(void) {
	int i;
	struct Text th[3];
	struct HelpBoxScrollProc localProcSt;

	struct HelpBoxScrollProc * proc = &localProcSt;

	ResetText();
	InitTalkTextFont();

	for (i = 0; i < 3; i++) {
		InitText(&th[i], 22);
		Text_SetColor(&th[i], 0);
	}

	proc->font = NULL;

	proc->texts[0] = &th[0];
	proc->texts[1] = &th[1];
	proc->texts[2] = &th[2];

	proc->pretext_lines = 0;

	proc->string = DecodeMsg(0x74F);

	HelpBoxDrawOneLineExt(proc);

	PutText(&th[0], gBg0Tm + TM_OFFSET(4, 6));
	PutText(&th[1], gBg0Tm + TM_OFFSET(4, 9));
	PutText(&th[2], gBg0Tm + TM_OFFSET(4, 11));

	EnableBgSync(1);
}

void OnMain_SioError(void) {
	InitBgs(NULL);

	m4aSoundInit();
	Proc_Init();

	SetBgOffset(0, 0, 0);

	SetDispEnable(1, 0, 0, 0, 0);
	SetWinEnable(0, 0, 0);

	SetBlendNone();
	SetOnHBlankA(NULL);

	gDispIo.mosaic = 0;

	SyncDispIo();

	CpuFastFill(0, (void *) VRAM, 0x20);
	CpuFastFill(0, (void *) (VRAM + 0x8000), 0x20);

	PutSioErrorMessage();

	PlaySoundEffect(0x7B);

	SetMainFunc(OnMain_SioErrorWait);
}

void StartSioErrorScreen(void) {
	REG_DISPSTAT = DISPSTAT_VBLANK_INTR;
	REG_IME = 1;
	REG_DISPCNT = 0;

	SetOnVBlank(OnVBlank_SioError);
	SetMainFunc(OnMain_SioError);
}
