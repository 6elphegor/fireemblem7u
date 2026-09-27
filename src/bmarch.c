#include "gbafe.h"
#include "gbafe/bmarch.h"

// Ballistae (FE8U: bmarch.c)

struct Trap * AddTrap(int x, int y, int trapType, int meta);

inline s8 IsBallista(struct Trap * trap)
{
    if (!trap)
        return 0;

    if (trap->type != TRAP_BALLISTA)
        return 0;

    return 1;
}

inline int sub_080347F8(struct Trap * trap)
{
    if (!IsBallista(trap))
        return 0;

    return (trap->data[TRAP_EXTDATA_BLST_ITEMUSES] << 8) | trap->extra;
}

inline int sub_08034820(struct Trap * trap)
{
    if (!IsBallista(trap))
        return 0;

    return trap->extra;
}

inline int GetBallistaItemUses(struct Trap * trap)
{
    if (!IsBallista(trap))
        return 0;

    return trap->data[TRAP_EXTDATA_BLST_ITEMUSES];
}

inline void ClearBallistaOccupied(struct Trap * trap)
{
    trap->data[TRAP_EXTDATA_BLST_RIDDEN] = 0;
    return;
}

inline void SetBallistaOccupied(struct Trap * trap)
{
    trap->data[TRAP_EXTDATA_BLST_RIDDEN] = 1;
    return;
}

struct Trap * GetRiddenBallistaAt(int x, int y)
{
    struct Trap * trap = GetTrapAt(x, y);

    if (GetBallistaItemUses(trap) == 0)
        return 0;

    return trap;
}

int GetBallistaItemAt(int x, int y)
{
    struct Trap * trap = GetTrapAt(x, y);

    if (GetBallistaItemUses(trap) == 0)
        return 0;

    return sub_080347F8(trap);
}

int GetSomeBallistaItemAt(int x, int y)
{
    struct Trap * trap = GetTrapAt(x, y);

    int unk = sub_08034820(trap);

    if (unk == 0)
        return 0;

    return unk + 0x100;
}

struct Trap * AddBallista(int x, int y, int ballistaType)
{
    struct Trap * trap = AddTrap(x, y, 1, 0);

    trap->extra = GetItemIndex(ballistaType);
    trap->data[TRAP_EXTDATA_BLST_ITEMUSES] = GetItemUses(MakeNewItem(ballistaType));

    ClearBallistaOccupied(trap);

    return trap;
}

void RideBallista(struct Unit * unit)
{
    struct Trap * trap = GetTrapAt(unit->xPos, unit->yPos);

    SetBallistaOccupied(trap);

    RefreshUnitSprites();

    unit->state |= US_IN_BALLISTA;

    unit->ballistaIndex = TRAP_INDEX(trap);

    return;
}

void TryRemoveUnitFromBallista(struct Unit * unit)
{
    struct Trap * trap;

    if ((unit->state & US_IN_BALLISTA) != 0)
    {
        trap = GetTrap(unit->ballistaIndex);

        unit->state &= ~US_IN_BALLISTA;

        ClearBallistaOccupied(trap);

        unit->ballistaIndex = 0;

        trap->xPos = unit->xPos;
        trap->yPos = unit->yPos;

        RefreshUnitSprites();
    }

    return;
}
