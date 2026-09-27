#include "gbafe.h"




bool UnitInfoRequiresNoMovement(struct UnitDefinition const * def);
void TryMoveUnit(struct Unit * unit, int x, int y, bool arg);
void TryMoveUnitDisplayed(struct EventProc * proc, struct Unit * unit, int x, int y, int arg);
bool sub_08079954(struct Unit * unit);
bool sub_08079A14(struct Unit * unit);

void sub_0800A71C(struct UnitDefinition const * def, struct Unit * unit, struct EventProc * proc, bool move);

void LoadUnitCore(struct UnitDefinition const * def, struct EventProc * proc)
{
    struct Unit * unit;

    if (UnitInfoRequiresNoMovement(def))
        return;

    if (def->faction_id != FACTION_ID_BLUE)
    {
        int faction = FACTION_BLUE;

        unit = GetUnitFromCharIdAndFaction(def->pid, FACTION_BLUE);

        if (unit == NULL)
            goto load;

        switch (def->faction_id)
        {
        case FACTION_ID_BLUE:
            faction = FACTION_BLUE;
            break;

        case FACTION_ID_RED:
            faction = FACTION_RED;
            break;

        case FACTION_ID_GREEN:
            faction = FACTION_GREEN;
            break;
        }

        UnitChangeFaction(unit, faction);
    }

    unit = GetUnitFromCharId(def->pid);

    if (unit == NULL)
    {
    load:
        unit = LoadUnit(def);
        unit->state |= US_BIT22;
    }
    else
    {
        if (sub_08079954(unit))
        {
            UnitLoadItemsFromDefinition(unit, def);
            unit->state &= ~US_BIT16;
        }

        if (!sub_08079A14(unit) && (unit->state & US_DEAD))
            return;
    }

    unit->xPos = def->x_load;
    unit->yPos = def->y_load;

    if ((gPlaySt.chapterStateBits & PLAY_FLAG_HARD) && gPlaySt.chapterModeIndex == 3 && def->faction_id == FACTION_ID_RED)
        UnitApplyBonusLevels(unit, GetChapterInfo(gPlaySt.chapterIndex)->hard_bonus_levels);

    sub_0800A71C(def, unit, proc, TRUE);
    RefreshEntityMaps();
}

void FakeLoadUnit(struct UnitDefinition const * def, struct Unit * unit)
{
    sub_0800A71C(def, unit, NULL, FALSE);
    RefreshEntityMaps();
}

void sub_0800A71C(struct UnitDefinition const * def, struct Unit * unit, struct EventProc * proc, bool move)
{
    if (unit == NULL)
        return;

    if (move)
    {
        if (proc != NULL)
        {
            int hidden = unit->state & US_UNDER_A_ROOF;

            if (!hidden)
            {
                u32 pos_load, pos_move;

                TryMoveUnit(unit, def->x_load, def->y_load, FALSE);
                RefreshUnitSprites();

                pos_load = *(u16 const *) &def->x_load;
                pos_move = *(u16 const *) &def->x_move;

                if ((pos_load & 0xFFFF) != (pos_move & 0xFFFF))
                    TryMoveUnitDisplayed(proc, unit, def->x_move, def->y_move, hidden);

                return;
            }
        }

        TryMoveUnit(unit, def->x_move, def->y_move, TRUE);
        RefreshUnitSprites();
    }
    else
    {
        TryMoveUnit(unit, def->x_move, def->y_move, TRUE);
        RefreshUnitSprites();
    }
}

bool sub_0800A7A0(void)
{
    if (gpKeySt->held & R_BUTTON)
        return TRUE;

    return FALSE;
}

extern int gUnk_03000100;
extern u8 CONST_DATA gUnk_08B90C9C[];

int sub_0800A7BC(void)
{
    gUnk_03000100 = 0;
    return 1;
}

int sub_0800A7CC(void)
{
    return gUnk_08B90C9C[gUnk_03000100++];
}

ASM_FUNC("asm/nonmatching/code_0800A7E4.s");
ASM_FUNC("asm/nonmatching/code_0800A918.s");
ASM_FUNC("asm/nonmatching/code_0800AA18.s");
ASM_FUNC("asm/nonmatching/code_0800AA4C.s");
ASM_FUNC("asm/nonmatching/code_0800AABC.s");
ASM_FUNC("asm/nonmatching/code_0800AAD8.s");
ASM_FUNC("asm/nonmatching/code_0800AB00.s");
ASM_FUNC("asm/nonmatching/code_0800AB1C.s");
ASM_FUNC("asm/nonmatching/code_0800AB38.s");
ASM_FUNC("asm/nonmatching/code_0800AC8C.s");
ASM_FUNC("asm/nonmatching/code_0800ACC4.s");
ASM_FUNC("asm/nonmatching/code_0800AD1C.s");
ASM_FUNC("asm/nonmatching/code_0800AD28.s");
ASM_FUNC("asm/nonmatching/code_0800AD34.s");
ASM_FUNC("asm/nonmatching/code_0800AD40.s");
ASM_FUNC("asm/nonmatching/code_0800AD5C.s");
ASM_FUNC("asm/nonmatching/code_0800ADA8.s");
ASM_FUNC("asm/nonmatching/code_0800ADB8.s");
ASM_FUNC("asm/nonmatching/code_0800ADD0.s");
ASM_FUNC("asm/nonmatching/code_0800ADDC.s");
ASM_FUNC("asm/nonmatching/code_0800ADF0.s");
ASM_FUNC("asm/nonmatching/code_0800AE04.s");
ASM_FUNC("asm/nonmatching/code_0800AE18.s");
ASM_FUNC("asm/nonmatching/code_0800AE34.s");
ASM_FUNC("asm/nonmatching/code_0800AE50.s");
ASM_FUNC("asm/nonmatching/code_0800AE8C.s");
ASM_FUNC("asm/nonmatching/code_0800AEF0.s");
ASM_FUNC("asm/nonmatching/code_0800AF20.s");
ASM_FUNC("asm/nonmatching/code_0800AF5C.s");
ASM_FUNC("asm/nonmatching/code_0800AF68.s");
ASM_FUNC("asm/nonmatching/code_0800AF74.s");
ASM_FUNC("asm/nonmatching/code_0800B0F0.s");
ASM_FUNC("asm/nonmatching/code_0800B104.s");
ASM_FUNC("asm/nonmatching/code_0800B110.s");
ASM_FUNC("asm/nonmatching/code_0800B130.s");
ASM_FUNC("asm/nonmatching/code_0800B180.s");
ASM_FUNC("asm/nonmatching/code_0800B198.s");
ASM_FUNC("asm/nonmatching/code_0800B1C4.s");
ASM_FUNC("asm/nonmatching/code_0800B1F0.s");
ASM_FUNC("asm/nonmatching/code_0800B20C.s");
ASM_FUNC("asm/nonmatching/code_0800B220.s");
ASM_FUNC("asm/nonmatching/code_0800B24C.s");
ASM_FUNC("asm/nonmatching/code_0800B2C4.s");
ASM_FUNC("asm/nonmatching/code_0800B308.s");
ASM_FUNC("asm/nonmatching/code_0800B390.s");
ASM_FUNC("asm/nonmatching/code_0800B4A0.s");
