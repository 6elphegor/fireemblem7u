#include "gbafe.h"

void UpdateMenuScrollBarConfig(u8 a, u16 b, u16 c, u8 d);
ProcPtr StartMenuScrollBar(ProcPtr parent);
void InitMenuScrollBarImg(int chr, int pal);
void PutMenuScrollBarAt(int x, int y);
void TryHideMenuScrollBar(void);
void SomethingPrepListRelated(struct Unit * unit, int page, int flags);
void sub_0809120C(void);
void StartPrepErrorHelpbox(int x, int y, int msg, ProcPtr parent);

extern u16 gUnk_08407400[];
extern u16 const * CONST_DATA gUnk_08CC4FA0[];
extern u16 CONST_DATA gUnk_08CC4F90[];
extern u8 Tsa_0840E780[];
extern u8 Img_08405754[];
extern struct ProcCmd CONST_DATA ProcScr_PrepItemListScreen[];

s8 CheckValidLinkArenaItemSupply(struct Unit * unit, int slot, int item);

void PrepItemList_Init(struct PrepItemListProc * proc)
{
    int i;

    struct ProcAtMenu * pAtMenuProc = Proc_Find(ProcScr_AtMenu);

    proc->unk_36 = 0;
    proc->unk_34 = 0xff;

    proc->currentPage = pAtMenuProc->unk_31;

    proc->scrollAmount = 4;
    proc->unitInvIdx = 0;

    for (i = 0; i < 9; i++)
    {
        proc->idxPerPage[i] = 0;
        proc->yOffsetPerPage[i] = 0;
    }
}
void sub_08097554(void)
{
    TmFillRect(gBg0Tm + 0x34, 0xc, 1, 0);

    PutDrawText(PrepItemSuppyTexts.th + 15, gBg0Tm + 0x34, 0, 0, 0, DecodeMsg(0x1262));

    EnableBgSync(BG0_SYNC_BIT);
}
void PrepItemList_DrawCurrentOwnerText(struct PrepItemListProc * proc)
{
    int idx = proc->idxPerPage[proc->currentPage];

    TmFillRect(gBg0Tm + 0x38, 10, 1, 0);

    ClearText(PrepItemSuppyTexts.th + 1);

    if (Unk_Prep_02012466 <= idx)
    {
        PutDrawText(PrepItemSuppyTexts.th + 1, gBg0Tm + 0x38, 1, 0, 0, DecodeMsg(0x127D));
    }
    else
    {
        int pid = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].pid;

        if (pid == 0)
        {
            PutDrawText(PrepItemSuppyTexts.th + 1, gBg0Tm + 0x38, 3, 0, 0, DecodeMsg(0x125A));
        }
        else
        {
            PutDrawText(
                PrepItemSuppyTexts.th + 1, gBg0Tm + 0x38, 0, 0, 0,
                DecodeMsg(GetUnitFromCharId(pid)->pCharacterData->nameTextId));
        }
    }

    EnableBgSync(BG0_SYNC_BIT);
}
void List_PutHighlightedCategorySprites(struct PrepItemListProc * proc)
{
    int x = proc->currentPage * 12 + 124;

    gPal[0x14D] = *(gUnk_08407400 + (GetGameTime() >> 2 & 0xf));
    EnablePalSync();

    PutSprite(4, x, 24, gUnk_08CC4FA0[proc->currentPage], 0x4280);
    PutSprite(4, x, 24, gUnk_08CC4F90, 0x4280);

    UpdateMenuScrollBarConfig(0xb, proc->yOffsetPerPage[proc->currentPage], Unk_Prep_02012466, 7);
}
void PrepItemList_InitGfx(struct PrepItemListProc * proc)
{
    int i;
    char const * str;

    gDispIo.disp_ct.mode = 0;

    InitBgs(NULL);

    TmFill(GetBgTilemap(0), 0);
    TmFill(GetBgTilemap(1), 0);
    TmFill(GetBgTilemap(2), 0);

    gDispIo.bg0_ct.priority = 1;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg3_ct.priority = 3;

    InitFaces();
    ResetText();
    InitIcons();
    UnpackUiWindowFrameGraphics();
    ApplySystemObjectsGraphics();

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, proc->yOffsetPerPage[proc->currentPage] - 40);

    LoadHelpBoxGfx((void *) 0x06012000, -1);
    ApplyIconPalettes(4);

    PrepRestartMuralBackground();

    sub_08091944(0x5000, 5);

    sub_080AACD8(gBg1Tm, Tsa_0840E780, 0x5280);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    StartUiCursorHand(proc);

    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);

    SetWinEnable(1, 0, 0);
    SetWin0Box(128, 40, 224, 152);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    StartGreenText(proc);

    StartHelpPromptSprite(200, 144, proc);

    InitText(PrepItemSuppyTexts.th + 0, 6);
    InitText(PrepItemSuppyTexts.th + 1, 5);

    InitText(PrepItemSuppyTexts.th + 15, 4);

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
        InitText(PrepItemSuppyTexts.th + 2 + i, 7);

    for (i = 0; i < 8; i++)
        InitTextDb(PrepItemSuppyTexts.th + 7 + i, 7);

    StoreConvoyWeaponIconGraphics(0x4000, 6);

    sub_08096260(gBg0Tm + 0x6F, 0x4000, 6);

    Decompress(Img_08405754, (void *) 0x06015000);

    StartMenuScrollBar(proc);
    InitMenuScrollBarImg(0x5800, 4);
    PutMenuScrollBarAt(0xe2, 0x30);
    TryHideMenuScrollBar();
    SomethingPrepListRelated(proc->unit, proc->currentPage, 3);
    sub_08097DD4(proc);

    sub_08095CA8(PrepItemSuppyTexts.th + 7, gBg2Tm + 0xF, (proc->yOffsetPerPage[proc->currentPage]) >> 4, proc->unit);

    EnableBgSync(BG2_SYNC_BIT);

    DrawPrepScreenItems(gBg0Tm + 0x6F + 0xb3, PrepItemSuppyTexts.th + 2, proc->unit, 0);
    sub_08097554();

    StartUiSpinningArrows(proc);
    LoadUiSpinningArrowGfx(0, 0x280, 2);
    SetUiSpinningArrowPositions(0x78, 0x18, 0xea, 0x18);
    SetUiSpinningArrowConfig(3);

    StartParallelWorker(List_PutHighlightedCategorySprites, proc);

    StartBmFace(0, GetUnitPortraitId(proc->unit), 64, -4, 0x203);

    str = DecodeMsg(proc->unit->pCharacterData->nameTextId);

    StartSysBrownBox(0xd, 0xe00, 0xf, 0xc00, 0x400, proc);

    EnableSysBrownBox(0, -40, -1, 1);
    EnableSysBrownBox(1, 0x98, 6, 2);

    SetBlendConfig(1, 0xe, 4, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    PutDrawText(PrepItemSuppyTexts.th, gBg0Tm, 0, GetStringTextCenteredPos(48, str), 0, str);

    PrepItemList_DrawCurrentOwnerText(proc);
}
void PrepItemList_OnEnd(struct PrepItemListProc * proc)
{
    struct ProcAtMenu * pAtMenuProc = Proc_Find(ProcScr_AtMenu);
    pAtMenuProc->unk_31 = proc->currentPage;

    EndAllProcChildren(proc);
    EndFaceById(0);
    EndMuralBackground_();
}
void sub_08097A9C(struct PrepItemListProc * proc)
{
    InitIcons();
    SomethingPrepListRelated(proc->unit, proc->currentPage, 3);
    sub_08097CAC(proc);

    sub_08095CA8(PrepItemSuppyTexts.th + 7, gBg2Tm + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);
    DrawPrepScreenItemIcons(gBg0Tm + 0x122, proc->unit);

    ShowSysHandCursor(
        0x80, proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage], 0xb, 0x800);

    EnableBgSync(BG0_SYNC_BIT | BG2_SYNC_BIT);

    StartParallelFiniteLoop(PrepItemList_DrawCurrentOwnerText, 2, proc);

    if (proc->unk_36 == 0)
        return;

    if (Unk_Prep_02012466 != 0)
    {
        int item = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
        StartItemHelpBox(
            0x80, proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage], item);
        proc->unk_36 = 1;
    }
    else
    {
        CloseHelpBox();
        proc->unk_36 = 0xff;
    }
}
void PrepItemList_SwitchPageLeft(struct PrepItemListProc * proc)
{
    int x = 0;
    int four = 4;

    proc->unk_32++;

    if (proc->unk_32 < four)
    {
        int tmp = (((4 - proc->unk_32) * 0x60 * (4 - proc->unk_32)) / (four * four));
        x = tmp - 0x60;
    }

    if (proc->unk_32 == four)
    {
        if (proc->currentPage == 0)
            proc->currentPage = 8;
        else
            proc->currentPage--;

        sub_08097A9C(proc);
    }

    if (proc->unk_32 >= four)
    {
        int tmp = four - (proc->unk_32 - four);
        x = (tmp * 0x60 * tmp) / (four * four);
    }

    SetBgOffset(2, (x & 0xff), proc->yOffsetPerPage[proc->currentPage] - 40);

    if (proc->unk_32 == four * 2)
        Proc_Goto(proc, 1);
}
void PrepItemList_SwitchPageRight(struct PrepItemListProc * proc)
{
    int x = 0;
    int four = 4;

    proc->unk_32++;

    if (proc->unk_32 < four)
    {
        int tmp = (((4 - proc->unk_32) * 0x60 * (4 - proc->unk_32)) / (four * four));
        x = 0x60 - tmp;
    }

    if (proc->unk_32 == four)
    {
        if (proc->currentPage == 8)
            proc->currentPage = 0;
        else
            proc->currentPage++;

        sub_08097A9C(proc);
    }

    if (proc->unk_32 >= four)
    {
        int tmp = four - (proc->unk_32 - four);
        x = -((tmp * 0x60 * tmp) / (four * four));
    }

    SetBgOffset(2, (x & 0xff), proc->yOffsetPerPage[proc->currentPage] - 40);

    if (proc->unk_32 == four * 2)
        Proc_Goto(proc, 1);
}
void sub_08097CAC(struct PrepItemListProc * proc)
{
    if (Unk_Prep_02012466 == 0)
    {
        proc->idxPerPage[proc->currentPage] = proc->yOffsetPerPage[proc->currentPage] = 0;
    }
    else
    {
        if (proc->idxPerPage[proc->currentPage] > Unk_Prep_02012466 - 1)
            proc->idxPerPage[proc->currentPage] = Unk_Prep_02012466 - 1;
    }

    if (Unk_Prep_02012466 > 6)
    {
        if (((proc->yOffsetPerPage[proc->currentPage] >> 4) + 7) > Unk_Prep_02012466)
            proc->yOffsetPerPage[proc->currentPage] = (Unk_Prep_02012466 - 7) * 0x10;
    }

    SetBgOffset(2, 0, proc->yOffsetPerPage[proc->currentPage] - 40);
}
void PrepItemList_ScrollVertical(struct PrepItemListProc * proc, int amount)
{
    InitIcons();

    sub_08095DC0(gBg2Tm + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4);
    DrawPrepScreenItemIcons(gBg0Tm + 0x122, proc->unit);

    EnableBgSync(BG0_SYNC_BIT | BG2_SYNC_BIT);

    if (amount < 0)
        sub_08095E24(PrepItemSuppyTexts.th + 7, gBg2Tm + 0xF, (proc->yOffsetPerPage[proc->currentPage] >> 4) - 1, proc->unit);

    if (amount > 0)
        sub_08095E24(PrepItemSuppyTexts.th + 7, gBg2Tm + 0xF, (proc->yOffsetPerPage[proc->currentPage] >> 4) + 7, proc->unit);

    proc->yOffsetPerPage[proc->currentPage] += amount;

    SetBgOffset(2, 0, proc->yOffsetPerPage[proc->currentPage] - 40);
}
void sub_08097DD4(struct PrepItemListProc * proc)
{
    if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] < 0x38) &&
        (proc->idxPerPage[proc->currentPage] != 0))
    {
        proc->idxPerPage[proc->currentPage]++;
    }

    if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] > 0x78) &&
        (proc->idxPerPage[proc->currentPage] != Unk_Prep_02012466 - 1))
    {
        proc->idxPerPage[proc->currentPage]--;
    }

    sub_08097CAC(proc);

    ShowSysHandCursor(
        0x80, proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage], 0xb, 0x800);
}
void PrepItemList_Loop_MainKeyHandler(struct PrepItemListProc * proc)
{
    int idx = proc->idxPerPage[proc->currentPage];

    if ((proc->yOffsetPerPage[proc->currentPage] & 0xf) == 0)
    {
        if ((proc->unk_36 == 0) || (proc->unk_36 == 0xff))
        {
            if (gpKeySt->pressed & R_BUTTON)
            {
                if (Unk_Prep_02012466 == 0)
                {
                    PlaySoundEffect(0x38C);
                    return;
                }
                else
                {
                    int item = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
                    StartItemHelpBox(
                        0x80,
                        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
                        item);
                    proc->unk_36 = 1;
                    return;
                }
            }

            if (gpKeySt->pressed & A_BUTTON)
            {
                if (Unk_Prep_02012466 == 0)
                {
                    PlaySoundEffect(0x38C);
                    return;
                }

                if (gPrepScreenItemList[idx].pid == 0)
                {
                    SetUiCursorHandConfig(
                        0, 0x80,
                        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage], 2);
                    Proc_Goto(proc, 7);
                    PlaySoundEffect(0x38A);
                    return;
                }
                else
                {
                    Proc_Goto(proc, 6);
                    PlaySoundEffect(0x38A);
                    return;
                }
            }

            if (gpKeySt->pressed & B_BUTTON)
            {
                Proc_Goto(proc, 8);
                PlaySoundEffect(0x38B);
                proc->unk_36 = 0;
                return;
            }
        }
        else
        {
            if (gpKeySt->pressed & (R_BUTTON | B_BUTTON))
            {
                CloseHelpBox();
                proc->unk_36 = 0;
                return;
            }
        }

        if (gpKeySt->repeated & DPAD_LEFT)
        {
            SetUiSpinningArrowFastMaybe(0);
            PlaySoundEffect(0x387);
            Proc_Goto(proc, 3);
            proc->unk_32 = 0;
            PrepItemList_SwitchPageLeft(proc);
            return;
        }

        if (gpKeySt->repeated & DPAD_RIGHT)
        {
            SetUiSpinningArrowFastMaybe(1);
            PlaySoundEffect(0x387);
            Proc_Goto(proc, 4);
            proc->unk_32 = 0;
            PrepItemList_SwitchPageRight(proc);
            return;
        }

        if (gpKeySt->held & L_BUTTON)
            proc->scrollAmount = 8;
        else
            proc->scrollAmount = 4;

        if ((gpKeySt->repeated & DPAD_UP) || ((gpKeySt->held & DPAD_UP) && (proc->scrollAmount == 8)))
        {
            if (proc->idxPerPage[proc->currentPage] != 0)
                proc->idxPerPage[proc->currentPage]--;
        }

        if ((gpKeySt->repeated & DPAD_DOWN) || ((gpKeySt->held & DPAD_DOWN) && (proc->scrollAmount == 8)))
        {
            if (proc->idxPerPage[proc->currentPage] < Unk_Prep_02012466 - 1)
                proc->idxPerPage[proc->currentPage]++;
        }
    }
    else
    {
        if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage]) < 0x38)
            proc->yOffsetPerPage[proc->currentPage] -= proc->scrollAmount;

        if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage]) > 0x78)
            proc->yOffsetPerPage[proc->currentPage] += proc->scrollAmount;

        SetBgOffset(2, 0, proc->yOffsetPerPage[proc->currentPage] - 40);
    }

    if (idx != proc->idxPerPage[proc->currentPage])
    {
        u16 item = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
        PlaySoundEffect(0x386);

        if (gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].pid != gPrepScreenItemList[idx].pid)
            PrepItemList_DrawCurrentOwnerText(proc);

        if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] < 0x38) &&
            (proc->idxPerPage[proc->currentPage] != 0))
        {
            if (proc->unk_36 != 0)
            {
                StartItemHelpBox(
                    0x80, proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] + 16,
                    item);
            }

            PrepItemList_ScrollVertical(proc, -proc->scrollAmount);
        }
        else
        {
            if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] > 0x78) &&
                (proc->idxPerPage[proc->currentPage] != Unk_Prep_02012466 - 1))
            {
                if (proc->unk_36 != 0)
                {
                    StartItemHelpBox(
                        0x80,
                        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] - 0x10,
                        item);
                }
                PrepItemList_ScrollVertical(proc, +proc->scrollAmount);
            }
            else
            {
                if (proc->unk_36 != 0)
                {
                    StartItemHelpBox(
                        0x80, proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
                        item);
                }

                ShowSysHandCursor(
                    0x80, proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
                    0xb, 0x800);
            }
        }
    }
}
s8 sub_08098274(struct PrepItemListProc * proc)
{
    int count = GetUnitItemCount(proc->unit);
    u8 unitInvSlot = proc->unitInvIdx;

    int maxSlot = count;
    if (count == UNIT_ITEM_COUNT)
        maxSlot = 4;
    else if (proc->unk_36 != 0)
        maxSlot = count - 1;

    if (count != 0)
    {
        if (gpKeySt->repeated & DPAD_UP)
        {
            if (proc->unitInvIdx != 0)
                proc->unitInvIdx--;
            else if (gpKeySt->pressed & DPAD_UP)
                proc->unitInvIdx = maxSlot;
        }

        if (gpKeySt->repeated & DPAD_DOWN)
        {
            if (proc->unitInvIdx < maxSlot)
                proc->unitInvIdx++;
            else if (gpKeySt->pressed & DPAD_DOWN)
                proc->unitInvIdx = 0;
        }

        if (unitInvSlot != proc->unitInvIdx)
        {
            PlaySoundEffect(0x386);
            return 1;
        }
    }

    return 0;
}
void PrepItemList_SwitchToUnitInventory(struct PrepItemListProc * proc)
{
    int count = GetUnitItemCount(proc->unit);

    if (count == UNIT_ITEM_COUNT)
        proc->unitInvIdx = 4;
    else
        proc->unitInvIdx = count;

    ShowSysHandCursor(16, proc->unitInvIdx * 16 + 72, 0xb, 0x800);
}
void sub_0809835C(struct PrepItemListProc * proc)
{
    u16 idx = proc->idxPerPage[proc->currentPage];
    u16 item = proc->unit->items[proc->unitInvIdx];

    proc->unit->items[proc->unitInvIdx] = gPrepScreenItemList[idx].item;
    UnitRemoveInvalidItems(proc->unit);
    gPrepScreenItemList[idx].item = item;

    sub_0809120C();
    if (item == 0)
        SomethingPrepListRelated(proc->unit, proc->currentPage, 3);

    sub_08097CAC(proc);
    DrawPrepScreenItems(gBg0Tm + 0x122, PrepItemSuppyTexts.th + 2, proc->unit, 0);
    sub_08095CA8(PrepItemSuppyTexts.th + 7, gBg2Tm + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);
    StartParallelFiniteLoop(PrepItemList_DrawCurrentOwnerText, 1, proc);
    EnableBgSync(BG2_SYNC_BIT);

    PlaySoundEffect(0x38A);
}
void PrepItemList_Loop_UnitInvKeyHandler(struct PrepItemListProc * proc)
{
    u16 item;

    if (proc->unk_36 == 1)
    {
        if (gpKeySt->pressed & (R_BUTTON | B_BUTTON))
        {
            CloseHelpBox();
            proc->unk_36 = 0;
            return;
        }
    }
    else
    {
        if (gpKeySt->pressed & R_BUTTON)
        {
            item = proc->unit->items[proc->unitInvIdx];
            if (item == 0)
                return;

            StartItemHelpBox(16, proc->unitInvIdx * 16 + 72, item);
            proc->unk_36 = 1;
            return;
        }

        if (gpKeySt->pressed & A_BUTTON)
        {
            if (CheckValidLinkArenaItemSupply(
                    proc->unit, proc->unitInvIdx, gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item) == 0)
            {
                StartPrepErrorHelpbox(-1, -1, 0x3AE, proc);
                return;
            }

            DisableUiCursorHand(0);
            Proc_Break(proc);
            sub_0809835C(proc);
            return;
        }

        if (gpKeySt->pressed & B_BUTTON)
        {
            DisableUiCursorHand(0);
            Proc_Break(proc);
            PlaySoundEffect(0x38B);
            return;
        }
    }

    if (sub_08098274(proc) != 0)
    {
        ShowSysHandCursor(16, proc->unitInvIdx * 16 + 72, 0xb, 0x800);
        if (proc->unk_36 == 1)
        {
            item = proc->unit->items[proc->unitInvIdx];
            if (item != 0)
                StartItemHelpBox(16, proc->unitInvIdx * 16 + 72, item);
        }
    }
}
void PrepItemList_StartTradeScreen(struct PrepItemListProc * proc)
{
    struct PrepScreenItemListEnt * ent = &gPrepScreenItemList[proc->idxPerPage[proc->currentPage]];

    sub_0809496C(proc->unit, GetUnitFromCharId(ent->pid), ent->itemSlot, proc);
}
void StartPrepItemListScreenProc(struct Unit * unit, ProcPtr parent)
{
    struct PrepItemListProc * proc = Proc_StartBlocking(ProcScr_PrepItemListScreen, parent);
    proc->unit = unit;
}
