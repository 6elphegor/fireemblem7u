#pragma once

#include "global.h"
#include "proc.h"
#include "text.h"

// FE8U: bb.c

struct SubtitleHelpProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ const char * string;
    /* 30 */ struct Font font;
    /* 48 */ struct Text text[2];
    /* 58 */ s16 textOffset;
    /* 5A */ s16 textShowCnt;
    /* 5C */ s16 textNum;
    /* 5E */ s16 textCount;
};
PROC_SIZE_CHECK(struct SubtitleHelpProc);

void PutSubtitleHelpText(struct SubtitleHelpProc * proc, int y);
void InitSubtitleHelpText(struct SubtitleHelpProc * proc);
void SubtitleHelpDarkenerOnHBlank(void);
void SubtitleHelpDarkener_Init(void);
void SubtitleHelpDarkener_FadeIn(void);
void SubtitleHelpDarkener_FadeOut(struct SubtitleHelpProc * proc);
void SubtitleHelp_Init(struct SubtitleHelpProc * proc);
void SubtitleHelp_OnEnd(void);
void SubtitleHelp_Loop(struct SubtitleHelpProc * proc);
void StartSubtitleHelp(ProcPtr parent, const char * str);
void sub_080325A0(struct SubtitleHelpProc * proc);
void sub_0803261C(int y);
void SubtitleHelpToggle_Loop(struct SubtitleHelpProc * proc);
void StartSubtitleHelpToggle(ProcPtr parent);
void EndSubtitleHelp(void);
bool IsSubtitleHelpActive(void);
void sub_080327C4(ProcPtr proc, const char * str);
