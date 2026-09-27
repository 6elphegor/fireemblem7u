#include "gbafe.h"

u32 GetGold(void);
void EndPrepItemScreenFace(int slot);
void UpdatePrepItemScreenFace(int slot, struct Unit * unit, u16 x, u16 y, u16 disp);
void PrepItemDrawPopupBox(int x, int y, int w, int h, int oam2);
void EndMenuScrollBar(void);

extern u8 Img_0840E368[];
extern u16 Pal_0840E3EC[];

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
ASM_FUNC("asm/nonmatching/code_080913FC.s");
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
ASM_FUNC("asm/nonmatching/code_080919C8.s");
ASM_FUNC("asm/nonmatching/code_08091AD8.s");
ASM_FUNC("asm/nonmatching/code_08091C48.s");
ASM_FUNC("asm/nonmatching/code_08091D70.s");
ASM_FUNC("asm/nonmatching/code_08091D9C.s");
ASM_FUNC("asm/nonmatching/code_08091DBC.s");
ASM_FUNC("asm/nonmatching/code_08091F04.s");
ASM_FUNC("asm/nonmatching/code_08092010.s");
ASM_FUNC("asm/nonmatching/code_0809210C.s");
ASM_FUNC("asm/nonmatching/code_0809218C.s");
ASM_FUNC("asm/nonmatching/code_080921E8.s");
ASM_FUNC("asm/nonmatching/code_08092220.s");
ASM_FUNC("asm/nonmatching/code_08092578.s");
ASM_FUNC("asm/nonmatching/code_080925D0.s");
ASM_FUNC("asm/nonmatching/code_080926F8.s");
ASM_FUNC("asm/nonmatching/code_08092708.s");
ASM_FUNC("asm/nonmatching/code_0809285C.s");
ASM_FUNC("asm/nonmatching/code_0809288C.s");
ASM_FUNC("asm/nonmatching/code_080928A4.s");
ASM_FUNC("asm/nonmatching/code_080928BC.s");
ASM_FUNC("asm/nonmatching/code_080928D4.s");
ASM_FUNC("asm/nonmatching/code_080928EC.s");
ASM_FUNC("asm/nonmatching/code_080929A4.s");
ASM_FUNC("asm/nonmatching/code_080929BC.s");
ASM_FUNC("asm/nonmatching/code_080929D0.s");
ASM_FUNC("asm/nonmatching/code_08092AE4.s");
ASM_FUNC("asm/nonmatching/code_08092B6C.s");
ASM_FUNC("asm/nonmatching/code_08092C34.s");
ASM_FUNC("asm/nonmatching/code_08092C44.s");
ASM_FUNC("asm/nonmatching/code_08092CB8.s");
ASM_FUNC("asm/nonmatching/code_08092ED4.s");
ASM_FUNC("asm/nonmatching/code_08092F08.s");
