#include "gbafe.h"

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

struct GameOptionLayout
{
    /* 00 */ int unk_00;
    /* 04 */ u8 const * order;
};

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
    /* 29 */ STRUCT_PAD(0x29, 0x30);
    /* 30 */ s16 moving;
    /* 32 */ STRUCT_PAD(0x32, 0x36);
    /* 36 */ u8 unk_36;
    /* 37 */ u8 unk_37;
};

extern struct ConfigScreen * CONST_DATA gConfigUiState;
extern struct GameOptionLayout CONST_DATA gGameOptionLayouts[];
extern struct GameOption CONST_DATA gGameOptions[];
extern u16 CONST_DATA gUnk_08CE58BE[];
extern u16 CONST_DATA gSprite_ConfigurationUiHeader[];
extern struct ProcCmd CONST_DATA ProcScr_08CE5B98[];

extern s16 gUnk_020144F4;

void sub_080B1FB0(int x, int y, u16 oam2, int flag);
void UnpackUiVArrowGfx(int chr, int pal);
u8 sub_080AE360(u8 index);
void sub_080AE4CC(u8 index, u8 value);
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
u8 sub_080ADB48(void)
{
    return sub_080AE360(gGameOptionLayouts[GetOptionMenuLayoutId()].order[gConfigUiState->selectedOptionIdx]);
}
void sub_080ADB7C(void)
{
    InitBgs(gUnk_08CE58BE);
}
void sub_080ADB8C(ProcPtr parent, void * vram, int pal)
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
void sub_080ADC24(int selectedIdx, int yBase)
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
void sub_080ADCC4(void)
{
    char const * str;

    ClearText(&gConfigUiState->optionHelpText);

    str = DecodeMsg(
        gGameOptions[gGameOptionLayouts[GetOptionMenuLayoutId()].order[gConfigUiState->selectedOptionIdx]].selectors[sub_080ADB48()].helpTextId);

    PutDrawText(&gConfigUiState->optionHelpText, gBg0Tm + TM_OFFSET(4, 17), TEXT_COLOR_SYSTEM_WHITE, 0, 22, str);
}
void sub_080ADD34(int selectedIdx, int textIdx, int y)
{
    char const * str;

    ClearText(&gConfigUiState->optionTexts[textIdx]);

    str = DecodeMsg(gGameOptions[gGameOptionLayouts[GetOptionMenuLayoutId()].order[selectedIdx]].msgId);

    PutDrawText(&gConfigUiState->optionTexts[textIdx], gBg2Tm + TM_OFFSET(4, y), TEXT_COLOR_SYSTEM_WHITE, 0, 9, str);
}
void sub_080ADDB4(int selectedIdx, int textIdx, int y)
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
            (i == sub_080AE360(optionIdx)) ? TEXT_COLOR_0789 : TEXT_COLOR_0456,
            DecodeMsg(gGameOptions[optionIdx].selectors[i].optionTextId));
    }

    PutText(&gConfigUiState->valueTexts[textIdx], gBg2Tm + TM_OFFSET(x, y));
}
void ConfigSprites_Init(void)
{
    ApplyIconPalette(1, 18);
    UnpackUiVArrowGfx(0x80, 3);
}
void sub_080ADEA8(void)
{
    int y;

    int optionIdx = gGameOptionLayouts[GetOptionMenuLayoutId()].order[gConfigUiState->selectedOptionIdx];

    u8 time = (GetGameTime() % 16) & 8;

    PutOamHiRam(34, 8, gSprite_ConfigurationUiHeader, OAM2_CHR(0xC0) + OAM2_PAL(2));

    y = (gConfigUiState->selectedOptionIdx - gConfigUiState->headOptionIdx) * 16 + 32;

    DisplayFrozenUiHand(16, y);

    PutUiHand(gGameOptions[optionIdx].selectors[sub_080AE360(optionIdx)].xPos - 2, y);

    if (gConfigUiState->maxOption > 6)
    {
        if (gConfigUiState->headOptionIdx != 0)
            sub_080B1FB0(100, 29, 0x3080, 1);

        if (gConfigUiState->headOptionIdx < gConfigUiState->maxOption - 6)
            sub_080B1FB0(100, 125, 0x3080, 0);
    }

    if ((GetSelectedGameOption() == 0) && (sub_080ADB48() == 3))
        PutOamHiRam(192, 32, Sprite_16x16, (time != 0) ? OAM2_CHR(0xCE) + OAM2_PAL(2) : OAM2_CHR(0xCC) + OAM2_PAL(2));
}
ASM_FUNC("asm/nonmatching/code_080ADFA0.s");
bool WindowColorOptionChangeHandler(ProcPtr proc)
{
    if (GenericOptionChangeHandler(proc) != 0)
        UnpackUiWindowFrameGraphics2(-1);

    return FALSE;
}
bool sub_080AE218(struct ConfigProc * proc)
{
    if (GenericOptionChangeHandler(proc) == 0)
        return FALSE;

    if (sub_080AE360(gGameOptionLayouts[GetOptionMenuLayoutId()].order[gConfigUiState->selectedOptionIdx]) != 0)
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

    u8 selectedValue = sub_080ADB48();

    if (gpKeySt->repeated & (DPAD_LEFT | DPAD_RIGHT))
    {
        if (gpKeySt->repeated & (DPAD_LEFT))
        {
            if (selectedValue != 0)
            {
                selectedValue--;
                sub_080AE4CC(optionIdx, selectedValue);

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
                    sub_080AE4CC(optionIdx, selectedValue);

                    valueChanged = TRUE;
                }
            }
        }

        if (valueChanged)
        {
            Proc_Start(ProcScr_08CE5B98, proc);
            sub_080ADDB4(selectedIdx, selectedIdx % 7, selectedIdx * 2 + 4);
            EnableBgSync(BG0_SYNC_BIT | BG2_SYNC_BIT);
            PlaySoundEffect(0x387);
        }
    }

    return valueChanged;
}
ASM_FUNC("asm/nonmatching/code_080AE360.s");
ASM_FUNC("asm/nonmatching/code_080AE4CC.s");
ASM_FUNC("asm/nonmatching/code_080AE6D0.s");
ASM_FUNC("asm/nonmatching/code_080AE754.s");
ASM_FUNC("asm/nonmatching/code_080AE9C0.s");
ASM_FUNC("asm/nonmatching/code_080AEA04.s");
