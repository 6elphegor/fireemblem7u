#include "gbafe.h"
#include "gbafe/bmcontainer.h"
#include "gbafe/unitlistscreen.h"

void sub_809014C(void)
{
    int i;

    InitUnitStack(gUnknown_0200E158);

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!IsUnitInCurrentRoster(unit))
            continue;

        PushUnit(unit);
    }

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (IsUnitInCurrentRoster(unit))
            continue;

        PushUnit(unit);
    }

    LoadPlayerUnitsFromUnitStack();
}

void sub_80901BC(u8 x, u8 y, u8 width)
{
    int i;

    PutSpriteExt(0xd, x, y, gSpriteArray_08A17B58[0], OAM2_PAL(5));

    for (i = 0; i < width - 1; i++)
        PutSpriteExt(0xd, x + i * 16 + 8, y, gSpriteArray_08A17B58[1], OAM2_PAL(5));

    PutSpriteExt(0xd, x + i * 16 + 8, y, gSpriteArray_08A17B58[2], OAM2_PAL(5));
}

void sub_8090238(u8 key)
{
    int i, j;

    TmFillRect_thm(gBg2Tm + TM_OFFSET(20, 1), 4, 1, 0);
    ClearText(&gUnknown_0200E150);

    for (i = 0; i < 10; i++)
    {
        for (j = 0; j < 9; j++)
        {
            if (gUnitListScreenFields[i][j].sortKey == key)
            {
                if (i == 5 && j != 0)
                {
                    PutIcon(gBg2Tm + TM_OFFSET(20, 1), j + 0x6F, OAM2_PAL(5));
                }
                else
                {
                    Text_SetCursor(&gUnknown_0200E150, 0);
                    Text_SetColor(&gUnknown_0200E150, 0);
                    Text_DrawString(&gUnknown_0200E150, DecodeMsg(gUnitListScreenFields[i][j].labelString));
                    PutText(&gUnknown_0200E150, gBg2Tm + TM_OFFSET(20, 1));
                }

                break;
            }
        }
    }

    EnableBgSync(BG2_SYNC_BIT);
}

void sub_8090324(int itemIconId)
{
    int i;

    for (i = 0; i < 8; i++)
    {
        if (gUnknown_0200F15C[i] == itemIconId)
            return;
    }

    for (i = 0; i < 8; i++)
    {
        if (gUnknown_0200F15C[i] == 0xFF)
        {
            gUnknown_0200F15C[i] = itemIconId;
            return;
        }
    }
}

void sub_8090358(u16 arg_0)
{
    int displayIcons[10];
    int i;
    int j;

    int offset = arg_0 / 16;

    for (i = 0; i < 8; i++)
        displayIcons[i] = 0xFF;

    if (offset > 0)
        offset = offset - 1;

    for (i = 0; i < 8 && i + offset < gUnknown_0200F158; i++)
    {
        if (GetUnitEquippedWeapon(gSortedUnits[offset + i]->unit) != 0)
            displayIcons[i] = GetItemIconId(GetUnitEquippedWeapon(gSortedUnits[offset + i]->unit));
    }

    for (i = 0; i < 8; i++)
    {
        if (gUnknown_0200F15C[i] != 0xFF)
        {
            s8 iconInUse = 0;

            for (j = 0; j < 8; j++)
            {
                if (displayIcons[j] == gUnknown_0200F15C[i])
                    iconInUse = 1;
            }

            if (!iconInUse)
            {
                ClearIcon(gUnknown_0200F15C[i]);
                gUnknown_0200F15C[i] = 0xFF;
            }
        }
    }
}

void sub_08088E80(u8 side, u8 frame, s8 visible)
{
    int tile = (u8)((frame / 8) % 6);

    if (side == 0)
    {
        if (visible)
        {
            gBg2Tm[TM_OFFSET(0, 4)] = TILEREF(0x368, 15) + tile;
            gBg2Tm[TM_OFFSET(0, 5)] = TILEREF(0x36E, 15) + tile;
        }
        else
        {
            gBg2Tm[TM_OFFSET(0, 4)] = 0;
            gBg2Tm[TM_OFFSET(0, 5)] = 0;
        }
    }
    else
    {
        if (visible)
        {
            gBg2Tm[TM_OFFSET(29, 4)] = TILEREF(0x768, 15) + tile;
            gBg2Tm[TM_OFFSET(29, 5)] = TILEREF(0x76E, 15) + tile;
        }
        else
        {
            gBg2Tm[TM_OFFSET(29, 4)] = 0;
            gBg2Tm[TM_OFFSET(29, 5)] = 0;
        }
    }

    EnableBgSync(BG2_SYNC_BIT);
}

void sub_8090418(struct UnitListScreenProc * proc, s8 unk)
{
    int i;
    int unitId;

    if (unk != 0)
        unitId = PrepGetLatestCharId();
    else
        unitId = GetLastStatScreenUnitId();

    for (i = 0; i < gUnknown_0200F158; i++)
    {
        if (unk != 0)
        {
            if (gSortedUnits[i]->unit->pCharacterData->number == unitId)
                goto found;

            continue;
        }
        else
        {
            if (gSortedUnits[i]->unit->index == unitId)
                goto found;

            continue;
        }

    found:
        proc->unk_30 = i;

        if (i == 0)
        {
            proc->unk_2c = 0;
            proc->unk_3e = 0;
            return;
        }

        if (i == gUnknown_0200F158 - 1)
        {
            if (gUnknown_0200F158 < 7)
            {
                proc->unk_2c = i;
                proc->unk_3e = 0;
                return;
            }
            else
            {
                proc->unk_2c = 5;
                proc->unk_3e = (gUnknown_0200F158 - 6) * 16;
                return;
            }
        }

        if (i > proc->unk_3e / 16 && i < proc->unk_3e / 16 + 5)
        {
            proc->unk_2c = i - proc->unk_3e / 16;
            return;
        }

        if (proc->unk_3e > (i - 1) * 16)
        {
            proc->unk_2c = 1;
            proc->unk_3e = (i - 1) * 16;
            return;
        }

        if (proc->unk_3e < (i - 4) * 16)
        {
            proc->unk_2c = 4;
            proc->unk_3e = (i - 4) * 16;
            return;
        }

        return;
    }
}

void sub_8090514(s8 flag)
{
    if (flag != 0)
    {
        SetWinEnable(1, 1, 0);

        SetWin0Box(0, 56, 240, 152);
        SetWin1Box(0, 0, 240, 32);

        SetWin0Layers(1, 1, 1, 1, 1);
        SetWin1Layers(0, 1, 1, 1, 1);
        SetWOutLayers(0, 1, 1, 1, 0);
    }
    else
    {
        SetWinEnable(1, 0, 0);

        SetWin0Box(0, 56, 240, 152);

        SetWin0Layers(1, 1, 1, 1, 1);
        SetWOutLayers(0, 1, 1, 1, 1);
    }
}

void UnitList_StartStatScreen(struct UnitListScreenProc * proc)
{
    EndAllMus();
    Proc_End(proc->pSpriteProc);
    Proc_End(proc->pMuralProc);
    EndGreenText();

    SetWinEnable(0, 0, 0);

    if (proc->mode == UNITLIST_MODE_PREPMENU)
        SetStatScreenExcludedUnitFlags(0x11);
    else
        SetStatScreenExcludedUnitFlags(0x1F);

    StartStatScreen(gSortedUnits[proc->unk_30]->unit, proc);
    gPlaySt.lastUnitSortType = (proc->unk_34 << 7) + proc->unk_32;
    proc->unk_29 = 4;
}

void UnitList_ResetFromStatScreen(struct UnitListScreenProc * proc)
{
    sub_8090D80(proc);
    SetDispEnable(0, 0, 0, 0, 0);
}

void UnitList_ResetDispFromStatScreen(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
}

void UnitListScreenSprites_Init(struct UnitListScreenSpritesProc * proc)
{
    proc->unk_2c = proc->proc_parent;
    proc->unk_3b = 0;
    proc->unk_3c = 0;
    proc->unk_38 = proc->unk_2c->unk_3e;
    proc->unk_3a = 0;
    proc->unk_30 = 0;

    proc->unk_34 = StartMenuScrollBar(proc);
    PutMenuScrollBarAt(224, 64);
    UpdateMenuScrollBarConfig(10, proc->unk_2c->unk_3e, gUnknown_0200F158, 6);
    InitMenuScrollBarImg(0x7200, 1);

    ForceSyncUnitSpriteSheet();
}

void UnitListScreenSprites_Main(struct UnitListScreenSpritesProc * proc)
{
    int i;
    int r7;
    int r8;

    int gUnknown_08205B84[4] =
    {
        0, 1, 2, 1,
    };

    if (proc->unk_2c->unk_34 == 0)
        PutSpriteExt(0xb, 184, gUnknown_08205B84[(proc->unk_3b / 8) % 4] + 7, Sprite_08A17B64, OAM2_PAL(9));
    else
        PutSpriteExt(0xb, 184 + OAM1_VFLIP, gUnknown_08205B84[(proc->unk_3b / 8) % 4] + 7, Sprite_08A17B64, OAM2_PAL(9));

    PutSpriteExt(0xd, 0x20, 8, gSpriteArray_08A17C20[proc->unk_2c->page], OAM2_PAL(9));
    PutSpriteExt(0xd, 0xA0, 0, Sprite_08CC3490, OAM2_PAL(9));

    UpdateMenuScrollBarConfig(10, proc->unk_2c->unk_3e, gUnknown_0200F158, 6);

    if (proc->unk_2c->unk_29 >= 3)
    {
        PutUiHand(
            gUnitListScreenFields[proc->unk_2c->page][proc->unk_2c->unk_2d].xColumn - 2, proc->unk_2c->unk_2c * 16 + 40);
    }
    else
    {
        PutSpriteExt(0xd, 4, proc->unk_2c->unk_2c * 16 + 0x40, Sprite_08A17B6C, OAM2_PAL(9));
    }

    if ((proc->unk_38 != proc->unk_2c->unk_3e) || ((proc->unk_2c->unk_3e % 0x10) != 0))
    {
        gPal[0x19E] = gUnknown_02013460[8];
        EnablePalSync();

        proc->unk_3c = 32;
        proc->unk_38 = proc->unk_2c->unk_3e;

        if (proc->unk_3a == 0)
        {
            sub_8090514(1);
            proc->unk_3a = 1;
        }
    }
    else
    {
        gPal[0x19E] = gUnknown_02013460[(proc->unk_3c / 4) & 0xf];
        EnablePalSync();

        if (proc->unk_3a == 1)
        {
            sub_8090514(0);
            proc->unk_3a = 0;
        }
    }

    SyncUnitSpriteSheet();

    r7 = (proc->unk_38 / 0x10);
    r8 = -((proc->unk_38) % 0x10);

    for (i = 0; i < 6 && i + r7 < gUnknown_0200F158; i++)
    {
        PutUnitSprite(4, 8, 56 + i * 16 + r8, gSortedUnits[i + r7]->unit);
    }

    if ((proc->unk_3a != 0) && ((i + r7) < gUnknown_0200F158))
    {
        PutUnitSprite(4, 8, 56 + i * 16 + r8, gSortedUnits[i + r7]->unit);
    }

    if ((proc->unk_2c->page < proc->unk_2c->unk_2e) && (proc->unk_2c->mode != UNITLIST_MODE_SOLOANIM))
        sub_08088E80(1, proc->unk_30, 1);
    else
        sub_08088E80(1, proc->unk_30, 0);

    if ((proc->unk_2c->page > 1) && (proc->unk_2c->mode != UNITLIST_MODE_SOLOANIM))
        sub_08088E80(0, proc->unk_30, 1);
    else
        sub_08088E80(0, proc->unk_30, 0);

    if ((u8)++proc->unk_30 / 8 > 5)
        proc->unk_30 = 0;

    proc->unk_3b++;
    proc->unk_3c++;
}

void UnitListScreenSprites_Dummy(void)
{
}

void sub_8090B48(struct Unit * unit, struct UnitListScreenProc * proc)
{
    int supporterCount;
    int i;
    int supportCountNow;

    if ((unit->state & US_NOT_DEPLOYED) == 0)
        proc->deployedCount++;

    gSortedUnitsBuf[gUnknown_0200F158].unit = unit;

    BattleGenerateUiStats(unit, -1);

    gSortedUnitsBuf[gUnknown_0200F158].battleAttack = ((gBattleActor.battleAttack + 1) & 0xff) - 1;
    gSortedUnitsBuf[gUnknown_0200F158].battleHitRate = ((gBattleActor.battleHitRate + 1) & 0xff) - 1;
    gSortedUnitsBuf[gUnknown_0200F158].battleAvoidRate = ((gBattleActor.battleAvoidRate + 1) & 0xff) - 1;

    supporterCount = GetUnitSupporterCount(unit);
    supportCountNow = 0;

    for (i = 0; i < supporterCount; i++)
    {
        if (CanUnitSupportNow(unit, i))
            supportCountNow++;
    }

    if (supportCountNow > 3)
    {
        if (proc->unk_2e < ((supportCountNow - 1) / 3) + 6)
            proc->unk_2e = ((supportCountNow - 1) / 3) + 6;
    }

    gSortedUnitsBuf[gUnknown_0200F158].supportCount = supportCountNow;
    gSortedUnits[gUnknown_0200F158] = &gSortedUnitsBuf[gUnknown_0200F158];

    gUnknown_0200F158++;

    UseUnitSprite(GetUnitSMSId(unit));
}

void sub_8090C58(struct UnitListScreenProc * proc)
{
    gUnknown_0200F158 = 0;

    if (proc->mode == UNITLIST_MODE_PREPMENU)
    {
        int i;

        for (i = (gPlaySt.faction) + 1; i < (gPlaySt.faction) + 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (!IsUnitInCurrentRoster(unit))
                continue;

            sub_8090B48(unit, proc);
        }
    }
    else
    {
        int i;

        for (i = gPlaySt.faction + 1; i < gPlaySt.faction + 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (unit->state & US_UNAVAILABLE)
                continue;

            sub_8090B48(unit, proc);
        }
    }
}

void sub_8090D00(struct UnitListScreenProc * proc)
{
    gUnknown_0200F158 = 0;

    if (proc->mode == UNITLIST_MODE_PREPMENU)
    {
        int i;

        for (i = FACTION_BLUE + 1; i < FACTION_BLUE + 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (!IsUnitInCurrentRoster(unit))
                continue;

            sub_8090B48(unit, proc);
        }
    }
    else
    {
        int i;

        for (i = FACTION_BLUE + 1; i < FACTION_BLUE + 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (unit->state & US_UNAVAILABLE)
                continue;

            sub_8090B48(unit, proc);
        }
    }
}

#if NONMATCHING

// only the stack slots of spilled pointers differ

void sub_8090D80(struct UnitListScreenProc * proc)
{
    int i;
    u8 val;

    SetDispEnable(1, 1, 1, 1, 1);

    SetOnVMatch(NULL);
    InitBgs(NULL);
    ResetText();
    ResetTextFont();
    ClearIcons();
    ApplyUnitSpritePalettes();

    CpuFastFill(0, gPal + 0x1B0, 0x20);

    ApplySystemObjectsGraphics();

    StartGreenText(proc);

    proc->deployedCount = 0;
    proc->unk_2e = 6;

    sub_8090D00(proc);

    if ((proc->mode != UNITLIST_MODE_PREPMENU) || (proc->unk_2a == 1))
    {
        val = gPlaySt.lastUnitSortType;

        if (val != 0)
        {
            proc->unk_33 = (val >> 7) & 1;
            proc->unk_34 = proc->unk_33;
            proc->unk_32 = val & 0x7f;
        }

        if ((proc->unk_29 != 4) && (proc->page != 0))
        {
            val = gPlaySt.unk19 / 16;

            if (val != 0)
            {
                if (val > 6)
                    proc->page = 6;
                else
                    proc->page = val;

                proc->pageTarget = proc->page;
            }
        }

        SortUnitList(proc->unk_32, proc->unk_34);
    }

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);

    InitIcons();
    ApplyIconPalettes(4);
    UnpackUiWindowFrameGraphics();

    Decompress(Img_08A1CD68, (void *)0x06014800);
    ApplyPalettes(Pal_0840DCE4, 0x19, 1);

    sub_08090F30();

    PutCompressedTsa(gBg1Tm, gUnknown_08A1C8B4, 0x1000);

    for (i = 0; i < 7; i++)
    {
        InitText(&gUnknown_0200E060[i], 5);
        InitTextDb(&gUnknown_0200E098[i][0], 7);
        InitText(&gUnknown_0200E098[i][1], 7);
        InitText(&gUnknown_0200E098[i][2], 5);
    }

    InitText(&gUnknown_0200E140, 4);
    InitText(&gUnknown_0200E148, 20);
    InitText(&gUnknown_0200E150, 4);

    sub_8090238(proc->unk_32);

    if (proc->unk_29 == 4)
    {
        sub_8090418(proc, 0);
        proc->unk_29 = 0;
    }
    else if (proc->mode == UNITLIST_MODE_PREPMENU)
    {
        sub_8090418(proc, 1);
    }

    proc->unk_3c = 0;
    proc->helpActive = 0;

    ClearText(&gUnknown_0200E140);
    Text_SetCursor(&gUnknown_0200E140, 0);
    Text_SetColor(&gUnknown_0200E140, 0);
    Text_DrawString(&gUnknown_0200E140, DecodeMsg(0x10F2));
    PutText(&gUnknown_0200E140, gBg2Tm + TM_OFFSET(3, 5));

    for (i = 0; i < 20; i++)
        gUnknown_0200F15C[i] = 0xFF;

    for (i = proc->unk_3e / 16; i < (proc->unk_3e / 16) + 6 && i < gUnknown_0200F158; i++)
        sub_0808AD00(proc, i, gBg0Tm, proc->page, 1);

    sub_0808AC90(proc->unk_2e, proc->page, 1);

    SetWinEnable(1, 0, 0);
    SetWin0Box(16, 56, 224, 152);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 1, 1, 1, 1);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    SetBgOffset(3, 0, 0);
    SetBgOffset(2, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(0, 0, (proc->unk_3e - 56) & 0xff);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg3_ct.priority = 3;

    Decompress(gUnknown_0840D224, gBg1Tm + 0x280);
    ApplyPalette(gUnknown_08405B0C, 0xf);

    proc->pSpriteProc = Proc_Start(ProcScr_bmview, proc);

    if (proc->mode == UNITLIST_MODE_PREPMENU && !CheckInLinkArena())
        proc->pMuralProc = StartPrepMuralBackground(NULL, 10);
    else
        proc->pMuralProc = StartMuralBackgroundAlt(NULL, NULL, 10);

    LoadHelpBoxGfx(NULL, -1);
}

#else

ASM_FUNC("asm/nonmatching/code_08089794.s");

#endif

void UnitList_Init(struct UnitListScreenProc * proc)
{
    proc->unk_29 = 0;
    proc->unk_31 = 1;
    proc->unk_2c = 0;
    proc->unk_2d = 0;
    proc->unk_30 = 0;

    if (proc->mode == UNITLIST_MODE_SOLOANIM)
        proc->page = 0;
    else
        proc->page = 1;

    proc->pageTarget = proc->page;

    proc->unk_3e = 0;
    proc->unk_32 = 1;
    proc->unk_2a = 0;
    proc->unk_33 = 1;
    proc->unk_34 = 0;
    proc->unk_35 = 0;

    sub_8090D80(proc);
}

void UnitList_DeployUnit(struct Unit * unit, struct UnitListScreenProc * proc)
{
    int i;

    if (proc->allyCount > proc->deployedCount)
    {
        unit->state &= ~(US_UNSELECTABLE | US_NOT_DEPLOYED);

        RegisterSioPid(unit->pCharacterData->number);

        for (i = proc->unk_3e / 16; i < (proc->unk_3e / 16) + 6 && i < gUnknown_0200F158; i++)
            sub_0808AD00(proc, i, gBg0Tm, proc->page, 1);

        proc->deployedCount++;
        PlaySoundEffect(0x38A);
    }
    else
    {
        PlaySoundEffect(0x38C);
    }
}

void UnitList_UndeployUnit(struct Unit * unit, struct UnitListScreenProc * proc)
{
    int i;

    if (!IsCharacterForceDeployed(unit->pCharacterData->number))
    {
        unit->state |= (US_UNSELECTABLE | US_NOT_DEPLOYED);

        RemoveSioPid(unit->pCharacterData->number);

        for (i = proc->unk_3e / 16; i < (proc->unk_3e / 16) + 6 && i < gUnknown_0200F158; i++)
            sub_0808AD00(proc, i, gBg0Tm, proc->page, 1);

        proc->deployedCount--;
        PlaySoundEffect(0x38B);
    }
    else
    {
        PlaySoundEffect(0x38C);
    }
}

void UnitList_TogglePrepDeployState(struct UnitListScreenProc * proc)
{
    int index = proc->unk_30;
    struct Unit * unit = gSortedUnits[index]->unit;

    if ((unit->state & US_BIT25) != 0)
    {
        StartPrepErrorHelpbox(0, proc->unk_2c * 16 + 56, 0x3B1, proc);
        return;
    }

    if ((unit->state & US_NOT_DEPLOYED) != 0)
    {
        if (CheckInLinkArena() && !sub_08090DB0(unit))
        {
            StartPrepErrorHelpbox(0, proc->unk_2c * 16 + 56, 0x3AD, proc);
            return;
        }

        UnitList_DeployUnit(unit, proc);
        return;
    }

    UnitList_UndeployUnit(unit, proc);
}

void UnitList_ToggleSoloAnimState(struct Unit * unit, int step)
{
    int animState;

    if ((UNIT_CATTRIBUTES(unit) & CA_SUPPLY) != 0)
    {
        PlaySoundEffect(0x38C);
        return;
    }

    animState = (unit->state & (US_SOLOANIM_1 | US_SOLOANIM_2)) >> 14;
    animState = (animState + step + 3) % 3;
    animState = animState << 14;

    unit->state = (unit->state & ~(US_SOLOANIM_1 | US_SOLOANIM_2)) | animState;

    if (animState & (US_SOLOANIM_1 | US_SOLOANIM_2))
    {
        PlaySoundEffect(0x38A);
    }
    else
    {
        PlaySoundEffect(0x38B);
    }
}

void sub_809144C(struct UnitListScreenProc * proc)
{
    if ((gpKeySt->held & L_BUTTON) != 0)
        proc->unk_31 = 2;
    else
        proc->unk_31 = 1;

    if ((gpKeySt->pressed & R_BUTTON) != 0)
    {
        Proc_Goto(proc, 3);
        return;
    }

    if ((gpKeySt->pressed & A_BUTTON) != 0)
    {
        switch (proc->mode)
        {
            case UNITLIST_MODE_PREPMENU:
                UnitList_TogglePrepDeployState(proc);
                break;

            case UNITLIST_MODE_SOLOANIM:
                UnitList_ToggleSoloAnimState(gSortedUnits[proc->unk_30]->unit, 1);
                sub_0808AD00(proc, proc->unk_30, gBg0Tm, proc->page, 0);
                break;

            case UNITLIST_MODE_FIELD:
                SetStatScreenLastUnitId(gSortedUnits[proc->unk_30]->unit->index);
                PlaySoundEffect(0x38A);
                Proc_Break(proc);
                break;
        }

        return;
    }

    if ((gpKeySt->repeated & DPAD_LEFT) != 0)
    {
        if (proc->mode == UNITLIST_MODE_SOLOANIM)
        {
            if ((gpKeySt->pressed & DPAD_LEFT) == 0)
                return;

            UnitList_ToggleSoloAnimState(gSortedUnits[proc->unk_30]->unit, -1);
            sub_0808AD00(proc, proc->unk_30, gBg0Tm, proc->page, 0);
            return;
        }

        if (proc->page < 2)
            return;

        proc->pageTarget--;
        Proc_Goto(proc, 2);
        proc->unk_2d = 0;
        PlaySoundEffect(0x38F);
        return;
    }

    if ((gpKeySt->repeated & DPAD_RIGHT) != 0)
    {
        if (proc->mode == UNITLIST_MODE_SOLOANIM)
        {
            if ((gpKeySt->pressed & DPAD_RIGHT) == 0)
                return;

            UnitList_ToggleSoloAnimState(gSortedUnits[proc->unk_30]->unit, +1);
            sub_0808AD00(proc, proc->unk_30, gBg0Tm, proc->page, 0);
            return;
        }

        if (proc->page < proc->unk_2e)
        {
            proc->pageTarget++;
            proc->unk_2d = 0;
            PlaySoundEffect(0x38F);
            Proc_Goto(proc, 2);
        }

        return;
    }

    if ((gpKeySt->repeated & DPAD_UP) != 0 ||
        ((gpKeySt->held & L_BUTTON) != 0 && (gpKeySt->pressed2 & DPAD_UP) != 0))
    {
        if (proc->unk_30 == 0)
        {
            if ((gpKeySt->pressed & DPAD_UP) == 0)
                return;

            PlaySoundEffect(0x386);
            proc->unk_29 = 3;
            return;
        }

        proc->unk_30--;
        PlaySoundEffect(0x386);

        if (proc->unk_2c < 2)
        {
            if (proc->unk_3e / 16 != 0)
            {
                if (proc->unk_2c == 0)
                {
                    proc->unk_30++;
                    proc->unk_2c = 1;
                }

                sub_0808AD00(proc, proc->unk_3e / 16 - 1, gBg0Tm, proc->page, 1);
                proc->unk_29 = 2;
                proc->unk_3e = -(proc->unk_31 * 4) + proc->unk_3e;
                SetBgOffset(0, 0, (proc->unk_3e - 0x38) & 0xFF);

                if (proc->unk_2c == 0)
                    proc->unk_2c++;

                return;
            }
        }

        proc->unk_2c--;
        return;
    }

    if ((gpKeySt->repeated & DPAD_DOWN) != 0 ||
        ((gpKeySt->held & L_BUTTON) != 0 && (gpKeySt->pressed2 & DPAD_DOWN) != 0))
    {
        if (proc->unk_30 < gUnknown_0200F158 - 1)
        {
            proc->unk_30++;
            PlaySoundEffect(0x386);

            if (proc->unk_2c == 4 && proc->unk_30 != gUnknown_0200F158 - 1)
            {
                sub_0808AD00(proc, 6 + proc->unk_3e / 16, gBg0Tm, proc->page, 1);
                proc->unk_29 = 1;
                proc->unk_3e = proc->unk_3e + proc->unk_31 * 4;
                SetBgOffset(0, 0, (proc->unk_3e - 0x38) & 0xFF);
                return;
            }

            proc->unk_2c++;
        }
    }
}

void sub_0808A214(struct UnitListScreenProc * proc)
{
    int i;
    u8 unk_32;

    if (proc->helpActive != 0 && (gpKeySt->pressed & (B_BUTTON | R_BUTTON)) != 0)
    {
        CloseHelpBox();
        proc->helpActive = 0;
        return;
    }

    if ((gpKeySt->pressed & A_BUTTON) != 0 && proc->helpActive == 0)
    {
        unk_32 = proc->unk_32;

        proc->unk_2a = 1;
        PlaySoundEffect(0x38A);
        proc->unk_32 = gUnitListScreenFields[proc->page][proc->unk_2d].sortKey;
        proc->unk_33 = (proc->unk_33 + 1) & 1;

        if (SortUnitList(proc->unk_32, proc->unk_33))
        {
            for (i = 0; i < 6 && i < gUnknown_0200F158; i++)
                sub_0808AD00(proc, i, gBg0Tm, proc->page, 1);

            sub_8090358(proc->unk_3e);
            EnableBgSync(BG0_SYNC_BIT);
        }

        proc->unk_34 = proc->unk_33;
        proc->unk_35 = proc->unk_2d;

        if (proc->unk_32 != unk_32)
            sub_8090238(proc->unk_32);

        return;
    }

    if (((gpKeySt->repeated & DPAD_DOWN) != 0) && proc->helpActive == 0)
    {
        PlaySoundEffect(0x386);
        proc->unk_33 = 1;
        proc->unk_29 = 0;
        return;
    }

    if ((gpKeySt->repeated & DPAD_LEFT) != 0)
    {
        proc->unk_33 = 1;

        if (proc->unk_2d == 0)
        {
            if (proc->page < 2)
                return;

            if (proc->mode == UNITLIST_MODE_SOLOANIM)
                return;

            PlaySoundEffect(0x38F);
            proc->pageTarget--;

            for (i = 8; i > 0 && gUnitListScreenFields[proc->pageTarget][i].xColumn == 0; i--)
            {
            }

            proc->unk_2d = i;
            Proc_Goto(proc, 2);
            return;
        }

        proc->unk_2d--;
        PlaySoundEffect(0x387);
        return;
    }

    if ((gpKeySt->repeated & DPAD_RIGHT) != 0)
    {
        proc->unk_33 = 1;

        if (proc->unk_2d == 8 || gUnitListScreenFields[proc->page][proc->unk_2d + 1].xColumn == 0)
        {
            if (proc->page < proc->unk_2e)
            {
                if (proc->mode == UNITLIST_MODE_SOLOANIM)
                    return;

                proc->unk_2d = 0;
                PlaySoundEffect(0x38F);

                proc->pageTarget++;
                Proc_Goto(proc, 2);
            }
            return;
        }
        else
        {
            proc->unk_2d++;
            PlaySoundEffect(0x387);
        }

        return;
    }

    if ((gpKeySt->pressed & R_BUTTON) != 0 && proc->helpActive == 0)
    {
        proc->helpActive = 1;

        StartHelpBox(
            gUnitListScreenFields[proc->page][proc->unk_2d].xColumn, 0x28,
            gUnitListScreenFields[proc->page][proc->unk_2d].helpTextId);
    }
}

void sub_0808A508(struct UnitListScreenProc * proc)
{
    int prev = proc->unk_2d;

    switch (proc->unk_29)
    {
        case 0:
            sub_809144C(proc);
            break;

        case 3:
            sub_0808A214(proc);
            break;

        case 1:
            proc->unk_3e += 4 * proc->unk_31;
            SetBgOffset(0, 0, (proc->unk_3e - 56) & 0xFF);

            if ((proc->unk_3e % 0x10) == 0)
            {
                proc->unk_29 = 0;
                sub_8090358(proc->unk_3e);
            }

            break;

        case 2:
            proc->unk_3e += -(4 * proc->unk_31);
            SetBgOffset(0, 0, (proc->unk_3e - 56) & 0xFF);

            if ((proc->unk_3e % 0x10) == 0)
            {
                proc->unk_29 = 0;
                sub_8090358(proc->unk_3e);
            }

            break;
    }

    if (((gpKeySt->pressed & B_BUTTON) != 0) && (proc->helpActive == 0))
    {
        PlaySoundEffect(0x38B);
        SetStatScreenLastUnitId(0);
        Proc_Break(proc);
    }

    if ((proc->helpActive != 0) && (prev != proc->unk_2d))
    {
        StartHelpBox(
            gUnitListScreenFields[proc->pageTarget][proc->unk_2d].xColumn, 40,
            gUnitListScreenFields[proc->pageTarget][proc->unk_2d].helpTextId);
    }
}

void UnitList_OnEnd(struct UnitListScreenProc * proc)
{
    int page;

    if (proc->mode == UNITLIST_MODE_PREPMENU)
    {
        PrepSetLatestCharId(gSortedUnits[proc->unk_30]->unit->pCharacterData->number);
        sub_809014C();
    }

    gPlaySt.lastUnitSortType = (proc->unk_34 << 7) + proc->unk_32;

    page = proc->page;
    if (page != 0)
    {
        page = (proc->page << 4);
        gPlaySt.unk19 &= 0xf;
        gPlaySt.unk19 |= page;
    }

    Proc_End(proc->pSpriteProc);

    if (proc->pMuralProc != NULL)
        Proc_End(proc->pMuralProc);

    EndGreenText();

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    SetWinEnable(0, 0, 0);

    ResetTextFont();
    ClearIcons();
}

void UnitList_StartPageChange(struct UnitListScreenProc * proc)
{
    int i;

    TmFillRect_thm(gUnknown_0200D7E0[0], 31, 31, 0);

    for (i = proc->unk_3e / 16; i < proc->unk_3e / 16 + 6 && i < gUnknown_0200F158; i++)
        sub_0808AD00(proc, i, gUnknown_0200D7E0[0], proc->page, 0);

    TmFillRect_thm(gUnknown_0200DFE0[0], 31, 1, 0);

    UnitList_DrawColumnNames(gUnknown_0200DFE0[0], proc->page);

    proc->unk_3c = 0;
    proc->unk_37 = proc->page;
    proc->unk_38 = 0;
}

void sub_0808A770(struct UnitListScreenProc * proc)
{
    int i;
    int r4;
    u8 r1;

    proc->unk_38 += gUnknown_08A17B30[proc->unk_3c];

    if (proc->unk_38 > 20)
        proc->unk_38 = 20;

    proc->unk_3c++;

    for (i = 0; i < 20; i++)
    {
        if (proc->pageTarget > proc->page)
        {
            if (i + proc->unk_38 > 20)
                r1 = 0;
            else
                r1 = i + proc->unk_38 + 8;
        }
        else
        {
            if (i < proc->unk_38)
                r1 = 0;
            else
                r1 = i - proc->unk_38 + 8;
        }

        for (r4 = proc->unk_3e / 8; r4 < 12 + proc->unk_3e / 8; r4++)
        {
            int off = 8 + (r4 & 0x1F) * 0x20;
            gBg0Tm[off + i] = gUnknown_0200D7E0[r4 & 0x1F][r1];
        }

        for (r4 = 0; r4 < 2; r4++)
        {
            int off = 0xA8 + r4 * 0x20;
            gBg2Tm[off + i] = gUnknown_0200DFE0[r4][r1];
        }
    }

    EnableBgSync(BG0_SYNC_BIT | BG2_SYNC_BIT);

    if (proc->unk_38 < 20)
        return;

    proc->page = proc->pageTarget;

    TmFillRect_thm(gBg2Tm + 0x150 / 2, 0x16, 1, 0);
    TmFillRect_thm(gBg0Tm + 0x10 / 2, 0x16, 0x1F, 0);

    for (r4 = 0; r4 < 20; r4++)
        gUnknown_0200F15C[r4] = 0xFF;

    ClearIcons();
    sub_8090238(proc->unk_32);

    for (r4 = proc->unk_3e / 16; r4 < proc->unk_3e / 16 + 6 && r4 < gUnknown_0200F158; r4++)
        sub_0808AD00(proc, r4, gUnknown_0200D7E0[0], proc->page, 0);

    UnitList_DrawColumnNames(gUnknown_0200DFE0[0], proc->page);
    sub_0808AC90(proc->unk_2e, proc->page, 0);

    proc->unk_38 = 0;
    proc->unk_3c = 0;

    Proc_Break(proc);
}

ASM_FUNC("asm/nonmatching/code_0808A92C.s");

void StartUnitListScreenField(void)
{
    struct UnitListScreenProc * proc = Proc_Start(ProcScr_UnitListScreen_Field, PROC_TREE_3);
    proc->mode = UNITLIST_MODE_FIELD;
}

void StartUnitListScreenPrepMenu(ProcPtr parent)
{
    struct UnitListScreenProc * proc;

    if (parent == NULL)
        proc = Proc_Start(ProcScr_UnitListScreen_PrepMenu, PROC_TREE_3);
    else
        proc = Proc_StartBlocking(ProcScr_UnitListScreen_PrepMenu, parent);

    proc->mode = UNITLIST_MODE_PREPMENU;

    if (CheckInLinkArena() == true)
        proc->allyCount = 5;
    else
        proc->allyCount = GetChapterAllyUnitCount();

    proc->deployedCount = 0;
}

void StartUnitListScreenForSoloAnim(ProcPtr parent)
{
    struct UnitListScreenProc * proc;

    if (parent == NULL)
        proc = Proc_Start(ProcScr_UnitListScreen_SoloAnim, PROC_TREE_3);
    else
        proc = Proc_StartBlocking(ProcScr_UnitListScreen_SoloAnim, parent);

    proc->mode = UNITLIST_MODE_SOLOANIM;
}

void StartUnitListScreenUnk(ProcPtr parent)
{
    struct UnitListScreenProc * proc;

    if (parent == NULL)
        proc = Proc_Start(ProcScr_UnitListScreen_PrepMenu, PROC_TREE_3);
    else
        proc = Proc_StartBlocking(ProcScr_UnitListScreen_PrepMenu, parent);

    proc->mode = 4;
}

void UnitList_DrawColumnNames(u16 * tm, u8 page)
{
    int i;

    TmFillRect_thm(tm + 9, 19, 1, 0);
    ClearText(&gUnknown_0200E148);

    if (page == 5)
    {
        for (i = 0; i < 8; i++)
            PutIcon(tm + 9 + 2 * i, i + 0x70, OAM2_PAL(5));
    }
    else
    {
        for (i = 1; i < 9 && gUnitListScreenFields[page][i].xColumn != 0; i++)
        {
            Text_SetCursor(&gUnknown_0200E148, gUnitListScreenFields[page][i].xColumn - 64);
            Text_SetColor(&gUnknown_0200E148, TEXT_COLOR_SYSTEM_WHITE);
            Text_DrawString(&gUnknown_0200E148, DecodeMsg(gUnitListScreenFields[page][i].labelString));
        }

        PutText(&gUnknown_0200E148, tm + 8);
    }

    EnableBgSync(BG2_SYNC_BIT);
}

void sub_0808AC90(u8 maxPages, u8 page, s8 flag)
{
    if (page != 0)
    {
        PutNumber(gBg2Tm + TM_OFFSET(26, 1), TEXT_COLOR_SYSTEM_BLUE, page);
        PutSpecialChar(gBg2Tm + TM_OFFSET(27, 1), TEXT_COLOR_SYSTEM_WHITE, 0x16);
        PutNumber(gBg2Tm + TM_OFFSET(28, 1), TEXT_COLOR_SYSTEM_BLUE, maxPages);
    }
    else
    {
        TmFillRect_thm(gBg1Tm + TM_OFFSET(25, 0), 6, 3, 0);
        EnableBgSync(BG1_SYNC_BIT);
    }

    if (flag)
        UnitList_DrawColumnNames(gBg2Tm + TM_OFFSET(0, 5), page);

    EnableBgSync(BG2_SYNC_BIT);
}

ASM_FUNC("asm/nonmatching/code_0808AD00.s");

int SortUnitList_GetUnitSoloAnimation(struct Unit * unit)
{
    return unit->state & (US_SOLOANIM_1 | US_SOLOANIM_2);
}

ASM_FUNC("asm/nonmatching/code_0808B5E0.s");
