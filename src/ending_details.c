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
    /* 34 */ int timer;
    /* 38 */ struct CharacterEndingEnt const * pCharacterEnding;
    /* 3C */ u16 battleAmounts[2];
    /* 40 */ u16 winAmounts[2];
    /* 44 */ u16 lossAmounts[2];
};

struct EndingBattleTextProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct CharacterEndingEnt const * pCharacterEnding;
    /* 30 */ struct Unit * unitA;
    /* 34 */ struct Unit * unitB;
    /* 38 */ STRUCT_PAD(0x38, 0x3C);
    /* 3C */ int pauseTimer;
    /* 40 */ int defaultPauseDelay;
    /* 44 */ char const * str;
    /* 48 */ struct Text * text;
};

struct FinScreenProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ STRUCT_PAD(0x2A, 0x4C);
    /* 4C */ s16 blendTimer;
    /* 4E */ STRUCT_PAD(0x4E, 0x58);
    /* 58 */ int timer;
};

struct EndingTurnRecordProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int chapterId;
    /* 30 */ int yPos;
    /* 34 */ int yScrollAmt;
    /* 38 */ u8 chapterStatsIdx;
    /* 39 */ u8 displayId;
    /* 3A */ STRUCT_PAD(0x3A, 0x4C);
    /* 4C */ s16 unk_4c;
};

struct PlayerRankFlashProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ STRUCT_PAD(0x2A, 0x58);
    /* 58 */ int pal;
};

struct PlayerRankProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int idx;
    /* 30 */ int timer;
    /* 34 */ STRUCT_PAD(0x34, 0x3A);
    /* 3A */ u8 ranks[6];
    /* 40 */ u8 counts[6];
    /* 46 */ u8 unk_46[6];
    /* 4C */ u16 scales[6];
};

void StartPlayerRankFlash(int pal, ProcPtr parent);
void PlayerRank_PutSprites(struct PlayerRankProc * proc);

int GetGameTacticsRank(void);
int GetGameSurvivalRank(void);
int GetGameExpRank(void);
int GetGameCombatRank(void);
int GetGameFundsRank(void);
int GetOverallRank(int tacticsRank, int survivalRank, int fundsRank, int combatRank, int expRank);
int sub_080B663C(int param_1, int param_2, int param_3);
int GetChapterTacticsRank(void);
int GetChapterSurvivalRank(void);
int GetChapterCombatRank(void);

extern u8 const Tsa_PlayerRankBg[];
extern u16 const Pal_PlayerRankBg[];
extern u8 const Img_PlayerRankLetters[];
extern u16 const Pal_PlayerRankLetters[];
extern u16 const Pal_PlayerRankUnk_085DFA90[];
extern u16 Pal_PlayerRankUnk_085DFAB0[];
extern u16 const Pal_PlayerRankUnk_085DFAF0[];
extern u16 CONST_DATA Sprite_PlayerRank_08CEEA70[];
extern u16 CONST_DATA Sprite_PlayerRank_08CEEA90[];
extern u16 CONST_DATA Sprite_PlayerRank_08CEEA9E[];
extern u16 CONST_DATA Sprite_PlayerRank_08CEEAAC[];
extern u16 CONST_DATA Sprite_PlayerRank_08CEEABA[];
extern u16 CONST_DATA Sprite_PlayerRank_08CEEAC8[];
extern u16 CONST_DATA Sprite_PlayerRank_08CEEAD6[];
extern u16 CONST_DATA Sprite_PlayerRank_08CEEAE4[];
extern u16 const * CONST_DATA SpriteLut_PlayerRank_08CEEB54[];
extern u16 const * CONST_DATA SpriteLut_PlayerRank_08CEEB6C[];

extern const struct ProcCmd ProcScr_PlayerRankUnk_08CEEB84[];
extern const struct ProcCmd ProcScr_PlayerRankFlash[];
extern const struct ProcCmd ProcScr_PlayerRankScreen[];
extern const struct ProcCmd ProcScr_EndingCgScroll[];
extern const struct ProcCmd ProcScr_EndingCgScroll2[];
extern u8 * CONST_DATA gpEndingCgScrollBlendTable;

struct EndingCgScrollEnt {
    /* 00 */ void const * img[7];
    /* 1C */ void const * tsa[4];
};

struct EndingCgScrollProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int yPos;
    /* 30 */ struct EndingCgScrollEnt const * lut;
    /* 34 */ u8 imgIdx;
    /* 35 */ u8 tsaIdx;
    /* 36 */ u8 bank;
    /* 38 */ u16 lastY;
    /* 3C */ int speed;
};

extern struct EndingCgScrollEnt CONST_DATA gEndingCgScrollLut[];
extern struct EndingCgScrollEnt CONST_DATA gEndingCgScroll2Lut[];
extern u16 Pal_EndingCgScroll[];

void EndingCgScroll_InitBlendTable(void);
void EndingCgScroll_HBlank(void);

void SetFacePosition(int slot, int x, int y);
void DrawFinImage(void);

extern const struct ProcCmd gProcScr_FinScreen[];
extern struct Text * CONST_DATA gpTurnRecordTexts;

int HandleTurnRecordText(struct ChapterStats * chapterStats, int displayId);
extern u16 Pal_TurnRecordBg[];
extern u8 Tsa_TurnRecordBg[];
int CountDigits(int number);
int GetGameOverallRank(void);
void sub_080B8160(int a, int b);

extern u8 CONST_DATA gCharEndingSlideOffsetLut[];
extern const struct ProcCmd gProcScr_EndingBattleDisplay_Solo[];
extern const struct ProcCmd gProcScr_EndingBattleDisplay_Paired[];
extern const struct ProcCmd gProcScr_EndingBattleDisplay_Text[];
extern u8 Tsa_SoloEndingWindow[];
extern u8 Tsa_SoloEndingNameplate[];
extern u8 Tsa_PairedEndingWindow[];
extern u8 Tsa_PairedEndingNameplates[];
extern u16 Pal_FinScreen[];
extern u8 Img_FinScreen[];
extern u8 Tsa_FinScreen[];

extern char * CONST_DATA gpDefeatedEndingLocString;
extern struct EndingTitleEnt CONST_DATA gCharacterEndingTitleLut[];
extern struct EndingDefeatEnt CONST_DATA gCharacterEndingDefeatLut[];
extern struct CharacterEndingEnt const * CONST_DATA gCharacterEndingsByRoute[];
extern u16 * CONST_DATA gSoloEndingBattleDispConf[];
extern struct Text * CONST_DATA gpCharacterEndingTexts;
extern const struct ProcCmd gProcScr_CharacterEndings[];
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
        pid = CheckPermanentFlag(0x7D) ? 0x15 : 0xF;

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

void LoadNextCharacterEnding(struct CharacterEndingProc * proc)
{
    proc->unitB = NULL;
    proc->unitA = NULL;

    for (;; proc->pCharacterEnding++)
    {
        if (proc->pCharacterEnding->type == 0)
        {
            Proc_Goto(proc, 100);
            return;
        }

        if ((*&proc->pidShownFlags[proc->pCharacterEnding->pidA >> 5] >> (proc->pCharacterEnding->pidA & 0x1f)) & 1)
            continue;

        if (proc->pCharacterEnding->pidB != 0)
        {
            if ((*&proc->pidShownFlags[proc->pCharacterEnding->pidB >> 5] >> (proc->pCharacterEnding->pidB & 0x1f)) & 1)
                continue;
        }

        if (proc->pCharacterEnding->pidA == 0xCD)
        {
            if (!gPlaySt.tact_enabled)
                continue;

            proc->unitA = NULL;
        }
        else
        {
            proc->unitA = GetUnitForCharacterEnding(proc->pCharacterEnding->pidA);

            if (proc->unitA == NULL)
                continue;

            switch (proc->pCharacterEnding->type)
            {
            case 1:
                if (DoesUnitHavePairedEnding(proc->pCharacterEndingBkp, proc->unitA))
                    continue;

                break;

            case 2:
                proc->unitB = GetUnitForCharacterEnding(proc->pCharacterEnding->pidB);

                if (proc->unitB == NULL)
                    continue;

                if (GetUnitASupporterPid(proc->unitA) != proc->pCharacterEnding->pidB)
                    continue;

                break;

            case 3:
                if (GetUnitASupporterPid(GetUnitFromCharId(1)) == 0x25)
                    continue;

                proc->unitB = GetUnitForCharacterEnding(proc->pCharacterEnding->pidB);

                if (proc->unitB == NULL)
                    continue;

                break;

            case 4:
                proc->unitB = GetUnitFromCharId(0xF);

                if (proc->unitB == NULL)
                    continue;

                break;
            }
        }

        *&proc->pidShownFlags[(proc->pCharacterEnding->pidA >> 5)] |= 1 << (proc->pCharacterEnding->pidA & 0x1f);

        if (proc->pCharacterEnding->pidB == 0)
            return;

        *&proc->pidShownFlags[proc->pCharacterEnding->pidB >> 5] |= 1 << (proc->pCharacterEnding->pidB & 0x1f);

        return;
    }
}

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

void SoloEndingBattleDisp_Init(struct EndingBattleDisplayProc * proc)
{
    char const * str;

    InitCharacterEndingText();

    CharacterEnding_LoadUnitBattleStats(proc);

    TmFill(gSoloEndingBattleDispConf[0], 0);
    TmFill(gSoloEndingBattleDispConf[1], 0);
    TmFill(gSoloEndingBattleDispConf[2], 0);

    TmApplyTsa_thm(gSoloEndingBattleDispConf[2], Tsa_SoloEndingWindow, 0xC280);
    TmApplyTsa_thm(gSoloEndingBattleDispConf[1], Tsa_SoloEndingNameplate, 0xC280);

    if (proc->pCharacterEnding->pidA == 0xCD)
    {
        int rank = GetGameOverallRank();

        if (rank > 3)
            DecodeMsg(0x1074);
        else if (rank > 1)
            DecodeMsg(0x1076);
        else
            DecodeMsg(0x1078);

        str = MsgExpand();

        PutDrawText(gpCharacterEndingTexts + 5, gSoloEndingBattleDispConf[0] + TM_OFFSET(1, 3), 0, GetStringTextCenteredPos(120, str), 0, str);
    }
    else
    {
        str = DecodeMsg(GetPidTitleTextId(proc->pCharacterEnding->pidA));

        PutDrawText(gpCharacterEndingTexts + 5, gSoloEndingBattleDispConf[0] + TM_OFFSET(1, 3), 0, GetStringTextCenteredPos(120, str), 0, str);

        PutDrawText(gpCharacterEndingTexts + 8, gSoloEndingBattleDispConf[0] + TM_OFFSET(17, 1), 3, 0, 0, DecodeMsg(0x12AB));
        PutDrawText(gpCharacterEndingTexts + 8, gSoloEndingBattleDispConf[0] + TM_OFFSET(17, 1), 3, 32, 0, DecodeMsg(0x12AC));
        PutDrawText(gpCharacterEndingTexts + 8, gSoloEndingBattleDispConf[0] + TM_OFFSET(17, 1), 3, 64, 0, DecodeMsg(0x12AD));

        PutNumber(gSoloEndingBattleDispConf[0] + TM_OFFSET(17, 1) + CountDigits(proc->battleAmounts[0]), 2, proc->battleAmounts[0]);
        PutNumber(gSoloEndingBattleDispConf[0] + TM_OFFSET(21, 1) + CountDigits(proc->winAmounts[0]), 2, proc->winAmounts[0]);
        PutNumber(gSoloEndingBattleDispConf[0] + TM_OFFSET(25, 1) + CountDigits(proc->lossAmounts[0]), 2, proc->lossAmounts[0]);

        StartBmFace(0, gCharacterData[proc->pCharacterEnding->pidA - 1].portraitId, 416, 56, 0x502);

        if (proc->units[0]->state & US_DEAD)
        {
            ArchivePalette(0x16);
            WriteFadedPaletteFromArchive(0xC0, 0xC0, 0xC0, 0x400000);
        }
    }

    proc->timer = 0;
    SetBlendNone();
}

void SoloEndingBattleDisp_Loop(struct EndingBattleDisplayProc * proc)
{
    int xBase = 30;
    int xOffset = gCharEndingSlideOffsetLut[proc->timer++];

    if (proc->pCharacterEnding->pidA != 0xCD)
        SetFacePosition(0, OAM1_X((xBase - xOffset) * 8 + 176), 56);

    sub_080B8160(xBase - xOffset, 0);

    if (xOffset == 30)
        Proc_Break(proc);
}

void StartSoloEndingBattleDisplay(struct CharacterEndingEnt const * ent, struct Unit * unit, ProcPtr parent)
{
    struct EndingBattleDisplayProc * proc = Proc_StartBlocking(gProcScr_EndingBattleDisplay_Solo, parent);

    proc->units[0] = unit;
    proc->units[1] = NULL;

    proc->pCharacterEnding = ent;
}

void PairedEndingBattleDisp_Init(struct EndingBattleDisplayProc * proc)
{
    char const * str;

    InitCharacterEndingText();

    CharacterEnding_LoadUnitBattleStats(proc);

    TmFill(gSoloEndingBattleDispConf[0], 0);
    TmFill(gSoloEndingBattleDispConf[1], 0);
    TmFill(gSoloEndingBattleDispConf[2], 0);

    TmApplyTsa_thm(gSoloEndingBattleDispConf[2], Tsa_PairedEndingWindow, 0xC280);
    TmApplyTsa_thm(gSoloEndingBattleDispConf[1], Tsa_PairedEndingNameplates, 0xC280);

    str = DecodeMsg(GetPidTitleTextId(proc->pCharacterEnding->pidA));
    PutDrawText(gpCharacterEndingTexts + 5, gSoloEndingBattleDispConf[0] + TM_OFFSET(1, 3), 0, GetStringTextCenteredPos(120, str), 0, str);

    PutDrawText(gpCharacterEndingTexts + 7, gSoloEndingBattleDispConf[0] + TM_OFFSET(1, 17), 3, 0, 0, DecodeMsg(0x12AB));
    PutDrawText(gpCharacterEndingTexts + 7, gSoloEndingBattleDispConf[0] + TM_OFFSET(1, 17), 3, 32, 0, DecodeMsg(0x12AC));
    PutDrawText(gpCharacterEndingTexts + 7, gSoloEndingBattleDispConf[0] + TM_OFFSET(1, 17), 3, 64, 0, DecodeMsg(0x12AD));

    PutNumber(gSoloEndingBattleDispConf[0] + TM_OFFSET(1, 17) + CountDigits(proc->battleAmounts[0]), 2, proc->battleAmounts[0]);
    PutNumber(gSoloEndingBattleDispConf[0] + TM_OFFSET(5, 17) + CountDigits(proc->winAmounts[0]), 2, proc->winAmounts[0]);
    PutNumber(gSoloEndingBattleDispConf[0] + TM_OFFSET(9, 17) + CountDigits(proc->lossAmounts[0]), 2, proc->lossAmounts[0]);

    str = DecodeMsg(GetPidTitleTextId(proc->pCharacterEnding->pidB));
    PutDrawText(gpCharacterEndingTexts + 6, gSoloEndingBattleDispConf[0] + TM_OFFSET(14, 17), 0, GetStringTextCenteredPos(120, str), 0, str);

    PutDrawText(gpCharacterEndingTexts + 8, gSoloEndingBattleDispConf[0] + TM_OFFSET(17, 1), 3, 0, 0, DecodeMsg(0x12AB));
    PutDrawText(gpCharacterEndingTexts + 8, gSoloEndingBattleDispConf[0] + TM_OFFSET(17, 1), 3, 32, 0, DecodeMsg(0x12AC));
    PutDrawText(gpCharacterEndingTexts + 8, gSoloEndingBattleDispConf[0] + TM_OFFSET(17, 1), 3, 64, 0, DecodeMsg(0x12AD));

    PutNumber(gSoloEndingBattleDispConf[0] + TM_OFFSET(17, 1) + CountDigits(proc->battleAmounts[1]), 2, proc->battleAmounts[1]);
    PutNumber(gSoloEndingBattleDispConf[0] + TM_OFFSET(21, 1) + CountDigits(proc->winAmounts[1]), 2, proc->winAmounts[1]);
    PutNumber(gSoloEndingBattleDispConf[0] + TM_OFFSET(25, 1) + CountDigits(proc->lossAmounts[1]), 2, proc->lossAmounts[1]);

    proc->timer = 0;

    SetBlendNone();

    StartBmFace(0, gCharacterData[proc->pCharacterEnding->pidA - 1].portraitId, 304, 48, 0x503);
    StartBmFace(1, gCharacterData[proc->pCharacterEnding->pidB - 1].portraitId, 416, 48, 0x502);
}

void PairedEndingBattleDisp_Loop_SlideIn(struct EndingBattleDisplayProc * proc)
{
    int xBase = 30;

    int xOffset = gCharEndingSlideOffsetLut[proc->timer];
    proc->timer++;

    xBase -= xOffset;

    SetFacePosition(0, (xBase * 8 + 64) & 0x1FF, 48);
    SetFacePosition(1, (xBase * 8 + 176) & 0x1FF, 48);

    sub_080B8160(xBase, 0);

    if (xOffset == 30)
        Proc_Break(proc);
}

void PairedEndingBattleDisp_InitBlend(struct EndingBattleDisplayProc * proc)
{
    proc->timer = 0;

    SetBlendAlpha(0x10, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 0, 0);
}

void PairedEndingBattleDisp_Loop_Blend(struct EndingBattleDisplayProc * proc)
{
    int bldAmt = proc->timer >> 2;

    proc->timer++;

    SetBlendAlpha(0x10 - bldAmt, bldAmt);

    if (bldAmt == 8)
        Proc_Break(proc);
}

void StartPairedEndingBattleDisplay(struct CharacterEndingEnt const * ent, struct Unit * unitA, struct Unit * unitB, ProcPtr parent)
{
    struct EndingBattleDisplayProc * proc = Proc_StartBlocking(gProcScr_EndingBattleDisplay_Paired, parent);

    proc->units[0] = unitA;
    proc->units[1] = unitB;

    proc->pCharacterEnding = ent;
}

void EndingBattleInitText(struct EndingBattleTextProc * proc)
{
    int i;

    proc->text = gpCharacterEndingTexts;

    proc->defaultPauseDelay = 4;
    proc->pauseTimer = 4;

    Text_SetCursor(proc->text, 0);
    Text_SetColor(proc->text, 0);

    for (i = 0; i < 5; i++)
    {
        int y = TM_OFFSET(0, 6 + i * 2);

        ClearText(gpCharacterEndingTexts + i);
        PutText(gpCharacterEndingTexts + i, gBg0Tm + 2 + y);
    }

    EnableBgSync(BG0_SYNC_BIT);

    switch (proc->pCharacterEnding->type)
    {
    case 5:
    {
        i = GetGameOverallRank();

        if (i > 3)
            proc->str = DecodeMsg(0x1075);
        else if (i > 1)
            proc->str = DecodeMsg(0x1077);
        else
            proc->str = DecodeMsg(0x1079);

        break;
    }

    case 3:
        proc->str = DecodeMsg(proc->pCharacterEnding->msg);
        break;

    case 4:
        if ((proc->unitA->state & US_DEAD) || (proc->unitB->state & US_DEAD))
            proc->str = GetPidDefeatedEndingString(proc->unitA->pCharacterData->number);
        else
            proc->str = DecodeMsg(proc->pCharacterEnding->msg);

        break;

    default:
        if (proc->unitA->state & US_DEAD)
        {
            proc->str = GetPidDefeatedEndingString(proc->unitA->pCharacterData->number);

            if (proc->str != NULL)
                return;
        }

        proc->str = DecodeMsg(proc->pCharacterEnding->msg);
        break;
    }
}

void EndingBattleText_Loop(struct EndingBattleTextProc * proc)
{
    if ((gpKeySt->pressed & START_BUTTON) && IsGamePlayedThrough())
    {
        Proc_Break(proc);
        Proc_Goto(proc->proc_parent, 100);
        return;
    }

    if (proc->pauseTimer != 0)
    {
        proc->pauseTimer--;
        return;
    }

    SetTextFont(NULL);

    switch (*proc->str)
    {
    case 0:
        Proc_Break(proc);
        break;

    case 1:
        proc->str++;
        proc->text++;
        proc->pauseTimer += 16;

        Text_SetCursor(proc->text, 0);
        Text_SetColor(proc->text, 0);

        break;

    case 4:
        proc->pauseTimer = 8;
        proc->str++;
        break;

    case 5:
        proc->pauseTimer = 16;
        proc->str++;
        break;

    case 6:
        proc->pauseTimer = 32;
        proc->str++;
        break;

    case 7:
        proc->pauseTimer = 64;
        proc->str++;
        break;

    case 2:
    case 3:
    default:
        proc->str = Text_DrawCharacter(proc->text, proc->str);
    }

    proc->pauseTimer = proc->defaultPauseDelay;
}

void StartEndingBattleText(struct CharacterEndingEnt const * ent, struct Unit * unitA, struct Unit * unitB, ProcPtr parent)
{
    struct EndingBattleTextProc * proc = Proc_StartBlocking(gProcScr_EndingBattleDisplay_Text, parent);

    proc->pCharacterEnding = ent;
    proc->unitA = unitA;
    proc->unitB = unitB;
}

void EndEndingBattleText(void)
{
    Proc_EndEach(gProcScr_EndingBattleDisplay_Text);
}

void DrawFinImage(void)
{
    ApplyPalette(Pal_FinScreen, 14);
    Decompress(Img_FinScreen, (void *) (VRAM + 0x1000));
    TmApplyTsa_thm(gBg2Tm, Tsa_FinScreen, 0xE080);
    EnableBgSync(BG2_SYNC_BIT);
}

void Fin_Init(struct FinScreenProc * proc)
{
    proc->blendTimer = 0;
    proc->timer = 0;

    InitBgs(NULL);

    if (CheckFlag(0x86))
    {
        PutCgBackground(gBg3Tm, 0x8000, 1, 7, 0x3F);
        EnableBgSync(BG3_SYNC_BIT);
        Proc_Goto(proc, 1);
    }
    else
    {
        DrawFinImage();
    }

    SetBlendNone();
}

void Fin_Loop_KeyListener(struct FinScreenProc * proc)
{
    proc->timer++;

    if (gpKeySt->pressed & (A_BUTTON | START_BUTTON))
    {
        Proc_Break(proc);
    }
    else if (gpKeySt->held & SELECT_BUTTON)
    {
        proc->blendTimer++;

        if (proc->blendTimer >= 0x78)
            Proc_Goto(proc, 2);
    }
    else
    {
        proc->blendTimer = 0;
    }
}

void Fin_InitBlend(struct FinScreenProc * proc)
{
    SetBlendAlpha(0, 0x10);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    proc->blendTimer = 0;

    DrawFinImage();
}

void Fin_LoopBlend(struct FinScreenProc * proc)
{
    int blendAmt = proc->blendTimer++ >> 2;

    SetBlendAlpha(blendAmt, 0x10);

    if (blendAmt == 16)
    {
        Proc_Break(proc);
        proc->blendTimer = 0;
    }
}

void Fin_End(void)
{
    SetBlendDarken(0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
}

void StartFinScreen(ProcPtr parent)
{
    Proc_StartBlocking(gProcScr_FinScreen, parent);
}

void EndingFog_Init(struct EndingTurnRecordProc * proc)
{
    SetDispEnable(1, 1, 0, 1, 1);

    ApplyPalette(Pal_ChapterIntroFog, 5);

    Decompress(Img_ChapterIntroFog, (void *) (VRAM + 0x4000));
    PutCompressedTsa(gBg2Tm, Tsa_QuintessenceFx, 0x5200);

    EnableBgSync(BG2_SYNC_BIT);

    proc->unk_4c = 0;
}

void EndingFog_Loop(struct EndingTurnRecordProc * proc)
{
    int x;
    int y;

    proc->unk_4c++;

    y = proc->unk_4c;
    x = y * 3;

    SetBgOffset(2, x / 8, y / 4);
}

void TurnRecord_Init(struct EndingTurnRecordProc * proc)
{
    proc->yPos = 0;
    proc->yScrollAmt = 32;
    proc->displayId = 0;
    proc->chapterId = 0;
    proc->chapterStatsIdx = GetNextChapterStatsSlot();

    SetDispEnable(0, 0, 0, 0, 0);

    SetOnHBlankA(NULL);
    InitBgs(NULL);

    SetDispEnable(0, 0, 0, 0, 0);

    SetBlendNone();
    ResetText();

    SetWinEnable(0, 0, 0);

    ApplyPalettes(Pal_TurnRecordBg, 14, 2);
    Decompress(Img_TitleBg, (void *) (VRAM + 0x8000));
    TmApplyTsa_thm(gBg3Tm, Tsa_TurnRecordBg, 0xE000);

    EnableBgSync(BG3_SYNC_BIT);
}

void TurnRecord_SetupText(void)
{
    int i;

    SetBgOffset(1, 0, -136);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 24, 240, 136);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);

    for (i = 0; i < 9; i++)
    {
        InitText(gpTurnRecordTexts + 0 + i, 5);
        InitText(gpTurnRecordTexts + 9 + i, 14);
    }

    InitText(gpTurnRecordTexts + 18, 3);
    InitText(gpTurnRecordTexts + 19, 2);

    Text_DrawString(gpTurnRecordTexts + 18, DecodeMsg(0x118A));

    Text_SetColor(gpTurnRecordTexts + 19, 3);
    Text_DrawString(gpTurnRecordTexts + 19, DecodeMsg(0x1185));
}

// Two switches on chapterIndex (as in FE8U) give the original compare tree.
int HandleTurnRecordText(struct ChapterStats * chapterStats, int displayId)
{
    int r6;
    int y;
    int chapterTurn;
    int textIndex;

    int x = 3;
    int chapterIncrement = 0;

    textIndex = displayId % 9;
    y = (displayId * 2) & 0x1f;
    r6 = y * 0x20;

    TmFillRect_thm(gBg1Tm + TM_OFFSET(0, y), 31, 1, 0);
    EnableBgSync(BG1_SYNC_BIT);

    ClearText(gpTurnRecordTexts + 0 + textIndex);
    ClearText(gpTurnRecordTexts + 9 + textIndex);

    if ((uintptr_t) chapterStats == (uintptr_t) -1)
    {
        int gameTotalTurns = GetGameTotalTurnCount();

        PutDrawText(gpTurnRecordTexts + 9 + textIndex, gBg1Tm + ({r6 + 0x10;}), 3, 0, chapterIncrement, DecodeMsg(0x12D1));
        PutNumber(gBg1Tm + ({r6 + 0x17;}), 2, gameTotalTurns);
        PutText(gpTurnRecordTexts + 18, gBg1Tm + ({r6 + 0x18;}));

        return 0;
    }

    if (chapterStats)
    {
        int chapterIndex = chapterStats->chapter_index;
        int num = GetChapterInfo(chapterIndex)->prepScreenNumber[gPlaySt.chapterModeIndex == 3 ? 1 : 0] >> 1;
        int digits;

        switch (chapterIndex)
        {
        case 0:
            PutDrawText(gpTurnRecordTexts + textIndex, gBg1Tm + TM_OFFSET(x, y), 3, 0, chapterIncrement, DecodeMsg(0x1187));
            break;

        case 0x2E:
        case 0x2F:
            PutDrawText(gpTurnRecordTexts + textIndex, gBg1Tm + TM_OFFSET(x, y), 3, 0, chapterIncrement, DecodeMsg(0x1186));
            break;

        default:
            PutText(gpTurnRecordTexts + 19, gBg1Tm + TM_OFFSET(x, y));

            digits = 0;

            if (num > 9)
                digits = 1;

            PutNumber(gBg1Tm + TM_OFFSET(digits + (2 + x), y), 2, num);

            if (chapterIndex == 0x19)
                PutDrawText(gpTurnRecordTexts + textIndex, gBg1Tm + TM_OFFSET(digits + (3 + x), y), 2, 0, 0, DecodeMsg(0x1189));
            else if (GetChapterInfo(chapterIndex)->prepScreenNumber[gPlaySt.chapterModeIndex == 3 ? 1 : 0] & 1)
                PutDrawText(gpTurnRecordTexts + textIndex, gBg1Tm + TM_OFFSET(digits + (3 + x), y), 2, 0, 0, DecodeMsg(0x1188));
            break;
        }

        switch (chapterIndex)
        {
        case 0x2E:
        case 0x2F:
            chapterTurn = chapterStats->chapter_turn;
            ++chapterStats;
            chapterTurn += chapterStats->chapter_turn;
            chapterIncrement = 1;
            break;

        default:
            chapterTurn = chapterStats->chapter_turn;
            break;
        }

        if (chapterIndex == 0x19)
            PutDrawText(gpTurnRecordTexts + 9 + textIndex, gBg1Tm + TM_OFFSET(8 + x, y), 0, 0, 0, DecodeMsg(GetChapterInfo(0x19)->unk74[gPlaySt.chapterModeIndex == 3 ? 1 : 0]));
        else
            PutDrawText(gpTurnRecordTexts + 9 + textIndex, gBg1Tm + TM_OFFSET(5 + x, y), 0, 0, 0, DecodeMsg(GetChapterInfo(chapterIndex)->unk74[gPlaySt.chapterModeIndex == 3 ? 1 : 0]));

        PutNumber(gBg1Tm + TM_OFFSET(20 + x, y), 2, chapterTurn);
        PutText(gpTurnRecordTexts + 18, gBg1Tm + TM_OFFSET(21 + x, y));
    }

    return chapterIncrement;
}
void TurnRecord_Loop_Main(struct EndingTurnRecordProc * proc)
{
    int y = proc->yPos >> 6;

    SetBgOffset(1, 0, y - 136);

    if ((y & 15) == 0)
    {
        if (proc->displayId == (y / 16))
        {
            if (proc->chapterId >= proc->chapterStatsIdx)
            {
                int unk = proc->chapterId - proc->chapterStatsIdx;

                if (unk == 1)
                    HandleTurnRecordText((void *) -1, proc->displayId);
                else if (unk >= 3)
                    Proc_Break(proc);
                else
                    HandleTurnRecordText(NULL, proc->displayId);
            }
            else
            {
                proc->chapterId += HandleTurnRecordText(GetChapterStats(proc->chapterId), proc->displayId);
            }

            proc->chapterId++;
            proc->displayId++;
        }
    }

    if (gpKeySt->held & A_BUTTON)
        proc->yPos += proc->yScrollAmt;

    proc->yPos += proc->yScrollAmt;
}

void PlayerRank_PutSprites(struct PlayerRankProc * proc)
{
    int i;

    PutSpriteExt(2, 24, 20, Sprite_PlayerRank_08CEEA70, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(9));
    PutSpriteExt(2, 16, 128, Sprite_PlayerRank_08CEEAE4, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(6));

    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
    {
        PutSpriteExt(2, 16, 56, Sprite_PlayerRank_08CEEA90, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 128, 56, Sprite_PlayerRank_08CEEA9E, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 16, 88, Sprite_PlayerRank_08CEEABA, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 128, 88, Sprite_PlayerRank_08CEEAD6, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(7));

        for (i = 0; i < 3; i++)
        {
            if (proc->scales[i] > 0x10)
            {
                SetObjAffine(
                    i,
                    Div(+COS_Q12(0) * 16, proc->scales[i]),
                    Div(-SIN_Q12(0) * 16, 0x100),
                    Div(+SIN_Q12(0) * 16, proc->scales[i]),
                    Div(+COS_Q12(0) * 16, 0x100));

                PutSpriteExt(
                    2,
                    (i & 1) * 112 + 80 + i * 512,
                    (i >> 1) * 32 + 304,
                    SpriteLut_PlayerRank_08CEEB54[proc->counts[i]],
                    OAM2_PAL(i + 10) + OAM2_CHR(0x80) + OAM2_LAYER(1));
            }
        }

        if (proc->scales[i] > 0x10)
        {
            SetObjAffine(
                i,
                Div(+COS_Q12(0) * 16, proc->scales[i]),
                Div(-SIN_Q12(0) * 16, 0x100),
                Div(+SIN_Q12(0) * 16, proc->scales[i]),
                Div(+COS_Q12(0) * 16, 0x100));

            PutSpriteExt(
                2,
                (i & 1) * 112 + 80 + i * 512,
                (i >> 1) * 32 + 304,
                SpriteLut_PlayerRank_08CEEB6C[proc->counts[i]],
                OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(15));
        }
    }
    else
    {
        PutSpriteExt(2, 16, 48, Sprite_PlayerRank_08CEEA90, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 128, 48, Sprite_PlayerRank_08CEEA9E, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 16, 72, Sprite_PlayerRank_08CEEAC8, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 128, 72, Sprite_PlayerRank_08CEEAAC, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 16, 96, Sprite_PlayerRank_08CEEABA, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 128, 96, Sprite_PlayerRank_08CEEAD6, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(7));

        for (i = 0; i < 5; i++)
        {
            if (proc->scales[i] > 0x10)
            {
                SetObjAffine(
                    i,
                    Div(+COS_Q12(0) * 16, proc->scales[i]),
                    Div(-SIN_Q12(0) * 16, 0x100),
                    Div(+SIN_Q12(0) * 16, proc->scales[i]),
                    Div(+COS_Q12(0) * 16, 0x100));

                PutSpriteExt(
                    2,
                    (i & 1) * 112 + 80 + i * 512,
                    (i >> 1) * 24 + 296,
                    SpriteLut_PlayerRank_08CEEB54[proc->counts[i]],
                    OAM2_PAL(i + 10) + OAM2_CHR(0x80) + OAM2_LAYER(1));
            }
        }

        if (proc->scales[i] > 0x10)
        {
            SetObjAffine(
                i,
                Div(+COS_Q12(0) * 16, proc->scales[i]),
                Div(-SIN_Q12(0) * 16, 0x100),
                Div(+SIN_Q12(0) * 16, proc->scales[i]),
                Div(+COS_Q12(0) * 16, 0x100));

            PutSpriteExt(
                2,
                (i & 1) * 112 + 80 + (i * 512),
                (i >> 1) * 24 + 296,
                SpriteLut_PlayerRank_08CEEB6C[proc->counts[i]],
                OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(15));
        }
    }
}
void PlayerRank_Init(struct PlayerRankProc * proc)
{
    u16 hours, minutes, seconds;
    u16 i;
    u16 * tm;

    proc->timer = 0;
    proc->idx = 0;

    UnpackUiWindowFrameGraphics();

    TmApplyTsa_thm(gBg1Tm, Tsa_PlayerRankBg, 0x1000);
    ApplyPaletteExt(Pal_PlayerRankBg, 0x300, 0x40);
    Decompress(Img_PlayerRankLetters, (void *) 0x06011000);

    for (i = 0; i < 5; i++)
        ApplyPaletteExt(Pal_PlayerRankLetters, (i + 0x1A) * 0x20, 0x20);

    ApplyPaletteExt(Pal_PlayerRankUnk_085DFAF0, 0x3E0, 0x20);
    ApplyPaletteExt(Pal_PlayerRankUnk_085DFA90, 0x2C0, 0x20);
    ApplyPaletteExt(Pal_PlayerRankUnk_085DFAB0, 0x2E0, 0x20);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    if (gPlaySt.chapterStateBits & 0x80)
    {
        FormatTime(GetGameTime() - gPlaySt.time_chapter_started, &hours, &minutes, &seconds);

        proc->ranks[0] = GetChapterTacticsRank();
        proc->ranks[1] = GetChapterSurvivalRank();
        proc->ranks[2] = GetChapterCombatRank();
        proc->ranks[3] = sub_080B663C(proc->ranks[0], proc->ranks[1], proc->ranks[2]);

        StartBgm(0x29, NULL);
    }
    else
    {
        FormatTime(GetGameTotalTime_unused(), &hours, &minutes, &seconds);

        proc->ranks[0] = GetGameTacticsRank();
        proc->ranks[1] = GetGameSurvivalRank();
        proc->ranks[2] = GetGameFundsRank();
        proc->ranks[3] = GetGameExpRank();
        proc->ranks[4] = GetGameCombatRank();
        proc->ranks[5] = GetOverallRank(proc->ranks[0], proc->ranks[1], proc->ranks[2], proc->ranks[3], proc->ranks[4]);

        StartBgm(0x29, NULL);
    }

    tm = gBg0Tm + TM_OFFSET(0, 17);

    PutNumber(tm + 5, 2, hours);
    PutSpecialChar(tm + 6, 2, 0x20);
    PutNumber2Digit(tm + 8, 2, minutes);
    PutSpecialChar(tm + 9, 2, 0x20);
    PutNumber2Digit(tm + 11, 2, seconds);

    for (i = 0; i < 6; i++)
    {
        proc->scales[i] = 0;
        proc->unk_46[i] = 1;
        proc->counts[i] = 0;
    }

    StartParallelWorker(PlayerRank_PutSprites, proc);
    StartMixPalette(Pal_PlayerRankUnk_085DFAB0, Pal_PlayerRankUnk_085DFAB0 + 0x10, 2, 0x17, 1, proc);
}
void PlayerRank_StartScreen(ProcPtr parent)
{
    SetBlendAlpha(8, 0x10);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);
    SetDispEnable(1, 1, 1, 1, 1);

    Proc_Start(ProcScr_PlayerRankUnk_08CEEB84, parent);
}

void PlayerRankFlash_FadeIn(struct PlayerRankFlashProc * proc)
{
    ArchivePalette(proc->pal + 0x10);
    sub_080139D8(0x100, 0x100, 0x100, 0x200, 0x200, 0x200, 1 << (proc->pal + 0x10), 0x10, proc);
}

void PlayerRankFlash_FadeOut(struct PlayerRankFlashProc * proc)
{
    sub_080139D8(0x200, 0x200, 0x200, 0x100, 0x100, 0x100, 1 << (proc->pal + 0x10), 0x10, proc);
}

void StartPlayerRankFlash(int pal, ProcPtr parent)
{
    struct PlayerRankFlashProc * proc = Proc_Start(ProcScr_PlayerRankFlash, parent);
    proc->pal = pal;
}

void PlayerRank_LoopLetters(struct PlayerRankProc * proc)
{
    proc->timer += 0x20;

    proc->scales[proc->idx] = proc->timer % 0x200 > 0xFF ? 0x100 - proc->timer % 0x100 : proc->timer % 0x100;

    if (proc->scales[proc->idx] == 0)
        proc->counts[proc->idx]++;

    if (proc->counts[proc->idx] == proc->ranks[proc->idx] && proc->scales[proc->idx] == 0x100)
    {
        proc->timer = 0;

        if ((gPlaySt.chapterStateBits & 0x80) && proc->idx == 3)
            StartPlayerRankFlash(0xF, proc);
        else
            StartPlayerRankFlash(proc->idx + 10, proc);

        proc->idx++;

        PlaySoundEffect(0x85);

        Proc_Break(proc);
    }
}

void PlayerRank_WaitForKey(ProcPtr proc)
{
    if (gpKeySt->pressed & (A_BUTTON | B_BUTTON | START_BUTTON))
    {
        FadeBgmOut(-1);
        Proc_Break(proc);
    }
}

void PlayerRank_FadeBgm(void)
{
    FadeBgmOut(3);
}

void PlayerRank_CheckMode(ProcPtr proc)
{
    if (gPlaySt.chapterStateBits & 0x80)
        Proc_Goto(proc, 1);
    else
        Proc_Goto(proc, 0);
}

void StartPlayerRankScreen(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_PlayerRankScreen, parent);
}

void StartEndingCgScroll(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_EndingCgScroll, parent);
}

void EndingCgScroll_Init(struct EndingCgScrollProc * proc)
{
    int i;

    proc->yPos = 0;
    proc->speed = 0x18;
    proc->lastY = 0;
    proc->lut = gEndingCgScrollLut;
    proc->imgIdx = 0;
    proc->tsaIdx = 0;
    proc->bank = 0;

    SetOnHBlankA(NULL);
    InitBgs(NULL);
    ResetText();

    SetDispEnable(0, 0, 0, 0, 0);
    SetBlendNone();

    ApplyPalette(Pal_EndingCgScroll, 10);

    for (i = 0; i < 7; i++)
    {
        if (proc->lut->img[i] != NULL)
            Decompress(proc->lut->img[i], (void *) (VRAM + 0x8000 + proc->bank * 0x3800 + i * 0x800));
    }

    proc->imgIdx = 8;

    SetBgOffset(3, 0, 0x60);
    StartBgm(0x2A, 0);

    SetBlendAlpha(0x10, 0);
    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    gDispIo.blend_ct.target1_enable_bd = 1;
    gDispIo.blend_ct.target2_enable_bd = 1;

    EndingCgScroll_InitBlendTable();
    SetOnHBlankA(EndingCgScroll_HBlank);
}

void EndingCgScroll_Loop(struct EndingCgScrollProc * proc)
{
    int row = (proc->lastY >> 3) & 0x1F;

    proc->lastY = proc->yPos >> 6;

    if (proc->lastY >= 0x720)
    {
        SetBgOffset(3, 0, 0x80);
        Proc_Break(proc);
        return;
    }

    SetBgOffset(3, 0, (proc->lastY - 0xA0) & 0xFF);

    if (proc->imgIdx < 7)
    {
        void const * img = proc->lut->img[proc->imgIdx];
        void * dst = (void *) (VRAM + 0x8000 + proc->bank * 0x3800 + proc->imgIdx * 0x800);

        if (img != NULL)
            Decompress(img, dst);
        else
            CpuFastFill(0, dst, 0x800);

        proc->imgIdx++;
    }

    if ((row & 7) == 0)
    {
        u8 const * tsa = proc->lut->tsa[proc->tsaIdx];

        if (proc->tsaIdx == (row / 8))
        {
            if (tsa == NULL)
                return;

            {
                u16 tileref = proc->bank * 0x1C0 + 0xA000;
                TmApplyTsa_thm(gBg3Tm + row * 0x20, tsa, tileref);
            }

            EnableBgSync(BG3_SYNC_BIT);

            if (++proc->tsaIdx == 4)
            {
                proc->tsaIdx = 0;
                proc->imgIdx = 0;
                proc->bank = 1 - proc->bank;
                proc->lut++;
            }
        }
    }

    if (gpKeySt->pressed & START_BUTTON)
    {
        if (IsGamePlayedThrough())
            Proc_Goto(proc, 0);

        return;
    }

    proc->yPos += proc->speed;
}

void EndingCgScroll2_Init(struct EndingCgScrollProc * proc)
{
    int i;

    proc->lut = gEndingCgScroll2Lut;
    proc->bank = 0;

    ApplyPalette(Pal_EndingCgScroll, 10);
    SetBgOffset(3, 0, 0x80);
    TmFill(gBg3Tm, 0);

    for (i = 0; i < 6; i++)
    {
        if (proc->lut->img[i] != NULL)
            Decompress(proc->lut->img[i], (void *) (VRAM + 0x8000 + proc->bank * 0x3800 + i * 0x800));
    }

    for (i = 1; i < 4; i++)
    {
        if (proc->lut->tsa[i] != NULL)
        {
            u16 tileref = proc->bank * 0x1C0 + 0xA000;
            TmApplyTsa_thm(gBg3Tm + i * 0x100, proc->lut->tsa[i], tileref);
        }
    }

    EnableBgSync(BG3_SYNC_BIT);
}

void EndingCgScroll_End(void)
{
    SetOnHBlankA(NULL);
    SetBlendDarken(0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
}

void StartEndingCgScroll2(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_EndingCgScroll2, parent);
}

void EndingCgScroll_InitBlendTable(void)
{
    int i;

    for (i = 0; i <= 0xA0; i++)
    {
        gpEndingCgScrollBlendTable[i] = 0x10;

        if (i < 0x10)
            gpEndingCgScrollBlendTable[i] = i;

        if (i > 0x90)
            gpEndingCgScrollBlendTable[i] = 0xA0 - i;
    }
}

void EndingCgScroll_HBlank(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > 0xA0)
        vcount = 0;

    REG_BLDALPHA = gpEndingCgScrollBlendTable[vcount];
}


SECTION(".rodata.08CEE86C")
const struct ProcCmd gProcScr_CharacterEndings[] = {
    PROC_SLEEP(0),
    PROC_CALL(CharacterEnding_Init),
    PROC_CALL(LoadNextCharacterEnding),
    PROC_LABEL(0),
    PROC_CALL(CharacterEnding_80B69D4),
    PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),
    PROC_CALL(CharacterEnding_StartBattleDisplay),
    PROC_SLEEP(30),
    PROC_CALL(CharacterEnding_StartBattleDisplayText),
    PROC_SLEEP(114),
    PROC_LABEL(99),
    PROC_CALL(LoadNextCharacterEnding),
    PROC_CALL_ARG(NewFadeOut, 4),
    PROC_WHILE(FadeOutExists),
    PROC_GOTO(0),
    PROC_LABEL(100),
    PROC_CALL(CharacterEnding_FadeBgm),
    PROC_CALL_ARG(NewFadeOut, 2),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(CharacterEnding_End),
    PROC_END,
};

SECTION(".rodata.08CEE930")
const struct ProcCmd gProcScr_EndingBattleDisplay_Solo[] = {
    PROC_SLEEP(0),
    PROC_CALL(SoloEndingBattleDisp_Init),
    PROC_REPEAT(SoloEndingBattleDisp_Loop),
    PROC_END,
};

SECTION(".rodata.08CEE950")
const struct ProcCmd gProcScr_EndingBattleDisplay_Paired[] = {
    PROC_SLEEP(0),
    PROC_CALL(PairedEndingBattleDisp_Init),
    PROC_REPEAT(PairedEndingBattleDisp_Loop_SlideIn),
    PROC_SLEEP(16),
    PROC_CALL(PairedEndingBattleDisp_InitBlend),
    PROC_REPEAT(PairedEndingBattleDisp_Loop_Blend),
    PROC_END,
};

SECTION(".rodata.08CEE988")
const struct ProcCmd gProcScr_EndingBattleDisplay_Text[] = {
    PROC_SLEEP(0),
    PROC_CALL(EndingBattleInitText),
    PROC_REPEAT(EndingBattleText_Loop),
    PROC_END,
};

SECTION(".rodata.08CEE9A8")
const struct ProcCmd gProcScr_FinScreen[] = {
    PROC_SLEEP(30),
    PROC_CALL(Fin_Init),
    PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),
    PROC_LABEL(0),
    PROC_REPEAT(Fin_Loop_KeyListener),
    PROC_CALL_ARG(NewFadeOut, 4),
    PROC_WHILE(FadeOutExists),
    PROC_GOTO(100),
    PROC_LABEL(1),
    PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),
    PROC_SLEEP(60),
    PROC_CALL(Fin_InitBlend),
    PROC_REPEAT(Fin_LoopBlend),
    PROC_GOTO(0),
    PROC_LABEL(2),
    PROC_CALL_ARG(NewFadeOut, 4),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(StartPlayerRankScreen),
    PROC_SLEEP(0),
    PROC_GOTO(100),
    PROC_LABEL(100),
    PROC_CALL(Fin_End),
    PROC_END,
};

SECTION(".rodata.08CEEB84")
const struct ProcCmd ProcScr_PlayerRankUnk_08CEEB84[] = {
    PROC_SLEEP(0),
    PROC_CALL(EndingFog_Init),
    PROC_REPEAT(EndingFog_Loop),
    PROC_END,
};

SECTION(".rodata.08CEEBA8")
const struct ProcCmd ProcScr_PlayerRankFlash[] = {
    PROC_SLEEP(0),
    PROC_CALL(PlayerRankFlash_FadeIn),
    PROC_WHILE(sub_08013A1C),
    PROC_CALL(PlayerRankFlash_FadeOut),
    PROC_WHILE(sub_08013A1C),
    PROC_END,
};

SECTION(".rodata.08CEEBD8")
const struct ProcCmd ProcScr_PlayerRankScreen[] = {
    PROC_SLEEP(0),
    PROC_CALL(TurnRecord_Init),
    PROC_CALL(PlayerRank_Init),
    PROC_CALL(PlayerRank_StartScreen),
    PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),
    PROC_CALL(PlayerRank_CheckMode),
    PROC_LABEL(0),
    PROC_REPEAT(PlayerRank_LoopLetters),
    PROC_SLEEP(16),
    PROC_REPEAT(PlayerRank_LoopLetters),
    PROC_SLEEP(16),
    PROC_REPEAT(PlayerRank_LoopLetters),
    PROC_SLEEP(16),
    PROC_REPEAT(PlayerRank_LoopLetters),
    PROC_SLEEP(16),
    PROC_REPEAT(PlayerRank_LoopLetters),
    PROC_SLEEP(32),
    PROC_REPEAT(PlayerRank_LoopLetters),
    PROC_GOTO(100),
    PROC_LABEL(1),
    PROC_REPEAT(PlayerRank_LoopLetters),
    PROC_SLEEP(16),
    PROC_REPEAT(PlayerRank_LoopLetters),
    PROC_SLEEP(16),
    PROC_REPEAT(PlayerRank_LoopLetters),
    PROC_SLEEP(32),
    PROC_REPEAT(PlayerRank_LoopLetters),
    PROC_GOTO(100),
    PROC_LABEL(100),
    PROC_SLEEP(32),
    PROC_REPEAT(PlayerRank_WaitForKey),
    PROC_CALL(PlayerRank_FadeBgm),
    PROC_CALL_ARG(NewFadeOut, 4),
    PROC_WHILE(FadeOutExists),
    PROC_SLEEP(30),
    PROC_END,
};

SECTION(".rodata.08CEED00")
const struct ProcCmd ProcScr_EndingCgScroll[] = {
    PROC_SLEEP(0),
    PROC_CALL(TurnRecord_Init),
    PROC_CALL(TurnRecord_SetupText),
    PROC_CALL(PlayerRank_StartScreen),
    PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),
    PROC_REPEAT(TurnRecord_Loop_Main),
    PROC_SLEEP(120),
    PROC_CALL_ARG(NewFadeOut, 4),
    PROC_WHILE(FadeOutExists),
    PROC_SLEEP(60),
    PROC_END,
};

SECTION(".rodata.08CEEEC0")
const struct ProcCmd ProcScr_EndingCgScroll2[] = {
    PROC_SLEEP(0),
    PROC_CALL(EndingCgScroll_Init),
    PROC_CALL(EnableAllGfx),
    PROC_REPEAT(EndingCgScroll_Loop),
    PROC_SLEEP(300),
    PROC_GOTO(100),
    PROC_LABEL(0),
    PROC_CALL(DisableAllGfx),
    PROC_SLEEP(0),
    PROC_CALL(EndingCgScroll2_Init),
    PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),
    PROC_SLEEP(300),
    PROC_GOTO(100),
    PROC_LABEL(100),
    PROC_CALL_ARG(NewFadeOut, 4),
    PROC_WHILE(FadeOutExists),
    PROC_SLEEP(30),
    PROC_CALL(EndingCgScroll_End),
    PROC_SLEEP(60),
    PROC_END,
};
