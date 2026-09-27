#include "gbafe.h"
#include "gbafe/bmmenu.h"
#include "gbafe/sio_core.h"

u8 sub_08049280(const struct MenuItemDef * def, int number)
{
    int item = gActiveUnit->items[number];

    if ((GetItemAttributes(item) & IA_WEAPON) == 0)
        return MENU_NOTSHOWN;

    if (GetItemMinRange(item) > 2)
        return MENU_DISABLED;

    if (!CanUnitUseWeapon(gActiveUnit, item))
        return MENU_NOTSHOWN;

    return MENU_ENABLED;
}

u8 sub_080492CC(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    if (menuItem->availability == MENU_DISABLED)
        return MENU_ACT_SND6B;

    gUnk_Sio_0203DD90.unk_07 = menuItem->itemNumber;

    return MENU_ACT_SND6A | MENU_ACT_DOOM;
}

u8 sub_080492EC(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gUnk_Sio_0203DD90.unk_06 = menuItem->itemNumber + 1;
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

int sub_08049300(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    int item = gActiveUnit->items[menuItem->itemNumber];

    s8 color = CanUnitUseWeapon(gActiveUnit, item);

    if (GetItemMinRange(item) > 2)
        color = 0;

    DrawItemMenuLine(&menuItem->text, item, color, gBg0Tm + TM_OFFSET(menuItem->xTile, menuItem->yTile));
    EnableBgSync(BG0_SYNC_BIT);
}

u8 sub_08049364(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gUnk_Sio_0203DD90.unk_06 = 0;
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B | MENU_ACT_CLEAR;
}

u8 sub_08049374(struct MenuProc * menu)
{
    gUnk_Sio_0203DD90.unk_06 = 0;

    TmFillRect_thm(gBg0Tm + TM_OFFSET(menu->rect.x, menu->rect.y), menu->rect.w, menu->rect.h, 0);
    TmFillRect_thm(gBg1Tm + TM_OFFSET(menu->rect.x, menu->rect.y), menu->rect.w, menu->rect.h, 0);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;
}
