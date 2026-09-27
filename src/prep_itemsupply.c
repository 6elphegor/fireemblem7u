#include "gbafe.h"

extern u16 Pal_08405EA4[];
extern u8 Img_08405B4C[];
extern u8 Img_08405CE4[];
extern int CONST_DATA gSupplyTextIndexLookup[];
extern char * CONST_DATA gpPrepItemSupplyStringBuffer;
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

extern u8 Tsa_0840E5D4[];
extern u8 Img_08405754[];

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

    sub_080AACD8(gBg1Tm, Tsa_0840E5D4, 0x5280);

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
ASM_FUNC("asm/nonmatching/code_08096604.s");
ASM_FUNC("asm/nonmatching/code_08096668.s");
ASM_FUNC("asm/nonmatching/code_0809689C.s");
ASM_FUNC("asm/nonmatching/code_08096950.s");
ASM_FUNC("asm/nonmatching/code_080969F4.s");
ASM_FUNC("asm/nonmatching/code_08096A98.s");
ASM_FUNC("asm/nonmatching/code_08096B1C.s");
ASM_FUNC("asm/nonmatching/code_08096BB0.s");
ASM_FUNC("asm/nonmatching/code_08096C54.s");
ASM_FUNC("asm/nonmatching/code_08096C60.s");
ASM_FUNC("asm/nonmatching/code_08096DC0.s");
ASM_FUNC("asm/nonmatching/code_0809714C.s");
ASM_FUNC("asm/nonmatching/code_080971E8.s");
ASM_FUNC("asm/nonmatching/code_08097204.s");
ASM_FUNC("asm/nonmatching/code_08097324.s");
ASM_FUNC("asm/nonmatching/code_08097430.s");
ASM_FUNC("asm/nonmatching/code_0809746C.s");
ASM_FUNC("asm/nonmatching/code_08097488.s");
ASM_FUNC("asm/nonmatching/code_080974A8.s");
ASM_FUNC("asm/nonmatching/code_080974CC.s");
ASM_FUNC("asm/nonmatching/code_080974EC.s");
