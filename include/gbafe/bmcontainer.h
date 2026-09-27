#pragma once

#include "global.h"

// FE8U: bmcontainer.c, bmusort.c

#define CONVOY_ITEM_COUNT 100

extern u16 gConvoyItemArray[CONVOY_ITEM_COUNT];

u16 * GetConvoyItemArray(void);
void ClearSupplyItems(void);
void ShrinkConvoyItemList(void);
int GetConvoyItemCount(void);
int AddItemToConvoy(int item);
void RemoveItemFromConvoy(int index);
int GetConvoyItemSlot(int item);
bool HasConvoyAccess(void);
bool8 sub_0802E864(void);
struct Unit * GetSupplyUnit(void);

void InitUnitStack(void * buf);
void PushUnit(struct Unit * unit);
void LoadPlayerUnitsFromUnitStack(void);
void LoadPlayerUnitsFromUnitStack2(void);
