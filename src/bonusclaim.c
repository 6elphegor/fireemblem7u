#include "gbafe.h"

extern u16 const * const SpriteArray_08CE45A8[];
extern u16 const * const SpriteArray_08CE45B4[];

u32 GetGold(void);

void PutChapterBannerSprites(void)
{
    PutSpriteExt(4, 12, 8, *SpriteArray_08CE45B4, 0x8000);
    PutSpriteExt(4, 24, 16, *SpriteArray_08CE45A8, 0x9000);
}
void sub_080ACAF8(void)
{
    u32 flags = (-(gPlaySt.chapterStateBits & 0x40) >> 0x1f) & 4;

    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_LYN)
        flags |= 0x10;

    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_ELIWOOD)
        flags |= 0x20;

    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_HECTOR)
        flags |= 0x40;

    PutChapterTitlePalette(flags | 1, 0x18);
    PutChapterTitlePalette(flags, 0x19);

    EnablePalSync();

    PutChapterTitleBG(0xAC0);
    PutChapterTitleGfx(0xB40, GetChapterTitle(&gPlaySt));
}
void sub_080ACB64(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > 160)
        vcount = 0;

    if ((vcount & 1) == 0)
    {
        if (vcount < 100)
        {
            REG_BLDCNT = 200;
            *(vu16 *) REG_ADDR_BLDY = ((100 - vcount) * 16) / 100;
        }

        if (vcount == 0)
            REG_BG0VOFS = gDispIo.bg_off[0].y;

        if (vcount == 120)
            REG_BG0VOFS = 4;
    }
}
s8 InitBonusClaimData(void)
{
    int i;
    int count = 0;

    CpuFill16(0, gpBonusClaimItemList, 0x80);
    CpuFill16(0, gpBonusClaimData, 0x284);

    if (LoadBonusContentData(gpBonusClaimData))
    {
        CpuFastCopy(gpBonusClaimData, gpBonusClaimDataUpdated, 0x284);

        for (i = 0; i < 0x20; i++)
        {
            struct BonusClaimEnt * ent = &gpBonusClaimData[i];
            struct BonusClaimEnt * ent2;

            if ((ent->unseen & 3) == 0)
                continue;

            switch (ent->kind)
            {
            case BONUSKIND_ITEM1:
                if (gPlaySt.tact_enabled == 0)
                    continue;

            case BONUSKIND_ITEM0:
            case BONUSKIND_MONEY:
                gpBonusClaimItemList[count].unk_00 = i;

                if (((1 << i) & GetBonusContentClaimFlags()) != 0)
                    gpBonusClaimItemList[count].claimable = 0;
                else
                    gpBonusClaimItemList[count].claimable = 1;

                count++;
                break;
            }

            ent2 = &gpBonusClaimData[i];

            if ((ent2->unseen & 3) == 1)
            {
                struct BonusClaimEnt * ent3 = &gpBonusClaimDataUpdated[i];
                ent3->unseen = (ent3->unseen & 0xFC) + 2;
            }
        }

        *gpBonusClaimItemCount = count;

        SaveBonusContentData(gpBonusClaimDataUpdated);
    }

    if (count == 0)
        return 0;

    return 1;
}
void DrawBonusClaimItemText(int idx)
{
    int unk1;
    s8 claimable;
    int unk3;
    int itemId;
    int color;
    struct BonusClaimEnt * ent;
    struct BonusClaimEnt * ent2;

    struct Text * th = gpBonusClaimText + ((idx % 6) << 1);

    unk1 = idx * 2;
    unk1 &= 0x1f;

    claimable = gpBonusClaimItemList[idx].claimable;
    unk3 = gpBonusClaimItemList[idx].unk_00;

    ent = gpBonusClaimData;
    ent += unk3;

    itemId = ent->itemId;

    color = TEXT_COLOR_SYSTEM_WHITE;

    TmFillRect_thm(gBg2Tm + ((unk1) * 0x20), 0x14, 1, 0);

    ClearText(th);

    if (idx >= 0x20)
        return;

    ent2 = &gpBonusClaimData[unk3];

    if ((ent2->unseen & 3) == 0)
        return;

    if ((ent2->unseen & 3) == 1)
        color = TEXT_COLOR_0DEF;

    if (claimable == 0)
        color = TEXT_COLOR_0456;

    switch (gpBonusClaimData[unk3].kind)
    {
    case BONUSKIND_ITEM0:
    case BONUSKIND_ITEM1:
        PutDrawText(th, gBg2Tm + (unk1 * 0x20) + 2, color, 0, 0, GetItemName(itemId));
        PutNumberOrBlank(gBg2Tm + (unk1 * 0x20) + 0xB, color == 0 ? TEXT_COLOR_0789 : color, GetItemMaxUses(itemId));
        PutIcon(gBg2Tm + (unk1 * 0x20), GetItemIconId(itemId), 0x4000);
        break;

    case BONUSKIND_MONEY:
        PutDrawText(th, gBg2Tm + (unk1 * 0x20) + 2, color, 0, 0, GetItemName(itemId));
        PutIcon(gBg2Tm + (unk1 * 0x20), GetItemIconId(itemId), 0x4000);
        break;
    }

    EnableBgSync(BG2_SYNC_BIT);
}
void SetBonusItemClaimed(int idx)
{
    struct BonusClaimItemEnt * ent = &gpBonusClaimItemList[idx];

    int itemFlag = ent->unk_00;

    SetBonusContentClaimFlags((1 << itemFlag) | GetBonusContentClaimFlags());

    ent->claimable = 0;
}
void SetupBonusClaimTargets(struct BonusClaimProc * proc)
{
    int i, count = 0;
    int lord = 0;

    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_ELIWOOD)
        lord = 1;

    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_HECTOR)
        lord = 2;

    ResetUnitSprites();

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_DEAD | US_BIT16))
            continue;

        if (lord != 0 && unit->pCharacterData->number == lord)
        {
            gpBonusClaimConfig[count].unit = unit;
            count++;
            UseUnitSprite(GetUnitSMSId(unit));
            continue;
        }

        if (unit->pCharacterData->number == 0x28)
        {
            gpBonusClaimConfig[count].unit = unit;
            count++;
            UseUnitSprite(GetUnitSMSId(unit));
        }
    }

    proc->targets = count;

    ApplyUnitSpritePalettes();
    ForceSyncUnitSpriteSheet();
}
void sub_080ACF08(void)
{
    DrawUiFrame2(6, 6, 18, 12, 0);
    DrawUiFrame2(18, 17, 10, 3, 1);

    PutNumber(gBg0Tm + TM_OFFSET(25, 18), TEXT_COLOR_0789, GetGold());
    PutSpecialChar(gBg0Tm + TM_OFFSET(26, 18), TEXT_COLOR_0ABC, 0x1E);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}
ASM_FUNC("asm/nonmatching/code_080ACF5C.s");
ASM_FUNC("asm/nonmatching/code_080AD1AC.s");
ASM_FUNC("asm/nonmatching/code_080AD414.s");
ASM_FUNC("asm/nonmatching/code_080AD484.s");
ASM_FUNC("asm/nonmatching/code_080AD49C.s");
ASM_FUNC("asm/nonmatching/code_080AD660.s");
ASM_FUNC("asm/nonmatching/code_080AD6E4.s");
ASM_FUNC("asm/nonmatching/code_080AD7B4.s");
ASM_FUNC("asm/nonmatching/code_080AD820.s");
ASM_FUNC("asm/nonmatching/code_080ADA58.s");
ASM_FUNC("asm/nonmatching/code_080ADA90.s");
ASM_FUNC("asm/nonmatching/code_080ADADC.s");
ASM_FUNC("asm/nonmatching/code_080ADAF8.s");
