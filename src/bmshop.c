#include "gbafe.h"

#include "gbafe/bmshop.h"
#include "gbafe/unitlistscreen.h"

// FE8U: bmshop.c (compiled at -O0 in FE7)

int GetGold(void);

extern struct ProcCmd CONST_DATA ProcScr_Mu[];

#define SHOP_HAND_Y(proc) ((proc)->head_loc * 16 - ({ (proc)->hand_loc * 16 - 72; }))

int Shop_GetPortraitIndex(struct ProcShop * proc)
{
    return gShopPortraitLut[proc->shopType];
}

void StartShopDialogue(int baseMsgId, struct ProcShop * proc)
{
    int msgId = baseMsgId + gShopDialogueOffsetLut[proc->shopType];

    SetInitTalkTextFont();
    ClearTalkText();

    StartTalkExt(8, 2, DecodeMsg(msgId), proc);

    SetTalkPrintColor(0);

    SetTalkFlag(1);
    SetTalkFlag(2);
    SetTalkFlag(4);

    SetActiveTalkFace(1);
}

void StartDefaultArmoryScreen(struct Unit * unit, ProcPtr parent)
{
    StartShopScreen(unit, NULL, SHOP_TYPE_ARMORY, parent);
}

void StartArmoryScreenOrphaned(struct Unit * unit, u16 * shopItems)
{
    StartShopScreen(unit, shopItems, SHOP_TYPE_ARMORY, NULL);
}

void StartVendorScreenOrphaned(struct Unit * unit, u16 * shopItems)
{
    StartShopScreen(unit, shopItems, SHOP_TYPE_VENDOR, NULL);
}

void StartSecretShopScreenOrphaned(struct Unit * unit, u16 * shopItems)
{
    StartShopScreen(unit, shopItems, SHOP_TYPE_SECRET_SHOP, NULL);
}

void StartArmoryScreen2(struct Unit * unit, u16 * shopItems)
{
    StartShopScreen(unit, shopItems, SHOP_TYPE_ARMORY, NULL);
}

void StartShopScreen(struct Unit * unit, const u16 * inventory, u8 shopType, ProcPtr parent)
{
    struct ProcShop * proc;
    const u16 * shopItems;
    int i;

    EndPlayerPhaseSideWindows();

    if (parent)
        proc = Proc_StartBlocking(gProcScr_Shop, parent);
    else
        proc = Proc_Start(gProcScr_Shop, PROC_TREE_3);

    proc->shopType = shopType;
    proc->unit = unit;

    if (inventory != 0)
        shopItems = inventory;
    else
        shopItems = gDefaultShopInventory;

    for (i = 0; i <= SHOP_ITEMS_MAX_AMT; i++)
        proc->shopItems[i] = MakeNewItem(*shopItems++);

    UpdateShopItemCounts(proc);
}

void UpdateShopItemCounts(struct ProcShop * proc)
{
    int i;
    for (i = 0; proc->shopItems[i] != 0; i++);

    proc->shopItemCount = i;
    proc->unitItemCount = GetUnitItemCount(proc->unit);
}

void TalkChoice_OnBuy(void)
{
    struct ProcShop * proc = Proc_Find(gProcScr_Shop);
    if (proc->buy_or_sel == 0)
        return;

    ShopInitTexts_OnBuy(proc);
}

void TalkChoice_OnSell(void)
{
    struct ProcShop * proc = Proc_Find(gProcScr_Shop);
    if (proc->buy_or_sel == 1)
        return;

    ShopInitTexts_OnSell(proc);
}

void Shop_null_80B4328(struct ProcShop * proc)
{
}

void Shop_EntryDialogue(struct ProcShop * proc)
{
    if (!proc->unit)
        Proc_Goto(proc, PL_SHOP_PREP_ENTRY);
    else
        StartShopDialogue(9, proc);
}

void Shop_HandleEntryDialoguePrompt(struct ProcShop * proc)
{
    switch (GetTalkChoiceResult()) {
    case 0:
    default:
        Proc_Goto(proc, PL_SHOP_EXIT);
        break;

    case 1:
        Proc_Goto(proc, PL_SHOP_BUY);
        break;

    case 2:
        if (GetUnitItemCount(proc->unit) == 0)
        {
            StartShopDialogue(0x1B, proc);
            Proc_Goto(proc, PL_SHOP_SELL_NOITEM);
        }
        else
        {
            Proc_Goto(proc, PL_SHOP_SELL);
        }
    }
}

void Shop_BuyDialogue(struct ProcShop * proc)
{
    StartShopDialogue(0x12, proc);
}

void ShopDrawBuyItemLine(ProcPtr vproc, int itemIndex)
{
    struct ProcShop * proc = vproc;
    int index = DivRem(itemIndex, 6);
    int item;

    SetTextFont(0);
    InitSystemTextFont();

    EnableBgSync(BG2_SYNC_BIT);

    ClearText(&gShopItemTexts[index]);

    item = proc->shopItems[itemIndex];

    if (item == 0)
        return;

    DrawShopItemPriceLine(
            &gShopItemTexts[index],
            item,
            proc->unit,
            gBg2Tm + TM_OFFSET_(7, (itemIndex * 2 & 0x1F)));
}

void ShopDrawSellItemLine(ProcPtr vproc, int itemIndex)
{
    struct ProcShop * proc = vproc;
    int index = DivRem(itemIndex, 6);
    int item;

    SetTextFont(0);
    InitSystemTextFont();

    EnableBgSync(BG2_SYNC_BIT);

    ClearText(&gShopItemTexts[index]);

    item = proc->shopItems[itemIndex];

    if (item == 0)
        return;

    DrawShopItemLine(
            &gShopItemTexts[index],
            item,
            proc->unit,
            gBg2Tm + TM_OFFSET_(7, (itemIndex * 2 & 0x1F)));
}

void Shop_InitBuyState(struct ProcShop * proc)
{
    RegisterShopState(
        proc->head_idx,
        proc->shopItemCount,
        5,
        proc->hand_idx,
        72,
        ShopDrawBuyItemLine,
        proc);
}

void Shop_Loop_BuyKeyHandler(struct ProcShop * proc)
{
    s8 moved = 0;
    int price;

    Shop_TryMoveHandPage();

    SetBgOffset(2, 0, ShopSt_GetBg2Offset());

    if (proc->head_loc != ShopSt_GetHeadLoc())
        moved = 1;

    proc->head_loc = ShopSt_GetHeadLoc();
    proc->hand_loc = ShopSt_GetHandLoc();

    proc->head_idx = proc->head_loc;
    proc->hand_idx = proc->hand_loc;

    PutUiHand(56, SHOP_HAND_Y(proc));

    if (proc->helpTextActive != 0 && moved != 0)
        StartItemHelpBox(56, SHOP_HAND_Y(proc), proc->shopItems[proc->head_loc]);

    DisplayShopUiArrows();

    if (IsShopPageScrolling() != 0)
        return;

    if (proc->helpTextActive != 0)
    {
        if (gpKeySt->pressed & (B_BUTTON | R_BUTTON))
        {
            proc->helpTextActive = 0;
            CloseHelpBox();
        }
        return;
    }
    else if (gpKeySt->pressed & R_BUTTON)
    {
        proc->helpTextActive = 1;
        StartItemHelpBox(56, SHOP_HAND_Y(proc), proc->shopItems[proc->head_loc]);
        return;
    }

    price = GetItemPurchasePrice(proc->unit, proc->shopItems[proc->head_loc]);

    if (gpKeySt->pressed & A_BUTTON)
    {
        if (price > (int)GetGold())
        {
            StartShopDialogue(0x21, proc);
            Proc_Goto(proc, PL_SHOP_BUY);
        }
        else
        {
            SetTalkNumber(price);
            StartShopDialogue(0x24, proc);
            Proc_Break(proc);
        }
        return;
    }

    if (gpKeySt->pressed & B_BUTTON)
    {
        PlaySoundEffect(0x38B);
        Proc_Goto(proc, PL_SHOP_SELL_NOITEM);
        return;
    }
}

void Shop_HandleBuyConfirmPrompt(struct ProcShop * proc)
{
    switch (GetTalkChoiceResult()) {
    case 1:
        break;

    case 0:
    case 2:
    default:
        Proc_Goto(proc, PL_SHOP_BUY);
        break;
    }
}

void Shop_TryAddItemToInventory(struct ProcShop * proc)
{
    if (proc->unitItemCount >= UNIT_ITEM_COUNT)
    {
        if (HasConvoyAccess())
        {
            StartShopDialogue(0x2D, proc);
        }
        else
        {
            StartShopDialogue(0x30, proc);
            Proc_Goto(proc, PL_SHOP_BUY_FULL_NO_INEVNTORY);
        }
        return;
    }

    UnitAddItem(proc->unit, proc->shopItems[proc->head_loc]);
    HandleShopBuyAction(proc);

    Proc_Goto(proc, PL_SHOP_BUY_DONE);
}

void Shop_HandleSendToConvoyPrompt(struct ProcShop * proc)
{
    switch (GetTalkChoiceResult()) {
    case 1:
        break;

    case 0:
    case 2:
    default:
        Proc_Goto(proc, PL_SHOP_BUY_FULL_NO_INEVNTORY);
        break;
    }
}

void Shop_NoSendToConvoyDialogue(struct ProcShop * proc)
{
    if (HasConvoyAccess())
        StartShopDialogue(0x36, proc);
    else
        StartShopDialogue(0x39, proc);
}

void Shop_AddItemToConvoy(struct ProcShop * proc)
{
    AddItemToConvoy(proc->shopItems[proc->head_loc]);
    HandleShopBuyAction(proc);
}

void Shop_SendToConvoyDialogue(struct ProcShop * proc)
{
    StartShopDialogue(0x33, proc);
}

void Shop_CheckIfConvoyFull(struct ProcShop * proc)
{
    if (GetConvoyItemCount() < 100)
        Proc_Goto(proc, PL_SHOP_SENDTO_INVENTORY_EXT);
}

void Shop_ConvoyFullDialogue(struct ProcShop * proc)
{
    StartShopDialogue(0x3C, proc);
}

void Shop_AnythingElseDialogue(struct ProcShop * proc)
{
    StartShopDialogue(0x15, proc);
}

void Shop_SellDialogue(struct ProcShop * proc)
{
    StartShopDialogue(0x18, proc);
}

void Shop_InitSellState(struct ProcShop * proc)
{
    RegisterShopState(
        proc->head_loc,
        proc->unitItemCount,
        5,
        0,
        72,
        ShopDrawSellItemLine,
        proc);
}

void Shop_Loop_SellKeyHandler(struct ProcShop * proc)
{
    s8 moved = 0;

    Shop_TryMoveHandPage();

    SetBgOffset(2, 0, ShopSt_GetBg2Offset());

    if (proc->head_loc != ShopSt_GetHeadLoc())
        moved = 1;

    proc->head_loc = ShopSt_GetHeadLoc();
    proc->hand_loc = ShopSt_GetHandLoc();

    PutUiHand(56, SHOP_HAND_Y(proc));

    if (proc->helpTextActive != 0 && moved != 0)
        StartItemHelpBox(56, SHOP_HAND_Y(proc), proc->unit->items[proc->head_loc]);

    if (IsShopPageScrolling() != 0)
        return;

    if (proc->helpTextActive != 0)
    {
        if (gpKeySt->pressed & (B_BUTTON | R_BUTTON))
        {
            proc->helpTextActive = 0;
            CloseHelpBox();
        }
        return;
    }
    else if (gpKeySt->pressed & R_BUTTON)
    {
        proc->helpTextActive = 1;
        StartItemHelpBox(56, SHOP_HAND_Y(proc), proc->unit->items[proc->head_loc]);
        return;
    }

    if (gpKeySt->pressed & A_BUTTON)
    {
        if (!IsItemSellable(proc->unit->items[proc->head_loc]))
        {
            StartShopDialogue(0x2A, proc);
            Proc_Goto(proc, PL_SHOP_SELL);
        }
        else
        {
            SetTalkNumber(GetItemSellPrice(proc->unit->items[proc->head_loc]));
            StartShopDialogue(0x24, proc);
            Proc_Break(proc);
        }
        return;
    }

    if (gpKeySt->pressed & B_BUTTON)
    {
        PlaySoundEffect(0x38B);
        Proc_Goto(proc, PL_SHOP_ANYTHING_ELSE);
        return;
    }
}

void Shop_HandleSellConfirmPrompt(struct ProcShop * proc)
{
    int gold;

    switch (GetTalkChoiceResult()) {
    case 1:
        PlaySeDelayed(0xB9, 8);

        gActionSt.id = 0x14;

        gold = GetGold();
        gold += GetItemSellPrice(proc->unit->items[proc->head_loc]);
        SetGold(gold);

        UnitRemoveItem(proc->unit, proc->head_loc);

        UpdateShopItemCounts(proc);
        ShopInitTexts_OnSell(proc);
        DisplayGoldBoxText(gBg0Tm + TM_OFFSET_(27, 6));

        if (proc->unitItemCount == 0)
        {
            Proc_Goto(proc, PL_SHOP_SELL_NOITEM);
            return;
        }
        break;

    case 0:
    case 2:
    default:
        Proc_Goto(proc, PL_SHOP_SELL);
        break;
    }
}

void Shop_SellAnythingElseDialogue(struct ProcShop * proc)
{
    StartShopDialogue(0x1E, proc);
}

void Shop_AnythingElseRestartDialogue(struct ProcShop * proc)
{
    proc->head_loc = 0;
    StartShopDialogue(0xC, proc);
}

void Shop_AnythingElseContinueDialogue(struct ProcShop * proc)
{
    StartShopDialogue(0xF, proc);
}

void Shop_ExitShopDialogue(struct ProcShop * proc)
{
    if (proc->unit == 0)
        StartShopDialogue(7, proc);
    else
        StartShopDialogue(0x27, proc);
}

void Shop_OnExit(struct ProcShop * proc)
{
    Proc_EndEach(gProcScr_GoldBox);
    Proc_ForEach(ProcScr_Mu, (ProcFunc) ShowMu);
}

void Shop_PrepEntryDialogue(struct ProcShop * proc)
{
    StartShopDialogue(5, proc);
}

void Shop_Loop_UnkKeyHandler(struct ProcShop * proc)
{
    s8 moved = 0;

    Shop_TryMoveHandPage();

    SetBgOffset(2, 0, ShopSt_GetBg2Offset());

    if (proc->head_loc != ShopSt_GetHeadLoc())
        moved = 1;

    proc->head_loc = ShopSt_GetHeadLoc();
    proc->hand_loc = ShopSt_GetHandLoc();

    proc->head_idx = proc->head_loc;
    proc->hand_idx = proc->hand_loc;

    PutUiHand(56, SHOP_HAND_Y(proc));

    if (proc->helpTextActive != 0 && moved != 0)
        StartItemHelpBox(56, SHOP_HAND_Y(proc), proc->shopItems[proc->head_loc]);

    DisplayShopUiArrows();

    if (IsShopPageScrolling() != 0)
        return;

    if (proc->helpTextActive != 0)
    {
        if (gpKeySt->pressed & (B_BUTTON | R_BUTTON))
        {
            proc->helpTextActive = 0;
            CloseHelpBox();
        }
        return;
    }
    else if (gpKeySt->pressed & R_BUTTON)
    {
        proc->helpTextActive = 1;
        StartItemHelpBox(56, SHOP_HAND_Y(proc), proc->shopItems[proc->head_loc]);
        return;
    }

    if (gpKeySt->pressed & (A_BUTTON | B_BUTTON))
    {
        PlaySoundEffect(0x38B);
        Proc_Goto(proc, PL_SHOP_EXIT);
        return;
    }
}

void StartShopFadeIn(struct ProcShop * proc)
{
    if (!(gBmSt.flags & BM_FLAG_4))
        Proc_StartBlocking(gProcScr_ShopFadeIn, proc);
}

void StartShopFadeOut(struct ProcShop * proc)
{
    if (!(gBmSt.flags & BM_FLAG_4))
    {
        Proc_StartBlocking(gProcScr_ShopFadeOut, proc);
        return;
    }
    ClearTalk();
}

void Shop_Init(struct ProcShop * proc)
{
    int i;

    if (proc->shopType == SHOP_TYPE_ARMORY)
        StartBgm(0x4D, 0);
    else
        StartBgm(0x46, 0);

    Proc_ForEach(ProcScr_Mu, (ProcFunc) HideMu);

    InitShopScreenConfig();

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg3_ct.priority = 3;

    InitTalk(0x200, 2, 0);

    InitFaces();

    proc->head_loc = 0;
    proc->head_idx = 0;
    proc->hand_idx = 0;
    proc->hand_loc = 0;
    proc->buy_or_sel = 0;
    proc->helpTextActive = 0;

    UnpackUiVArrowGfx(0x240, 3);

    StartTalkFace(Shop_GetPortraitIndex(proc), 32, 8, 3, 1);

    Decompress(Tsa_ShopWindows, gBuf);
    TmApplyTsa_thm(gBg1Tm, gBuf, 0x1000);

    DrawUiFrame2(6, 8, 20, 12, 0);

    EnableBgSync(BG1_SYNC_BIT);

    StartUiGoldBox(proc);

    for (i = 0; i < 6; i++)
        InitText(&gShopItemTexts[i], 20);

    DrawShopSoldItems(proc);

    SetWinEnable(1, 1, 0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWin1Layers(1, 1, 0, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    SetWin0Box(56, 72, 240, 152);
    SetWin1Box(0, 8, 240, 56);

    gDispIo.win_ct.win0_enable_blend = 0;
    gDispIo.win_ct.win1_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;

    SetBlendConfig(3, 0, 0, 8);

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    Decompress(Img_MuralBackground, (void *) VRAM + GetBgChrOffset(3));
    TmApplyTsa_thm(gBg3Tm, Tsa_SaveMenuBackground, 0xE000);
    ApplyPalette(Pal_MuralBackground + 0x60, 14);

    EnableBgSync(BG3_SYNC_BIT);
}

void StartUiGoldBox(ProcPtr parent)
{
    struct ProcShop * proc;

    Decompress(Img_ShopGoldBox, (void *) 0x06014C00);

    proc = Proc_Start(gProcScr_GoldBox, parent);
    proc->goldbox_x = 0xAC;
    proc->goldbox_y = 0x2C;
    proc->goldbox_oam2 = 0x4260;
    ApplyPalette(Pal_UiWindowFrame1, 0x10 + 4);
    InitGoldBoxText(gBg0Tm + TM_OFFSET_(28, 6));
    DisplayGoldBoxText(gBg0Tm + TM_OFFSET_(27, 6));
}

void InitGoldBoxText(u16 * tm)
{
    SetTextFont(0);
    InitSystemTextFont();
    InitText(&gText_GoldBox, 1);
    PutSpecialChar(tm, 3, 0x1E);
}

void ClearGoldBoxTextTm2Line(u16 * tm, int col)
{
    while (col > 0)
    {
        *tm = 0;
        *(tm + 0x20) = 0;

        tm--;
        col--;
    }
}

void DisplayGoldBoxText(u16 * tm)
{
    SetTextFont(0);
    InitSystemTextFont();
    ClearGoldBoxTextTm2Line(tm, 6);
    PutNumber(tm, 2, GetGold());
    EnableBgSync(BG0_SYNC_BIT);
}

void ShopInitTexts_OnBuy(struct ProcShop * proc)
{
    int i;
    int index;
    struct ProcShopInit * init;

    proc->buy_or_sel = 0;

    init = Proc_Start(ProcScr_ShopBuyInit, PROC_TREE_3);
    init->shopproc = proc;

    SetTextFont(0);
    InitSystemTextFont();

    for (i = proc->hand_idx; i < proc->hand_idx + 5; i++)
    {
        index = DivRem(i, 6);
        PutBlankText(&gShopItemTexts[index], gBg2Tm + TM_OFFSET_(7, (i * 2 & 0x1F)));
    }

    SetBgOffset(2, 0, proc->hand_idx * 16 - 72);
    EnableBgSync(BG2_SYNC_BIT);
}

void DrawShopSoldItems(struct ProcShop * proc)
{
    int i;
    int item;
    int index;

    SetTextFont(0);
    InitSystemTextFont();

    for (i = proc->hand_idx; i < proc->hand_idx + 5; i++)
    {
        index = DivRem(i, 6);
        ClearText(&gShopItemTexts[index]);
    }

    for (i = proc->hand_idx; i < proc->hand_idx + 5; i++)
    {
        index = DivRem(i, 6);
        item = proc->shopItems[i];

        if (item == 0)
            break;

        DrawShopItemPriceLine(&gShopItemTexts[index], item, proc->unit, gBg2Tm + TM_OFFSET_(7, (i * 2 & 0x1F)));
    }

    SetBgOffset(2, 0, proc->hand_idx * 16 - 72);
    EnableBgSync(BG2_SYNC_BIT);
}

void InitShopBuyStatus(struct ProcShopInit * proc)
{
    Shop_InitBuyState(proc->shopproc);
    DrawShopSoldItems(proc->shopproc);
    Proc_Break(proc);
}

void ShopInitTexts_OnSell(struct ProcShop * proc)
{
    int i;
    int index;
    struct ProcShopInit * init;

    proc->buy_or_sel = 1;

    init = Proc_Start(ProcScr_ShopSellInit, PROC_TREE_3);
    init->shopproc = proc;

    SetTextFont(0);
    InitSystemTextFont();

    for (i = 0; i < 5; i++)
    {
        index = DivRem(i, 6);
        PutBlankText(&gShopItemTexts[index], gBg2Tm + TM_OFFSET_(7, (i * 2 & 0x1F)));
    }

    SetBgOffset(2, 0, -72);
    EnableBgSync(BG2_SYNC_BIT);
}

void ShopDrawDefaultSellItemLine(struct ProcShop * proc)
{
    int i;
    int item;
    int index;

    SetTextFont(0);
    InitSystemTextFont();

    for (i = 0; i < 5; i++)
    {
        index = DivRem(i, 6);
        ClearText(&gShopItemTexts[index]);
    }

    for (i = 0; i < 5; i++)
    {
        index = DivRem(i, 6);
        item = proc->unit->items[i];

        if (item == 0)
            break;

        DrawShopItemLine(&gShopItemTexts[index], item, proc->unit, gBg2Tm + TM_OFFSET_(7, (i * 2 & 0x1F)));
    }

    EnableBgSync(BG2_SYNC_BIT);
}

void InitShopSellStatus(struct ProcShopInit * proc)
{
    Shop_InitSellState(proc->shopproc);
    ShopDrawDefaultSellItemLine(proc->shopproc);
    Proc_Break(proc);
}

void DrawShopItemPriceLine(struct Text * text, int item, struct Unit * unit, u16 * tm)
{
    int price = GetItemPurchasePrice(unit, item);

    DrawItemMenuLine(text, item, IsItemDisplayUsable(unit, item), tm);
    PutNumber(tm + 0x11, (int) GetGold() >= price ? 2 : 1, price);
}

void DrawShopItemLine(struct Text * text, int item, struct Unit * unit, u16 * tm)
{
    DrawItemMenuLine(text, item, IsItemDisplayUsable(unit, item), tm);

    if (IsItemSellable(item))
        PutNumber(tm + 0x11, 2, GetItemSellPrice(item));
    else
        Text_InsertDrawString(text, 0x5C, 2, DecodeMsg(0x127E));
}

u16 GetItemPurchasePrice(struct Unit * unit, int item)
{
    int cost = GetItemCost(item);

    if (UnitHasItem(unit, 0x72))
        return cost / 2;
    else
        return cost;
}

u16 GetItemSellPrice(int item)
{
    return GetItemCost(item) / 2;
}

s8 IsItemSellable(int item)
{
    if (GetItemAttributes(item) & 0x10)
        return 0;

    if (GetItemSellPrice(item) == 0)
        return 0;

    return 1;
}

void GoldBox_OnLoop(struct ProcShop * proc)
{
    PutOamHiRam(proc->goldbox_x, proc->goldbox_y, Sprite_ShopGoldBox, proc->goldbox_oam2);
}

void InitShopScreenConfig(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
    SetWinEnable(0, 0, 0);

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);
    SetBgOffset(3, 0, 0);

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);
    TmFill(gBg3Tm, 0);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    ResetText();
    UnpackUiWindowFrameGraphics();
    InitIcons();
    ApplyIconPalettes(4);
    LoadHelpBoxGfx(0, -1);
}

void _DisplayShopUiArrows(ProcPtr proc)
{
    DisplayShopUiArrows();
}

void DisplayShopUiArrows(void)
{
    if (ShouldDisplayUpArrow())
        DisplayUiVArrow(0x78, 0x40, 0x3240, 1);

    if (ShouldDisplayDownArrow())
        DisplayUiVArrow(0x78, 0x98, 0x3240, 0);
}

void UnpackUiVArrowGfx(int chr, int pal)
{
    Decompress(Img_UiVArrow, (void *) (0x06010000 + ((chr & 0x3FF) << 5)));
    ApplyPalette(gUnknown_08405B0C, 0x10 + pal);
}

void DisplayUiVArrow(int x, int y, u16 oam2, int flip_en)
{
    int offset;
    int vflip;

    offset = DivRem(GetGameTime(), 40);
    offset = Div(offset, 8) * 2;

    if (flip_en == 0)
        vflip = 0x2000;
    else
        vflip = 0;

    PutSpriteExt(2, x | vflip, y, Sprite_16x8, oam2 + offset);
}

void HandleShopBuyAction(struct ProcShop * proc)
{
    int gold;

    PlaySeDelayed(0xB9, 8);

    gActionSt.id = 0x14;

    gold = GetGold();
    gold -= GetItemPurchasePrice(proc->unit, proc->shopItems[proc->head_loc]);
    SetGold(gold);

    UpdateShopItemCounts(proc);
    DrawShopSoldItems(proc);
    DisplayGoldBoxText(gBg0Tm + TM_OFFSET_(27, 6));
}

int ShopTryMoveHand(int pos, int pre, s8 hscroll_en)
{
    int previous;

    if (pos < 0)
        pos = 0;

    if (pos >= pre)
        pos = pre - 1;

    previous = pos;

    if (gpKeySt->repeated & DPAD_UP)
    {
        if (pos == 0)
        {
            if (hscroll_en && (gpKeySt->pressed & DPAD_UP))
                pos = pre - 1;
        }
        else
        {
            pos--;
        }
    }
    else if (gpKeySt->repeated & DPAD_DOWN)
    {
        if (pos == (pre - 1))
        {
            if (hscroll_en && (gpKeySt->pressed & DPAD_DOWN))
                pos = 0;
        }
        else
            pos++;
    }

    if (previous != pos)
    {
        PlaySoundEffect(0x386);
    }

    return pos;
}

void ShopSt_SetHeadLocBak(int loc)
{
    sShopHeadLocBak = loc;
}

int ShopTryScrollPage(int head_loc, int total, int lines, int hand_loc)
{
    int bak = sShopHeadLocBak;

    sShopHeadLocBak = head_loc;

    if (head_loc == bak)
        return 0;

    if (lines > total)
        return 0;

    if (head_loc < bak)
    {
        if (hand_loc == 0)
            return 0;

        if (head_loc - hand_loc < 1)
            return -1;
    }
    else
    {
        if (lines + hand_loc == total)
            return 0;

        if (head_loc - hand_loc >= lines - 1)
            return 1;
    }

    return 0;
}

int ShopUpdateBg2Offset(int off, int tar, int trig)
{
    if ((off - tar >= 0 ? off - tar : tar - off) < trig)
        return tar;

    off += (tar - off > 0 ? 1 : (tar - off < 0 ? -1 : 0)) * trig;
    return off;
}

void RegisterShopState(u16 head_loc, u16 item_cnt, u16 lines, u16 hand_loc, int bg2_base, ShopFunc func, struct ProcShop * proc)
{
    ShopSt_SetHeadLocBak(head_loc);

    gShopState->head_loc = head_loc;
    gShopState->item_cnt = item_cnt;
    gShopState->lines = lines;
    gShopState->hand_loc = hand_loc;
    gShopState->px_per_line = 16;
    gShopState->trig = 4;
    gShopState->draw_line = func;
    gShopState->proc = proc;
    gShopState->bg2_base = -bg2_base;
    gShopState->bg2_off = hand_loc * 16;
}

void Shop_TryMoveHandPage(void)
{
    gShopState->head_loc = ShopTryMoveHand(gShopState->head_loc, gShopState->item_cnt, 0);

    switch (ShopTryScrollPage(gShopState->head_loc, gShopState->item_cnt, gShopState->lines, gShopState->hand_loc)) {
    case 0:
    default:
        break;

    case +1:
        gShopState->hand_loc++;
        gShopState->draw_line(gShopState->proc, gShopState->hand_loc + gShopState->lines - 1);
        break;

    case -1:
        gShopState->hand_loc--;
        gShopState->draw_line(gShopState->proc, gShopState->hand_loc);
        break;
    }

    gShopState->bg2_off = ShopUpdateBg2Offset(
        gShopState->bg2_off,
        gShopState->hand_loc * gShopState->px_per_line,
        gShopState->trig);
}

u16 ShopSt_GetHeadLoc(void)
{
    return gShopState->head_loc;
}

int ShopSt_GetBg2Offset(void)
{
    return gShopState->bg2_base + gShopState->bg2_off;
}

u16 ShopSt_GetHandLoc(void)
{
    return gShopState->hand_loc;
}

void ShopSt_SetLineHeight(int px)
{
    gShopState->px_per_line = px;
}

void ShopSt_SetSetPageScrollTrigOffset(int trig)
{
    gShopState->trig = trig;
}

s8 IsShopPageScrolling(void)
{
    if (gShopState->bg2_off != gShopState->hand_loc * gShopState->px_per_line)
        return 1;

    return 0;
}

s8 ShouldDisplayUpArrow(void)
{
    if (gShopState->hand_loc != 0)
        return 1;

    return 0;
}

s8 ShouldDisplayDownArrow(void)
{
    if (gShopState->hand_loc + gShopState->lines < gShopState->item_cnt)
        return 1;

    return 0;
}


SECTION(".rodata.08CE6F48")
const struct ProcCmd gProcScr_ShopFadeIn[] = {
    PROC_CALL(LockGame),
    PROC_SLEEP(1),
    PROC_CALL_ARG(_FadeBgmOut, -1),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(LockBmDisplay),
    PROC_END,
};

SECTION(".rodata.08CE6F80")
const struct ProcCmd gProcScr_ShopFadeOut[] = {
    PROC_CALL(ClearTalk),
    PROC_CALL(UnlockBmDisplay),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(StartMapSongBgm),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(UnlockGame),
    PROC_END,
};

SECTION(".rodata.08CE6FC0")
const struct ProcCmd gProcScr_Shop[] = {
    PROC_CALL(StartShopFadeIn),
    PROC_SLEEP(0),
    PROC_CALL(LockGame),
    PROC_CALL(Shop_Init),
    PROC_CALL(Shop_InitBuyState),
    PROC_START_CHILD(ProcScr_ShopDrawHand),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(1),
    PROC_CALL(Shop_EntryDialogue),
    PROC_LABEL(0),
    PROC_SLEEP(1),
    PROC_REPEAT(Shop_HandleEntryDialoguePrompt),
    PROC_LABEL(1),
    PROC_CALL(Shop_BuyDialogue),
    PROC_LABEL(2),
    PROC_CALL(Shop_InitBuyState),
    PROC_SLEEP(1),
    PROC_REPEAT(Shop_Loop_BuyKeyHandler),
    PROC_CALL(Shop_HandleBuyConfirmPrompt),
    PROC_GOTO(9),
    PROC_LABEL(3),
    PROC_CALL(Shop_AnythingElseDialogue),
    PROC_GOTO(2),
    PROC_LABEL(4),
    PROC_CALL(Shop_SellDialogue),
    PROC_LABEL(5),
    PROC_CALL(Shop_InitSellState),
    PROC_SLEEP(1),
    PROC_REPEAT(Shop_Loop_SellKeyHandler),
    PROC_CALL(Shop_HandleSellConfirmPrompt),
    PROC_SLEEP(2),
    PROC_CALL(Shop_SellAnythingElseDialogue),
    PROC_GOTO(5),
    PROC_LABEL(7),
    PROC_SLEEP(2),
    PROC_CALL(Shop_AnythingElseRestartDialogue),
    PROC_GOTO(0),
    PROC_LABEL(8),
    PROC_SLEEP(1),
    PROC_CALL(Shop_AnythingElseContinueDialogue),
    PROC_GOTO(0),
    PROC_LABEL(9),
    PROC_CALL(Shop_TryAddItemToInventory),
    PROC_SLEEP(0),
    PROC_CALL(Shop_HandleSendToConvoyPrompt),
    PROC_SLEEP(0),
    PROC_CALL(Shop_CheckIfConvoyFull),
    PROC_CALL(Shop_ConvoyFullDialogue),
    PROC_SLEEP(0),
    PROC_GOTO(7),
    PROC_LABEL(10),
    PROC_CALL(Shop_AddItemToConvoy),
    PROC_SLEEP(0),
    PROC_CALL(Shop_SendToConvoyDialogue),
    PROC_SLEEP(0),
    PROC_GOTO(3),
    PROC_LABEL(11),
    PROC_SLEEP(0),
    PROC_CALL(Shop_NoSendToConvoyDialogue),
    PROC_SLEEP(0),
    PROC_GOTO(7),
    PROC_LABEL(13),
    PROC_CALL(Shop_PrepEntryDialogue),
    PROC_SLEEP(0),
    PROC_REPEAT(Shop_Loop_UnkKeyHandler),
    PROC_LABEL(12),
    PROC_CALL(Shop_ExitShopDialogue),
    PROC_SLEEP(1),
    PROC_CALL_ARG(_FadeBgmOut, 2),
    PROC_CALL(sub_08014170),
    PROC_SLEEP(1),
    PROC_CALL(Shop_OnExit),
    PROC_END_EACH(ProcScr_ShopDrawHand),
    PROC_CALL(StartShopFadeOut),
    PROC_SLEEP(0),
    PROC_CALL(UnlockGame),
    PROC_END,
};

SECTION(".rodata.08CE7228")
const struct ProcCmd ProcScr_ShopBuyInit[] = {
    PROC_REPEAT(InitShopBuyStatus),
    PROC_END,
};

SECTION(".rodata.08CE7238")
const struct ProcCmd ProcScr_ShopSellInit[] = {
    PROC_REPEAT(InitShopSellStatus),
    PROC_END,
};
