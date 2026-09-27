#include "gbafe.h"

// FE8U: ending_details.c

struct CharacterEndingEnt {
    /* 00 */ u8 type;
    /* 01 */ u8 pidA;
    /* 02 */ u8 pidB;
    /* 04 */ int msg;
};

struct EndingTitleEnt {
    /* 00 */ u8 pid;
    /* 04 */ int titleTextId;
};

struct EndingDefeatEnt {
    /* 00 */ u8 pid;
    /* 01 */ u8 defeatType;
};

struct CharacterEndingProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ STRUCT_PAD(0x2A, 0x2E);
    /* 2E */ u16 unk_2e;
    /* 30 */ struct CharacterEndingEnt const * pCharacterEnding;
    /* 34 */ struct CharacterEndingEnt const * pCharacterEndingBkp;
    /* 38 */ struct Unit * unitA;
    /* 3C */ struct Unit * unitB;
    /* 40 */ u32 pidShownFlags[8];
};

struct EndingBattleDisplayProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * units[2];
    /* 34 */ STRUCT_PAD(0x34, 0x3C);
    /* 3C */ u16 battleAmounts[2];
    /* 40 */ u16 winAmounts[2];
    /* 44 */ u16 lossAmounts[2];
};

extern char * CONST_DATA gpDefeatedEndingLocString;
extern struct EndingTitleEnt CONST_DATA gCharacterEndingTitleLut[];
extern struct EndingDefeatEnt CONST_DATA gCharacterEndingDefeatLut[];
extern struct CharacterEndingEnt const * CONST_DATA gCharacterEndingsByRoute[];
extern u16 * CONST_DATA gSoloEndingBattleDispConf[];
extern struct Text * CONST_DATA gpCharacterEndingTexts;
extern struct ProcCmd CONST_DATA gProcScr_CharacterEndings[];
extern char const gStr_EndingQuote[];
extern char const gStr_EndingPeriod[];

extern u8 Img_CharacterEndingMenu[];
extern u8 Img_PrepMuralBackground[];
extern u16 Pal_CharacterEndingMenu[];
extern u16 Pal_CommGameBgScreen[];
extern u8 Tsa_CommGameBgScreen[];
extern u8 Tsa_CharacterEnding_TopBorder[];
extern u8 Tsa_CharacterEnding_BottomBorder[];

void EndEndingBattleText(void);
void StartSoloEndingBattleDisplay(struct CharacterEndingEnt const * ent, struct Unit * unit, ProcPtr parent);
void StartPairedEndingBattleDisplay(struct CharacterEndingEnt const * ent, struct Unit * unitA, struct Unit * unitB, ProcPtr parent);
void StartEndingBattleText(struct CharacterEndingEnt const * ent, struct Unit * unitA, struct Unit * unitB, ProcPtr parent);

int GetPidTitleTextId(int pid)
{
    struct EndingTitleEnt const * ent;

    for (ent = gCharacterEndingTitleLut; ent->pid != 0; ent++)
    {
        if (ent->pid == pid)
            return ent->titleTextId;
    }

    return 0;
}

int GetPidDefeatType(int pid)
{
    struct EndingDefeatEnt const * ent;

    for (ent = gCharacterEndingDefeatLut; ent->pid != 0; ent++)
    {
        if (ent->pid == pid)
            return ent->defeatType;
    }

    return 0;
}

char * PrepareUnitDefeatLocationString(int chapter, char * str)
{
    struct ChapterInfo const * info;

    str = AppendCharacter(1, str);
    str = AppendString(gStr_EndingQuote, str);

    info = GetChapterInfo(chapter);

    str = AppendString(DecodeMsg(info->unk74[gPlaySt.chapterModeIndex == 3 ? 1 : 0]), str);
    str = AppendString(gStr_EndingQuote, str);

    return str;
}

char * GetPidDefeatedEndingString(int pid)
{
    char * str = gpDefeatedEndingLocString;
    int type = GetPidDefeatType(pid);
    int chapter;

    if (type == 4)
        pid = CheckChapterFlag(0x7D) ? 0x15 : 0xF;

    chapter = GetPidStats(pid)->defeat_chapter;

    *str = 0;

    switch (type)
    {
    case 0:
        str = AppendString(DecodeMsg(0x1019), str);
        str = PrepareUnitDefeatLocationString(chapter, str);
        AppendString(gStr_EndingPeriod, str);
        break;

    case 1:
        str = AppendString(DecodeMsg(0x101A), str);
        str = PrepareUnitDefeatLocationString(chapter, str);
        AppendString(DecodeMsg(0x101B), str);
        break;

    case 2:
        str = AppendString(DecodeMsg(0x101A), str);
        str = PrepareUnitDefeatLocationString(chapter, str);
        AppendString(DecodeMsg(0x101C), str);
        break;

    case 3:
        if (chapter == 0x1D || chapter == 0x1E)
        {
            str = AppendString(DecodeMsg(0x101A), str);
            str = PrepareUnitDefeatLocationString(chapter, str);
            AppendString(DecodeMsg(0x101C), str);
        }
        else
        {
            str = AppendString(DecodeMsg(0x1019), str);
            str = PrepareUnitDefeatLocationString(chapter, str);
            AppendString(gStr_EndingPeriod, str);
        }
        break;

    case 4:
        if (pid == 0x15)
            str = AppendString(DecodeMsg(0x1091), str);
        else
            str = AppendString(DecodeMsg(0x1092), str);

        str = PrepareUnitDefeatLocationString(chapter, str);
        AppendString(DecodeMsg(0x1093), str);
        break;

    case 5:
        return NULL;
    }

    return gpDefeatedEndingLocString;
}

void SetupCharacterEndingGfx(void)
{
    Decompress(Img_CharacterEndingMenu, (void *) (VRAM + 0x5000));
    Decompress(Img_PrepMuralBackground, (void *) (VRAM + 0x8000));
}

void CharacterEnding_PutBackground(void)
{
    ApplyPalettes(Pal_CharacterEndingMenu, 12, 2);
    ApplyPalettes(Pal_CommGameBgScreen, 14, 2);

    TmApplyTsa_thm(gBg3Tm, Tsa_CommGameBgScreen, 0xE000);
    TmApplyTsa_thm(gBg2Tm, Tsa_CharacterEnding_TopBorder, 0xC280);
    TmApplyTsa_thm(gBg2Tm + TM_OFFSET(0, 18), Tsa_CharacterEnding_BottomBorder, 0xC280);

    EnableBgSync(BG2_SYNC_BIT | BG3_SYNC_BIT);
}

void sub_080B8160(int a, int b)
{
    TmFill(gBg1Tm, 0);

    sub_080A8838(gSoloEndingBattleDispConf[2], 0, 1, 2, a, b + 2, 30, 16);
    sub_080A8838(gSoloEndingBattleDispConf[1], 0, 1, 1, a, b + 2, 30, 18);
    sub_080A8838(gSoloEndingBattleDispConf[0], 0, 0, 0, a, b, 30, 20);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}

void InitCharacterEndingText(void)
{
    int i;

    ResetText();

    for (i = 0; i < 2; i++)
    {
        InitText(gpCharacterEndingTexts + 5 + i, 15);
        InitText(gpCharacterEndingTexts + 7 + i, 10);
    }

    for (i = 0; i < 5; i++)
        InitText(gpCharacterEndingTexts + i, 25);
}

void CharacterEnding_Init(struct CharacterEndingProc * proc)
{
    InitBgs(NULL);
    InitFaces();
    SetupCharacterEndingGfx();
    SetBlendNone();

    proc->unk_2e = 0;

    CpuFill16(0, proc->pidShownFlags, sizeof(proc->pidShownFlags));

    if (gPlaySt.chapterModeIndex == 3)
        proc->pCharacterEnding = gCharacterEndingsByRoute[1];
    else
        proc->pCharacterEnding = gCharacterEndingsByRoute[0];

    proc->pCharacterEndingBkp = proc->pCharacterEnding;
}

void CharacterEnding_80B69D4(void)
{
    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);

    ClearTalk();

    EndEndingBattleText();
    CharacterEnding_PutBackground();

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}

struct Unit * GetUnitForCharacterEnding(int pid)
{
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->pCharacterData->number != pid)
            continue;

        if (unit->state & US_BIT16)
            return NULL;

        return unit;
    }

    return NULL;
}

int GetUnitASupporterPid(struct Unit * unit)
{
    int i;

    if (unit == NULL)
        return 0;

    for (i = 0; i < 7; i++)
    {
        if (GetUnitSupportLevel(unit, i) == 3)
            return GetUnitSupportPid(unit, i);
    }

    return 0;
}

bool DoesUnitHavePairedEnding(struct CharacterEndingEnt const * pairingEnt, struct Unit * unit)
{
    int pidA = unit->pCharacterData->number;
    int pidB = GetUnitASupporterPid(unit);

    if (pidB == 0)
        return false;

    for (; pairingEnt->pidA != 0; pairingEnt++)
    {
        if (pairingEnt->pidA == pidA && pairingEnt->pidB == pidB)
            return true;

        if (pairingEnt->pidA == pidB && pairingEnt->pidB == pidA)
            return true;
    }

    return false;
}

ASM_FUNC("asm/nonmatching/code_080B839C.s");
void CharacterEnding_StartBattleDisplay(struct CharacterEndingProc * proc)
{
    switch (proc->pCharacterEnding->type)
    {
    case 1:
    case 5:
        StartSoloEndingBattleDisplay(proc->pCharacterEnding, proc->unitA, proc);
        break;

    case 2:
    case 3:
        StartPairedEndingBattleDisplay(proc->pCharacterEnding, proc->unitA, proc->unitB, proc);
        break;

    case 4:
        StartPairedEndingBattleDisplay(proc->pCharacterEnding, proc->unitA, proc->unitB, proc);
        break;
    }
}

void CharacterEnding_StartBattleDisplayText(struct CharacterEndingProc * proc)
{
    StartEndingBattleText(proc->pCharacterEnding, proc->unitA, proc->unitB, proc);
}

void CharacterEnding_End(void)
{
    InitBgs(NULL);
    ClearTalk();
    EndEndingBattleText();

    SetBlendDarken(0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(0, 0, 0, 0, 0);

    SetDispEnable(1, 1, 1, 1, 1);
}

void CharacterEnding_FadeBgm(void)
{
    FadeBgmOut(11);
}

void CharacterEnding_Unused_80B6C74(struct CharacterEndingProc * proc)
{
    proc->pCharacterEnding++;

    if (proc->pCharacterEnding->type == 0)
        Proc_Goto(proc, 100);
}

void StartCharacterEndings(ProcPtr parent)
{
    Proc_StartBlocking(gProcScr_CharacterEndings, parent);
}

void CharacterEnding_LoadUnitBattleStats(struct EndingBattleDisplayProc * proc)
{
    int i;

    for (i = 0; i < 2; i++)
    {
        struct PidStats * bwl;

        struct Unit * unit = proc->units[i];

        if (unit == NULL)
            continue;

        bwl = GetPidStats(unit->pCharacterData->number);

        proc->battleAmounts[i] = bwl->battle_count < 999 ? bwl->battle_count : 999;
        proc->winAmounts[i] = bwl->win_count < 999 ? bwl->win_count : 999;
        proc->lossAmounts[i] = bwl->loss_count;
    }
}

ASM_FUNC("asm/nonmatching/code_080B8654.s");
ASM_FUNC("asm/nonmatching/code_080B8874.s");
ASM_FUNC("asm/nonmatching/code_080B88C0.s");
ASM_FUNC("asm/nonmatching/code_080B88E0.s");
ASM_FUNC("asm/nonmatching/code_080B8B90.s");
ASM_FUNC("asm/nonmatching/code_080B8BF0.s");
ASM_FUNC("asm/nonmatching/code_080B8C40.s");
ASM_FUNC("asm/nonmatching/code_080B8C8C.s");
ASM_FUNC("asm/nonmatching/code_080B8CAC.s");
ASM_FUNC("asm/nonmatching/code_080B8D98.s");
ASM_FUNC("asm/nonmatching/code_080B8E78.s");
ASM_FUNC("asm/nonmatching/code_080B8E98.s");
ASM_FUNC("asm/nonmatching/code_080B8EA8.s");
ASM_FUNC("asm/nonmatching/code_080B8EEC.s");
ASM_FUNC("asm/nonmatching/code_080B8F64.s");
ASM_FUNC("asm/nonmatching/code_080B8FBC.s");
ASM_FUNC("asm/nonmatching/code_080B9020.s");
ASM_FUNC("asm/nonmatching/code_080B9074.s");
ASM_FUNC("asm/nonmatching/code_080B90AC.s");
ASM_FUNC("asm/nonmatching/code_080B90C0.s");
ASM_FUNC("asm/nonmatching/code_080B9128.s");
ASM_FUNC("asm/nonmatching/code_080B915C.s");
ASM_FUNC("asm/nonmatching/code_080B924C.s");
ASM_FUNC("asm/nonmatching/code_080B9340.s");
ASM_FUNC("asm/nonmatching/code_080B9654.s");
ASM_FUNC("asm/nonmatching/code_080B96FC.s");
ASM_FUNC("asm/nonmatching/code_080B9B38.s");
ASM_FUNC("asm/nonmatching/code_080B9D54.s");
ASM_FUNC("asm/nonmatching/code_080B9DD4.s");
ASM_FUNC("asm/nonmatching/code_080B9E10.s");
ASM_FUNC("asm/nonmatching/code_080B9E40.s");
ASM_FUNC("asm/nonmatching/code_080B9E58.s");
ASM_FUNC("asm/nonmatching/code_080B9F4C.s");
ASM_FUNC("asm/nonmatching/code_080B9F78.s");
ASM_FUNC("asm/nonmatching/code_080B9F84.s");
ASM_FUNC("asm/nonmatching/code_080B9FB0.s");
ASM_FUNC("asm/nonmatching/code_080B9FC4.s");
ASM_FUNC("asm/nonmatching/code_080B9FD8.s");
ASM_FUNC("asm/nonmatching/code_080BA10C.s");
ASM_FUNC("asm/nonmatching/code_080BA25C.s");
ASM_FUNC("asm/nonmatching/code_080BA30C.s");
ASM_FUNC("asm/nonmatching/code_080BA350.s");
ASM_FUNC("asm/nonmatching/code_080BA364.s");
ASM_FUNC("asm/nonmatching/code_080BA3A0.s");
