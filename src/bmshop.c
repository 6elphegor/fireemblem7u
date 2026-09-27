#include "gbafe.h"

#include "gbafe/bmshop.h"

// FE8U: bmshop.c (compiled at -O0 in FE7)

u32 GetGold(void);
void SetGold(s32 amount);
s8 HasConvoyAccess(void);
int AddItemToConvoy(int item);
int GetConvoyItemCount(void);

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

void Shop_HandleBuyConfirmPrompt_(struct ProcShop * proc)
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

ASM_FUNC("asm/nonmatching/code_080B0C9C.s");
ASM_FUNC("asm/nonmatching/code_080B0F1C.s");
ASM_FUNC("asm/nonmatching/code_080B0FE4.s");
ASM_FUNC("asm/nonmatching/code_080B0FFC.s");
ASM_FUNC("asm/nonmatching/code_080B1024.s");
ASM_FUNC("asm/nonmatching/code_080B103C.s");
ASM_FUNC("asm/nonmatching/code_080B1068.s");
ASM_FUNC("asm/nonmatching/code_080B1094.s");
ASM_FUNC("asm/nonmatching/code_080B10AC.s");
ASM_FUNC("asm/nonmatching/code_080B12E0.s");
ASM_FUNC("asm/nonmatching/code_080B1318.s");
ASM_FUNC("asm/nonmatching/code_080B1354.s");
ASM_FUNC("asm/nonmatching/code_080B17A0.s");
ASM_FUNC("asm/nonmatching/code_080B1844.s");
ASM_FUNC("asm/nonmatching/code_080B1878.s");
ASM_FUNC("asm/nonmatching/code_080B18B0.s");
ASM_FUNC("asm/nonmatching/code_080B18E8.s");
ASM_FUNC("asm/nonmatching/code_080B19AC.s");
ASM_FUNC("asm/nonmatching/code_080B1AAC.s");
ASM_FUNC("asm/nonmatching/code_080B1AD8.s");
ASM_FUNC("asm/nonmatching/code_080B1B80.s");
ASM_FUNC("asm/nonmatching/code_080B1C44.s");
ASM_FUNC("asm/nonmatching/code_080B1C70.s");
ASM_FUNC("asm/nonmatching/code_080B1CCC.s");
ASM_FUNC("asm/nonmatching/code_080B1D40.s");
ASM_FUNC("asm/nonmatching/code_080B1D90.s");
ASM_FUNC("asm/nonmatching/code_080B1DB8.s");
ASM_FUNC("asm/nonmatching/code_080B1DF0.s");
ASM_FUNC("asm/nonmatching/code_080B1E28.s");
ASM_FUNC("asm/nonmatching/code_080B1F18.s");
ASM_FUNC("asm/nonmatching/code_080B1F2C.s");
ASM_FUNC("asm/nonmatching/code_080B1F6C.s");
ASM_FUNC("asm/nonmatching/code_080B1FB0.s");
ASM_FUNC("asm/nonmatching/code_080B2020.s");
ASM_FUNC("asm/nonmatching/code_080B209C.s");
ASM_FUNC("asm/nonmatching/code_080B21A4.s");
ASM_FUNC("asm/nonmatching/code_080B21C0.s");
ASM_FUNC("asm/nonmatching/code_080B224C.s");
ASM_FUNC("asm/nonmatching/code_080B22BC.s");
ASM_FUNC("asm/nonmatching/code_080B23B8.s");
ASM_FUNC("asm/nonmatching/code_080B24EC.s");
ASM_FUNC("asm/nonmatching/code_080B2508.s");
ASM_FUNC("asm/nonmatching/code_080B252C.s");
ASM_FUNC("asm/nonmatching/code_080B2548.s");
ASM_FUNC("asm/nonmatching/code_080B2574.s");
ASM_FUNC("asm/nonmatching/code_080B25A0.s");
ASM_FUNC("asm/nonmatching/code_080B25D0.s");
ASM_FUNC("asm/nonmatching/code_080B25F4.s");
