#include "gbafe.h"
#include "gbafe/bmusailment.h"

// Terrain healing, poison and trap damage displays (FE8U: bmusailment.c)

struct MuProc;

void DropRescueOnDeath(ProcPtr proc, struct Unit * unit);
void BattleInitItemEffect(struct Unit * actor, int itemSlot);
void BeginBattleAnimations(void);
void BeginMapAnimForPoisonDmg(void); // BeginMapAnimForPoisonDmg
void BeginMapAnimForCritAtk(void); // BeginMapAnimForCritAtk
void StartMuDeathFade(struct MuProc * mu);
void PutBlendWindowUnitSprite(int layer, int x, int y, int oam2, struct Unit * unit);
bool CheckForWaitEvents(void);
void RunWaitEvents(void);
void StartFireTrapAnim1(ProcPtr parent, int x, int y);
void StartGasTrapAnim(ProcPtr parent, int x, int y, int facing);
void StartArrowTrapAnim(ProcPtr parent, int x);
void StartShowMapChangeAnim(ProcPtr parent, int x, int y);

extern u8 CONST_DATA Img_StatusHealEffect[];
extern u16 CONST_DATA Pal_StatusHealEffect[];
extern u8 CONST_DATA Tsa_StatusHealEffect[];
extern struct ProcCmd CONST_DATA ProcScr_StatusHealEffect[];

void ApplyHazardHealing(ProcPtr proc, struct Unit * unit, int hp, int status)
{
    if (status >= 0)
        SetUnitStatus(unit, status);

    AddUnitHp(unit, hp);

    if (GetUnitCurrentHp(unit) <= 0)
        UnitKill(unit);

    DropRescueOnDeath(proc, unit);

    return;
}

void RenderMapForFogFadeIfUnitDied(struct Unit * unit)
{
    if ((GetUnitCurrentHp(unit) == 0) && (gPlaySt.chapterVisionRange != 0))
        RenderMapForFade();

    return;
}

void BeginUnitHealAnim(struct Unit * unit, int hp)
{
    BattleInitItemEffect(unit, -1);

    gBattleActor.weapon = ITEM_VULNERARY;
    gBattleActor.weaponBefore = ITEM_VULNERARY;

    AddUnitHp(&gBattleActor.unit, hp);

    gBattleHitIterator->hpChange = gBattleActor.hpInitial - gBattleActor.unit.curHP;

    BattleHitTerminate();
    BeginBattleAnimations();

    return;
}

void BeginUnitPoisonDamageAnim(struct Unit * unit, int damage)
{
    BattleInitItemEffect(unit, -1);

    AddUnitHp(&gBattleActor.unit, -damage);

    if (gBattleActor.unit.curHP < 0)
        gBattleActor.unit.curHP = 0;

    gBattleHitIterator->hpChange = gBattleActor.hpInitial - gBattleActor.unit.curHP;

    if (gBattleActor.unit.curHP == 0)
        gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;

    BattleHitTerminate();

    BeginMapAnimForPoisonDmg();

    RenderMapForFogFadeIfUnitDied(unit);

    return;
}

void BeginUnitCritDamageAnim(struct Unit * unit, int damage)
{
    BattleInitItemEffect(unit, -1);

    AddUnitHp(&gBattleActor.unit, -damage);

    if (gBattleActor.unit.curHP < 0)
        gBattleActor.unit.curHP = 0;

    gBattleHitIterator->hpChange = gBattleActor.hpInitial - gBattleActor.unit.curHP;

    if (gBattleActor.unit.curHP == 0)
    {
        gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_CRIT;
        gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;
    }

    BattleHitTerminate();

    BeginMapAnimForCritAtk();

    RenderMapForFogFadeIfUnitDied(unit);

    return;
}

void KillAllRedUnits_Init(struct BmusAilmentProc * proc)
{
    int i;

    BeginTargetList(0, 0);

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_UNAVAILABLE)
            continue;

        EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
    }

    proc->unk_4C = 0;

    return;
}

void KillAllRedUnits_Loop(struct BmusAilmentProc * proc)
{
    struct Unit * unit;
    int x;
    int y;

    if (proc->unk_4C == CountTargets())
    {
        Proc_Goto(proc, 99);
        return;
    }

    unit = GetUnit(GetTarget(proc->unk_4C)->uid);

    HideUnitSprite(unit);
    UnitKill(unit);

    x = unit->xPos * 16 - gBmSt.camera.x;
    y = unit->yPos * 16 - gBmSt.camera.y;

    if ((x < 0) || (x > DISPLAY_WIDTH) || (y < 0) || (y > DISPLAY_HEIGHT))
    {
        proc->unk_4C++;
        Proc_Goto(proc, 0);
    }
    else
    {
        StartMuDeathFade(StartMu(unit));
        proc->unk_4C++;
        Proc_Break(proc);
    }

    return;
}

void StatusHealEffect_OverlayBg_Init(void)
{
    int i;
    u16 * src;
    u16 * dst;

    ClearUi();

    Decompress(Img_StatusHealEffect, (u8 *) BG_VRAM + 0x5000);
    ApplyPalette(Pal_StatusHealEffect, 3);

    TmApplyTsa_thm(gBg0Tm, Tsa_StatusHealEffect, 0x3280);

    src = gBg0Tm;
    dst = gBg0Tm + 0x80;
    for (i = 0; i < 7; dst += 0x80, i++)
        TmCopyRect_thm(src, dst, 2, 4);

    EnableBgSync(BG0_SYNC_BIT);

    return;
}

void StatusHealEffect_OverlayBg_Loop(void)
{
    SetBgOffset(0, gBmSt.camera.x - (gActiveUnit->xPos * 16), GetGameTime());

    return;
}

void StatusHealEffect_BlendedSprite_Init(struct BmusAilmentProc * proc)
{
    HideUnitSprite(gActiveUnit);

    gDispIo.disp_ct.win0_enable = 0;
    gDispIo.disp_ct.win1_enable = 0;
    gDispIo.disp_ct.objwin_enable = 1;

    gDispIo.win_ct.wout_enable_blend = 0;
    gDispIo.win_ct.wobj_enable_blend = 1;

    gDispIo.win_ct.wout_enable_bg0 = 0;
    gDispIo.win_ct.wout_enable_bg1 = 0;
    gDispIo.win_ct.wout_enable_bg2 = 0;
    gDispIo.win_ct.wout_enable_bg3 = 1;
    gDispIo.win_ct.wout_enable_obj = 1;

    gDispIo.win_ct.wobj_enable_bg0 = 1;
    gDispIo.win_ct.wobj_enable_bg1 = 0;
    gDispIo.win_ct.wobj_enable_bg2 = 0;
    gDispIo.win_ct.wobj_enable_bg3 = 1;
    gDispIo.win_ct.wobj_enable_obj = 1;

    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 0, 1);

    proc->unk_4C = 64;

    return;
}

void StatusHealEffect_BlendedSprite_Loop(struct BmusAilmentProc * proc)
{
    PutBlendWindowUnitSprite(
        4,
        gActiveUnit->xPos * 16 - gBmSt.camera.x,
        gActiveUnit->yPos * 16 - gBmSt.camera.y,
        0x2800,
        gActiveUnit);

    proc->unk_4C--;

    if (proc->unk_4C < 0)
        Proc_Break(proc);

    return;
}

void StatusHealEffect_BlendedSprite_Finish(void)
{
    ShowUnitSprite(gActiveUnit);
    return;
}

void StatusHealEffect_BlendSpriteAnim_InitIn(struct BmusAilmentProc * proc)
{
    proc->unk_4C = 15;
    proc->unk_2C = 0;
    proc->unk_34 = 1;

    return;
}

void StatusHealEffect_BlendSpriteAnim_InitOut(struct BmusAilmentProc * proc)
{
    proc->unk_4C = 15;
    proc->unk_2C = 16;
    proc->unk_34 = -1;

    return;
}

void StatusHealEffect_BlendSpriteAnim_Loop(struct BmusAilmentProc * proc)
{
    proc->unk_2C += proc->unk_34;

    SetBlendConfig(1, proc->unk_2C & 0xFF, 0x10, 0);

    proc->unk_4C--;

    if (proc->unk_4C < 0)
        Proc_Break(proc);

    return;
}

void StatusHealEffect_PalSpriteAnim_Init(struct BmusAilmentProc * proc)
{
    u16 * pal = NULL;

    switch (UNIT_FACTION(gActiveUnit))
    {
    case FACTION_BLUE:
        pal = &PAL_COLOR(0x10 + 12, 0);
        break;

    case FACTION_RED:
        pal = &PAL_COLOR(0x10 + 13, 0);
        break;

    case FACTION_GREEN:
        pal = &PAL_COLOR(0x10 + 14, 0);
        break;
    }

    ApplyPalette(pal, 0x12);

    proc->unk_4C = 0;

    return;
}

void StatusHealEffect_PalSpriteAnim_SetOutlineIntensity(struct BmusAilmentProc * proc, int intensity)
{
    if (intensity > 31)
        intensity = 31;

    if (intensity < 0)
        intensity = 0;

    PAL_COLOR(0x10 + 2, 15) = (intensity << 10) + (intensity << 5) + intensity;

    EnablePalSync();

    return;
}

void StatusHealEffect_PalSpriteAnim_LoopIn(struct BmusAilmentProc * proc)
{
    StatusHealEffect_PalSpriteAnim_SetOutlineIntensity(proc, proc->unk_4C);

    proc->unk_4C++;

    if (proc->unk_4C == 32)
        Proc_Break(proc);

    return;
}

void StatusHealEffect_PalSpriteAnim_LoopOut(struct BmusAilmentProc * proc)
{
    StatusHealEffect_PalSpriteAnim_SetOutlineIntensity(proc, proc->unk_4C);

    proc->unk_4C--;

    if (proc->unk_4C < 0)
        Proc_Break(proc);

    return;
}

void StatusHealEffect_Finish(void)
{
    ClearUi();

    gDispIo.disp_ct.win0_enable = 0;
    gDispIo.disp_ct.win1_enable = 0;
    gDispIo.disp_ct.objwin_enable = 0;

    SetBlendNone();

    gDispIo.win_ct.wout_enable_blend = 1;
    gDispIo.win_ct.wobj_enable_blend = 1;

    return;
}

void StartStatusHealEffect(struct Unit * unit, ProcPtr proc)
{
    gActiveUnit = unit;

    if (proc)
    {
        Proc_StartBlocking(ProcScr_StatusHealEffect, proc);
        PlaySoundEffect(0xAA);
        return;
    }

    Proc_StartBlocking(ProcScr_StatusHealEffect, PROC_TREE_3);
    return;
}

void TerrainHealDisplay_Init(struct BmusAilmentProc * proc)
{
    MakeTerrainHealTargetList(gPlaySt.faction);

    if (CountTargets() == 0)
        Proc_End(proc);
    else
        proc->unk_4C = 0;

    return;
}

void MassEffectDisplay_Check(struct BmusAilmentProc * proc)
{
    struct SelectTarget * target = GetTarget(proc->unk_4C);
    struct Unit * unit = GetUnit(target->uid);

    gActionSt.instigator = target->uid;

    if (proc->unk_4C == CountTargets())
    {
        Proc_End(proc);
        return;
    }

    if ((gPlaySt.chapterVisionRange != 0) && (gBmMapFog[unit->yPos][unit->xPos] == 0))
    {
        Proc_Goto(proc, 1);
    }
    else
    {
        if (GetUnitCurrentHp(unit) == 0)
            Proc_Goto(proc, 1);
    }

    return;
}

void MassEffectDisplay_Watch(struct BmusAilmentProc * proc)
{
    struct SelectTarget * target = GetTarget(proc->unk_4C);
    EnsureCameraOntoPosition(proc, target->x, target->y);

    return;
}

void TerrainHealDisplay_Display(struct BmusAilmentProc * proc)
{
    struct SelectTarget * target = GetTarget(proc->unk_4C);
    struct Unit * unit = GetUnit(target->uid);

    if (target->extra < 0)
    {
        StartStatusHealEffect(unit, proc);
    }
    else
    {
        HideUnitSprite(unit);
        BeginUnitHealAnim(unit, target->extra);
    }

    return;
}

void FinishDamageDisplay(void)
{
    EndAllMus();

    if (gBattleActor.unit.curHP != 0)
        ShowUnitSprite(GetUnit(gActionSt.instigator));

    return;
}

void TerrainHealDisplay_Next(struct BmusAilmentProc * proc)
{
    struct SelectTarget * target = GetTarget(proc->unk_4C);
    struct Unit * unit = GetUnit(target->uid);

    if (target->extra < 0)
        ApplyHazardHealing(proc, unit, 0, 0);
    else
        ApplyHazardHealing(proc, unit, target->extra, -1);

    proc->unk_4C++;

    return;
}

void PoisonDamageDisplay_Init(struct BmusAilmentProc * proc)
{
    MakePoisonDamageTargetList(gPlaySt.faction);
    sub_08024A88(4);

    if (CountTargets() == 0)
        Proc_End(proc);
    else
        proc->unk_4C = 0;

    return;
}

void PoisonDamageDisplay_Display(struct BmusAilmentProc * proc)
{
    struct SelectTarget * target = GetTarget(proc->unk_4C);
    struct Unit * unit = GetUnit(target->uid);

    HideUnitSprite(unit);

    BeginUnitPoisonDamageAnim(unit, target->extra);

    return;
}

void PoisonDamageDisplay_Next(struct BmusAilmentProc * proc)
{
    struct SelectTarget * target = GetTarget(proc->unk_4C);
    struct Unit * unit = GetUnit(target->uid);

    ApplyHazardHealing(proc, unit, -(target->extra), -1);

    proc->unk_4C++;

    if (GetUnitCurrentHp(GetUnit(gActionSt.instigator)) == 0)
    {
        if (CheckForWaitEvents() != 0)
            RunWaitEvents();
    }

    if (GetUnitCurrentHp(GetUnit(gActionSt.instigator)) < 1)
        RefreshUnitSprites();

    return;
}

void StatusDecayDisplay_Init(struct BmusAilmentProc * proc)
{
    if (CountTargets() == 0)
        Proc_End(proc);
    else
        proc->unk_4C = 0;

    return;
}

void StatusDecayDisplay_Display(struct BmusAilmentProc * proc)
{
    struct SelectTarget * target = GetTarget(proc->unk_4C);
    int status = GetUnit(gActionSt.instigator)->statusIndex;

    SetUnitStatus(GetUnit(gActionSt.instigator), UNIT_STATUS_NONE);

    switch (status)
    {
    case UNIT_STATUS_POISON:
    case UNIT_STATUS_SLEEP:
    case UNIT_STATUS_SILENCED:
    case UNIT_STATUS_BERSERK:
        StartStatusHealEffect(GetUnit(target->uid), proc);
        break;
    }

    return;
}

void StatusDecayDisplay_Next(struct BmusAilmentProc * proc)
{
    SetUnitStatus(GetUnit(gActionSt.instigator), 0);

    proc->unk_4C++;

    return;
}

void TrapDamageDisplay_Init(struct BmusAilmentProc * proc)
{
    proc->unk_4C = 0;
    return;
}

void TrapDamageDisplay_Check(struct BmusAilmentProc * proc)
{
    struct SelectTarget * target = GetTarget(proc->unk_4C);
    struct Unit * unit = GetUnit(target->uid);

    gActionSt.instigator = target->uid;

    if (proc->unk_4C == CountTargets())
    {
        Proc_End(proc);
        return;
    }

    if (target->uid == 0)
        return;

    if ((gPlaySt.chapterVisionRange != 0) && (gBmMapFog[unit->yPos][unit->xPos] == 0))
    {
        Proc_Goto(proc, 1);
    }
    else
    {
        if (GetUnitCurrentHp(unit) == 0)
            Proc_Goto(proc, 1);
    }

    return;
}

void TrapDamageDisplay_Watch(struct BmusAilmentProc * proc)
{
    struct SelectTarget * target = GetTarget(proc->unk_4C);

    if (target->uid != 0 || target->extra != 6)
        EnsureCameraOntoPosition(proc, target->x, target->y);

    return;
}

void TrapDamageDisplay_Display(struct BmusAilmentProc * proc)
{
    struct SelectTarget * target = GetTarget(proc->unk_4C);

    if (target->uid == 0)
    {
        switch (target->extra)
        {
        case TRAP_FIRETILE:
            StartFireTrapAnim1(proc, target->x, target->y);
            break;

        case 0x64:
            StartGasTrapAnim(proc, target->x, target->y, 3);
            break;

        case 0x65:
            StartGasTrapAnim(proc, target->x, target->y, 2);
            break;

        case 0x66:
            StartGasTrapAnim(proc, target->x, target->y, 0);
            break;

        case 0x67:
            StartGasTrapAnim(proc, target->x, target->y, 1);
            break;

        case TRAP_LIGHTARROW:
            StartArrowTrapAnim(proc, target->x);
            break;

        case TRAP_MAPCHANGE2:
            StartShowMapChangeAnim(proc, target->x, target->y);
            break;
        }

        proc->unk_4C++;

        Proc_Goto(proc, 0);
    }
    else
    {
        gActionSt.instigator = target->uid;
        gActionSt.extra = target->extra;

        HideUnitSprite(GetUnit(gActionSt.instigator));

        if (gActionSt.extra < 6)
            BeginUnitPoisonDamageAnim(GetUnit(gActionSt.instigator), target->extra);
        else
            BeginUnitCritDamageAnim(GetUnit(gActionSt.instigator), target->extra);
    }

    return;
}

void TrapDamageDisplay_Next(struct BmusAilmentProc * proc)
{
    struct SelectTarget * target = GetTarget(proc->unk_4C);
    struct Unit * unit = GetUnit(target->uid);

    if (target->extra < 6)
        ApplyHazardHealing(proc, unit, -(target->extra), UNIT_STATUS_POISON);
    else
        ApplyHazardHealing(proc, unit, -(target->extra), -1);

    if (GetUnitCurrentHp(unit) <= 0)
        RefreshUnitSprites();

    proc->unk_4C++;

    return;
}
