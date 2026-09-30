#include "gbafe.h"
#include "gbafe/msg.h"

struct BonusClaimHelpBoxProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ STRUCT_PAD(0x34, 0x58);
    /* 58 */ int msgId;
};
PROC_SIZE_CHECK(struct BonusClaimHelpBoxProc);

// Data (not yet in C; FE7U addresses in symbols.ld)

void * memcpy(void * dst, const void * src, unsigned long n);

void BonusClaimHelp_Init(struct BonusClaimHelpBoxProc * proc);
void BonusClaimHelp_Loop(struct BonusClaimHelpBoxProc * proc);

CONST_DATA struct ProcCmd gProcScr_BonusClaimHelpBox[] = {
    PROC_YIELD,
    PROC_CALL(BonusClaimHelp_Init),
    PROC_SLEEP(8),
    PROC_REPEAT(BonusClaimHelp_Loop),
    PROC_SLEEP(8),
    PROC_END,
};

char * AppendChapterNumberString(int chapter, char * str)
{
    int lut[10] = { 0x117B, 0x117C, 0x117D, 0x117E, 0x117F, 0x1180, 0x1181, 0x1182, 0x1183, 0x1184 };
    char buf[0x20];

    int number = GetChapterInfo(chapter)->prepScreenNumber[gPlaySt.chapterModeIndex == 3 ? 1 : 0] >> 1;

    switch (chapter)
    {
    case 0x2E:
    case 0x2F:
        str = AppendString(DecodeMsgInBuffer(0x1186, buf), str);
        str = AppendString(DecodeMsgInBuffer(0x118B, buf), str);
        return str;
    }

    str = AppendString(DecodeMsgInBuffer(0x1185, buf), str);

    if (number > 9)
        str = AppendString(DecodeMsgInBuffer(lut[number / 10], buf), str);

    str = AppendString(DecodeMsgInBuffer(lut[number % 10], buf), str);

    if (GetChapterInfo(chapter)->prepScreenNumber[gPlaySt.chapterModeIndex == 3 ? 1 : 0] & 1)
        str = AppendString(DecodeMsgInBuffer(0x1188, buf), str);

    str = AppendString(DecodeMsgInBuffer(0x118B, buf), str);
    str = AppendString(DecodeMsgInBuffer(0x118B, buf), str);
    return str;
}

int CopyTextChar(char const ** src, char ** dst)
{
    int len;
    int width;

    len = GetCharTextLen(*src, &width) - *src;

    memcpy(*dst, *src, len);

    *src = *src + len;
    *dst = *dst + len;

    return len;
}

void ClearOnHBlankA(void)
{
    SetOnHBlankA(NULL);
}

void FadeOutBgm(int speed)
{
    CallSomeSoundMaybe(0, 0x100, 0, speed, NULL);
}

void FadeInBgm(int songId)
{
    CallSomeSoundMaybe(songId, 0x100, 0x100, 0x20, NULL);
}

void BonusClaimHelp_Init(struct BonusClaimHelpBoxProc * proc)
{
    PlaySoundEffect(0x390);
    StartHelpBox_Unk(proc->x, proc->y, proc->msgId);
}

void BonusClaimHelp_Loop(struct BonusClaimHelpBoxProc * proc)
{
    if (gpKeySt->pressed & (A_BUTTON | B_BUTTON | START_BUTTON | L_BUTTON | R_BUTTON))
    {
        Proc_Break(proc);
        PlaySoundEffect(0x391);
        CloseHelpBox();
    }
}

void StartBonusClaimHelpBox(int x, int y, int msgId, ProcPtr parent)
{
    struct BonusClaimHelpBoxProc * proc = Proc_StartBlocking(gProcScr_BonusClaimHelpBox, parent);

    proc->x = x;
    proc->y = y;
    proc->msgId = msgId;
}

void PutCompressedTsa(u16 * tm, void const * tsa, u16 tileref)
{
    Decompress(tsa, gBuf);
    TmApplyTsa_thm(tm, gBuf, tileref);
}

int CountDigits(int number)
{
    int count = 0;

    do
    {
        count++;
        number = number / 10;
    } while (number != 0);

    return count;
}

bool IsPointInQuad(int a, int b, int c, int d, int e, int f, int g, int h)
{
    if (((c - a) * (f - b) - (d - b) * (e - a)) < 0)
        return FALSE;

    if (((e - a) * (h - b) - (f - b) * (g - a)) < 0)
        return FALSE;

    if (((g - a) * (d - b) - (h - b) * (c - a)) < 0)
        return FALSE;

    return TRUE;
}
