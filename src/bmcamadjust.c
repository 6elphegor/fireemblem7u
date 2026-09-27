#include "gbafe.h"

void GetPlayerStartCursorPosition(int * px, int * py)
{
    struct Unit * unit;

    if (1 == gPlaySt.chapterTurnNumber)
    {
        unit = GetUnit(1);
        gPlaySt.xCursor = unit->xPos;
        gPlaySt.yCursor = unit->yPos;
    }

    if (1 != gPlaySt.cfgAutoCursor)
    {
        unit = GetUnit(1);
        *px = unit->xPos;
        *py = unit->yPos;
    }
    else
    {
        *px = gPlaySt.xCursor;
        *py = gPlaySt.yCursor;
    }
}

void GetEnemyStartCursorPosition(int * px, int * py)
{
    int i;

    for (i = gPlaySt.faction + 1; i < gPlaySt.faction + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_HIDDEN | US_CONCEALED))
            continue;

        *px = unit->xPos;
        *py = unit->yPos;

        if (CA_BOSS & UNIT_CATTRIBUTES(unit))
            break;
    }
}

void ProcFun_ResetCursorPosition(ProcPtr proc)
{
    int x, y;

    x = -1;
    y = -1;

    if (0 == CountFactionMoveableUnits(gPlaySt.faction))
    {
        Proc_End(proc);
        return;
    }

    switch (gPlaySt.faction)
    {
    case FACTION_BLUE:
        GetPlayerStartCursorPosition(&x, &y);
        break;

    case FACTION_GREEN:
    case FACTION_RED:
        GetEnemyStartCursorPosition(&x, &y);
        break;

    default:
        break;
    }

    if ((x >= 0) && (y >= 0))
    {
        EnsureCameraOntoPosition(proc, x, y);
        SetMapCursorPosition(x, y);
    }
}

void ADJUSTFROMXI_MoveCameraOnSomeUnit(ProcPtr proc)
{
    int x, y;
    struct Unit * unit = GetUnit(GetLastStatScreenUnitId());

    if (NULL == unit)
        return;

    x = unit->xPos;
    y = unit->yPos;
    EnsureCameraOntoPosition(proc, x, y);
    SetMapCursorPosition(x, y);
}
