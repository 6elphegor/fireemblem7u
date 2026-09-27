#pragma once

// Enemy AI ("cp" = computer player), translated from fireemblem8u's
// cp_common.h / cp_utility.h / cp_script.h / cp_perform.h.

#include "global.h"
#include "proc.h"
#include "types.h"

struct Unit;
struct UnitDefinition;
struct Trap;
struct MuProc;
struct PopupInstruction;

struct AiState
{
    /* 00 */ u8 units[116];
    /* 74 */ u8 * unitIt;
    /* 78 */ u8 orderState;
    /* 79 */ u8 decideState;
    /* 7A */ s8 dangerMapFilled; // bool
    /* 7B */ u8 flags;
    /* 7C */ u8 unk7C;
    /* 7D */ u8 combatWeightTableId;
    /* 7E */ u8 unk7E;
    /* 7F */ u8 unk7F;
    /* 80 */ u32 specialItemFlags;
    /* 84 */ u8 unk84;
    /* 85 */ u8 bestBlueMov;
    /* 86 */ u8 cmd_result[8];
};

struct AiDecision
{
    /* 00 */ u8 actionId;
    /* 01 */ u8 unitId;
    /* 02 */ u8 xMove;
    /* 03 */ u8 yMove;
    /* 04 */ u8 unk04;
    /* 05 */ u8 unk05;
    /* 06 */ u8 targetId;
    /* 07 */ u8 itemSlot;
    /* 08 */ u8 xTarget;
    /* 09 */ u8 yTarget;
    /* 0A */ s8 actionPerformed;
};

enum
{
    // gAiState.flags
    AI_FLAGS_NONE = 0,

    AI_FLAG_0 = (1 << 0),
    AI_FLAG_STAY = (1 << 1),
    AI_FLAG_BERSERKED = (1 << 2),
    AI_FLAG_3 = (1 << 3),
};

enum
{
    // Unit::aiFlags
    AI_UNIT_FLAG_0 = (1 << 0),
    AI_UNIT_FLAG_1 = (1 << 1),
    AI_UNIT_FLAG_2 = (1 << 2),
    AI_UNIT_FLAG_3 = (1 << 3),
    AI_UNIT_FLAG_4 = (1 << 4),
    AI_UNIT_FLAG_5 = (1 << 5),
    AI_UNIT_FLAG_6 = (1 << 6),
};

enum
{
    AI_UNIT_CONFIG_HEALTHRESHOLD_SHIFT = 0,
    AI_UNIT_CONFIG_HEALTHRESHOLD_BITS = 3,
    AI_UNIT_CONFIG_HEALTHRESHOLD_MASK = ((1 << AI_UNIT_CONFIG_HEALTHRESHOLD_BITS) - 1) << AI_UNIT_CONFIG_HEALTHRESHOLD_SHIFT,

    AI_UNIT_CONFIG_COMBATWEIGHT_SHIFT = 3,
    AI_UNIT_CONFIG_COMBATWEIGHT_BITS = 5,
    AI_UNIT_CONFIG_COMBATWEIGHT_MASK = ((1 << AI_UNIT_CONFIG_COMBATWEIGHT_BITS) - 1) << AI_UNIT_CONFIG_COMBATWEIGHT_SHIFT,

    AI_UNIT_CONFIG_FLAG_STAY = 1 << 13,
};

enum
{
    AI_ACTION_NONE = 0, // move only
    AI_ACTION_COMBAT = 1,
    AI_ACTION_ESCAPE = 2,
    AI_ACTION_STEAL = 3,
    AI_ACTION_PILLAGE = 4,
    AI_ACTION_STAFF = 5,
    AI_ACTION_USEITEM = 6,
    AI_ACTION_REFRESH = 7,
    AI_ACTION_TALK = 8,
    AI_ACTION_RIDEBALLISTA = 9,
    AI_ACTION_EXITBALLISTA = 10,
};

enum
{
    AI_COMPARE_GT,
    AI_COMPARE_GE,
    AI_COMPARE_EQ,
    AI_COMPARE_LE,
    AI_COMPARE_LT,
    AI_COMPARE_NE,
};

struct AiCombatSimulationSt
{
    /* 00 */ u8 xMove;
    /* 01 */ u8 yMove;
    /* 02 */ u8 targetId;
    /* 04 */ u16 itemSlot;
    /* 08 */ u32 score;
};

struct AiScr
{
    /* 00 */ u8 cmd;
    /* 01 */ u8 unk_01;
    /* 02 */ u8 unk_02;
    /* 03 */ u8 unk_03;
    /* 04 */ u32 unk_04;
    /* 08 */ const void * unk_08;
    /* 0C */ const void * unk_0C;
};

typedef s8 (* AiScrFunc)(const void * arg);

extern struct AiState gAiState;
extern struct AiDecision gAiDecision;

// cp_decide
void AiClearDecision(void);
void AiSetDecision(s16 xMove, s16 yMove, u8 actionId, u8 targetId, u8 itemSlot, u8 xTarget, u8 yTarget);
void AiUpdateDecision(u8 actionId, u8 targetId, u8 itemSlot, u8 xTarget, u8 yTarget);

// cp_perform
void AiTargetCursor_Main(ProcPtr proc);
void StartAiTargetCursor(int x, int y, int kind, ProcPtr parent);
void CpPerform_UpdateMapMusic(void);
void AiEndMuAndRefreshUnits(void);

// cp_utility
s8 AiCompare(const u8 * left, u8 op, u32 right);
s8 AiFindTargetInReachByCharId(int uid, struct Vec2 * out);
s8 AiFindTargetInReachByClassId(int classId, struct Vec2 * out);
s8 AiFindTargetInReachByFunc(s8 (* func)(struct Unit * unit), struct Vec2 * out);
s8 AiFindTargetInReachNeglectWallByFunc(s8 (* func)(struct Unit * unit), struct Vec2 * out);
void AiRandomMove(void);
s8 AiReachesByBirdsEyeDistance(struct Unit * unit, struct Unit * other, u16 item);
s8 AiCouldReachByBirdsEyeDistance(struct Unit * unit, struct Unit * other, u16 item);
s8 AiIsInShortList(const u16 * list, u16 item);
s8 AiIsInByteList(const u8 * list, u8 item);
s8 AiFindClosestTerrainPosition(const u8 * terrainList, int flags, struct Vec2 * out);
u8 AiGetPositionRange(int x, int y);
s8 AiFindClosestTerrainAdjacentPosition(const u8 * terrainList, int flags, struct Vec2 * out);
s8 AiFindClosestUnlockPosition(int flags, struct Vec2 * out);
int AiCountUnitsInRange(void);
int AiCountEnemyUnitsInRange(void);
int AiCountAlliedUnitsInRange(void);
int AiCountNearbyUnits(s16 x, s16 y);
int AiCountNearbyEnemyUnits(s16 x, s16 y);
int AiCountNearbyAlliedUnits(s16 x, s16 y);
void AiMakeMoveRangeMapsForUnitAndWeapon(struct Unit * unit, u16 item);
void AiMakeMoveRangeUnitPowerMaps(struct Unit * unit);
void sub_08036770(struct Unit * unit, u16 item);
s8 AiFindBestAdjacentPositionByFunc(int x, int y, u8 (* func)(int x, int y), struct Vec2 * out);
int AiGetItemStealRank(u16 item);
s8 AiGetUnitStealItemSlot(struct Unit * unit);
s8 AiFindSafestReachableLocation(struct Unit * unit, struct Vec2 * out);
s8 AiFindPillageLocation(struct Vec2 * out, u8 * outItemSlot);
s8 AiGetChestUnlockItemSlot(u8 * out);
void AiTryMoveTowards(s16 x, s16 y, u8 action, u8 maxDanger, u8 unk);
void AiTryMoveTowardsNeglectWall(s16 x, s16 y, u8 action, u8 maxDanger, u8 unk);
s8 AiGetUnitClosestValidPosition(struct Unit * unit, s16 x, s16 y, struct Vec2 * out);
u8 AiGetClassRank(u8 classId);
s8 AiUnitWithCharIdExists(u16 uid);
s8 AiIsWithinRectDistance(s16 x, s16 y, u8 x2, u8 y2, u8 maxDistance);
s8 AiLocationIsPillageTarget(u8 x, u8 y);
void SetupUnitInventoryAIFlags(void);
void SetupUnitStatusStaffAIFlags(struct Unit * unit, u16 item);
void SetupUnitHealStaffAIFlags(struct Unit * unit, u16 item);
void SaveNumberOfAlliedUnitsIn0To8Range(struct Unit * unit);
void CharStoreAI(struct Unit * unit, const struct UnitDefinition * uDef);
s8 sub_08037380(struct Vec2 * out);
int sub_08037460(void);
int sub_080374AC(void);
s8 sub_08037548(struct Unit * unit);
void sub_0803758C(struct Unit * unit);

// cp_script
s8 AiTryExecScriptA(void);
s8 AiExecFallbackScriptA(void);
s8 AiTryExecScriptB(void);
s8 AiExecFallbackScriptB(void);
void AiScript_Exec(u8 * pc);
s8 AiIsUnitEnemy(struct Unit * unit);
s8 AiIsUnitNonActive(struct Unit * unit);
s8 AiIsUnitEnemyAndNotInScrList(struct Unit * unit);
s8 AiIsUnitEnemyOrInScrList(struct Unit * unit);
s8 AiIsUnitEnemyAndScrCharId(struct Unit * unit);
s8 AiIsUnitEnemyAndScrClassId(struct Unit * unit);
int sub_08038054(int x, int y);
s8 sub_080380A8(int x, int y, struct Vec2 * out, u8 * itemSlotOut);
s8 sub_08038218(const u8 * terrainList, u32 flags, struct Vec2 * out);
void AiDoBerserkAction(void);
void AiDoBerserkMove(void);
s8 sub_08038544(void);
s8 sub_08038548(u8 * arg);

// cp_battle
s8 AiAttemptOffensiveAction(s8 (* isEnemy)(struct Unit * unit));
s8 AiAttemptCombatWithinMovement(s8 (* isEnemy)(struct Unit * unit));
void AiFillReversedAttackRangeMap(struct Unit * unit, u16 item);
void AiFloodMovementAndRange(struct Unit * unit, u16 move, u16 item);
s8 AiAttemptBallistaCombat(s8 (* isEnemy)(struct Unit * unit), struct AiCombatSimulationSt * st);
u8 AiAttemptStealAction_GetMovementAt(int x, int y);
s8 AiAttemptStealActionWithinMovement(void);
s8 AiSimulateBestBattleAgainstTarget(struct AiCombatSimulationSt * st);
s8 AiSimulateBestBallistaBattleAgainstTarget(struct AiCombatSimulationSt * st, u16 item);
u32 AiGetCombatPositionScore(int x, int y, struct AiCombatSimulationSt * st);
s8 AiIsBadFight(struct AiCombatSimulationSt * st);
s8 AiSimulateBattleAgainstTargetAtPosition(struct AiCombatSimulationSt * st);
int AiGetDamageDealtCombatScoreComponent(void);
int AiGetOpponentLowHpScoreComponent(void);
int AiGetFriendZoneCombatScoreComponent(void);
int AiGetTargetClassCombatScoreComponent(void);
int AiGetTurnCombatScoreComponent(void);
int AiGetDamageTakenScoreComponent(void);
int AiGetDangerScoreComponent(void);
int AiGetLowHpScoreComponent(void);
void AiComputeCombatScore(struct AiCombatSimulationSt * st);
int AiGetInRangeCombatPositionScoreComponent(int x, int y, struct Unit * unit);
int AiGetTerrainCombatPositionScoreComponent(int x, int y);
int AiGetFriendZoneCombatPositionScoreComponent(int x, int y);

// cp_0803E2F4
void AiRefreshDangerMap(void);
void AiFillDangerMap(void);
s8 AiCheckDangerAt(int x, int y, u8 threshold);
s8 AiTryGetNearestHealPoint(struct Vec2 * out);
void AiUpdateUnitsSeekHealing(void);
s8 AiUpdateGetUnitIsHealing(struct Unit * unit);
s8 AiTryHealSelf(void);
s8 AiTryMoveTowardsEscape(void);
s8 AiCanEquip(void);
s8 AiEquipGetFlags(u16 * out);
void AiEquipGetDanger(int x, int y, u16 * rangeDangerOut, u16 * meleeDangerOut, u16 * combinedDangerOut);
void AiEquipBestMatch(int equipFlag, u16 * equipFlags);
void AiEquipBestConsideringDanger(u16 rangeDanger, u16 meleeDanger, u16 combinedDanger, u16 * equipFlags);
void sub_08039CCC(u16 item);
s8 AiIsWithinFlyingDistance(struct Unit * unit, int x, int y);
int StoreItemAndGetUnitAttack(struct Unit * unit, u16 * itemOut);
void AiTryDanceOrStealAfterMove(void);
void AiTryActionAfterMove(void);
s8 AiTryDoDanceAdjacent(int x, int y);
s8 AiTryDoStealAdjacent(int x, int y);
s8 sub_08039F60(int x, int y);
s8 AiIsUnitAtPositionDifferentAllegiance(int x, int y);
s8 AiFunc_CountEnemiesInRange(const void * arg);
s8 sub_0803A3D4(const void * input);
s8 sub_0803A3F0(const void * input);
s8 sub_0803A420(const void * input);
s8 AiTryMoveToSpecificPosition(struct Vec2 * out);
s8 AiCountEnemyInRangeOrTryMoveToSpecificPosition(const void * input);
s8 sub_0803A548(const void * input);
s8 sub_0803A58C(const void * input);
s8 sub_0803A5BC(const void * input);
s8 sub_0803A680(struct Unit * unit);
s8 sub_0803A6BC(const void * input);
s8 sub_0803A71C(struct Unit * unit);
s8 sub_0803A754(struct Unit * unit);
s8 sub_0803A7C8(const void * input);
s8 sub_0803A828(const void * input);
s8 sub_0803A874(const void * input);
s8 AiBallistaRideExit(const void * input);
s8 sub_0803AA40(const void * input);
s8 sub_0803AA60(const void * input);

// cp_staff
int GetAiStaffFuncIndex(u16 item);
s8 AiTryDoStaff(s8 (* isEnemy)(struct Unit * unit));
s8 GetAiSafestAccessibleAdjacentPosition(int x, int y, struct Vec2 * out);
void AiStaffHealMendRecover(int itemIdx, s8 (* isEnemy)(struct Unit * unit));
void AiStaffPhysicRescue(int itemIdx, s8 (* isEnemy)(struct Unit * unit));
void AiStaffFortify(int itemIdx, s8 (* isEnemy)(struct Unit * unit));
void AiStaffWarp(int itemIdx, s8 (* isEnemy)(struct Unit * unit));
void AiStaffRestore(int itemIdx, s8 (* isEnemy)(struct Unit * unit));
s8 sub_0803B340(struct Unit * unit);
u8 GetAiSilenceEffectivenessScore(struct Unit * unit);
void AiStaffSilence(int itemIdx, s8 (* isEnemy)(struct Unit * unit));
void AiStaffSleepBerserk(int itemIdx, s8 (* isEnemy)(struct Unit * unit));
void AiStaffBarrier(int itemIdx, s8 (* isEnemy)(struct Unit * unit));
s8 sub_0803B83C(struct Vec2 * out);

// cpextra_80407F0
int GetSpecialItemFuncIndex(u16 item);
s8 AiTryDoSpecialItems(void);
void AiSpecialItemDoorKey(int item);
void AiSpecialItemLockpick(int item);
void AiSpecialItemAntitoxin(int item);
u8 sub_0803BC90(int x, int y);
s8 sub_0803BCE8(struct Unit * unit, struct Vec2 * pos);
s8 sub_0803BD3C(struct Unit * unit, struct Vec2 * pos);
s8 sub_0803BD64(struct Unit * unit, u32 flags, struct Vec2 * pos);
void AiSetMovCostTableWithPassableWalls(const s8 * cost);
void sub_0803BE3C(const s8 * cost, int terrainId);
void sub_0803BE6C(const s8 * cost, int terrainIdA, int terrainIdB);
void InitAiMoveMapForUnit(struct Unit * unit);
void sub_0803BED0(struct Unit * unit);
void sub_0803BF00(struct Unit * unit);
void sub_0803BF30(struct Unit * unit);
void GenerateExtendedMovementMapOnRangeNeglectWall(int x, int y, const s8 * cost);
void sub_0803BF8C(int x, int y, struct Unit * unit);
void sub_0803BFC0(struct Unit * unit);
void sub_0803BFF4(struct Unit * unit);
void sub_0803C024(struct Unit * unit);
void sub_0803C058(struct Unit * unit);
void sub_0803C08C(struct Unit * unit);
void AiUpdateNoMoveFlag(struct Unit * unit);
void AiMapFloodRangeFrom(int x, int y, struct Unit * unit);

// Functions of other modules used by the AI that no other header declares yet
// (signatures from fireemblem8u; FE8U name in comments where it differs).
void MapFloodUnitMovement(struct Unit * unit, s8 movement);     // GenerateUnitMovementMapExt
void MapFloodUnitExtended(struct Unit * unit);                  // GenerateUnitExtendedMovementMap
void MapFloodRange_Unitless(int x, int y, const s8 mct[]);      // GenerateExtendedMovementMapOnRange
void SetWorkingMoveTable(const s8 mct[]);                       // SetWorkingMoveCosts
void BeginMapFlood(int x, int y, int movement, int unitId);     // GenerateMovementMap
void BuildBestMoveScript(int x, int y, u8 output[]);           // GenerateBestMovementScript
void UnitApplyWorkingMovementScript(struct Unit * unit, int x, int y);
void MarkMovementMapEdges(void);                                        // MarkMovementMapEdges
void MarkWorkingMapEdges(void);
void GenerateMagicSealMap(int value);
void SetWorkingBmMap(u8 ** map);
void RevertMapChange(struct Unit * unit);                       // GenerateUnitMovementMap (misnamed here)
struct Trap * GetRiddenBallistaAt(int x, int y);
void RideBallista(struct Unit * unit);
void TryRemoveUnitFromBallista(struct Unit * unit);
int GetItemEffect(int item);                                    // GetItemUseEffect
