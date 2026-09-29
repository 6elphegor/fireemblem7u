#include "gbafe.h"

void PutUnitSprite(int layer, int x, int y, struct Unit * unit);
void SyncUnitSpriteSheet(void);
ProcPtr StartMenuScrollBar(ProcPtr parent);
void InitMenuScrollBarImg(int chr, int pal);
void PutMenuScrollBarAt(int x, int y);
void UpdateMenuScrollBarConfig(u8 a, u16 b, u16 c, u8 d);
void EndMenuScrollBar(void);
void EndUiSpinningArrows(void);
void StartUnitListScreenPrepMenu(ProcPtr parent);

extern u8 Tsa_08406FD0[];

u16 CONST_DATA Sprite_08CC4818[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, 0,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x4),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(64), OAM2_CHR(0x8),
};

u16 CONST_DATA Sprite_08CC482C[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0xC),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x10),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(64), OAM2_CHR(0x14),
};

u16 CONST_DATA Sprite_08CC4840[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0xC),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(32), OAM2_CHR(0x10),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(48), OAM2_CHR(0x17),
};

struct ProcCmd CONST_DATA ProcScr_PrepUnitScreen[] = {
    PROC_YIELD,
    PROC_SET_END_CB(ProcPrepUnit_OnEnd),
PROC_LABEL(0),
    PROC_CALL(ProcPrepUnit_OnInit),
    PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
PROC_LABEL(1),
    PROC_REPEAT(ProcPrepUnit_Idle),
PROC_LABEL(2),
    PROC_CALL(sub_08093DE8),
    PROC_REPEAT(PrepUnitScreen_Loop_B),
    PROC_REPEAT(PrepUnitScreen_Loop_C),
    PROC_REPEAT(PrepUnitScreen_Loop_D),
    PROC_CALL(sub_08093E00),
    PROC_GOTO(1),
PROC_LABEL(3),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(sub_08093A7C),
    PROC_CALL(sub_08093ED8),
    PROC_YIELD,
    PROC_CALL(sub_08093EF8),
    PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_YIELD,
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(1),
PROC_LABEL(4),
    PROC_CALL(PrepUnitDisableDisp),
    PROC_SLEEP(2),
    PROC_CALL(sub_08093A7C),
    PROC_CALL(sub_08093F84),
    PROC_YIELD,
    PROC_CALL(sub_08093FA0),
    PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_SLEEP(2),
    PROC_CALL(PrepUnitEnableDisp),
    PROC_GOTO(1),
PROC_LABEL(99),
    PROC_CALL(ProcPrepUnit_OnGameStart),
    PROC_SLEEP(30),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),
    PROC_GOTO(100),
PROC_LABEL(10),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
PROC_LABEL(100),
    PROC_END,
};

void PrepUnit_DrawUnitListNames(struct ProcPrepUnit * proc, int line)
{
    int i, color, itext, ilist, _line;
    u32 val;
    struct Unit * unit;

    i = 0;
    val = line * 2;
    _line = line % 7;

    for (; i < 2; i++)
    {
        itext = val + i;

        if (itext >= PrepGetUnitAmount())
            continue;

        unit = GetUnitFromPrepList(itext);

        color = TEXT_COLOR_SYSTEM_WHITE;
        if (!CheckInLinkArena() && IsCharacterForceDeployed(unit->pCharacterData->number))
            color = TEXT_COLOR_SYSTEM_GREEN;
        else if (unit->state & US_NOT_DEPLOYED)
            color = TEXT_COLOR_SYSTEM_GRAY;

        ilist = _line * 2 + i;

        ClearText(&gPrepUnitTexts[ilist]);

        PutDrawText(
            &gPrepUnitTexts[ilist], gBg2Tm + TM_OFFSET(0x10 + i * 7, val % 0x20), color, 0, 0,
            DecodeMsg(unit->pCharacterData->nameTextId));
    }

    EnableBgSync(BG2_SYNC_BIT);
}
void PrepUpdateMenuTsaScroll(int val)
{
    u32 _val = val * 2;
    TmFillRect(gBg2Tm + TM_OFFSET(0x10, _val % 0x20), 0xD, 1, 0);
    EnableBgSync(BG2_SYNC_BIT);
}
void PrepUnit_DrawSMSAndObjs(struct ProcPrepUnit * proc)
{
    int i;

    for (i = 0; i < PrepGetUnitAmount(); i++)
    {
        u32 yOff = ((i >> 1) << 4) - proc->yDiff_cur;
        if ((yOff + 0xF) < 0x60)
            PutUnitSprite(0, (i & 1) * 56 + 0x70, yOff + 0x18, GetUnitFromPrepList(i));
    }

    if (proc->yDiff_cur & 0xF)
    {
        SetWinEnable(1, 1, 0);
        SetWin0Box(0, 0, 0xF0, 0x18);
        SetWin1Box(0, 0x78, 0xF0, 0xA0);
        SetWin0Layers(1, 1, 0, 1, 0);
        SetWin1Layers(1, 1, 0, 1, 1);
        SetWOutLayers(1, 1, 1, 1, 1);
    }
    else
    {
        SetWinEnable(0, 0, 0);
    }

    PutSpriteExt(4, 0x80, 0x8E, Sprite_08CC4818, 0x40);

    if (proc->button_blank)
        proc->button_blank++;

    if (0 == ((proc->button_blank >> 2) & 1))
    {
        if (CheckInLinkArena())
            PutSpriteExt(4, 0x80, 0x7E, Sprite_08CC4840, 0x40);
        else
            PutSpriteExt(4, 0x80, 0x7E, Sprite_08CC482C, 0x40);
    }

    SyncUnitSpriteSheet();
}
void PrepUnit_InitTexts(void)
{
    int i;

    ResetText();

    for (i = 0; i < 14; i++)
        InitText(&gPrepUnitTexts[i], 5);

    for (i = 0; i < 5; i++)
        InitText(&gPrepUnitTexts[i + 0xE], 7);

    InitText(&gPrepUnitTexts[0x13], 7);
    InitText(&gPrepUnitTexts[0x14], 10);
    InitText(&gPrepUnitTexts[0x15], 11);
}
void PrepUnit_InitGfx(void)
{
    InitIcons();
    ApplySystemObjectsGraphics();
    ApplyIconPalettes(4);

    PutPrepMenuUiImg(0x6000, 0xF);

    PutCompressedTsa(gBg1Tm, Tsa_08406FD0, 0xF300);

    Decompress(Img_PrepScreenTitleSprites, (void *) 0x06010800);
    EnablePalSync();
}
void sub_08093250(ProcPtr parent, u32 obj_offset)
{
    NewSysBlackBoxHandler(parent);
    SysBlackBoxSetGfx(obj_offset);

    if (!CheckInLinkArena())
        EnableSysBlackBox(0, 4, 0x480, 12, 4, 0xC00);
    else
        EnableSysBlackBox(0, 4, 0x488, 12, 3, 0xC00);

    EnableSysBlackBox(1, 0x6C, 0x480, 16, 4, 0xC00);
}
void PrepUnit_InitSMS(struct ProcPrepUnit * proc)
{
    ApplyUnitSpritePalettes();
    CpuFastFill(0, PAL_OBJ(0x0B), 0x20);
    MakePrepUnitList();
    PrepAutoCapDeployUnits(proc->proc_parent);
    PrepUpdateSMS();
}
void PrepUnit_DrawLeftUnitName(struct Unit * unit)
{
    TmFillRect(gBg0Tm + TM_OFFSET(5, 3), 6, 1, 0);
    PutFaceChibi(GetUnitPortraitId(unit), gBg0Tm + TM_OFFSET(1, 1), 0x270, 2, 0);
    ClearText(&gPrepUnitTexts[0x13]);
    PutDrawText(
        &gPrepUnitTexts[0x13], gBg0Tm + TM_OFFSET(5, 1), TEXT_COLOR_SYSTEM_WHITE,
        GetStringTextCenteredPos(0x38, DecodeMsg(unit->pCharacterData->nameTextId)), 0,
        DecodeMsg(unit->pCharacterData->nameTextId));

    PutSpecialChar(gBg0Tm + TM_OFFSET(5, 3), TEXT_COLOR_SYSTEM_GOLD, 0x24);
    PutSpecialChar(gBg0Tm + TM_OFFSET(6, 3), TEXT_COLOR_SYSTEM_GOLD, 0x25);
    PutSpecialChar(gBg0Tm + TM_OFFSET(9, 3), TEXT_COLOR_SYSTEM_GOLD, 0x1D);

    PutNumberOrBlank(gBg0Tm + TM_OFFSET(8, 3), TEXT_COLOR_SYSTEM_BLUE, unit->level);
    PutNumberOrBlank(gBg0Tm + TM_OFFSET(11, 3), TEXT_COLOR_SYSTEM_BLUE, unit->exp);
    EnableBgSync(BG0_SYNC_BIT);
}
void PrepUnit_DrawLeftUnitNameCur(struct ProcPrepUnit * proc)
{
    PrepUnit_DrawLeftUnitName(GetUnitFromPrepList(proc->list_num_cur));
}
void PrepUnit_DrawUnitItems(struct Unit * unit)
{
    int i, cnt;

    InitIcons();
    TmFillRect(gBg0Tm + TM_OFFSET(1, 5), 0xB, 0xA, 0);

    cnt = GetUnitItemCount(unit);
    for (i = 0; i < cnt; i++)
    {
        int item = unit->items[i];

        PutIcon(gBg0Tm + TM_OFFSET(1, 5 + 2 * i), GetItemIconId(item), TILEREF(0, 4));

        ClearText(&gPrepUnitTexts[i + 0xE]);

        PutDrawText(
            &gPrepUnitTexts[i + 0xE], gBg0Tm + TM_OFFSET(3, 5 + 2 * i),
            IsItemDisplayUsable(unit, item) ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GRAY, 0, 0,
            GetItemName(item));

        PutNumberOrBlank(
            gBg0Tm + TM_OFFSET(11, 5 + 2 * i),
            IsItemDisplayUsable(unit, item) ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY, GetItemUses(item));
    }

    EnableBgSync(BG0_SYNC_BIT);
}
void PrepUnit_DrawPickLeftBar(struct ProcPrepUnit * proc, s8 val)
{
    struct Text * text = &gPrepUnitTexts[0x15];

    if (0 == val)
    {
        ClearText(text);
        PutDrawText(text, gBg0Tm + TM_OFFSET(14, 1), TEXT_COLOR_SYSTEM_WHITE, 0x28, 0, DecodeMsg(0x1272));
    }

    ClearTextPart(text, 2, 3);
    PutDrawText(text, gBg0Tm + TM_OFFSET(14, 1), TEXT_COLOR_SYSTEM_WHITE, 0, 0, DecodeMsg(0x1271));

    Text_SetColor(text, proc->cur_counter == proc->max_counter ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE);
    Text_SetCursor(text, 0x1C);
    Text_DrawNumber(text, proc->max_counter - proc->cur_counter);
    PutText(text, gBg0Tm + TM_OFFSET(14, 1));

    TmFillRect(gBg0Tm + TM_OFFSET(25, 1), 4, 1, 0);
    PutNumberOrBlank(
        gBg0Tm + TM_OFFSET(26, 1),
        proc->cur_counter == proc->max_counter ? TEXT_COLOR_SYSTEM_GREEN : TEXT_COLOR_SYSTEM_BLUE, proc->cur_counter);

    PutSpecialChar(gBg0Tm + TM_OFFSET(27, 1), TEXT_COLOR_SYSTEM_WHITE, 0x16);
    PutNumberOrBlank(
        gBg0Tm + TM_OFFSET(29, 1),
        proc->cur_counter == proc->max_counter ? TEXT_COLOR_SYSTEM_GREEN : TEXT_COLOR_SYSTEM_BLUE, proc->max_counter);

    EnableBgSync(BG0_SYNC_BIT);
}
s8 PrepCheckCanSelectUnit(struct ProcPrepUnit * proc, struct Unit * unit)
{
    if (proc->max_counter > proc->cur_counter)
    {
        proc->cur_counter++;
        unit->state &= ~(US_UNSELECTABLE | US_NOT_DEPLOYED);
        RegisterSioPid(unit->pCharacterData->number);
        PlaySoundEffect(0x38A);
        PrepUnit_DrawUnitListNames(proc, proc->list_num_cur / 2);
        return 1;
    }
    else
    {
        PlaySoundEffect(0x38C);
        return 0;
    }
}
s8 PrepCheckCanUnselectUnit(struct ProcPrepUnit * proc, struct Unit * unit)
{
    if (!IsCharacterForceDeployed(unit->pCharacterData->number))
    {
        proc->cur_counter--;
        unit->state |= US_UNSELECTABLE | US_NOT_DEPLOYED;
        RemoveSioPid(unit->pCharacterData->number);
        PlaySoundEffect(0x38B);
        PrepUnit_DrawUnitListNames(proc, proc->list_num_cur / 2);
        return 1;
    }
    else
    {
        PlaySoundEffect(0x38C);
        return 0;
    }
}
s8 PrepUnit_HandlePressA(struct ProcPrepUnit * proc)
{
    struct Unit * unit = GetUnitFromPrepList(proc->list_num_cur);

    if (unit->state & US_BIT25)
    {
        u32 ilist = proc->list_num_cur;
        StartPrepErrorHelpbox((ilist & 1) * 56 + 0x70, (ilist / 2) * 16 - proc->yDiff_cur + 0x18, 0x3B1, proc);
        return 0;
    }

    if (unit->state & US_NOT_DEPLOYED)
    {
        if (CheckInLinkArena() && !sub_08090DB0(unit))
        {
            u32 ilist = proc->list_num_cur;
            StartPrepErrorHelpbox((ilist & 1) * 56 + 0x70, (ilist / 2) * 16 - proc->yDiff_cur + 0x18, 0x3AD, proc);
            return 0;
        }

        if (PrepCheckCanSelectUnit(proc, unit) == 0)
            return 0;
        else
            return 1;
    }
    else
    {
        if (PrepCheckCanUnselectUnit(proc, unit) == 0)
            return 0;
        else
            return 1;
    }
}
void sub_08093734(void)
{
    s8 isLinkArena = CheckInLinkArena();

    if (!isLinkArena)
    {
        char const * str = DecodeMsg(GetChapterInfo(gPlaySt.chapterIndex)->goalWindowTextId);

        ClearText(&gPrepUnitTexts[0x14]);
        PutDrawText(
            &gPrepUnitTexts[0x14], gBg0Tm + TM_OFFSET(1, 16), TEXT_COLOR_SYSTEM_WHITE,
            GetStringTextCenteredPos(0x50, str), isLinkArena, str);
        EnableBgSync(BG0_SYNC_BIT);
    }
}
s8 ShouldPrepUnitMenuScroll(struct ProcPrepUnit * proc)
{
    int val1, val2, val3;

    val1 = proc->yDiff_cur / 16;
    if (val1 > 0 && proc->list_num_cur / 2 <= val1)
        return 1;

    val2 = val1 + 5;
    val3 = (PrepGetUnitAmount() - 1) >> 1;
    if (val2 < val3 && proc->list_num_cur / 2 >= val2)
        return 1;

    return 0;
}
void sub_080937CC(struct ProcPrepUnit * proc)
{
    if (ShouldPrepUnitMenuScroll(proc))
    {
        int lst = proc->list_num_cur / 2;
        int dif = proc->yDiff_cur / 16;
        int amt = (PrepGetUnitAmount() - 1) >> 1;

        if (lst <= dif)
        {
            if (lst == 0)
                proc->yDiff_cur = 0;
            else
                proc->yDiff_cur = (lst - 1) * 16;

            if (lst <= dif)
                return;
        }

        if (lst == amt)
            proc->yDiff_cur = (lst - 5) * 16;
        else
            proc->yDiff_cur = (lst - 4) * 16;
    }
}
void sub_08093814(struct ProcPrepUnit * proc)
{
    int msk = 0;
    int dif = proc->yDiff_cur / 16;
    int amt = (PrepGetUnitAmount() - 1) >> 1;

    if (dif > 0)
        msk = 1;
    if ((dif + 5) < amt)
        msk |= 2;

    SetUiSpinningArrowConfig(msk);
}
void ProcPrepUnit_OnInit(struct ProcPrepUnit * proc)
{
    MakePrepUnitList();
    proc->list_num_cur = UnitGetIndexInPrepList(PrepGetLatestCharId());
    proc->max_counter = ((struct ProcAtMenu *)(proc->proc_parent))->max_counter;
    proc->cur_counter = ((struct ProcAtMenu *)(proc->proc_parent))->cur_counter;
    proc->yDiff_cur = ((struct ProcAtMenu *)(proc->proc_parent))->yDiff;
    proc->list_num_pre = proc->list_num_cur;
    proc->button_blank = 0;
}
void ProcPrepUnit_InitScreen(struct ProcPrepUnit * proc)
{
    int i;

    InitBgs(gBgConfig_PrepScreen);
    SetDispEnable(0, 0, 0, 0, 0);
    sub_080937CC(proc);

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);

    gDispIo.bg0_ct.priority = 2;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg3_ct.priority = 3;

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, proc->yDiff_cur - 0x18);
    SetBgOffset(3, 0, 0);

    PrepUnit_InitTexts();
    PrepUnit_InitGfx();
    sub_08093250(proc, 0x4000);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    SetBlendAlpha(14, 8);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    PrepUnit_InitSMS(proc);
    StartParallelWorker(PrepUnit_DrawSMSAndObjs, proc);
    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 0x1);
    ShowSysHandCursor(
        (proc->list_num_cur % 2) * 56 + 0x70,
        (proc->list_num_cur / 2) * 16 + 0x18 - proc->yDiff_cur,
        0x7, 0x800);

    StartMenuScrollBar(proc);
    PutMenuScrollBarAt(0xE2, 0x20);
    UpdateMenuScrollBarConfig(0xA, proc->yDiff_cur, (PrepGetUnitAmount() - 1) / 2 + 1, 6);
    InitMenuScrollBarImg(0x200, 2);
    StartHelpPromptSprite(0x20, 0x8C, proc);
    PrepUnit_DrawUnitItems(GetUnitFromPrepList(proc->list_num_cur));
    PrepUnit_DrawLeftUnitName(GetUnitFromPrepList(proc->list_num_cur));
    sub_08093734();

    for (i = 0; i < 6; i++)
        PrepUnit_DrawUnitListNames(proc, proc->yDiff_cur / 0x10 + i);

    PrepUnit_DrawPickLeftBar(proc, 0);
    StartGreenText(proc);
    LoadHelpBoxGfx((void *) 0x06015000, 5);
    PrepRestartMuralBackground();
}
void sub_08093A7C(struct ProcPrepUnit * proc)
{
    EndMenuScrollBar();
    EndAllParallelWorkers();
    EndSysBlackBoxs();
    EndSysHandCursor();
    EndHelpPromptSprite();
    EndUiSpinningArrows();
    EndMuralBackground_();
}
void ProcPrepUnit_Idle(struct ProcPrepUnit * proc)
{
    int ret;

    if (proc->list_num_pre == proc->list_num_cur)
    {
        int key_pre = gpKeySt->repeated;

        proc->scroll_val = 4;
        if (L_BUTTON & gpKeySt->held)
        {
            key_pre = gpKeySt->held;
            proc->scroll_val = 8;
        }

        if (START_BUTTON & gpKeySt->pressed)
        {
            if (0 == proc->cur_counter)
            {
                PlaySoundEffect(0x38C);
            }
            else
            {
                PlaySoundEffect(0x38A);
                Proc_Goto(proc, 99);
            }
            return;
        }

        if (SELECT_BUTTON & gpKeySt->pressed)
        {
            PlaySoundEffect(0x38A);
            Proc_Goto(proc, 3);
            return;
        }

        if (R_BUTTON & gpKeySt->pressed)
        {
            Proc_Goto(proc, 4);
            return;
        }

        if (A_BUTTON & gpKeySt->pressed)
        {
            ret = PrepUnit_HandlePressA(proc);
            if (ret)
                PrepUnit_DrawPickLeftBar(proc, 1);
            return;
        }

        if (B_BUTTON & gpKeySt->pressed)
        {
            PlaySoundEffect(0x38B);
            Proc_Goto(proc, 10);
            return;
        }

        if (DPAD_LEFT & key_pre)
        {
            if (1 & proc->list_num_cur)
                proc->list_num_cur--;
        }

        if (DPAD_RIGHT & key_pre)
        {
            if (!(1 & proc->list_num_cur) && proc->list_num_cur < (PrepGetUnitAmount() - 1))
                proc->list_num_cur++;
        }

        if (DPAD_UP & key_pre)
        {
            if ((proc->list_num_cur - 2) >= 0)
                proc->list_num_cur -= 2;
        }

        if (DPAD_DOWN & key_pre)
        {
            if ((proc->list_num_cur + 2) <= (PrepGetUnitAmount() - 1))
                proc->list_num_cur += 2;
        }

        if (proc->list_num_pre == proc->list_num_cur)
            return;

        PrepUnit_DrawUnitItems(GetUnitFromPrepList(proc->list_num_cur));
        StartParallelFiniteLoop(PrepUnit_DrawLeftUnitNameCur, 1, proc);
        PlaySoundEffect(0x385);

        if (ShouldPrepUnitMenuScroll(proc))
        {
            if (proc->list_num_cur < proc->list_num_pre)
                PrepUnit_DrawUnitListNames(proc, proc->yDiff_cur / 16 - 1);
            if (proc->list_num_cur > proc->list_num_pre)
                PrepUnit_DrawUnitListNames(proc, proc->yDiff_cur / 16 + 6);

            SetSysHandCursorXPos((1 & proc->list_num_cur) * 56 + 0x70);
        }
        else
        {
            proc->list_num_pre = proc->list_num_cur;
            ShowSysHandCursor(
                (1 & proc->list_num_pre) * 56 + 0x70,
                (proc->list_num_pre >> 1) * 16 + 0x18 - proc->yDiff_cur,
                0x7, 0x800);
        }

        if (proc->list_num_pre == proc->list_num_cur)
            return;
    }

    if (proc->list_num_cur < proc->list_num_pre)
        proc->yDiff_cur -= proc->scroll_val;

    if (proc->list_num_cur > proc->list_num_pre)
        proc->yDiff_cur += proc->scroll_val;

    if (0 == proc->yDiff_cur % 0x10)
    {
        PrepUpdateMenuTsaScroll(proc->yDiff_cur / 16 - 1);
        PrepUpdateMenuTsaScroll(proc->yDiff_cur / 16 + 6);
        sub_08093814(proc);
        proc->list_num_pre = proc->list_num_cur;
    }

    SetBgOffset(2, 0, proc->yDiff_cur - 0x18);
    UpdateMenuScrollBarConfig(0xA, proc->yDiff_cur, (PrepGetUnitAmount() - 1) / 2 + 1, 6);
}
void PrepUnitScreen_Loop_B(struct ProcPrepUnit * proc)
{
    proc->unk_34 += 4;
    proc->yDiff_cur += 4;

    if (proc->unk_34 == 0x20)
        Proc_Break(proc);

    SetBgOffset(2, 0, proc->yDiff_cur - 0x18);

    if (0 == proc->yDiff_cur % 0x10)
        PrepUpdateMenuTsaScroll(proc->yDiff_cur / 0x10 - 1);
}
void PrepUnitScreen_Loop_D(struct ProcPrepUnit * proc)
{
    if (0 == proc->yDiff_cur % 0x10)
        PrepUnit_DrawUnitListNames(proc, proc->yDiff_cur / 0x10 - 1);

    proc->unk_34 -= 4;
    proc->yDiff_cur -= 4;

    if (proc->unk_34 <= 0)
        Proc_Break(proc);

    SetBgOffset(2, 0, proc->yDiff_cur - 0x18);
}
void nullsub_11(void)
{
    return;
}
void sub_08093DE8(struct ProcPrepUnit * proc)
{
    nullsub_11();
    ShowSysHandCursor(0xD0, 0x68, 0, 0x800);
}
void sub_08093E00(struct ProcPrepUnit * proc)
{
    ShowSysHandCursor(
        (proc->list_num_cur % 2) * 56 + 0x70,
        (proc->list_num_cur / 2) * 16 + 0x18 - proc->yDiff_cur,
        0x7, 0x800);
}
void PrepUnitScreen_Loop_C(struct ProcPrepUnit * proc)
{
    if (A_BUTTON & gpKeySt->pressed)
        PlaySoundEffect(0x38C);

    if (DPAD_UP & gpKeySt->repeated)
    {
        PlaySoundEffect(0x385);
        Proc_Break(proc);
    }
}
void ProcPrepUnit_OnEnd(struct ProcPrepUnit * proc)
{
    ((struct ProcAtMenu *)(proc->proc_parent))->yDiff = proc->yDiff_cur;
    ((struct ProcAtMenu *)(proc->proc_parent))->cur_counter = proc->cur_counter;

    PrepSetLatestCharId(GetUnitFromPrepList(proc->list_num_cur)->pCharacterData->number);
    EndMuralBackground_();
}
void ProcPrepUnit_OnGameStart(struct ProcPrepUnit * proc)
{
    ((struct ProcAtMenu *)(proc->proc_parent))->end_prep = 1;
    Proc_Goto(proc->proc_parent, 0x6);
    proc->button_blank = 1;
}
void sub_08093ED8(struct ProcPrepUnit * proc)
{
    PrepSetLatestCharId(GetUnitFromPrepList(proc->list_num_cur)->pCharacterData->number);
    StartUnitListScreenPrepMenu(proc);
}
void sub_08093EF8(struct ProcPrepUnit * proc)
{
    int i, list_index = PrepGetLatestUnitIndex();
    proc->list_num_pre = list_index;
    proc->list_num_cur = list_index;
    proc->cur_counter = 0;

    for (i = 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!(unit->state & (US_DEAD | US_NOT_DEPLOYED | US_BIT16)))
            proc->cur_counter++;
    }
}
void PrepUnitDisableDisp(struct ProcPrepUnit * proc)
{
    SetDispEnable(0, 0, 0, 0, 0);
}
void PrepUnitEnableDisp(struct ProcPrepUnit * proc)
{
    SetDispEnable(1, 1, 1, 1, 1);
}
void sub_08093F84(struct ProcPrepUnit * proc)
{
    SetStatScreenExcludedUnitFlags(0x11);
    StartStatScreen(GetUnitFromPrepList(proc->list_num_cur), proc);
}
void sub_08093FA0(struct ProcPrepUnit * proc)
{
    int list_num;
    MakePrepUnitList();

    list_num = GetLatestUnitIndexInPrepListByUId();
    proc->list_num_pre = list_num;
    proc->list_num_cur = list_num;
}
