#include "gbafe.h"

struct MenuItemPanelProc {
    PROC_HEADER;

    /* 2C */ struct Unit * unit;
    /* 30 */ u8 x;
    /* 31 */ u8 y;
    /* 32 */ u8 IconPalIndex;
    /* 33 */ s8 ItemSlotIndex;
    /* 34 */ struct Text text[6];
    /* 64 */ u8 draw_arrow;
};

extern struct ProcCmd CONST_DATA gProcCmd_MenuItemPanel[];

void MenuItemPanelProcIdle(struct MenuItemPanelProc * proc)
{
    if (0 == proc->draw_arrow)
        return;

    if (proc->ItemSlotIndex < 0)
        return;

    if (gBattleActor.battleAttack > gBattleTarget.battleAttack)
        PutSysArrow(proc->x * 8 + 0x2D, (proc->y + 3) * 8, 0);
    if (gBattleActor.battleAttack < gBattleTarget.battleAttack)
        PutSysArrow(proc->x * 8 + 0x2D, (proc->y + 3) * 8, 1);

    if (gBattleActor.battleHitRate > gBattleTarget.battleHitRate)
        PutSysArrow(proc->x * 8 + 0x2D, (proc->y + 5) * 8, 0);
    if (gBattleActor.battleHitRate < gBattleTarget.battleHitRate)
        PutSysArrow(proc->x * 8 + 0x2D, (proc->y + 5) * 8, 1);

    if (gBattleActor.battleCritRate > gBattleTarget.battleCritRate)
        PutSysArrow(proc->x * 8 + 0x63, (proc->y + 3) * 8, 0);
    if (gBattleActor.battleCritRate < gBattleTarget.battleCritRate)
        PutSysArrow(proc->x * 8 + 0x63, (proc->y + 3) * 8, 1);

    if (gBattleActor.battleAvoidRate > gBattleTarget.battleAvoidRate)
        PutSysArrow(proc->x * 8 + 0x63, (proc->y + 5) * 8, 0);
    if (gBattleActor.battleAvoidRate < gBattleTarget.battleAvoidRate)
        PutSysArrow(proc->x * 8 + 0x63, (proc->y + 5) * 8, 1);
}

void StartEquipInfoWindow(ProcPtr parent, struct Unit * unit, int x, int y)
{
    struct MenuItemPanelProc * proc;

    if (NULL == Proc_Find(gProcCmd_MenuItemPanel))
    {
        proc = Proc_Start(gProcCmd_MenuItemPanel, parent);
        proc->unit = unit;
        proc->x = x;
        proc->y = y;
        proc->IconPalIndex = 3;
        proc->ItemSlotIndex = GetUnitEquippedWeaponSlot(unit);
        proc->draw_arrow = TRUE;

        InitTextDb(&proc->text[0], 0xC);
        InitTextDb(&proc->text[1], 0xC);
        InitTextDb(&proc->text[2], 0xC);

        ApplyIconPalette(1, proc->IconPalIndex);
        BattleGenerateUiStats(proc->unit, -1);

        gBattleTarget.battleAttack = gBattleActor.battleAttack;
        gBattleTarget.battleHitRate = gBattleActor.battleHitRate;
        gBattleTarget.battleCritRate = gBattleActor.battleCritRate;
        gBattleTarget.battleAvoidRate = gBattleActor.battleAvoidRate;
    }
}

void UpdateMenuItemPanel(int slot_or_item)
{
    struct MenuItemPanelProc * proc = Proc_Find(gProcCmd_MenuItemPanel);
    u16 * bg_base = GetBgTilemap(0) + proc->x + 0x20 * proc->y;
    struct Text * texts = &proc->text[0];
    struct Unit * unit = proc->unit;
    int i, item, color, icon_pal = proc->IconPalIndex;
    char const * str;

    ClearText(&proc->text[0]);
    ClearText(&proc->text[1]);
    ClearText(&proc->text[2]);

    DrawUiFrame2(proc->x, proc->y, 0xE, 0x8, 0x0);

    switch (slot_or_item)
    {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
        item = unit->items[slot_or_item];
        break;

    case 5:
        item = gBmSt.inventory_item_overflow;
        break;

    default:
        item = slot_or_item;
        slot_or_item = 8;
        break;
    }

    switch (GetItemType(item))
    {
    case 4:
    case 9:
    case 0xB:
    case 0xC:
        str = DecodeMsg(GetItemUseDescId(item));
        i = 0;

        while (1)
        {
            Text_InsertDrawString(&texts[i], 0, 0, str);
            str = GetStringLineEnd(str);

            if (0 == *str)
                break;

            str++;
            i++;
        }

        gBattleActor.battleAttack = gBattleTarget.battleAttack;
        gBattleActor.battleHitRate = gBattleTarget.battleHitRate;
        gBattleActor.battleCritRate = gBattleTarget.battleCritRate;
        gBattleActor.battleAvoidRate = gBattleTarget.battleAvoidRate;

        PutText(&texts[0], bg_base + TM_OFFSET(1, 1));
        PutText(&texts[1], bg_base + TM_OFFSET(1, 3));
        PutText(&texts[2], bg_base + TM_OFFSET(1, 5));
        break;

    default:
        BattleGenerateUiStats(unit, slot_or_item);

        if (8 == slot_or_item)
        {
            gBattleTarget.battleAttack = gBattleActor.battleAttack;
            gBattleTarget.battleHitRate = gBattleActor.battleHitRate;
            gBattleTarget.battleCritRate = gBattleActor.battleCritRate;
            gBattleTarget.battleAvoidRate = gBattleActor.battleAvoidRate;
        }

        color = CanUnitUseWeapon(unit, gBattleActor.weapon) ? 2 : 1;

        Text_InsertDrawString(&texts[0], 0x20, 0, DecodeMsg(0x1101));
        Text_InsertDrawString(&texts[1], 0x02, 0, DecodeMsg(0x1103));
        Text_InsertDrawString(&texts[2], 0x02, 0, DecodeMsg(0x1104));
        Text_InsertDrawString(&texts[1], 0x2C, 0, DecodeMsg(0x110D));
        Text_InsertDrawString(&texts[2], 0x2C, 0, DecodeMsg(0x1105));

        Text_InsertDrawNumberOrBlank(&texts[1], 0x1E, color, gBattleActor.battleAttack);
        Text_InsertDrawNumberOrBlank(&texts[2], 0x1E, color, gBattleActor.battleHitRate);
        Text_InsertDrawNumberOrBlank(&texts[1], 0x54, color, gBattleActor.battleCritRate);
        Text_InsertDrawNumberOrBlank(&texts[2], 0x54, color, gBattleActor.battleAvoidRate);

        PutText(&proc->text[0], gBg0Tm + TM_OFFSET(proc->x + 1, proc->y + 1));
        PutText(&proc->text[1], gBg0Tm + TM_OFFSET(proc->x + 1, proc->y + 3));
        PutText(&proc->text[2], gBg0Tm + TM_OFFSET(proc->x + 1, proc->y + 5));

        PutIcon(bg_base + TM_OFFSET(7, 1), GetItemType(gBattleActor.weapon) + 0x70, icon_pal << 0xC);
        break;
    }

    EnableBgSync(BG0_SYNC_BIT);
}

void EndMenuItemPanel(void)
{
    Proc_EndEach(gProcCmd_MenuItemPanel);
}
