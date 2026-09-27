#include "gbafe.h"
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

ASM_FUNC("asm/nonmatching/code_0808955C.s");
ASM_FUNC("asm/nonmatching/code_0808966C.s");
ASM_FUNC("asm/nonmatching/code_08089714.s");
ASM_FUNC("asm/nonmatching/code_08089794.s");
ASM_FUNC("asm/nonmatching/code_08089B9C.s");
ASM_FUNC("asm/nonmatching/code_08089C00.s");
ASM_FUNC("asm/nonmatching/code_08089CA8.s");
ASM_FUNC("asm/nonmatching/code_08089D50.s");
ASM_FUNC("asm/nonmatching/code_08089DD4.s");
ASM_FUNC("asm/nonmatching/code_08089E70.s");
