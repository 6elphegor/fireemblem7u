#pragma once

#include "global.h"
#include "proc.h"

// FE8U: bmusailment.c

struct BmusAilmentProc {
    PROC_HEADER;

    /* 29 */ u8 _pad1[0x2C - 0x29];
    /* 2C */ int unk_2C;
    /* 30 */ int _pad2;
    /* 34 */ int unk_34;
    /* 38 */ u8 _pad3[0x4C - 0x38];

    /* 4C */ s16 unk_4C;
};
PROC_SIZE_CHECK(struct BmusAilmentProc);

void ApplyHazardHealing(ProcPtr proc, struct Unit * unit, int hp, int status);
void RenderMapForFogFadeIfUnitDied(struct Unit * unit);
void BeginUnitHealAnim(struct Unit * unit, int hp);
void BeginUnitPoisonDamageAnim(struct Unit * unit, int damage);
void BeginUnitCritDamageAnim(struct Unit * unit, int damage);
void KillAllRedUnits_Init(struct BmusAilmentProc * proc);
void KillAllRedUnits_Loop(struct BmusAilmentProc * proc);
void StatusHealEffect_OverlayBg_Init(void);
void StatusHealEffect_OverlayBg_Loop(void);
void StatusHealEffect_BlendedSprite_Init(struct BmusAilmentProc * proc);
void StatusHealEffect_BlendedSprite_Loop(struct BmusAilmentProc * proc);
void StatusHealEffect_BlendedSprite_Finish(void);
void StatusHealEffect_BlendSpriteAnim_InitIn(struct BmusAilmentProc * proc);
void StatusHealEffect_BlendSpriteAnim_InitOut(struct BmusAilmentProc * proc);
void StatusHealEffect_BlendSpriteAnim_Loop(struct BmusAilmentProc * proc);
void StatusHealEffect_PalSpriteAnim_Init(struct BmusAilmentProc * proc);
void StatusHealEffect_PalSpriteAnim_SetOutlineIntensity(struct BmusAilmentProc * proc, int intensity);
void StatusHealEffect_PalSpriteAnim_LoopIn(struct BmusAilmentProc * proc);
void StatusHealEffect_PalSpriteAnim_LoopOut(struct BmusAilmentProc * proc);
void StatusHealEffect_Finish(void);
void StartStatusHealEffect(struct Unit * unit, ProcPtr proc);
void TerrainHealDisplay_Init(struct BmusAilmentProc * proc);
void MassEffectDisplay_Check(struct BmusAilmentProc * proc);
void MassEffectDisplay_Watch(struct BmusAilmentProc * proc);
void TerrainHealDisplay_Display(struct BmusAilmentProc * proc);
void FinishDamageDisplay(void);
void TerrainHealDisplay_Next(struct BmusAilmentProc * proc);
void PoisonDamageDisplay_Init(struct BmusAilmentProc * proc);
void PoisonDamageDisplay_Display(struct BmusAilmentProc * proc);
void PoisonDamageDisplay_Next(struct BmusAilmentProc * proc);
void StatusDecayDisplay_Init(struct BmusAilmentProc * proc);
void StatusDecayDisplay_Display(struct BmusAilmentProc * proc);
void StatusDecayDisplay_Next(struct BmusAilmentProc * proc);
void TrapDamageDisplay_Init(struct BmusAilmentProc * proc);
void TrapDamageDisplay_Check(struct BmusAilmentProc * proc);
void TrapDamageDisplay_Watch(struct BmusAilmentProc * proc);
void TrapDamageDisplay_Display(struct BmusAilmentProc * proc);
void TrapDamageDisplay_Next(struct BmusAilmentProc * proc);
