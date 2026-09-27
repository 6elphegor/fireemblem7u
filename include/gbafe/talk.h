#pragma once

#include "global.h"

enum talk_vide {
    BGCHR_TALK = 0x80,

    BGPAL_TALK_BACKGROUND = 8,
};

enum talk_choice {
    TALK_RESULT_CANCEL,
    TALK_RESULT_YES,
    TALK_RESULT_NO,
};

enum talk_flag {
    TALK_FLAG_INSTANTSHIFT = 1 << 0,
    TALK_FLAG_NOBUBBLE = 1 << 1,
    TALK_FLAG_NOSKIP = 1 << 2,
    TALK_FLAG_NOFAST = 1 << 3,
    TALK_FLAG_OPAQUE = 1 << 4,
    TALK_FLAG_SPRITE = 1 << 5,
    TALK_FLAG_SILENT = 1 << 6,
    TALK_FLAG_7 = 1 << 7,
};

enum talk_face
{
    TALK_FACE_0,
    TALK_FACE_1,
    TALK_FACE_2,
    TALK_FACE_3,
    TALK_FACE_4,
    TALK_FACE_5,
    TALK_FACE_6,
    TALK_FACE_7,

    TALK_FACE_COUNT,

    TALK_FACE_NONE = 0xFF,
};


struct TalkSt
{
    /* 00 */ char const * str;
    /* 04 */ char const * str_back;
    /* 08 */ u8 print_color;
    /* 09 */ u8 line_active;
    /* 0A */ u8 lines;
    /* 0B */ u8 top_text_num;
    /* 0C */ u8 x_text;
    /* 0D */ u8 y_text;
    /* 0E */ u8 active_width;
    /* 0F */ s8 speak_talk_face;
    /* 10 */ u8 speak_width;
    /* 11 */ u8 active_talk_face;
    /* 12 */ bool8 instant_print;
    /* 13 */ s8 print_delay;
    /* 14 */ s8 print_clock;
    /* 15 */ u8 put_lines;
    /* 16 */ u8 unk_16;
    /* 17 */ u8 unk_17;
    /* 18 */ struct FaceProc * faces[TALK_FACE_COUNT];
    /* 38 */ ProcFunc unk_38;
    /* 3C */ int number;
    /* 40 */ char buf_number_str[0x20];
    /* 60 */ char buf_unk_str[0x20];
    /* 80 */ u16 unk_80;
    /* 82 */ u8 unk_82;
    /* 83 */ u8 unk_83;
};

struct TalkChoiceEnt
{
    u16 msg;
    Func onSwitch;
};

struct TalkChoiceProc
{
    PROC_HEADER;

    short selectedChoice;
    short x_disp;
    short y_disp;
    int unused30;
    struct TalkChoiceEnt const * choices;
};

struct ProcTalkAdvance {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    void * dst;
    int unk50;
    int lines, _fill;

    STRUCT_PAD(0x5C, 0x64);

    s16 timer;
};

// ??? sub_08007D80
// ??? sub_08007DB8
// ??? ClearTalkFaceRefs
void InitTalk(int chr, int lines, bool unpack_bubble);
// ??? InitSpriteTalk
// ??? sub_08007F50
void SetInitTalkTextFont();
// ??? StartTalkExt
// ??? StartTalkMsg
// ??? StartTalkMsgExt
// ??? StartTalk
// ??? EndTalk
// ??? SetTalkLines
// ??? ClearAllTalkFlags
// ??? SetTalkFlag
// ??? SetTalkFunc
// ??? ClearTalkFlag
// ??? CheckTalkFlag
// ??? SetTalkPrintDelay
// ??? SetTalkPrintColor
// ??? TalkSkipListener_OnIdle
// ??? Talk_OnInit
// ??? sub_08008218
bool sub_0800838C(ProcPtr proc);
bool TalkSpritePrepNextChar(ProcPtr proc);
// ??? LockTalk
// ??? IsTalkLocked
// ??? ResumeTalk
// ??? sub_080084EC
// ??? TalkToggleInvertedPalette
int TalkInterpret(ProcPtr proc);
void SetActiveTalkFace(int);
void sub_08008E34(ProcPtr proc);
// ??? StartTalkFace
// ??? GetFaceIdByXPos
void sub_08008F6C(int talk_face, int toBack);
void MoveTalkFace(int talkFaceFrom, int talkFaceTo);
bool sub_08009020();
void StartTalkFaceMove(int talkFaceFrom, int talkFaceTo, bool isSwap);
// ??? TalkFaceMove_OnInit
// ??? TalkFaceMove_OnIdle
// ??? sub_080091F0
// ??? TalkPause_OnIdle
// ??? TalkWaitForInput_OnIdle
// ??? nullsub_24
void StartTalkWaitForInput(struct Proc * parent, int x, int y);
// ??? StartTalkWaitForInputUnk
// ??? sub_0800931C
// ??? TalkShiftClearAll_OnIdle
void sub_080093CC(struct TalkChoiceEnt const * choices, struct Text * text, u16 * tm, int defaultChoice, int color, struct Proc * parent);
// ??? sub_08009480
// ??? sub_08009588
// ??? sub_080095C8
// ??? sub_800954C
// ??? sub_080096D4
void sub_08009708();
int GetTalkPauseCmdDuration(int cmd);
void ClearTalkBubble();
void ClearPutTalkText();
void ClearTalkText();
// ??? PutTalkBubble
void StartOpenTalkBubble();
// ??? sub_080099A4
void sub_08009A10(int x, int y, int width, int height);
void PutTalkBubbleTail(int bg, int x, int y, int kind);
void PutTalkBubbleTm(int id, int x, int y, int width, int height);
// ??? nullsub_25
// ??? sub_08009D58
// ??? TalkOpen_PutTalkBubble
// ??? sub_08009DFC
void StartTalkOpen(int talk_face, struct Proc* parent);
bool sub_08009EE0();
int GetTalkFaceHPos(int talk_face);
// ??? SetTalkFaceDisp
void SetTalkFaceMouthMove(int face);
void SetTalkFaceNoMouthMove(int face);
// ??? IsTalkActive
// ??? FaceExists
int GetTalkChoiceResult(void);
void SetTalkChoiceResult(int res);
void SetTalkNumber(int number);
// ??? SetTalkUnkStr
// ??? PrintStringToTexts
// ??? TalkPutSpriteText_OnIdle
// ??? sub_0800A0FC
// ??? sub_0800A108
int GetStrTalkLen(char const * str, bool isBubbleOpen);
// ??? sub_0800A4E8
// ??? sub_800A390
// ??? sub_800A3A4
// ??? StartTalkDebug
// ??? sub_800A3B8
// ??? sub_800A3C8
void TalkBgSync(int bits);

bool TalkAdvanceDeamon_Loop(ProcPtr proc);
void TalkAdvanceDeamon_End(ProcPtr proc);
void CleanTalkObjects(int chr, int lines, int default_val, ProcPtr parent);
void TalkAdvance_Init(struct ProcTalkAdvance * proc);
void TalkAdvance_Loop(struct ProcTalkAdvance * proc);

extern struct ProcCmd gUnk_08B90980[];
extern struct TalkSt * CONST_DATA sTalkSt;
extern struct ProcCmd gUnk_08BFFB6C[];
extern struct ProcCmd ProcScr_Talk[];
extern struct ProcCmd gUnk_08BFFBB4[];
extern struct ProcCmd gUnk_08BFFBBC[];
extern struct ProcCmd gUnk_08BFFBDC[];
extern struct ProcCmd gUnk_08BFFBFC[];
extern u16 const * CONST_DATA gUnk_08BFFC3C[];
extern struct ProcCmd gUnk_08BFFC7C[];
extern struct TalkChoiceEnt CONST_DATA gUnk_08BFFC9C[];
extern struct TalkChoiceEnt CONST_DATA gUnk_08BFFCAC[];
extern struct ProcCmd gUnk_08BFFCBC[];
extern struct ProcCmd gUnk_08BFFCD4[];
extern struct ProcCmd gUnk_08BFFCFC[];
extern int CONST_DATA gUnk_08BFFD2C[];
extern struct ProcCmd gUnk_08BFFD3C[];
extern struct ProcCmd gUnk_08BFFD4C[];
extern int CONST_DATA gUnk_08BFFD7C[];
extern u16 gUnk_08BFFD9C[];
extern u16 gUnk_08BFFDB6[];
extern struct ProcCmd gUnk_08BFFE18[];
extern struct ProcCmd ProcScr_TalkAdvanceDeamon[];
extern struct ProcCmd ProcScr_TalkAdvance[];
