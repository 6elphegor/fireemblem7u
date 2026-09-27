#include "gbafe.h"




bool UnitInfoRequiresNoMovement(struct UnitDefinition const * def);
void TryMoveUnit(struct Unit * unit, int x, int y, bool arg);
void TryMoveUnitDisplayed(struct EventProc * proc, struct Unit * unit, int x, int y, int arg);
bool sub_08079954(struct Unit * unit);
bool sub_08079A14(struct Unit * unit);

void sub_0800A71C(struct UnitDefinition const * def, struct Unit * unit, struct EventProc * proc, bool move);

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

void sub_0800AD1C(struct Unit * unit)
{
    gPopupUnit = unit;
}

void sub_0800AD28(u16 item)
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

ASM_FUNC("asm/nonmatching/code_0800ADB8.s");
ASM_FUNC("asm/nonmatching/code_0800ADD0.s");
ASM_FUNC("asm/nonmatching/code_0800ADDC.s");
ASM_FUNC("asm/nonmatching/code_0800ADF0.s");
ASM_FUNC("asm/nonmatching/code_0800AE04.s");
ASM_FUNC("asm/nonmatching/code_0800AE18.s");
ASM_FUNC("asm/nonmatching/code_0800AE34.s");
ASM_FUNC("asm/nonmatching/code_0800AE50.s");
ASM_FUNC("asm/nonmatching/code_0800AE8C.s");
ASM_FUNC("asm/nonmatching/code_0800AEF0.s");
ASM_FUNC("asm/nonmatching/code_0800AF20.s");
ASM_FUNC("asm/nonmatching/code_0800AF5C.s");
ASM_FUNC("asm/nonmatching/code_0800AF68.s");
ASM_FUNC("asm/nonmatching/code_0800AF74.s");
ASM_FUNC("asm/nonmatching/code_0800B0F0.s");
ASM_FUNC("asm/nonmatching/code_0800B104.s");
ASM_FUNC("asm/nonmatching/code_0800B110.s");
ASM_FUNC("asm/nonmatching/code_0800B130.s");
ASM_FUNC("asm/nonmatching/code_0800B180.s");
ASM_FUNC("asm/nonmatching/code_0800B198.s");
ASM_FUNC("asm/nonmatching/code_0800B1C4.s");
ASM_FUNC("asm/nonmatching/code_0800B1F0.s");
ASM_FUNC("asm/nonmatching/code_0800B20C.s");
ASM_FUNC("asm/nonmatching/code_0800B220.s");
ASM_FUNC("asm/nonmatching/code_0800B24C.s");
ASM_FUNC("asm/nonmatching/code_0800B2C4.s");
ASM_FUNC("asm/nonmatching/code_0800B308.s");
ASM_FUNC("asm/nonmatching/code_0800B390.s");
ASM_FUNC("asm/nonmatching/code_0800B4A0.s");
