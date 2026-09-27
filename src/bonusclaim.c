#include "gbafe.h"

extern u16 const * const SpriteArray_08CE45A8[];
extern u16 const * const SpriteArray_08CE45B4[];

extern struct ProcCmd CONST_DATA ProcScr_08CE578C[];

u32 GetGold(void);

void AddGold(s32 amount);
int GetConvoyItemCount(void);
int AddItemToConvoy(int item);
void StartBonusClaimHelpBox(int x, int y, int msg, ProcPtr parent);
void PutUnitSpriteForClassId(int layer, int x, int y, u16 oam2, int class);

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
void BonusClaim_Init(struct BonusClaimProc * proc)
{
    int i;

    InitBgs(NULL);

    ApplyPalettes(Pal_SaveMenuBackground, 0xC, 3);
    Decompress(Img_MuralBackground, (void *) 0x06008000);
    TmApplyTsa(gBg3Tm, Tsa_SaveMenuBackground, 0xC000);
    EnableBgSync(BG3_SYNC_BIT);

    UnpackUiWindowFrameGraphics();
    ResetText();
    InitIcons();
    ApplyIconPalettes(4);
    ApplySystemObjectsGraphics();

    sub_080ACAF8();
    sub_080ACF08();

    SetWinEnable(0, 1, 0);
    SetWin1Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);
    SetWin1Box(0, 56, 240, 136);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg3_ct.priority = 3;

    InitBonusClaimData();

    for (i = 0; i <= 5 && i < *gpBonusClaimItemCount; i++)
    {
        struct Text * th = gpBonusClaimText + i * 2;
        InitText(th, 7);
        th++;
        InitText(th, 10);
        DrawBonusClaimItemText(i);
    }

    for (i = 0; i < 2; i++)
        InitText(gpBonusClaimText + 12 + i, 6);

    InitText(gpBonusClaimText + 14, 15);

    StartParallelWorker(PutChapterBannerSprites, proc);

    EnableBgSync(BG1_SYNC_BIT);

    SetOnHBlankA(sub_080ACB64);

    proc->menuIndex = 0;
    proc->unk_2c = 0;
    proc->unk_2e = 0;
    proc->submenuIndex = 0;
    proc->targets = 2;

    proc->unk_34 = NULL;

    SetBgOffset(2, -64, (proc->unk_2c - 56) & 0xff);

    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);
    {
        int y = proc->menuIndex * 16;
        int t = proc->unk_2c - 56;
        ShowSysHandCursor(64, y - t, 13, 0x800);
    }

    StartGreenText(proc);

    StartMenuScrollBar(proc);
    PutMenuScrollBarAt(176, 68);
    InitMenuScrollBarImg(0x200, 2);
    UpdateMenuScrollBarConfig(7, proc->unk_2c, *gpBonusClaimItemCount, 5);

    StartUiCursorHand(proc);

    SetupBonusClaimTargets(proc);

    LoadHelpBoxGfx((void *) 0x06013800, 5);
}
void BonusClaim_Loop_MainKeyHandler(struct BonusClaimProc * proc)
{
    u16 tmp;
    struct BonusClaimEnt * ent;

    int curIdx = proc->menuIndex;

    if (proc->unk_2e == 0)
    {
        if (gpKeySt->pressed & A_BUTTON)
        {
            int itemIdx = gpBonusClaimItemList[curIdx].unk_00;

            if (((1 << itemIdx) & GetBonusContentClaimFlags()) != 0)
            {
                StartBonusClaimHelpBox(-1, -1, 0x763, proc);
                return;
            }

            if (proc->targets != 0)
            {
                struct BonusClaimEnt * ent2 = gpBonusClaimData;
                ent2 += itemIdx;

                switch (ent2->kind)
                {
                case BONUSKIND_ITEM0:
                case BONUSKIND_ITEM1:
                    Proc_Goto(proc, 1);
                    PlaySoundEffect(0x38A);

                default:
                    return;

                case BONUSKIND_MONEY:
                    if (ent2->itemId == 0x97)
                        AddGold(3000);

                    ent = &gpBonusClaimData[itemIdx];

                    if (ent->itemId == 0x98)
                        AddGold(5000);

                    SetBonusItemClaimed(proc->menuIndex);
                    DrawBonusClaimItemText(proc->menuIndex);

                    Proc_Goto(proc, 2);

                    return;
                }
            }

            PlaySoundEffect(0x38C);

            return;
        }

        if (gpKeySt->pressed & B_BUTTON)
        {
            Proc_Break(proc);
            PlaySoundEffect(0x38B);
            return;
        }

        if (gpKeySt->repeated & DPAD_UP)
            curIdx -= 1;

        if (gpKeySt->repeated & DPAD_DOWN)
            curIdx += 1;

        if (proc->menuIndex != curIdx)
        {
            if (curIdx >= 0)
            {
                if (curIdx >= *gpBonusClaimItemCount)
                    return;

                PlaySoundEffect(0x386);

                proc->menuIndex = curIdx;

                if ((proc->menuIndex * 16 - proc->unk_2c == 0) && (proc->menuIndex != 0))
                {
                    proc->unk_2e = -1;
                    DrawBonusClaimItemText(proc->menuIndex - 1);
                }
                else if ((proc->menuIndex * 16 - proc->unk_2c == 64) && (proc->menuIndex < *gpBonusClaimItemCount - 1))
                {
                    proc->unk_2e = 1;
                    DrawBonusClaimItemText(proc->menuIndex + 1);
                }
                else
                {
                    {
                        int y = proc->menuIndex * 16;
                        int t = proc->unk_2c - 56;
                        ShowSysHandCursor(64, y - t, 13, 0x800);
                    }
                }
            }
            else
            {
                return;
            }
        }

        if (proc->unk_2e == 0)
            return;
    }

    if (proc->unk_2e < 0)
        proc->unk_2c -= 4;

    if (proc->unk_2e > 0)
        proc->unk_2c += 4;

    tmp = (proc->unk_2c);
    tmp &= 0xf;

    if (tmp == 0)
        proc->unk_2e = 0;

    SetBgOffset(2, -64, (proc->unk_2c - 56) & 0xff);

    UpdateMenuScrollBarConfig(7, proc->unk_2c, *gpBonusClaimItemCount, 5);
}
void BonusClaim_DrawTargetUnitSprites(struct BonusClaimProc * proc)
{
    int i;

    for (i = 0; i < proc->targets; i++)
    {
        struct Unit * unit = gpBonusClaimConfig[i].unit;

        if (gpBonusClaimConfig[i].hasInventorySpace != 0)
            PutUnitSpriteForClassId(0, 88, 48 + i * 16, 0xc400, unit->pClassData->number);
        else
            PutUnitSpriteForClassId(0, 88, 48 + i * 16, 0xf400, unit->pClassData->number);
    }

    SyncUnitSpriteSheet();
}
void sub_080AD484(struct BonusClaimProc * proc)
{
    if (proc->unk_34 != NULL)
    {
        Proc_End(proc->unk_34);
        proc->unk_34 = NULL;
    }
}
#if NONMATCHING
// the original counts the loop down in a separate register (i eliminated); here i stays a biv
void BonusClaim_StartSelectTargetSubMenu(struct BonusClaimProc * proc)
{
    int i;

    struct Text * th = gpBonusClaimText + 12;
    u8 sl = proc->targets;
    int tmp = (proc->targets * 2);

    DrawUiFrame2(10, 5, 11, tmp + 2, 1);

    gDispIo.disp_ct.win0_enable = 1;
    gDispIo.disp_ct.win1_enable = 1;
    gDispIo.disp_ct.objwin_enable = 0;

    gDispIo.win_ct.win0_enable_bg0 = 1;
    gDispIo.win_ct.win0_enable_bg1 = 1;
    gDispIo.win_ct.win0_enable_bg2 = 0;
    gDispIo.win_ct.win0_enable_bg3 = 1;
    gDispIo.win_ct.win0_enable_obj = 1;

    gDispIo.win0_left = 80;
    gDispIo.win0_top = 40;
    gDispIo.win0_right = 168;
    gDispIo.win0_bottom = (tmp + 7) * 8;

    {
        int y = proc->menuIndex * 16;
        int t = proc->unk_2c - 56;
        SetUiCursorHandConfig(0, 64, y - t, 1);
    }

    ShowSysHandCursor(88, proc->submenuIndex * 16 + 48, 8, 0x800);

    for (i = 0; i != sl; th++, i++)
    {
        int count;
        int color = 0;
        struct Unit * unit = gpBonusClaimConfig[i].unit;
        u16 * tm = gBg0Tm + 13;

        ClearText(th);
        Text_SetCursor(th, 0);

        if (unit->pCharacterData->number == 0x28)
        {
            count = GetConvoyItemCount();

            if (count == 100)
                color = 1;

            Text_SetParams(th, 0, color);
            Text_DrawString(th, DecodeMsg(0x125A));
        }
        else
        {
            count = GetUnitItemCount(unit);

            if (count == 5)
                color = 1;

            Text_SetParams(th, 0, color);
            Text_DrawString(th, DecodeMsg(unit->pCharacterData->nameTextId));
        }

        if (color == 0)
            gpBonusClaimConfig[i].hasInventorySpace = 1;
        else
            gpBonusClaimConfig[i].hasInventorySpace = 0;

        PutText(th, tm + 0xc0 + 0x40 * i);

        PutNumber(tm + 0xc6 + 0x40 * i, color == 0 ? 2 : 1, count);
    }

    proc->unk_34 = StartParallelWorker(BonusClaim_DrawTargetUnitSprites, proc);
}
#else
ASM_FUNC("asm/nonmatching/code_080AD49C.s");
#endif
bool TryClaimBonusItem(struct BonusClaimProc * proc)
{
    int itemId;

    int tmp = proc->submenuIndex;
    struct BonusClaimConfig * base = gpBonusClaimConfig;
    struct BonusClaimConfig * unk = base - (-tmp);
    struct Unit * unit = unk->unit;
    struct BonusClaimItemEnt * itemEnt = gpBonusClaimItemList + proc->menuIndex;
    int tmp2 = itemEnt->unk_00;

    struct BonusClaimEnt * ent = gpBonusClaimData;
    ent += tmp2;

    itemId = ent->itemId;

    if (unk->hasInventorySpace == 0)
        return FALSE;

    SetBonusItemClaimed(proc->menuIndex);
    DrawBonusClaimItemText(proc->menuIndex);

    if (unit->pCharacterData->number == 0x28)
        AddItemToConvoy(MakeNewItem(itemId));
    else
        UnitAddItem(unit, MakeNewItem(itemId));

    return TRUE;
}

void BonusClaim_Loop_SelectTargetKeyHandler(struct BonusClaimProc * proc)
{
    int tmp = proc->submenuIndex;

    if (gpKeySt->pressed & A_BUTTON)
    {
        if (TryClaimBonusItem(proc))
        {
            Proc_Goto(proc, 2);
            return;
        }

        StartBonusClaimHelpBox(-1, -1, 0x764, proc);
        return;
    }

    if (gpKeySt->pressed & B_BUTTON)
    {
        Proc_Break(proc);
        PlaySoundEffect(0x38B);
        return;
    }

    if (gpKeySt->repeated & DPAD_UP)
        tmp--;

    if (gpKeySt->repeated & DPAD_DOWN)
        tmp++;

    if (((tmp != proc->submenuIndex) && (-1 < tmp)) && (tmp < proc->targets))
    {
        PlaySoundEffect(0x386);
        proc->submenuIndex = tmp;
        ShowSysHandCursor(88, proc->submenuIndex * 16 + 48, 8, 0x800);
    }
}
void BonusClaim_EndSelectTargetSubMenu(struct BonusClaimProc * proc)
{
    sub_080AD484(proc);

    SetWinEnable(0, 1, 0);

    TmFill(gBg1Tm, 0);
    TmFill(gBg0Tm, 0);

    sub_080ACF08();

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    DisableUiCursorHand(0);

    {
        int y = proc->menuIndex * 16;
        int t = proc->unk_2c - 56;
        ShowSysHandCursor(64, y - t, 13, 0x800);
    }
}
#if NONMATCHING
// register allocation around the width computation (orig keeps (len+7)/8 in r4, width in r9)
void BonusClaim_DrawItemSentPopup(struct BonusClaimProc * proc)
{
    const char * itemNameStr;
    const char * otherStr;
    int width;
    int x;
    struct Text * th;
    char buf[32];
    struct BonusClaimEnt * ent;
    struct BonusClaimEnt * ent2;
    int itemId;

    int idx = gpBonusClaimItemList[proc->menuIndex].unk_00;

    ent = gpBonusClaimData;
    ent += idx;
    itemId = ent->itemId;

    th = gpBonusClaimText + 14;

    SetWinEnable(0, 1, 0);

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);

    sub_080ACF08();

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    sub_080AD484(proc);

    WriteGameSave(ReadLastGameSaveId());

    proc->timer = 0;
    DisableUiCursorHand(0);

    {
        int y = proc->menuIndex * 16;
        int t = proc->unk_2c - 56;
        ShowSysHandCursor(64, y - t, 13, 0x800);
    }

    ClearText(th);
    Text_SetParams(th, 0, 0);
    Text_SetCursor(th, 0);

    otherStr = DecodeMsgInBuffer(0x10B3, buf);
    itemNameStr = GetItemNameWithArticle(itemId, FALSE);

    width = ((GetStringTextLen(otherStr) + GetStringTextLen(itemNameStr) + 7) / 8) + 4;
    x = 15 - width / 2;

    Text_DrawString(th, otherStr);
    Text_SetColor(th, 2);
    Text_DrawString(th, itemNameStr);

    PutText(th, gBg0Tm + x + 0x141);

    PutIcon(gBg0Tm + (x + (width + 1)) + 0x13C, GetItemIconId(itemId), 0x4000);

    ent2 = gpBonusClaimData;
    ent2 += idx;
    switch (ent2->kind)
    {
    case 0:
    case 1:
        PlaySoundEffect(0x37A);
        break;

    case 2:
        PlaySoundEffect(0xB9);
        break;
    }

    PutUiWindowFrame(gBg1Tm, x, 10, width, 3, 0, 1);

    SetWinEnable(1, 1, 0);

    SetWin0Layers(1, 1, 0, 1, 0);

    gDispIo.win0_left = x * 8;
    gDispIo.win0_top = 80;
    gDispIo.win0_right = (x + width) * 8;
    gDispIo.win0_bottom = 104;

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    SetBgOffset(0, 0, -4);
}
#else
ASM_FUNC("asm/nonmatching/code_080AD820.s");
#endif
void BonusClaim_Loop_PopupDisplayTimer(struct BonusClaimProc * proc)
{
    proc->timer++;

    if ((proc->timer > 30) && (gpKeySt->pressed & (A_BUTTON | B_BUTTON)))
    {
        Proc_Break(proc);
        return;
    }

    if (proc->timer > 120)
        Proc_Break(proc);
}
void BonusClaim_ClearItemSentPopup(void)
{
    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    sub_080ACF08();
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
    SetWinEnable(0, 1, 0);
    SetBgOffset(0, 0, 0);
}
void BonusClaim_OnEnd(struct BonusClaimProc * proc)
{
    EndGreenText();
    EndAllProcChildren(proc);
    SetOnHBlankA(NULL);
}
void StartBonusClaimScreen(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_08CE578C, parent);
}
