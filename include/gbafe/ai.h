#pragma once

#include "global.h"
#include "proc.h"

// AiPhase_Begin
// AiPhaseBerserkInit
// AiPhaseCleanup
// CpOrderMain
// sub_080349E4
// CpOrderFunc_BeginDecide
// GetUnitBattleAiPriority
// sub_08034B6C
// BuildAiUnitList
// SortAiUnitList
// sub_80351C8
// sub_08034CFC
// sub_08034D30
// AiClearDecision
// AiSetDecision
// AiUpdateDecision
// AiDecideMain
// sub_08034F40
// sub_08034FF0
// sub_0803500C
// sub_08035044
// sub_080350A0
// StartAiTargetCursor
// CpPerform_UpdateMapMusic
// sub_08035124
// CpPerform_BeginUnitMovement
// AiEndMuAndRefreshUnits
// sub_08035294
// sub_0803530C
// sub_0803534C
// sub_08035398
// AiStaffAction
// sub_08035458
// sub_0803548C
// AiTalkAction
// sub_080354D4
// sub_080354FC
// sub_08035524
// sub_08035634
// CpPerform_WaitAction
// CpPerform_Cleanup
// sub_08035790
// AiEscapeAction
// AiWaitAndClearScreenAction
// CpPerform_EquipBest
// sub_08035838
// AiFindTargetInReachByCharId
// AiFindTargetInReachByClassId
// AiFindTargetInReachByFunc
// sub_803602C
// AiRandomMove
// AiReachesByBirdsEyeDistance
// AiCouldReachByBirdsEyeDistance
// AiIsInShortList
// AiIsInByteList
// AiFindClosestTerrainPosition
// AiGetPositionRange
// AiFindClosestTerrainAdjacentPosition
// sub_080360E8
// AiCountUnitsInRange
// AiCountEnemyUnitsInRange
// AiCountAlliedUnitsInRange
// AiCountNearbyUnits
// AiCountNearbyEnemyUnits
// AiCountNearbyAlliedUnits
// AiMakeMoveRangeMapsForUnitAndWeapon
// AiMakeMoveRangeUnitPowerMaps
// sub_8036C48
// AiFindBestAdjacentPositionByFunc
// AiGetItemStealRank
// AiGetUnitStealItemSlot
// AiFindSafestReachableLocation
// AiFindPillageLocation
// AiGetChestUnlockItemSlot
void AiTryMoveTowards(short x, short y, u8 action, u8 maxDanger, u8 arg_4);
// sub_80371C4
// AiGetUnitClosestValidPosition
// AiGetClassRank
// AiUnitWithCharIdExists
// AiIsWithinRectDistance
// AiLocationIsPillageTarget
void SetupUnitInventoryAIFlags(void);
// sub_08037218
// SetupUnitHealStaffAIFlags
// SaveNumberOfAlliedUnitsIn0To8Range
// CharStoreAI
// sub_08037380
// sub_08037460
// sub_080374AC
// sub_08037548
// sub_0803758C
// sub_080375B8
// AiExecFallbackScriptA
// sub_08037648
// AiExecFallbackScriptB
// AiScript_Exec
// sub_08037744
// AiScriptCmd_01_FunctionCall
// AiScriptCmd_02_ChangeAi
// sub_08037888
// AiIsUnitEnemy
// AiIsUnitNonActive
// AiIsUnitEnemyAndNotInScrList
// AiIsUnitEnemyOrInScrList
// AiIsUnitEnemyAndScrCharId
// AiIsUnitEnemyAndScrClassId
// AiScriptCmd_04_ActionOnSelectedCharacter
// AiScriptCmd_05_DoStandardAction
// sub_8038024
// sub_08037B78
// AiScriptCmd_08_DoStandardActionAgainstClass
// sub_80380DC
// sub_80380F8
// sub_8038114
// sub_08037C7C
// AiScriptCmd_0D_MoveTowardsCharacterUntilInRange
// sub_8038238
// AiScriptCmd_0F_MoveTowardsUnitWithClass
// sub_08037DD0
// AiScriptCmd_11_MoveTowardsSafety
// sub_80383C0
// sub_8038440
// sub_80384C0
// sub_80384C8
// AiScriptCmd_16_RandomMovement
// sub_08038030
// sub_08038054
// sub_080380A8
// sub_08038218
// sub_0803831C
// AiScriptCmd_19_MoveTowardsTerrain
// AiScriptCmd_1A_MoveTowardsTerrain
// AiScriptCmd_1B_NoOp
// AiDoBerserkAction
// AiDoBerserkMove
// sub_80389F8
// sub_08038548
// AiAttemptOffensiveAction
// sub_080387B0
// AiFillReversedAttackRangeMap
// AiFloodMovementAndRange
// AiAttemptBallistaCombat
// sub_08038BEC
// AiAttemptStealActionWithinMovement
// AiSimulateBestBattleAgainstTarget
// AiSimulateBestBallistaBattleAgainstTarget
// AiGetCombatPositionScore
// sub_08038FA0
// AiSimulateBattleAgainstTargetAtPosition
// AiGetDamageDealtCombatScoreComponent
// sub_08039070
// sub_08039094
// sub_08039138
// sub_0803916C
// AiGetDamageTakenScoreComponent
// sub_080391E4
// sub_0803921C
// sub_08039240
// AiGetInRangeCombatPositionScoreComponent
// AiGetTerrainCombatPositionScoreComponent
// AiGetFriendZoneCombatPositionScoreComponent
// AiRefreshDangerMap
// AiFillDangerMap
// sub_08039510
// sub_08039534
void AiUpdateUnitsSeekHealing(void);
// AiUpdateGetUnitIsHealing
// sub_080397DC
// AiTryMoveTowardsEscape
// GetEscapePointStructThingMaybe
// AiCanEquip
// AiEquipGetFlags
// AiEquipGetDanger
// AiEquipBestMatch
// AiEquipBestConsideringDanger
// sub_08039CCC
// AiIsWithinFlyingDistance
// StoreItemAndGetUnitAttack
// AiTryDanceOrStealAfterMove
// AiTryActionAfterMove
// AiTryDoDanceAdjacent
// AiTryDoStealAdjacent
// sub_08039F60
// sub_0803A090
// sub_0803A0C0
// sub_0803A204
// sub_0803A3D4
// sub_803A8A4
// sub_803A8D4
// AiTryMoveToSpecificPosition
// AiCountEnemyInRangeOrTryMoveToSpecificPosition
// sub_0803A548
// sub_0803A58C
// sub_0803A5BC
// sub_0803A680
// sub_0803A6BC
// sub_0803A71C
// sub_0803A754
// sub_0803A7C8
// sub_0803A828
// sub_0803A874
// sub_0803A8C4
// sub_0803AA40
// sub_0803AA60
// GetAiStaffFuncIndex
// AiTryDoStaff
// GetAiSafestAccessibleAdjacentPosition
// sub_0803AC50
// sub_0803ADC8
// sub_0803AF98
// sub_0803B0A4
// sub_0803B1FC
// sub_0803B340
// GetAiSilenceEffectivenessScore
// sub_0803B3EC
// sub_0803B578
// sub_0803B6FC
// sub_0803B83C
// GetSpecialItemFuncIndex
// AiTryDoSpecialItems
// sub_0803BAA8
// sub_0803BB40
// sub_0803BC28
// sub_803C144
// sub_0803BCE8
// sub_0803BD3C
// sub_0803BD64
// AiSetMovCostTableWithPassableWalls
// sub_0803BE3C
// sub_0803BE6C
// sub_0803BEA0
// sub_0803BED0
// sub_803C3B4
// sub_0803BF30
// GenerateExtendedMovementMapOnRangeNeglectWall
// sub_803C440
// sub_0803BFC0
// sub_0803BFF4
// sub_0803C024
// sub_0803C058
// sub_0803C08C
// sub_0803C0C8
// AiMapFloodRangeFrom

// ??? gUnk_081D83B0
// ??? gUnk_081D83D0
// ??? gUnk_081D8E2C
// ??? gUnk_081D8EEC
// ??? gUnk_081D8EF8
// ??? gUnk_081D8F04
// ??? gUnk_081D8F0C
// ??? gUnk_081D8F88
extern u32 const AiItemConfigTable[];
// ??? gUnk_081D93F8
// ??? gUnk_081D93FC
// ??? gUnk_081D9408
// ??? gUnk_081D940C
// ??? gUnk_081D9470
// ??? gUnk_081D9474
// ??? gUnk_081D9490
// ??? gUnk_081D94A0
// ??? gUnk_081DABC8
// ??? gUnk_081DACFE
// ??? gUnk_081DADEC

extern struct ProcCmd ProcScr_AiOrder[];
// ??? gUnk_08C061C0
// ??? gUnk_08C061E0
// ??? gUnk_08C061E8
// ??? gUnk_08C06218
// ??? gUnk_08C06250
// ??? gUnk_08C06270
// ??? gUnk_08C062F0
// ??? gUnk_08C06308
// ??? gUnk_08C0636C
// ??? gUnk_08C06370
// ??? gUnk_08C06378
// ??? gUnk_08C06388
// ??? gUnk_08C06398
// ??? gUnk_08C0639C
// ??? gUnk_08C063D4
// ??? gUnk_08C06494
// ??? gUnk_08C06550
// ??? gUnk_08C06564
// ??? gUnk_08C065BC
// ??? gUnk_08C07CA4
// ??? gUnk_08C07CB0
// ??? gUnk_08C07CBC
// ??? gUnk_08C07D20
// ??? gUnk_08C07D84
// ??? gUnk_08C07D88
// ??? gUnk_08C07DA8
// ??? gUnk_08C07DAA
// ??? gSioSt
// ??? gUnk_08C07DB0
// ??? gUnk_08C07DD0
// ??? gUnk_08C07DF8
// ??? gUnk_08C07E20
// ??? gUnk_08C07E48
// ??? gUnk_08C07E68
// ??? gUnk_08C07E80
// ??? gUnk_08C07E98
// ??? gUnk_08C07EB0
// ??? gUnk_08C07EC0
// ??? gUnk_08C07ED0
// ??? gUnk_08C07F80
// ??? gUnk_08C07F8C
// ??? gUnk_08C07F98
// ??? ProcScr_TacticianNameSelection
// ??? gUnk_08C081B8
// ??? gUnk_08C081C8
// ??? gUnk_08C081D8
// ??? gUnk_08C08258
// ??? gUnk_08C08348
// ??? gUnk_08C08368
// ??? gUnk_08C08844
// ??? gUnk_08C088E4
// ??? gUnk_08C08904
