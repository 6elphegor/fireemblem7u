#include "gbafe.h"

// not yet declared in headers
u8 GetSpellAssocFacing(u16 item);
u8 GetWeaponAnimActorCount(u16 item);
struct ProcCmd * GetWeaponAnimManimSpecialScr(u16 item);

extern u8 const gManimActorLayerLut[];
extern struct ProcCmd CONST_DATA ProcScr_MuDeathFade[];
extern struct ProcCmd CONST_DATA ProcScr_PoisonDmgMapEffect[];
extern struct ProcCmd CONST_DATA ProcScr_CritAtkMapEffect[];
extern struct ProcCmd CONST_DATA ProcScr_ManimEnd[];

CONST_DATA struct ProcCmd ProcScr_ManimPoisonDmg[] = {
    PROC_CALL(LockGame),
    PROC_CALL(Manim_MoveCameraOntoSubject),
    PROC_SLEEP(2),
    PROC_CALL(Manim_InitInfoBox),
    PROC_SLEEP(15),
    PROC_START_CHILD_BLOCKING(ProcScr_PoisonDmgMapEffect),
    PROC_SLEEP(1),
    PROC_JUMP(ProcScr_ManimEnd),
};

CONST_DATA struct ProcCmd ProcScr_ManimCritAtk[] = {
    PROC_CALL(LockGame),
    PROC_CALL(Manim_MoveCameraOntoSubject),
    PROC_SLEEP(2),
    PROC_CALL(Manim_InitInfoBox),
    PROC_SLEEP(15),
    PROC_START_CHILD_BLOCKING(ProcScr_CritAtkMapEffect),
    PROC_SLEEP(1),
    PROC_JUMP(ProcScr_ManimEnd),
};

CONST_DATA struct ProcCmd ProcScr_ManimSteal[] = {
    PROC_CALL(LockGame),
    PROC_CALL(Manim_MoveCameraOntoTarget),
    PROC_SLEEP(2),
    PROC_CALL(Manim_MoveCameraOntoSubject),
    PROC_SLEEP(2),
    PROC_SLEEP(20),
    PROC_CALL(Manim_BeginSubjectFastAnim),
    PROC_CALL(Manim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(1),
    PROC_CALL(Manim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(1),
    PROC_CALL(Manim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(1),
    PROC_CALL(Manim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(1),
    PROC_CALL(Manim_PlayStealSe),
    PROC_SLEEP(20),
    PROC_CALL(Manim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(1),
    PROC_CALL(Manim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(1),
    PROC_CALL(Manim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(1),
    PROC_CALL(Manim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(20),
    PROC_JUMP(ProcScr_ManimEnd),
};

CONST_DATA struct ProcCmd ProcScr_ManimDance[] = {
    PROC_CALL(LockGame),
    PROC_CALL(Manim_MoveCameraOntoSubject),
    PROC_SLEEP(2),
    PROC_SLEEP(20),
    PROC_CALL(Manim_StartDanceAnim),
    PROC_SLEEP(80),
    PROC_CALL(StartDanceringAnim),
    PROC_SLEEP(10),
    PROC_CALL(Manim_StopDanceAnim),
    PROC_SLEEP(20),
    PROC_JUMP(ProcScr_ManimEnd),
};

CONST_DATA struct ProcCmd ProcScr_ManimBattle[] = {
    PROC_CALL(LockGame),
    PROC_CALL(Manim_PrepareBattleTalk),
    PROC_SLEEP(1),
    PROC_CALL(Manim_MoveCameraOntoSubject),
    PROC_SLEEP(2),
    PROC_CALL(Manim_CallBattleQuoteEvents),
    PROC_WHILE(IsEventRunning),
    PROC_SLEEP(5),
    PROC_CALL(SetBattleMuPalette),
    PROC_CALL(InitManimActorFacings),
    PROC_SLEEP(1),
    PROC_CALL(Manim_InitInfoBox),
    PROC_SLEEP(15),
    PROC_LABEL(0),
    PROC_REPEAT(Manim_PrepareNextBattleRound),
    PROC_CALL(Manim_DisplayRoundAnim),
    PROC_SLEEP(1),
    PROC_CALL(Manim_ShowPoisonEffectIfAny),
    PROC_SLEEP(1),
    PROC_SLEEP(5),
    PROC_GOTO(0),
};

CONST_DATA struct ProcCmd ProcScr_ManimEnd[] = {
    PROC_CALL(Manim_DisplayDeathQuote),
    PROC_WHILE(IsEventRunning),
    PROC_CALL(Manim_DisplayDeathFade),
    PROC_WHILE_EXISTS(ProcScr_MuDeathFade),
    PROC_CALL(EndManimInfoWindow),
    PROC_SLEEP(1),
    PROC_CALL(Manim_StoleItemPopup),
    PROC_YIELD,
    PROC_CALL(Manim_DisplayExpBar),
    PROC_YIELD,
    PROC_CALL(Manim_WeaponBrokePopup),
    PROC_SLEEP(8),
    PROC_CALL(Manim_WeaponLevelGainedPopup),
    PROC_YIELD,
    PROC_CALL(Manim_MoveCameraOntoSubject),
    PROC_SLEEP(2),
    PROC_CALL(UnlockGame),
    PROC_CALL(Manim_Finish),
    PROC_END,
};

void InitManimActor(int actor, struct BattleUnit * bu, struct Unit * unit)
{
    if (!bu)
        return;

    gManimSt.actor[actor].unit = unit;
    gManimSt.actor[actor].bu = bu;
    gManimSt.actor[actor].mu = StartMu(unit);

    gManimSt.actor[actor].mu->sprite_anim->clock = 0;
    gManimSt.actor[actor].mu->sprite_anim->clock_interval_q8 = 0;

    if (bu->terrainId == TERRAIN_WALL_BREAKABLE || bu->terrainId == TERRAIN_SNAG)
        HideMu(gManimSt.actor[actor].mu);
}

void SetManimActorFacing(int actor, int target, int facing)
{
    int mu_facing;

    switch (facing)
    {
    case 0:
        mu_facing = GetFacingFromTo(
            gManimSt.actor[actor].unit->xPos, gManimSt.actor[actor].unit->yPos,
            gManimSt.actor[target].unit->xPos, gManimSt.actor[target].unit->yPos);

        SetMuFacing(gManimSt.actor[actor].mu, mu_facing);
        break;

    case 1:
        SetMuDefaultFacing(gManimSt.actor[actor].mu);
        break;

    case 2:
        mu_facing = GetFacingFromTo(
            gManimSt.actor[actor].unit->xPos, gManimSt.actor[actor].unit->yPos, 0, 0);

        SetMuFacing(gManimSt.actor[actor].mu, mu_facing);
    }
}

void InitManimActorFacings(void)
{
    int facing = GetSpellAssocFacing(gManimSt.actor[0].bu->weaponBefore);
    SortManimActorLayers();

    switch (gManimSt.main_actor_count)
    {
    case 2:
        if (gBattleHitArray[0].attributes & BATTLE_HIT_ATTR_TATTACK)
        {
            SetManimActorFacing(2, 1, facing);
            SetManimActorFacing(3, 1, facing);
        }

        SetManimActorFacing(1, 0, facing);

        // fallthrough

    case 1:
        SetManimActorFacing(0, 1, facing);
        break;
    }
}

void SortManimActorLayers(void)
{
    u8 array[4];
    u8 tmp;
    int i, j;
    int swap;
    int count = gManimSt.main_actor_count;

    switch (gManimSt.main_actor_count)
    {
    case 2:
        if (gBattleHitArray[0].attributes & BATTLE_HIT_ATTR_TATTACK)
            count += 2;
        break;

    case 1:
        break;
    }

    for (i = 0; i < count; ++i)
        array[i] = i;

    for (i = 0; i < count - 1; ++i)
    {
        for (j = i + 1; j < count; ++j)
        {
            swap = FALSE;

            if (gManimSt.actor[array[i]].unit->yPos == gManimSt.actor[array[j]].unit->yPos)
            {
                if (gManimSt.actor[array[i]].unit->xPos >= gManimSt.actor[array[j]].unit->xPos)
                    swap++;
            }
            else if (gManimSt.actor[array[i]].unit->yPos >= gManimSt.actor[array[j]].unit->yPos)
                swap++;

            if (swap)
            {
                tmp = array[i];
                array[i] = array[j];
                array[j] = tmp;
            }
        }
    }

    for (i = 0; i < count; ++i)
        gManimSt.actor[array[i]].mu->sprite_anim->layer = gManimActorLayerLut[i];
}

void BeginMapAnimForPoisonDmg(void)
{
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    gManimSt.hp_bar_busy = 0;
    gManimSt.manim_kind = 0;
    gManimSt.main_actor_count = 1;

    gManimSt.hit_it = gBattleHitArray;
    Manim_AdvanceBattleRound();

    InitManimActors(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_ManimPoisonDmg, PROC_TREE_3);
}

void BeginMapAnimForCritAtk(void)
{
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    gManimSt.hp_bar_busy = 0;
    gManimSt.manim_kind = 0;
    gManimSt.main_actor_count = 1;

    gManimSt.hit_it = gBattleHitArray;
    Manim_AdvanceBattleRound();

    InitManimActors(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_ManimCritAtk, PROC_TREE_3);
}

void BeginMapAnimForSteal(void)
{
    gBattleActor.weaponBefore = ITEM_SWORD_IRON;

    gManimSt.hp_bar_busy = 0;
    gManimSt.manim_kind = 1;
    gManimSt.main_actor_count = 2;

    gManimSt.attacker_actor = 0;
    gManimSt.defender_actor = 1;

    InitManimActors(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_ManimSteal, PROC_TREE_3);
}

void BeginMapAnimForDance(void)
{
    gBattleActor.weaponBefore = ITEM_STAFF_FORTIFY;

    gManimSt.hp_bar_busy = 0;
    gManimSt.manim_kind = 2;
    gManimSt.main_actor_count = 1;

    gManimSt.attacker_actor = 0;
    gManimSt.defender_actor = 0;

    InitManimActors(&gBattleActor, &gBattleTarget, gBattleHitArray);
    Proc_Start(ProcScr_ManimDance, PROC_TREE_3);
}

void StartBattleManim(void)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REFRESH | BATTLE_CONFIG_DANCERING))
    {
        BeginMapAnimForDance();
        return;
    }

    gManimSt.hp_bar_busy = 0;
    gManimSt.manim_kind = 0;

    InitManimHits(&gBattleActor, &gBattleTarget, gBattleHitArray);
    InitManimActors(&gBattleActor, &gBattleTarget, gBattleHitArray);

    Proc_Start(ProcScr_ManimBattle, PROC_TREE_3);
}

void InitManimHits(struct BattleUnit * actor, struct BattleUnit * target, struct BattleHit * hit)
{
    gManimSt.main_actor_count = GetWeaponAnimActorCount(actor->weaponBefore);
    gManimSt.hit_it = hit;
    gManimSt.special_proc_scr = GetWeaponAnimManimSpecialScr(actor->weaponBefore);
}

void InitManimActors(struct BattleUnit * actor, struct BattleUnit * target, struct BattleHit * hit)
{
    int i;

    InitManimActor(0, actor, &actor->unit);

    if (gManimSt.main_actor_count > 1)
    {
        HideUnitSprite(&gBattleTarget.unit);
        InitManimActor(1, target, &target->unit);
    }

    if (gBattleHitArray[0].attributes & BATTLE_HIT_ATTR_TATTACK)
    {
        InitManimActor(2, actor, gBattleStats.taUnitA);
        InitManimActor(3, actor, gBattleStats.taUnitB);

        HideUnitSprite(gBattleStats.taUnitA);
        HideUnitSprite(gBattleStats.taUnitB);
    }

    InitManimActorFacings();

    for (i = 0; i < gManimSt.main_actor_count; ++i)
    {
        gManimSt.actor[i].hp_cur = gManimSt.actor[i].bu->hpInitial;
        gManimSt.actor[i].hp_max = GetUnitMaxHp(gManimSt.actor[i].unit);
    }

    SetBlendNone();
}

int GetFacingFromTo(int x_from, int y_from, int x_to, int y_to)
{
    if (ABS(x_to - x_from) * 2 < ABS(y_to - y_from))
    {
        if (y_from < y_to)
            return 2;
        else
            return 3;
    }
    else
    {
        if (x_from < x_to)
            return 1;
        else
            return 0;
    }
}
