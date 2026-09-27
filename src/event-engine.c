#include "gbafe.h"
#include "gbafe/bmtarget.h"

bool sub_08079954(struct Unit * unit);
bool sub_08079A14(struct Unit * unit);

void LoadUnitCore(struct UnitDefinition const * def, struct EventProc * proc)
{
    struct Unit * unit;

    if (UnitInfoRequiresNoMovement(def))
        return;

    if (def->faction_id != FACTION_ID_BLUE)
    {
        int faction = FACTION_BLUE;

        unit = GetUnitFromCharIdAndFaction(def->pid, FACTION_BLUE);

        if (unit == NULL)
            goto load;

        switch (def->faction_id)
        {
        case FACTION_ID_BLUE:
            faction = FACTION_BLUE;
            break;

        case FACTION_ID_RED:
            faction = FACTION_RED;
            break;

        case FACTION_ID_GREEN:
            faction = FACTION_GREEN;
            break;
        }

        UnitChangeFaction(unit, faction);
    }

    unit = GetUnitFromCharId(def->pid);

    if (unit == NULL)
    {
    load:
        unit = LoadUnit(def);
        unit->state |= US_BIT22;
    }
    else
    {
        if (sub_08079954(unit))
        {
            UnitLoadItemsFromDefinition(unit, def);
            unit->state &= ~US_BIT16;
        }

        if (!sub_08079A14(unit) && (unit->state & US_DEAD))
            return;
    }

    unit->xPos = def->x_load;
    unit->yPos = def->y_load;

    if ((gPlaySt.chapterStateBits & PLAY_FLAG_HARD) && gPlaySt.chapterModeIndex == 3 && def->faction_id == FACTION_ID_RED)
        UnitApplyBonusLevels(unit, GetChapterInfo(gPlaySt.chapterIndex)->hard_bonus_levels);

    sub_0800A71C(def, unit, proc, TRUE);
    RefreshEntityMaps();
}

void FakeLoadUnit(struct UnitDefinition const * def, struct Unit * unit)
{
    sub_0800A71C(def, unit, NULL, FALSE);
    RefreshEntityMaps();
}

void sub_0800A71C(struct UnitDefinition const * def, struct Unit * unit, struct EventProc * proc, bool move)
{
    if (unit == NULL)
        return;

    if (move)
    {
        if (proc != NULL)
        {
            int hidden = unit->state & US_UNDER_A_ROOF;

            if (!hidden)
            {
                u32 pos_load, pos_move;

                TryMoveUnit(unit, def->x_load, def->y_load, FALSE);
                RefreshUnitSprites();

                pos_load = *(u16 const *) &def->x_load;
                pos_move = *(u16 const *) &def->x_move;

                if ((pos_load & 0xFFFF) != (pos_move & 0xFFFF))
                    TryMoveUnitDisplayed(proc, unit, def->x_move, def->y_move, hidden);

                return;
            }
        }

        TryMoveUnit(unit, def->x_move, def->y_move, TRUE);
        RefreshUnitSprites();
    }
    else
    {
        TryMoveUnit(unit, def->x_move, def->y_move, TRUE);
        RefreshUnitSprites();
    }
}

bool sub_0800A7A0(void)
{
    if (gpKeySt->held & R_BUTTON)
        return TRUE;

    return FALSE;
}

extern int gUnk_03000100;
extern u8 CONST_DATA gUnk_08B90C9C[];

int sub_0800A7BC(void)
{
    gUnk_03000100 = 0;
    return 1;
}

int sub_0800A7CC(void)
{
    return gUnk_08B90C9C[gUnk_03000100++];
}

int ParsePopupInstAndGetLen(struct PopupProc * proc)
{
    char str[0x10];
    int len = 0;
    struct PopupInstruction const * inst;

    for (inst = proc->inst; inst->opcode != POPUP_OP_END; inst++)
    {
        switch (inst->opcode)
        {
        case POPUP_OP_SOUND:
            proc->song = inst->data;
            break;

        case POPUP_OP_NUM:
            len += NumberToStringAscii(gPopupNumber, str) * 8;
            break;

        case POPUP_OP_ITEM_ICON:
            proc->icon_x = len;
            proc->icon = GetItemIconId(gPopupItem);
            ApplyIconPalette(0, proc->icon_pal);
            len += 0x10;
            break;

        case POPUP_OP_WTYPE_ICON:
            proc->icon_x = len;
            proc->icon = gPopupItem + 0x70;
            ApplyIconPalette(1, proc->icon_pal);
            len += 0x10;
            break;

        case POPUP_OP_MSG:
            len += GetStringTextLen(DecodeMsg(inst->data));
            break;

        case POPUP_OP_STR:
            len += GetStringTextLen((char const *) inst->data);
            break;

        case POPUP_OP_UNIT_NAME:
            len += GetStringTextLen(DecodeMsg(gPopupUnit->pCharacterData->nameTextId));
            break;

        case POPUP_OP_ITEM_NAME:
            len += GetStringTextLen(GetItemName(gPopupItem));
            break;

        case POPUP_OP_ITEM_STR_CAP:
            len += GetStringTextLen(GetItemNameWithArticle(gPopupItem, TRUE));
            break;

        case POPUP_OP_ITEM_STR:
            len += GetStringTextLen(GetItemNameWithArticle(gPopupItem, FALSE));
            break;

        case POPUP_OP_SPACE:
            len += inst->data;
            break;

        case POPUP_OP_COLOR:
        default:
            break;
        }
    }

    return len;
}

void GeneratePopupText(struct PopupInstruction const * inst, struct Text text)
{
    char str[0x10];

    for (; inst->opcode != POPUP_OP_END; inst++)
    {
        switch (inst->opcode)
        {
        case POPUP_OP_NUM:
            NumberToStringAscii(gPopupNumber, str);
            Text_DrawString(&text, str);
            break;

        case POPUP_OP_WTYPE_ICON:
        case POPUP_OP_ITEM_ICON:
            Text_Skip(&text, 0x10);
            break;

        case POPUP_OP_COLOR:
            Text_SetColor(&text, inst->data);
            break;

        case POPUP_OP_MSG:
            Text_DrawString(&text, DecodeMsg(inst->data));
            break;

        case POPUP_OP_STR:
            Text_DrawString(&text, (char const *) inst->data);
            break;

        case POPUP_OP_UNIT_NAME:
            Text_DrawString(&text, DecodeMsg(gPopupUnit->pCharacterData->nameTextId));
            break;

        case POPUP_OP_ITEM_NAME:
            Text_DrawString(&text, GetItemName(gPopupItem));
            break;

        case POPUP_OP_ITEM_STR_CAP:
            Text_DrawString(&text, GetItemNameWithArticle(gPopupItem, TRUE));
            break;

        case POPUP_OP_ITEM_STR:
            Text_DrawString(&text, GetItemNameWithArticle(gPopupItem, FALSE));
            break;

        case POPUP_OP_SPACE:
            Text_Skip(&text, inst->data);

        default:
            break;
        }
    }

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void PopupProc_Init(struct PopupProc * proc)
{
    proc->x_tile_param = -1;
    proc->y_tile_param = -1;
    proc->text_color = TEXT_COLOR_SYSTEM_WHITE;
    proc->icon = -1;
    proc->icon_x = 0;
    proc->song = 0;
}

void PopupProc_PrepareGfx(struct PopupProc * proc)
{
    InitTextFont(NULL, (void *) BG_VRAM + 0x2000 + GetBgChrOffset(0), 0x100, 0);
    ClearIcons();
    UnpackUiWindowFrameGraphics();

    SetBlendNone();
    SetWinEnable(0, 0, 0);

    proc->x_gfx_size = ParsePopupInstAndGetLen(proc);
}

void PopupProc_MaybeSetVolume(struct PopupProc * proc)
{
    if (proc->song != 0)
        StartBgmVolumeChange(0x100, 0x80, 0x10, proc);
}

void PopupProc_PlaySound(struct PopupProc * proc)
{
    if (proc->song != 0)
        PlaySoundEffect(proc->song);
}

void PopupProc_MaybeResetVolume(struct PopupProc * proc)
{
    if (proc->song != 0)
        StartBgmVolumeChange(0x80, 0x100, 0x10, proc);
}

void PopupIconUpdateProc_Loop(struct PopupIconUpdateProc * proc)
{
    PutOamHiRam(proc->x, proc->y, Sprite_16x16, proc->oam2);
}

void PopupProc_GfxDraw(struct PopupProc * proc)
{
    struct Text text;
    int icon_pos;
    int tile_len;
    int x, y;
    int width;

    u32 len;

    len = ParsePopupInstAndGetLen(proc);
    proc->x_gfx_size = len;
    tile_len = (len << 0x10) >> 0x13;

    if ((len & 7) != 0)
        tile_len++;

    icon_pos = (tile_len * 8 - proc->x_gfx_size) >> 1;

    if (proc->x_tile_param == -1)
        x = ((0x1E - tile_len) >> 1) - 1;
    else
        x = proc->x_tile_param;

    if (proc->y_tile_param != -1)
        y = proc->y_tile_param;
    else
        y = 8;

    width = tile_len + 2;
    DrawUiFrame2(x, y, width, 4, proc->window_kind);

    proc->x_tile = x;
    proc->y_tile = y;
    proc->x_tile_size = width;
    proc->y_tile_size = 3;
    proc->icon_x += icon_pos;

    InitText(&text, tile_len);
    Text_SetColor(&text, proc->text_color);
    Text_SetCursor(&text, icon_pos);
    GeneratePopupText(proc->inst, text);

    if (proc->icon != 0xFFFF)
        PutIconObjImg(proc->icon, proc->icon_chr);

    PutText(&text, gBg0Tm + TM_OFFSET(x + 1, y + 1));
    ResetText();

    if (proc->icon != 0xFFFF)
    {
        struct PopupIconUpdateProc * child = Proc_Start(ProcScr_PopupUpdateIcon, proc);

        child->x = (proc->x_tile + 1) * 8 + proc->icon_x;
        child->y = (proc->y_tile + 1) * 8;
        child->oam2 = proc->icon_chr | (proc->icon_pal & 0xF) << 0xC;
    }
}

void PopupProc_WaitForPress(struct PopupProc * proc)
{
    if (proc->clock < 0)
    {
        if (gpKeySt->pressed != 0)
        {
            Proc_Break(proc);
            return;
        }
    }
    else if (proc->clock != 0)
    {
        proc->clock--;

        if (proc->clock == 0)
            Proc_Break(proc);
    }
}

void PopupProc_GfxClear(struct PopupProc * proc)
{
    TmFillRect_thm(gBg0Tm + TM_OFFSET(proc->x_tile, proc->y_tile), proc->x_tile_size, proc->y_tile_size, 0);
    TmFillRect_thm(gBg1Tm + TM_OFFSET(proc->x_tile, proc->y_tile), proc->x_tile_size, proc->y_tile_size, 0);
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void SetPopupUnit(struct Unit * unit)
{
    gPopupUnit = unit;
}

void SetPopupItem(u16 item)
{
    gPopupItem = item;
}

void SetPopupNumber(u32 num)
{
    gPopupNumber = num;
}

ProcPtr NewPopup_Simple(struct PopupInstruction const * inst, int clock, int window_kind, ProcPtr parent)
{
    return NewPopupCore(inst, clock, window_kind, 0x240, 4, parent);
}

ProcPtr NewPopupCore(struct PopupInstruction const * inst, int clock, int window_kind, int icon_chr, int icon_pal, ProcPtr parent)
{
    struct PopupProc * proc;

    if (parent != NULL)
        proc = Proc_StartBlocking(ProcScr_Popup, parent);
    else
        proc = Proc_Start(ProcScr_Popup, PROC_TREE_3);

    proc->clock = clock;
    proc->inst = inst;
    proc->window_kind = window_kind;
    proc->icon_chr = icon_chr;
    proc->icon_pal = icon_pal + 0x10;

    return proc;
}

void EndPopups(void)
{
    Proc_EndEach(ProcScr_Popup);
}

int EvtCmd_NoSkip(struct EventProc * proc);
int EvtCmd_NoSkipTalk(struct EventProc * proc);
int EvtCmd_NoSkipTalkSlow(struct EventProc * proc);
int EvtCmd_SilentSkip(struct EventProc * proc);
int EvtCmd_NoSkipUnlessNewGamePlus(struct EventProc * proc);
int EvtCmd_NoSkipTalkSlowUnlessNewGamePlus(struct EventProc * proc);
int EvtCmd_NoSkipSlowUnlessNewGamePlus(struct EventProc * proc);

bool FaceExists(void);
bool sub_0800A4E8();
bool IsMapFadeActive(void);
void EndMapMain(void);
void sub_080143E0(void);
void SetMuMaxWalkSpeed(void);
bool sub_080B5644(void);

extern u8 gEventQueueCount;
extern EventScr const * gEventQueue[];

extern struct ProcCmd CONST_DATA ProcScr_08B90B9C[];
extern struct ProcCmd CONST_DATA ProcScr_EventFadeOutOfBackgroundTalk[];
extern struct ProcCmd CONST_DATA ProcScr_08B90D40[];
extern struct ProcCmd CONST_DATA ProcScr_EventFadeOutOfSkip[];
extern struct ProcCmd CONST_DATA ProcScr_EventDarkenThenFunc[];
extern struct ProcCmd CONST_DATA ProcScr_08B969E4[];

void sub_0800ADD0(ProcPtr proc);

void sub_0800ADB8(void)
{
    Proc_ForEach(ProcScr_UnkEvt, sub_0800ADD0);
}

void sub_0800ADD0(ProcPtr proc)
{
    EvtCmd_NoSkip(proc);
}

void Event_FadeOutOfBackgroundTalk(struct EventProc * proc)
{
    Proc_StartBlocking(ProcScr_EventFadeOutOfBackgroundTalk, proc);
}

void Event_FadeOutOfSkip(struct EventProc * proc)
{
    Proc_StartBlocking(ProcScr_EventFadeOutOfSkip, proc);
}

void sub_0800AE04(struct EventProc * proc)
{
    Proc_StartBlocking(ProcScr_08B90D40, proc);
}

void sub_0800AE18(ProcPtr proc)
{
    struct EventProc * parent = ((struct Proc *) proc)->proc_parent;

    if ((parent->flags & EVENT_FLAG_SKIPPED) == 0)
        StartMidLockingFadeToBlack(proc);
}

void sub_0800AE34(ProcPtr proc)
{
    struct EventProc * parent = ((struct Proc *) proc)->proc_parent;

    if ((parent->flags & EVENT_FLAG_SKIPPED) == 0)
        StartMidLockingFadeFromBlack(proc);
}

void sub_0800AE50(void)
{
    RefreshBMapGraphics();
    UnlockBmDisplay();
    ReleaseMus();

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    EnableBgSync(BG0_SYNC_BIT);
    EnableBgSync(BG1_SYNC_BIT);

    ClearTalk();
}

void sub_0800AE8C(ProcPtr proc)
{
    struct EventProc * parent = ((struct Proc *) proc)->proc_parent;

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    EnableBgSync(BG0_SYNC_BIT);
    EnableBgSync(BG1_SYNC_BIT);

    ClearTalk();
    RefreshBMapGraphics();

    if ((parent->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        if (parent->unk_4D)
            StartLockingFadeFromBlack(0x20, proc);
    }
    else
    {
        StartMidLockingFadeFromBlack(proc);
    }
}

void EventForceSlowTextSpeed(struct EventProc * proc)
{
    if (proc->text_speed == -1)
    {
        proc->text_speed = gPlaySt.cfgTextSpeed;
        gPlaySt.cfgTextSpeed = 1;
    }
}

void sub_0800AF20(struct EventProc * proc)
{
    if (proc->text_speed != -1)
    {
        gPlaySt.cfgTextSpeed = proc->text_speed;
        proc->text_speed = -1;
    }
}

ProcPtr StartEvent(EventScr const * script)
{
    return StartEventInternal(script, PROC_TREE_3);
}

ProcPtr StartEventLocking(EventScr const * script, ProcPtr parent)
{
    return StartEventInternal(script, parent);
}

ProcPtr StartEventInternal(EventScr const * script, ProcPtr parent)
{
    struct EventProc * proc = Proc_Find(ProcScr_UnkEvt);

    if (proc != NULL)
    {
        gEventQueue[gEventQueueCount] = script;
        gEventQueueCount++;

        return proc;
    }

    gEventQueueCount = 0;
    gEventQueue[0] = NULL;

    if ((int) parent < 8)
        proc = Proc_Start(ProcScr_UnkEvt, parent);
    else
        proc = Proc_StartBlocking(ProcScr_UnkEvt, parent);

    proc->script_start = script;
    proc->script = script;
    proc->script_return = NULL;
    proc->script_return_pc = NULL;
    proc->idle_func = NULL;
    proc->skip_func = NULL;
    proc->talk_auto_msg = 0;
    proc->flags = EVENT_FLAG_UNITCAM;
    proc->sleep_duration = 0;
    proc->unk_4E = 0;
    proc->ignore_count = 0;
    proc->background = -1;
    proc->text_speed = -1;

    if (gDispIo.blend_ct.effect == BLEND_EFFECT_DARKEN && gDispIo.blend_y == 0x10)
        proc->unk_4D = TRUE;
    else
        proc->unk_4D = FALSE;

    BmMapFillg(gBmMapOther, 0);

    switch (proc->script[0])
    {
    case 0x8A:
        proc->script++;
        EvtCmd_SilentSkip(proc);
        break;

    case 0x86:
        proc->script++;
        EvtCmd_NoSkip(proc);
        break;

    case 0x87:
        proc->script++;
        EvtCmd_NoSkipTalk(proc);
        break;

    case 0x88:
        proc->script++;
        EvtCmd_NoSkipTalkSlow(proc);
        break;

    case 0x8B:
        proc->script++;
        EvtCmd_NoSkipUnlessNewGamePlus(proc);
        break;

    case 0x8C:
        proc->script++;
        EvtCmd_NoSkipTalkSlowUnlessNewGamePlus(proc);
        break;

    case 0x8D:
        proc->script++;
        EvtCmd_NoSkipSlowUnlessNewGamePlus(proc);
        break;
    }

    return proc;
}

void sub_0800B0F0(struct EventProc * proc)
{
    LockGame();
    proc->idle_func = NULL;
}

void sub_0800B104(void)
{
    UnlockGame();
}

void sub_0800B110(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_DISABLETEXTSKIP) == 0)
    {
        SetTextFont(NULL);
        InitSystemTextFont();
        UnpackUiWindowFrameGraphics();
    }
}

void sub_0800B130(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_SKIPPED;

    if (gEventQueueCount != 0)
    {
        gEventQueueCount--;

        proc->idle_func = NULL;
        proc->script_start = gEventQueue[gEventQueueCount];
        proc->script = gEventQueue[gEventQueueCount];

        Proc_Goto(proc, 0);
    }
}

void sub_0800B180(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_DISABLESKIP) != 0)
        EndMapMain();
}

void sub_0800B198(struct EventProc * proc)
{
    sub_080143E0();
    Proc_EndEach(ProcScr_08B90B9C);

    if (proc->background == -1)
        SetMuMaxWalkSpeed();
}

bool Event_IsSkipAllowed(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return FALSE;

    if ((proc->flags & EVENT_FLAG_NOAUTOCLEAR) != 0)
        return FALSE;

    if (IsBattleDeamonActive())
        return FALSE;

    return TRUE;
}

struct EventDarkenThenFuncProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ STRUCT_PAD(0x2C, 0x4C);
    /* 4C */ ProcPtr arg;
    /* 50 */ void (* func)(ProcPtr arg);
    /* 54 */ STRUCT_PAD(0x54, 0x64);
    /* 64 */ u16 speed;
    /* 66 */ s16 counter;
};

void EventDarkenThenFunc_StartDarken(struct EventDarkenThenFuncProc * proc);
void EventDarkenThenFunc_StepDarken(struct EventDarkenThenFuncProc * proc);

void Event_DarkenThenFunc(void (* func)(ProcPtr arg), ProcPtr arg)
{
    struct EventDarkenThenFuncProc * proc = Proc_StartBlocking(ProcScr_EventDarkenThenFunc, arg);

    proc->func = func;
    proc->arg = arg;
}

void EventDarkenThenFunc_OnInit(struct EventDarkenThenFuncProc * proc)
{
    EventDarkenThenFunc_StartDarken(proc);
    proc->speed = 0x40;
}

void EventDarkenThenFunc_OnLoop(struct EventDarkenThenFuncProc * proc)
{
    void (* func)(ProcPtr arg) = proc->func;

    EventDarkenThenFunc_StepDarken(proc);

    if (gDispIo.blend_y == 0x10)
    {
        func(proc->arg);
        Proc_Break(proc);
    }
}

void EventDarkenThenFunc_StartDarken(struct EventDarkenThenFuncProc * proc)
{
    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.win1_enable_blend = 1;
    gDispIo.win_ct.wobj_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    SetBlendDarken(0);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);

    proc->speed = 0x10;
    proc->counter = 0;
}

void EventDarkenThenFunc_StepDarken(struct EventDarkenThenFuncProc * proc)
{
    if (gDispIo.blend_y == 0x10)
    {
        Proc_End(proc);
        return;
    }

    proc->counter += proc->speed;

    if (proc->counter > 0xFF)
        proc->counter = 0x100;

    gDispIo.blend_y = (u16) proc->counter >> 4;
}

void Event_BeginSkip(struct EventProc * proc)
{
    proc->sleep_duration = 0;

    if (proc->skip_func != NULL)
        proc->skip_func();

    proc->flags |= EVENT_FLAG_SKIPPED;

    if (!sub_0800A4E8())
    {
        if (sub_080B5644())
        {
            sub_0800B198(proc);
        }
        else if ((proc->flags & EVENT_FLAG_ENDMAPMAIN) == 0)
        {
            if (proc->unk_4D)
                sub_0800B198(proc);
            else
                Event_DarkenThenFunc((void (*)(ProcPtr)) sub_0800B198, proc);
        }

        proc->unk_4D = TRUE;
    }

    Proc_BlockEachMarked(5);

    if (proc->idle_func != NULL)
        proc->idle_func(proc);
}

void Event_MainLoop(struct EventProc * proc)
{
    if (Proc_Find(ProcScr_08B969E4))
        return;

    if (IsSubtitleHelpActive())
        return;

    if (IsMapFadeActive())
        return;

    if (Event_IsSkipAllowed(proc) && (gpKeySt->pressed & START_BUTTON))
    {
        Event_BeginSkip(proc);
        return;
    }

    if (proc->sleep_duration != 0)
    {
        proc->sleep_duration--;

        if (proc->unk_4E && (gPlaySt.cfgGameSpeed || (gpKeySt->held & A_BUTTON)))
        {
            if (proc->sleep_duration != 0)
            {
                proc->sleep_duration--;

                if (proc->sleep_duration != 0)
                {
                    proc->sleep_duration--;

                    if (proc->sleep_duration != 0)
                        proc->sleep_duration--;
                }
            }
        }

        return;
    }

    if (proc->idle_func != NULL)
    {
        proc->idle_func(proc);
        return;
    }

    while (TRUE)
    {
        u16 cmd = *(u16 const *) proc->script;
        int ret;

        if (proc->ignore_count != 0)
        {
            proc->ignore_count--;
            ret = EVENT_CMDRET_CONTINUE;
        }
        else
        {
            ret = gEventCmdTable[cmd].func(proc);
        }

        if (ret == EVENT_CMDRET_JUMPED)
            continue;

        if (ret == EVENT_CMDRET_REPEAT)
            return;

        proc->script += gEventCmdTable[cmd].length;

        if (ret == EVENT_CMDRET_YIELD)
            return;
    }
}

void Event_WaitForFaceEnd(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_DISABLETEXTSKIP) != 0 || !FaceExists())
        Proc_Break(proc);
}
