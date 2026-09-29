#include "gbafe.h"
#include "gbafe/ui.h"
#include "gbafe/bmusemind.h"

void PrintStringToTexts(struct Text ** texts, char const * str, u16 * tm, int count);
void PutUnitSpriteForClassId(int layer, int x, int y, u16 oam2, int classId);
void SyncUnitSpriteSheet(void);
void BeginBattleAnimations(void);

extern u8 Tsa_0840E50C[];

extern struct ProcCmd CONST_DATA ProcScr_PrepItemUseBooster[];

CONST_DATA struct ProcCmd ProcScr_PrepItemUseScreen[] = {
    PROC_YIELD,
    PROC_LABEL(0),
    PROC_CALL(PrepItemUse_OnInit),
    PROC_CALL(PrepItemUse_InitDisplay),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_LABEL(1),
    PROC_REPEAT(PrepItemUse_CtrlLoop),
    PROC_LABEL(2),
    PROC_CALL(PrepItemUse_ConfirmWindowInit),
    PROC_REPEAT(PrepItemUse_ConfirmWindowCtrlLoop),
    PROC_GOTO(1),
    PROC_LABEL(3),
    PROC_CALL(PrepItemUse_HandleItemEffect),
    PROC_START_CHILD_BLOCKING(ProcScr_PrepItemUseBooster),
    PROC_GOTO(1),
    PROC_LABEL(4),
    PROC_CALL(sub_08095894),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_WHILE(MusicProc4Exists),
    PROC_CALL(PrepItemUse_ExecPromotionItemUnused),
    PROC_REPEAT(PrepItemUse_WaitPromotionDone),
    PROC_SLEEP(8),
    PROC_CALL(PrepItemUse_ResetBgmAfterPromo),
    PROC_SLEEP(30),
    PROC_CALL(PrepItemUse_PostPromotion),
    PROC_CALL(PrepItemUse_InitDisplay),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_WHILE(MusicProc4Exists),
    PROC_GOTO(1),
    PROC_LABEL(5),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_LABEL(6),
    PROC_CALL(ProcPrepItemUse_OnEnd),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_PrepItemUseBooster[] = {
    PROC_SET_END_CB(PrepItemUseBooster_OnEnd),
    PROC_CALL(PrepItemUseBooster_OnInit),
    PROC_REPEAT(PrepItemUseBooster_IDLE),
    PROC_END,
};

bool PrepItemUseTryMoveHand(struct ProcPrepItemUse * proc)
{
    u16 keys;

    if ((keys = gpKeySt->repeated & DPAD_UP) != 0)
    {
        int count = GetUnitItemCount(proc->unit);

        if (proc->slot > 0)
        {
            proc->slot = proc->slot - 1;
            PlaySoundEffect(0x386);
            return TRUE;
        }

        if (gpKeySt->pressed & DPAD_UP)
        {
            proc->slot = count - 1;
            PlaySoundEffect(0x386);
            return TRUE;
        }

        return FALSE;
    }

    if (gpKeySt->repeated & DPAD_DOWN)
    {
        if (proc->slot < (GetUnitItemCount(proc->unit) - 1))
        {
            proc->slot = proc->slot + 1;
            PlaySoundEffect(0x386);
            return TRUE;
        }

        if (gpKeySt->pressed & DPAD_DOWN)
        {
            proc->slot = keys;
            PlaySoundEffect(0x386);
            return TRUE;
        }

        return FALSE;
    }

    return FALSE;
}

void DrawPrepScreenItemUseStatLabels(struct Unit * unit)
{
    int i;
    char const * str;
    struct Text * text = gPrepItemTexts;

    for (i = 0; i < 8; i++)
        ClearText(&text[i]);

    PutDrawText(text++, gBg2Tm + TM_OFFSET(17, 4), TEXT_COLOR_SYSTEM_GOLD, 0, 0, DecodeMsg(0x10F4));

    if (UnitHasMagicRank(unit))
        PutDrawText(text++, gBg2Tm + TM_OFFSET(17, 6), TEXT_COLOR_SYSTEM_GOLD, 0, 0, DecodeMsg(0x10F9));
    else
        PutDrawText(text++, gBg2Tm + TM_OFFSET(17, 6), TEXT_COLOR_SYSTEM_GOLD, 0, 0, DecodeMsg(0x10F8));

    PutDrawText(text++, gBg2Tm + TM_OFFSET(17, 8), TEXT_COLOR_SYSTEM_GOLD, 0, 0, DecodeMsg(0x10FB));
    PutDrawText(text++, gBg2Tm + TM_OFFSET(17, 10), TEXT_COLOR_SYSTEM_GOLD, 0, 0, DecodeMsg(0x10FC));
    PutDrawText(text++, gBg2Tm + TM_OFFSET(23, 4), TEXT_COLOR_SYSTEM_GOLD, 0, 0, DecodeMsg(0x10FD));
    PutDrawText(text++, gBg2Tm + TM_OFFSET(23, 6), TEXT_COLOR_SYSTEM_GOLD, 0, 0, DecodeMsg(0x10FE));
    PutDrawText(text++, gBg2Tm + TM_OFFSET(23, 8), TEXT_COLOR_SYSTEM_GOLD, 0, 0, DecodeMsg(0x10FF));
    PutDrawText(text++, gBg2Tm + TM_OFFSET(23, 10), TEXT_COLOR_SYSTEM_GOLD, 0, 0, DecodeMsg(0x1107));

    str = DecodeMsg(unit->pClassData->nameTextId);
    PutDrawText(text++, gBg2Tm + TM_OFFSET(22, 0), TEXT_COLOR_SYSTEM_WHITE, GetStringTextCenteredPos(0x38, str), 0, str);

    PutSpecialChar(gBg2Tm + TM_OFFSET(18, 0), TEXT_COLOR_SYSTEM_GOLD, 0x24);
    PutSpecialChar(gBg2Tm + TM_OFFSET(19, 0), TEXT_COLOR_SYSTEM_GOLD, 0x25);
}
void DrawPrepScreenItemUseStatBars(struct Unit * unit, int mask)
{
    s32 i;
    int stat_pack[8];

    ApplyUiStatBarPal(2);

    stat_pack[0] = GetUnitCurrentHp(unit) * 24 / UNIT_MHP_MAX(unit);
    stat_pack[1] = GetUnitPower(unit) * 24 / UNIT_POW_MAX(unit);
    stat_pack[2] = GetUnitSkill(unit) * 24 / UNIT_SKL_MAX(unit);
    stat_pack[3] = GetUnitSpeed(unit) * 24 / UNIT_SPD_MAX(unit);
    stat_pack[4] = GetUnitLuck(unit) * 24 / UNIT_LCK_MAX(unit);
    stat_pack[5] = GetUnitDefense(unit) * 24 / UNIT_DEF_MAX(unit);
    stat_pack[6] = GetUnitResistance(unit) * 24 / UNIT_RES_MAX(unit);
    stat_pack[7] = UNIT_CON(unit) * 24 / UNIT_CON_MAX(unit);

    for (i = 0; i < 8; i++)
    {
        u32 var = 0x100 * i + 0x7000;

        if ((mask >> i) & 1)
        {
            u32 x = var << 15;
            if (x) { ++x; --x; }
            PutDrawUiGauge(
                x >> 20, 4, gBg0Tm + TM_OFFSET((i >> 2) * 6 + 0x13, (i & 3) * 2 + 5), 0x3000, 0x18, stat_pack[i], 0);
        }
        else
        {
            u32 x = var << 15;
            if (x) { ++x; --x; }
            PutDrawUiGauge(
                x >> 20, 4, gBg0Tm + TM_OFFSET((i >> 2) * 6 + 0x13, (i & 3) * 2 + 5), 0x2000, 0x18, stat_pack[i], 0);
        }
    }

    EnableBgSync(BG0_SYNC_BIT);
}
void DrawPrepScreenItemUseStatValues(struct Unit * unit)
{
    PutNumberOrBlank(
        gBg2Tm + TM_OFFSET(21, 4),
        (GetUnitCurrentHp(unit) == UNIT_MHP_MAX(unit)) ? TEXT_COLOR_SYSTEM_GREEN : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitCurrentHp(unit));

    PutNumberOrBlank(
        gBg2Tm + TM_OFFSET(21, 6),
        (GetUnitPower(unit) == UNIT_POW_MAX(unit)) ? TEXT_COLOR_SYSTEM_GREEN : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitPower(unit));

    PutNumberOrBlank(
        gBg2Tm + TM_OFFSET(21, 8),
        (GetUnitSkill(unit) == UNIT_SKL_MAX(unit)) ? TEXT_COLOR_SYSTEM_GREEN : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitSkill(unit));

    PutNumberOrBlank(
        gBg2Tm + TM_OFFSET(21, 10),
        (GetUnitSpeed(unit) == UNIT_SPD_MAX(unit)) ? TEXT_COLOR_SYSTEM_GREEN : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitSpeed(unit));

    PutNumberOrBlank(
        gBg2Tm + TM_OFFSET(27, 4),
        (GetUnitLuck(unit) == UNIT_LCK_MAX(unit)) ? TEXT_COLOR_SYSTEM_GREEN : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitLuck(unit));

    PutNumberOrBlank(
        gBg2Tm + TM_OFFSET(27, 6),
        (GetUnitDefense(unit) == UNIT_DEF_MAX(unit)) ? TEXT_COLOR_SYSTEM_GREEN : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitDefense(unit));

    PutNumberOrBlank(
        gBg2Tm + TM_OFFSET(27, 8),
        (GetUnitResistance(unit) == UNIT_RES_MAX(unit)) ? TEXT_COLOR_SYSTEM_GREEN : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitResistance(unit));

    PutNumberOrBlank(
        gBg2Tm + TM_OFFSET(27, 10),
        (UNIT_CON(unit) == UNIT_CON_MAX(unit)) ? TEXT_COLOR_SYSTEM_GREEN : TEXT_COLOR_SYSTEM_BLUE,
        UNIT_CON(unit));

    PutNumberOrBlank(gBg2Tm + TM_OFFSET(21, 0), TEXT_COLOR_SYSTEM_BLUE, unit->level);

    EnableBgSync(BG2_SYNC_BIT);
}
void DrawPrepScreenItemUseDesc(struct Unit * unit, int slot)
{
    struct Text * thlut[3] =
    {
        &gPrepItemTexts[25],
        &gPrepItemTexts[26],
        &gPrepItemTexts[29],
    };

    ClearText(thlut[0]);
    ClearText(thlut[1]);
    ClearText(thlut[2]);

    if (slot != -1)
    {
        u16 item = unit->items[slot];
        int msg = GetItemUseDescId(item);

        if (msg != 0)
        {
            if (CanUnitUseItemPrepScreen(unit, item))
            {
                Text_SetColor(thlut[0], TEXT_COLOR_SYSTEM_WHITE);
                Text_SetColor(thlut[1], TEXT_COLOR_SYSTEM_WHITE);
                Text_SetColor(thlut[2], TEXT_COLOR_SYSTEM_WHITE);

                PrintStringToTexts(thlut, DecodeMsg(msg), gBg0Tm + TM_OFFSET(15, 13), 3);
            }
            else
            {
                Text_SetColor(thlut[0], TEXT_COLOR_SYSTEM_GRAY);
                Text_SetColor(thlut[1], TEXT_COLOR_SYSTEM_GRAY);
                Text_SetColor(thlut[2], TEXT_COLOR_SYSTEM_GRAY);

                PrintStringToTexts(thlut, DecodeMsg(msg), gBg0Tm + TM_OFFSET(15, 13), 3);
            }
        }
    }

    EnableBgSync(BG0_SYNC_BIT);
}
void PrepItemUseParallel_UpdateSMS(struct ProcPrepItemUse * proc)
{
    PutUnitSpriteForClassId(0, 0x80, 2, 0xC800, proc->unit->pClassData->number);
    SyncUnitSpriteSheet();
}
void PrepItemUse_OnInit(struct ProcPrepItemUse * proc)
{
    proc->slot = 0;
    proc->slot_rtext = 0xFF;
}
void PrepItemUse_InitDisplay(struct ProcPrepItemUse * proc)
{
    int i;
    char const * str;

    struct Text * texts;
    struct FaceVramEnt face_config[4] =
    {
        { 0x5800, 0x6 },
        { 0x6800, 0x7 },
        { 0x0000, 0x0 },
        { 0x0000, 0x0 },
    };

    gDispIo.disp_ct.mode = 0;
    InitBgs(gBgConfig_PrepScreen);
    SetFaceConfig(face_config);
    proc->unk34 = 0xFF;

    TmFill(GetBgTilemap(0), 0);
    TmFill(GetBgTilemap(1), 0);
    TmFill(GetBgTilemap(2), 0);

    gDispIo.bg0_ct.priority = 1;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg3_ct.priority = 3;

    ResetText();
    InitIcons();
    UnpackUiWindowFrameGraphics();
    ApplySystemObjectsGraphics();
    ApplyUnitSpritePalettes();

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);

    LoadHelpBoxGfx((void *) (VRAM + 0x14000), -1);
    ApplyIconPalettes(4);
    PrepRestartMuralBackground();

    for (i = 0; i < 5; i++)
        InitTextDb(&gPrepItemTexts[0xF + i], 7);

    for (i = 0; i < 8; i++)
        InitText(&gPrepItemTexts[i], 3);

    texts = gPrepItemTexts;

    InitText(&texts[8], 7);
    InitText(&texts[25], 15);
    InitText(&texts[26], 15);
    InitText(&texts[29], 15);
    InitText(&texts[27], 12);
    InitText(&texts[28], 8);

    DrawPrepScreenItemUseStatLabels(proc->unit);
    DrawPrepScreenItemUseStatValues(proc->unit);
    DrawPrepScreenItemUseStatBars(proc->unit, 0);

    StartBmFace(0, GetUnitPortraitId(proc->unit), 0x40, -4, 0x203);
    sub_08091944(0x6000, 5);
    sub_08091994(0x3000, 10);

    PutCompressedTsa(gBg1Tm, Tsa_0840E50C, 0x5300);
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    StartSysBrownBox(0xD, 0xE00, 0xF, 0xC00, 0, proc);
    EnableSysBrownBox(0, -0x28, -1, 1);

    str = DecodeMsg(proc->unit->pCharacterData->nameTextId);
    PutDrawText(0, gBg0Tm, TEXT_COLOR_SYSTEM_WHITE, (0x30 - GetStringTextLen(str)) / 2, 6, str);

    StartUiCursorHand(proc);
    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);

    StartParallelWorker(PrepItemUseParallel_UpdateSMS, proc);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0x68, 0x66, 0xF0, 0x9A);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;

    SetBlendConfig(3, 0, 0, 8);
    SetBlendTargetA(0, 0, 0, 1, 0);
    StartGreenText(proc);
    StartHelpPromptSprite(0xC4, 0x90, proc);
    DrawPrepScreenItemUseDesc(proc->unit, proc->slot);

    DrawPrepScreenItems(gBg0Tm + TM_OFFSET(2, 9), &texts[15], proc->unit, 1);

    ShowSysHandCursor((proc->slot >> 3) * 7 * 0x10 + 0x10, (proc->slot & 0x7) * 0x10 + 0x48, 0xB, 0x800);

    UseUnitSprite(GetUnitSMSId(proc->unit));
    ForceSyncUnitSpriteSheet();
}
void PrepItemUse_CtrlLoop(struct ProcPrepItemUse * proc)
{
    u16 item;

    if (proc->slot_rtext != 0xFF)
    {
        if (gpKeySt->pressed & (R_BUTTON | B_BUTTON))
        {
            CloseHelpBox();
            proc->slot_rtext = 0xFF;
            return;
        }
    }
    else if (gpKeySt->pressed & R_BUTTON)
    {
        item = proc->unit->items[proc->slot];

        if (item != 0)
        {
            StartItemHelpBox(0x10, 0x48 + proc->slot * 0x10, item);
            proc->slot_rtext = proc->slot;
        }
        return;
    }
    else if (gpKeySt->pressed & A_BUTTON)
    {
        if (CanUnitUseItemPrepScreen(proc->unit, proc->unit->items[proc->slot]) != FALSE)
        {
            proc->unk34 = proc->slot;
            SetUiCursorHandConfig(0, 0x10, 0x10 * proc->slot + 72, 0);
            proc->pos_subbox = 1;
            PlaySoundEffect(0x38A);
            Proc_Goto(proc, 2);
            return;
        }
        else
        {
            PlaySoundEffect(0x38C);
            return;
        }
    }
    else if (gpKeySt->pressed & B_BUTTON)
    {
        Proc_Goto(proc, 5);
        PlaySoundEffect(0x38B);
        return;
    }

    if (!PrepItemUseTryMoveHand(proc))
        return;

    ShowSysHandCursor(0x10, proc->slot * 0x10 + 0x48, 0xB, 0x800);
    DrawPrepScreenItemUseDesc(proc->unit, proc->slot);

    if (proc->slot_rtext != 0xFF)
    {
        item = proc->unit->items[proc->slot];

        if (item != 0)
        {
            StartItemHelpBox(0x10, 0x48 + proc->slot * 0x10, item);
            proc->slot_rtext = proc->slot;
        }
    }
}
void ProcPrepItemUse_OnEnd(void)
{
    EndMuralBackground_();
    EndFaceById(0);
    EndFaceById(1);
}
void PrepItemUseDrawSubBox(void)
{
    struct Text * text = &gPrepItemTexts[27];
    ClearText(text);

    PutDrawText(text++, gBg2Tm + TM_OFFSET(17, 13), TEXT_COLOR_SYSTEM_WHITE, 0, 0, DecodeMsg(0x1269));

    ClearText(text);

    PutDrawText(text, gBg2Tm + TM_OFFSET(18, 15), TEXT_COLOR_SYSTEM_WHITE, 0, 0, DecodeMsg(0x10EE));
    PutDrawText(text, gBg2Tm + TM_OFFSET(18, 15), TEXT_COLOR_SYSTEM_WHITE, 0x20, 0, DecodeMsg(0x10EF));

    EnableBgSync(BG2_SYNC_BIT);
}
void PrepItemUseClearSubBox(void)
{
    TmFillRect(gBg2Tm + TM_OFFSET(17, 13), 13, 4, 0);
    EnableBgSync(BG2_SYNC_BIT);
}
void PrepItemUse_ConfirmWindowInit(struct ProcPrepItemUse * proc)
{
    PrepItemUseDrawSubBox();
    ShowSysHandCursor(proc->pos_subbox * 0x20 + 0x8C, 0x78, 0, 0x800);
}
void PrepItemUse_ConfirmWindowCtrlLoop(struct ProcPrepItemUse * proc)
{
    int old = proc->pos_subbox;

    PrepItemDrawPopupBox(0x7E, 0x64, 0xD, 0x4, 0xA580);

    if (gpKeySt->pressed & B_BUTTON)
    {
        ShowSysHandCursor(0x10, proc->slot * 0x10 + 0x48, 0xB, 0x800);
        DisableUiCursorHand(0);
        PrepItemUseClearSubBox();
        PlaySoundEffect(0x38B);
        Proc_Break(proc);
        return;
    }

    if (gpKeySt->pressed & A_BUTTON)
    {
        PrepItemUseClearSubBox();

        if (proc->pos_subbox == 0)
        {
            HideSysHandCursor();
            PlaySoundEffect(0x38A);
            Proc_Goto(proc, 3);
            return;
        }
        else
        {
            ShowSysHandCursor(0x10, proc->slot * 0x10 + 0x48, 0xB, 0x800);
            PlaySoundEffect(0x38B);
            DisableUiCursorHand(0);
            Proc_Break(proc);
            return;
        }
    }

    if (gpKeySt->repeated & DPAD_LEFT)
        proc->pos_subbox = 0;

    if (gpKeySt->repeated & DPAD_RIGHT)
        proc->pos_subbox = 1;

    if (old != proc->pos_subbox)
    {
        ShowSysHandCursor(proc->pos_subbox * 0x20 + 0x8C, 0x78, 0, 0x800);
        PlaySoundEffect(0x387);
    }
}
void PrepItemUse_HandleItemEffect(struct ProcPrepItemUse * proc)
{
    switch (GetItemIndex(proc->unit->items[proc->slot]))
    {
    case 0x63:
    case 0x64:
    case 0x65:
    case 0x66:
    case 0x67:
    case 0x87:
    case 0x89:
    case 0x8B:
    case 0x96:
        PlaySoundEffect(0x38A);
        Proc_Goto(proc, 4);
        break;

    default:
        break;
    }
}

void PrepItemUse_ExecPromotionItemUnused(struct ProcPrepItemUse * proc)
{
    EndMuralBackground_();
    ResetText();
    InitBgs(NULL);
    EndGreenText();

    proc->game_lock = GetGameLock();

    InitFaces();
    EndHelpPromptSprite();

    SetWinEnable(0, 0, 0);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    SetBlendConfig(0, 0, 0, 8);
    EndSysBrownBox();
    EndAllParallelWorkers();
    EndFaceById(0);

    DisableUiCursorHand(0);
    GenerateItemPromotionBattle(proc->unit, proc->slot, 0);
    gBattleStats.config = 0x110;
    BeginBattleAnimations();
}
void PrepItemUse_WaitPromotionDone(struct ProcPrepItemUse * proc)
{
    if (proc->game_lock == GetGameLock())
        Proc_Break(proc);
}
void PrepItemUse_PostPromotion(struct ProcPrepItemUse * proc)
{
    int max = GetUnitItemCount(proc->unit);

    if (max == 0)
    {
        Proc_Goto(proc, 6);
        return;
    }

    if (proc->slot >= max)
        proc->slot--;

    Proc_Break(proc);
}
void PrepItemUse_ResetBgmAfterPromo(void)
{
    CallSomeSoundMaybe(0x49, 0x100, 0x100, 0x20, NULL);
}
void sub_08095894(void)
{
    CallSomeSoundMaybe(0, 0x100, 0, 0x10, NULL);
}
void StartPrepItemUseScreen(struct Unit * unit, ProcPtr parent)
{
    struct ProcPrepItemUse * proc;
    proc = Proc_StartBlocking(ProcScr_PrepItemUseScreen, parent);
    proc->unit = unit;
}
