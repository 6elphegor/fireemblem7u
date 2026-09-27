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

ASM_FUNC("asm/nonmatching/code_08088E80.s");
ASM_FUNC("asm/nonmatching/code_08088F3C.s");
ASM_FUNC("asm/nonmatching/code_08089038.s");
ASM_FUNC("asm/nonmatching/code_08089148.s");
ASM_FUNC("asm/nonmatching/code_080891D4.s");
ASM_FUNC("asm/nonmatching/code_08089200.s");
ASM_FUNC("asm/nonmatching/code_08089220.s");
ASM_FUNC("asm/nonmatching/code_0808927C.s");
ASM_FUNC("asm/nonmatching/code_08089558.s");
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
