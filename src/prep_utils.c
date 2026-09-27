#include "gbafe.h"

#include "gbafe/bmcontainer.h"
#include "gbafe/bmarena.h"
struct ViewCounterProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 targetFrameCount;
    /* 2C */ u16 counter;
};

extern struct ProcCmd CONST_DATA ProcScr_ViewCounter[];
extern struct ProcCmd CONST_DATA ProcScr_PrepHelpboxListener[];
extern u16 Pal_08A1D448[];
extern u16 gUnknown_02013460[];

struct ProcCmd CONST_DATA ProcScr_ViewCounter[] = {
    PROC_19,
    PROC_YIELD,
    PROC_REPEAT(ViewCounter_Loop),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_PrepHelpboxListener[] = {
    PROC_SLEEP(1),
    PROC_REPEAT(PrepHbKeyListener_Loop),
    PROC_END,
};

struct PrepItemTypePageEnt CONST_DATA gPrepItemTypePageLut[] = {
    [0] = { ITYPE_SWORD,  ITYPE_SWORD },
    [1] = { ITYPE_LANCE,  ITYPE_LANCE },
    [2] = { ITYPE_AXE,    ITYPE_AXE   },
    [3] = { ITYPE_BOW,    ITYPE_BOW   },
    [4] = { ITYPE_STAFF,  ITYPE_STAFF },
    [5] = { ITYPE_ANIMA,  ITYPE_ANIMA },
    [6] = { ITYPE_LIGHT,  ITYPE_LIGHT },
    [7] = { ITYPE_DARK,   ITYPE_DARK  },
    [8] = { ITYPE_ITEM,   ITYPE_12    },
};

int sub_08090C44(void)
{
    return 0;
}
u8 GetConvoyItemCount_(void) {
    return GetConvoyItemCount();
}
void ViewCounter_Loop(ProcPtr p)
{
#define proc ((struct ViewCounterProc *) p)
    if (proc->targetFrameCount == proc->counter)
    {
        gDispIo.disp_ct.bg0_enable = 1;
        gDispIo.disp_ct.bg1_enable = 1;
        gDispIo.disp_ct.bg2_enable = 1;
        gDispIo.disp_ct.bg3_enable = 1;
        gDispIo.disp_ct.obj_enable = 1;

        Proc_Break(proc);
    }

    proc->counter++;
#undef proc
}
void StartViewCounter(u16 frames, ProcPtr parent)
{
    struct ViewCounterProc* proc = Proc_Start(ProcScr_ViewCounter, parent);

    proc->counter = 0;
    proc->targetFrameCount = frames;

    gDispIo.disp_ct.bg0_enable = 0;
    gDispIo.disp_ct.bg1_enable = 0;
    gDispIo.disp_ct.bg2_enable = 0;
    gDispIo.disp_ct.bg3_enable = 0;
    gDispIo.disp_ct.obj_enable = 0;

    return;
}
void TryLockProc(ProcPtr proc)
{
    struct Proc * proc_ = proc;
    if (proc_ != 0)
        proc_->proc_lockCnt++;
}
void TryUnlockProc(ProcPtr proc)
{
    struct Proc* proc_ = proc;
    if (proc_ != 0 && proc_->proc_lockCnt != 0)
        proc_->proc_lockCnt--;
}
void PrepHbKeyListener_Loop(ProcPtr proc)
{
    if (gpKeySt->pressed & (A_BUTTON | B_BUTTON | DPAD_ANY)) {
        CloseHelpBox();
        Proc_Break(proc);
    }

    return;
}
ProcPtr StartPrepErrorHelpbox(int x, int y, int msgId, ProcPtr parent) {
    if (x < 0 && y < 0) {
        x = GetUiHandPrevX();
        y = GetUiHandPrevY();
    }

    StartHelpBox(x, y, msgId);

    return Proc_StartBlocking(ProcScr_PrepHelpboxListener, parent);
}
s8 IsWeaponUsable(struct Unit * unit, int item)
{
    if (!CanUnitUseWeapon(unit, item)) {
        return 0;
    }

    if (GetItemAttributes(item) & IA_UNCOUNTERABLE) {
        return 0;
    }

    return 1;
}
int CountUnitUsableWeapons(struct Unit * unit)
{
    int i;

    int count = 0;

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        if (IsWeaponUsable(unit, unit->items[i]) == 1) {
            count++;
        }
    }

    return count;
}
s8 sub_08090DB0(struct Unit* unit) {

    if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY) {
        return 0;
    }

    if (!ArenaIsUnitAllowed(unit)) {
        return 0;
    }

    if (CountUnitUsableWeapons(unit) == 0) {
        return 0;
    }

    return 1;
}
s8 CheckValidLinkArenaItemSwap(struct Unit* unitA, int itemSlotA, struct Unit* unitB, int itemSlotB) {

    if (unitA == unitB) {
        return 1;
    }

    if (!CheckInLinkArena()) {
        return 1;
    }

    if (!(unitA->state & US_NOT_DEPLOYED)) {
        if (IsWeaponUsable(unitA, unitA->items[itemSlotA]) != 0) {
            if (CountUnitUsableWeapons(unitA) <= 1) {
                if (IsWeaponUsable(unitA, unitB->items[itemSlotB]) == 0) {
                    return 0;
                }
            }
        }
    }

    if (!(unitB->state & US_NOT_DEPLOYED)) {
        if (IsWeaponUsable(unitB, unitB->items[itemSlotB]) != 0) {
            if (CountUnitUsableWeapons(unitB) <= 1) {
                if (IsWeaponUsable(unitB, unitA->items[itemSlotA]) == 0) {
                    return 0;
                }
            }
        }
    }

    return 1;
}
s8 CheckValidLinkArenaItemSupply(struct Unit* unit, int itemSlot, int item) {

    if (!CheckInLinkArena()) {
        return 1;
    }

    if (unit->state & US_NOT_DEPLOYED) {
        return 1;
    }

    if (!IsWeaponUsable(unit, unit->items[itemSlot])) {
        return 1;
    }

    if (CountUnitUsableWeapons(unit) != 1) {
        return 1;
    }

    if (IsWeaponUsable(unit, item)) {
        return 1;
    }

    return 0;
}
s8 sub_08090EE8(struct Unit* unit, int itemSlot) {

    if (!CheckInLinkArena()) {
        return 1;
    }

    if (unit->state & US_NOT_DEPLOYED) {
        return 1;
    }

    if (!IsWeaponUsable(unit, unit->items[itemSlot])) {
        return 1;
    }

    if (CountUnitUsableWeapons(unit) != 1) {
        return 1;
    }

    return 0;
}
void sub_08090F30(void)
{
    int i;

    for (i = 0; i < 0x10; i++) {
        int pal = gPlaySt.config_window_theme;

        u16* dst = &gUnknown_02013460[i];
        u16* src = &Pal_08A1D448[pal * 0x10 + i];

        *dst = *src;
    }

    return;
}
int GetPrepPageForItem(int item) {
    int i;

    for (i = 0; i < 9; i++) {
        int itemType = GetItemType(item);

        if (itemType < gPrepItemTypePageLut[i].lowerBound) {
            continue;
        }

        if (itemType > gPrepItemTypePageLut[i].upperBound) {
            continue;
        }

        return i;
    }

    return 8;
}
void sub_08090F9C(int page)
{
    int j;
    int i;
    int k;

    struct PrepScreenItemListEnt* buffer = gPrepScreenExtraItemList;
    Unk_Prep_02012466 = 0;

    for (i = 0; i < Unk_Prep_02012464; i++) {
        u8 itemType = GetItemType(gPrepScreenItemList[i].item);

        if (itemType < gPrepItemTypePageLut[page].lowerBound) {
            continue;
        }

        if (itemType > gPrepItemTypePageLut[page].upperBound) {
            continue;
        }

        *buffer = gPrepScreenItemList[i];
        buffer++;

        Unk_Prep_02012466++;
    }

    for (i = 0; i < Unk_Prep_02012464; i++) {
        u8 itemType = GetItemType(gPrepScreenItemList[i].item);

        if (itemType < gPrepItemTypePageLut[page].lowerBound || itemType > gPrepItemTypePageLut[page].upperBound) {
            *buffer = gPrepScreenItemList[i];
            buffer++;
        }
    }

    j = 1;

    while (1) {
        if (j >= Unk_Prep_02012466 / 3) {
            break;
        }

        j = j * 3 + 1;
    }

    for (; j > 0; j = j / 3) {
       for (i = j; i < Unk_Prep_02012466; i++) {
            for (k = i - j; k >= 0; k -= j) {
                int a = GetItemIndex(gPrepScreenExtraItemList[k].item);
                int b = GetItemIndex(gPrepScreenExtraItemList[k + j].item);

                if (a > b) {
                    struct PrepScreenItemListEnt t = gPrepScreenExtraItemList[k];
                    gPrepScreenExtraItemList[k] = gPrepScreenExtraItemList[k + j];
                    gPrepScreenExtraItemList[k + j] = t;
                } else {
                    if (GetItemIndex(gPrepScreenExtraItemList[k].item) != GetItemIndex(gPrepScreenExtraItemList[k + j].item)) {
                        break;
                    }

                    if (gPrepScreenExtraItemList[k].item > gPrepScreenExtraItemList[k + j].item) {
                        struct PrepScreenItemListEnt t = gPrepScreenExtraItemList[k];
                        gPrepScreenExtraItemList[k] = gPrepScreenExtraItemList[k + j];
                        gPrepScreenExtraItemList[k + j] = t;
                    }
                }


            }
        }
    }

    CpuFastSet(gPrepScreenExtraItemList, gPrepScreenItemList, 0x190);

    return;
}
void SomethingPrepListRelated(struct Unit* pUnit, int page, int flags) {
    struct PrepScreenItemListEnt* pPrepItemList = gPrepScreenItemList;

    Unk_Prep_02012464 = 0;

    if (flags & 2) {
        int i;
        for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++) {
            int j;
            int itemCount;
            struct Unit* unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit)) {
                continue;
            }

            if (unit->state & (US_DEAD | US_BIT16)) {
                continue;
            }

            if (unit == pUnit) {
                continue;
            }

            itemCount = GetUnitItemCount(unit);

            for (j = 0; j < itemCount; j++) {
                pPrepItemList->pid = unit->pCharacterData->number;
                pPrepItemList->item = unit->items[j];
                pPrepItemList->itemSlot = j;
                pPrepItemList++;

                Unk_Prep_02012464++;
            }
        }
    }

    if (flags & 1) {
        int j;
        u16* convoy = GetConvoyItemArray();

        for (j = 0; j < CONVOY_ITEM_COUNT && convoy[j] != 0; j++) {
            pPrepItemList->item = convoy[j];
            pPrepItemList->pid = 0;
            pPrepItemList->itemSlot = j;
            pPrepItemList++;

            Unk_Prep_02012464++;
        }
    }

    sub_08090F9C(page);

    return;
}
void sub_0809120C(void) {
    u16 i;

    ClearSupplyItems();

    for (i = 0; i < Unk_Prep_02012464; i++) {
        if (gPrepScreenItemList[i].pid != 0) {
            continue;
        }

        if (gPrepScreenItemList[i].item == 0) {
            continue;
        }

        AddItemToConvoy(gPrepScreenItemList[i].item);
    }

    return;
}
void sub_08091250(void)
{
    u16 i;

    ClearSupplyItems();

    for (i = 0; i < CONVOY_ITEM_COUNT; i++) {
        AddItemToConvoy(0x87 - i);
    }

    return;
}
int sub_08091270(u16 a)
{
    int i;

    int count = 0;

    for (i = 0; i < 0x10; i++) {
        if ((a >> i) & 1) {
            count++;
        }
    }

    return count;
}
int sub_08091298(u16 a, int b)
{
    int i;
    int unk = 0;
    for (i = 0; i < 0x10; i++) {
        if (!((a >> i) & 1)) {
            continue;
        }

        if (unk == b) {
            return 1 << i;
        }

        unk++;
    }

    return 0;
}
int sub_080912CC(u16 a)
{
    int i;

    for (i = 0; i < 0x10; i++) {
        if ((a >> i) & 1) {
            return i;
        }
    }

    return 0;
}
s8 CanUnitPrepScreenUse(struct Unit* unit) {
    int i;

    int itemCount = GetUnitItemCount(unit);

    for (i = 0; i < itemCount; i++) {
        u16 item = unit->items[i];

        if (CanUnitUseItemPrepScreen(unit, item)) {
            return 1;
        }
    }

    return 0;
}
