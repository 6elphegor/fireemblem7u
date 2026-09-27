#include "gbafe.h"
#include "gbafe/bmusemind.h"
#include "gbafe/bmtrade.h"
#include "gbafe/bmcommanddbg.h"

/* Event-script helpers (ASMC / condition callbacks) */

int GetGold(void);
void UnitLevelUp(struct Unit * unit);
void SetVisionWithFade(int vision);
void NewKeyStSetter(int arg);
void InitMoreBMapGraphics(void);
bool BoxTalkActive(void);

extern u8 gSelectTargetCount;

extern struct ProcCmd CONST_DATA ProcScr_08CA74F0[];
extern struct ProcCmd CONST_DATA ProcScr_TutorialCursor[];
extern struct ProcCmd CONST_DATA ProcScr_TutorialCursorWatcher[];
extern u16 CONST_DATA Obj_EventShinningCursor[];
extern u16 CONST_DATA Pal_EventCursorShinning[];

struct ProcTutorialCursor
{
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x54);

    /* 54 */ u8 const * list;

    STRUCT_PAD(0x58, 0x64);

    /* 64 */ s16 timer;
    /* 66 */ s16 fadeDir;
};

struct ProcEventMapLock
{
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s8 locked;
    /* 4D */ u8 unk_4D;
};

int sub_08079AB4(void)
{
    int count = 0;
    int i;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x3F + 1; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD)
            continue;

        count++;
    }

    if (count <= 3)
        return TRUE;

    return FALSE;
}

int sub_08079AF0(void)
{
    return FALSE;
}

void sub_08079AF4(void)
{
    int pid;

    EndPlayerPhaseSideWindows();

    pid = gPlaySt.chapterModeIndex == CHAPTER_MODE_ELIWOOD ? 1 : 2;

    GeneratePromotionBattle(GetUnitFromCharId(pid), 0);
}

int sub_08079B1C(void)
{
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD)
            continue;

        if (unit->pCharacterData->number != 0x28)
            continue;

        if (unit->level >= 20)
            return TRUE;

        break;
    }

    return FALSE;
}

void sub_08079BAC(void);

void sub_08079B5C(void)
{
    int i;

    sub_08079BAC();

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD)
            continue;

        if (unit->state & US_UNAVAILABLE)
            continue;

        if (unit->pCharacterData->number != 0x28)
            continue;

        UnitLevelUp(unit);
        SetFlag(0x90);
        break;
    }
}

void sub_08079BAC(void)
{
    struct Trap * trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; trap++)
    {
        if (trap->type == 0xC)
        {
            RemoveLightRune(trap);
            trap--;
        }
    }
}

void sub_08079BD4(void)
{
    SoftReset(0xFE);
}

int sub_08079BE0(void)
{
    if (gpKeySt->pressed & A_BUTTON)
        return FALSE;

    return TRUE;
}

void sub_08079BFC(void)
{
    SoftReset(0xFE);
}

int sub_08079C08(void)
{
    if (gpKeySt->pressed & A_BUTTON)
        return TRUE;

    return FALSE;
}

void sub_08079C24(void)
{
    SetVisionWithFade(0);
}

void sub_08079C30(void)
{
    SetGold(GetGold() + 5000);
}

void sub_08079C48(int amount)
{
    if (GetGold() >= amount)
        SetGold(GetGold() - amount);
}

void sub_08079C64(struct Unit * unit)
{
    if (unit->maxHP > 0)
        unit->maxHP--;

    if (unit->pow > 0)
        unit->pow--;

    if (unit->skl > 0)
        unit->skl--;

    if (unit->spd > 0)
        unit->spd--;

    if (unit->def > 0)
        unit->def--;

    if (unit->res > 0)
        unit->res--;

    if (unit->lck > 0)
        unit->lck--;
}

void sub_08079CCC(u8 pid)
{
    sub_08079C64(GetUnitFromCharId(pid));
}

s8 IsPidBlueDeployed(u8 pid)
{
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_UNAVAILABLE)
            continue;

        if (unit->pCharacterData->number == pid)
            return TRUE;
    }

    return FALSE;
}

s8 sub_08079D20(void)
{
    return IsPidBlueDeployed(0x09);
}

s8 sub_08079D30(void)
{
    return IsPidBlueDeployed(0x28);
}

s8 IsPidBlue(u8 pid)
{
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD)
            continue;

        if (unit->pCharacterData->number == pid)
            return TRUE;
    }

    return FALSE;
}

s8 sub_08079D7C(void) { return IsPidBlue(0x1A); }
s8 sub_08079D8C(void) { return IsPidBlue(0x0E); }
s8 sub_08079D9C(void) { return IsPidBlue(0x28); }
s8 sub_08079DAC(void) { return IsPidBlue(0x25); }
s8 sub_08079DBC(void) { return IsPidBlue(0x23); }
s8 sub_08079DCC(void) { return IsPidBlue(0x14); }
s8 sub_08079DDC(void) { return IsPidBlue(0x24); }
s8 sub_08079DEC(void) { return IsPidBlue(0x1B); }
s8 sub_08079DFC(void) { return IsPidBlue(0x08); }
s8 sub_08079E0C(void) { return IsPidBlue(0x11); }
s8 sub_08079E1C(void) { return IsPidBlue(0x13); }
s8 sub_08079E2C(void) { return IsPidBlue(0x1C); }
s8 sub_08079E3C(void) { return IsPidBlue(0x17); }
s8 sub_08079E4C(void) { return IsPidBlue(0x2F); }
s8 sub_08079E5C(void) { return IsPidBlue(0x18); }
s8 sub_08079E6C(void) { return IsPidBlue(0x30); }
s8 sub_08079E7C(void) { return IsPidBlue(0x0D); }
s8 sub_08079E8C(void) { return IsPidBlue(0x2E); }
s8 sub_08079E9C(void) { return IsPidBlue(0x1D); }
s8 sub_08079EAC(void) { return IsPidBlue(0x31); }
s8 sub_08079EBC(void) { return IsPidBlue(0x33); }
s8 sub_08079ECC(void) { return IsPidBlue(0x15); }
s8 sub_08079EDC(void) { return IsPidBlue(0x0F); }
s8 sub_08079EEC(void) { return IsPidBlue(0x36); }
s8 sub_08079EFC(void) { return IsPidBlue(0x22); }
s8 sub_08079F0C(void) { return IsPidBlue(0x27); }

s8 sub_08079F1C(u8 pid)
{
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->pCharacterData->number == pid)
            return TRUE;
    }

    return FALSE;
}

s8 sub_08079F4C(void) { return sub_08079F1C(0x11); }
s8 sub_08079F5C(void) { return sub_08079F1C(0x13); }
s8 sub_08079F6C(void) { return sub_08079F1C(0x1B); }

s8 AreAnyEnemyUnitDead(void)
{
    int i;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD)
            continue;

        return TRUE;
    }

    return FALSE;
}

u16 GetDeadEnemyAmount(void)
{
    u16 count = 0;
    int i;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD)
            continue;

        count++;
    }

    return count;
}

int sub_08079FE8(void)
{
    return AreAnyEnemyUnitDead() == FALSE;
}

s8 sub_0807A000(u8 pid)
{
    int i;

    for (i = FACTION_GREEN + 1; i < FACTION_RED + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD)
            continue;

        if (unit->pCharacterData->number == pid)
            return TRUE;
    }

    return FALSE;
}

int sub_0807A03C(void)
{
    int count = 0;
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_DEAD | US_NOT_DEPLOYED))
            continue;

        if (unit->state & US_UNSELECTABLE)
            continue;

        count++;
    }

    return count;
}

int sub_0807A078(void)
{
    int i;

    for (i = FACTION_GREEN + 1; i < FACTION_GREEN + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_UNSELECTABLE)
            continue;

        return FALSE;
    }

    return TRUE;
}

s8 sub_0807A0AC(void) { return sub_0807A000(0x45); }
s8 sub_0807A0BC(void) { return sub_0807A000(0x3B); }
s8 sub_0807A0CC(void) { return sub_0807A000(0x7F); }
s8 sub_0807A0DC(void) { return sub_0807A000(0x80); }
s8 sub_0807A0EC(void) { return sub_0807A000(0x81); }
s8 sub_0807A0FC(void) { return sub_0807A000(0x82); }
s8 sub_0807A10C(void) { return sub_0807A000(0x24); }
s8 sub_0807A11C(void) { return sub_0807A000(0x20); }
s8 sub_0807A12C(void) { return sub_0807A000(0x2B); }
s8 sub_0807A13C(void) { return sub_0807A000(0x37); }
s8 sub_0807A14C(void) { return sub_0807A000(0x11); }
s8 sub_0807A15C(void) { return sub_0807A000(0x13); }
s8 sub_0807A16C(void) { return sub_0807A000(0x08); }
s8 sub_0807A17C(void) { return sub_0807A000(0x4C); }
s8 sub_0807A18C(void) { return sub_0807A000(0x65); }
s8 sub_0807A19C(void) { return sub_0807A000(0x66); }
s8 sub_0807A1AC(void) { return sub_0807A000(0xA3); }

s8 sub_0807A1BC(void) { return ArePidsAtMaxSupport(0x01, 0x2D); }
s8 sub_0807A1D0(void) { return ArePidsAtMaxSupport(0x01, 0x25); }
s8 sub_0807A1E4(void) { return ArePidsAtMaxSupport(0x01, 0x1E); }
s8 sub_0807A1F8(void) { return ArePidsAtMaxSupport(0x02, 0x2D); }
s8 sub_0807A20C(void) { return ArePidsAtMaxSupport(0x02, 0x31); }
s8 sub_0807A220(void) { return ArePidsAtMaxSupport(0x02, 0x1F); }

int sub_0807A234(u8 pid, int faction)
{
    int count = 0;
    int i;

    for (i = faction + 1; i < faction + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD)
            continue;

        if (unit->pCharacterData->number == pid)
            count++;
    }

    return count;
}

int sub_0807A278(int faction)
{
    int count = 0;
    int i;

    for (i = faction + 1; i < faction + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD)
            continue;

        count++;
    }

    return count;
}

int sub_0807A2B4(void)
{
    int ret = FALSE;

    if (gPlaySt.chapterTurnNumber > 20)
        ret = TRUE;

    return ret;
}

int sub_0807A2C8(void)
{
    int ret = FALSE;

    if (gPlaySt.chapterTurnNumber > 25)
        ret = TRUE;

    return ret;
}

int sub_0807A2DC(void)
{
    int ret = FALSE;

    if (gPlaySt.chapterTurnNumber > 30)
        ret = TRUE;

    return ret;
}

int sub_0807A2F0(void)
{
    int ret = FALSE;

    if (gPlaySt.faction == FACTION_BLUE)
        ret = TRUE;

    return ret;
}

bool sub_0807A304(void)
{
    int ret = FALSE;

    if (gPlaySt.faction == FACTION_RED)
        ret = TRUE;

    return ret;
}

int sub_0807A318(void)
{
    return !((UNIT_CATTRIBUTES(gActiveUnit) >> 14) & 1);
}

int sub_0807A334(void)
{
    return GetGold() > 9999;
}

int sub_0807A350(void)
{
    return GetGold() > 7999;
}

int sub_0807A36C(void)
{
    return GetGold() > 5999;
}

int sub_0807A388(void)
{
    return GetGold() > 4999;
}

int sub_0807A3A4(void)
{
    return GetTalkChoiceResult() == 1;
}

int sub_0807A3B8(void)
{
    return gPlaySt.tact_enabled;
}

bool IsTactFemale(void)
{
    return gPlaySt.tact_gender;
}

s8 sub_0807A3D8(void)
{
    return CheckFlag(0x9B);
}

int IsTutorialDisabled(void)
{
    return gPlaySt.cfgController;
}

int GmUnitFadeExists(void)
{
    int ret = CheckLinkedToFE6();

    if (ret)
        ret = TRUE;

    return ret;
}

int sub_0807A408(void)
{
    if (GetDeadEnemyAmount() >= 50)
        return TRUE;

    return FALSE;
}

int sub_0807A420(void)
{
    int ret = FALSE;

    if (gPlaySt.chapterModeIndex == CHAPTER_MODE_HECTOR)
        ret = TRUE;

    return ret;
}

int sub_0807A434(void)
{
    return GetUnitCurrentHp(gActiveUnit) == 0;
}

int sub_0807A450(void)
{
    return FALSE;
}

void sub_0807A454(void)
{
    if ((gPlaySt.chapterStateBits & PLAY_FLAG_TUTORIAL) || !gPlaySt.cfgDisableBgm)
        FadeBgmOut(4);
}

int sub_0807A47C(void)
{
    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
        return TRUE;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_TUTORIAL)
        return TRUE;

    return FALSE;
}

int sub_0807A49C(void)
{
    int ret = FALSE;

    if (gActionSt.id == 1)
        ret = TRUE;

    return ret;
}

void sub_0807A4B0(void)
{
    SetkeyStIgnoredMask(0);
}

void sub_0807A4BC(void)
{
    NewKeyStSetter(2);
}

void sub_0807A4C8(void)
{
    Proc_Start(ProcScr_08CA74F0, PROC_TREE_4);
}

void ShinningEventCursor(int lo, int hi, int cur)
{
    int var = Interpolate(1, lo, hi, cur, 8);
    CpuFastCopy(Pal_EventCursorShinning, PAL_OBJ(0x2), 0x20);
    EfxPalWhiteInOut(gPal, 0x12, 1, var);
    EnablePalSync();
}

void sub_0807A52C(struct ProcTutorialCursor * proc)
{
    proc->timer = 0;
    proc->fadeDir = 0;

    Proc_EndEach(ProcScr_TutorialCursorWatcher);
    ApplyPaletteExt(Pal_EventCursorShinning, 0x240, 0x20);
}

void sub_0807A558(struct ProcTutorialCursor * proc)
{
    int i;
    int x, y;

    if (proc->list == NULL)
    {
        for (i = 0; i < gSelectTargetCount; i++)
        {
            struct SelectTarget * target = GetTarget(i);

            x = target->x * 16 - gBmSt.camera.x;
            y = target->y * 16 - gBmSt.camera.y;

            PutOamHiRam((x + 0x200) & 0x1FF, (y + 0x100) & 0xFF, Obj_EventShinningCursor, 0x2822);
        }
    }
    else if (proc->list == (u8 const *) 1)
    {
        x = gActiveUnit->xPos * 16 - gBmSt.camera.x;
        y = gActiveUnit->yPos * 16 - gBmSt.camera.y;

        PutOamHiRam((x + 0x200) & 0x1FF, (y + 0x100) & 0xFF, Obj_EventShinningCursor, 0x2822);
    }
    else
    {
        u8 const * list = proc->list;

        for (i = 0; list[i * 4 + 0] != 0xFF; i++)
        {
            x = list[i * 4 + 0] * 16 - gBmSt.camera.x;
            y = list[i * 4 + 1] * 16 - gBmSt.camera.y;

            PutOamHiRam((x + 0x200) & 0x1FF, (y + 0x100) & 0xFF, Obj_EventShinningCursor, 0x2822);
        }
    }

    if ((GetGameTime() & 1) == 0)
    {
        if (proc->fadeDir != 0)
        {
            ShinningEventCursor(0x10, 0, proc->timer);

            if (++proc->timer > 8)
            {
                proc->timer = 0;
                proc->fadeDir = 0;
            }
        }
        else
        {
            ShinningEventCursor(0, 0x10, proc->timer);

            if (++proc->timer > 8)
            {
                proc->timer = 0;
                proc->fadeDir = 1;
            }
        }
    }
}

void StartTutorialCursors(u8 const * list)
{
    struct ProcTutorialCursor * proc;
    struct SelectTarget * target;

    sub_080314AC(gActiveUnit);
    gSelectTargetCount = CountTargets();

    if (list == NULL)
    {
        if (gSelectTargetCount != 0)
        {
            proc = Proc_Start(ProcScr_TutorialCursor, PROC_TREE_3);
            proc->list = list;

            target = GetTarget(0);
            EnsureCameraOntoPosition(NULL, target->x, target->y);
            SetMapCursorPosition(gActiveUnit->xPos, gActiveUnit->yPos);
        }
    }
    else
    {
        proc = Proc_Start(ProcScr_TutorialCursor, PROC_TREE_3);
        proc->list = list;

        SetMapCursorPosition(gActiveUnit->xPos, gActiveUnit->yPos);
    }
}

void sub_0807A764(struct ProcTutorialCursor * proc)
{
    proc->timer = 15;
}

void sub_0807A76C(struct ProcTutorialCursor * proc)
{
    if (--proc->timer == 0 || (!BoxTalkActive() && (gpKeySt->pressed & R_BUTTON)))
    {
        Proc_EndEach(ProcScr_TutorialCursor);
        Proc_Break(proc);
    }
}

bool sub_0807A7B4(void)
{
    bool active = BoxTalkActive();

    if (!active)
        Proc_Start(ProcScr_TutorialCursorWatcher, PROC_TREE_3);

    return active;
}

void HideAllAlliesExceptLeader(void)
{
    struct Unit * leader = GetUnitFromCharId(GetPlayerLeaderUnitId());
    int x = leader->xPos;
    int y = leader->yPos;
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit == leader)
            continue;

        if (unit->xPos != x || unit->yPos != y)
            continue;

        if (unit->state & (US_RESCUING | US_RESCUED))
            continue;

        unit->state |= US_HIDDEN | US_NOT_DEPLOYED;
    }

    RefreshUnitSprites();
}

void HideAllUnits(void)
{
    int i;

    for (i = 1; i < 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD)
            continue;

        unit->state |= US_HIDDEN;
    }
}

void sub_0807A868(void)
{
    int i;

    for (i = FACTION_GREEN + 1; i < FACTION_RED + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (UNIT_IS_VALID(unit))
            ClearUnit(unit);
    }
}

void sub_0807A890(void)
{
    int i;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (UNIT_IS_VALID(unit))
            ClearUnit(unit);
    }
}

void sub_0807A8B8(void)
{
    int i, j;

    for (i = FACTION_GREEN + 1; i < FACTION_RED + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (UNIT_IS_VALID(unit))
            ClearUnit(unit);
    }

    for (j = 1; j < 0x40; j++)
    {
        struct Unit * unit = GetUnit(j);

        if (!UNIT_IS_VALID(unit))
            continue;

        SetUnitHp(unit, GetUnitMaxHp(unit));
        SetUnitStatus(unit, UNIT_STATUS_NONE);

        unit->torchDuration = 0;
        unit->barrierDuration = 0;

        unit->state &= 0x0671E00C;
        unit->xPos = -1;
        unit->state |= US_HIDDEN;

        unit->rescue = 0;
    }

    RefreshEntityMaps();
    EndAllMus();
}

void sub_0807A938(struct ProcEventMapLock * proc)
{
    if (proc->locked == -1)
    {
        LockBmDisplay();
        LockMus();
        proc->locked = 0;
    }
}

void ImmediateDisplayMap(struct ProcEventMapLock * proc)
{
    if (proc->locked != -1)
    {
        proc->locked = -1;
        RefreshBMapGraphics();
        UnlockBmDisplay();
        ReleaseMus();
    }
    else
    {
        RefreshBMapGraphics();
    }
}

void sub_0807A98C(struct ProcEventMapLock * proc)
{
    if (proc->locked != -1)
    {
        proc->locked = -1;
        InitMoreBMapGraphics();
        UnlockBmDisplay();
        ReleaseMus();
    }
    else
    {
        InitMoreBMapGraphics();
    }
}

void TryLockParentProc(ProcPtr proc)
{
    TryLockProc(((struct Proc *) proc)->proc_parent);
}

void TryUnlockParentProc(ProcPtr proc)
{
    TryUnlockProc(((struct Proc *) proc)->proc_parent);
}

void sub_0807A9D4(void)
{
    InitBgs(NULL);
    SetDispEnable(0, 0, 0, 0, 0);
}

void sub_0807AA04(void)
{
    SwapUnitStats(GetUnitFromCharId(0x26), GetUnitFromCharId(0x25));
}

void sub_0807AA24(ProcPtr proc)
{
    StartScreenFlashing(-1, 2, 0x20, 4, 0x180, 0x180, 0x180, proc);
}

void sub_0807AA4C(ProcPtr proc)
{
    StartScreenFlashing(-1, 2, 0x20, 4, 0x200, 0x140, 0x140, proc);
}

void sub_0807AA74(struct ProcEventMapLock * proc)
{
    proc->unk_4D = 1;

    SetBlendDarken(0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);
}

void sub_0807AAC0(void)
{
    SetDispEnable(0, 0, 0, 0, 0);
}

void sub_0807AAE4(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
}
