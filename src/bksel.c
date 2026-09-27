#include "gbafe.h"
#include "gbafe/bksel.h"

// Battle forecast (FE8U: bksel.c)

extern const int sBattleForecastLabelStringIndexes[];
extern u8 sBattleForecastPalAnimLut[];
extern s8 sBattleForecastSlideInOffsetLut[];
extern s8 sBattleForecastSlideOutOffsetLut[];
extern u16 sBkselHelpBoxMsgLut[];

extern u16 gUiFramePaletteA[];
extern u16 gUiFramePaletteB[];
extern u16 gUiFramePaletteC[];
extern u16 gUiFramePaletteD[];
extern u8 gTSA_BattleForecastStandard[];
extern u8 gTSA_BattleForecastExtended[];
extern u8 gGfx_BattleForecastFrame[];
extern u8 gBattleForecast_x2x4Gfx[];
extern u16 gBattleForecast_x2x4Pal[];
extern u16 gObject_16x16[];
extern struct ProcCmd CONST_DATA ProcScr_08B90D88[];
extern struct HelpBoxInfo CONST_DATA gHelpInfo_MbpHp;
extern struct HelpBoxInfo CONST_DATA gHelpInfo_CbpHp;

int GetBattleForecastPanelSide(void)
{
    int x;

    x = (gBattleTarget.unit.xPos * 16) - gBmSt.camera.x;

    if (x < 0x70)
        return 1;

    if (x > 0x70)
        return -1;

    return 0;
}

void InitBattleForecastIconPaletteBuffer(void)
{
    int i;
    int j;

    ApplyIconPalette(0, 3);

    for (i = 1; i < 16; ++i)
    {
        int color = gPal[0x30 + i];

        int red = color & 0x1F;
        int green = (color >> 5) & 0x1F;
        int blue = (color >> 10) & 0x1F;

        for (j = 0; j < 8; ++j)
        {
            gBkselPals[j][i] = ((blue << 10) + (green << 5)) + red;

            red += 3;
            if (red > 31)
                red = 31;

            green += 3;
            if (green > 31)
                green = 31;

            blue += 3;
            if (blue > 31)
                blue = 31;
        }
    }
}

void InitBattleForecastLabels(void)
{
    int i;

    for (i = 0; i < 6; ++i)
    {
        int textIndex;

        InitText(gaBattleForecastTextStructs + i, 4);

        textIndex = sBattleForecastLabelStringIndexes[i];

        Text_InsertDrawString(
            gaBattleForecastTextStructs + i,
            GetStringTextCenteredPos(0x20, DecodeMsg(textIndex)),
            3,
            DecodeMsg(textIndex));
    }
}

void PutBattleForecastUnitName(u16 * dest, struct Text * text, struct Unit * unit)
{
    char * str = DecodeMsg(unit->pCharacterData->nameTextId);
    int position = GetStringTextCenteredPos(48, str);

    ClearText(text);
    PutDrawText(text, dest, 0, position, 0, str);
}

void PutBattleForecastItemName(u16 * dest, struct Text * text, int item)
{
    char * str = GetItemName(item);
    int position = GetStringTextCenteredPos(56, str);

    ClearText(text);
    PutDrawText(text, dest, 0, position, 0, str);
}

void BattleForecastHitCountUpdate(struct BattleUnit * bu, u8 * hitsCounter, int * usesCounter)
{
    if (*usesCounter > 0)
    {
        *hitsCounter = *hitsCounter + 1;
        *usesCounter = *usesCounter - 1;

        if (bu->weaponAttributes & IA_BRAVE)
        {
            *hitsCounter = *hitsCounter + 1;
            *usesCounter = *usesCounter - 1;
        }
    }
}

void InitBattleForecastBattleStats(struct BattleForecastProc * proc)
{
    struct BattleUnit * buFirst;
    struct BattleUnit * buSecond;

    int usesA = GetItemUses(gBattleActor.weaponBefore);
    int usesB = GetItemUses(gBattleTarget.weaponBefore);

    s8 followUp = BattleGetFollowUpOrder(&buFirst, &buSecond);

    proc->hitCountA = 0;
    proc->isEffectiveA = 0;

    if ((gBattleActor.weapon != 0) || (gBattleActor.weaponBroke))
    {
        BattleForecastHitCountUpdate(&gBattleActor, &proc->hitCountA, &usesA);

        if ((followUp != 0) && (buFirst == &gBattleActor))
            BattleForecastHitCountUpdate(buFirst, &proc->hitCountA, &usesA);

        if (IsItemEffectiveAgainst(gBattleActor.weaponBefore, &gBattleTarget.unit) != 0)
            proc->isEffectiveA = 1;

        if ((gBattleActor.wTriangleHitBonus > 0) && (gBattleActor.weaponAttributes & IA_REVERTTRIANGLE) != 0)
            proc->isEffectiveA = 1;
    }

    proc->hitCountB = 0;
    proc->isEffectiveB = 0;

    if ((gBattleTarget.weapon != 0) || (gBattleTarget.weaponBroke))
    {
        BattleForecastHitCountUpdate(&gBattleTarget, &proc->hitCountB, &usesB);

        if ((followUp != 0) && (buFirst == &gBattleTarget))
            BattleForecastHitCountUpdate(buFirst, &proc->hitCountB, &usesB);

        if (IsItemEffectiveAgainst(gBattleTarget.weaponBefore, &gBattleActor.unit) != 0)
            proc->isEffectiveB = 1;

        if ((gBattleTarget.wTriangleHitBonus > 0) && (gBattleTarget.weaponAttributes & IA_REVERTTRIANGLE) != 0)
            proc->isEffectiveB = 1;
    }
}

void DrawBattleForecastContentsStandard(struct BattleForecastProc * proc)
{
    int damage;

    TmApplyTsa_thm(gUiTmScratchB, gTSA_BattleForecastStandard, 0x1200);

    TmFillRect_thm(gUiTmScratchA, 10, 15, 0);

    PutBattleForecastUnitName(gUiTmScratchA + 0x23, &proc->unitNameTextA, &gBattleActor.unit);
    PutBattleForecastUnitName(gUiTmScratchA + 0x161, &proc->unitNameTextA, &gBattleTarget.unit);

    PutBattleForecastItemName(gUiTmScratchA + 0x1A1, &proc->itemNameText, gBattleTarget.weaponBefore);

    if ((gBattleTarget.weapon == 0) && (gBattleTarget.weaponBroke == 0))
    {
        damage = -1;

        gBattleTarget.battleEffectiveHitRate = 0xFF;
        gBattleTarget.battleEffectiveCritRate = 0xFF;
    }
    else
    {
        damage = gBattleTarget.battleAttack - gBattleActor.battleDefense;

        if (damage < 0)
            damage = 0;
    }

    if (gBattleTarget.hpInitial > 99)
        PutNumberTwoChr(gUiTmScratchA + 0x62, 2, 0xFF);
    else
        PutNumberTwoChr(gUiTmScratchA + 0x62, 2, gBattleTarget.hpInitial);

    PutNumberTwoChr(gUiTmScratchA + 0xA2, 2, damage);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0x40, 2, gBattleTarget.battleEffectiveHitRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0x80, 2, gBattleTarget.battleEffectiveCritRate);

    damage = gBattleActor.battleAttack - gBattleTarget.battleDefense;

    if (damage < 0)
        damage = 0;

    if (gBattleActor.hpInitial > 99)
        PutNumberTwoChr(gUiTmScratchA + 0xA8 - 0x40, 2, 0xFF);
    else
        PutNumberTwoChr(gUiTmScratchA + 0xA8 - 0x40, 2, gBattleActor.hpInitial);

    PutNumberTwoChr(gUiTmScratchA + 0xA8, 2, damage);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0x40, 2, gBattleActor.battleEffectiveHitRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0x80, 2, gBattleActor.battleEffectiveCritRate);

    PutTwoSpecialChar(gUiTmScratchA + 0xA8 - 0x44, TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_HP_A, TEXT_SPECIAL_HP_B);

    PutText(gaBattleForecastTextStructs, gUiTmScratchA + 0xA8 - 5);
    PutText(gaBattleForecastTextStructs + 1, gUiTmScratchA + 0xA8 + 0x3B);
    PutText(gaBattleForecastTextStructs + 2, gUiTmScratchA + 0xA8 + 0x7B);

    PutIcon(gUiTmScratchA + 0xA8 + 0xBF, GetItemIconId(gBattleTarget.weaponBefore), 0x4000);
    PutIcon(gUiTmScratchA + 0xA8 - 0x87, GetItemIconId(gBattleActor.weaponBefore), 0x3000);
}

void DrawBattleForecastContentsExtended(struct BattleForecastProc * proc)
{
    TmApplyTsa_thm(gUiTmScratchB, gTSA_BattleForecastExtended, 0x1200);

    TmFillRect_thm(gUiTmScratchA, 10, 19, 0);

    PutBattleForecastUnitName(gUiTmScratchA + 0x23, &proc->unitNameTextA, &gBattleActor.unit);
    PutBattleForecastUnitName(gUiTmScratchA + 0x1E1, &proc->unitNameTextA, &gBattleTarget.unit);

    PutBattleForecastItemName(gUiTmScratchA + 0x221, &proc->itemNameText, gBattleTarget.weaponBefore);

    if (gBattleTarget.weapon == 0)
    {
        gBattleTarget.battleAttack = 0xFF;
        gBattleTarget.battleEffectiveHitRate = 0xFF;
        gBattleTarget.battleEffectiveCritRate = 0xFF;
    }

    if (gBattleTarget.hpInitial > 99)
        PutNumberTwoChr(gUiTmScratchA + 0x62, 2, 0xFF);
    else
        PutNumberTwoChr(gUiTmScratchA + 0x62, 2, gBattleTarget.hpInitial);

    PutNumberTwoChr(gUiTmScratchA + 0xA2, 2, gBattleTarget.battleAttack);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0x40, 2, gBattleTarget.battleDefense);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0x80, 2, gBattleTarget.battleEffectiveHitRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0xC0, 2, gBattleTarget.battleEffectiveCritRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA2 + 0x100, 2, gBattleTarget.battleSpeed);

    if (gBattleActor.hpInitial > 99)
        PutNumberTwoChr(gUiTmScratchA + 0xA2 - 0x3A, 2, 0xFF);
    else
        PutNumberTwoChr(gUiTmScratchA + 0xA2 - 0x3A, 2, gBattleActor.hpInitial);

    PutNumberTwoChr(gUiTmScratchA + 0xA8, 2, gBattleActor.battleAttack);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0x40, 2, gBattleActor.battleDefense);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0x80, 2, gBattleActor.battleEffectiveHitRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0xC0, 2, gBattleActor.battleEffectiveCritRate);
    PutNumberTwoChr(gUiTmScratchA + 0xA8 + 0x100, 2, gBattleActor.battleSpeed);

    PutTwoSpecialChar(gUiTmScratchA + 0xA8 - 0x44, TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_HP_A, TEXT_SPECIAL_HP_B);

    PutText(gaBattleForecastTextStructs + 3, gUiTmScratchA + 0xA8 - 5);
    PutText(gaBattleForecastTextStructs + 4, gUiTmScratchA + 0xA8 + 0x3B);
    PutText(gaBattleForecastTextStructs + 1, gUiTmScratchA + 0xA8 + 0x7B);
    PutText(gaBattleForecastTextStructs + 2, gUiTmScratchA + 0xA8 + 0xBB);
    PutText(gaBattleForecastTextStructs + 5, gUiTmScratchA + 0xA8 + 0xFB);

    PutIcon(gUiTmScratchA + 0xA8 + 0x13F, GetItemIconId(gBattleTarget.weaponBefore), 0x4000);
    PutIcon(gUiTmScratchA + 0xA8 - 0x87, GetItemIconId(gBattleActor.weaponBefore), 0x3000);
}

void DrawBattleForecastContents(struct BattleForecastProc * proc)
{
    proc->unk_2C = 0;
    proc->needContentUpdate = 0;

    switch (proc->frameKind)
    {
    case 1:
        InitBattleForecastBattleStats(proc);
        DrawBattleForecastContentsStandard(proc);
        break;

    case 2:
        InitBattleForecastBattleStats(proc);
        DrawBattleForecastContentsExtended(proc);
        break;
    }
}

const u16 * GetFactionBattleForecastFramePalette(int faction)
{
    switch (faction)
    {
    case FACTION_BLUE:
        return gUiFramePaletteA;

    case FACTION_RED:
        return gUiFramePaletteB;

    case FACTION_GREEN:
        return gUiFramePaletteC;

    case FACTION_PURPLE:
        return gUiFramePaletteD;
    }
}

void InitBattleForecastFramePalettes(void)
{
    ApplyPalette(GetFactionBattleForecastFramePalette(UNIT_FACTION(&gBattleActor.unit)), 1);

    if (gBattleTarget.unit.index != 0)
        ApplyPalette(GetFactionBattleForecastFramePalette(UNIT_FACTION(&gBattleTarget.unit)), 2);
    else
        ApplyPalette(GetFactionBattleForecastFramePalette(FACTION_PURPLE), 2);
}

void BattleForecast_Init(struct BattleForecastProc * proc)
{
    Decompress(gGfx_BattleForecastFrame, (void *) 0x06004000);
    Decompress(gBattleForecast_x2x4Gfx, gBuf);
    Copy2dChr(gBuf, (void *) 0x06015D00, 4, 2);
    ApplyPalette(gBattleForecast_x2x4Pal, 0x12);

    ResetTextFont();

    InitIcons();

    InitBattleForecastIconPaletteBuffer();

    InitBattleForecastLabels();

    InitTextDb(&proc->unitNameTextA, 6);
    InitTextDb(&proc->unitNameTextB, 6);
    InitTextDb(&proc->itemNameText, 7);

    SetBgOffset(1, 0, -1);

    proc->ready = 1;
}

void BattleForecast_OnEnd(void)
{
    UnpackUiWindowFrameGraphics2(-1);
}

void PutBattleForecastTilemaps(struct BattleForecastProc * proc)
{
    int height = proc->frameKind == 1 ? 16 : 20;

    if (proc->side < 0)
    {
        TmCopyRect_thm(gUiTmScratchA, gBg0Tm, 10, height);
        TmCopyRect_thm(gUiTmScratchB, gBg1Tm, 10, height);
    }
    else
    {
        TmCopyRect_thm(gUiTmScratchA, gBg0Tm + 20, 10, height);
        TmCopyRect_thm(gUiTmScratchB, gBg1Tm + 20, 10, height);
    }

    EnableBgSync(3);
}

void PutBattleForecastWeaponTriangleArrows(struct BattleForecastProc * proc)
{
    int wtArrowA = 0;
    int wtArrowB = 0;

    if (gBattleActor.wTriangleHitBonus > 0)
        wtArrowA = 1;

    if (gBattleActor.wTriangleHitBonus < 0)
        wtArrowA = 2;

    if (gBattleTarget.wTriangleHitBonus > 0)
        wtArrowB = 1;

    if (gBattleTarget.wTriangleHitBonus < 0)
        wtArrowB = 2;

    if (wtArrowB != 0)
        PutSysArrow((proc->x + 8) * 8 + 3, (proc->y + 11) * 8, wtArrowB == 2 ? 1 : 0);

    if (wtArrowA != 0)
        PutSysArrow((proc->x + 2) * 8 + 3, (proc->y + 1) * 8, wtArrowA == 2 ? 1 : 0);
}

void PutBattleForecastMultipliers(struct BattleForecastProc * proc)
{
    int angle = (proc->unk_2C * 4) & 0xFF;

    int x = SIN_Q12(angle) * 4 >> 12;
    int y = COS_Q12(angle) * 2 >> 12;

    x += proc->x * 8 - 3;
    y += proc->y * 8;

    if (proc->hitCountA > 1)
        PutSprite(4, x + 72, y + 40, gObject_16x16, proc->hitCountA + 0x22E6);

    if (proc->hitCountB > 1)
        PutSprite(4, x + 24, y + 40, gObject_16x16, proc->hitCountB + 0x22E6);
}

void UpdateBattleForecastEffectivenessPalettes(struct BattleForecastProc * proc)
{
    int palAnim;

    if (proc->isEffectiveA != 0)
        palAnim = sBattleForecastPalAnimLut[proc->unk_2C & 0x1F];
    else
        palAnim = 0;

    ApplyPalette(gBkselPals[palAnim], 3);

    if (proc->isEffectiveB != 0)
        palAnim = sBattleForecastPalAnimLut[proc->unk_2C & 0x1F];
    else
        palAnim = 0;

    ApplyPalette(gBkselPals[palAnim], 4);
}

void BattleForecast_LoopDisplay(struct BattleForecastProc * proc)
{
    proc->unk_2C++;

    if (proc->needContentUpdate)
    {
        int side = GetBattleForecastPanelSide();

        if ((side != 0) && (side != proc->side))
        {
            Proc_Break(proc);
            return;
        }

        DrawBattleForecastContents(proc);
        PutBattleForecastTilemaps(proc);
        InitBattleForecastFramePalettes();
    }

    if (proc->frameKind == 1)
    {
        PutBattleForecastWeaponTriangleArrows(proc);
        PutBattleForecastMultipliers(proc);
        UpdateBattleForecastEffectivenessPalettes(proc);
    }
}

void BattleForecast_OnNewBattle(struct BattleForecastProc * proc)
{
    DrawBattleForecastContents(proc);

    proc->side = GetBattleForecastPanelSide();
    proc->slide_offset = 0;

    if (proc->side < 0)
        proc->x = 0;
    else
        proc->x = 20;

    proc->y = 0;

    InitBattleForecastFramePalettes();
}

void BattleForecast_LoopSlideIn(struct BattleForecastProc * proc)
{
    int offset;

    int height = proc->frameKind == 1 ? 16 : 20;

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);

    EnableBgSync(3);

    offset = sBattleForecastSlideInOffsetLut[proc->slide_offset];

    if (proc->side < 0)
    {
        TmCopyRect_thm(gUiTmScratchA + (10 - offset), gBg0Tm, offset, height);
        TmCopyRect_thm(gUiTmScratchB + (10 - offset), gBg1Tm, offset, height);
    }
    else
    {
        TmCopyRect_thm(gUiTmScratchA, gBg0Tm + (30 - offset), offset, height);
        TmCopyRect_thm(gUiTmScratchB, gBg1Tm + (30 - offset), offset, height);
    }

    proc->slide_offset++;

    if ((u8) proc->slide_offset == 4)
    {
        proc->slide_offset = 0;
        Proc_Break(proc);
    }
}

void BattleForecast_LoopSlideOut(struct BattleForecastProc * proc)
{
    int offset;

    int height = proc->frameKind == 1 ? 16 : 20;

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);

    EnableBgSync(3);

    offset = sBattleForecastSlideOutOffsetLut[proc->slide_offset];

    if (proc->side < 0)
    {
        TmCopyRect_thm(gUiTmScratchA + (10 - offset), gBg0Tm, offset, height);
        TmCopyRect_thm(gUiTmScratchB + (10 - offset), gBg1Tm, offset, height);
    }
    else
    {
        TmCopyRect_thm(gUiTmScratchA, gBg0Tm + (30 - offset), offset, height);
        TmCopyRect_thm(gUiTmScratchB, gBg1Tm + (30 - offset), offset, height);
    }

    proc->slide_offset++;

    if ((u8) proc->slide_offset == 4)
    {
        proc->slide_offset = 0;
        Proc_Break(proc);
    }
}

bool Bksel_WaitMapEventEngine(void)
{
    if (Proc_Find(ProcScr_08B90D88))
        return TRUE;

    return FALSE;
}

void NewBattleForecast(ProcPtr unused)
{
    struct BattleForecastProc * proc;

    if (gPlaySt.cfgBattleForecastType == 2)
    {
        ResetTextFont();
        return;
    }

    proc = Proc_Start(gProcScr_BKSEL, PROC_TREE_3);
    proc->ready = 0;

    switch (gPlaySt.cfgBattleForecastType)
    {
    case 0:
        proc->frameKind = 1;
        break;

    case 1:
        proc->frameKind = 2;
        break;
    }

    BmMapFillg(gBmMapMovement, -1);
}

void UpdateBattleForecastContents(void)
{
    struct BattleForecastProc * proc = Proc_Find(gProcScr_BKSEL);

    if (proc == NULL)
        return;

    if (proc->ready != 0)
        proc->needContentUpdate = 1;
}

void CloseBattleForecast(void)
{
    struct BattleForecastProc * proc = Proc_Find(gProcScr_BKSEL);

    if (proc == NULL)
        return;

    if (proc->ready == 0)
    {
        ClearUi();
        Proc_End(proc);
        return;
    }

    Proc_Goto(proc, 1);
}

u8 StartBattleForecastHelpBox(ProcPtr parent, void * target)
{
    int x;

    struct BattleForecastProc * proc = Proc_Find(gProcScr_BKSEL);
    if (proc == NULL)
        return 0;

    if (proc->needContentUpdate != 0)
        return 0;

    if (proc->side < 0)
        x = 0;
    else
        x = 20;

    LoadHelpBoxGfx(NULL, -1);

    switch (proc->frameKind)
    {
    case 1:
        StartMovingHelpBoxExt(&gHelpInfo_MbpHp, parent, x, 0);
        break;

    case 2:
        StartMovingHelpBoxExt(&gHelpInfo_CbpHp, parent, x, 0);
        break;
    }

    return 0;
}

u16 GetBkselHelpBoxMsg(int wt, s8 isEffective)
{
    int idx = isEffective != 0 ? 3 : 0;

    if (wt < 0)
        idx += 2;

    if (wt > 0)
        idx += 1;

    return sBkselHelpBoxMsgLut[idx];
}

void HbPopulate_BkselWTriEffA(struct HelpBoxProc * proc)
{
    struct BattleForecastProc * proc2 = Proc_Find(gProcScr_BKSEL);
    proc->msg = GetBkselHelpBoxMsg(gBattleActor.wTriangleHitBonus, proc2->isEffectiveA);
}

void HbPopulate_BkselWTriEffB(struct HelpBoxProc * proc)
{
    struct BattleForecastProc * proc2 = Proc_Find(gProcScr_BKSEL);
    proc->msg = GetBkselHelpBoxMsg(gBattleTarget.wTriangleHitBonus, proc2->isEffectiveB);
}
