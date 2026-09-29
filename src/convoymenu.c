#include "gbafe.h"

extern u8 gConvoyItemCount; // ewram_overlay_0

extern const struct ProcCmd gProcCmd_ConvoyMenu[];
extern const struct MenuDef gSendToConvoyMenuDef;
extern const struct MenuDef gConvoyMenuDef;

struct MenuProc * StartLockingMenu(const struct MenuDef * def, ProcPtr parent);
void EndMenuItemPanel(void);
void NewPopup2_SendItem(ProcPtr parent, int item);
void NewPopup2_DropItem(ProcPtr parent, int item);
int ItemSelectMenu_TextDraw(struct MenuProc * menu, struct MenuItemProc * item);
void StartBoxDialogueSimple(int x, int y, int msg, ProcPtr parent);

#define CONVOY_ITEM_COUNT 100

// gActionSt.arena_begin_rand_st[0..1] are FE8U's gActionData.item and gActionData.unk08
#define ActionItem (gActionSt.arena_begin_rand_st[0])
#define ActionItemSlot (gActionSt.arena_begin_rand_st[1])

int ConvoyMenuProc_StarMenu(ProcPtr proc)
{
    gConvoyItemCount = GetConvoyItemCount();
    ApplyIconPalettes(4);

    if (HasConvoyAccess() && (gConvoyItemCount < CONVOY_ITEM_COUNT))
        StartLockingMenu(&gSendToConvoyMenuDef, proc);
    else
        StartLockingMenu(&gConvoyMenuDef, proc);

    return 0;
}

int ConvoyMenuProc_MenuEnd(ProcPtr proc)
{
    EndSubtitleHelp();
    EndMenuItemPanel();

    if (0 == gBmSt.convoy_item_overflow)
    {
        Proc_Goto(proc, 0x63);
        return 1;
    }

    return 0;
}

int ConvoyMenuProc_MaybeStartSelectConvoyItem(ProcPtr proc)
{
    MaybeStartSelectConvoyItemProc(NULL, proc);
    return 0;
}

int ConvoyMenuProc_SendToConvoyReal(ProcPtr proc)
{
    return AddItemToConvoy(gBmSt.convoy_item_overflow);
}

void ConvoyMenuProc_SetupActiveUnit(ProcPtr proc)
{
    gActiveUnit = GetUnit(gActionSt.instigator);
}

void ConvoyMenuProc_ExecBootlegPopup(ProcPtr proc)
{
    if (HasConvoyAccess())
    {
        if (gConvoyItemCount < CONVOY_ITEM_COUNT)
            NewPopup2_SendItem(proc, ActionItem);
        else
            NewPopup2_DropItem(proc, ActionItem);
    }
    else
        NewPopup2_DropItem(proc, ActionItem);
}

void HandleGiveUnitItem(struct Unit * unit, int item, ProcPtr proc)
{
    u8 ret = UnitAddItem(unit, item);
    if (FALSE != ret)
        return;

    gActiveUnit = unit;
    gBmSt.inventory_item_overflow = item;
    StartFace(0, GetUnitPortraitId(unit), 0xB0, 4, 2);
    SetFaceBlinkControlById(0, 5);
    StartEquipInfoWindow(proc, unit, 0xF, 0xA);

    if (HasConvoyAccess() && GetConvoyItemCount() < CONVOY_ITEM_COUNT)
        StartSubtitleHelp(proc, DecodeMsg(0x727));
    else
        StartSubtitleHelp(proc, DecodeMsg(0x728));

    SetTalkChoiceResult(2);
    Proc_StartBlocking(gProcCmd_ConvoyMenu, proc);
}

int SendToConvoyMenu_Draw(struct MenuProc * proc_menu, struct MenuItemProc * proc_cmd)
{
    return ItemSelectMenu_TextDraw(proc_menu, proc_cmd);
}

int MenuCommand_DrawExtraItem(struct MenuProc * proc_menu, struct MenuItemProc * proc_cmd)
{
    u16 item = gBmSt.inventory_item_overflow;
    struct Text * text = &proc_cmd->text;

    Text_SetColor(text, TEXT_COLOR_SYSTEM_BLUE);
    DrawItemMenuLineNoColor(text, item, gBg0Tm + TM_OFFSET(proc_cmd->xTile, proc_cmd->yTile));
    EnableBgSync(BG0_SYNC_BIT);
}

u8 SendToConvoyMenu_NormalEffect(struct MenuProc * proc_menu, struct MenuItemProc * proc_cmd)
{
    AddItemToConvoy(gActiveUnit->items[proc_cmd->itemNumber]);
    ActionItem = gActiveUnit->items[proc_cmd->itemNumber];
    UnitRemoveItem(gActiveUnit, proc_cmd->itemNumber);
    UnitAddItem(gActiveUnit, gBmSt.inventory_item_overflow);
    return MENU_ACT_ENDFACE | MENU_ACT_CLEAR | MENU_ACT_SND6A | MENU_ACT_END | MENU_ACT_SKIPCURSOR;
}

u8 MenuCommand_SendItemToConvoy(struct MenuProc * proc_menu, struct MenuItemProc * proc_cmd)
{
    AddItemToConvoy(gBmSt.inventory_item_overflow);
    ActionItem = gBmSt.inventory_item_overflow;
    return MENU_ACT_ENDFACE | MENU_ACT_CLEAR | MENU_ACT_SND6A | MENU_ACT_END | MENU_ACT_SKIPCURSOR;
}

u8 SendToConvoyMenu_Selected(struct MenuProc * proc_menu, struct MenuItemProc * proc_cmd)
{
    u16 item = gActiveUnit->items[proc_cmd->itemNumber];

    ActionItem = item;
    ActionItemSlot = proc_cmd->itemNumber;
    LoadHelpBoxGfx(NULL, -1);
    SetTalkChoiceResult(2);

    if (GetItemAttributes(item) & IA_UNSELLABLE)
        StartBoxDialogueSimple(8, proc_cmd->itemNumber * 0x10 + 0x20, 0x762, proc_menu);
    else
        StartBoxDialogueSimple(8, proc_cmd->itemNumber * 0x10 + 0x20, 0x761, proc_menu);

    return 0;
}

u8 SendToConvoyMenu_Selected2(struct MenuProc * proc_menu, struct MenuItemProc * proc_cmd)
{
    u16 item = gBmSt.inventory_item_overflow;

    ActionItem = item;
    ActionItemSlot = UNIT_ITEM_COUNT;
    LoadHelpBoxGfx(NULL, -1);
    SetTalkChoiceResult(2);

    if (GetItemAttributes(item) & IA_UNSELLABLE)
        StartBoxDialogueSimple(8, proc_cmd->itemNumber * 0x10 + 0x20, 0x762, proc_menu);
    else
        StartBoxDialogueSimple(8, proc_cmd->itemNumber * 0x10 + 0x20, 0x761, proc_menu);

    return 0;
}

u8 SendToConvoyMenu_Idle(struct MenuProc * proc_menu, struct MenuItemProc * proc_cmd)
{
    if (1 != GetTalkChoiceResult())
        return 0;

    gpKeySt->pressed = 0;

    if (ActionItemSlot < UNIT_ITEM_COUNT)
    {
        UnitRemoveItem(gActiveUnit, ActionItemSlot);
        UnitAddItem(gActiveUnit, gBmSt.inventory_item_overflow);
    }

    return MENU_ACT_ENDFACE | MENU_ACT_CLEAR | MENU_ACT_SND6A | MENU_ACT_END | MENU_ACT_SKIPCURSOR;
}

SECTION(".rodata.08B9369C")
const struct ProcCmd gProcCmd_ConvoyMenu[] = {
    PROC_CALL_2(ConvoyMenuProc_StarMenu),
    PROC_CALL_2(ConvoyMenuProc_MenuEnd),
    PROC_SLEEP(1),
    PROC_CALL_2(ConvoyMenuProc_MaybeStartSelectConvoyItem),
    PROC_CALL_2(ConvoyMenuProc_SendToConvoyReal),
    PROC_LABEL(99),
    PROC_CALL(ConvoyMenuProc_SetupActiveUnit),
    PROC_CALL(ConvoyMenuProc_ExecBootlegPopup),
    PROC_SLEEP(0),
    PROC_END,
};

extern const struct MenuItemDef gConvoyMenuItems[];
extern const struct MenuItemDef gUnk_08B94CC0[];
extern const struct MenuItemDef gUnk_08B94DBC[];

SECTION(".rodata.08B94BC4")
const struct MenuItemDef gConvoyMenuItems[] = {
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x23,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = SendToConvoyMenu_Draw,
        .onSelected = SendToConvoyMenu_Selected,
        .onIdle = SendToConvoyMenu_Idle,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x24,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = SendToConvoyMenu_Draw,
        .onSelected = SendToConvoyMenu_Selected,
        .onIdle = SendToConvoyMenu_Idle,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x25,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = SendToConvoyMenu_Draw,
        .onSelected = SendToConvoyMenu_Selected,
        .onIdle = SendToConvoyMenu_Idle,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x26,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = SendToConvoyMenu_Draw,
        .onSelected = SendToConvoyMenu_Selected,
        .onIdle = SendToConvoyMenu_Idle,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x27,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = SendToConvoyMenu_Draw,
        .onSelected = SendToConvoyMenu_Selected,
        .onIdle = SendToConvoyMenu_Idle,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x28,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = MenuCommand_DrawExtraItem,
        .onSelected = SendToConvoyMenu_Selected2,
        .onIdle = SendToConvoyMenu_Idle,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    { 0 },
};

SECTION(".rodata.08B94CC0")
const struct MenuItemDef gUnk_08B94CC0[] = {
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x29,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = SendToConvoyMenu_Draw,
        .onSelected = SendToConvoyMenu_NormalEffect,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x2A,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = SendToConvoyMenu_Draw,
        .onSelected = SendToConvoyMenu_NormalEffect,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x2B,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = SendToConvoyMenu_Draw,
        .onSelected = SendToConvoyMenu_NormalEffect,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x2C,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = SendToConvoyMenu_Draw,
        .onSelected = SendToConvoyMenu_NormalEffect,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x2D,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = SendToConvoyMenu_Draw,
        .onSelected = SendToConvoyMenu_NormalEffect,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    {
        .name = gUnk_081C3D94,
        .overrideId = 0x2E,
        .isAvailable = MenuAlwaysEnabled,
        .onDraw = MenuCommand_DrawExtraItem,
        .onSelected = MenuCommand_SendItemToConvoy,
        .onSwitchIn = Menu_SwitchIn,
        .onSwitchOut = Menu_SwitchOut_DoNothing,
    },
    { 0 },
};

SECTION(".rodata.08B94DBC")
const struct MenuItemDef gUnk_08B94DBC[] = {
    {
        .name = gUnk_081C3E60,
        .nameMsgId = 0x10F0,
        .helpMsgId = 0x36B,
        .overrideId = 0x2F,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = StartFightBallistaReview,
    },
    {
        .name = gUnk_081C3E54,
        .nameMsgId = 0x10F1,
        .helpMsgId = 0x36A,
        .overrideId = 0x30,
        .isAvailable = MenuAlwaysEnabled,
        .onSelected = StartFightItemReview,
    },
    { 0 },
};

extern const struct MenuDef gUnk_08B9598C;

SECTION(".rodata.08B95944")
const struct MenuDef gConvoyMenuDef = {
    .rect = { .x = 1, .y = 1, .w = 0xE },
    .menuItems = gConvoyMenuItems,
    .onRPress = MenuAutoHelpBoxSelect,
    .onHelpBox = ConvoyMenu_HelpBox,
};

SECTION(".rodata.08B95968")
const struct MenuDef gSendToConvoyMenuDef = {
    .rect = { .x = 1, .y = 1, .w = 0xE },
    .menuItems = gUnk_08B94CC0,
    .onRPress = MenuAutoHelpBoxSelect,
    .onHelpBox = ConvoyMenu_HelpBox,
};

SECTION(".rodata.08B9598C")
const struct MenuDef gUnk_08B9598C = {
    .rect = { .x = 0x14, .y = 3, .w = 9 },
    .menuItems = gUnk_08B94DBC,
    .onBPress = ItemMenu_ButtonBPressed,
    .onRPress = MenuAutoHelpBoxSelect,
    .onHelpBox = MenuStdHelpBox,
};
