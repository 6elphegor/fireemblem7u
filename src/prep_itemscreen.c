#include "gbafe.h"
#include "gbafe/bmcontainer.h"

u32 GetGold(void);
void EndMenuScrollBar(void);
ProcPtr StartMenuScrollBar(ProcPtr parent);
void InitMenuScrollBarImg(int chr, int pal);
void PutMenuScrollBarAt(int x, int y);
void UpdateMenuScrollBarConfig(u8 a, u16 b, u16 c, u8 d);
void TryHideMenuScrollBar(void);
void SetupDebugFontForOBJ(int vram, int pal);

extern u8 Img_0840E368[];
extern u16 Pal_0840E3EC[];
extern u8 Tsa_084070BC[];
extern u8 Tsa_08407188[];
extern u8 Tsa_08407270[];

s8 CanUnitPrepScreenUse(struct Unit * unit);
void SetFacePosition(int slot, int x, int y);
void PutUnitSprite(int layer, int x, int y, struct Unit * unit);
void SyncUnitSpriteSheet(void);


int CONST_DATA gHelpTextIds_PrepItemScreen[] = {
	0x385,
	0x389,
	0x38A,
	0x38B,
	0x387,
	0x388,
};

struct ProcCmd CONST_DATA ProcScr_PrepItemScreen[] = {
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_Init),
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_CALL(PrepItemScreen_Reinit),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_YIELD,
    PROC_GOTO(1),
PROC_LABEL(0),
    PROC_CALL(PrepItemScreen_Reinit),
PROC_LABEL(1),
    PROC_REPEAT(sub_08091DBC),
    PROC_CALL(DisableAllGfx),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_StartStatScreen),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_ResumeFromStatScreen),
    PROC_CALL(PrepItemScreen_Reinit),
    PROC_YIELD,
    PROC_CALL(EnableAllGfx),
    PROC_GOTO(1),
PROC_LABEL(2),
    PROC_CALL(sub_0809210C),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_YIELD,
    PROC_CALL(sub_0809218C),
PROC_LABEL(3),
    PROC_REPEAT(sub_08092220),
PROC_LABEL(4),
    PROC_CALL(PrepItemScreen_HideFunds),
    PROC_CALL(sub_080925D0),
    PROC_YIELD,
    PROC_CALL(sub_080926F8),
PROC_LABEL(5),
    PROC_REPEAT(PrepItemScreen_Loop_MainKeyHandler),
    PROC_CALL(DisableAllGfx),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_StartStatScreen),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_ResumeFromStatScreen),
    PROC_CALL(sub_080925D0),
    PROC_CALL(sub_080926F8),
    PROC_YIELD,
    PROC_CALL(EnableAllGfx),
    PROC_GOTO(5),
PROC_LABEL(6),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(StartPrepItemTradeScreen),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,
    PROC_CALL(sub_080925D0),
    PROC_CALL(sub_080926F8),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(5),
PROC_LABEL(8),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(sub_080928D4),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,
    PROC_CALL(sub_080921E8),
    PROC_CALL(sub_0809210C),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(sub_0809218C),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(3),
PROC_LABEL(9),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(sub_0809288C),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,
    PROC_CALL(sub_080921E8),
    PROC_CALL(sub_0809210C),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(sub_0809218C),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(3),
PROC_LABEL(10),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(sub_080928A4),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,
    PROC_CALL(sub_080921E8),
    PROC_CALL(sub_0809210C),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(sub_0809218C),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(3),
PROC_LABEL(11),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_CALL(StartPrepArmory),
    PROC_YIELD,
    PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_YIELD,
    PROC_CALL(sub_080921E8),
    PROC_CALL(sub_0809210C),
    PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_CALL(sub_0809218C),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(3),
PROC_LABEL(12),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd),
    PROC_END,
};

void PrepItemScreen_OnHBlank(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
        vcount = 0;

    if (vcount == 0)
        REG_BG0VOFS = 248;

    if (vcount == 72)
        REG_BG0VOFS = 252;
}

void PrepItemScreen_Init(struct PrepItemScreenProc * proc)
{
    proc->selectedUnitIdx = -1;
    proc->helpboxActiveIdx = -1;
    proc->popupPromptIdx = 0;
    proc->scrollOffset = 0;
    proc->pUnits[1] = NULL;
    proc->pUnits[0] = NULL;
    proc->hasConvoyAccess = HasConvoyAccess_();
}
void PrepItemScreen_DrawFunds(void)
{
    PutText(&gPrepItemTexts[29], gBg0Tm + TM_OFFSET(19, 17));
    PutNumber(gBg0Tm + TM_OFFSET(19, 17) + 9, TEXT_COLOR_SYSTEM_BLUE, GetGold());
    PutSpecialChar(gBg0Tm + TM_OFFSET(19, 17) + 10, TEXT_COLOR_SYSTEM_GOLD, 0x1E);
    EnableSysBrownBox(0, 0x88, 0x8B, 2);
    EnableBgSync(BG0_SYNC_BIT);
}
void PrepItemScreen_HideFunds(void)
{
    TmFillRect(gBg0Tm + TM_OFFSET(19, 17), 10, 1, 0);
    DisableSysBrownBox(0);
    EnableBgSync(BG0_SYNC_BIT);
}
void PrepItemScreen_SetupGfx(struct PrepItemScreenProc * proc)
{
    int i;

    struct FaceVramEnt faceConfig[4] =
    {
        { 0x5800, 6 },
        { 0x6800, 7 },
        { 0, 0 },
        { 0, 0 },
    };

    InitBgs(gBgConfig_PrepScreen);

    gDispIo.disp_ct.mode = DISPCNT_MODE_0;

    SetFaceConfig(faceConfig);

    SetDispEnable(0, 0, 0, 0, 0);

    SetupDebugFontForOBJ(0x06017800, 0);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg3_ct.priority = 3;

    ResetText();
    InitIcons();
    ApplyIconPalettes(4);
    UnpackUiWindowFrameGraphics();
    ApplySystemObjectsGraphics();

    MakePrepUnitList();
    proc->hoverUnitIdx = UnitGetIndexInPrepList(PrepGetLatestCharId());

    ResetSysHandCursor(proc);
    StartParallelWorker(PrepItem_DrawSMS, proc);
    StartUiCursorHand(proc);

    SetOnHBlankA(NULL);

    TmFill(GetBgTilemap(0), 0);
    TmFill(GetBgTilemap(1), 0);
    TmFill(GetBgTilemap(2), 0);

    gPal[0] = 0;
    EnablePalSync();

    for (i = 0; i < 15; i++)
        InitText(&gPrepItemTexts[i], 5);

    for (i = 0; i < 5; i++)
    {
        InitText(&gPrepItemTexts[15 + i], 7);
        InitText(&gPrepItemTexts[20 + i], 7);
    }

    InitTextDb(&gPrepItemTexts[25], 8);
    InitTextDb(&gPrepItemTexts[26], 8);
    InitText(&gPrepItemTexts[27], 8);
    InitText(&gPrepItemTexts[29], 7);
    InitText(&gPrepItemTexts[30], 5);

    LoadHelpBoxGfx((void *) 0x06014000, -1);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    gDispIo.win_ct.wout_enable_blend = 1;

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 4, 240, 68);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    SetBgOffset(0, 4, -4);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, -40, (proc->scrollOffset - 4) & 0xff);
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    ApplyUnitSpritePalettes();
    CpuFastFill(0, PAL_OBJ(11), 0x20);

    ForceSyncUnitSpriteSheet();

    Decompress(Img_PrepTextShadow, (void *) 0x06013E00);
    UiCursorHand_SetPosition(0, 0, 0, 208, 60);
    DisplaySysHandCursorTextShadow(0x600, 1);

    PrepRestartMuralBackground();

    if (proc->selectedUnitIdx != 0xff)
    {
        SetUiCursorHandConfig(
            0, ((proc->selectedUnitIdx % 3) * 64) + 24, ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 2);
        UpdatePrepItemScreenFace(0, GetUnitFromPrepList(proc->selectedUnitIdx), 68, 78, 0x503);
    }

    StartMenuScrollBar(proc);
    InitMenuScrollBarImg(0x200, 4);
    PutMenuScrollBarAt(216, 12);
    UpdateMenuScrollBarConfig(6, proc->scrollOffset, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    TryHideMenuScrollBar();

    PrepUpdateSMS();

    SetBlendAlpha(8, 8);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    SetOnHBlankA(PrepItemScreen_OnHBlank);

    StartSysBrownBox(6, 0xE00, 8, 0xC00, 0x400, proc);
    SetSysBrownBoxWidth(0, 1);

    Text_SetColor(&gPrepItemTexts[29], TEXT_COLOR_SYSTEM_GOLD);
    Text_DrawString(&gPrepItemTexts[29], DecodeMsg(0x1259));

    Text_SetColor(&gPrepItemTexts[27], proc->hasConvoyAccess == 0 ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE);
    Text_SetCursor(&gPrepItemTexts[27], 0);
    Text_DrawString(&gPrepItemTexts[27], DecodeMsg(0x125A));
    Text_SetCursor(&gPrepItemTexts[27], 0x20);
    Text_DrawString(&gPrepItemTexts[27], DecodeMsg(0x125B));
}
void PrepItemScreen_OnEnd(struct PrepItemScreenProc * proc)
{
    PrepSetLatestCharId(GetUnitFromPrepList(proc->hoverUnitIdx)->pCharacterData->number);

    EndAllParallelWorkers();
    EndSysHandCursor();
    EndUiCursorHand();

    EndPrepItemScreenFace(0);
    EndPrepItemScreenFace(1);

    EndMuralBackground_();
    EndHelpPromptSprite();
    EndMenuScrollBar();
    EndSysBrownBox();

    SetOnHBlankA(NULL);
}
void sub_08091868(u16 * tm)
{
    TmFillRect(tm, 10, 6, 0);

    ClearText(&gPrepItemTexts[25]);
    ClearText(&gPrepItemTexts[26]);

    PutDrawText(&gPrepItemTexts[25], tm + TM_OFFSET(1, 1), TEXT_COLOR_SYSTEM_WHITE, 0, 0, DecodeMsg(0x125C));
}
void sub_080918B4(void)
{
    PrepItemDrawPopupBox(0x88, 0x58, 9, 4, 0xA580);
}
void sub_080918D4(void)
{
    PrepItemDrawPopupBox(8, 0x5C, 10, 5, 0xA580);
}
void sub_080918F4(void)
{
    PrepItemDrawPopupBox(0x82, 0x50, 9, 6, 0xA980);
}
void sub_08091914(void)
{
    Proc_End(GetParallelWorker(sub_080918B4));
    Proc_End(GetParallelWorker(sub_080918D4));
    Proc_End(GetParallelWorker(sub_080918F4));
}
void sub_08091944(int vram, int pal)
{
    u16 const * pals[] =
    {
        Pal_08406D50,
        Pal_08406DF0,
        Pal_08406E90,
        Pal_08406F30,
    };

    Decompress(Img_PrepWindow, (void *) BG_VRAM + vram);
    ApplyPalettes(pals[gPlaySt.config_window_theme], pal, 5);
}
void sub_08091994(int vram, int pal)
{
    Decompress(Img_0840E368, (void *) OBJ_VRAM0 + vram);
    ApplyPalette(Pal_0840E3EC, pal + 0x10);
}
void PrepItemScreen_Reinit(struct PrepItemScreenProc * proc)
{
    sub_08092AE4(proc);

    TmFill(GetBgTilemap(0), 0);
    TmFill(GetBgTilemap(1), 0);
    TmFill(GetBgTilemap(2), 0);

    sub_08091944(0x6000, 5);
    sub_08091994(0x3000, 10);

    PutCompressedTsa(gBg1Tm, Tsa_084070BC, 0x5300);

    UpdatePrepItemScreenFace(0, GetUnitFromPrepList(proc->hoverUnitIdx), 68, 78, 0x503);

    sub_080929D0(&gPrepItemTexts[15], gBg0Tm + TM_OFFSET(2, 9), GetUnitFromPrepList(proc->hoverUnitIdx), 2);

    sub_08091868(gBg0Tm + TM_OFFSET(2, 9) + 0x30);

    proc->unitSelected = 0;

    ShowSysHandCursor(
        (proc->hoverUnitIdx % 3) * 64 + 24, ((proc->hoverUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 7, 0x800);

    sub_08092ED4(proc, 0);
    UnblockUiCursorHand();
    DisableAllUiCursorHand();
    StartHelpPromptSprite(201, 123, proc);

    sub_08091914();
    StartParallelWorker(sub_080918B4, proc);

    PrepItemScreen_DrawFunds();

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}
s8 sub_08091AD8(struct PrepItemScreenProc * proc)
{
    int previous = proc->hoverUnitIdx;

    u16 keys = gpKeySt->repeated;

    proc->scrollAmount = 4;

    if (gpKeySt->held & L_BUTTON)
    {
        keys = gpKeySt->held;
        proc->scrollAmount = 8;
    }

    if (keys & DPAD_UP)
    {
        if ((proc->hoverUnitIdx - 3) >= 0)
            proc->hoverUnitIdx -= 3;
    }

    if (keys & DPAD_DOWN)
    {
        if ((proc->hoverUnitIdx + 3) < PrepGetUnitAmount())
            proc->hoverUnitIdx += 3;
    }

    if (keys & DPAD_LEFT)
    {
        if ((proc->hoverUnitIdx % 3) != 0)
            proc->hoverUnitIdx--;
    }

    if (keys & DPAD_RIGHT)
    {
        if (((proc->hoverUnitIdx % 3) < 2) && ((proc->hoverUnitIdx + 1) < PrepGetUnitAmount()))
            proc->hoverUnitIdx++;
    }

    if (proc->hoverUnitIdx != previous)
    {
        int hoverYPos = proc->hoverUnitIdx / 3 * 16;
        int yMax = (PrepGetUnitAmount() - 1) / 3 * 16;

        if (hoverYPos - proc->scrollOffset > 32 && proc->scrollOffset + 48 < yMax)
        {
            sub_08092B6C(proc, (proc->scrollOffset >> 4) + 4, 0);
            SetSysHandCursorXPos((proc->hoverUnitIdx % 3) * 64 + 24);
        }
        else if (hoverYPos - proc->scrollOffset < 0x10 && ({ proc->scrollOffset + 0; }) != 0)
        {
            sub_08092B6C(proc, (proc->scrollOffset >> 4) - 1, 0);
            SetSysHandCursorXPos((proc->hoverUnitIdx % 3) * 64 + 24);
        }
        else
        {
            ShowSysHandCursor(
                (proc->hoverUnitIdx % 3) * 64 + 24, (proc->hoverUnitIdx / 3) * 16 + 4 - proc->scrollOffset, 7, 0x800);
        }

        PlaySoundEffect(0x385);
        return 1;
    }

    return 0;
}
void sub_08091C48(struct PrepItemScreenProc * proc)
{
    int hoverYPos = (proc->hoverUnitIdx / 3) * 16;
    int yMax = ((PrepGetUnitAmount() - 1) / 3) * 16;

    if (((hoverYPos - proc->scrollOffset) > 32) && ((proc->scrollOffset + 48) < yMax))
    {
        proc->scrollOffset += proc->scrollAmount;

        SetBgOffset(2, -40, (proc->scrollOffset - 4) & 0xff);

        if (proc->selectedUnitIdx != 0xFF)
        {
            SetUiCursorHandConfig(
                0, ((proc->selectedUnitIdx % 3) * 64) + 24, ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 2);
        }

        UpdateMenuScrollBarConfig(6, proc->scrollOffset, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    }

    if (((hoverYPos - proc->scrollOffset) < 16) && (proc->scrollOffset != 0))
    {
        proc->scrollOffset -= proc->scrollAmount;

        SetBgOffset(2, -40, (proc->scrollOffset - 4) & 0xff);

        if (proc->selectedUnitIdx != 0xFF)
        {
            SetUiCursorHandConfig(
                0, ((proc->selectedUnitIdx % 3) * 64) + 24, ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 2);
        }

        UpdateMenuScrollBarConfig(6, proc->scrollOffset, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
    }
}
void PrepItemScreen_StartStatScreen(struct PrepItemScreenProc * proc)
{
    PrepItemScreen_OnEnd(proc);
    SetStatScreenExcludedUnitFlags(0x31);
    StartStatScreen(GetUnitFromPrepList(proc->hoverUnitIdx), proc);
    Proc_Break(proc);
}
void PrepItemScreen_ResumeFromStatScreen(struct PrepItemScreenProc * proc)
{
    PrepItemScreen_SetupGfx(proc);
    proc->hoverUnitIdx = GetLatestUnitIndexInPrepListByUId();
    sub_08092AE4(proc);
}
void sub_08091DBC(struct PrepItemScreenProc * proc)
{
    int tmp = proc->scrollOffset;

    if (!(tmp & 15))
    {
        if (gpKeySt->pressed & R_BUTTON)
        {
            Proc_Break(proc);
            return;
        }

        if (gpKeySt->pressed & A_BUTTON)
        {
            proc->selectedUnitIdx = proc->hoverUnitIdx;

            if (((proc->hoverUnitIdx % 3) < 2) && (proc->hoverUnitIdx < PrepGetUnitAmount() - 1))
                proc->hoverUnitIdx++;
            else
                proc->hoverUnitIdx--;

            SetUiCursorHandConfig(
                0, ((proc->selectedUnitIdx % 3) * 64) + 24, (proc->selectedUnitIdx / 3) * 16 + 4 - proc->scrollOffset, 2);

            Proc_Goto(proc, 2);
            PlaySoundEffect(0x38A);
            return;
        }

        if (gpKeySt->pressed & B_BUTTON)
        {
            Proc_Goto(proc, 12);
            PlaySoundEffect(0x38B);
            return;
        }

        if (sub_08091AD8(proc) != 0)
        {
            UpdatePrepItemScreenFace(0, GetUnitFromPrepList(proc->hoverUnitIdx), 68, 78, 0x503);
            sub_080929D0(&gPrepItemTexts[15], gBg0Tm + TM_OFFSET(2, 9), GetUnitFromPrepList(proc->hoverUnitIdx), 2);
            EnableBgSync(BG0_SYNC_BIT);
        }
    }

    sub_08091C48(proc);
}
void sub_08091F04(struct PrepItemScreenProc * proc, u16 * tm, struct Unit * unit)
{
    struct Text * th;
    int color;

    TmFillRect(tm, 10, 6, 0);

    ClearText(&gPrepItemTexts[25]);
    ClearText(&gPrepItemTexts[26]);

    Text_InsertDrawString(
        &gPrepItemTexts[25], 0, PrepGetUnitAmount() < 2 ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
        DecodeMsg(0x125D));
    Text_InsertDrawString(
        &gPrepItemTexts[25], 32, PrepGetUnitAmount() < 2 ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
        DecodeMsg(0x125E));
    PutText(&gPrepItemTexts[25], tm + TM_OFFSET(0, 1));

    Text_InsertDrawString(
        &gPrepItemTexts[26], 0, !CanUnitPrepScreenUse(unit) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
        DecodeMsg(0x125F));

    th = &gPrepItemTexts[26];
    color = TEXT_COLOR_SYSTEM_WHITE;
    if ((!proc->hasConvoyAccess) || (GetUnitItemCount(unit) < 1) || CheckInLinkArena())
        color = TEXT_COLOR_SYSTEM_GRAY;
    Text_InsertDrawString(th, 32, color, DecodeMsg(0x1260));

    PutText(&gPrepItemTexts[26], tm + TM_OFFSET(0, 3));
    PutText(&gPrepItemTexts[27], tm + TM_OFFSET(0, 5));
}
void sub_08092010(struct PrepItemScreenProc * proc)
{
    int i;
    char const * str;
    int x;

    struct Unit * unit = GetUnitFromPrepList(proc->selectedUnitIdx);

    proc->unitSelected = 1;

    PutCompressedTsa(gBg1Tm, Tsa_08407188, 0x5300);

    for (i = 0; i < 8; i++)
        TmFillRect(gBg2Tm + ((((proc->scrollOffset >> 3) + i) & 0x1F) + 4) * 0x20, 9, 0, 0);

    PutFaceChibi(GetUnitPortraitId(unit), gBg0Tm + TM_OFFSET(3, 4), 0x270, 2, 0);

    ClearText(&gPrepItemTexts[30]);

    str = DecodeMsg(unit->pCharacterData->nameTextId);
    x = GetStringTextCenteredPos(40, str);

    PutDrawText(&gPrepItemTexts[30], gBg0Tm + TM_OFFSET(8, 4), TEXT_COLOR_SYSTEM_WHITE, x, 0, str);

    PutSpecialChar(gBg0Tm + TM_OFFSET(8, 6), TEXT_COLOR_SYSTEM_GOLD, 0x24);
    PutSpecialChar(gBg0Tm + TM_OFFSET(9, 6), TEXT_COLOR_SYSTEM_GOLD, 0x25);
    PutSpecialChar(gBg0Tm + TM_OFFSET(12, 6), TEXT_COLOR_SYSTEM_GOLD, 0x1D);

    PutNumberOrBlank(gBg0Tm + TM_OFFSET(11, 6), TEXT_COLOR_SYSTEM_BLUE, unit->level);
    PutNumberOrBlank(gBg0Tm + TM_OFFSET(14, 6), TEXT_COLOR_SYSTEM_BLUE, unit->exp);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}
void sub_0809210C(struct PrepItemScreenProc * proc)
{
    TmFillRect(gBg0Tm + TM_OFFSET(15, 9), 12, 20, 0);

    sub_08091944(0x6000, 5);
    sub_08091994(0x3000, 10);
    sub_08092010(proc);

    if (sub_08092C34(((proc->selectedUnitIdx % 3) * 64) + 20, ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->scrollOffset))
        BlockUiCursorHand();
    else
        UnblockUiCursorHand();

    sub_08091914();

    EnableBgSync(BG0_SYNC_BIT);
}
void sub_0809218C(struct PrepItemScreenProc * proc)
{
    sub_08091F04(proc, gBg0Tm + TM_OFFSET(18, 9), GetUnitFromPrepList(proc->selectedUnitIdx));
    StartParallelWorker(sub_080918F4, proc);
    StartHelpPromptSprite(201, 123, proc);

    ShowSysHandCursor((proc->popupPromptIdx & 1) * 32 + 136, (proc->popupPromptIdx >> 1) * 16 + 84, 3, 0x400);

    EnableBgSync(BG0_SYNC_BIT);
}
void sub_080921E8(struct PrepItemScreenProc * proc)
{
    struct Unit * unit = GetUnitFromPrepList(proc->selectedUnitIdx);

    sub_08092ED4(proc, 0);
    sub_080929D0(&gPrepItemTexts[15], gBg0Tm + TM_OFFSET(2, 9), unit, 0);

    EnableBgSync(BG2_SYNC_BIT);
}
void sub_08092220(struct PrepItemScreenProc * proc)
{
    int previous = proc->popupPromptIdx;

    if (proc->helpboxActiveIdx == 0xff)
    {
        if (gpKeySt->pressed & R_BUTTON)
        {
            proc->helpboxActiveIdx = previous;
            StartHelpBox(
                (proc->popupPromptIdx & 1) * 32 + 136, (proc->popupPromptIdx >> 1) * 16 + 84,
                gHelpTextIds_PrepItemScreen[proc->popupPromptIdx]);
            return;
        }

        if (gpKeySt->pressed & A_BUTTON)
        {
            switch (previous)
            {
            case 0:
                if (PrepGetUnitAmount() < 2)
                    break;

                Proc_Goto(proc, 4);
                PlaySoundEffect(0x38A);
                return;

            case 1:
                if (PrepGetUnitAmount() < 2)
                    break;

                Proc_Goto(proc, 8);
                PlaySoundEffect(0x38A);
                return;

            case 2:
                if (!CanUnitPrepScreenUse(GetUnitFromPrepList(proc->selectedUnitIdx)))
                    break;

                Proc_Goto(proc, 9);
                PlaySoundEffect(0x38A);
                return;

            case 3:
                if (!proc->hasConvoyAccess)
                    break;

                if (GetUnitItemCount(GetUnitFromPrepList(proc->selectedUnitIdx)) < 1)
                    break;

                if (CheckInLinkArena())
                    break;

                Proc_Goto(proc, 11);
                PlaySoundEffect(0x38A);
                return;

            case 4:
                if (!proc->hasConvoyAccess)
                    break;

                Proc_Goto(proc, 10);
                PlaySoundEffect(0x38A);
                return;

            case 5:
                if (CheckInLinkArena() && (!(GetUnitFromPrepList(proc->selectedUnitIdx)->state & US_NOT_DEPLOYED)))
                {
                    StartPrepErrorHelpbox(-1, -1, 0x3AE, proc);
                    return;
                }

                if (!proc->hasConvoyAccess)
                    break;

                if (PrepItemScreen_GiveAll(GetUnitFromPrepList(proc->selectedUnitIdx)) == 0)
                    break;

                sub_08091F04(proc, gBg0Tm + TM_OFFSET(18, 9), GetUnitFromPrepList(proc->selectedUnitIdx));
                sub_080929D0(&gPrepItemTexts[15], gBg0Tm + TM_OFFSET(2, 9), GetUnitFromPrepList(proc->selectedUnitIdx), 0);
                EnableBgSync(BG0_SYNC_BIT);

                PlaySoundEffect(0x38A);
                return;
            }

            PlaySoundEffect(0x38C);
            return;
        }

        if (gpKeySt->pressed & B_BUTTON)
        {
            proc->hoverUnitIdx = proc->selectedUnitIdx;
            proc->selectedUnitIdx = 0xff;
            DisableUiCursorHand(0);
            PlaySoundEffect(0x38B);
            Proc_Goto(proc, 0);
            return;
        }
    }
    else if (gpKeySt->pressed & (B_BUTTON | R_BUTTON))
    {
        CloseHelpBox();
        proc->helpboxActiveIdx = 0xff;
    }

    if (gpKeySt->repeated & DPAD_LEFT)
    {
        if ((proc->popupPromptIdx & 1) != 0)
            proc->popupPromptIdx--;
        else if (gpKeySt->pressed & DPAD_LEFT)
            proc->popupPromptIdx++;
    }

    if (gpKeySt->repeated & DPAD_RIGHT)
    {
        if ((proc->popupPromptIdx & 1) == 0)
            proc->popupPromptIdx++;
        else if (gpKeySt->pressed & DPAD_RIGHT)
            proc->popupPromptIdx--;
    }

    if (gpKeySt->repeated & DPAD_UP)
    {
        if (proc->popupPromptIdx >= 2)
            proc->popupPromptIdx -= 2;
        else if (gpKeySt->pressed & DPAD_UP)
            proc->popupPromptIdx += 4;
    }

    if (gpKeySt->repeated & DPAD_DOWN)
    {
        if (proc->popupPromptIdx < 4)
            proc->popupPromptIdx += 2;
        else if (gpKeySt->pressed & DPAD_DOWN)
            proc->popupPromptIdx -= 4;
    }

    if (previous == proc->popupPromptIdx)
        return;

    PlaySoundEffect(0x385);

    ShowSysHandCursor((proc->popupPromptIdx & 1) * 32 + 136, (proc->popupPromptIdx >> 1) * 16 + 84, 3, 0x400);

    if (proc->helpboxActiveIdx == 0xff)
        return;

    StartHelpBox(
        (proc->popupPromptIdx & 1) * 32 + 136, (proc->popupPromptIdx >> 1) * 16 + 84,
        gHelpTextIds_PrepItemScreen[proc->popupPromptIdx]);
}
void sub_08092578(struct PrepItemScreenProc * proc)
{
    TmFill(GetBgTilemap(0), 0);

    sub_080929D0(&gPrepItemTexts[15], gBg0Tm + TM_OFFSET(2, 9), GetUnitFromPrepList(proc->selectedUnitIdx), 0);
    sub_080929D0(&gPrepItemTexts[20], gBg0Tm + TM_OFFSET(15, 9), GetUnitFromPrepList(proc->hoverUnitIdx), 0);

    EnableBgSync(BG0_SYNC_BIT);
}
void sub_080925D0(struct PrepItemScreenProc * proc)
{
    TmFill(GetBgTilemap(1), 0);
    TmFill(GetBgTilemap(2), 0);

    TmFillRect(gBg0Tm, 31, 8, 0);

    sub_08091944(0x6000, 5);
    sub_08091994(0x3000, 10);

    PutCompressedTsa(gBg1Tm, Tsa_08407270, 0x5300);

    proc->unitSelected = 0;

    ShowSysHandCursor(
        ((proc->hoverUnitIdx % 3) * 64) + 24, ((proc->hoverUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 7, 0x800);
    sub_08092ED4(proc, 0);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    UpdatePrepItemScreenFace(0, GetUnitFromPrepList(proc->selectedUnitIdx), 68, 78, 0x503);
    UpdatePrepItemScreenFace(1, GetUnitFromPrepList(proc->hoverUnitIdx), 172, 78, 0x502);

    SetUiCursorHandConfig(
        0, ((proc->selectedUnitIdx % 3) * 64) + 24, ((proc->selectedUnitIdx / 3) * 16) + 4 - proc->scrollOffset, 2);

    StartParallelFiniteLoop(sub_08092578, 1, proc);

    UnblockUiCursorHand();
    EndHelpPromptSprite();
}
void sub_080926F8(struct PrepItemScreenProc * proc)
{
    sub_08091914();
    EnableBgSync(BG0_SYNC_BIT);
}
void PrepItemScreen_Loop_MainKeyHandler(struct PrepItemScreenProc * proc)
{
    int tmp = proc->scrollOffset;

    if (!(tmp & 15))
    {
        if (gpKeySt->pressed & R_BUTTON)
        {
            Proc_Break(proc);
            return;
        }

        if (gpKeySt->pressed & A_BUTTON)
        {
            int itemCountA = GetUnitItemCount(GetUnitFromPrepList(proc->hoverUnitIdx));
            int itemCountB = GetUnitItemCount(GetUnitFromPrepList(proc->selectedUnitIdx));

            if ((proc->hoverUnitIdx != proc->selectedUnitIdx) && ((itemCountA > 0) || (itemCountB > 0)))
            {
                Proc_Goto(proc, 6);
                PlaySoundEffect(0x38A);
                return;
            }

            PlaySoundEffect(0x38C);
            return;
        }

        if (gpKeySt->pressed & B_BUTTON)
        {
            EndPrepItemScreenFace(1);
            Proc_Goto(proc, 2);
            PlaySoundEffect(0x38B);
            return;
        }

        if (sub_08091AD8(proc) != 0)
        {
            UpdatePrepItemScreenFace(1, GetUnitFromPrepList(proc->hoverUnitIdx), 172, 78, 0x502);
            sub_080929D0(&gPrepItemTexts[20], gBg0Tm + TM_OFFSET(15, 9), GetUnitFromPrepList(proc->hoverUnitIdx), 2);
            sub_080929D0(&gPrepItemTexts[15], gBg0Tm + TM_OFFSET(2, 9), GetUnitFromPrepList(proc->selectedUnitIdx), 1);
            EnableBgSync(BG0_SYNC_BIT);
        }
    }

    sub_08091C48(proc);
}
void StartPrepItemTradeScreen(struct PrepItemScreenProc * proc)
{
    PrepItemScreen_OnEnd(proc);

    StartPrepItemTradeScreenProc(
        GetUnitFromPrepList(proc->selectedUnitIdx), GetUnitFromPrepList(proc->hoverUnitIdx), proc);
}
void sub_0809288C(struct PrepItemScreenProc * proc)
{
    StartPrepItemUseScreen(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
}
void sub_080928A4(struct PrepItemScreenProc * proc)
{
    StartPrepItemSupplyProc(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
}
void StartPrepArmory(struct PrepItemScreenProc * proc)
{
    StartWorldMapSellScreen(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
}
void sub_080928D4(struct PrepItemScreenProc * proc)
{
    StartPrepItemListScreenProc(GetUnitFromPrepList(proc->selectedUnitIdx), proc);
}
void UpdatePrepItemScreenFace(int slot, struct Unit * unit, u16 x, u16 y, u16 disp)
{
    struct PrepItemScreenProc * proc = Proc_Find(ProcScr_PrepItemScreen);

    if (proc->pUnits[slot] != unit)
    {
        if (proc->pUnits[slot] != NULL)
            EndFaceById(slot);

        if (unit != NULL)
            StartBmFace(slot, GetUnitPortraitId(unit), (s16)x, (s16)y, disp);
    }
    else
    {
        if (unit != NULL)
        {
            SetFacePosition(slot, (s16)x, (s16)y);
            SetFaceDispById(slot, disp);
        }
    }

    proc->pUnits[slot] = unit;

    proc->xFacePosBySlot[slot] = x;
    proc->yFacePosBySlot[slot] = y;
    proc->faceDispBySlot[slot] = disp;
}
void EndPrepItemScreenFace(int slot)
{
    UpdatePrepItemScreenFace(slot, NULL, 0, 0, 0);
}
ProcPtr StartPrepItemScreen(ProcPtr parent)
{
    return Proc_StartBlocking(ProcScr_PrepItemScreen, parent);
}
void sub_080929D0(struct Text * text, u16 * tm, struct Unit * unit, u16 flags)
{
    int itemCount;
    int i;

    TmFillRect(tm, 12, 20, 0);

    if (flags & 2)
        ClearIcons();

    if (unit == NULL)
        return;

    itemCount = GetUnitItemCount(unit);

    for (i = 0; i < itemCount; text++, i++)
    {
        u16 item = unit->items[i];

        int isUnusable = (flags & 4) ? !CanUnitUseItemPrepScreen(unit, item) : !IsItemDisplayUsable(unit, item);

        if (!(flags & 1))
        {
            ClearText(text);
            Text_SetColor(text, isUnusable);
            Text_SetCursor(text, 0);
            Text_DrawString(text, GetItemName(item));
        }

        PutIcon(tm + TM_OFFSET(1, i * 2), GetItemIconId(item), 0x4000);

        PutText(text, tm + TM_OFFSET(3, i * 2));
        PutNumberOrBlank(
            tm + TM_OFFSET(12, i * 2), !isUnusable ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY,
            GetItemUses(item));
    }
}
void sub_08092AE4(struct PrepItemScreenProc * proc)
{
    int hoverRow = proc->hoverUnitIdx / 3;
    int hoverYPos = hoverRow * 16;
    int yMax = ((PrepGetUnitAmount() - 1) / 3) * 16;
    int yDiff = hoverYPos - proc->scrollOffset;

    if (yDiff > 32)
    {
        if (hoverYPos == yMax)
            proc->scrollOffset = hoverYPos - 48;
        else
            proc->scrollOffset = hoverYPos - 32;
    }
    else if (yDiff < 16)
    {
        if (hoverYPos == 0)
            proc->scrollOffset = hoverYPos;
        else
            proc->scrollOffset = hoverYPos - 16;
    }

    SetBgOffset(2, -40, (proc->scrollOffset - 4) & 0xff);
    UpdateMenuScrollBarConfig(6, proc->scrollOffset, ((PrepGetUnitAmount() - 1) / 3) + 1, 4);
}
void sub_08092B6C(struct PrepItemScreenProc * proc, u8 row, s8 flag)
{
    int i;
    int idx;
    struct Text * text;

    idx = row * 3;
    text = &gPrepItemTexts[idx % 15];

    for (i = 0; i < 3; text++, i++)
    {
        int x;
        int y;

        if (flag == 0)
            ClearText(text);

        if (idx + i >= PrepGetUnitAmount())
            continue;

        x = (i % 3) * 8;
        y = (row * 2) & 31;

        if (flag == 0)
        {
            struct Unit * unit = GetUnitFromPrepList(idx + i);

            Text_SetCursor(text, 0);
            Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
            Text_DrawString(text, DecodeMsg(unit->pCharacterData->nameTextId));
        }

        PutText(text, gBg2Tm + TM_OFFSET(x, y));
    }

    EnableBgSync(BG2_SYNC_BIT);
}
bool sub_08092C34(u32 x, int y)
{
    if ((x < 97) && (y > 31))
        return TRUE;

    return FALSE;
}
void PrepItem_DrawSMS(struct PrepItemScreenProc * proc)
{
    int i;

    for (i = 0; i < PrepGetUnitAmount(); i++)
    {
        int x = (i % 3) * 64;
        u32 y = (i / 3) * 16 - proc->scrollOffset;

        if (y + 20 > 68)
            continue;

        if (proc->unitSelected && sub_08092C34(x, y))
            continue;

        PutUnitSprite(0, (x + 24), (y + 4) & 0xff, GetUnitFromPrepList(i));
    }

    SyncUnitSpriteSheet();
}
void PrepItemDrawPopupBox(int x, int y, int w, int h, int oam2)
{
    int i;
    int j;

    if ((w <= 0) || (h <= 0))
        return;

    PutSpriteExt(4, x, y, Sprite_8x8, oam2);
    PutSpriteExt(4, x + w * 8 + 0x1000, y, Sprite_8x8, oam2);
    PutSpriteExt(4, x + w * 8 + 0x3000, y + h * 8, Sprite_8x8, oam2);
    PutSpriteExt(4, x + 0x2000, y + h * 8, Sprite_8x8, oam2);

    for (j = 1; j < (w - 1); j += 2)
    {
        PutSpriteExt(4, x + j * 8, y, Sprite_16x8, oam2 + 1);
        PutSpriteExt(4, x + j * 8 + 0x2000, y + h * 8, Sprite_16x8, oam2 + 1);
    }

    for (; j < w; j++)
    {
        PutSpriteExt(4, x + j * 8, y, Sprite_8x8, oam2 + 1);
        PutSpriteExt(4, x + j * 8 + 0x2000, y + h * 8, Sprite_8x8, oam2 + 1);
    }

    for (i = 1; i < h; i++)
    {
        PutSpriteExt(4, x, y + i * 8, Sprite_8x8, oam2 + 3);
        PutSpriteExt(4, x + w * 8 + 0x1000, y + i * 8, Sprite_8x8, oam2 + 3);
    }

    for (i = 1; i < h; i++)
    {
        for (j = 1; j < w - 3; j += 4)
            PutSpriteExt(4, x + 8 * j, y + i * 8, Sprite_32x8, oam2 + 4);

        for (; j < w - 1; j += 2)
            PutSpriteExt(4, x + 8 * j, y + i * 8, Sprite_16x8, oam2 + 4);

        for (; j < w; j++)
            PutSpriteExt(4, x + 8 * j, y + i * 8, Sprite_8x8, oam2 + 4);
    }
}
void sub_08092ED4(struct PrepItemScreenProc * proc, u8 flag)
{
    int i;

    for (i = (proc->scrollOffset >> 4); i < (proc->scrollOffset >> 4) + 4; i++)
        sub_08092B6C(proc, i, flag);
}
bool PrepItemScreen_GiveAll(struct Unit * unit)
{
    int i;

    int unitItemCount = GetUnitItemCount(unit);
    int convoyItemCount = GetConvoyItemCount_();

    for (i = 0; (i < unitItemCount) && (i + convoyItemCount < 100); i++)
    {
        AddItemToConvoy(unit->items[0]);
        UnitRemoveItem(unit, 0);
    }

    if (i > 0)
        return TRUE;

    return FALSE;
}
