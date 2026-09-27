#include "gbafe.h"

struct SupportScreenUnit {
    /* 00 */ u8 charId;
    /* 01 */ u8 classId;
    /* 02 */ u8 supportLevel[7];
    /* 09 */ u8 partnerClassId[7];
    /* 10 */ s8 partnerIsAlive[7];
    /* 17 */ u8 pad_17;
};

struct SupportTalkEnt {
    /* 00 */ u8 unitA;
    /* 01 */ u8 unitB;
    /* 02 */ u8 pad_02[0x14 - 0x02];
};

extern struct SupportScreenUnit * CONST_DATA sSupportScreenUnits;
extern int sSupportScreenUnitCount;
extern struct SupportTalkEnt CONST_DATA gSupportTalkList[];

void MetaSave_SetMetCharacter(int charId, void * buf);
int GetUnitsAverageSupportValue(int charA, int charB);
void UpdateBestGlobalSupportValue(int charA, int charB, int value);

int GetSupportScreenCharIdAt(int idx);
int GetSupportScreenPartnerCount(int charId);
s8 GGM_IsCharacterKnown(int charId, struct GlobalSaveInfo * info);
void GetGlobalSupportListFromSave(int charId, u8 * out, struct GlobalSaveInfo * info);
int GetTotalSupportCollection(void);
int GetClassSMSId(int classId);

struct SupportScreenProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int curIndex;
    /* 3C */ int unk_3c;
    /* 40 */ s8 unk_40;
    /* 41 */ u8 unk_41;
    /* 42 */ s8 fromPrepScreen;
    /* 43 */ s8 helpTextActive;
};

int GetSupportScreenUnitCount(void)
{
    return sSupportScreenUnitCount;
}
int GetNextSupportScreenUnit(int num)
{
    if (num >= (sSupportScreenUnitCount - 1))
        return 0;

    return num + 1;
}
int GetPreviousSupportScreenUnit(int num)
{
    if (num == 0)
        num = sSupportScreenUnitCount;

    return num - 1;
}
int GetSupportScreenPartnerSupportLevel(int idx, int partner)
{
    return sSupportScreenUnits[idx].supportLevel[partner];
}
int GetSupportScreenPartnerClassId(int idx, int partner)
{
    return sSupportScreenUnits[idx].partnerClassId[partner];
}
s8 GetSupportScreenPartnerIsAlive(int idx, int partner)
{
    return sSupportScreenUnits[idx].partnerIsAlive[partner];
}
int GetSupportScreenPartnerCharId(int idx, int partner)
{
    return gCharacterData[GetSupportScreenCharIdAt(idx) - 1].pSupportData->pids[partner];
}
int GetSupportScreenCharIdAt(int idx)
{
    return sSupportScreenUnits[idx].charId;
}
int GetSupportScreenClassIdAt(int idx)
{
    return sSupportScreenUnits[idx].classId;
}
int GetSupportClassForCharId(int charId)
{
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_DEAD | US_BIT16))
            continue;

        if (unit->pCharacterData->number != charId)
            continue;

        return unit->pClassData->number;
    }

    return gCharacterData[charId - 1].defaultClass;
}
s8 sub_0809B15C(int charId)
{
    struct SupportTalkEnt const * iter;

    for (iter = gSupportTalkList; iter->unitA != 0; iter++)
    {
        if (iter->unitA == charId || iter->unitB == charId)
            return 1;
    }

    return 0;
}
void sub_0809B184(void)
{
    struct SupportTalkEnt const * iter;

    for (iter = gSupportTalkList; iter->unitA != 0; iter++)
    {
        MetaSave_SetMetCharacter(iter->unitA, NULL);
        MetaSave_SetMetCharacter(iter->unitB, NULL);
        UpdateBestGlobalSupportValue(iter->unitA, iter->unitB, GetUnitsAverageSupportValue(iter->unitA, iter->unitB));
    }
}
void SupportScreen_SetupUnits(struct SupportScreenProc * proc)
{
    int k;
    int j;

    CpuFill16(0, sSupportScreenUnits, 0xC00);

    sSupportScreenUnitCount = 0;

    if (proc->fromPrepScreen)
    {
        int i;

        u32 unitFlags[8];
        CpuFill16(0, unitFlags, 0x20);

        for (i = 1; i < 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (unit->state & (US_DEAD | US_BIT16))
                continue;

            *(unitFlags + (unit->pCharacterData->number >> 5)) |= (1 << (unit->pCharacterData->number & 0x1f));
        }

        for (i = 1; i < 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (unit->state & (US_DEAD | US_BIT16))
                continue;

            if (!GetSupportScreenPartnerCount(unit->pCharacterData->number))
                continue;

            sSupportScreenUnits[sSupportScreenUnitCount].charId = unit->pCharacterData->number;
            sSupportScreenUnits[sSupportScreenUnitCount].classId = unit->pClassData->number;

            for (j = 0; j < gCharacterData[unit->pCharacterData->number - 1].pSupportData->count; j++)
            {
                int charId = GetSupportScreenPartnerCharId(sSupportScreenUnitCount, j);

                sSupportScreenUnits[sSupportScreenUnitCount].supportLevel[j] = GetUnitSupportLevel(unit, j);
                sSupportScreenUnits[sSupportScreenUnitCount].partnerClassId[j] = GetSupportClassForCharId(charId);
                sSupportScreenUnits[sSupportScreenUnitCount].partnerIsAlive[j] =
                    (*(unitFlags + (charId >> 5)) >> (charId & 0x1f)) & 1;
            }

            sSupportScreenUnitCount++;
        }
    }
    else
    {
        struct GlobalSaveInfo info;
        ReadGlobalSaveInfo(&info);

        SetTacticianName(DecodeMsg(0x55B));

        for (j = 0; j < 0x100; j++)
        {
            if (!GGM_IsCharacterKnown(j, &info))
                continue;

            if (!GetSupportScreenPartnerCount(j))
                continue;

            sSupportScreenUnits[sSupportScreenUnitCount].charId = j;
            sSupportScreenUnits[sSupportScreenUnitCount].classId = gCharacterData[j - 1].defaultClass;

            GetGlobalSupportListFromSave(j, sSupportScreenUnits[sSupportScreenUnitCount].supportLevel, &info);

            for (k = 0; k < GetSupportScreenPartnerCount(j); k++)
            {
                int charId = GetSupportScreenPartnerCharId(sSupportScreenUnitCount, k);

                sSupportScreenUnits[sSupportScreenUnitCount].partnerClassId[k] = gCharacterData[charId - 1].defaultClass;
                sSupportScreenUnits[sSupportScreenUnitCount].partnerIsAlive[k] = GGM_IsCharacterKnown(charId, &info);
            }

            sSupportScreenUnitCount++;
        }
    }
}
void sub_0809B440(struct SupportScreenProc * proc)
{
    int i;

    if (proc->fromPrepScreen)
    {
        for (i = 1; i < 0x40; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            UseUnitSprite(GetUnitSMSId(unit));
        }
    }
    else
    {
        for (i = 0; i < sSupportScreenUnitCount; i++)
            UseUnitSprite(GetClassSMSId(sSupportScreenUnits[i].classId));
    }

    ForceSyncUnitSpriteSheet();
}
int GetTotalSupportLevel(int idx)
{
    int i;

    int total = 0;

    for (i = 0; i < gCharacterData[GetSupportScreenCharIdAt(idx) - 1].pSupportData->count; i++)
        total += GetSupportScreenPartnerSupportLevel(idx, i);

    return total;
}
int Support_GetSupportLevelTextColor(s8 flag, int idx)
{
    int i;
    int a;
    int b;
    int c;

    if (flag != 0)
    {
        int var = GetTotalSupportLevel(idx);

        if (var == 5)
            return 2;

        if (var == 0)
            return 0;

        return 1;
    }

    a = 0;
    b = GetTotalSupportLevel(idx);

    c = GetSupportScreenPartnerCount(GetSupportScreenCharIdAt(idx));

    for (i = 0; i < c; i++)
        a += GetUnitsAverageSupportValue(GetSupportScreenCharIdAt(idx), GetSupportScreenPartnerCharId(idx, i));

    if (a == b)
        return 2;

    if (b == 0)
        return 0;

    return 1;
}
void DrawSupportScreenText(void)
{
    struct Text * th;
    int perc;

    th = &gPrepItemTexts[29];

    perc = GetTotalSupportCollection();

    th++;
    ClearText(th);

    Text_InsertDrawString(th, 0, perc == 100 ? 4 : 0, DecodeMsg(0x12C9));

    Text_SetCursor(th, 48);
    Text_SetColor(th, perc == 100 ? 4 : 2);
    Text_DrawNumberOrBlank(th, perc);
    Text_Skip(th, 1);

    Text_InsertDrawString(th, 56, perc == 100 ? 4 : 0, "%");

    PutText(th, gBg0Tm + TM_OFFSET(20, 18));

    EnableBgSync(BG0_SYNC_BIT);
}
void SupportScreen_OnInit(struct SupportScreenProc * proc)
{
    proc->unk_2c = 0;
    proc->unk_40 = 0;
    proc->unk_34 = 0;
    proc->curIndex = 0;
    proc->unk_3c = -1;
}
ASM_FUNC("asm/nonmatching/code_0809B604.s");
ASM_FUNC("asm/nonmatching/code_0809B670.s");
ASM_FUNC("asm/nonmatching/code_0809B700.s");
ASM_FUNC("asm/nonmatching/code_0809BA24.s");
ASM_FUNC("asm/nonmatching/code_0809BA48.s");
ASM_FUNC("asm/nonmatching/code_0809BA80.s");
ASM_FUNC("asm/nonmatching/code_0809BDFC.s");
ASM_FUNC("asm/nonmatching/code_0809BE14.s");
ASM_FUNC("asm/nonmatching/code_0809BE50.s");
ASM_FUNC("asm/nonmatching/code_0809BE68.s");
ASM_FUNC("asm/nonmatching/code_0809BE80.s");
ASM_FUNC("asm/nonmatching/code_0809BF78.s");
ASM_FUNC("asm/nonmatching/code_0809BF94.s");
ASM_FUNC("asm/nonmatching/code_0809BFCC.s");
ASM_FUNC("asm/nonmatching/code_0809C044.s");
ASM_FUNC("asm/nonmatching/code_0809C12C.s");
ASM_FUNC("asm/nonmatching/code_0809C154.s");
ASM_FUNC("asm/nonmatching/code_0809C3F4.s");
ASM_FUNC("asm/nonmatching/code_0809C41C.s");
ASM_FUNC("asm/nonmatching/code_0809C44C.s");
ASM_FUNC("asm/nonmatching/code_0809C49C.s");
ASM_FUNC("asm/nonmatching/code_0809C524.s");
ASM_FUNC("asm/nonmatching/code_0809C544.s");
ASM_FUNC("asm/nonmatching/code_0809C654.s");
ASM_FUNC("asm/nonmatching/code_0809C844.s");
ASM_FUNC("asm/nonmatching/code_0809C924.s");
ASM_FUNC("asm/nonmatching/code_0809CA08.s");
ASM_FUNC("asm/nonmatching/code_0809CA38.s");
ASM_FUNC("asm/nonmatching/code_0809CAB8.s");
ASM_FUNC("asm/nonmatching/code_0809CB10.s");
ASM_FUNC("asm/nonmatching/code_0809CB8C.s");
ASM_FUNC("asm/nonmatching/code_0809CBD8.s");
ASM_FUNC("asm/nonmatching/code_0809CC30.s");
ASM_FUNC("asm/nonmatching/code_0809CE38.s");
ASM_FUNC("asm/nonmatching/code_0809CFF8.s");
ASM_FUNC("asm/nonmatching/code_0809D0BC.s");
ASM_FUNC("asm/nonmatching/code_0809D15C.s");
ASM_FUNC("asm/nonmatching/code_0809D22C.s");
ASM_FUNC("asm/nonmatching/code_0809D2D4.s");
ASM_FUNC("asm/nonmatching/code_0809D380.s");
ASM_FUNC("asm/nonmatching/code_0809D428.s");
ASM_FUNC("asm/nonmatching/code_0809D4D4.s");
ASM_FUNC("asm/nonmatching/code_0809D5D0.s");
ASM_FUNC("asm/nonmatching/code_0809D6A8.s");
ASM_FUNC("asm/nonmatching/code_0809D6C8.s");
ASM_FUNC("asm/nonmatching/code_0809D71C.s");
ASM_FUNC("asm/nonmatching/code_0809D754.s");
