#include "gbafe.h"
#include "gbafe/unitinfowindow.h"

// Unit info windows used by map target selection (FE8U: unitinfowindow.c)

void sub_080263A0(int layer, int x, int y, int oam2, struct Unit * unit);

extern u8 CONST_DATA Tsa_UnitInfoWindowHeader[];

extern struct UnitInfoWindowProc * sRescueUnitInfoWindows[2];
extern u16 CONST_DATA gUnitInfoWindowFactionPalLut[3];

void * memcpy(void * dst, const void * src, unsigned long size);

CONST_DATA struct ProcCmd ProcScr_UnitInfoWindow[] = {
    PROC_REPEAT(UnitInfoWindow_OnLoop),
    PROC_END,
};

void UnitInfoWindow_OnLoop(struct UnitInfoWindowProc * proc)
{
    u16 factionPalLut[3];

    int x, y;

    memcpy(factionPalLut, gUnitInfoWindowFactionPalLut, sizeof(factionPalLut));

    x = proc->x * 8 + proc->xUnitSprite;
    y = (proc->y + 1) * 8;

    if (proc->unit->state & US_RESCUED)
    {
        if ((GetGameTime() % 32) < 20)
        {
            PutSprite(
                2,
                x + 9,
                y + 7,
                Sprite_8x8,
                (factionPalLut[proc->unit->rescue >> 6] & 0xf) * 0x1000 + 3);
        }
    }
    else
    {
        sub_080263A0(2, x, y, 0, proc->unit);
    }

    return;
}

struct UnitInfoWindowProc * NewUnitInfoWindow(ProcPtr parent)
{
    struct UnitInfoWindowProc * proc = Proc_Start(ProcScr_UnitInfoWindow, parent);

    InitTextDb(&proc->name, 6);

    ClearIcons();
    ApplyIconPalettes(4);

    return proc;
}

void UnitInfoWindow_PositionUnitName(struct UnitInfoWindowProc * proc)
{
    if (GetStringTextLen(DecodeMsg(proc->unit->pCharacterData->nameTextId)) < 40)
    {
        proc->xUnitSprite = 4;
        proc->xNameText = 24;
    }
    else
    {
        proc->xUnitSprite = 0;
        proc->xNameText = 16;
    }

    proc->xUnitSprite += 8;
    proc->xNameText -= 16;

    return;
}

struct UnitInfoWindowProc * UnitInfoWindow_DrawBase(struct UnitInfoWindowProc * proc, struct Unit * unit, int x, int y, int width, int lines)
{
    if (proc == 0)
    {
        proc = Proc_Find(ProcScr_UnitInfoWindow);
        ClearUi();
    }

    proc->unit = unit;
    proc->x = x;
    proc->y = y;

    DrawUiFrame2(x, y + 2, width, 2 + lines * 2, 0);

    TmApplyTsa_thm(gBg1Tm + TM_OFFSET(x, y), Tsa_UnitInfoWindowHeader, 0x1000);

    if (width > 10)
    {
        int ix;

        for (ix = x + 10; ix < x + width - 1; ix++)
            gBg1Tm[TM_OFFSET(ix, y + 2)] = 0x100B;

        gBg1Tm[TM_OFFSET(x + 9, y + 2)] = 0x1026;
        gBg1Tm[TM_OFFSET(x + width - 1, y + 2)] = 0x100C;
    }

    ClearText(&proc->name);

    UnitInfoWindow_PositionUnitName(proc);

    Text_SetCursor(&proc->name, proc->xNameText);
    Text_DrawString(&proc->name, DecodeMsg(unit->pCharacterData->nameTextId));

    PutText(&proc->name, gBg0Tm + TM_OFFSET(x + 3, y + 1));

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return proc;
}

int GetUnitInfoWindowX(struct Unit * unit, int width)
{
    if (unit->xPos * 16 - gBmSt.camera.x < DISPLAY_WIDTH / 2)
        return 30 - width;

    return 0;
}

void DrawUnitHpText(struct Text * text, struct Unit * unit)
{
    ClearText(text);

    Text_InsertDrawString(text, 0, 3, DecodeMsg(0x10F4));
    Text_InsertDrawString(text, 40, 3, DecodeMsg(0x12B0));

    Text_InsertDrawNumberOrBlank(text, 32, 2, GetUnitCurrentHp(unit));
    Text_InsertDrawNumberOrBlank(text, 56, 2, GetUnitMaxHp(unit));

    return;
}

void DrawUnitConText(struct Text * text, struct Unit * unit)
{
    ClearText(text);

    Text_InsertDrawString(text, 0, 3, DecodeMsg(0x1107));
    Text_InsertDrawNumberOrBlank(text, 56, 2, UNIT_CON(unit));

    return;
}

void DrawUnitAidText(struct Text * text, struct Unit * unit)
{
    ClearText(text);

    Text_InsertDrawString(text, 0, 3, DecodeMsg(0x1108));
    Text_InsertDrawNumberOrBlank(text, 56, 2, GetUnitAid(unit));

    return;
}

void PutUnitAidIconForTextAt(struct Unit * unit, int x, int y)
{
    PutIcon(
        gBg0Tm + TM_OFFSET(x + 4, y),
        GetUnitAidIconId(UNIT_CATTRIBUTES(unit)),
        0x5000);
    return;
}

void DrawUnitStatusText(struct Text * text, struct Unit * unit)
{
    ClearText(text);

    Text_InsertDrawString(text, 0, 3, DecodeMsg(0x110A));
    Text_InsertDrawString(text, 32, 2, GetUnitStatusName(unit));

    return;
}

void DrawUnitResChangeText(struct Text * text, struct Unit * unit, int bonus)
{
    ClearText(text);

    Text_InsertDrawString(text, 0, 3, DecodeMsg(0x10FF));
    Text_InsertDrawString(text, 40, 3, DecodeMsg(0x12B1));

    Text_InsertDrawNumberOrBlank(text, 56, 2, GetUnitResistance(unit) + bonus);
    Text_InsertDrawNumberOrBlank(text, 32, 2, GetUnitResistance(unit));

    return;
}

void DrawUnitResUnkText(struct Text * text, struct Unit * unit, int unused)
{
    ClearText(text);

    Text_InsertDrawString(text, 0, 3, DecodeMsg(0x10FF));
    Text_InsertDrawNumberOrBlank(text, 56, 2, GetUnitResistance(unit));

    return;
}

void DrawAccuracyText(struct Text * text, int accuracy)
{
    ClearText(text);

    Text_InsertDrawString(text, 0, 3, DecodeMsg(0x1104));
    Text_InsertDrawNumberOrBlank(text, 56, 2, accuracy);

    return;
}

void StartUnitInventoryInfoWindow(ProcPtr parent)
{
    int i;

    struct UnitInfoWindowProc * proc = NewUnitInfoWindow(parent);

    for (i = 0; i < UNITINFOWINDOW_LINES_MAX; i++)
        InitTextDb(proc->lines + i, 7);

    return;
}

void RefreshUnitInventoryInfoWindow(struct Unit * unit)
{
    int i;
    int xPos;
    int itemCount;

    struct UnitInfoWindowProc * proc;

    itemCount = GetUnitItemCount(unit);

    xPos = GetUnitInfoWindowX(unit, 0xd);

    proc = UnitInfoWindow_DrawBase(0, unit, xPos, 0, 0xd, itemCount != 0 ? itemCount : 1);

    if (itemCount == 0)
    {
        int offset;

        ClearText(proc->lines + 0);
        Text_InsertDrawString(proc->lines + 0, 0, 1, DecodeMsg(0x126D));

        offset = TM_OFFSET(xPos + 3, 0 + 3);
        PutText(proc->lines + 0, gBg0Tm + offset);

        return;
    }

    for (i = 0; i < itemCount; i++)
    {
        int yPos = 0 + i * 2 + 3;

        int item = unit->items[i];

        ClearText(proc->lines + i);
        Text_DrawString(proc->lines + i, GetItemName(item));

        PutText(proc->lines + i, gBg0Tm + TM_OFFSET(xPos + 3, yPos));
        PutNumberOrBlank(gBg0Tm + TM_OFFSET(xPos + 11, yPos), 2, GetItemUses(item));
        PutIcon(gBg0Tm + TM_OFFSET(xPos + 1, yPos), GetItemIconId(item), 0x4000);
    }

    return;
}

void RefreshUnitStealInventoryInfoWindow(struct Unit * unit)
{
    int i;
    int itemCount;
    int xPos;
    struct UnitInfoWindowProc * proc;

    itemCount = GetUnitItemCount(unit);

    xPos = GetUnitInfoWindowX(unit, 0xd);

    proc = UnitInfoWindow_DrawBase(0, unit, xPos, 0, 0xd, itemCount);

    for (i = 0; i < itemCount; i++)
    {
        int yPos = 0 + i * 2 + 3;

        int item = unit->items[i];
        s8 stealable = IsItemStealable(item);

        ClearText(proc->lines + i);

        Text_SetColor(proc->lines + i, stealable ? 0 : 1);
        Text_DrawString(proc->lines + i, GetItemName(item));

        PutText(proc->lines + i, gBg0Tm + TM_OFFSET(xPos + 3, yPos));

        PutNumberOrBlank(gBg0Tm + TM_OFFSET(xPos + 11, yPos), stealable ? 2 : 1, GetItemUses(item));
        PutIcon(gBg0Tm + TM_OFFSET(xPos + 1, yPos), GetItemIconId(item), 0x4000);
    }

    return;
}

void RefreshHammerneUnitInfoWindow(struct Unit * unit)
{
    int i;
    int color;
    int xPos;
    int itemCount;
    struct UnitInfoWindowProc * proc;

    itemCount = GetUnitItemCount(unit);

    xPos = GetUnitInfoWindowX(unit, 0x10);

    proc = UnitInfoWindow_DrawBase(0, unit, xPos, 0, 0x10, itemCount);

    for (i = 0; i < itemCount; i++)
    {
        int yPos = 0 + i * 2 + 3;

        int item = unit->items[i];

        color = IsItemRepairable(item) ? 0 : 1;

        ClearText(proc->lines + i);

        Text_SetColor(proc->lines + i, color);
        Text_DrawString(proc->lines + i, GetItemName(item));

        PutText(proc->lines + i, gBg0Tm + TM_OFFSET(xPos + 3, yPos));
        PutSpecialChar(gBg0Tm + TM_OFFSET(xPos + 12, yPos), color, TEXT_SPECIAL_SLASH);

        color = IsItemRepairable(item) ? 2 : 1;

        PutNumberOrBlank(gBg0Tm + TM_OFFSET(xPos + 11, yPos), color, GetItemUses(item));
        PutNumberOrBlank(gBg0Tm + TM_OFFSET(xPos + 14, yPos), color, GetItemMaxUses(item));

        PutIcon(gBg0Tm + TM_OFFSET(xPos + 1, yPos), GetItemIconId(item), 0x4000);
    }

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

void StartUnitHpInfoWindow(ProcPtr parent)
{
    struct UnitInfoWindowProc * proc = NewUnitInfoWindow(parent);
    InitTextDb(proc->lines + 0, 8);

    return;
}

void RefreshUnitHpInfoWindow(struct Unit * unit)
{
    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    struct UnitInfoWindowProc * proc = UnitInfoWindow_DrawBase(0, unit, x, 0, 10, 1);

    DrawUnitHpText(proc->lines + 0, unit);
    PutText(proc->lines + 0, gBg0Tm + TM_OFFSET(x + 1, y + 3));

    return;
}

void StartUnitHpStatusInfoWindow(ProcPtr parent)
{
    struct UnitInfoWindowProc * proc = NewUnitInfoWindow(parent);

    InitTextDb(proc->lines + 0, 8);
    InitTextDb(proc->lines + 1, 8);

    return;
}

void RefreshUnitHpStatusInfoWindow(struct Unit * unit)
{
    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    struct UnitInfoWindowProc * proc = UnitInfoWindow_DrawBase(0, unit, x, 0, 10, 2);

    DrawUnitHpText(proc->lines + 0, unit);
    PutText(proc->lines + 0, gBg0Tm + TM_OFFSET(x + 1, y + 3));

    DrawUnitStatusText(proc->lines + 1, unit);
    PutText(proc->lines + 1, gBg0Tm + TM_OFFSET(x + 1, y + 5));

    return;
}

void StartUnitResChangeInfoWindow(ProcPtr parent)
{
    struct UnitInfoWindowProc * proc = NewUnitInfoWindow(parent);

    InitTextDb(proc->lines + 0, 8);

    return;
}

void RefreshUnitResChangeInfoWindow(struct Unit * unit)
{
    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    struct UnitInfoWindowProc * proc = UnitInfoWindow_DrawBase(0, unit, x, y, 10, 1);

    DrawUnitResChangeText(proc->lines + 0, unit, 7 - unit->barrierDuration);
    PutText(proc->lines + 0, gBg0Tm + TM_OFFSET(x + 1, y + 3));

    return;
}

void StartUnitStaffOffenseInfoWindow(ProcPtr parent)
{
    struct UnitInfoWindowProc * proc = NewUnitInfoWindow(parent);

    InitTextDb(proc->lines + 0, 8);
    InitTextDb(proc->lines + 1, 8);

    return;
}

void RefreshUnitStaffOffenseInfoWindow(struct Unit * unit, int hit)
{
    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    struct UnitInfoWindowProc * proc = UnitInfoWindow_DrawBase(0, unit, x, 0, 10, 2);

    DrawUnitResUnkText(proc->lines + 0, unit, 7 - unit->barrierDuration);
    PutText(proc->lines + 0, gBg0Tm + TM_OFFSET(x + 1, y + 3));

    DrawAccuracyText(proc->lines + 1, hit);
    PutText(proc->lines + 1, gBg0Tm + TM_OFFSET(x + 1, y + 5));

    return;
}

void StartUnitRescueInfoWindowsCore(ProcPtr parent)
{
    sRescueUnitInfoWindows[0] = NewUnitInfoWindow(parent);
    InitTextDb(sRescueUnitInfoWindows[0]->lines + 0, 8);

    sRescueUnitInfoWindows[1] = NewUnitInfoWindow(parent);
    InitTextDb(sRescueUnitInfoWindows[1]->lines + 0, 8);

    return;
}

void RefreshUnitTakeRescueInfoWindows(ProcPtr parent)
{
    InitIcons();
    ApplyIconPalettes(4);

    StartUnitRescueInfoWindowsCore(parent);

    StartSpriteRefresher(parent, 2, 0, 0, Sprite_16x16_VFlipped, 6);

    return;
}

void RefreshUnitRescueInfoWindows(struct Unit * unit)
{
    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    ClearUi();

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[0], gActiveUnit, x, y, 10, 1);

    DrawUnitAidText(sRescueUnitInfoWindows[0]->lines + 0, gActiveUnit);
    PutText(sRescueUnitInfoWindows[0]->lines + 0, gBg0Tm + TM_OFFSET(x + 1, y + 3));

    PutUnitAidIconForTextAt(gActiveUnit, x + 1, y + 3);

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[1], unit, x, y + 6, 10, 1);

    DrawUnitConText(sRescueUnitInfoWindows[1]->lines + 0, unit);
    PutText(sRescueUnitInfoWindows[1]->lines + 0, gBg0Tm + TM_OFFSET(x + 1, y + 6 + 3));

    MoveSpriteRefresher(0, (x + 4) * 8, (y + 4) * 8 + 7);

    return;
}

void RefreshUnitTakeInfoWindows(struct Unit * unit)
{
    struct Unit * rescue;

    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    ClearUi();

    rescue = GetUnit(unit->rescue);

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[0], gActiveUnit, x, y, 10, 1);

    DrawUnitAidText(sRescueUnitInfoWindows[0]->lines + 0, gActiveUnit);
    PutText(sRescueUnitInfoWindows[0]->lines + 0, gBg0Tm + TM_OFFSET(x + 1, y + 3));

    PutUnitAidIconForTextAt(gActiveUnit, x + 1, y + 3);

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[1], rescue, x, y + 6, 10, 1);

    DrawUnitConText(sRescueUnitInfoWindows[1]->lines + 0, rescue);
    PutText(sRescueUnitInfoWindows[1]->lines + 0, gBg0Tm + TM_OFFSET(x + 1, y + 6 + 3));

    MoveSpriteRefresher(0, (x + 4) * 8, (y + 4) * 8 + 7);

    return;
}

void StartUnitGiveInfoWindows(ProcPtr parent)
{
    InitIcons();
    ApplyIconPalettes(4);

    StartUnitRescueInfoWindowsCore(parent);

    StartSpriteRefresher(parent, 2, 0, 0, Sprite_16x16, 6);

    return;
}

void RefreshUnitGiveInfoWindows(struct Unit * unit)
{
    int y = 0;
    int x = GetUnitInfoWindowX(unit, 10);

    struct Unit * rescue = GetUnit(gActiveUnit->rescue);

    ClearUi();

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[0], rescue, x, y, 10, 1);

    DrawUnitConText(sRescueUnitInfoWindows[0]->lines + 0, rescue);
    PutText(sRescueUnitInfoWindows[0]->lines + 0, gBg0Tm + TM_OFFSET(x + 1, y + 3));

    UnitInfoWindow_DrawBase(sRescueUnitInfoWindows[1], unit, x, y + 6, 10, 1);

    DrawUnitAidText(sRescueUnitInfoWindows[1]->lines + 0, unit);
    PutText(sRescueUnitInfoWindows[1]->lines + 0, gBg0Tm + TM_OFFSET(x + 1, y + 6 + 3));

    PutUnitAidIconForTextAt(unit, x + 1, y + 6 + 3);

    MoveSpriteRefresher(0, (x + 4) * 8, (y + 4) * 8 + 7);

    return;
}
