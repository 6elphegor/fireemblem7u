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
PROC_SIZE_CHECK(struct TalkChoiceProc);

struct ProcTalkAdvance {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    void * dst;
    int unk50;
    int lines, _fill;

    STRUCT_PAD(0x5C, 0x64);

    s16 timer;
};
PROC_SIZE_CHECK(struct ProcTalkAdvance);

// ??? sub_08007D80
// ??? sub_08007DB8
// ??? ClearTalkFaceRefs
void InitTalk(int chr, int lines, bool unpack_bubble);
// ??? InitSpriteTalk
// ??? sub_08007F50
void SetInitTalkTextFont();
ProcPtr StartTalkExt(int x, int y, char const * str, ProcPtr parent);
// ??? StartTalkMsg
// ??? StartTalkMsgExt
// ??? StartTalk
void EndTalk(void);
// ??? SetTalkLines
void ClearAllTalkFlags(void);
void SetTalkFlag(int flag);
// ??? SetTalkFunc
// ??? ClearTalkFlag
// ??? CheckTalkFlag
// SetTalkPrintDelay(s8 delay): not declared here yet, worldmap.c declares it with an int parameter
void SetTalkPrintColor(u8 color);
// ??? TalkSkipListener_OnIdle
// ??? Talk_OnInit
// ??? Talk_Loop
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
struct FaceProc * StartTalkFace(int fid, int x, int y, int disp, int talk_face);
// ??? GetFaceIdByXPos
void sub_08008F6C(int talk_face, int toBack);
void MoveTalkFace(int talkFaceFrom, int talkFaceTo);
bool IsTalkFaceMoving();
void StartTalkFaceMove(int talkFaceFrom, int talkFaceTo, bool isSwap);
// ??? TalkFaceMove_OnInit
// ??? TalkFaceMove_OnIdle
// ??? Talk_OnEnd
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
// ??? TalkSpriteShiftClear_Init
// ??? sub_080096D4
void sub_08009708();
int GetTalkPauseCmdDuration(int cmd);
void ClearTalkBubble();
void ClearPutTalkText();
void ClearTalkText();
// ??? PutTalkBubble
void StartOpenTalkBubble();
// ??? TalkBubbleOpen_OnIdle
void sub_08009A10(int x, int y, int width, int height);
void PutTalkBubbleTail(int bg, int x, int y, int kind);
void PutTalkBubbleTm(int id, int x, int y, int width, int height);
// ??? TalkOpen_OnEnd
// ??? TalkOpen_InitBlend
// ??? TalkOpen_PutTalkBubble
// ??? TalkOpen_OnIdle
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
// ??? ClearPrimaryHBlank
// ??? TalkPutSpriteText_OnEnd
int GetStrTalkLen(char const * str, bool isBubbleOpen);
// ??? GetZero
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
extern struct TalkSt sTalkStData;   // IWRAM 0x03000040, what the ROM pointer sTalkSt points at
extern const struct ProcCmd gProcScr_TalkSkipListener[];
extern const struct ProcCmd ProcScr_Talk[];
extern const struct ProcCmd gProcScr_TalkLock[];
#define gProcScr_TalkFaceMove (gProcScr_TalkLock + 1)
extern const struct ProcCmd gUnk_08BFFBDC[];
extern const struct ProcCmd gProcScr_TalkWaitForInput[];
extern const u16 * const gUnk_08B90A8C[];
extern const struct ProcCmd gProcScr_TalkShiftClearAll[];
extern struct TalkChoiceEnt CONST_DATA gUnk_08BFFC9C[];
extern const struct TalkChoiceEnt gUnk_08BFFCAC[];
extern const struct ProcCmd gUnk_08B90B0C[];
extern const struct ProcCmd gUnk_08B90B24[];
extern const struct ProcCmd ProcScr_TalkSpriteShiftClear[];
extern int CONST_DATA gTalkPauseDurations[];
extern const struct ProcCmd gProcScr_TalkBubbleOpen[];
extern const struct ProcCmd gProcScr_TalkOpen[];
extern int CONST_DATA gTalkFaceHPosLut[];
extern u16 gSprite_TalkTextFront[];
extern u16 gSprite_TalkTextBack[];
extern struct ProcCmd gUnk_08BFFE18[];
extern struct ProcCmd ProcScr_TalkAdvanceDeamon[];
extern struct ProcCmd ProcScr_TalkAdvance[];
