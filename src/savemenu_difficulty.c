#include "gbafe.h"

#include "gbafe/savemenu.h"

extern u8 gPlayStChapterBits[];
extern u8 gPlayStChapterMode[];
extern u16 gUnk_083FE30A[];
extern u16 gUnk_083FE32A[];
extern u16 gUnk_083FE40A[];
extern u16 gUnk_083FE42A[];

void sub_080A6398(u8 slot, struct SaveMenuProc * proc)
{
    struct PlaySt playSt;

    if (slot < 3)
    {
        if (IsSaveValid(slot))
        {
            ReadGameSavePlaySt(slot, &playSt);
            proc->unk_37[slot] = GetChapterTitle(&playSt);
            proc->unk_48[slot] = playSt.time_saved;
            proc->unk_3A[slot] = 0;

            // BUG?
#if PLATFORM_GBA
            if (IsGameNotFirstChapter((struct PlaySt *) (uintptr_t) slot) != 0)
#else
            // The GBA reads "chapterIndex" at address slot + 0xE, in the BIOS:
            // the protected BIOS returns the word it last fetched (0xE129F000,
            // 0xE55EC002 or 0xE3A02004), whose byte there is always > 0xD, so
            // the test is always true.
            if (TRUE)
#endif
                proc->unk_3A[slot] |= 1;

            if (sub_080A09FC(&playSt) != 0)
                proc->unk_3A[slot] |= 2;

            gPlayStChapterBits[slot] = playSt.chapterStateBits;
            gPlayStChapterMode[slot] = playSt.chapterModeIndex;
        }
        else
        {
            proc->unk_37[slot] = (u8) -1;
            proc->unk_3A[slot] = 0;
            proc->unk_48[slot] = 0;

            gPlayStChapterBits[slot] = 0;
            gPlayStChapterMode[slot] = 0;
        }
    }
    else if (proc->unk_44 == 0x100)
    {
        if (IsValidSuspendSave(3))
        {
            ReadSuspendSavePlaySt(3, &playSt);
            proc->unk_3F = playSt.gameSaveSlot;
            proc->unk_54 = playSt.time_saved;
        }
        else
        {
            proc->unk_44 = 0xf0;
        }
    }
}
#if NONMATCHING

void SaveMenuInitSlotPalette(u8 slot)
{
    int i;

    for (i = 0; i < 3; i++)
    {
        u8 flags = gPlayStChapterBits[i] & 0x40 ? 4 : 0;

        if (gPlayStChapterMode[i] == 1)
            flags |= 0x10;

        if (gPlayStChapterMode[i] == 2)
            flags |= 0x20;

        if (gPlayStChapterMode[i] == 3)
            flags |= 0x40;

        if (i != slot)
            flags |= 2;

        PutChapterTitlePalette(flags | 1, i * 2 + 0x1a);
        PutChapterTitlePalette(flags, i * 2 + 0x1b);
    }

    EnablePalSync();
}

#else

// FAKEMATCH (found by Astra): an empty read/write asm constraint on the
// 0x40 mask stops it from being hoisted into r9.
void SaveMenuInitSlotPalette(u8 slot)
{
    int i;

    for (i = 0; i < 3; i++)
    {
        u8 flags = gPlayStChapterBits[i] & 0x40 ? 4 : 0;

        if (gPlayStChapterMode[i] == 1)
        {
            flags |= 0x10;
        }

        if (gPlayStChapterMode[i] == 2)
        {
            flags |= 0x20;
            flags = (u8)flags;
        }

        if (gPlayStChapterMode[i] == 3)
        {
            register int mask asm("r0") = 0x40;
            asm("" : "+r"(mask));
            flags |= mask;
            flags = (u8)flags;
        }

        if (i != slot)
        {
            flags |= 2;
            flags = (u8)flags;
        }

        PutChapterTitlePalette(flags | 1, i * 2 + 0x1a);
        PutChapterTitlePalette(flags, i * 2 + 0x1b);
    }

    EnablePalSync();
}

#endif

void sub_080A652C(int param_1, int param_2)
{
    int slot;
    u16 * r6;
    u16 * r8;
    int r9;
    u16 * ip;
    u16 * pickle = gUnk_083FE40A;
    u16 * ketchup = gUnk_083FE30A;

    param_1 = (param_1 >> 1) & 0x1f;
    if (param_1 > 0x10)
        param_1 = 0x10 - (param_1 & 0xf);

    for (slot = 0; slot < 3; slot++)
    {
        int tmp;
        if (!(gPlayStChapterBits[slot] & 0x40))
            continue;

        tmp = (slot * 0x20 + 0xa0);
        r8 = &gPal[tmp + 0x109];

        if (slot == param_2)
        {
            ip = ketchup;
            r6 = pickle;
        }
        else
        {
            ip = gUnk_083FE32A;
            r6 = gUnk_083FE42A;
        }

        for (r9 = 0; r9 < 7; r9++)
        {
            *r8 =
                ((((*ip & 0x1f) * param_1 + (0x10 - param_1) * (*r6 & 0x1f)) >> 4) & 0x1f) +
                ((((*ip & 0x3e0) * param_1 + (0x10 - param_1) * (*r6 & 0x3e0)) >> 4) & 0x3e0) +
                ((((*ip & 0x7c00) * param_1 + (0x10 - param_1) * (*r6 & 0x7c00)) >> 4) & 0x7c00);
            ++r8;
            ++ip;
            ++r6;
        }
    }

    EnablePalSync();
}
u8 SaveMenuGetValidMenuAmt(u8 endMask, struct SaveMenuProc * proc)
{
    int mask, count = 0;

    for (mask = 1; mask < endMask; mask <<= 1)
    {
        if ((proc->unk_30 & mask) != 0)
            count++;
    }

    return count;
}
