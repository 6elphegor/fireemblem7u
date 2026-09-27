#include "gbafe.h"
#include "gbafe/unk-functions.h"

enum
{
    MENU_STATE_GAMELOCKING = (1 << 0),
    MENU_STATE_ENDING = (1 << 2),
    MENU_STATE_NOTSHOWN = (1 << 3),
    MENU_STATE_FLAT = (1 << 4),
    MENU_STATE_NOCURSOR = (1 << 5),
    MENU_STATE_FROZEN = (1 << 6),
    MENU_STATE_DOOMED = (1 << 7),
};

enum
{
    MENU_OVERRIDE_NONE,
    MENU_OVERRIDE_ISAVAILABLE,
    MENU_OVERRIDE_ONSELECT,

    MENU_OVERRIDE_MAX = 16,
};

struct MenuItemOverride
{
    /* 00 */ s16 cmdid;
    /* 02 */ s16 kind;
    /* 04 */ void * func;
};

typedef u8 (* MenuAvailabilityFunc)(struct MenuItemDef const * def, int number);
typedef u8 (* MenuSelectFunc)(struct MenuProc * proc, struct MenuItemProc * item);

extern struct MenuItemOverride sMenuOverrides[MENU_OVERRIDE_MAX];

struct MenuProc * StartAdjustedMenu(const struct MenuDef * def, int xSubject, int xTileLeft, int xTileRight);
struct MenuProc * StartLockingMenu(const struct MenuDef * def, ProcPtr parent);
struct MenuProc * StartMenuExt(const struct MenuDef * def, struct MenuRect rect);
void Menu_OnInit(struct MenuProc * proc);
void RedrawMenu(struct MenuProc * proc);
void DrawMenuItemHover(struct MenuProc * proc, int item, s8 hover);
void Menu_OnIdle(struct MenuProc * proc);
void ProcessMenuDpadInput(struct MenuProc * proc);
int ProcessMenuSelectInput(struct MenuProc * proc);
void GetMenuCursorPosition(struct MenuProc * proc, int * x, int * y);
u8 MenuAlwaysNotShown(const struct MenuItemDef * def, int number);
void ApplyMenuCursorVScroll(struct MenuProc * proc, int * x, int * y);
void SetMenuOverride(int cmdid, int kind, void * func);
u8 OverriddenMenuAvailability(const struct MenuItemDef * def, int number);
u8 OverriddenMenuSelected(struct MenuProc * proc, struct MenuItemProc * item);
s8 HasMenuChangedItem(struct MenuProc * proc);

void Menu_AutoHelpBox_OnInit(struct MenuProc * proc);
void Menu_AutoHelpBox_OnLoop(struct MenuProc * proc);
void Menu_FrozenHelpBox_OnLoop(struct MenuProc * proc);
void Menu_Frozen_OnLoop(struct MenuProc * proc);

CONST_DATA struct ProcCmd ProcScr_MenuMain[] = {
    PROC_REPEAT(Menu_OnIdle),
    PROC_CALL(EndGreenText),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_Menu[] = {
    PROC_19,
    PROC_YIELD,
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(StartGreenText),
    PROC_CALL(RedrawMenu),
    PROC_CALL(Menu_OnInit),
    PROC_JUMP(ProcScr_MenuMain),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_MenuItem[] = {
    PROC_BLOCK,
};

CONST_DATA struct ProcCmd ProcScr_MenuAutoHelpBox[] = {
    PROC_CALL(Menu_AutoHelpBox_OnInit),
    PROC_REPEAT(Menu_AutoHelpBox_OnLoop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_MenuFrozenHelpBox[] = {
    PROC_REPEAT(Menu_FrozenHelpBox_OnLoop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_MenuFrozen[] = {
    PROC_REPEAT(Menu_Frozen_OnLoop),
    PROC_END,
};

CONST_DATA u8 sItemCountYOffsetLut[] = {
    0, 0, 0, 0, 0, 0, 0, 1,
    2, 3, 3, 3,
};

struct MenuProc * StartAdjustedMenu(const struct MenuDef * def, int xSubject, int xTileLeft, int xTileRight)
{
    struct MenuRect rect = def->rect;

    if (xSubject < 120)
        rect.x = xTileRight;
    else
        rect.x = xTileLeft;

    return StartLockingMenuExt(def, rect, NULL);
}

struct MenuProc * StartLockingMenu(const struct MenuDef * def, ProcPtr parent)
{
    return StartLockingMenuExt(def, def->rect, parent);
}

struct MenuProc * StartMenuExt(const struct MenuDef * def, struct MenuRect rect)
{
    return StartLockingMenuExt(def, rect, NULL);
}

struct MenuProc * StartMenu(const struct MenuDef * def)
{
    return StartLockingMenuExt(def, def->rect, NULL);
}

struct MenuProc * StartLockingMenuExt(const struct MenuDef * def, struct MenuRect rect, ProcPtr parent)
{
    struct MenuProc * proc;
    int i, item_count;

    int x_tile = rect.x + 1;
    int y_tile = rect.y + 1;

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);

    PlaySoundEffect(0x388);

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(ProcScr_Menu, parent);
        proc->state = 0;
    }
    else
    {
        LockGame();

        proc = Proc_Start(ProcScr_Menu, PROC_TREE_3);
        proc->state = MENU_STATE_GAMELOCKING;
    }

    if (rect.h < 0)
        proc->state |= MENU_STATE_NOTSHOWN;

    for (i = 0, item_count = 0; def->menuItems[i].isAvailable; i++)
    {
        int availability = OverriddenMenuAvailability(&def->menuItems[i], i);

        if (!availability)
            availability = def->menuItems[i].isAvailable(&def->menuItems[i], i);

        if (availability != MENU_NOTSHOWN)
        {
            struct MenuItemProc * item = Proc_Start(ProcScr_MenuItem, proc);
            proc->menuItems[item_count++] = item;

            item->def = &def->menuItems[i];
            item->itemNumber = i;
            item->availability = availability;

            item->xTile = x_tile;
            item->yTile = y_tile;

            if (!(proc->state & MENU_STATE_NOTSHOWN))
                InitText(&item->text, rect.w - 2);

            y_tile += 2;
        }
    }

    proc->def = def;
    proc->rect = rect;
    proc->itemCount = item_count;
    proc->itemCurrent = 0;
    proc->itemPrevious = -1;

    if (rect.y + rect.h < y_tile)
        proc->rect.h = y_tile + 1 - rect.y;

    gpKeySt->pressed = 0;

    return proc;
}

ProcPtr EndMenu(struct MenuProc * proc)
{
    struct MenuItemProc * item = proc->menuItems[proc->itemCurrent];

    proc->state |= MENU_STATE_ENDING;

    if (item->def->onSwitchOut)
        item->def->onSwitchOut(proc, item);

    if (proc->def->onEnd)
        proc->def->onEnd(proc);

    if (proc->state & MENU_STATE_GAMELOCKING)
        UnlockGame();

    Proc_End(proc);

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);

    return proc->proc_parent;
}

void EndAllMenus(void)
{
    Proc_ForEach(ProcScr_Menu, (ProcFunc) EndMenu);
}

inline s8 HasMenuChangedItem(struct MenuProc * proc)
{
    return proc->itemCurrent != proc->itemPrevious;
}

void Menu_OnInit(struct MenuProc * proc)
{
    if (proc->def->onInit)
        proc->def->onInit(proc);

    if (proc->menuItems[proc->itemCurrent]->def->onSwitchIn)
        proc->menuItems[proc->itemCurrent]->def->onSwitchIn(proc, proc->menuItems[proc->itemCurrent]);
}

void RedrawMenu(struct MenuProc * proc)
{
    int i;

    if (proc->state & MENU_STATE_NOTSHOWN)
        return;

    DrawUiFrame2(proc->rect.x, proc->rect.y, proc->rect.w, proc->rect.h, proc->def->style);

    for (i = 0; i < proc->itemCount; i++)
    {
        struct MenuItemProc * item = proc->menuItems[i];

        if (item->def->onDraw)
        {
            item->def->onDraw(proc, item);
            continue;
        }

        if (item->def->color)
            Text_SetColor(&item->text, item->def->color);

        if (item->availability == MENU_DISABLED)
            Text_SetColor(&item->text, TEXT_COLOR_SYSTEM_GRAY);

        if (item->def->nameMsgId)
        {
            Text_DrawString(&item->text, DecodeMsg(item->def->nameMsgId));
            PutText(&item->text, gBg0Tm + TM_OFFSET(item->xTile, item->yTile));
        }
    }

    DrawMenuItemHover(proc, proc->itemCurrent, TRUE);
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void DrawMenuItemHover(struct MenuProc * proc, int item, s8 hover)
{
    int x, y, w;

    if (proc->state & MENU_STATE_FLAT)
        return;

    x = proc->rect.x + 1;
    y = proc->menuItems[item]->yTile;
    w = proc->rect.w - 2;

    switch (hover)
    {
    case TRUE:
        DrawUiItemHover(x, y, w);
        break;

    case FALSE:
        ClearUiItemHover(x, y, w);
        break;
    }
}

void Menu_OnIdle(struct MenuProc * proc)
{
    int x, y, actions;

    if (proc->state & MENU_STATE_FROZEN)
    {
        GetMenuCursorPosition(proc, &x, &y);
        DisplayFrozenUiHand(x, y);

        return;
    }

    if (proc->state & MENU_STATE_DOOMED)
    {
        EndMenu(proc);
        return;
    }

    ProcessMenuDpadInput(proc);
    actions = ProcessMenuSelectInput(proc);

    if (actions & MENU_ACT_END)
        EndMenu(proc);

    if (actions & MENU_ACT_SND6A)
        PlaySoundEffect(0x38A);

    if (actions & MENU_ACT_SND6B)
        PlaySoundEffect(0x38B);

    if (actions & MENU_ACT_CLEAR)
        ClearUi();

    if (actions & MENU_ACT_ENDFACE)
        EndFaceById(0);

    if (actions & MENU_ACT_DOOM)
        proc->state |= MENU_STATE_DOOMED;

    if (actions & MENU_ACT_SKIPCURSOR)
        return;

    if (proc->state & MENU_STATE_NOCURSOR)
        return;

    GetMenuCursorPosition(proc, &x, &y);
    ApplyMenuCursorVScroll(proc, &x, &y);

    PutUiHand(x, y);
}

void ProcessMenuDpadInput(struct MenuProc * proc)
{
    proc->itemPrevious = proc->itemCurrent;

    if (gpKeySt->repeated & DPAD_UP)
    {
        if (proc->itemCurrent == 0)
        {
            if (gpKeySt->repeated != gpKeySt->pressed)
                return;

            proc->itemCurrent = proc->itemCount;
        }

        proc->itemCurrent--;
    }

    if (gpKeySt->repeated & DPAD_DOWN)
    {
        if (proc->itemCurrent == (proc->itemCount - 1))
        {
            if (gpKeySt->repeated != gpKeySt->pressed)
                return;

            proc->itemCurrent = -1;
        }

        proc->itemCurrent++;
    }

    if (proc->itemPrevious != proc->itemCurrent)
    {
        DrawMenuItemHover(proc, proc->itemPrevious, FALSE);
        DrawMenuItemHover(proc, proc->itemCurrent, TRUE);

        PlaySoundEffect(0x386);
    }

    if (proc->itemCurrent != proc->itemPrevious)
    {
        if (proc->menuItems[proc->itemPrevious]->def->onSwitchOut)
            proc->menuItems[proc->itemPrevious]->def->onSwitchOut(proc, proc->menuItems[proc->itemPrevious]);

        if (proc->menuItems[proc->itemCurrent]->def->onSwitchIn)
            proc->menuItems[proc->itemCurrent]->def->onSwitchIn(proc, proc->menuItems[proc->itemCurrent]);
    }
}

int ProcessMenuSelectInput(struct MenuProc * proc)
{
    u8 result = 0;

    struct MenuItemProc * item = proc->menuItems[proc->itemCurrent];
    const struct MenuItemDef * item_def = item->def;

    if (item_def->onIdle)
        result = item_def->onIdle(proc, item);

    if (gpKeySt->pressed & A_BUTTON)
    {
        result = OverriddenMenuSelected(proc, item);

        if ((result == 0xFF) && item_def->onSelected)
            result = item_def->onSelected(proc, item);
    }
    else if (gpKeySt->pressed & B_BUTTON)
    {
        if (proc->def->onBPress)
            result = proc->def->onBPress(proc, item);
    }
    else if (gpKeySt->pressed & R_BUTTON)
    {
        if (proc->def->onRPress)
            proc->def->onRPress(proc);
    }

    return result;
}

void GetMenuCursorPosition(struct MenuProc * proc, int * x, int * y)
{
    *x = proc->menuItems[proc->itemCurrent]->xTile * 8 - 4;
    *y = proc->menuItems[proc->itemCurrent]->yTile * 8;

    if (proc->def->style != 0)
        *x -= 4;
}

u8 MenuAlwaysEnabled(const struct MenuItemDef * def, int number)
{
    return MENU_ENABLED;
}

u8 MenuAlwaysDisabled(const struct MenuItemDef * def, int number)
{
    return MENU_DISABLED;
}

u8 MenuAlwaysNotShown(const struct MenuItemDef * def, int number)
{
    return MENU_NOTSHOWN;
}

u8 MenuCancelSelect(struct MenuProc * menu, struct MenuItemProc * item)
{
    return MENU_ACT_SKIPCURSOR | MENU_ACT_CLEAR | MENU_ACT_END | MENU_ACT_SND6B;
}

u8 MenuStdHelpBox(struct MenuProc * menu, struct MenuItemProc * item)
{
    StartHelpBox(item->xTile * 8, item->yTile * 8, item->def->helpMsgId);
}

void Menu_AutoHelpBox_OnInit(struct MenuProc * proc)
{
    LoadHelpBoxGfx(NULL, -1);
    proc->def->onHelpBox(proc, proc->menuItems[proc->itemCurrent]);
}

void Menu_AutoHelpBox_OnLoop(struct MenuProc * proc)
{
    int x, y;

    ProcessMenuDpadInput(proc);

    GetMenuCursorPosition(proc, &x, &y);
    ApplyMenuCursorVScroll(proc, &x, &y);

    PutUiHand(x, y);

    if (gpKeySt->pressed & (B_BUTTON | R_BUTTON))
    {
        CloseHelpBox();
        Proc_GotoScript(proc, ProcScr_MenuMain);

        return;
    }

    if (HasMenuChangedItem(proc))
        proc->def->onHelpBox(proc, proc->menuItems[proc->itemCurrent]);
}

u8 MenuAutoHelpBoxSelect(struct MenuProc * menu)
{
    Proc_GotoScript(menu, ProcScr_MenuAutoHelpBox);
}

void Menu_FrozenHelpBox_OnLoop(struct MenuProc * proc)
{
    int x, y;

    GetMenuCursorPosition(proc, &x, &y);
    ApplyMenuCursorVScroll(proc, &x, &y);

    DisplayFrozenUiHand(x, y);

    if (gpKeySt->pressed & (B_BUTTON | R_BUTTON))
    {
        CloseHelpBox();
        Proc_GotoScript(proc, ProcScr_MenuMain);
    }
}

u8 MenuFrozenHelpBox(struct MenuProc * proc, int msgid)
{
    Proc_GotoScript(proc, ProcScr_MenuFrozenHelpBox);

    LoadHelpBoxGfx(NULL, -1);
    StartHelpBox(GetUiHandPrevX(), GetUiHandPrevY(), msgid);
}

void Menu_Frozen_OnLoop(struct MenuProc * proc)
{
    int x, y;

    GetMenuCursorPosition(proc, &x, &y);
    ApplyMenuCursorVScroll(proc, &x, &y);

    DisplayFrozenUiHand(x, y);

    if (gpKeySt->pressed & (A_BUTTON | B_BUTTON))
        Proc_GotoScript(proc, ProcScr_MenuMain);
}

u8 MenuFrozen(struct MenuProc * proc)
{
    Proc_GotoScript(proc, ProcScr_MenuFrozen);
}

void FreezeMenu(void)
{
    struct MenuProc * proc = Proc_Find(ProcScr_Menu);

    if (proc)
        proc->state |= MENU_STATE_FROZEN;
}

void ResumeMenu(void)
{
    struct MenuProc * proc = Proc_Find(ProcScr_Menu);

    if (proc)
        proc->state &= ~MENU_STATE_FROZEN;
}

struct MenuProc * StartSemiCenteredOrphanMenu(const struct MenuDef * def, int xSubject, int xTileLeft, int xTileRight)
{
    struct MenuProc * result = StartAdjustedMenu(def, xSubject, xTileLeft, xTileRight);
    int i;

    if (result->itemCount <= 6)
        return result;

    result->rect.y -= sItemCountYOffsetLut[result->itemCount];

    for (i = 0; i < result->itemCount; i++)
        result->menuItems[i]->yTile -= sItemCountYOffsetLut[result->itemCount];

    return result;
}

void ApplyMenuCursorVScroll(struct MenuProc * proc, int * x, int * y)
{
    int off;

    if (proc->itemCount <= 9)
        return;

    off = (proc->itemCount * 16 - 9 * 16) * proc->itemCurrent / 9;

    SetBgOffset(0, 0, off);
    SetBgOffset(1, 0, off);

    *y -= off;
}

void ClearMenuOverrides(void)
{
    int i;

    for (i = 0; i < MENU_OVERRIDE_MAX; i++)
        sMenuOverrides[i].kind = MENU_OVERRIDE_NONE;
}

void GetForceDisabledMenuItems(u8 * list)
{
    int i;

    for (i = 0; i < MENU_OVERRIDE_MAX; i++)
    {
        if (sMenuOverrides[i].kind && sMenuOverrides[i].func == MenuAlwaysNotShown)
            list[i] = sMenuOverrides[i].cmdid;
        else
            list[i] = 0;
    }
}

void SetForceDisabledMenuItems(u8 const * list)
{
    int i;

    for (i = 0; i < MENU_OVERRIDE_MAX; i++)
        if (list[i])
            SetMenuOverride(list[i], MENU_OVERRIDE_ISAVAILABLE, MenuAlwaysNotShown);
}

void SetMenuOverride(int cmdid, int kind, void * func)
{
    struct MenuItemOverride * it = sMenuOverrides;

    while ((it->kind != 0) && !((it->kind == kind) && (it->cmdid == cmdid)))
        it++;

    it->cmdid = cmdid;
    it->kind = kind;
    it->func = func;
}

u8 OverriddenMenuAvailability(const struct MenuItemDef * def, int number)
{
    struct MenuItemOverride * it = sMenuOverrides;

    for (; it->kind != 0; it++)
    {
        if (it->kind != MENU_OVERRIDE_ISAVAILABLE)
            continue;

        if (it->cmdid != def->overrideId)
            continue;

        return ((MenuAvailabilityFunc) (it->func))(def, number);
    }

    return 0;
}

u8 OverriddenMenuSelected(struct MenuProc * proc, struct MenuItemProc * item)
{
    struct MenuItemOverride * it = sMenuOverrides;

    for (; it->kind != 0; it++)
    {
        if (it->kind != MENU_OVERRIDE_ONSELECT)
            continue;

        if (it->cmdid != item->def->overrideId)
            continue;

        return ((MenuSelectFunc) (it->func))(proc, item);
    }

    return 0xFF;
}
