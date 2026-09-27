#include "gbafe.h"
#include "gbafe/bmitemuse.h"
#include "gbafe/ui.h"


extern struct ProcCmd CONST_DATA ProcScr_PrepItemTradeScreen[];

void PrepItemTrade_ApplyItemSwap(struct Unit * unitA, int itemSlotA, struct Unit * unitB, int itemSlotB)
{
    u16 itemTmp = unitA->items[itemSlotA];
    unitA->items[itemSlotA] = unitB->items[itemSlotB];
    unitB->items[itemSlotB] = itemTmp;

    UnitRemoveInvalidItems(unitA);
    UnitRemoveInvalidItems(unitB);
}
s8 PrepItemTrade_DpadKeyHandler(struct PrepMenuTradeProc * proc)
{
    int previous = proc->cursorItemSlot;

    if ((gpKeySt->repeated & DPAD_LEFT) && (proc->cursorItemSlot & 8))
    {
        int itemCount = GetUnitItemCount(proc->units[0]);

        if (proc->selectedItemSlot != 0xff)
        {
            if (proc->helpBoxItemSlot == 0xff)
            {
                if (((proc->cursorItemSlot + 8) >> 3 & 1) != proc->selectedItemSlot >> 3)
                    itemCount = itemCount == UNIT_ITEM_COUNT ? UNIT_ITEM_COUNT : itemCount + 1;
            }
        }

        if (itemCount > 0)
        {
            if (itemCount > (proc->cursorItemSlot & 7))
                proc->cursorItemSlot = proc->cursorItemSlot - 8;
            else
                proc->cursorItemSlot = itemCount - 1;

            PlaySoundEffect(0x387);
        }
    }

    if ((gpKeySt->repeated & DPAD_RIGHT) && !(proc->cursorItemSlot & 8))
    {
        int itemCount = GetUnitItemCount(proc->units[1]);

        if (proc->selectedItemSlot != 0xff)
        {
            if (proc->helpBoxItemSlot == 0xff)
            {
                if (((proc->cursorItemSlot + 8) >> 3 & 1) != proc->selectedItemSlot >> 3)
                    itemCount = itemCount == UNIT_ITEM_COUNT ? UNIT_ITEM_COUNT : itemCount + 1;
            }
        }

        if (itemCount > 0)
        {
            if (itemCount > (proc->cursorItemSlot & 7))
                proc->cursorItemSlot = proc->cursorItemSlot + 8;
            else
                proc->cursorItemSlot = itemCount + 7;

            PlaySoundEffect(0x387);
        }
    }

    if (gpKeySt->repeated & DPAD_UP)
    {
        int itemCount = GetUnitItemCount(proc->units[proc->cursorItemSlot >> 3]);

        if (proc->selectedItemSlot != 0xff)
        {
            if (proc->helpBoxItemSlot == 0xff)
            {
                if ((proc->cursorItemSlot >> 3) != proc->selectedItemSlot >> 3)
                    itemCount = itemCount == UNIT_ITEM_COUNT ? UNIT_ITEM_COUNT : itemCount + 1;
            }
        }

        if ((proc->cursorItemSlot & 7) > 0)
        {
            proc->cursorItemSlot--;
            PlaySoundEffect(0x386);
        }
        else if (gpKeySt->pressed & DPAD_UP)
        {
            proc->cursorItemSlot = (proc->cursorItemSlot & 8) + itemCount - 1;
            PlaySoundEffect(0x386);
        }
    }

    if (gpKeySt->repeated & DPAD_DOWN)
    {
        int itemCount = GetUnitItemCount(proc->units[proc->cursorItemSlot >> 3]);

        if (proc->selectedItemSlot != 0xff)
        {
            if (proc->helpBoxItemSlot == 0xff)
            {
                if ((proc->cursorItemSlot >> 3) != proc->selectedItemSlot >> 3)
                    itemCount = itemCount == UNIT_ITEM_COUNT ? UNIT_ITEM_COUNT : itemCount + 1;
            }
        }

        if ((proc->cursorItemSlot & 7) < itemCount - 1)
        {
            proc->cursorItemSlot++;
            PlaySoundEffect(0x386);
        }
        else if (gpKeySt->pressed & DPAD_DOWN)
        {
            proc->cursorItemSlot = proc->cursorItemSlot & 8;
            PlaySoundEffect(0x386);
        }
    }

    if (previous != proc->cursorItemSlot)
        return 1;

    return 0;
}
void DrawPrepScreenItems(u16 * tm, struct Text * th, struct Unit * unit, u8 checkPrepUsability)
{
    s8 isUsable;
    int i;
    int itemCount;

    TmFillRect(tm, 11, 9, 0);

    itemCount = GetUnitItemCount(unit);

    for (i = 0; i < itemCount; i++)
    {
        int item = unit->items[i];

        if (checkPrepUsability != 0)
            isUsable = CanUnitUseItemPrepScreen(unit, item);
        else
            isUsable = IsItemDisplayUsable(unit, item);

        ClearText(th);
        PutDrawText(
            th, tm + i * 0x40 + 2, !isUsable ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0,
            GetItemName(item));

        PutNumberOrBlank(
            tm + i * 0x40 + 0xB, isUsable ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY, GetItemUses(item));
        PutIcon(tm + i * 0x40, GetItemIconId(item), 0x4000);

        th++;
    }
}
void DrawPrepScreenItemIcons(u16 * tm, struct Unit * unit)
{
    int i;

    int itemCount = GetUnitItemCount(unit);

    for (i = 0; i < itemCount; i++)
        PutIcon(tm + i * 0x40, GetItemIconId(unit->items[i]), 0x4000);
}
void PrepItemTrade_Init(struct PrepMenuTradeProc * proc)
{
    char const * str;
    int i;

    struct FaceVramEnt faceConfig[4] =
    {
        { 0x5800, 6 },
        { 0x6800, 7 },
        { 0x0000, 0 },
        { 0x0000, 0 },
    };

    InitBgs((void *) (u32) *gBgConfig_PrepScreen);

    SetFaceConfig(faceConfig);

    gDispIo.bg0_ct.priority = 1;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg3_ct.priority = 3;

    TmFill(GetBgTilemap(0), 0);
    TmFill(GetBgTilemap(1), 0);
    TmFill(GetBgTilemap(2), 0);

    ResetText();
    InitIcons();
    UnpackUiWindowFrameGraphics();
    ApplySystemObjectsGraphics();

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);

    LoadHelpBoxGfx((void *) 0x06014000, -1);
    ApplyIconPalettes(4);

    PrepRestartMuralBackground();

    for (i = 0; i < 5; i++)
    {
        InitTextDb(gPrepItemTexts + 15 + i, 7);
        InitTextDb(gPrepItemTexts + 20 + i, 7);
    }

    proc->selectedItemSlot = 0xff;

    if (proc->unk_40 != -1)
    {
        proc->cursorItemSlot = proc->unk_40 + 8;
    }
    else
    {
        if (GetUnitItemCount(proc->units[0]) == 0)
            proc->cursorItemSlot = 8;
        else
            proc->cursorItemSlot = 0;
    }

    proc->helpBoxItemSlot = 0xff;

    StartBmFace(0, GetUnitPortraitId(proc->units[0]), 64, -4, 0x203);
    StartBmFace(1, GetUnitPortraitId(proc->units[1]), 174, -4, 0x202);

    DrawUiFrame2(1, 8, 14, 12, 0);
    DrawUiFrame2(15, 8, 14, 12, 0);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    str = DecodeMsg(proc->units[0]->pCharacterData->nameTextId);
    PutDrawText(0, gBg0Tm, 0, ((48 - GetStringTextLen(str)) / 2), 6, str);

    str = DecodeMsg(proc->units[1]->pCharacterData->nameTextId);
    PutDrawText(0, gBg0Tm + 0x18, 0, ((48 - GetStringTextLen(str)) / 2), 6, str);

    DrawPrepScreenItems(gBg0Tm + 0x122, gPrepItemTexts + 15, proc->units[0], 0);
    DrawPrepScreenItems(gBg0Tm + 0x130, gPrepItemTexts + 20, proc->units[1], 0);

    StartUiCursorHand(proc);

    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);
    ShowSysHandCursor((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0xb, 0x800);

    StartHelpPromptSprite(200, 0x90, proc);

    StartSysBrownBox(0xd, 0xe00, 0xf, 0xc00, 0x400, proc);

    EnableSysBrownBox(0, -0x28, -1, 1);
    EnableSysBrownBox(1, 0xb8, -1, 0);

    SetBlendConfig(1, 0xe, 4, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
}
void PrepItemTrade_Loop_MainKeyHandler(struct PrepMenuTradeProc * proc)
{
    int item;

    if (proc->helpBoxItemSlot != 0xff)
    {
        if (gpKeySt->pressed & (B_BUTTON | R_BUTTON))
        {
            CloseHelpBox();
            proc->helpBoxItemSlot = 0xff;
            return;
        }
    }
    else
    {
        if (gpKeySt->pressed & R_BUTTON)
        {
            item = proc->units[proc->cursorItemSlot >> 3]->items[proc->cursorItemSlot & 7];
            if (item == 0)
                return;

            StartItemHelpBox((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, item);
            proc->helpBoxItemSlot = proc->cursorItemSlot;
            return;
        }

        if (proc->selectedItemSlot != 0xff)
        {
            if (gpKeySt->pressed & A_BUTTON)
            {
                int itemCount;

                if (CheckValidLinkArenaItemSwap(
                        proc->units[proc->selectedItemSlot >> 3], proc->selectedItemSlot & 7,
                        proc->units[proc->cursorItemSlot >> 3], proc->cursorItemSlot & 7) == 0)
                {
                    StartPrepErrorHelpbox(-1, -1, 0x3AE, proc);
                    return;
                }

                PrepItemTrade_ApplyItemSwap(
                    proc->units[proc->selectedItemSlot >> 3], proc->selectedItemSlot & 7,
                    proc->units[proc->cursorItemSlot >> 3], proc->cursorItemSlot & 7);

                DrawPrepScreenItems(gBg0Tm + 0x122, gPrepItemTexts + 15, proc->units[0], 0);
                DrawPrepScreenItems(gBg0Tm + 0x122 + 0xe, gPrepItemTexts + 20, proc->units[1], 0);

                EnableBgSync(BG0_SYNC_BIT);

                itemCount = GetUnitItemCount(proc->units[proc->selectedItemSlot >> 3]);
                if (itemCount == 0)
                    proc->selectedItemSlot = (proc->selectedItemSlot + 8) & 8;
                else if (itemCount <= (proc->selectedItemSlot & 7))
                    proc->selectedItemSlot = ((proc->selectedItemSlot & 8) + itemCount) - 1;

                PlaySoundEffect(0x38A);
                DisableUiCursorHand(0);
                proc->cursorItemSlot = proc->selectedItemSlot;
                proc->selectedItemSlot = 0xff;
                ShowSysHandCursor(
                    (proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0xb, 0x800);
                return;
            }

            if (gpKeySt->pressed & B_BUTTON)
            {
                proc->cursorItemSlot = proc->selectedItemSlot;
                proc->selectedItemSlot = 0xff;
                ShowSysHandCursor(
                    (proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0xb, 0x800);

                PlaySoundEffect(0x38B);

                DisableUiCursorHand(0);

                return;
            }
        }
        else
        {
            if (gpKeySt->pressed & A_BUTTON)
            {
                int itemCount = GetUnitItemCount(proc->units[((proc->cursorItemSlot >> 3) + 1) & 1]);
                proc->selectedItemSlot = proc->cursorItemSlot;
                SetUiCursorHandConfig(
                    0, (proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0);
                if (itemCount < 5)
                    proc->cursorItemSlot = ((proc->cursorItemSlot + 8) & 8) + itemCount;
                else
                    proc->cursorItemSlot = (proc->cursorItemSlot + 8) & 0xf;

                ShowSysHandCursor(
                    (proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0xb, 0x800);
                PlaySoundEffect(0x38A);
                return;
            }

            if (gpKeySt->pressed & B_BUTTON)
            {
                Proc_Break(proc);
                PlaySoundEffect(0x38B);
                return;
            }
        }
    }

    if (PrepItemTrade_DpadKeyHandler(proc) == 0)
        return;

    ShowSysHandCursor((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, 0xb, 0x800);

    if (proc->helpBoxItemSlot == 0xff)
        return;

    item = proc->units[proc->cursorItemSlot >> 3]->items[proc->cursorItemSlot & 7];
    if (item == 0)
        return;

    StartItemHelpBox((proc->cursorItemSlot >> 3) * 0x70 + 0x10, (proc->cursorItemSlot & 7) * 0x10 + 0x48, item);

    proc->helpBoxItemSlot = proc->cursorItemSlot;
}
void PrepItemTrade_OnEnd(void)
{
    EndMuralBackground_();
    EndFaceById(0);
    EndFaceById(1);
}
void StartPrepItemTradeScreenProc(struct Unit * unitA, struct Unit * unitB, ProcPtr parent)
{
    struct PrepMenuTradeProc * proc = Proc_StartBlocking(ProcScr_PrepItemTradeScreen, parent);

    proc->units[0] = unitA;
    proc->units[1] = unitB;

    proc->unk_40 = -1;
}
void sub_0809496C(struct Unit * unitA, struct Unit * unitB, int rightItemIdx, ProcPtr parent)
{
    struct PrepMenuTradeProc * proc = Proc_StartBlocking(ProcScr_PrepItemTradeScreen, parent);

    proc->units[0] = unitA;
    proc->units[1] = unitB;

    proc->unk_40 = rightItemIdx;
}
