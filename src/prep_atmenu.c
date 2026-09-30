#include "gbafe.h"
#include "gbafe/cgtext.h"

void PutCompressedTsa(u16 * tm, void const * src, u16 tileref); // Decompress to gGenericBuffer, then TmApplyTsa

void ShowPrepScreenMenuFrozenHand(void);
void StartChapterStatusScreen_FromPrep(ProcPtr parent);
void StartFortuneSubMenu(int kind, ProcPtr parent);
void SyncUnitDeploymentState(void);
void sub_0807CC38(ProcPtr proc);
void sub_0803DA24(void);
void EndPrepScreen(void);
void ReorderPlayerUnitsBasedOnDeployment(void);

struct ProcAtUnkMenu {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ u16 unk4C;
    /* 4E */ STRUCT_PAD(0x4E, 0x58);
    /* 58 */ int unk58;
    /* 5C */ int unk5C;
    /* 60 */ STRUCT_PAD(0x60, 0x64);
    /* 64 */ u16 unk64;
};
PROC_SIZE_CHECK(struct ProcAtUnkMenu);


struct ProcPrepPromote {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 game_lock;
};
PROC_SIZE_CHECK(struct ProcPrepPromote);

void GenerateItemPromotionBattle(struct Unit * unit, int itemIdx, s8 unk);
void BeginBattleAnimations(void);

extern int CONST_DATA gAtSubMenuMsgs[];
extern u8 CONST_DATA Tsa_PrepMenuFrame[];
extern struct ProcCmd CONST_DATA ProcScr_PrepUnitScreen[];

struct ProcCmd CONST_DATA ProcScr_PrepMenuDescHandler[] = {
    PROC_CALL(PrepMenuDescOnInit),
    PROC_SLEEP(1),
    PROC_CALL(sub_0808E60C),
    PROC_YIELD,
    PROC_CALL(PrepMenuDescOnParse),
    PROC_YIELD,
    PROC_CALL(PrepMenuDescOnDraw),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_AtMenu[] = {
    PROC_19,
    PROC_CALL(AtMenu_LockGame),
    PROC_CALL(EndPrepAtMenuIfNoUnitAvailable),
    PROC_CALL(PrepAtMenu_OnInit),
    PROC_SLEEP(2),
    PROC_CALL(AtMenu_Reinitialize),
    PROC_SLEEP(2),
PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),
    PROC_WHILE(MusicProc4Exists),
PROC_LABEL(1),
    PROC_CALL(EnablePrepScreenMenu),
    PROC_REPEAT(AtMenu_UpdateDesc),
    PROC_GOTO(4),
PROC_LABEL(12),
    PROC_CALL(AtMenu_SetupCtrlUI),
    PROC_REPEAT(AtMenu_CtrlLoop),
    PROC_GOTO(1),
PROC_LABEL(13),
    PROC_CALL(AtMenu_Reinitialize),
    PROC_CALL(AtMenu_SetupCtrlUI),
PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),
    PROC_WHILE(MusicProc4Exists),
    PROC_REPEAT(AtMenu_CtrlLoop),
    PROC_GOTO(1),
PROC_LABEL(2),
    PROC_REPEAT(AtMenu_StartSubmenu),
    PROC_REPEAT(AtMenu_OnSubmenuEnd),
    PROC_BLOCK,
PROC_LABEL(10),
PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_GOTO(2),
PROC_LABEL(9),
    PROC_CALL(AtMenu_Reinitialize),
PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(1),
PROC_LABEL(8),
PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),
    PROC_GOTO(2),
PROC_LABEL(7),
    PROC_CALL(AtMenu_Reinitialize),
PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(1),
PROC_LABEL(11),
    PROC_CALL(AtMenuSetUnitStateAndEndFlag),
    PROC_GOTO(5),
PROC_LABEL(4),
    PROC_CALL(AtMenuSetUnitStateAndEndFlag),
    PROC_SLEEP(10),
PROC_LABEL(5),
PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),
    PROC_SLEEP(1),
PROC_LABEL(6),
    PROC_CALL(AtMenu_ResetScreenEffect),
    PROC_YIELD,
    PROC_CALL(AtMenu_ResetBmUiEffect),
    PROC_YIELD,
    PROC_CALL(EndAllMus),
    PROC_CALL(AtMenu_UnlockGame),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_PrepPromoteDebug[] = {
    PROC_WHILE(MusicProc4Exists),
    PROC_CALL(ConvoyPromotion_Init),
    PROC_REPEAT(IsGameLockLevelReserved),
    PROC_SLEEP(8),
    PROC_CALL(NullExpForChar100AndResetScreen),
    PROC_SLEEP(30),
    PROC_WHILE(MusicProc4Exists),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_AtUnkMenu[] = {
    PROC_CALL(AtMenu_LockGame),
    PROC_YIELD,
    PROC_CALL(AtUnkMenu_Reinitialize),
    PROC_YIELD,
    PROC_CALL(sub_0808F36C),
PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),
    PROC_CALL(sub_0808F3B8),
PROC_LABEL(0),
    PROC_CALL(sub_0808F3D0),
    PROC_WHILE(CgTextExists),
    PROC_SLEEP(8),
PROC_LABEL(1),
    PROC_CALL(sub_0808F43C),
    PROC_WHILE(CgTextExists),
    PROC_SLEEP(8),
PROC_LABEL(2),
    PROC_CALL(sub_0808F4A8),
    PROC_WHILE(CgTextExists),
    PROC_SLEEP(8),
PROC_LABEL(3),
    PROC_CALL(sub_0808F52C),
    PROC_WHILE(CgTextExists),
    PROC_CALL(sub_0808F7A8),
PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepPromoteDebugMaybe),
    PROC_SLEEP(8),
    PROC_GOTO(200),
PROC_LABEL(10),
    PROC_CALL(sub_0808F598),
PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),
    PROC_GOTO(200),
PROC_LABEL(100),
PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
PROC_LABEL(200),
    PROC_CALL(sub_0808F5A0),
    PROC_CALL(AtMenu_UnlockGame),
    PROC_END,
};

void PrepRestartMuralBackground(void)
{
    if (CheckInLinkArena())
        StartMuralBackgroundAlt(NULL, NULL, 10);
    else
        StartPrepMuralBackground(NULL, 10);
}

void EndMuralBackground_(void)
{
    if (CheckInLinkArena())
        EndMuralBackground();
    else
        EndPrepMuralBackground();
}

void Prep_DrawChapterGoal(int vram_offset, int pal_bank)
{
    int msg;
    const char *str;
    struct Font font;
    struct Text th;

    InitSpriteTextFont(&font, OBJ_VRAM0 + vram_offset, pal_bank);
    ApplyPalette(Pal_Text, 0x10 + pal_bank);
    InitSpriteText(&th);
    SetTextFont(&font);
    SetTextFontGlyphs(0);
    SpriteText_DrawBackgroundExt(&th, 0);

    /* FE7U: goal window text id is at +0x8E of ChapterInfo (JP: +0x8A) */
#if NONMATCHING
    msg = GetChapterInfo(gPlaySt.chapterIndex)->goalWindowTextId; // (a host's layout differs)
#else
    msg = *(u16 *)((u8 *)GetChapterInfo(gPlaySt.chapterIndex) + 0x8E);
#endif
    str = DecodeMsg(msg);

    Text_InsertDrawString(
        &th,
        GetStringTextCenteredPos(0x60, str),
        0, str);

    SetTextFont(NULL);
}

void PrepAtMenu_OnInit(struct ProcAtMenu *proc)
{
	PrepSetLatestCharId(0);
	proc->xDiff = 0;
	*((u16*)&proc->yDiff) = 0;

    if (CheckInLinkArena())
        proc->max_counter = 5;
    else
        proc->max_counter = GetChapterAllyUnitCount();

    proc->unk_30 = 0;
    proc->unk_31 = 0;
    proc->unk_32 = 0;
    proc->state = 0;
    proc->do_help = 0;
    proc->end_prep = 0;
    proc->cur_cmd = 0;
    proc->hand_pos = 0;
}

void ResetPrepMenuDescTexts(void)
{
    int i = 0;

    for (i = 0; i < 5; i++)
        ClearText(&gPrepMainMenuTexts[i + 5]);

    TmFillRect(
        gBg2Tm + TM_OFFSET(0xE, 0x6),
        0xF, 0xA, 0);

    EnableBgSync(BG2_SYNC_BIT);
}

void ParsePrepMenuDescTexts(int msg)
{
    struct Text *th = &gPrepMainMenuTexts[5];
    const char *str = DecodeMsg(msg);

    while (1) {
        if ('\0' == *str)        /* End for fetext */
            return;

        if ('\1' == *str) {      /* '\n' for fetext */
            th++;
            str++;
            continue;
        }

        str = Text_DrawCharacter(th, str);
    }
}

void DrawPrepMenuDescTexts()
{
    int i;

    for (i = 0; i < 5; i++)
        PutText(
            &gPrepMainMenuTexts[i + 5],
            gBg2Tm + TM_OFFSET(0xE, 2 * i + 6));

    EnableBgSync(BG2_SYNC_BIT);
}

void PrepMenuDescOnInit(struct ProcPrepMenuDesc * proc)
{
    proc->unk4C = 0;
    ResetPrepMenuDescTexts();
}

void sub_0808E60C(struct ProcPrepMenuDesc * proc)
{
    DecodeMsg(proc->msg);
}

void PrepMenuDescOnParse(struct ProcPrepMenuDesc * proc)
{
    ParsePrepMenuDescTexts(proc->msg);
}

void PrepMenuDescOnDraw(void)
{
    DrawPrepMenuDescTexts();
}

void StartPrepMenuDescHandler(int msg, ProcPtr parent)
{
    struct ProcPrepMenuDesc * proc;

    proc = Proc_Find(ProcScr_PrepMenuDescHandler);
    if (proc)
        Proc_End(proc);
    
    proc = Proc_Start(ProcScr_PrepMenuDescHandler, parent);
    proc->msg = msg;
}

void StartPrepAtSubMenuUI(struct ProcAtMenu * proc)
{
    EndSysBlackBoxs();
    EndPrepSpecialCharEffect();
    EndMuralBackground_();
    proc->cur_cmd = GetActivePrepMenuItemIndex();
    EndPrepScreenMenu();
}

void DrawAtMenuUpfx(int tile, int pal)
{
    /* "Cahpter 0", "Infomaion" */
    Decompress(Img_PrepAtMenuUpfx, OBJ_VRAM0 + tile);
    ApplyPalette(Pal_PrepAtMenuUpfx, pal + 0x10);

	CpuFastFill(0, PAL_OBJ(0) + PAL_OFFSET(pal + 1), 0x20);
}

void AtMenu_Reinitialize(struct ProcAtMenu * proc)
{
    int i;

	InitBgs(gBgConfig_PrepScreen);
	ResetText();
	UnpackUiWindowFrameGraphics();
	LoadHelpBoxGfx(NULL, 0xE);
	SetDispEnable(0, 0, 0, 0, 0);
	ApplySystemObjectsGraphics();
	ResetUnitSprites();
	MakePrepUnitList();
    PrepAutoCapDeployUnits(proc);
    ReorderPlayerUnitsBasedOnDeployment();

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);

    for (i = 0; i < 5; i++)
        InitText(&gPrepMainMenuTexts[i + 5], 0xE);
    for (i = 0; i < 4; i++)
        InitText(&gPrepMainMenuTexts[i + 1], 0x8);
	InitText(&gPrepMainMenuTexts[0], 10);

    /* "Preparations" */
    Decompress(Img_PrepScreenTitle, OBJ_VRAM0 + 0x4800);

#if (PROJECT == FE7)
    ApplyPalettes(Pal_SysBrownBox, 0x12, 2);
#elif (PROJECT == FE8)
    ApplyPalettes(Pal_SysBrownBox, 0x19, 2);
#endif

	DrawAtMenuUpfx(0x7000, 0x06);

    /* "Menu", "Start" button */
    Decompress(Img_PrepScreenTitleSprites, OBJ_VRAM0 + 0x6000);
    ApplyPalette(Pal_PrepScreenTitleSprites, 0x14);

    EnablePalSync();

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg3_ct.priority = 3;

	SetWinEnable(0, 0, 0);

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);

    InitPrepScreenMainMenu(proc);
    EnableBgSync(0xF);

#if (PROJECT == FE7)
    SetBlendAlpha(0xE, 0x8);
	SetBlendTargetA(0, 0, 0, 0, 0);
	SetBlendTargetB(0, 0, 0, 1, 0);
#elif (PROJECT == FE8)
	SetBlendNone();
#endif

	StartPrepSpecialCharEffect(proc);
	PrepRestartMuralBackground();

	ApplyPalette(Pal_08404BBC, 3);
	Decompress(Img_08404BDC, (void *)(BG_VRAM + 0x7800));
	PutCompressedTsa(gBg1Tm + TM_OFFSET(0xC, 0x4), Tsa_PrepMenuFrame, OAM2_PAL(3) + OAM2_CHR(0x7800 / 0x20));

#if (PROJECT == FE7)
	Prep_DrawChapterGoal(0x5000, 0xB);
#elif (PROJECT == FE8)
	Prep_DrawChapterGoal(0x5800, 0xB);
#endif

	NewSysBlackBoxHandler(proc);
	SysBlackBoxSetGfx(0x6800);

#if (PROJECT == FE7)
	EnableSysBlackBox(0, 4, 0x480, 11, 3, 0xC00);
#endif

    proc->unk_35 = GetActivePrepMenuItemIndex();
    ParsePrepMenuDescTexts(GetPrepMainMenuInfoxMsg());
    DrawPrepMenuDescTexts();
}

void EndPrepAtMenuIfNoUnitAvailable(struct ProcAtMenu * proc)
{
    int i;
    u8 counter = 0;

    SetDispEnable(0, 0, 0, 0, 0);

    for (i = 1; i < 64; i++) {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (IsUnitInCurrentRoster(unit))
            counter++;
    }

    if (0 == counter) {
        proc->end_prep = TRUE;
        Proc_Goto(proc, 6);
    }
}

void AtMenu_UpdateDesc(struct ProcAtMenu * proc)
{
    int val = GetActivePrepMenuItemIndex();

    if (proc->unk_35 != val)
    {
        StartPrepMenuDescHandler(GetPrepMainMenuInfoxMsg(), proc);
        proc->unk_35 = val;
    }
}

void AtMenu_DrawSubmenuTexts(struct ProcAtMenu * proc)
{
    int i, mask, tile;

    struct Text * th = &gPrepMainMenuTexts[1];
    int height = GetPrepOptionCount(proc->cmd_mask);
    DrawUiFrame2(5, 6, 9, 2 * height + 2, 1);

    i = 0;
    tile = 0x1C0;

    for (; i < 4; i++)
    {
        mask = proc->cmd_mask >> i;

        if (1 & mask)
        {
            ClearText(th);
            PutDrawText(th, (void *) (gBg0Tm + TM_OFFSET(6, 0)) + tile, TEXT_COLOR_SYSTEM_WHITE, 0, 0, DecodeMsg(gAtSubMenuMsgs[i]));

            th++;
            tile += 0x80;
        }
    }

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void CleanupPrepMenuScreen(ProcPtr proc)
{
    TmFillRect(gBg0Tm + TM_OFFSET(5, 6), 8, 9, 0);
    TmFillRect(gBg1Tm + TM_OFFSET(5, 6), 8, 9, 0);
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void AtMenu_SetupCtrlUI(struct ProcAtMenu * proc)
{
    ShowPrepScreenMenuFrozenHand();
    AtMenu_DrawSubmenuTexts(proc);
    ShowSysHandCursor(0x2C, proc->hand_pos * 16 + 0x38, 7, 0x400);
}

void AtMenu_CtrlLoop(struct ProcAtMenu * proc)
{
    const int msg_list[] = {
        0x378,
        0x37B,
        0x379,
        0x37A,
    };

    int line_old = proc->hand_pos;

    int xPos = 0x2C;
    int yPos = proc->hand_pos * 16 + 0x38;

    if (proc->do_help)
    {
        if ((R_BUTTON | B_BUTTON) & gpKeySt->pressed)
        {
            CloseHelpBox();
            proc->do_help = 0;
            return;
        }
    }
    else
    {
        if (A_BUTTON & gpKeySt->pressed)
        {
            PlaySoundEffect(0x38A);

            if (3 == PrepOptionCountToRealIndexByMask(proc->hand_pos, proc->cmd_mask))
                CallSomeSoundMaybe(0x5E, 0x100, 0x100, 0x20, NULL);

            proc->state = 4;
            Proc_Goto(proc, 8);
            return;
        }

        if (R_BUTTON & gpKeySt->pressed)
        {
            proc->do_help = 1;
            StartHelpBox(xPos, yPos, msg_list[PrepOptionCountToRealIndexByMask(proc->hand_pos, proc->cmd_mask)]);
            return;
        }

        if (B_BUTTON & gpKeySt->pressed)
        {
            CleanupPrepMenuScreen(proc);
            PutCompressedTsa(gBg1Tm + TM_OFFSET(12, 4), Tsa_PrepMenuFrame, 0x33C0);
            DrawPrepScreenMenuFrameAt(1, 4);
            PlaySoundEffect(0x38B);
            Proc_Break(proc);
            return;
        }
    }

    if (DPAD_UP & gpKeySt->repeated)
    {
        if (proc->hand_pos)
            proc->hand_pos = proc->hand_pos - 1;
        else if (DPAD_UP & gpKeySt->pressed)
            proc->hand_pos = GetPrepOptionCount(proc->cmd_mask) - 1;
    }

    if (DPAD_DOWN & gpKeySt->repeated)
    {
        if (proc->hand_pos < (GetPrepOptionCount(proc->cmd_mask) - 1))
            proc->hand_pos = proc->hand_pos + 1;
        else if (DPAD_DOWN & gpKeySt->pressed)
            proc->hand_pos = 0;
    }

    if (line_old != proc->hand_pos)
    {
        yPos = proc->hand_pos * 16 + 0x38;

        if (proc->do_help)
            StartHelpBox(xPos, yPos, msg_list[PrepOptionCountToRealIndexByMask(proc->hand_pos, proc->cmd_mask)]);

        ShowSysHandCursor(xPos, yPos, 7, 0x400);
        PlaySoundEffect(0x386);
    }
}

void AtMenuSetUnitStateAndEndFlag(struct ProcAtMenu * proc)
{
    int i;
    struct Unit * unit;

    for (i = 1; i < 64; i++)
    {
        unit = GetUnit(i);

        if (!(UNIT_IS_VALID(unit)))
            continue;

        unit->state &= ~US_BIT25;
    }

    proc->end_prep = 1;
}

void AtMenu_ResetScreenEffect(struct ProcAtMenu * proc)
{
    EndAllProcChildren(proc);
    EndMuralBackground_();
    EndPrepSpecialCharEffect();
    InitBgs(NULL);
    SetBlendConfig(3, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);

    if (proc->end_prep)
        sub_0807CC38(proc);
}

void AtMenu_ResetBmUiEffect(struct ProcAtMenu * proc)
{
    ReorderPlayerUnitsBasedOnDeployment();

    if (proc->end_prep)
        EndPrepScreen();
    else if (CheckInLinkArena())
        sub_0803DA24();

    SyncUnitDeploymentState();
    ResetUnitSprites();
    RefreshEntityMaps();
    RefreshUnitSprites();
}

void AtMenu_StartSubmenu(struct ProcAtMenu * proc)
{
    StartPrepAtSubMenuUI(proc);

    switch (proc->state)
    {
    case 5:
        StartChapterStatusScreen_FromPrep(proc);
        break;

    case 2:
        StartPrepItemScreen(proc);
        break;

    case 1:
        Proc_StartBlocking(ProcScr_PrepUnitScreen, proc);
        break;

    case 4:
        StartFortuneSubMenu(PrepOptionCountToRealIndexByMask(proc->hand_pos, proc->cmd_mask), proc);
        break;

    case 3:
        StartBgmVolumeChange(0x100, 0x80, 0x20, NULL);
        SyncUnitDeploymentState();
        sub_080A4E0C(proc);
        break;
    }

    Proc_Break(proc);
}

void AtMenu_OnSubmenuEnd(struct ProcAtMenu * proc)
{
    if (3 == proc->state)
        StartBgmVolumeChange(0x80, 0x100, 0x20, NULL);

    switch (proc->state)
    {
    case 4:
        Proc_Goto(proc, 0xD);
        break;

    case 3:
        Proc_Goto(proc, 7);
        break;

    case 1:
    case 2:
    case 5:
        Proc_Goto(proc, 9);
        break;
    }

    proc->state = 0;
}

void AtMenu_EnableDisp(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
}

void AtMenu_LockGame(struct ProcAtMenu * proc)
{
    if (!CheckInLinkArena())
    {
        LockGame();
        LockBmDisplay();
    }
}

void AtMenu_UnlockGame(struct ProcAtMenu * proc)
{
    if (!CheckInLinkArena())
    {
        UnlockBmDisplay();
        UnlockGame();
    }
}

void StartPrepAtMenu(void)
{
    Proc_Start(ProcScr_AtMenu, PROC_TREE_3);
}

void StartPrepAtMenuWithConfig(void)
{
    Proc_Start(ProcScr_AtMenu, PROC_TREE_3);
    RemoveSomeUnitItems();
    ResetSioPidPool();
}

// view of ChapterInfo 0x86..0x87 as an array (chapterdata.h declares merchantPosX, merchantPosXInHectorStory)
struct ChapterInfoMerchantView {
    u8 pad[0x86];
    u8 merchantPos[2];
};

bool HasConvoyAccess_(int kind)
{
    int i;

    switch (kind)
    {
    case 0:
        for (i = 1; i < 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (UNIT_IS_VALID(unit) && (UNIT_CATTRIBUTES(unit) & CA_SUPPLY))
                return TRUE;
        }
        break;

    case 1:
        if (CheckInLinkArena())
            break;

        if (((struct ChapterInfoMerchantView const *) GetChapterInfo(gPlaySt.chapterIndex))->merchantPos[gPlaySt.chapterModeIndex == 3 ? 1 : 0] == 0xFF)
            break;

        for (i = 1; i < 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (UNIT_IS_VALID(unit) && (UNIT_CATTRIBUTES(unit) & CA_SUPPLY))
                return TRUE;
        }
        break;
    }

    return FALSE;
}

void sub_0808EF94(struct ProcAtUnkMenu * proc)
{
    int i;

    sub_0808F808(0x70, 4, proc->unk5C, 0x23C0);

    for (i = 0; i < 3; i++)
        PutSpriteExt(4, 0x80 + i * 0x20, 0x14, Sprite_32x16, 0x4680 + i * 4);

    if (proc->unk64 == 1 && (START_BUTTON & gpKeySt->pressed))
    {
        proc->unk64 = 0;
        Proc_Goto(proc, 0x64);
    }
}

bool sub_0808EFFC(void)
{
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (UNIT_IS_VALID(unit) && unit->pCharacterData->number == 0x23)
        {
            if (!(unit->state & US_DEAD))
                return TRUE;

            return FALSE;
        }
    }

    return FALSE;
}

bool sub_0808F034(void)
{
    struct Unit * unit;

    if (gPlaySt.chapterStateBits & 0x80)
        return FALSE;

    if (CheckInLinkArena())
        return FALSE;

    if (!GetChapterInfo(gPlaySt.chapterIndex)->has_prep)
        return FALSE;

    if (((struct ChapterInfoMerchantView const *) GetChapterInfo(gPlaySt.chapterIndex))->merchantPos[gPlaySt.chapterModeIndex == 3 ? 1 : 0] == 0xFF)
        return FALSE;

    unit = GetUnitFromCharId(0x28);

    if (unit == NULL)
        return FALSE;

    if (unit->level == 0x14 && unit->pClassData->number == 0x44)
    {
        ClearFlag(0x90);
        return TRUE;
    }

    return FALSE;
}

void AtUnkMenu_Reinitialize(struct ProcAtMenu * _proc)
{
    struct ProcAtUnkMenu * proc = (void *) _proc;
    int i;

    proc->unk58 = 0;

    switch (gPlaySt.chapterIndex)
    {
    case 0x09:
        if (sub_0808EFFC())
            proc->unk58 = 8;
        break;

    case 0x11:
        if (CheckFlag(0x6A))
        {
            proc->unk58 |= 4;

            if (!(gPlaySt.chapterStateBits & 0x40))
                proc->unk58 |= 1;
        }
        else
        {
            if (!(gPlaySt.chapterStateBits & 0x40))
                proc->unk58 |= 2;
        }
        break;

    case 0x14:
        if (CheckFlag(0x6A))
            proc->unk58 = 0;
        else
            proc->unk58 = 4;
        break;
    }

    if (sub_0808F034())
        proc->unk58 = 0x10;

    if (proc->unk58 == 0)
    {
        Proc_Goto(proc, 200);
        return;
    }

    InitBgs(NULL);
    InitFaces();
    ResetText();
    UnpackUiWindowFrameGraphics();
    ApplySystemObjectsGraphics();

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg3_ct.priority = 3;

    proc->unk5C = GetChapterInfo(gPlaySt.chapterIndex)->prepScreenNumber[gPlaySt.chapterModeIndex == 3 ? 1 : 0];

    DrawUiFrame2(1, 4, 10, 12, 0);

    PutDrawText(NULL, gBg2Tm + TM_OFFSET(3, 5), 0, 0, 8, DecodeMsg(0x113D));
    PutDrawText(NULL, gBg2Tm + TM_OFFSET(3, 7), 0, 0, 8, DecodeMsg(0x113E));
    PutDrawText(NULL, gBg2Tm + TM_OFFSET(3, 9), 0, 0, 8, DecodeMsg(0x1146));
    PutDrawText(NULL, gBg2Tm + TM_OFFSET(3, 11), 0, 0, 8, DecodeMsg(0x1141));
    PutDrawText(NULL, gBg2Tm + TM_OFFSET(3, 13), 0, 0, 8, DecodeMsg(0x1140));

    ApplyPalette(Pal_08404BBC, 0xF);
    Decompress(Img_08404BDC, (void *) (BG_VRAM + 0x5800));
    PutCompressedTsa(gBg1Tm + TM_OFFSET(0xC, 0x4), Tsa_PrepMenuFrame, OAM2_PAL(0xF) + OAM2_CHR(0x5800 / 0x20));

    for (i = 0; i < 5; i++)
        InitText(&gPrepMainMenuTexts[i + 5], 0xE);

    Decompress(Img_PrepScreenTitle, OBJ_VRAM0 + 0x1000);
    ApplyPalettes(Pal_SysBrownBox, 0x1E, 2);

    EnableBgSync(BG1_SYNC_BIT);

    StartPrepMuralBackground(NULL, 8);
    StartSpriteAnimProc(SpriteAnim_084062AC, 0x78, 0x418, 0xEC80, 0, 0xD);

    proc->unk4C = 0;

    InitTalk(0x200, 3, 1);
    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);
    DrawAtMenuUpfx(0x7800, 2);
    Prep_DrawChapterGoal(0x5000, 4);

    if (gPlaySt.chapterModeIndex == 1)
        StartPrepMenuDescHandler(0x3E3, proc);
    else
        StartPrepMenuDescHandler(0x3E4, proc);

    proc->unk64 = 0;
    StartParallelWorker(sub_0808EF94, proc);
}

void sub_0808F36C(struct ProcAtMenu * proc)
{
    SetBlendAlpha(0xE, 0x8);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
}

void sub_0808F3B8(struct ProcAtMenu * _proc)
{
    struct ProcAtUnkMenu * proc = (void *) _proc;

    if (!(proc->unk58 & 0x10))
        proc->unk64 = 1;
}

void sub_0808F3D0(struct ProcAtMenu * _proc)
{
    struct ProcAtUnkMenu * proc = (void *) _proc;

    if (!(proc->unk58 & 8))
    {
        Proc_Goto(proc, 1);
        return;
    }

    ShowSysHandCursor(0x14, 0x28, 6, 0x800);
    StartTalkFace(0x20, 0xD4, 0x50, 0x82, 0);
    StartCgText(0x16, 0x12, -1, -1, 0xFCE, (void *) (VRAM + 0x11800), -1, NULL);
    SetCgTextFlags(0x2000A);
}

void sub_0808F43C(struct ProcAtMenu * _proc)
{
    struct ProcAtUnkMenu * proc = (void *) _proc;

    if (!(proc->unk58 & 4))
    {
        Proc_Goto(proc, 2);
        return;
    }

    ShowSysHandCursor(0x14, 0x38, 6, 0x800);
    StartTalkFace(0x4A, 0xD4, 0x50, 0x82, 0);
    StartCgText(0x16, 0x12, -1, -1, 0xFC6, (void *) (VRAM + 0x11800), -1, NULL);
    SetCgTextFlags(0x2000A);
}

void sub_0808F4A8(struct ProcAtMenu * _proc)
{
    struct ProcAtUnkMenu * proc = (void *) _proc;
    int msg = 0;

    if (!(proc->unk58 & 3))
    {
        Proc_Goto(proc, 3);
        return;
    }

    if (proc->unk58 & 1)
        msg = 0xFC7;

    if (proc->unk58 & 2)
        msg = 0xFC8;

    ShowSysHandCursor(0x14, 0x48, 6, 0x800);
    StartTalkFace(0x4B, 0xD4, 0x50, 0x82, 0);
    StartCgText(0x16, 0x12, -1, -1, msg, (void *) (VRAM + 0x11800), -1, NULL);
    SetCgTextFlags(0x2000A);
}

void sub_0808F52C(struct ProcAtMenu * _proc)
{
    struct ProcAtUnkMenu * proc = (void *) _proc;

    if (!(proc->unk58 & 0x10))
    {
        Proc_Goto(proc, 0xA);
        return;
    }

    ShowSysHandCursor(0x14, 0x28, 6, 0x800);
    StartTalkFace(0x4A, 0xD4, 0x50, 0x82, 0);
    StartCgText(0x16, 0x12, -1, -1, 0xFCD, (void *) (VRAM + 0x11800), -1, NULL);
    SetCgTextFlags(0x2000A);
}

void sub_0808F598(struct ProcAtMenu * _proc)
{
    struct ProcAtUnkMenu * proc = (void *) _proc;

    proc->unk64 = 0;
}

void sub_0808F5A0(struct ProcAtMenu * proc)
{
    EndCgText();
    ClearTalk();
    EndEachSpriteAnimProc();
    EndPrepMuralBackground();

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    SetBlendDarken(16);
    SetBlendTargetA(1, 1, 1, 1, 1);
}

void ConvoyPromotion_Init(ProcPtr _proc)
{
    struct ProcPrepPromote * proc = _proc;
    struct Unit * unit;

    unit = GetUnitFromCharId(0x28);

    if (!unit)
    {
        Proc_End(proc);
        return;
    }

    proc->game_lock = GetGameLock();
    SetWinEnable(0, 0, 0);

    GenerateItemPromotionBattle(unit, -1, 0);
    gBattleStats.config = BATTLE_CONFIG_PROMOTION | BATTLE_CONFIG_PROMOTION_PREP;
    gBattleActor.weaponBefore = 0;
    gBattleTarget.weaponBefore = 0;
    BeginBattleAnimations();
}

void IsGameLockLevelReserved(ProcPtr _proc)
{
    struct ProcPrepPromote * proc = _proc;

    if (proc->game_lock == GetGameLock())
        Proc_Break(proc);
}

void NullExpForChar100AndResetScreen(ProcPtr proc)
{
    struct Unit * unit = GetUnitFromCharId(0x28);

    if (unit)
        unit->exp = -1;

    SetBlendDarken(16);
    SetDispEnable(0, 0, 0, 0, 0);
    CallSomeSoundMaybe(0x49, 0x100, 0x100, 0x20, NULL);
}

void PrepPromoteDebugMaybe(struct ProcAtMenu * proc)
{
    EndCgText();
    ClearTalk();
    EndEachSpriteAnimProc();
    EndPrepMuralBackground();

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    SetBlendDarken(16);
    SetBlendTargetA(1, 1, 1, 1, 1);
    EndAllProcChildren(proc);
    Proc_StartBlocking(ProcScr_PrepPromoteDebug, proc);
}

void sub_0808F7A8(struct ProcAtMenu * proc)
{
    CallSomeSoundMaybe(0, 0x100, 0, 0x20, NULL);
}

void NewPrepScreenTraineePromotionManager(void)
{
    Proc_Start(ProcScr_AtUnkMenu, PROC_TREE_3);
}

int PrepScreenTraineePromotionManagerExists(ProcPtr proc)
{
    return Proc_Find(ProcScr_AtUnkMenu) ? TRUE : FALSE;
}

int PrepAtMenuExists(ProcPtr proc)
{
    return Proc_Find(ProcScr_AtMenu) ? TRUE : FALSE;
}
