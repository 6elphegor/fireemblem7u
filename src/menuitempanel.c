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

ASM_FUNC("asm/nonmatching/code_0801DFC0.s");

void EndMenuItemPanel(void)
{
    Proc_EndEach(gProcCmd_MenuItemPanel);
}
