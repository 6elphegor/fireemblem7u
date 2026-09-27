#include "gbafe.h"
#include "gbafe/bmusemind.h"

void StartManimLevelUpStatGainLabels(int chr, int pal, int unk, ProcPtr parent);
void StartPrepItemBoostStatGainLabelAnim(int x, int y, int value);
void EndManimLevelUpStatGainLabels(void);

void PrepItemUseBooster_OnDraw(struct ProcPrepItemUseBooster * proc, int x, int y, int msg, int item)
{
    char const * str = DecodeMsg(msg);
    int icon = GetItemIconId(item);
    int width = GetStringTextLen(str);

    x += ((icon != 0 ? 0x68 : 0x78) - (width + 7)) / 16;

    if (icon != 0)
        PutIcon(gBg2Tm + TM_OFFSET(x, y), GetItemIconId(item), 0x4000);

    ClearText(&gPrepItemTexts[27]);

    PutDrawText(
        &gPrepItemTexts[27], gBg2Tm + (icon != 0 ? TM_OFFSET(x + 2, y) : TM_OFFSET(x, y)), TEXT_COLOR_SYSTEM_WHITE,
        0, 0, str);

    EnableBgSync(BG2_SYNC_BIT);

    proc->xpos = x * 8 - 4;
    proc->ypos = y * 8 - 4;

    proc->width = (width + 7) / 8;

    if (icon != 0)
        proc->width += 2;

    proc->height = 2;
}
void PrepItemUseBooster_OnInit(struct ProcPrepItemUseBooster * proc)
{
    int i, item, msg;
    struct ProcPrepItemUse * parent = proc->proc_parent;

    StartManimLevelUpStatGainLabels(0x1C0, 3, 0, proc);

    proc->status_pre[0] = GetUnitCurrentHp(parent->unit);
    proc->status_pre[1] = GetUnitPower(parent->unit);
    proc->status_pre[2] = GetUnitSkill(parent->unit);
    proc->status_pre[3] = GetUnitSpeed(parent->unit);
    proc->status_pre[4] = GetUnitLuck(parent->unit);
    proc->status_pre[5] = GetUnitDefense(parent->unit);
    proc->status_pre[6] = GetUnitResistance(parent->unit);
    proc->status_pre[7] = UNIT_CON(parent->unit);

    item = parent->unit->items[parent->slot];

    msg = ApplyItemStatBoost(parent->unit, parent->slot);

    DrawPrepScreenItemUseStatBars(parent->unit, 0);
    DrawPrepScreenItemUseStatValues(parent->unit);

    proc->status_pst[0] = GetUnitCurrentHp(parent->unit);
    proc->status_pst[1] = GetUnitPower(parent->unit);
    proc->status_pst[2] = GetUnitSkill(parent->unit);
    proc->status_pst[3] = GetUnitSpeed(parent->unit);
    proc->status_pst[4] = GetUnitLuck(parent->unit);
    proc->status_pst[5] = GetUnitDefense(parent->unit);
    proc->status_pst[6] = GetUnitResistance(parent->unit);
    proc->status_pst[7] = UNIT_CON(parent->unit);

    PrepItemUseBooster_OnDraw(proc, 0xF, 0xE, msg, item);

    for (i = 0; i < 8; i++)
    {
        if (proc->status_pre[i] == proc->status_pst[i])
            continue;

        StartPrepItemBoostStatGainLabelAnim(
            (i >> 2) * 48 + 0xB8, (i & 3) * 16 + 0x32, proc->status_pst[i] - proc->status_pre[i]);
    }

    proc->timer = 0x78;
    PlaySoundEffect(0x37A);
}
void PrepItemUseBooster_IDLE(struct ProcPrepItemUseBooster * proc)
{
    PrepItemDrawPopupBox(proc->xpos, proc->ypos, proc->width, proc->height, 0xA580);

    if (--proc->timer == 0 || gpKeySt->pressed & (A_BUTTON | B_BUTTON))
        Proc_Break(proc);
}
void PrepItemUseBooster_OnEnd(struct ProcPrepItemUseBooster * proc)
{
    struct ProcPrepItemUse * parent = proc->proc_parent;
    int max = GetUnitItemCount(parent->unit);
    TmFillRect(gBg2Tm + TM_OFFSET(15, 14), 14, 1, 0);

    if (max == 0)
    {
        Proc_Goto(parent, 5);
    }
    else
    {
        if (parent->slot >= max)
            parent->slot--;

        ShowSysHandCursor(0x10, parent->slot * 0x10 + 0x48, 0xB, 0x800);
    }

    DrawPrepScreenItems(gBg0Tm + TM_OFFSET(2, 9), &gPrepItemTexts[15], parent->unit, 1);

    DrawPrepScreenItemUseDesc(parent->unit, parent->slot);

    DisableUiCursorHand(0);
    EndManimLevelUpStatGainLabels();
    EnableBgSync(BG0_SYNC_BIT | BG2_SYNC_BIT);
    LoadHelpBoxGfx((void *) 0x06014000, -1);
}
