#include "gbafe.h"
#include "gbafe/bmcontainer.h"

// Unit stack (FE8U: bmusort.c)

extern struct Unit * sUnitStackBase;
extern struct Unit * sUnitStackTop;
extern u8 sUnitStackSize;

void InitUnitStack(void * buf)
{
    struct Unit ** tmp = &sUnitStackBase;
    sUnitStackTop = buf;
    *tmp = buf;
    sUnitStackSize = 1;
}

void PushUnit(struct Unit * unit)
{
    sUnitStackTop->pCharacterData = 0;
    CopyUnit(unit, sUnitStackTop);
    sUnitStackTop->index = sUnitStackSize;
    unit->maxHP = 0;
    sUnitStackSize++;
    sUnitStackTop++;
}

void LoadPlayerUnitsFromUnitStack(void)
{
    int i;
    for (i = 0; i < 0x3E; ++i)
        ClearUnit(&gUnitArrayBlue[i]);

    CpuCopy16(sUnitStackBase, gUnitArrayBlue, (void *) sUnitStackTop - (void *) sUnitStackBase);
}

void LoadPlayerUnitsFromUnitStack2(void)
{
    int i;
    for (i = 0; i < 0x3E; ++i)
        ClearUnit(&gUnitArrayBlue[i]);

    CpuCopy16(sUnitStackBase, gUnitArrayBlue, (void *) sUnitStackTop - (void *) sUnitStackBase);
}
