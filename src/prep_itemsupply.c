#include "gbafe.h"

extern u16 Pal_08405EA4[];
extern u8 Img_08405B4C[];
extern u8 Img_08405CE4[];
extern u16 gUnk_08407400[];
extern u16 const * CONST_DATA gUnk_08CC4FA0[];
extern u16 CONST_DATA gUnk_08CC4F90[];

void UpdateMenuScrollBarConfig(u8 a, u16 b, u16 c, u8 d);
ProcPtr StartMenuScrollBar(ProcPtr parent);
void InitMenuScrollBarImg(int chr, int pal);
void PutMenuScrollBarAt(int x, int y);
void TryHideMenuScrollBar(void);
void EndMenuScrollBar(void);
void SomethingPrepListRelated(struct Unit * unit, int page, int flags);
void sub_0809120C(void);
int GetPrepPageForItem(int item);
s8 sub_08090EE8(struct Unit * unit, int slot);
void MU_SetDefaultFacing_Auto(void);


extern u8 Tsa_0840E5D4[];
extern u8 Img_08405754[];

CONST_DATA int gSupplyTextIndexLookup[] = {
    4714, 4715, 4716,
};

CONST_DATA char * gpPrepItemSupplyStringBuffer = (char *) 0x0200E68C;

CONST_DATA int gSupplyHelpTextIndexLookup[] = {
    909, 910,
};

CONST_DATA struct ProcCmd ProcScr_PrepItemSupplyScreen[] = {
    PROC_YIELD,
    PROC_LABEL(0),
    PROC_CALL(PrepItemSupply_Init),
    PROC_CALL(sub_080962A0),
    PROC_YIELD,
    PROC_CALL(PrepItemSupply_InitGfx),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_LABEL(1),
    PROC_CALL(sub_08096604),
    PROC_LABEL(2),
    PROC_REPEAT(PrepItemSupply_Loop_GiveTakeKeyHandler),
    PROC_LABEL(4),
    PROC_CALL(sub_08096B1C),
    PROC_REPEAT(sub_08096DC0),
    PROC_LABEL(5),
    PROC_REPEAT(PrepItemSupply_SwitchPageLeft),
    PROC_LABEL(6),
    PROC_REPEAT(PrepItemSupply_SwitchPageRight),
    PROC_LABEL(3),
    PROC_CALL(PrepItemSupply_SwitchToUnitInventory),
    PROC_REPEAT(PrepItemSupply_Loop_UnitInvKeyHandler),
    PROC_LABEL(8),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_LABEL(9),
    PROC_CALL(PrepItemSupply_OnEnd),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_BmSupplyScreen[] = {
    PROC_CALL(LockGame),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(LockBmDisplay),
    PROC_LABEL(0),
    PROC_CALL(sub_08097488),
    PROC_CALL(DisableAllGfx),
    PROC_YIELD,
    PROC_CALL(PrepItemSupply_Init),
    PROC_CALL(sub_080962A0),
    PROC_YIELD,
    PROC_CALL(PrepItemSupply_InitGfx),
    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),
    PROC_LABEL(1),
    PROC_CALL(sub_08096604),
    PROC_LABEL(2),
    PROC_REPEAT(PrepItemSupply_Loop_GiveTakeKeyHandler),
    PROC_LABEL(4),
    PROC_CALL(sub_08096B1C),
    PROC_REPEAT(sub_08096DC0),
    PROC_LABEL(5),
    PROC_REPEAT(PrepItemSupply_SwitchPageLeft),
    PROC_LABEL(6),
    PROC_REPEAT(PrepItemSupply_SwitchPageRight),
    PROC_LABEL(3),
    PROC_CALL(PrepItemSupply_SwitchToUnitInventory),
    PROC_REPEAT(PrepItemSupply_Loop_UnitInvKeyHandler),
    PROC_LABEL(8),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_LABEL(9),
    PROC_CALL(PrepItemSupply_OnEnd),
    PROC_CALL(UnlockBmDisplay),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(sub_080974A8),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_YIELD,
    PROC_CALL(UnlockGame),
    PROC_END,
};

void sub_08095BF4(void)
{
    int i;
    for (i = 0; i < 4; i++)
        PutSpriteExt(4, 48 + i * 32, 16, Sprite_32x16, 0xDFC0 + i * 4);
}
void sub_08095C28(int idx, ProcPtr proc)
{
    StartParallelWorker(sub_08095BF4, proc);

    sub_080A9D1C(0x7800, 0xd, DecodeMsgInBuffer(gSupplyTextIndexLookup[idx], gpPrepItemSupplyStringBuffer), 1, proc);
}
void StoreConvoyWeaponIconGraphics(int vramOffset, int pal)
{
    ApplyPalette(Pal_08405EA4, pal);
    Decompress(Img_08405B4C, (void *) (VRAM + vramOffset));
    Decompress(Img_08405CE4, (void *) (0x6000200 + vramOffset));
}
void sub_08095CA8(struct Text * textBase, u16 * tm, int yLines, struct Unit * unit)
{
    int i;

    TmFillRect(tm, 12, 31, 0);

    if (Unk_Prep_02012466 == 0)
    {
        ClearText(textBase);
        Text_InsertDrawString(textBase, 0, 1, DecodeMsg(0x126D));
        PutText(textBase, tm + 3);
        return;
    }

    for (i = yLines; (i < yLines + 7) && (i < Unk_Prep_02012466); i++)
    {
        struct Text * th = textBase + (i & 7);
        int item = gPrepScreenItemList[i].item;
        int unusable = !IsItemDisplayUsable(unit, item);

        ClearText(th);

        Text_InsertDrawString(th, 0, unusable, GetItemName(item));

        PutIcon(tm + TM_OFFSET(1, i * 2 & 0x1f), GetItemIconId(item), 0x4000);

        PutText(th, tm + TM_OFFSET(3, i * 2 & 0x1f));

        PutNumberOrBlank(tm + TM_OFFSET(12, i * 2 & 0x1f), !unusable ? 2 : 1, GetItemUses(item));
    }
}
void sub_08095DC0(u16 * tm, int yLines)
{
    int i;

    for (i = yLines; i < yLines + 7 && i < Unk_Prep_02012466; i++)
    {
        int item = gPrepScreenItemList[i].item;
        PutIcon(tm + TM_OFFSET(1, i * 2 & 0x1f), GetItemIconId(item), 0x4000);
    }
}
void sub_08095E24(struct Text * textBase, u16 * tm, int yLines, struct Unit * unit)
{
    if (Unk_Prep_02012466 > yLines)
    {
        int y = (yLines * 2) & 0x1f;
        struct Text * th = textBase + (yLines & 7);
        int item = gPrepScreenItemList[yLines].item;
        int unusable = !IsItemDisplayUsable(unit, item);

        int offset = TM_OFFSET(0, y);
        TmFillRect(tm + offset, 12, 1, 0);

        ClearText(th);
        Text_InsertDrawString(th, 0, unusable, GetItemName(item));
        PutIcon(tm + offset + 1, GetItemIconId(item), 0x4000);
        PutText(th, tm + offset + 3);

        PutNumberOrBlank(tm + offset + 12, !unusable ? 2 : 1, GetItemUses(item));
    }
}
void PrepItemSupply_OnHBlank(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
        vcount = 0;

    if (vcount == 12)
    {
        REG_BLDCNT = (BLDCNT_TGT1_BG3 | BLDCNT_EFFECT_DARKEN);
        *(vu16 *) (REG_ADDR_BLDY) = 8;
    }

    if ((vcount == 52) || (vcount == 0))
    {
        REG_BLDCNT = 0;
        *(vu16 *) (REG_ADDR_BLDY) = 0;
    }
}
void PrepItemSupply_Init(struct PrepItemSupplyProc * proc)
{
    int i;

    proc->unk_38 = 0;
    proc->unk_36 = 0xff;

    if (GetUnitItemCount(proc->unit) == 0)
        proc->unk_33 = 1;
    else
        proc->unk_33 = 0;

    if (proc->unk_30 == 0)
    {
        struct ProcAtMenu * pAtMenuProc = Proc_Find(ProcScr_AtMenu);
        proc->currentPage = pAtMenuProc->unk_32;
    }
    else
    {
        proc->currentPage = 0;
    }

    proc->scrollAmount = 4;
    proc->unitInvIdx = 0;

    for (i = 0; i < 9; i++)
    {
        proc->idxPerPage[i] = 0;
        proc->yOffsetPerPage[i] = 0;
    }
}
void sub_08095F90(void)
{
    InitSpriteTextFont(&PrepItemSuppyTexts.font, (void *) 0x06011000, 0xb);
    ApplyPalette(Pal_Text, 0x1B);
    InitSpriteText(&PrepItemSuppyTexts.th[0xf]);
    SetTextFont(NULL);
}
void sub_08095FCC(struct PrepItemSupplyProc * proc)
{
    int color;
    struct Text * th;

    int convoyItemCount = GetConvoyItemCount_();
    int unitItemCount = GetUnitItemCount(proc->unit);

    SetTextFont(&PrepItemSuppyTexts.font);
    SetTextFontGlyphs(0);

    SpriteText_DrawBackgroundExt(&PrepItemSuppyTexts.th[0xf], 0);
    th = &PrepItemSuppyTexts.th[0xf];

    color = 0;
    if ((convoyItemCount == 100) || (unitItemCount == 0))
        color = 1;

    Text_InsertDrawString(th, 0, color, DecodeMsg(0x126E));

    Text_InsertDrawString(&PrepItemSuppyTexts.th[0xf], 0x40, unitItemCount == UNIT_ITEM_COUNT ? 1 : 0, DecodeMsg(0x126F));

    SetTextFont(NULL);
}
void sub_08096054(void)
{
    SetTextFont(NULL);
    TmFillRect(gBg0Tm + 0x34, 12, 1, 0);

    PutDrawText(&PrepItemSuppyTexts.th[0], gBg0Tm + 0x34 + 0x6d, 0, 2, 0, DecodeMsg(0x125A));
    PutFaceChibi(0x4A, gBg0Tm + 0x34 - 0x13, 0x270, 2, 1);
    PutDrawText(&PrepItemSuppyTexts.th[0] + 1, gBg0Tm + 0x34, 0, 0, 0, DecodeMsg(0x1270));

    PutNumber(gBg0Tm + 0x34 + 5, (GetConvoyItemCount_() == 100) ? 4 : 2, GetConvoyItemCount_());
    PutSpecialChar(gBg0Tm + 0x34 + 6, TEXT_COLOR_SYSTEM_WHITE, 0x16);
    PutNumber(gBg0Tm + 0x34 + 9, 2, 100);

    EnableBgSync(BG0_SYNC_BIT);
}
void PutGiveTakeBoxSprites(void)
{
    PrepItemDrawPopupBox(0x40, 0x22, 5, 4, 0xA980);
    PutSpriteExt(4, 72, 0x26, Sprite_32x16, 0xB080);
    PutSpriteExt(4, 72, 0x36, Sprite_32x16, 0xB088);
}
void PutGiveSprites(void)
{
    PrepItemDrawPopupBox(0x40, 0x22, 5, 2, 0xA980);
    PutSpriteExt(4, 72, 0x26, Sprite_32x16, 0xB080);
}
void PutTakeSprites(void)
{
    PrepItemDrawPopupBox(0x40, 0x32, 5, 2, 0xA980);
    PutSpriteExt(4, 72, 0x36, Sprite_32x16, 0xB088);
}
void Supply_PutHighlightedCategorySprites(struct PrepItemSupplyProc * proc)
{
    int x = proc->currentPage * 12 + 124;

    gPal[0x16D] = *(gUnk_08407400 + (GetGameTime() >> 2 & 0xf));
    EnablePalSync();

    PutSprite(4, x, 24, gUnk_08CC4FA0[proc->currentPage], 0x6280);
    PutSprite(4, x, 24, gUnk_08CC4F90, 0x6280);

    UpdateMenuScrollBarConfig(0xb, proc->yOffsetPerPage[proc->currentPage], Unk_Prep_02012466, 7);
}
void sub_08096260(u16 * tm, u32 chr, int pal)
{
    int i;

    for (i = 0; i < 0xf; i++)
    {
        tm[i] = ((pal) << 12) + ((chr) & 0x1ffff) / 0x20 + i;
        tm[0x20 + i] = ((pal) << 12) + ((chr + 0x200) & 0x1ffff) / 0x20 + i;
    }
}
void sub_080962A0(struct PrepItemSupplyProc * proc)
{
    SetDispEnable(0, 0, 0, 0, 0);

    gDispIo.disp_ct.mode = 0;
    InitBgs(NULL);
    SetOnHBlankA(NULL);

    SetDispEnable(0, 0, 0, 0, 0);

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
    PrepRestartMuralBackground();
}
void PrepItemSupply_InitGfx(struct PrepItemSupplyProc * proc)
{
    int i;

    ApplySystemObjectsGraphics();

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, proc->yOffsetPerPage[proc->currentPage] - 0x28);

    LoadHelpBoxGfx((void *) 0x06016000, -1);
    ApplyIconPalettes(4);

    sub_08091944(0x5000, 5);
    sub_08091994(0x3000, 10);

    PutCompressedTsa(gBg1Tm, Tsa_0840E5D4, 0x5280);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    StartSysBrownBox(0xd, 0xe00, 0xf, 0xc00, 0, proc);
    EnableSysBrownBox(0, 0x98, 6, 2);
    DecodeMsg(proc->unit->pCharacterData->nameTextId);
    StartUiCursorHand(proc);
    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);

    SetWinEnable(1, 0, 0);
    SetWin0Box(128, 40, 224, 152);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    SetBlendConfig(0, 0, 0, 8);
    StartGreenText(proc);
    StartHelpPromptSprite(200, 144, proc);

    InitText(&PrepItemSuppyTexts.th[0], 4);
    InitText(&PrepItemSuppyTexts.th[1], 4);

    sub_08095F90();

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
        InitText(&PrepItemSuppyTexts.th[2 + i], 7);

    for (i = 0; i < 8; i++)
        InitTextDb(&PrepItemSuppyTexts.th[7 + i], 7);

    SetOnHBlankA(PrepItemSupply_OnHBlank);

    StoreConvoyWeaponIconGraphics(0x4000, 6);
    sub_08096260(gBg0Tm + 0x6F, 0x4000, 6);

    Decompress(Img_08405754, (void *) 0x06015000);

    StartMenuScrollBar(proc);
    InitMenuScrollBarImg(0x5800, 6);
    PutMenuScrollBarAt(0xe2, 0x30);
    TryHideMenuScrollBar();
    SomethingPrepListRelated(proc->unit, proc->currentPage, 1);

    sub_08095CA8(
        &PrepItemSuppyTexts.th[7], gBg2Tm + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);
    EnableBgSync(BG2_SYNC_BIT);

    DrawPrepScreenItems(gBg0Tm + 0x6F + 0xb3, &PrepItemSuppyTexts.th[2], proc->unit, 0);
    sub_08096054();
    StartUiSpinningArrows(proc);
    LoadUiSpinningArrowGfx(0, 0x280, 2);
    SetUiSpinningArrowPositions(0x78, 0x18, 0xea, 0x18);
    SetUiSpinningArrowConfig(3);
    StartParallelWorker(Supply_PutHighlightedCategorySprites, proc);
}
void sub_08096604(struct PrepItemSupplyProc * proc)
{
    sub_08095C28(0, proc);
    DisableUiCursorHand(0);
    sub_08095FCC(proc);
    ShowSysHandCursor(68, proc->unk_33 * 16 + 36, 4, 0x400);
    Proc_End(GetParallelWorker(PutGiveSprites));
    Proc_End(GetParallelWorker(PutTakeSprites));
    StartParallelWorker(PutGiveTakeBoxSprites, proc);
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}
void PrepItemSupply_Loop_GiveTakeKeyHandler(struct PrepItemSupplyProc * proc)
{
    int idx = proc->unk_33;

    if (proc->unk_38 == 0)
    {
        if (gpKeySt->pressed & A_BUTTON)
        {
            switch (idx)
            {
            case 0:
                if ((GetConvoyItemCount_() < 100) && (GetUnitItemCount(proc->unit) > 0))
                {
                    SetUiCursorHandConfig(0, 68, proc->unk_33 * 16 + 36, 2);
                    Proc_End(GetParallelWorker(PutGiveTakeBoxSprites));
                    StartParallelWorker(PutGiveSprites, proc);
                    sub_08095C28(1, proc);
                    PlaySoundEffect(0x38A);
                    Proc_Goto(proc, 3);
                    return;
                }

                PlaySoundEffect(0x38C);
                break;

            case 1:
                if (GetUnitItemCount(proc->unit) < UNIT_ITEM_COUNT)
                {
                    SetUiCursorHandConfig(0, 68, proc->unk_33 * 16 + 36, 2);
                    Proc_End(GetParallelWorker(PutGiveTakeBoxSprites));
                    StartParallelWorker(PutTakeSprites, proc);
                    sub_08095C28(2, proc);
                    PlaySoundEffect(0x38A);
                    Proc_Goto(proc, 4);
                    return;
                }

                PlaySoundEffect(0x38C);
                break;
            }
            return;
        }

        if (gpKeySt->pressed & B_BUTTON)
        {
            Proc_Goto(proc, 8);
            PlaySoundEffect(0x38B);
            return;
        }

        if (gpKeySt->pressed & R_BUTTON)
        {
            StartHelpBox(68, proc->unk_33 * 16 + 36, gSupplyHelpTextIndexLookup[idx]);
            proc->unk_38 = 1;
            return;
        }
    }
    else
    {
        if (gpKeySt->pressed & (R_BUTTON | B_BUTTON))
        {
            CloseHelpBox();
            proc->unk_38 = 0;
            return;
        }
    }

    if (gpKeySt->repeated & DPAD_UP)
    {
        if (proc->unk_33 != 0)
            proc->unk_33--;
        else if (gpKeySt->pressed & DPAD_UP)
            proc->unk_33 = 1;
    }

    if (gpKeySt->repeated & DPAD_DOWN)
    {
        if (proc->unk_33 == 0)
            proc->unk_33++;
        else if (gpKeySt->pressed & DPAD_DOWN)
            proc->unk_33 = 0;
    }

    if (idx != proc->unk_33)
    {
        PlaySoundEffect(0x386);
        ShowSysHandCursor(68, proc->unk_33 * 16 + 36, 4, 0x400);
        if (proc->unk_38 != 0)
            StartHelpBox(68, proc->unk_33 * 16 + 36, gSupplyHelpTextIndexLookup[proc->unk_33]);
    }
}
void sub_0809689C(struct PrepItemSupplyProc * proc)
{
    InitIcons();
    SomethingPrepListRelated(proc->unit, proc->currentPage, 1);
    sub_08095CA8(&PrepItemSuppyTexts.th[7], gBg2Tm + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);
    DrawPrepScreenItemIcons(gBg0Tm + 0x122, proc->unit);
    ShowSysHandCursor(
        0x80, proc->idxPerPage[proc->currentPage] * 16 + 0x28 - proc->yOffsetPerPage[proc->currentPage], 0xb, 0x800);

    EnableBgSync(BG0_SYNC_BIT | BG2_SYNC_BIT);

    if (proc->unk_38 == 0)
        return;

    if (Unk_Prep_02012466 != 0)
    {
        int item = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
        StartItemHelpBox(
            0x80, proc->idxPerPage[proc->currentPage] * 0x10 + 0x28 - proc->yOffsetPerPage[proc->currentPage], item);
        proc->unk_38 = 1;
    }
    else
    {
        CloseHelpBox();
        proc->unk_38 = 0xff;
    }
}
void PrepItemSupply_SwitchPageLeft(struct PrepItemSupplyProc * proc)
{
    int x = 0;
    int four = 4;

    proc->unk_34++;

    if (proc->unk_34 < four)
    {
        int tmp = (((4 - proc->unk_34) * 0x60 * (4 - proc->unk_34)) / (four * four));
        x = tmp - 0x60;
    }

    if (proc->unk_34 == four)
    {
        if (proc->currentPage == 0)
            proc->currentPage = 8;
        else
            proc->currentPage--;

        sub_0809689C(proc);
    }

    if (proc->unk_34 >= four)
    {
        int tmp = four - (proc->unk_34 - four);
        x = (tmp * 0x60 * tmp) / (four * four);
    }

    SetBgOffset(2, (x & 0xff), proc->yOffsetPerPage[proc->currentPage] - 40);

    if (proc->unk_34 == four * 2)
        Proc_Goto(proc, 4);
}
void PrepItemSupply_SwitchPageRight(struct PrepItemSupplyProc * proc)
{
    int x = 0;
    int four = 4;

    proc->unk_34++;

    if (proc->unk_34 < four)
    {
        int tmp = (((4 - proc->unk_34) * 0x60 * (4 - proc->unk_34)) / (four * four));
        x = 0x60 - tmp;
    }

    if (proc->unk_34 == four)
    {
        if (proc->currentPage == 8)
            proc->currentPage = 0;
        else
            proc->currentPage++;

        sub_0809689C(proc);
    }

    if (proc->unk_34 >= four)
    {
        int tmp = four - (proc->unk_34 - four);
        x = -((tmp * 0x60 * tmp) / (four * four));
    }

    SetBgOffset(2, (x & 0xff), proc->yOffsetPerPage[proc->currentPage] - 40);

    if (proc->unk_34 == four * 2)
        Proc_Goto(proc, 4);
}
void sub_08096A98(struct PrepItemSupplyProc * proc)
{
    if (Unk_Prep_02012466 == 0)
    {
        proc->idxPerPage[proc->currentPage] = proc->yOffsetPerPage[proc->currentPage] = 0;
    }
    else
    {
        if (proc->idxPerPage[proc->currentPage] > (Unk_Prep_02012466 - 1))
            proc->idxPerPage[proc->currentPage] = Unk_Prep_02012466 - 1;
    }

    if (Unk_Prep_02012466 > 6)
    {
        if (((proc->yOffsetPerPage[proc->currentPage] >> 4) + 7) > Unk_Prep_02012466)
            proc->yOffsetPerPage[proc->currentPage] = (Unk_Prep_02012466 - 7) * 0x10;
    }

    SetBgOffset(2, 0, proc->yOffsetPerPage[proc->currentPage] - 0x28);
}
void sub_08096B1C(struct PrepItemSupplyProc * proc)
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

    sub_08096A98(proc);

    ShowSysHandCursor(
        0x80, proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage], 0xb, 0x800);
}
void PrepItemSupply_ScrollVertical(struct PrepItemSupplyProc * proc, int amount)
{
    InitIcons();

    sub_08095DC0(gBg2Tm + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4);
    DrawPrepScreenItemIcons(gBg0Tm + 0x122, proc->unit);

    EnableBgSync(BG0_SYNC_BIT | BG2_SYNC_BIT);

    if (amount < 0)
        sub_08095E24(&PrepItemSuppyTexts.th[7], gBg2Tm + 0xF, (proc->yOffsetPerPage[proc->currentPage] >> 4) - 1, proc->unit);

    if (amount > 0)
        sub_08095E24(&PrepItemSuppyTexts.th[7], gBg2Tm + 0xF, (proc->yOffsetPerPage[proc->currentPage] >> 4) + 7, proc->unit);

    proc->yOffsetPerPage[proc->currentPage] += amount;

    SetBgOffset(2, 0, proc->yOffsetPerPage[proc->currentPage] - 40);
}
void sub_08096C54(void)
{
    sub_08096054();
}
void sub_08096C60(struct PrepItemSupplyProc * proc)
{
    int count = GetUnitItemCount(proc->unit);

    if ((count == UNIT_ITEM_COUNT) || (Unk_Prep_02012466 == 0))
    {
        PlaySoundEffect(0x38C);
        return;
    }

    proc->unk_38 = 0;

    proc->unit->items[count] = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
    UnitRemoveInvalidItems(proc->unit);
    gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item = 0;

    sub_0809120C();

    SomethingPrepListRelated(proc->unit, proc->currentPage, 1);
    sub_08096A98(proc);
    InitIcons();

    DrawPrepScreenItems(gBg0Tm + 0x122, &PrepItemSuppyTexts.th[2], proc->unit, 0);
    sub_08095CA8(&PrepItemSuppyTexts.th[7], gBg2Tm + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);

    StartParallelFiniteLoop(sub_08096C54, 1, proc);

    ShowSysHandCursor(
        0x80, proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage], 0xb, 0x800);

    EnableBgSync(BG0_SYNC_BIT | BG2_SYNC_BIT);

    gActionSt.id = 0x19;

    if (GetUnitItemCount(proc->unit) == UNIT_ITEM_COUNT)
    {
        Proc_Goto(proc, 1);
        PlaySoundEffect(0x38B);
    }
    else
    {
        PlaySoundEffect(0x38A);
    }
}
void sub_08096DC0(struct PrepItemSupplyProc * proc)
{
    int idx = proc->idxPerPage[proc->currentPage];

    if ((proc->yOffsetPerPage[proc->currentPage] & 0xf) == 0)
    {
        if ((proc->unk_38 == 0) || (proc->unk_38 == 0xff))
        {
            if (gpKeySt->pressed & R_BUTTON)
            {
                if (Unk_Prep_02012466 != 0)
                {
                    int item = gPrepScreenItemList[proc->idxPerPage[proc->currentPage]].item;
                    StartItemHelpBox(
                        0x80,
                        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage],
                        item);
                    proc->unk_38 = 1;
                    return;
                }
                else
                {
                    PlaySoundEffect(0x38C);
                    return;
                }
            }

            if (gpKeySt->pressed & A_BUTTON)
            {
                sub_08096C60(proc);
                return;
            }

            if (gpKeySt->pressed & B_BUTTON)
            {
                Proc_Goto(proc, 1);
                PlaySoundEffect(0x38B);
                proc->unk_38 = 0;
                return;
            }
        }
        else
        {
            if (gpKeySt->pressed & (R_BUTTON | B_BUTTON))
            {
                CloseHelpBox();
                proc->unk_38 = 0;
                return;
            }
        }

        if (gpKeySt->repeated & DPAD_LEFT)
        {
            SetUiSpinningArrowFastMaybe(0);
            PlaySoundEffect(0x387);
            Proc_Goto(proc, 5);
            proc->unk_34 = 0;
            PrepItemSupply_SwitchPageLeft(proc);
            return;
        }

        if (gpKeySt->repeated & DPAD_RIGHT)
        {
            SetUiSpinningArrowFastMaybe(1);
            PlaySoundEffect(0x387);
            Proc_Goto(proc, 6);
            proc->unk_34 = 0;
            PrepItemSupply_SwitchPageRight(proc);
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

        if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] < 0x38) &&
            (proc->idxPerPage[proc->currentPage] != 0))
        {
            if (proc->unk_38 != 0)
            {
                StartItemHelpBox(
                    0x80, proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] + 16,
                    item);
            }

            PrepItemSupply_ScrollVertical(proc, -proc->scrollAmount);
        }
        else
        {
            if ((proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] > 0x78) &&
                (proc->idxPerPage[proc->currentPage] != Unk_Prep_02012466 - 1))
            {
                if (proc->unk_38 != 0)
                {
                    StartItemHelpBox(
                        0x80,
                        proc->idxPerPage[proc->currentPage] * 16 + 40 - proc->yOffsetPerPage[proc->currentPage] - 0x10,
                        item);
                }
                PrepItemSupply_ScrollVertical(proc, +proc->scrollAmount);
            }
            else
            {
                if (proc->unk_38 != 0)
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
s8 sub_0809714C(struct PrepItemSupplyProc * proc)
{
    u16 keys;

    if ((keys = gpKeySt->repeated & DPAD_UP) != 0)
    {
        int count = GetUnitItemCount(proc->unit);

        if (proc->unitInvIdx != 0)
        {
            proc->unitInvIdx--;
            PlaySoundEffect(0x386);
            return 1;
        }

        if (gpKeySt->pressed & DPAD_UP)
        {
            proc->unitInvIdx = count - 1;
            PlaySoundEffect(0x386);
            return 1;
        }

        return 0;
    }

    if (gpKeySt->repeated & DPAD_DOWN)
    {
        int count = GetUnitItemCount(proc->unit);

        if (proc->unitInvIdx < count - 1)
        {
            proc->unitInvIdx++;
            PlaySoundEffect(0x386);
            return 1;
        }

        if (gpKeySt->pressed & DPAD_DOWN)
        {
            proc->unitInvIdx = keys;
            PlaySoundEffect(0x386);
            return 1;
        }
    }

    return 0;
}
void PrepItemSupply_SwitchToUnitInventory(struct PrepItemSupplyProc * proc)
{
    ShowSysHandCursor(16, proc->unitInvIdx * 16 + 72, 0xb, 0x800);
}
void PrepItemSupply_GiveItemToSupply(struct PrepItemSupplyProc * proc)
{
    int unitItemCount;

    u16 item = proc->unit->items[proc->unitInvIdx];
    GetUnitItemCount(proc->unit);
    proc->unit->items[proc->unitInvIdx] = 0;
    UnitRemoveInvalidItems(proc->unit);

    proc->currentPage = GetPrepPageForItem(item);
    AddItemToConvoy(item);

    SomethingPrepListRelated(proc->unit, proc->currentPage, 1);
    sub_08096A98(proc);

    InitIcons();
    DrawPrepScreenItems(gBg0Tm + 0x122, &PrepItemSuppyTexts.th[2], proc->unit, 0);
    sub_08095CA8(&PrepItemSuppyTexts.th[7], gBg2Tm + 0xF, proc->yOffsetPerPage[proc->currentPage] >> 4, proc->unit);
    StartParallelFiniteLoop(sub_08096C54, 1, proc);

    EnableBgSync(BG2_SYNC_BIT);

    unitItemCount = GetUnitItemCount(proc->unit);

    gActionSt.id = 0x19;

    if ((unitItemCount == 0) || (GetConvoyItemCount_() == 100))
    {
        Proc_Goto(proc, 1);
        PlaySoundEffect(0x38B);
    }
    else
    {
        PlaySoundEffect(0x38A);
        if (unitItemCount <= proc->unitInvIdx)
        {
            proc->unitInvIdx = unitItemCount - 1;
            ShowSysHandCursor(16, proc->unitInvIdx * 16 + 72, 0xb, 0x800);
        }
    }
}
void PrepItemSupply_Loop_UnitInvKeyHandler(struct PrepItemSupplyProc * proc)
{
    u16 item;

    if (proc->unk_38 == 1)
    {
        if (gpKeySt->pressed & (R_BUTTON | B_BUTTON))
        {
            CloseHelpBox();
            proc->unk_38 = 0;
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
            proc->unk_38 = 1;
            return;
        }

        if (gpKeySt->pressed & A_BUTTON)
        {
            if (sub_08090EE8(proc->unit, proc->unitInvIdx) == 0)
            {
                StartPrepErrorHelpbox(-1, -1, 0x3AE, proc);
                return;
            }

            PrepItemSupply_GiveItemToSupply(proc);
            return;
        }

        if (gpKeySt->pressed & B_BUTTON)
        {
            Proc_Goto(proc, 1);
            PlaySoundEffect(0x38B);
            return;
        }
    }

    if (sub_0809714C(proc) != 0)
    {
        ShowSysHandCursor(16, proc->unitInvIdx * 16 + 72, 0xb, 0x800);
        if (proc->unk_38 == 1)
        {
            item = proc->unit->items[proc->unitInvIdx];
            if (item != 0)
                StartItemHelpBox(16, proc->unitInvIdx * 16 + 72, item);
        }
    }
}
void PrepItemSupply_OnEnd(struct PrepItemSupplyProc * proc)
{
    if (proc->unk_30 == 0)
    {
        struct ProcAtMenu * pAtMenuProc = Proc_Find(ProcScr_AtMenu);
        pAtMenuProc->unk_32 = proc->currentPage;
    }

    sub_080A9D08();
    EndAllProcChildren(proc);
    EndMuralBackground_();

    SetOnHBlankA(NULL);
}
void StartPrepItemSupplyProc(struct Unit * unit, ProcPtr parent)
{
    struct PrepItemSupplyProc * proc = Proc_StartBlocking(ProcScr_PrepItemSupplyScreen, parent);
    proc->unit = unit;
    proc->unk_30 = 0;
}
void sub_08097488(void)
{
    if (gActiveUnit)
    {
        EndAllMus();
        ShowUnitSprite(gActiveUnit);
    }
}
void sub_080974A8(void)
{
    if (gActiveUnit)
    {
        HideUnitSprite(gActiveUnit);
        StartMu(gActiveUnit);
        MU_SetDefaultFacing_Auto();
    }
}
void StartBmSupply(struct Unit * unit, ProcPtr unused)
{
    struct PrepItemSupplyProc * proc = Proc_Start(ProcScr_BmSupplyScreen, PROC_TREE_3);
    proc->unit = unit;
    proc->unk_30 = 1;
}
void MaybeStartSelectConvoyItemProc(struct Unit * unit, ProcPtr unused)
{
    struct PrepItemSupplyProc * proc = Proc_Start(ProcScr_BmSupplyScreen, PROC_TREE_3);
    proc->unit = unit;
    proc->unk_30 = 2;
}
