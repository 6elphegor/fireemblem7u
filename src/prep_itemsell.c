#include "gbafe.h"

int GetGold(void);
u16 GetItemSellPrice(int item);

extern u8 Tsa_0840E6AC[];

CONST_DATA int gShopSellTextIndexLookup[] = {
    4707, 4708,
};

DECLARE_RAM_ADDR(0x0200E68C);
CONST_DATA char * gpShopSellStringBuffer = RAM_ADDR(0x0200E68C);

CONST_DATA struct ProcCmd gProcScr_PrepWMShopSell[] = {
    { 14, 0, NULL },
    { 11, 0, NULL },
    { 2, 0, WmSell_Init },
    { 2, 0, WmSell_Setup },
    { 24, 16, NewFadeIn },
    { 20, 0, FadeInExists },
    { 11, 1, NULL },
    { 2, 0, sub_08098C18 },
    { 3, 0, WmSell_OnLoop_MainKeyHandler },
    { 11, 2, NULL },
    { 2, 0, sub_08098DCC },
    { 3, 0, WmSell_OnLoop_ConfirmSellKeyHandler },
    { 11, 3, NULL },
    { 24, 16, NewFadeOut },
    { 20, 0, FadeOutExists },
    { 2, 0, WmSell_OnEnd },
    { 0, 0, NULL },
    { 1, 0, (void *) 0x04064000 },
    { 1, 0, (void *) 0x04084000 },
    { 1, 0, (void *) 0x040A4000 },
    { 1, 0, (void *) 0x040C4000 },
    { 1, 0, (void *) 0x040E4000 },
    { 1, 0, (void *) 0x04104000 },
    { 1, 0, (void *) 0x04124000 },
    { 1, 0, (void *) 0x04144000 },
    { 1, 0, (void *) 0x04164000 },
};

void WmSell_DrawSupplyDialogueSpriteText(void)
{
    int i;

    for (i = 0; i < 4; i++)
        PutSpriteExt(4, 48 + i * 32, 16, Sprite_32x16, 0xDF80 + i * 4);
}
void sub_080985D4(int index, ProcPtr parent)
{
    StartParallelWorker(WmSell_DrawSupplyDialogueSpriteText, parent);

    NewSysboxText(0x7000, 13, DecodeMsgInBuffer(gShopSellTextIndexLookup[index], gpShopSellStringBuffer), 1, parent);
}
void sub_08098618(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
        vcount = 0;

    if (vcount == 12)
        REG_BLDCNT = 200;

    if ((vcount == 52) || (vcount == 0))
        REG_BLDCNT = 578;
}
void WmSell_Init(struct WmSellProc * proc)
{
    proc->unk_34 = 0;
    proc->unk_32 = 0xff;
    proc->unk_30 = 0;
}
void sub_08098660(void)
{
    InitSpriteTextFont(&PrepItemSuppyTexts.font, (void *) (VRAM + 0x11000), 11);
    ApplyPalette(Pal_Text, 0x1B);

    InitSpriteText(&PrepItemSuppyTexts.th[15]);

    SetTextFont(&PrepItemSuppyTexts.font);
    SetTextFontGlyphs(0);

    SpriteText_DrawBackgroundExt(&PrepItemSuppyTexts.th[15], 0);

    Text_InsertDrawString(&PrepItemSuppyTexts.th[15], 0, 0, DecodeMsg(0x1260));
    Text_InsertDrawString(&PrepItemSuppyTexts.th[15], 32, 0, DecodeMsg(0x1265));
    Text_InsertDrawString(&PrepItemSuppyTexts.th[15], 64, 0, DecodeMsg(0x1266));
    Text_InsertDrawString(&PrepItemSuppyTexts.th[15], 128, 3, DecodeMsg(0x1267));
    Text_InsertDrawString(&PrepItemSuppyTexts.th[15], 192, 3, DecodeMsg(0x1259));

    SetTextFont(NULL);
}
void WmSell_DrawSellOptionSpriteText(void)
{
    PrepItemDrawPopupBox(160, 104, 8, 4, 0xAA00);

    PutSpriteExt(4, 176, 108, Sprite_32x16, 0xB088);
    PutSpriteExt(4, 208, 108, Sprite_32x16, 0xB08C);
    PutSpriteExt(4, 168, 124, Sprite_32x16, 0xB080);
    PutSpriteExt(4, 200, 124, Sprite_32x16, 0xB084);
}
void WmSell_DrawValueSpriteText(void)
{
    PutSpriteExt(4, 140, 88, Sprite_32x16, 0xB090);
    PutSpriteExt(4, 172, 88, Sprite_8x16, 0xB094);
    PutSpriteExt(4, 144, 56, Sprite_32x16, 0xB098);
}
void WmSell_DrawItemGoldValue(int item)
{
    TmFillRect(gBg0Tm + 0x174, 10, 1, 0);

    if (item != 0)
    {
        u16 sellPrice = GetItemSellPrice(item);

        if ((sellPrice == 0) || (GetItemAttributes(item) & 0x10))
        {
            PutSpecialChar(gBg0Tm + 0x174 + 5, TEXT_COLOR_SYSTEM_GRAY, 0x14);
            PutSpecialChar(gBg0Tm + 0x174 + 6, TEXT_COLOR_SYSTEM_GRAY, 0x14);
            PutSpecialChar(gBg0Tm + 0x174 + 7, TEXT_COLOR_SYSTEM_GRAY, 0x14);
        }
        else
        {
            PutNumber(gBg0Tm + 0x174 + 6, 2, sellPrice);
        }

        PutSpecialChar(gBg0Tm + 0x17B, TEXT_COLOR_SYSTEM_GOLD, 0x1E);
    }

    EnableBgSync(BG0_SYNC_BIT);
}
void WmSell_DrawPartyFunds(void)
{
    TmFillRect(gBg0Tm + 0xF4, 10, 1, 0);

    PutNumber(gBg0Tm + 0xF4 + 7, 2, GetGold());
    PutSpecialChar(gBg0Tm + 0xF4 + 8, TEXT_COLOR_SYSTEM_GOLD, 0x1E);

    EnableBgSync(BG0_SYNC_BIT);
}
void WmSell_PutSupplyFaceAndText(void)
{
    SetTextFont(NULL);

    TmFillRect(gBg0Tm + 0x34, 12, 1, 0);

    PutDrawText(&PrepItemSuppyTexts.th[0], gBg0Tm + 0x34 + 0x6d, 0, 2, 0, DecodeMsg(0x125A));
    PutFaceChibi(0x4A, gBg0Tm + 0x34 - 0x13, 0x270, 2, 1);

    EnableBgSync(BG0_SYNC_BIT);
}
void WmSell_Setup(struct WmSellProc * proc)
{
    int i;

    gDispIo.disp_ct.mode = 0;

    InitBgs(NULL);

    TmFill(GetBgTilemap(0), 0);
    TmFill(GetBgTilemap(1), 0);
    TmFill(GetBgTilemap(2), 0);

    gDispIo.bg0_ct.priority = 0;
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
    SetBgOffset(2, 0, 0);

    LoadHelpBoxGfx((void *) (VRAM + 0x12800), -1);
    ApplyIconPalettes(4);

    PrepRestartMuralBackground();

    sub_08091944(0x5000, 5);
    sub_08091994(0x4000, 10);

    PutCompressedTsa(gBg1Tm, Tsa_0840E6AC, 0x5280);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    StartBmFace(0, GetUnitPortraitId(proc->unit), 68, 74, 0x503);
    StartUiCursorHand(proc);
    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);

    SetWinEnable(1, 0, 0);
    SetWin0Box(128, 40, 224, 152);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    SetBlendConfig(0, 8, 8, 8);

    StartGreenText(proc);

    StartHelpPromptSprite(200, 144, proc);

    InitText(&PrepItemSuppyTexts.th[0], 4);
    InitText(&PrepItemSuppyTexts.th[1], 2);

    sub_08098660();

    for (i = 0; i < 5; i++)
        InitText(&PrepItemSuppyTexts.th[2 + i], 7);

    SetOnHBlankA(NULL);
    SetOnHBlankA(sub_08098618);

    EnableBgSync(BG2_SYNC_BIT);

    DrawPrepScreenItems(gBg0Tm + 0x122, &PrepItemSuppyTexts.th[2], proc->unit, 0);
    WmSell_PutSupplyFaceAndText();

    StartParallelWorker(WmSell_DrawValueSpriteText, proc);

    WmSell_DrawItemGoldValue(proc->unit->items[proc->unk_30]);
    WmSell_DrawPartyFunds();

    StartSysBrownBox(0xd, 0xe00, 0xf, 0xc00, 0, proc);
    SetSysBrownBoxWidth(0, 1);
    EnableSysBrownBox(0, 0x88, 0x36, 2);
}
s8 WmSell_MainLoop_HandleDpadKeys(struct WmSellProc * proc)
{
    u16 keys;

    if ((keys = gpKeySt->repeated & DPAD_UP) != 0)
    {
        int count = GetUnitItemCount(proc->unit);

        if (proc->unk_30 != 0)
        {
            proc->unk_30--;
            PlaySoundEffect(0x386);
            return 1;
        }

        if (gpKeySt->pressed & DPAD_UP)
        {
            proc->unk_30 = count - 1;
            PlaySoundEffect(0x386);
            return 1;
        }

        return 0;
    }

    if (gpKeySt->repeated & DPAD_DOWN)
    {
        int count = GetUnitItemCount(proc->unit);

        if (proc->unk_30 < count - 1)
        {
            proc->unk_30++;
            PlaySoundEffect(0x386);
            return 1;
        }

        if (gpKeySt->pressed & DPAD_DOWN)
        {
            proc->unk_30 = keys;
            PlaySoundEffect(0x386);
            return 1;
        }
    }

    return 0;
}
void sub_08098C18(struct WmSellProc * proc)
{
    DrawPrepScreenItems(gBg0Tm + 0x122, &PrepItemSuppyTexts.th[2], proc->unit, 0);

    WmSell_DrawItemGoldValue(proc->unit->items[proc->unk_30]);

    DisableUiCursorHand(0);

    Proc_End(GetParallelWorker(WmSell_DrawSellOptionSpriteText));

    ShowSysHandCursor(16, proc->unk_30 * 16 + 72, 11, 0x400);
    sub_080985D4(0, proc);
}
void WmSell_OnLoop_MainKeyHandler(struct WmSellProc * proc)
{
    u16 item;

    if (proc->unk_34 == 1)
    {
        if (gpKeySt->pressed & (R_BUTTON | B_BUTTON))
        {
            CloseHelpBox();
            proc->unk_34 = 0;
            return;
        }
    }
    else
    {
        if (gpKeySt->pressed & R_BUTTON)
        {
            item = proc->unit->items[proc->unk_30];
            if (item)
            {
                StartItemHelpBox(0x10, proc->unk_30 * 0x10 + 0x48, item);
                proc->unk_34 = 1;
            }

            return;
        }

        if (gpKeySt->pressed & A_BUTTON)
        {
            u16 item = proc->unit->items[proc->unk_30];
            if ((GetItemSellPrice(item) == 0) || (GetItemAttributes(item) & 0x10))
            {
                StartPrepErrorHelpbox(16, proc->unk_30 * 16 + 72, 0x73A, proc);
            }
            else
            {
                Proc_Goto(proc, 2);
                PlaySoundEffect(0x38A);
            }
            return;
        }

        if (gpKeySt->pressed & B_BUTTON)
        {
            Proc_Goto(proc, 3);
            PlaySoundEffect(0x38B);
            return;
        }
    }

    if (WmSell_MainLoop_HandleDpadKeys(proc) != 0)
    {
        ShowSysHandCursor(16, proc->unk_30 * 16 + 72, 11, 0x400);
        WmSell_DrawItemGoldValue(proc->unit->items[proc->unk_30]);
        if (proc->unk_34 == 1)
        {
            item = proc->unit->items[proc->unk_30];
            if (item)
                StartItemHelpBox(0x10, proc->unk_30 * 0x10 + 0x48, item);
        }
    }
}
void sub_08098DCC(struct WmSellProc * proc)
{
    proc->unk_31 = 1;

    StartParallelWorker(WmSell_DrawSellOptionSpriteText, proc);

    SetUiCursorHandConfig(0, 16, proc->unk_30 * 16 + 72, 2);
    ShowSysHandCursor(proc->unk_31 * 32 + 164, 124, 0, 0x400);
    sub_080985D4(1, proc);
}
void WmSell_ConfirmSellItem(struct WmSellProc * proc)
{
    int count;

    AddGold(GetItemSellPrice(proc->unit->items[proc->unk_30]));

    proc->unit->items[proc->unk_30] = 0;

    UnitRemoveInvalidItems(proc->unit);

    PlaySoundEffect(0xB9);

    WmSell_DrawPartyFunds();

    count = GetUnitItemCount(proc->unit);
    if (count == 0)
    {
        DrawPrepScreenItems(gBg0Tm + 0x122, &PrepItemSuppyTexts.th[2], proc->unit, 0);

        Proc_Goto(proc, 3);
    }
    else
    {
        if (count == proc->unk_30)
            proc->unk_30 = count - 1;

        Proc_Goto(proc, 1);
    }
}
void WmSell_OnLoop_ConfirmSellKeyHandler(struct WmSellProc * proc)
{
    int previous = proc->unk_31;

    if (gpKeySt->pressed & A_BUTTON)
    {
        if (previous == 0)
        {
            WmSell_ConfirmSellItem(proc);
            return;
        }
        else
        {
            Proc_Goto(proc, 1);
            PlaySoundEffect(0x38B);
            return;
        }
    }

    if (gpKeySt->pressed & B_BUTTON)
    {
        Proc_Goto(proc, 1);
        PlaySoundEffect(0x38B);
        return;
    }

    if (gpKeySt->repeated & DPAD_LEFT)
        proc->unk_31 = 0;

    if (gpKeySt->repeated & DPAD_RIGHT)
        proc->unk_31 = 1;

    if (previous == proc->unk_31)
        return;

    PlaySoundEffect(0x387);

    ShowSysHandCursor(proc->unk_31 * 32 + 164, 124, 0, 0x400);
}
void WmSell_OnEnd(void)
{
    sub_080A9D08();
    EndMuralBackground_();
    EndFaceById(0);
    SetOnHBlankA(NULL);
}
void StartWorldMapSellScreen(struct Unit * unit, ProcPtr parent)
{
    struct WmSellProc * proc = Proc_StartBlocking(gProcScr_PrepWMShopSell, parent);
    proc->unit = unit;
}
