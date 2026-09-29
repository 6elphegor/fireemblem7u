#include "gbafe.h"

extern const u8 gUnk_08CE5840[];
extern const u8 gUnk_08CE584C[];
extern const u8 gUnk_08CE5858[];

struct Selector
{
    /* 00 */ u16 helpTextId;
    /* 02 */ u16 optionTextId;
    /* 04 */ u8 xPos;
    /* 05 */ u8 unk_05;
    STRUCT_PAD(0x06, 0x08);
};

struct GameOption
{
    /* 00 */ u16 msgId;
    /* 04 */ struct Selector selectors[4];
    /* 24 */ u8 icon;
    /* 28 */ bool (* func)(ProcPtr);
};
GBA_SIZE_CHECK(struct GameOption, 0x2C);

struct GameOptionLayout
{
    /* 00 */ u8 count;
    /* 04 */ u8 const * order;
};
GBA_SIZE_CHECK(struct GameOptionLayout, 0x8);

struct ConfigScreen
{
    /* 00 */ STRUCT_PAD(0x00, 0x2A);
    /* 2A */ s16 selectedOptionIdx;
    /* 2C */ s16 headOptionIdx;
    /* 2E */ u16 bg1YOffset;
    /* 30 */ STRUCT_PAD(0x30, 0x32);
    /* 32 */ s16 unk_32;
    /* 34 */ s16 maxOption;
    /* 36 */ STRUCT_PAD(0x36, 0x37);
    /* 37 */ s8 source;
    /* 38 */ struct Text optionTexts[6];
    /* 68 */ struct Text text_68;
    /* 70 */ struct Text valueTexts[6];
    /* A0 */ struct Text text_a0;
    /* A8 */ struct Text optionHelpText;
};

struct ConfigProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2E);
    /* 2E */ u16 bgYOffset;
    /* 30 */ s16 moving;
    /* 32 */ STRUCT_PAD(0x32, 0x36);
    /* 36 */ u8 loadSoloAnimScreen;
    /* 37 */ u8 unk_37;
};

extern struct ConfigScreen * CONST_DATA gConfigUiState;
extern const struct GameOptionLayout gGameOptionLayouts[];
extern const struct GameOption gGameOptions[];
extern u16 CONST_DATA gUnk_08CE58BE[];
extern u16 CONST_DATA gSprite_ConfigurationUiHeader[];
extern const struct ProcCmd gProcScr_RedrawConfigHelpText[];

extern const struct ProcCmd gProcScr_DrawConfigUiSprites[];
extern u16 const gUnk_0841E338[];
extern u8 const gUnk_0841DA40[];
extern u8 const gUnk_0841DCA4[];
extern u8 const gUnk_0841DC90[];
extern u8 const gUnk_0841E180[];
extern u8 const gUnk_0841E204[];

extern s16 gUnk_020144F4;

void StartUnitListScreenForSoloAnim(ProcPtr parent);

void DisplayUiVArrow(int x, int y, u16 oam2, int flip);
void UnpackUiVArrowGfx(int chr, int pal);
u8 GetGameOption(u8 index);
void SetGameOption(u8 index, u8 value);
bool GenericOptionChangeHandler(ProcPtr proc);

s16 GetOptionMenuLayoutId(void)
{
    s16 * ptr = &gUnk_020144F4;
    int unk = gConfigUiState->unk_32;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_HARD)
        unk += 3;

    *ptr = unk;
    return *ptr;
}
u8 GetSelectedGameOption(void)
{
    return gConfigUiState->selectedOptionIdx;
}
u8 GetSelectedOptionValue(void)
{
    return GetGameOption(gGameOptionLayouts[GetOptionMenuLayoutId()].order[gConfigUiState->selectedOptionIdx]);
}
void sub_080ADB7C(void)
{
    InitBgs(gUnk_08CE58BE);
}
void StartMuralBackground(ProcPtr parent, void * vram, int pal)
{
    int tileref;
    int i;

    u16 * tm = gBg3Tm;

    if (vram == NULL)
        vram = ((void *) VRAM) + GetBgChrOffset(3);

    if (pal < 0)
        pal = 0xe;

    Decompress(Img_MuralBackground, vram);
    ApplyPalettes(Pal_MuralBackground, pal, 2);

    tileref = ((((uintptr_t) (vram - GetBgChrOffset(3))) / CHR_SIZE) & 0xFFF) + OAM2_PAL(pal);

    for (i = 0; i < 0x280; i++)
        *tm++ = i + tileref;

    tm = gBg3Tm + 0x60;

    for (i = 0; i < 0x1C0; i++)
        *tm++ += 0x1000;

    Proc_Start(ProcScr_BackgroundSlide, parent);
}
void DrawGameOptionIcon(int selectedIdx, int yBase)
{
    int y = 0x20 * ((selectedIdx * 2 + yBase) & 0x1f);

    int icon = gGameOptions[gGameOptionLayouts[GetOptionMenuLayoutId()].order[selectedIdx]].icon;
    int chr = 0x200 + (icon & 0x1f) + ((icon << 1) & 0xFFC0);

    icon = TILEREF(chr, 4);

    gBg2Tm[TM_OFFSET(2, 0) + y] = icon + 0;
    gBg2Tm[TM_OFFSET(3, 0) + y] = icon + 1;
    gBg2Tm[TM_OFFSET(2, 1) + y] = icon + 0x20;
    gBg2Tm[TM_OFFSET(3, 1) + y] = icon + 0x21;
}
void DrawGameOptionHelpText(void)
{
    char const * str;

    ClearText(&gConfigUiState->optionHelpText);

    str = DecodeMsg(
        gGameOptions[gGameOptionLayouts[GetOptionMenuLayoutId()].order[gConfigUiState->selectedOptionIdx]].selectors[GetSelectedOptionValue()].helpTextId);

    PutDrawText(&gConfigUiState->optionHelpText, gBg0Tm + TM_OFFSET(4, 17), TEXT_COLOR_SYSTEM_WHITE, 0, 22, str);
}
void DrawGameOptionText(int selectedIdx, int textIdx, int y)
{
    char const * str;

    ClearText(&gConfigUiState->optionTexts[textIdx]);

    str = DecodeMsg(gGameOptions[gGameOptionLayouts[GetOptionMenuLayoutId()].order[selectedIdx]].msgId);

    PutDrawText(&gConfigUiState->optionTexts[textIdx], gBg2Tm + TM_OFFSET(4, y), TEXT_COLOR_SYSTEM_WHITE, 0, 9, str);
}
void DrawOptionValueTexts(int selectedIdx, int textIdx, int y)
{
    int i;

    int optionIdx = gGameOptionLayouts[GetOptionMenuLayoutId()].order[selectedIdx];

    int x = gGameOptions[optionIdx].selectors[0].xPos / 8;

    ClearText(&gConfigUiState->valueTexts[textIdx]);

    for (i = 0; i < 4; i++)
    {
        if (gGameOptions[optionIdx].selectors[i].optionTextId == 0)
            break;

        Text_InsertDrawString(
            &gConfigUiState->valueTexts[textIdx], gGameOptions[optionIdx].selectors[i].xPos - 120,
            (i == GetGameOption(optionIdx)) ? TEXT_COLOR_0789 : TEXT_COLOR_0456,
            DecodeMsg(gGameOptions[optionIdx].selectors[i].optionTextId));
    }

    PutText(&gConfigUiState->valueTexts[textIdx], gBg2Tm + TM_OFFSET(x, y));
}
void ConfigSprites_Init(void)
{
    ApplyIconPalette(1, 18);
    UnpackUiVArrowGfx(0x80, 3);
}
void DrawConfigUiSprites(void)
{
    int y;

    int optionIdx = gGameOptionLayouts[GetOptionMenuLayoutId()].order[gConfigUiState->selectedOptionIdx];

    u8 time = (GetGameTime() % 16) & 8;

    PutOamHiRam(34, 8, gSprite_ConfigurationUiHeader, OAM2_CHR(0xC0) + OAM2_PAL(2));

    y = (gConfigUiState->selectedOptionIdx - gConfigUiState->headOptionIdx) * 16 + 32;

    DisplayFrozenUiHand(16, y);

    PutUiHand(gGameOptions[optionIdx].selectors[GetGameOption(optionIdx)].xPos - 2, y);

    if (gConfigUiState->maxOption > 6)
    {
        if (gConfigUiState->headOptionIdx != 0)
            DisplayUiVArrow(100, 29, 0x3080, 1);

        if (gConfigUiState->headOptionIdx < gConfigUiState->maxOption - 6)
            DisplayUiVArrow(100, 125, 0x3080, 0);
    }

    if ((GetSelectedGameOption() == 0) && (GetSelectedOptionValue() == 3))
        PutOamHiRam(192, 32, Sprite_16x16, (time != 0) ? OAM2_CHR(0xCE) + OAM2_PAL(2) : OAM2_CHR(0xCC) + OAM2_PAL(2));
}
void Config_Init(struct ConfigProc * proc)
{
    int i;

    i = 0;

    if (gPlaySt.chapterModeIndex != CHAPTER_MODE_LYN)
    {
        i = 1;

        if (gPlaySt.chapterModeIndex != CHAPTER_MODE_ELIWOOD)
            i = 2;
    }

    gConfigUiState->unk_32 = i;
    gConfigUiState->maxOption = gGameOptionLayouts[GetOptionMenuLayoutId()].count;
    gConfigUiState->selectedOptionIdx = 0;
    gConfigUiState->headOptionIdx = 0;

    proc->bgYOffset = 0;
    proc->moving = 0;
    proc->loadSoloAnimScreen = FALSE;
    proc->unk_37 = FALSE;

    UnpackUiWindowFrameGraphics();

    SetDispEnable(1, 1, 1, 1, 1);

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, proc->bgYOffset);
    SetBgOffset(3, 0, 0);

    SetWinEnable(1, 0, 0);

    SetWin0Box(0, 32, 240, 128);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);
    TmFill(gBg3Tm, 0);

    ApplyPalette(gUnk_0841E338, 4);
    ApplyPalette(gUnk_0841E338, 18);

    Decompress(gUnk_0841DA40, (void *) 0x06011800);
    Decompress(gUnk_0841DCA4, (void *) 0x06004000);
    Decompress(gUnk_0841DC90, (void *) 0x06005000 + GetBgChrOffset(2));

    TmApplyTsa(gBg1Tm, gUnk_0841E180, 0x1000);
    TmApplyTsa(gBg1Tm + 0x202, gUnk_0841E204, 0x1000);

    ResetTextFont();

    InitText(&gConfigUiState->optionHelpText, 22);

    DrawGameOptionHelpText();

    InitText(&gConfigUiState->text_68, 9);
    InitText(&gConfigUiState->text_a0, 14);

    for (i = 0; i < 6; i++)
    {
        int y = (i * 2) + 4;

        DrawGameOptionIcon(i, 4);

        InitText(&gConfigUiState->optionTexts[i], 9);
        InitText(&gConfigUiState->valueTexts[i], 14);

        DrawGameOptionText(i, i, y);
        DrawOptionValueTexts(i, i, y);
    }

    StartMuralBackground(proc, NULL, -1);

    Proc_Start(gProcScr_DrawConfigUiSprites, proc);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}
bool WindowColorOptionChangeHandler(ProcPtr proc)
{
    if (GenericOptionChangeHandler(proc) != 0)
        UnpackUiWindowFrameGraphics2(-1);

    return FALSE;
}
bool MusicOptionChangeHandler(struct ConfigProc * proc)
{
    if (GenericOptionChangeHandler(proc) == 0)
        return FALSE;

    if (GetGameOption(gGameOptionLayouts[GetOptionMenuLayoutId()].order[gConfigUiState->selectedOptionIdx]) != 0)
    {
        FadeBgmOut(1);
        return FALSE;
    }

    if (proc->unk_37 != 0)
        StartBgm(0x49, NULL);
    else
        StartMapSongBgm();

    return FALSE;
}
bool GenericOptionChangeHandler(ProcPtr proc)
{
    int valueChanged = FALSE;

    int selectedIdx = gConfigUiState->selectedOptionIdx;
    u8 optionIdx = gGameOptionLayouts[GetOptionMenuLayoutId()].order[selectedIdx];

    u8 selectedValue = GetSelectedOptionValue();

    if (gpKeySt->repeated & (DPAD_LEFT | DPAD_RIGHT))
    {
        if (gpKeySt->repeated & (DPAD_LEFT))
        {
            if (selectedValue != 0)
            {
                selectedValue--;
                SetGameOption(optionIdx, selectedValue);

                valueChanged = TRUE;
            }
        }
        else
        {
            if (gGameOptions[optionIdx].selectors[selectedValue + 1].optionTextId != 0)
            {
                if (selectedValue < 3)
                {
                    selectedValue++;
                    SetGameOption(optionIdx, selectedValue);

                    valueChanged = TRUE;
                }
            }
        }

        if (valueChanged)
        {
            Proc_Start(gProcScr_RedrawConfigHelpText, proc);
            DrawOptionValueTexts(selectedIdx, selectedIdx % 7, selectedIdx * 2 + 4);
            EnableBgSync(BG0_SYNC_BIT | BG2_SYNC_BIT);
            PlaySoundEffect(0x387);
        }
    }

    return valueChanged;
}
u8 GetGameOption(u8 index)
{
    int value = 0;

    switch (index)
    {
    case 0:
        switch (gPlaySt.cfgAnimationType)
        {
        case 0:
            return 0;
        case 3:
            return 1;
        case 1:
            return 2;
        case 2:
            return 3;
        }

        // fallthrough

    case 1:
        value = gPlaySt.cfgDisableTerrainDisplay;
        break;

    case 2:
        value = gPlaySt.cfgUnitDisplayType;
        break;

    case 3:
        value = gPlaySt.cfgAutoCursor;
        break;

    case 4:
        value = gPlaySt.cfgTextSpeed;
        break;

    case 5:
        value = gPlaySt.cfgGameSpeed;
        break;

    case 6:
        value = gPlaySt.cfgDisableBgm;
        break;

    case 7:
        value = gPlaySt.cfgDisableSoundEffects;
        break;

    case 8:
        value = gPlaySt.config_window_theme;
        break;

    case 10:
        value = gPlaySt.cfgBattleForecastType;
        break;

    case 11:
        value = gPlaySt.cfgNoSubtitleHelp;
        break;

    case 12:
        value = gPlaySt.cfgDisableAutoEndTurns;
        break;

    case 13:
        value = gPlaySt.cfgUnitColor;
        break;

    case 14:
        value = gPlaySt.cfgDisableGoalDisplay;
        break;

    case 15:
        value = gPlaySt.cfgController;
        break;
    }

    return value;
}
void SetGameOption(u8 index, u8 newValue)
{
    switch (index)
    {
    case 0:
        switch (newValue)
        {
        case 0:
            gPlaySt.cfgAnimationType = 0;
            return;

        case 1:
            gPlaySt.cfgAnimationType = 3;
            return;

        case 2:
            gPlaySt.cfgAnimationType = 1;
            return;

        case 3:
            gPlaySt.cfgAnimationType = 2;
            return;
        }

        // fallthrough

    case 1:
        gPlaySt.cfgDisableTerrainDisplay = newValue;
        break;

    case 2:
        gPlaySt.cfgUnitDisplayType = newValue;
        break;

    case 3:
        gPlaySt.cfgAutoCursor = newValue;
        break;

    case 4:
        gPlaySt.cfgTextSpeed = newValue;
        break;

    case 5:
        gPlaySt.cfgGameSpeed = newValue;
        break;

    case 6:
        gPlaySt.cfgDisableBgm = newValue;
        break;

    case 7:
        gPlaySt.cfgDisableSoundEffects = newValue;
        break;

    case 8:
        gPlaySt.config_window_theme = newValue;
        break;

    case 10:
        gPlaySt.cfgBattleForecastType = newValue;
        break;

    case 11:
        gPlaySt.cfgNoSubtitleHelp = newValue;
        break;

    case 12:
        gPlaySt.cfgDisableAutoEndTurns = newValue;
        break;

    case 13:
        gPlaySt.cfgUnitColor = newValue;
        break;

    case 14:
        gPlaySt.cfgDisableGoalDisplay = newValue;
        break;

    case 15:
        gPlaySt.cfgController = newValue;
        break;
    }
}
void PutGameOptionRow(ProcPtr proc, int selectedIdx, int c)
{
    int i;
    int textIdx;

    int y = ((selectedIdx * 2) + 4) & 0x1f;

    int yTmp = 0x20 * y;

    for (i = 0; i <= 26; i++)
    {
        gBg2Tm[yTmp + 0x02 + i] = 0;
        gBg2Tm[yTmp + 0x22 + i] = 0;
    }

    textIdx = selectedIdx % 7;

    DrawGameOptionIcon(selectedIdx, 4);
    DrawGameOptionText(selectedIdx, textIdx, y);
    DrawOptionValueTexts(selectedIdx, textIdx, y);

    for (i = 0; i <= 26; i++)
    {
        gBg0Tm[c + 0x62 + i] = 0;
    }

    EnableBgSync(BG0_SYNC_BIT | BG2_SYNC_BIT);
}
void Config_Loop_KeyHandler(struct ConfigProc * proc)
{
    bool valueChanged = FALSE;

    switch (proc->moving)
    {
    case 0:
        if (gpKeySt->pressed & (B_BUTTON))
        {
            PlaySoundEffect(0x38B);
            Proc_Break(proc);

            break;
        }
        else if (gpKeySt->pressed & (A_BUTTON))
        {
            if (gGameOptionLayouts[GetOptionMenuLayoutId()].order[gConfigUiState->selectedOptionIdx] != 0)
                break;

            if (GetGameOption(0) != 3)
                break;

            PlaySoundEffect(0x38A);
            proc->loadSoloAnimScreen = TRUE;
            Proc_Break(proc);

            break;
        }
        else if (gpKeySt->repeated & (DPAD_UP | DPAD_DOWN))
        {
            if (gpKeySt->repeated & (DPAD_UP))
            {
                if (gConfigUiState->selectedOptionIdx != 0)
                {
                    gConfigUiState->selectedOptionIdx--;

                    if ((gConfigUiState->selectedOptionIdx - gConfigUiState->headOptionIdx < 1) && (gConfigUiState->headOptionIdx != 0))
                    {
                        gConfigUiState->headOptionIdx--;

                        PutGameOptionRow(proc, gConfigUiState->selectedOptionIdx - 1, 0);

                        proc->bgYOffset -= 4;
                        proc->moving = 1;
                    }

                    valueChanged = TRUE;
                }
            }
            else
            {
                if (gConfigUiState->selectedOptionIdx < gConfigUiState->maxOption - 1)
                {
                    gConfigUiState->selectedOptionIdx++;

                    if ((gConfigUiState->selectedOptionIdx - gConfigUiState->headOptionIdx > 4) &&
                        (gConfigUiState->selectedOptionIdx < gConfigUiState->maxOption - 1))
                    {
                        gConfigUiState->headOptionIdx++;

                        PutGameOptionRow(proc, gConfigUiState->selectedOptionIdx + 1, 320);

                        proc->bgYOffset += 4;
                        proc->moving = 4;
                    }

                    valueChanged = TRUE;
                }
            }

            if (valueChanged)
            {
                Proc_Start(gProcScr_RedrawConfigHelpText, proc);
                EnableBgSync(BG0_SYNC_BIT | BG2_SYNC_BIT);
                PlaySoundEffect(0x386);

                break;
            }
        }

        if (gpKeySt->pressed & (DPAD_LEFT | DPAD_RIGHT))
        {
            if (gGameOptions[gGameOptionLayouts[GetOptionMenuLayoutId()].order[gConfigUiState->selectedOptionIdx]].func != NULL)
                gGameOptions[gGameOptionLayouts[GetOptionMenuLayoutId()].order[gConfigUiState->selectedOptionIdx]].func(proc);
        }

        break;

    case 1:
    case 2:
    case 3:
        proc->bgYOffset -= 4;

        if (proc->moving == 3)
            proc->moving = 0;
        else
            proc->moving++;

        break;

    case 4:
    case 5:
    case 6:
        proc->bgYOffset += 4;

        if (proc->moving == 6)
            proc->moving = 0;
        else
            proc->moving++;

        break;
    }

    SetBgOffset(2, 0, proc->bgYOffset);
}
bool Config_HandleExit(struct ConfigProc * proc)
{
    EndMuralBackground();

    Proc_EndEach(gProcScr_DrawConfigUiSprites);
    Proc_EndEach(gProcScr_RedrawConfigHelpText);

    if (proc->loadSoloAnimScreen)
    {
        StartUnitListScreenForSoloAnim(proc);
        Proc_Goto(proc, 0);

        return FALSE;
    }

    return TRUE;
}
void Config_SetSourceFromPrep(struct ConfigProc * proc)
{
    proc->unk_37 = TRUE;
}

SECTION(".rodata.08CE5B98")
const struct ProcCmd gProcScr_RedrawConfigHelpText[] = {
    PROC_19,
    PROC_SLEEP(1),
    PROC_CALL(DrawGameOptionHelpText),
    PROC_END,
};

SECTION(".rodata.08CE5BB8")
const struct ProcCmd gProcScr_DrawConfigUiSprites[] = {
    PROC_19,
    PROC_CALL(ConfigSprites_Init),
    PROC_LABEL(0),
    PROC_CALL(DrawConfigUiSprites),
    PROC_SLEEP(0),
    PROC_GOTO(0),
    PROC_END,
};

SECTION(".rodata.08CE5868")
const struct GameOptionLayout gGameOptionLayouts[] = {
    { .count = 0xD, .order = gUnk_08CE5840 },
    { .count = 0xD, .order = &gUnk_08CE5858[2] },
    { .count = 0xD, .order = &gUnk_08CE5858[2] },
    { .count = 0xD, .order = &gUnk_08CE584C[1] },
    { .count = 0xD, .order = &gUnk_08CE5858[2] },
    { .count = 0xD, .order = &gUnk_08CE5858[2] },
};

SECTION(".rodata.08CE58D8")
const struct GameOption gGameOptions[] = {
    {
        .msgId = 0x622,
        .selectors = {
            { .helpTextId = 0x632, .optionTextId = 0x64F, .xPos = 0x78, .unk_05 = 1 },
            { .helpTextId = 0x633, .optionTextId = 0x650, .xPos = 0x87, .unk_05 = 1 },
            { .helpTextId = 0x634, .optionTextId = 0x64E, .xPos = 0x96, .unk_05 = 2 },
            { .helpTextId = 0x635, .optionTextId = 0x657, .xPos = 0xAD, .unk_05 = 2 },
        },
        .func = GenericOptionChangeHandler,
    },
    {
        .msgId = 0x623,
        .selectors = {
            { .helpTextId = 0x63C, .optionTextId = 0x64D, .xPos = 0x78, .unk_05 = 2 },
            { .helpTextId = 0x63C, .optionTextId = 0x64E, .xPos = 0x8F, .unk_05 = 2 },
            { .xPos = 0xC6 },
            { .xPos = 0xC5 },
        },
        .icon = 2,
        .func = GenericOptionChangeHandler,
    },
    {
        .msgId = 0x624,
        .selectors = {
            { .helpTextId = 0x63D, .optionTextId = 0x65A, .xPos = 0x78, .unk_05 = 3 },
            { .helpTextId = 0x63E, .optionTextId = 0x65B, .xPos = 0x97, .unk_05 = 4 },
            { .helpTextId = 0x63F, .optionTextId = 0x64E, .xPos = 0xBE, .unk_05 = 2 },
            { .xPos = 0xC5 },
        },
        .icon = 4,
        .func = GenericOptionChangeHandler,
    },
    {
        .msgId = 0x627,
        .selectors = {
            { .helpTextId = 0x644, .optionTextId = 0x64D, .xPos = 0x78, .unk_05 = 2 },
            { .helpTextId = 0x644, .optionTextId = 0x64E, .xPos = 0x8F, .unk_05 = 2 },
            { .xPos = 0xC6 },
            { .xPos = 0xC5 },
        },
        .icon = 6,
        .func = GenericOptionChangeHandler,
    },
    {
        .msgId = 0x628,
        .selectors = {
            { .helpTextId = 0x638, .optionTextId = 0x653, .xPos = 0x78, .unk_05 = 3 },
            { .helpTextId = 0x639, .optionTextId = 0x654, .xPos = 0x97, .unk_05 = 3 },
            { .helpTextId = 0x63A, .optionTextId = 0x655, .xPos = 0xB6, .unk_05 = 3 },
            { .helpTextId = 0x63B, .optionTextId = 0x656, .xPos = 0xD5, .unk_05 = 2 },
        },
        .icon = 8,
        .func = GenericOptionChangeHandler,
    },
    {
        .msgId = 0x629,
        .selectors = {
            { .helpTextId = 0x636, .optionTextId = 0x654, .xPos = 0x78, .unk_05 = 3 },
            { .helpTextId = 0x637, .optionTextId = 0x655, .xPos = 0x97, .unk_05 = 3 },
            { .xPos = 0xC6 },
            { .xPos = 0xC5 },
        },
        .icon = 0xA,
        .func = GenericOptionChangeHandler,
    },
    {
        .msgId = 0x62A,
        .selectors = {
            { .helpTextId = 0x646, .optionTextId = 0x64D, .xPos = 0x78, .unk_05 = 2 },
            { .helpTextId = 0x646, .optionTextId = 0x64E, .xPos = 0x8F, .unk_05 = 2 },
            { .xPos = 0xC6 },
            { .xPos = 0xC5 },
        },
        .icon = 0xC,
        .func = (void *) MusicOptionChangeHandler,
    },
    {
        .msgId = 0x62B,
        .selectors = {
            { .helpTextId = 0x647, .optionTextId = 0x64D, .xPos = 0x78, .unk_05 = 2 },
            { .helpTextId = 0x647, .optionTextId = 0x64E, .xPos = 0x8F, .unk_05 = 2 },
            { .xPos = 0xC6 },
            { .xPos = 0xC5 },
        },
        .icon = 0xE,
        .func = GenericOptionChangeHandler,
    },
    {
        .msgId = 0x62C,
        .selectors = {
            { .helpTextId = 0x648, .optionTextId = 0x64F, .xPos = 0x78, .unk_05 = 1 },
            { .helpTextId = 0x648, .optionTextId = 0x650, .xPos = 0x87, .unk_05 = 1 },
            { .helpTextId = 0x648, .optionTextId = 0x651, .xPos = 0x96, .unk_05 = 1 },
            { .helpTextId = 0x648, .optionTextId = 0x652, .xPos = 0xA5, .unk_05 = 1 },
        },
        .icon = 0x10,
        .func = WindowColorOptionChangeHandler,
    },
    {
        .msgId = 0x62D,
        .selectors = {
            { .helpTextId = 0x649, .optionTextId = 0x64F, .xPos = 0x78, .unk_05 = 1 },
            { .helpTextId = 0x649, .optionTextId = 0x650, .xPos = 0x87, .unk_05 = 1 },
            { .helpTextId = 0x649, .optionTextId = 0x651, .xPos = 0x96, .unk_05 = 1 },
            { .xPos = 0xC5 },
        },
        .icon = 0x12,
        .func = GenericOptionChangeHandler,
    },
    {
        .msgId = 0x625,
        .selectors = {
            { .helpTextId = 0x640, .optionTextId = 0x658, .xPos = 0x78, .unk_05 = 3 },
            { .helpTextId = 0x641, .optionTextId = 0x659, .xPos = 0x97, .unk_05 = 3 },
            { .helpTextId = 0x642, .optionTextId = 0x64E, .xPos = 0xBE, .unk_05 = 2 },
            { .xPos = 0xC5 },
        },
        .icon = 0x14,
        .func = GenericOptionChangeHandler,
    },
    {
        .msgId = 0x626,
        .selectors = {
            { .helpTextId = 0x643, .optionTextId = 0x64D, .xPos = 0x78, .unk_05 = 2 },
            { .helpTextId = 0x643, .optionTextId = 0x64E, .xPos = 0x8F, .unk_05 = 2 },
            { .xPos = 0xC6 },
            { .xPos = 0xC5 },
        },
        .icon = 0x16,
        .func = GenericOptionChangeHandler,
    },
    {
        .msgId = 0x62E,
        .selectors = {
            { .helpTextId = 0x645, .optionTextId = 0x64D, .xPos = 0x78, .unk_05 = 2 },
            { .helpTextId = 0x645, .optionTextId = 0x64E, .xPos = 0x8F, .unk_05 = 2 },
            { .xPos = 0xC6 },
            { .xPos = 0xC5 },
        },
        .icon = 0x18,
        .func = GenericOptionChangeHandler,
    },
    {
        .msgId = 0x62F,
        .selectors = {
            { .helpTextId = 0x64A, .optionTextId = 0x64D, .xPos = 0x78, .unk_05 = 2 },
            { .helpTextId = 0x64A, .optionTextId = 0x64E, .xPos = 0x8F, .unk_05 = 2 },
            { .xPos = 0xC6 },
            { .xPos = 0xC5 },
        },
        .icon = 0x1A,
        .func = GenericOptionChangeHandler,
    },
    {
        .msgId = 0x630,
        .selectors = {
            { .helpTextId = 0x64B, .optionTextId = 0x64D, .xPos = 0x78, .unk_05 = 2 },
            { .helpTextId = 0x64B, .optionTextId = 0x64E, .xPos = 0x8F, .unk_05 = 2 },
            { .xPos = 0xC6 },
            { .xPos = 0xC5 },
        },
        .icon = 0x1C,
        .func = GenericOptionChangeHandler,
    },
    {
        .msgId = 0x631,
        .selectors = {
            { .helpTextId = 0x64C, .optionTextId = 0x64D, .xPos = 0x78, .unk_05 = 2 },
            { .helpTextId = 0x64C, .optionTextId = 0x64E, .xPos = 0x8F, .unk_05 = 2 },
            { .xPos = 0xC6 },
            { .xPos = 0xC5 },
        },
        .icon = 0x1E,
        .func = GenericOptionChangeHandler,
    },
};
