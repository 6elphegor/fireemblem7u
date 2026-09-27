#include "gbafe.h"
#include "gbafe/bmcontainer.h"

// Convoy (FE8U: bmcontainer.c)

u16 * GetConvoyItemArray(void)
{
    return gConvoyItemArray;
}

void ClearSupplyItems(void)
{
    CpuFill16(0, gConvoyItemArray, CONVOY_ITEM_COUNT * sizeof(u16));
}

void ShrinkConvoyItemList(void)
{
    u16 i;
    u16 * buffer = (void *) gBuf;
    u16 * bufferIt = buffer;
    u16 * convoy = GetConvoyItemArray();

    for (i = 0; i < CONVOY_ITEM_COUNT; ++i)
    {
        if (*convoy != 0)
        {
            *bufferIt = *convoy;
            bufferIt++;
        }
        convoy++;
    }

    *bufferIt = 0;
    ClearSupplyItems();
    CpuCopy16(buffer, GetConvoyItemArray(), i * sizeof(u16));
    return;
}

int GetConvoyItemCount(void)
{
    int i;
    int count = 0;
    u16 * convoy = gConvoyItemArray;
    for (i = 0; i < CONVOY_ITEM_COUNT; i++)
        if (convoy[i] != 0)
            count++;

    return count;
}

int AddItemToConvoy(int item)
{
    int i;
    u16 * convoy;
    gBmSt.convoy_item_overflow = 0;
    convoy = gConvoyItemArray;
    for (i = 0; i < CONVOY_ITEM_COUNT; ++i)
    {
        if (convoy[i] == 0)
        {
            convoy[i] = item;
            return i;
        }
    }
    gBmSt.convoy_item_overflow = item;
    return -1;
}

void RemoveItemFromConvoy(int index)
{
    gConvoyItemArray[index] = 0;
    ShrinkConvoyItemList();
    return;
}

int GetConvoyItemSlot(int item)
{
    int i;
    u16 * convoy;
    item = GetItemIndex(item);
    convoy = gConvoyItemArray;

    for (i = 0; i < CONVOY_ITEM_COUNT; ++i)
        if (item == (convoy[i] & 0xFF))
            return i;

    return -1;
}

bool8 HasConvoyAccess(void)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_UNAVAILABLE)
            continue;

        if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
            return TRUE;
    }
    return FALSE;
}

bool8 sub_0802E864(void)
{
    const struct ChapterInfo * info = GetChapterInfo(gPlaySt.chapterIndex);
    int hector = 0;
    const u8 * pos;

    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_HECTOR)
        hector = 1;

    pos = &info->merchantPosX;
    if (pos[hector] == 0xFF)
        return FALSE;

    return TRUE;
}

struct Unit * GetSupplyUnit(void)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
            return unit;
    }
    return NULL;
}
