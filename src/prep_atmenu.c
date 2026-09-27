#include "gbafe.h"

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
    PROC_CALL(sub_0809019C),
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
    PROC_REPEAT(sub_0808F690),
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
    PROC_WHILE(sub_08087D58),
    PROC_SLEEP(8),
PROC_LABEL(1),
    PROC_CALL(sub_0808F43C),
    PROC_WHILE(sub_08087D58),
    PROC_SLEEP(8),
PROC_LABEL(2),
    PROC_CALL(sub_0808F4A8),
    PROC_WHILE(sub_08087D58),
    PROC_SLEEP(8),
PROC_LABEL(3),
    PROC_CALL(sub_0808F52C),
    PROC_WHILE(sub_08087D58),
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

void Prep_DrawChapterGoal(int vram_offset, int pal_bank);
ASM_FUNC("asm/nonmatching/code_0808E488.s");


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

void AtMenu_Reinitialize(struct ProcAtMenu * proc);
ASM_FUNC("asm/nonmatching/code_0808E6D4.s");


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
