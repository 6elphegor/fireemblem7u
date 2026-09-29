#pragma once

/**
 * messed anim declarations
 */

#include "global.h"
#include "proc.h"
#include "unit.h"
#include "battle.h"
#include "anime.h"
#include "banim_tables.h"

#define EFX_BG_WIDTH 66
#define EFX_TILEMAP_LOC(aMap, aX, aY) (aMap + (aX) + EFX_BG_WIDTH * (aY))

enum ekr_battle_unit_position {
    EKR_POS_L,
    EKR_POS_R
};

extern struct Anim * gAnims[4];

enum gEkrDistanceType_index {
    EKR_DISTANCE_CLOSE,
    EKR_DISTANCE_FAR,
    EKR_DISTANCE_FARFAR,
    EKR_DISTANCE_MONOCOMBAT,
    EKR_DISTANCE_PROMOTION
};

enum AnimRoundData_type_identifier {
    ANIM_ROUND_HIT_CLOSE,
    ANIM_ROUND_CRIT_CLOSE,
    ANIM_ROUND_NONCRIT_FAR,
    ANIM_ROUND_CRIT_FAR,
    ANIM_ROUND_TAKING_MISS_CLOSE,
    ANIM_ROUND_TAKING_MISS_FAR,
    ANIM_ROUND_TAKING_HIT_CLOSE,
    ANIM_ROUND_STANDING,
    ANIM_ROUND_TAKING_HIT_FAR,
    ANIM_ROUND_MISS_CLOSE,
    ANIM_ROUND_MAX,

    ANIM_ROUND_INVALID = -1,
};

enum anim_round_type {
    ANIM_ROUND_BIT8 = 0x0100,
    ANIM_ROUND_PIERCE = 0x0200,
    ANIM_ROUND_GREAT_SHIELD = 0x0400,
    ANIM_ROUND_SURE_SHOT = 0x0800,
    ANIM_ROUND_SILENCER = 0x1000,
    ANIM_ROUND_POISON = 0x2000,
    ANIM_ROUND_BIT14 = 0x4000,
    ANIM_ROUND_DEVIL = 0x8000,    
};

enum banim_mode_index {
    BANIM_MODE_NORMAL_ATK,
    BANIM_MODE_NORMAL_ATK_PRIORITY_L,
    BANIM_MODE_CRIT_ATK,
    BANIM_MODE_CRIT_ATK_PRIORITY_L,
    BANIM_MODE_RANGED_ATK,
    BANIM_MODE_RANGED_CRIT_ATK,
    BANIM_MODE_CLOSE_DODGE,
    BANIM_MODE_RANGED_DODGE,
    BANIM_MODE_STANDING,
    BANIM_MODE_STANDING2,
    BANIM_MODE_RANGED_STANDING,
    BANIM_MODE_MISSED_ATK,

    BANIM_MODE_INVALID = -1,
};

extern s16 gEkrDistanceType;

extern struct BattleAnim banim_data[];
extern struct BattleAnimCharaPal character_battle_animation_palette_table[];
extern struct BattleAnimTerrain battle_terrain_table[];

struct BanimModeData {
    const u32 * unk0;
    const u32 * img;
    u32 unk2;
};

struct ProcEfx {
    PROC_HEADER;

    /* 29 */ u8 hitted;
    /* 2A */ u8 type;
    /* 2B */ STRUCT_PAD(0x2B, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 step;
    /* 30 */ s16 unk30;
    /* 32 */ u16 unk32;
    /* 34 */ STRUCT_PAD(0x34, 0x44);
    /* 44 */ u32 unk44;
    /* 48 */ u32 unk48;
    /* 4C */ u32 frame;
    /* 50 */ u32 speed;
    /* 54 */ s16 * unk54;
    /* 58 */ s16 ** unk58;
    /* 5C */ struct Anim * anim;
    STRUCT_PAD(0x60, 0x64);
    ProcPtr unk_64;
};

struct ProcEfxBG {
    PROC_HEADER;

    /* 29 */ u8 unk29;

    STRUCT_PAD(0x2A, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 unk30;
    /* 32 */ s16 unk32;
    /* 34 */ s16 unk34;

    STRUCT_PAD(0x36, 0x3C);

    /* 3C */ s16 unk3C;

    STRUCT_PAD(0x3E, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const u16 * frame_config;
    /* 4C */ u16 * const * tsal;
    /* 50 */ u16 * const * tsar;
    /* 54 */ u16 * const * img;
    /* 58 */ u16 * const * pal;
    /* 5C */ struct Anim * anim;
};

struct ProcEfxBGCOL {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 timer2;
    /* 30 */ s16 terminator;
    /* 32 */ s16 unk32;

    STRUCT_PAD(0x34, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const u16 * frame_config;
    /* 4C */ void * pal;

    STRUCT_PAD(0x50, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcEfxRST {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 duration;

    STRUCT_PAD(0x30, 0x5C);

    /* 5C */ struct Anim * anim;

    STRUCT_PAD(0x60, 0x64);

    /* 64 */ struct ProcEfx * efxproc;
};

struct ProcEfxOBJ {
    PROC_HEADER;

    /* 29 */ u8 unk29;
    /* 2A */ u8 unk2A;

    STRUCT_PAD(0x2B, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ u16 unk30;
    /* 32 */ u16 unk32;
    /* 34 */ u16 unk34;
    /* 36 */ u16 unk36;
    /* 38 */ u16 unk38;
    /* 3A */ u16 unk3A;
    /* 3C */ u16 unk3C;
    /* 3E */ u16 unk3E;
    /* 40 */ u16 unk40;
    /* 42 */ u16 unk42;
    /* 44 */ int unk44;
    /* 48 */ int unk48;
    /* 4C */ int unk4C;

    STRUCT_PAD(0x50, 0x5C);

    /* 5C */ struct Anim * anim;
    /* 60 */ struct Anim * anim2;
    /* 64 */ struct Anim * anim3;
    /* 68 */ struct Anim * anim4;
};

struct ProcEfxALPHA {
    PROC_HEADER;

    /* 29 */ u8 unk29;

    STRUCT_PAD(0x2A, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;
    /* 30 */ s16 unk30;

    STRUCT_PAD(0x32, 0x44);

    /* 44 */ int unk44;
    /* 48 */ int unk48;
    /* 4C */ int unk4C;

    STRUCT_PAD(0x50, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcEfxSCR {
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;
    /* 34 */ STRUCT_PAD(0x30, 0x44);
    /* 44 */ int unk44;
    /* 48 */ STRUCT_PAD(0x48, 0x5C);
    /* 5C */ struct ProcEfx * unk5C;
};

struct ProcEkrSubAnimeEmulator {
    PROC_HEADER;

    /* 29 */ u8 type;
    /* 2A */ u8 valid;
    /* 2C */ s16 timer;
    /* 2E */ s16 scr_cur;

#if ANIMSCR_WIDE
    /* 30 */ s16 scr_prev; // start of the instruction before scr_cur
#else
    STRUCT_PAD(0x30, 0x32);
#endif

    /* 32 */ s16 x1;
    /* 34 */ s16 x2;

    STRUCT_PAD(0x36, 0x3A);

    /* 3A */ s16 y1;
    /* 3C */ s16 y2;

    STRUCT_PAD(0x3E, 0x44);

    /* 44 */ const AnimScr * anim_scr;
    /* 48 */ void * sprite;
    /* 4C */ int oam2Base;
    /* 50 */ int oamBase;
};

extern u16 gEfxPal[];
extern const void * gpImgSheet[2];
extern int gEkrDebugUnk2;
extern int gAnimC01Blocking;
extern u32 gBanimDoneFlag[];
extern int * gpBanimModesLeft;
extern int * gpBanimModesRight;
extern u8 gBanimScrLeft[];
extern u8 gBanimScrRight[];

/* The battle animation scripts are decompressed to RAM (gBanimScrLeft /
 * Right) and interpreted by the same AnimInterpret as the ones in the ROM.
 * Every instruction in them is one u32 (a command, a wait) except FRAME:
 * the instruction, the sheet and the sprite offset, three cells, which is
 * also the cell format's FRAME.  They hold none of the address-carrying
 * one-word instructions (sprite, call, jump), so they are the same in both
 * formats, apart from the width of a cell.  The mode table (gpBanimModes*)
 * holds byte offsets into the ROM's u32 script: BANIM_SCR_AT turns one into
 * a pointer to that instruction, counting cells (a cell is 4 bytes here, so
 * this is the same address; where a cell is wider the decompressor widens
 * every word and this is what keeps the offsets right). */
#if ANIMSCR_WIDE
#define BANIM_SCR_AT(base, off) ((void *)((AnimScr *)(base) + (unsigned)(off) / 4))
#else
#define BANIM_SCR_AT(base, off) ((void *)((base) + (off)))
#endif
extern u16 gBanimPaletteLeft[0x50];
extern u16 gBanimPaletteRight[0x50];
extern u32 gBanimOaml[0x1600];
extern u32 gBanimOamr2[0x1600];
extern int gEfxTeonoState;
extern int Unk_03004830;
extern int Unk_0203E0B0[2];
extern s16 Unk_0203DFEC;
extern short gEkrPairHpInitial[2];
extern short gEfxPairHpBufOffset[];
extern u16 gEkrTsaBuffer[0x1000 / 2];
extern u16 gEfxFrameTmap[0x2520 / 2];
extern s16 gBanimUniquePal[2];
extern s16 gBanimFactionPal[2];
extern s16 gEkrSpellAnimIndex[2];
extern int gEkrBgPosition;
extern s16 gEkrXPosReal[2];
extern s16 gEkrYPosReal[2];
extern u16 gEkrXPosBase[2];
extern u16 gEkrYPosBase[2];
extern struct Vec2 gEkrBg0QuakeVec;
extern struct Vec2 gEkrBg2QuakeVec;
extern s16 gBanimValid[2];
extern int gEkrBg2ScrollFlip;
extern u16 * gpBg2ScrollOffsetStart;
extern u16 * gpBg2ScrollOffset;
extern u16 gpBg2ScrollOffsetTable1[];
extern u16 gpBg2ScrollOffsetTable2[];
extern int gEkrBg1ScrollFlip;
extern u16 * gpBg1ScrollOffsetStart;
extern u16 * gpBg1ScrollOffset;
extern u16 gpBg1ScrollOffsetList1[];
extern u16 gpBg1ScrollOffsetList2[];
extern s16 gBanimIdx[2];
extern struct BattleUnit * gpEkrBattleUnitLeft;
extern struct BattleUnit * gpEkrBattleUnitRight;
extern u16 * gpEfxUnitPaletteBackup[2];

/* EWRAM data */
extern struct Unit * gpEkrTriangleUnits[2];
extern u16 * gBanimTriAtkPalettes[2];
extern s16 gBanimUniquePaletteDisabled[2];

void NewEkrLvlupFan(void);
// ??? EkrLvupFanMain
// ??? sub_0804C118
// ??? sub_0804C168
void NewEkrGauge(void);
void EndEkrGauge(void);
void EkrGauge_Clr4C50(void);
void EkrGauge_Set4C50(void);
void EkrGauge_Set4C(void);
void EkrGauge_Set50(void);
void EkrGauge_0804CC68(u16 val);
void EkrGauge_Clr323A(s16 x, s16 y);
void EkrGauge_Setxy323A(s16 x, s16 y);
void EkrGauge_SetInitFlag(void);
void EkrGauge_ClrInitFlag(void);
// ??? EnableEkrGauge
// ??? DisableEkrGauge
// ??? sub_0804C504
// ??? ekrGaugeMain
// ??? sub_804D13C
void NewEkrDispUP(void);
void EndEkrDispUP(void);
// ??? EkrDispUpClear4C50
// ??? EkrDispUP_0804D594
// ??? EkrDispUpSet4C
// ??? EkrDispUpSet50
void EkrDispUP_SetPositionUnsync(u16 x, u16 y);
void EkrDispUP_SetPositionSync(u16 x, u16 y);
void SyncEkrDispUP(void);
void UnsyncEkrDispUP(void);
void AsyncEkrDispUP(void);
void UnAsyncEkrDispUP(void);
// ??? ekrDispUPMain
// ??? EfxClearScreenFx
// ??? sub_0804D0B8
// ??? EfxPrepareScreenFx
int GetBanimInitPosReal(void);
// ??? EkrEfxStatusClear
int CheckEkrHitDone(void);
// ??? EkrEfxIsUnitHittedNow
// ??? NewEfxHPBar
// ??? EfxHpBar_DeclineToDeath
// ??? EfxHpBar_MoveCameraOnEnd
// ??? EfxHpBar_WaitCameraMove
// ??? NewEfxHpBarResire
// ??? EfxHpBarResire_WaitOnCurrentSide
// ??? EfxHpBarResire_SetAnotherSide
// ??? EfxHpBarResire_DeclineToDeath
// ??? NewEfxAvoid
// ??? EfxAvoidMain
// ??? NewEfxHpBarLive
// ??? EfxHPBarLiveMain
// ??? NewEfxNoDmage
// ??? EfxNoDamageMain
// ??? NewEfxNoDamageYure
// ??? EfxNoDamageYureMain
// ??? NewEfxStatusCHG
// ??? EfxStatusCHGMain
// ??? NewEfxDeadEvent
// ??? efxDeadEvent_Loop_A
// ??? efxDeadEvent_Loop_B
// ??? efxDeadEvent_Loop_C
// ??? efxDeadEvent_Loop_D
// ??? efxDeadEvent_Loop_E
// ??? NewEfxDead
// ??? efxDead_Loop_A
// ??? efxDead_Loop_B
// ??? NewEfxDeadPika
// ??? EfxDeadPikaMain
// ??? NewEfxDeadAlpha
// ??? EfxDeadAlphaMain
// ??? NewEfxFarAttackWithDistance
// ??? sub_0804E574
// ??? efxFarAttack_Loop_A
// ??? efxFarAttack_Loop_B
// ??? efxFarAttack_Loop_C
// ??? sub_0804E6DC
ProcPtr NewEfxQuakePure(int, int);
// ??? efxQuakePure_Loop
// ??? NewEfxHitQuakePure
// ??? nullsub_48
ProcPtr NewEfxQuake(int type);
// ??? efxQuake_Loop
// ??? NewEfxHitQuake
// ??? efxHitQuake_Loop
void NewEfxFlashBgWhite(struct Anim * anim, int duartion);
void NewEfxFlashBgRed(struct Anim * anim, int duartion);
void NewEfxFlashBgBlack(struct Anim * anim, int duartion);
void NewEfxFlashBgDirectly(struct Anim * anim, int duartion);
// ??? EfxFlashBgMain
// ??? EfxFlashRestorePalSync
// ??? NewEfxWhiteOUT
// ??? EfxWhiteOutMain1
// ??? EfxWhiteOutMain2
// ??? EfxWhiteOutRestorePalSync
// ??? NewEfxFlashHPBar
// ??? EfxFlashHPBarDelay
// ??? EfxFlashHPBarMain1
// ??? EfxFlashHPBarRestorePal
// ??? NewEfxHpBarColorChange
// ??? EndEfxHPBarColorChange
// ??? DisableEfxHpBarColorChange
// ??? EnableEfxHpBarColorChange
// ??? EfxHPBarColorChangeMain
// ??? NewEfxFlashUnit
// ??? EfxFlashUnitMain
// ??? EfxFlashUnitRestorePal

struct ProcEfxStatusUnit {
    PROC_HEADER;
    /* 29 */ u8 invalid;

    STRUCT_PAD(0x2A, 0x2C);

    /* 2C */ u16 timer;

    STRUCT_PAD(0x2E, 0x32);

    /* 32 */ s16 red;
    /* 34 */ s16 green;
    /* 36 */ s16 blue;

    STRUCT_PAD(0x38, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const u16 *frame_lut;
    /* 4C */ u32 debuff;
    /* 50 */ u32 debuf_bak;

    STRUCT_PAD(0x54, 0x5C);

    /* 5C */ struct Anim * anim;
};

extern struct ProcEfxStatusUnit * gpProcEfxStatusUnits[2];

void NewEfxStatusUnit(struct Anim * anim);
void EndEfxStatusUnits(struct Anim *anim);
void DisableEfxStatusUnits(struct Anim * anim);
void EnableEfxStatusUnits(struct Anim * anim);
void SetUnitEfxDebuff(struct Anim * anim, int debuff);
u32 GetUnitEfxDebuff(struct Anim * anim);
void EfxStatusUnitFlashing(struct Anim * anim, int, int, int);
void EfxStatusUnit_Loop(struct ProcEfxStatusUnit * proc);
// ??? EfxStatusUnitEnd
void NewEfxWeaponIcon(s16 effective1, s16 effective2);
void EndProcEfxWeaponIcon(void);
void DisableEfxWeaponIcon(void);
void EnableEfxWeaponIcon(void);
// ??? EfxWeaponIcon_Loop
// ??? EfxWeaponIcon_OnEnd
// ??? NewEfxSpellCast
// ??? RegisterEfxSpellCastEnd
// ??? sub_80503B8
// ??? efxSpellCast_Loop_A
// ??? efxSpellCast_Loop_B
// ??? efxSpellCast_Loop_C
// ??? StartEfxSpellCastBg
// ??? sub_0804FD54
// ??? sub_0804FD6C
// ??? sub_8050560
// ??? efxSpellCastBg_Loop_A
// ??? efxSpellCastBg_Loop_B
// ??? efxSpellCastBg_Loop_C
// ??? efxSpellCastBg_Loop_D
// ??? efxSpellCastBg_Loop_E
void SpellFx_Begin(void);
void SpellFx_Finish(void);
void SpellFx_SetBG1Position(void);
void SpellFx_ClearBG1(void);
void SpellFx_SetSomeColorEffect(void);
void SpellFx_ClearColorEffects(void);
void StartBattleAnimHitEffectsDefault(struct Anim * anim, int type);
// ??? sub_08050150
void StartBattleAnimHitEffects(struct Anim * anim, int type, int a, int b);
void StartBattleAnimResireHitEffects(struct Anim * anim, int type);
void StartBattleAnimStatusChgHitEffects(struct Anim * anim, int type);
struct Anim * EfxCreateFrontAnim(struct Anim * anim, const AnimScr * scr1, const AnimScr * scr2, const AnimScr * scr3, const AnimScr * scr4);
void EfxCreateBackAnim(struct Anim * anim, const u16 * src1, const u16 * src2);
void SpellFx_WriteBgMap(struct Anim * anim, const u16 * src1, const u16 * src2);
// ??? SpellFx_WriteBgMapExt
void SpellFx_RegisterObjGfx(const void * img, u32 size);
void SpellFx_RegisterObjPal(const u16 * pal, u32 size);
void SpellFx_RegisterBgGfx(const void * img, u32 size);
void SpellFx_RegisterBgPal(const u16 * pal, u32 size);
// ??? sub_08050650
// ??? sub_0805067C
// ??? sub_080506AC
s16 EfxAdvanceFrameLut(s16 *ptime, s16 *pcount, const s16 lut[]);
// ??? sub_0805076C
int EfxGetCamMovDuration(void);
// ??? sub_08050798
void EfxTmFill(u32 val);
void SetEkrFrontAnimPostion(int pos, s16 x, s16 y);
int sub_08050808(void);
void sub_08050814(int);
void NewEfxspdquake(struct Anim * anim);
// ??? efxSPDQuake_Loop_A
// ??? efxSPDQuake_Loop_B
bool SetupBanim(void);
void BeginAnimsOnBattleAnimations(void);
// ??? EkrBattleEndRountine
// ??? MainUpdate_8055C68
// ??? NewEkrBattleStarting
// ??? ekrBaStart_InitScreen
// ??? ekrBaStart_SreenFailIn
// ??? ekrBaStart_InitBattleScreen
// ??? ekrBaStart_ExecEkrBattle6C
// ??? ekrBaStart_8055FE8
// ??? ekrBaStart_8056024
// ??? ekrBaStart_8056078
// ??? NewEkrbattleending
// ??? ekrBattleEnding_80560F0
// ??? ekrBattleEnding_8056170
// ??? ekrBattleEnding_80561C8
// ??? ekrBattleEnding_8056228
// ??? ekrBattleEnding_8056288
// ??? ekrBattleEnding_8056310
// ??? ekrBattleEnding_8056390
// ??? sub_8051A38
// ??? NewEkrBaseKaiten
// ??? EkrBaseKaitenMain
void NewEkrUnitKakudai(int identifier);
// ??? UnitKakudai1
// ??? UnitKakudai2
// ??? sub_805226C
void NewEkrWindowAppear(int identifier, int);
bool CheckEkrWindowAppearUnexist(void);
// ??? EkrWindowAppearMain
void NewEkrNamewinAppear(int identifier, int duration, int delay);
// ??? CheckEkrNamewinAppearUnexist
// ??? EkrNamewinAppearDelay
// ??? EkrNamewinAppearMain
// ??? NewEkrBaseAppear
// ??? sub_80524A4
// ??? EkrBaseAppearMain
bool PrepareBattleGraphicsMaybe(void);
u16 GetBattleAnimationId_WithUnique(struct Unit * unit, const struct BattleAnimDef * pBattleAnimDef, u16, int * out);
// ??? GetBanimTerrainGround
// ??? GetBanimBackgroundIndex
// ??? GetSpellAnimId
// ??? UnsetMapStaffAnim
void ParseBattleHitToBanimCmd(void);
bool CheckBattleHasHit(void);
int GetBattleAnimCharacterUniquePalIndex(struct Unit * unit, int index);
u16 * FilterBattleAnimCharacterPalette(s16 index, u16 item);
int GetAllegienceId(u32 arg);
void EkrPrepareBanimfx(struct Anim * anim, u16 index);
s16 GetBattleAnimRoundType(int index);
s16 GetBattleAnimRoundTypeFlags(int);
s16 GetEfxHp(int index);
s16 GetEfxHpModMaybe(int index);
u16 IsItemDisplayedInBattle(u16 item);
u16 IsWeaponLegency(u16 item);
bool EkrCheckAttackRound(u16 round);
void SetBattleScriptted(void);
void SetBattleUnscriptted(void);
bool CheckBattleScriptted(void);
void BattleAIS_ExecCommands(void);
void AnimScrAdvance(struct Anim * anim);

struct ProcEkrChienCHR {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x5C);

    /* 5C */ struct Anim * anim;
};

void NewEkrChienCHR(struct Anim * anim);
void EkrChienCHRMain(struct ProcEkrChienCHR * proc);

void RegisterAISSheetGraphics(struct Anim * anim);
void ApplyBanimUniquePalette(u32 * buf, int pos);
int GetBanimPalette(int banim_id, int pos);
void UpdateBanimFrame(void);
void InitMainAnims(void);
void InitBattleAnimFrame(int round_type_left, int round_type_right);
void InitLeftAnim(int);
void InitRightAnim(int);
void SwitchAISFrameDataFromBARoundType(struct Anim * anim, int);
int GetAISLayerId(struct Anim * anim);
int GetAnimPosition(struct Anim * anim);
int CheckRoundMiss(s16 type);
int CheckRound1(s16 type);
int CheckRound2(s16 type);
int CheckRoundCrit(struct Anim * anim);
struct Anim * GetAnimAnotherSide(struct Anim * anim);
s16 GetAnimRoundType(struct Anim * anim);
s16 GetAnimNextRoundType(struct Anim * anim);
s16 GetAnimRoundTypeAnotherSide(struct Anim * anim);
s16 GetAnimNextRoundTypeAnotherSide(struct Anim * anim);
void SetAnimStateHidden(int pos);
void SetAnimStateUnHidden(int pos);
// ??? sub_080548CC
// ??? sub_08054A68
// ??? sub_08054A8C
// ??? InitMainMiniAnim

/* ekrmainmini */
struct BanimUnkStructComm {
    /* 00 */ s16 unk00; // terrain L
    /* 02 */ s16 unk02; // pal ID L
    /* 04 */ s16 unk04; // chr L
    /* 06 */ s16 unk06; // terrain R
    /* 08 */ s16 unk08; // pal ID R
    /* 0A */ s16 unk0A; // chr R
    /* 0C */ s16 unk0C;
    /* 0E */ s16 unk0E;
    /* 10 */ u16 unk10;
    /* 14 */ ProcPtr proc14; // sub emulator proc a
    /* 18 */ ProcPtr proc18; // sub emulator proc b
    /* 1C */ void * unk1C;
    /* 20 */ void * unk20;
    /* 24 */ void * unk24;
};

struct AnimMagicFxBuffer
{
    /* 00 */ u16 magic_func_idx;
    /* 02 */ u16 x_offset_bg;
    /* 04 */ u16 y_offset_bg;
    /* 06 */ u16 x_offset_obj;
    /* 08 */ u16 y_offset_obj;
    /* 0A */ u16 bg_chr;
    /* 0C */ u16 bg_pal_id;
    /* 0E */ u16 obj_chr;
    /* 10 */ u16 obj_pal_id;
    /* 12 */ u16 bg;
    /* 14 */ u16 * bg_tm_buf;
    /* 18 */ void * bg_img_buf;
    /* 1C */ void * bg_tsa_buf;
    /* 20 */ void * obj_img_buf;
    /* 24 */ void (*reset_callback)(void);
};

struct AnimBuffer {
    /* 00 */ u8 unk_00;
    /* 01 */ u8 genericPalId;
    /* 02 */ u16 xPos;
    /* 04 */ u16 yPos;
    /* 06 */ s16 animId;
    /* 08 */ s16 charPalId;
    /* 0A */ u16 roundType;
    /* 0C */ u16 state2;
    /* 0E */ u16 oam2Tile;
    /* 10 */ u16 oam2Pal;
    /* 14 */ struct Anim * anim1;
    /* 18 */ struct Anim * anim2;
    /* 1C */ void * pImgSheetBuf;
    /* 20 */ void * unk_20; // pal
    /* 24 */ void * unk_24; // rtlOam
    /* 28 */ void * unk_28; // frameData
    /* 2C */ const void * unk_2C; // sheetPointer
    /* 30 */ void * unk_30; // magicEffects
    /* 34 */ void * unk_34; // ProcPtr; Procs_ekrUnitMainMini
};

extern struct BanimUnkStructComm EkrMainMiniConf_0201FAD0;

void sub_08054C8C(struct AnimBuffer *);
// ??? sub_08054E00
void sub_08054E10(struct AnimBuffer *, s16, s16);
// ??? sub_08054E2C
s8 sub_08054E3C(struct AnimBuffer *);
void sub_08054E5C(struct AnimBuffer *);
// ??? sub_08054E70
void NewEfxAnimeDrvProc(void);
void EndEfxAnimeDrvProc(void);
// ??? sub_80556A4
void NewEkrUnitMainMini(struct AnimBuffer *);
void sub_08054EF0(struct AnimBuffer *);
// ??? EkrUnitMainMiniMain
void sub_08054F30(struct BanimUnkStructComm * conf); // FE8U: void sub_805AA68(struct BanimUnkStructComm * buf)
void sub_080552DC(struct BanimUnkStructComm * conf);
void sub_08055308(struct BanimUnkStructComm * conf, s16 x1, s16 y1, s16 x2, s16 y2);
// ??? sub_08055320
// ??? sub_08055468
// ??? sub_8055CCC
// ??? GetBattleAnimArenaFlag
// ??? sub_080554FC
// ??? PlayDeathSoundForArena
// ??? sub_0805555C
// ??? BeginAnimsOnBattle_Arena
// ??? ExecBattleAnimArenaExit
// ??? NewEkrTogiInitPROC
// ??? ekrTogiInit_Init
// ??? ekrTogiInit_LoadGfx
// ??? sub_8055EA4
// ??? sub_8055F08
// ??? NewEkrTogiEndPROC
// ??? sub_8055F34
// ??? sub_8055F60
// ??? sub_8055FC4
// ??? NewEkrTogiColor
// ??? EndEkrTogiColor
// ??? ekrTogiColor_Loop
void StartSpellAnimation(struct Anim * anim);
// ??? nullsub_49
// ??? NewefxRestRST
// ??? sub_80560E8
// ??? efxRestRSTMain
// ??? NewEfxTwobaiRST
// ??? EfxTwobaiRSTMain
// ??? NewDummvRST
// ??? sub_8056228
// ??? DummvRSTMain
// ??? NewEfxRestWIN
// ??? EfxRestWINMain
// ??? EfxMagicHBlank_08055BE0
// ??? EfxMagicHBlank_08055C08
// ??? EfxMagicHBlank_08055C30
// ??? EfxMagicHBlank_08055C6C
// ??? EfxMagicHBlank_08055CA8
// ??? NewEfxRestWINH
void NewEfxRestWINH_(struct Anim *anim, int a, int b);
// ??? sub_805660C
// ??? EfxRestWINH_Loop_B
void NewEfxALPHA(struct Anim * anim, int a, int b, int c, int d, int e);
// ??? EfxALPHAMain
// ??? StartSubSpell_efxCircleWIN
// ??? EfxCircleWINMain
void StartSpellThing_MagicQuake(struct Anim *, int, int);
// ??? Loop6C_efxMagicQUAKE
// ??? StartSpellAnimDummy
// ??? EfxDummymagicMain
// ??? sub_8056C40
// ??? EfxTeonoMain
// ??? NewEfxTeonoOBJ
// ??? EfxTeonoObjMain
// ??? EfxTeonoObjEnd
// ??? NewEfxTeonoOBJ2
// ??? EfxTeonoObj2Main
// ??? NewEfxTeonoSE
// ??? sub_8056F40
// ??? EfxTeonoSeMain
// ??? sub_8056F98
// ??? EfxArrowMain
// ??? NewEfxArrowOBJ
// ??? EfxArrowObjMain
// ??? sub_8057120
// ??? sub_805717C
// ??? sub_80571D8
// ??? sub_8057234
// ??? sub_8057290
// ??? sub_80572EC
// ??? sub_8057348
// ??? sub_80573A4
// ??? sub_8057400
// ??? sub_805745C
// ??? sub_80574B8
// ??? EfxTeyariMain
// ??? NewEfxTeyariOBJ
// ??? EfxTeyariObjMain
// ??? sub_8057664
// ??? efxSong_Loop_Main
// ??? StartSubSpell_efxSongBG
// ??? sub_805780C
// ??? StartSubSpell_efxSongOBJ
// ??? sub_80578F0
// ??? sub_8057924
// ??? efxDance_Loop_Main
// ??? StartSpellAnimBallista
// ??? efxShooter_Loop_Main
// ??? StartSubSpell_efxShooterOBJ
// ??? efxShooterOBJ_Loop
// ??? sub_8057C24
// ??? efxSpell11_Loop
// ??? StartSubSpell_efxSpell11BG
// ??? efxSpell11BG_Loop
// ??? StartSubSpell_efxSpell11BGScroll
// ??? efxSpell11BGScroll_Loop
// ??? StartSubSpell_efxSpell11BGCOL
// ??? sub_8057F38
// ??? sub_8057F84
// ??? efxHurtmut_Loop_Main
// ??? StartSubSpell_efxHurtmutOBJ
// ??? sub_80580EC
// ??? sub_8058120
// ??? efxFirebreath_Loop_Main
// ??? StartSubSpell_efxFirebreathOBJ
// ??? efxFirebreathOBJ_Loop
// ??? StartSubSpell_efxFirebreathBG
// ??? efxFirebreathBG_Loop
// ??? StartSubSpell_efxFirebreathBGCOL
// ??? efxFirebreathBGCOL_Loop
// ??? sub_805843C
// ??? efxIcebreath_Loop_Main
// ??? StartSubSpell_efxIcebreathOBJ
// ??? sub_805856C
// ??? sub_8058584
// ??? efxDarkbreath_Loop_Main
// ??? StartSubSpell_efxDarkbreathBG
// ??? sub_8058698
// ??? StartSubSpell_efxDarkbreathBGCOL
// ??? sub_805872C
// ??? StartSubSpell_efxDarkbreathOBJ
// ??? sub_80587F8
// ??? sub_805882C
// ??? Loop6C_efxThunder
// ??? NewEfxThunderBG
// ??? EfxThunderBGMain
// ??? NewEfxThunderBGCOL
// ??? sub_8058A4C
// ??? NewEfxThunderOBJ
// ??? EfxThunderOBJMain
// ??? StartSpellAnimFire
// ??? StartSpellAnimElfire
// ??? Loop6C_efxFire
// ??? NewEfxFireBG
// ??? sub_8058D18
// ??? NewEfxFireOBJ
// ??? EfxFireOBJ_Loop
// ??? StartSubSpell_efxFireHITBG
// ??? sub_8058EC8
// ??? StartSubSpell_efxElfireBG
// ??? EfxElfireBG_Loop
// ??? StartSubSpell_efxElfireBGCOL
// ??? sub_805903C
// ??? StartSubSpell_efxElfireOBJ
// ??? EfxElfireObj_Loop
// ??? sub_8059138
// ??? efxFimbulvetr_Loop_Main
// ??? StartSubSpell_efxFimbulvetrBGTR
// ??? sub_8059330
// ??? StartSubSpell_efxFimbulvetrBG
// ??? sub_8059418
// ??? StartSubSpell_efxFimbulvetrOBJ
// ??? efxFimbulvetrOBJ_Loop
// ??? StartSubSpell_efxFimbulvetrOBJ2
// ??? sub_805955C
// ??? StartSubSpell_efxFimbulvetrOBJ2Fall
// ??? efxFimbulvetrOBJ2Fall_Loop
// ??? sub_805979C
// ??? efxThunderstorm_Loop_Main
// ??? StartSubSpell_efxThunderstormBG
// ??? efxThunderstormBG_Loop
// ??? StartSubSpell_efxThunderstormOBJ
// ??? efxThunderstormOBJ_Loop
// ??? efxThunderstormOBJ_End
// ??? StartSubSpell_efxThunderstormCOLOR
// ??? efxThunderstormColor_Loop_A
// ??? efxThunderstormColor_Loop_B
// ??? efxThunderstormColor_Loop_C
// ??? StartSubSpell_efxThunderstormDARK
// ??? efxThunderstormDark_Loop_A
// ??? efxThunderstormDark_Loop_B
// ??? nullsub_50
// ??? sub_8059BF4
// ??? efxMistyRain_Loop_Main
// ??? StartSubSpell_efxMistyrainBG
// ??? StartSubSpell_efxMistyrainBG2
// ??? sub_8059E80
// ??? StartSubSpell_efxMistyRainOBJ
// ??? StartSubSpell_efxMistyrainOBJ2
// ??? sub_8059F74
// ??? sub_8059F8C
// ??? sub_8059FC8
// ??? sub_805A004
// ??? efxMistyRainObj2_08059858
// ??? efxMistyRainObj2_08059884
// ??? sub_805A090
// ??? efxResire_Loop_Main
// ??? StartSubSpell_efxResireBG
// ??? StartSubSpell_efxResireBG2
// ??? efxResireBG_Loop_A
// ??? efxResireBG_Loop_B
// ??? efxResireBG_Loop_C
// ??? efxResireBG_Loop_D
// ??? sub_805A530
// ??? StartSubSpell_efxResireRST
// ??? efxResireRST_Loop
// ??? sub_805A60C
// ??? efxLightning_Loop_Main
// ??? StartSubSpell_efxLightningBG
// ??? efxLightningBG_Loop
// ??? StartSpellAnimPurge
// ??? sub_0805A094
// ??? efxPurge_Loop_Main
// ??? StartSubSpell_efxPurgeBG
// ??? efxPurgeBG_Loop
// ??? StartSubSpell_efxPurgeOBJRND
// ??? efxPurgeOBJRND_Loop
// ??? StartSubSpell_efxPurgeOBJ
// ??? sub_805ABC0
// ??? sub_805ABD8
// ??? efxBolganone_Loop
// ??? StartSubSpell_efxBolganoneBG
// ??? efxBolganoneBG_Loop
// ??? StartSubSpell_efxBolganoneBGCOL
// ??? sub_805AF28
// ??? StartSubSpell_efxBolganoneBG2
// ??? efxBolganoneBG2_Loop
// ??? StartSubSpell_efxBolganoneOBJ
// ??? efxBolganoneOBJ_Loop
// ??? StartSubSpell_efxBolganoneOBJChild
// ??? efxBolganoneOBJChild_Loop
// ??? StartSubSpell_efxBolganoneBG3
// ??? efxBolganoneBG3_Loop
// ??? StartSubSpell_efxBolganoneOBJ2
// ??? efxBolganoneOBJ2_Loop
// ??? StartSubSpell_efxBolganoneOBJ2Child
// ??? efxBolganoneOBJ2Child_Loop
// ??? StartSubSpell_efxBolganoneWOUT
// ??? sub_805B610
// ??? sub_805B678
// ??? efxDivine_Loop_Main
// ??? StartSubSpell_efxDivineBG
// ??? StartSubSpell_efxDivineBG_2
// ??? StartSubSpell_efxDivineBG_3
// ??? efxDivineBG_Loop
// ??? StartSubSpell_efxDivineOBJ
// ??? efxDivineOBJ_Loop
// ??? sub_805BA78
// ??? efxSpell21_Loop
// ??? StartSubSpell_efxSpell21BG
// ??? efxSpell21BG_Loop
// ??? StartSubSpell_efxSpell21BG2
// ??? efxSpell21BG2_Loop
// ??? StartSubSpell_efxSpell21BGCOL
// ??? sub_805BE90
// ??? StartSubSpell_efxSpell21OBJ
// ??? efxSpell21OBJ_Loop
// ??? StartSubSpell_efxSpell21OBJChild
// ??? sub_805C064
// ??? StartSubSpell_efxSpell21OBJ2
// ??? efxSpell21OBJ2_Loop
// ??? StartSubSpell_efxSpell21OBJ3
// ??? efxSpell21OBJ3_Loop
// ??? StartSubSpell_efxSpell21OBJ3Child
// ??? sub_805C35C
// ??? nullsub_51
// ??? sub_805C3D8
// ??? efxHazymoon_Loop_Main
// ??? StartSubSpell_efxHazymoonBG_A
// ??? StartSubSpell_efxHazymoonBG_B
// ??? StartSubSpell_efxHazymoonBG_C
// ??? sub_805C700
// ??? StartSubSpell_efxHazymoonOBJ2
// ??? sub_805C7F8
// ??? sub_805C810
// ??? sub_805C86C
// ??? sub_805C8C8
// ??? StartSubSpell_efxHazymoonOBJ3
// ??? efxHazymoonOBJ3_Loop
// ??? StartSubSpell_efxHazymoonOBJ3RND
// ??? sub_805CA20
// ??? sub_805CA38
// ??? efxFenrir_Loop_Main
// ??? StartSubSpell_efxFenrirBG
// ??? sub_805CCE8
// ??? efxFenrirBG_Loop
// ??? StartSubSpell_efxFenrirBGCOL
// ??? sub_805CD7C
// ??? sub_805CD8C
// ??? StartSubSpell_efxFenrirOBJ
// ??? efxFenrirOBJ_Loop
// ??? StartSubSpell_efxFenrirBG2_A
// ??? StartSubSpell_efxFenrirBG2_B
// ??? sub_805CF78
// ??? StartSubSpell_efxFenrirOBJ2
// ??? efxFenrirOBJ2_Loop
// ??? StartSubSpell_efxFenrirOBJ2Chiri
// ??? efxFenrirOBJ2Chiri_Loop
// ??? sub_805D1D8
// ??? efxLive_Loop_Main
// ??? sub_805D328
// ??? efxRelive_Loop_Main
// ??? sub_805D4CC
// ??? efxRecover_Loop_Main
// ??? sub_805D670
// ??? efxReblow_Loop_Main
// ??? StartSubSpell_efxLiveBG_A
// ??? StartSubSpell_efxLiveBG_B
// ??? efxLiveBG_Loop
// ??? StartSubSpell_efxLiveBGCOL_A
// ??? StartSubSpell_efxLiveBGCOL_B
// ??? sub_805DAE4
// ??? StartSubSpell_efxLiveALPHA
// ??? sub_805DB68
// ??? efxLiveALPHA_Loop_B
// ??? StartSubSpell_efxLiveOBJ
// ??? StartSubSpell_efxReserveOBJ
// ??? sub_805DCDC
// ??? efxReserveOBJ_Loop_A
// ??? sub_805DD44
// ??? StartSubSpell_efxReblowOBJ
// ??? efxReblowOBJ_Loop_A
// ??? sub_805DE8C
// ??? StartSpellAnimFortify
// ??? StartSpellAnimLatona
// ??? efxReserve_Loop_Main
// ??? StartSubSpell_efxReserveBG
// ??? efxReserveBG_Loop
// ??? StartSubSpell_efxReserveBGCOL
// ??? sub_805E110
// ??? StartSubSpell_efxReserveBG2
// ??? efxReserveBG2_Loop
// ??? StartSubSpell_efxReserveBGCOL2
// ??? sub_805E368
// ??? sub_805E3B0
// ??? efxRest_Loop_Main
// ??? StartSubSpell_efxRestBG
// ??? sub_805E564
// ??? StartSubSpell_efxRestOBJ
// ??? sub_805E640
// ??? sub_805E650
// ??? efxSilence_Loop_Main
// ??? StartSubSpell_efxSilenceBG
// ??? sub_805E820
// ??? StartSubSpell_efxSilenceOBJ
// ??? sub_805E8D0
// ??? sub_805E8E8
// ??? efxSleep_Loop_Main
// ??? StartSubSpell_efxSleepBG
// ??? sub_805EAB0
// ??? StartSubSpell_efxSleepOBJ
// ??? StartSubSpell_efxSleepOBJ2
// ??? sub_805EBA4
// ??? StartSubSpell_efxSleepSE
// ??? efxSleepSE_PlaySE
// ??? sub_805EBF8
// ??? sub_805EC08
// ??? efxHammarne_Loop_Main
// ??? StartSubSpell_efxHammarneBG
// ??? sub_805EDB8
// ??? StartSubSpell_efxHammarneOBJ
// ??? sub_805EE74
// ??? sub_805EE84
// ??? efxBerserk_Loop_Main
// ??? StartSubSpell_efxBerserkBG
// ??? efxBerserkBG_Loop
// ??? StartSubSpell_efxBerserkCLONE
// ??? sub_805F150
// ??? sub_805F1B4
// ??? StartSubSpell_efxBerserkOBJ
// ??? sub_805F21C
// ??? sub_805F234
// ??? sub_805F270
// ??? sub_805F2AC
// ??? sub_805F2E8
// ??? sub_805F324
// ??? sub_805F360
// ??? sub_805F39C
// ??? sub_805F3D8
// ??? sub_805F414
// ??? sub_805F450
// ??? sub_805F48C
// ??? efxMshield_Loop_Main
// ??? StartSubSpell_efxMshieldBG
// ??? sub_805F5F0
// ??? StartSubSpell_efxMshieldBGOBJ
// ??? StartSubSpell_efxMshieldBGOBJ2
// ??? sub_805F6E0
// ??? sub_805F6F8
// ??? efxShine_Loop_Main
// ??? StartSubSpell_efxShineBG
// ??? sub_805F860
// ??? StartSubSpell_efxShineBG2
// ??? efxShineBG2_Loop
// ??? StartSubSpell_efxShineBGCOL
// ??? sub_805FA28
// ??? StartSubSpell_efxShineOBJRND
// ??? efxShineOBJRND_Loop
// ??? StartSubSpell_efxShineOBJ
// ??? sub_805FBBC
// ??? sub_805FBE8
// ??? efxLuna_Loop_Main
// ??? StartSubSpell_efxLunaBG
// ??? sub_805FE7C
// ??? StartSubSpell_efxLunaSCR
// ??? efxLunaSCR_Loop
// ??? StartSubSpell_efxLunaSCR2
// ??? efxLunaSCR2_Loop
// ??? StartSubSpell_efxLunaBG2
// ??? sub_8060108
// ??? efxLunaBG2_Loop
// ??? StartSubSpell_efxLunaBGCOL
// ??? sub_8060198
// ??? sub_80601A8
// ??? StartSubSpell_efxLunaBG3
// ??? sub_806026C
// ??? StartSubSpell_efxLunaOBJ
// ??? efxLunaOBJ_Loop_A
// ??? efxLunaOBJ_Loop_B
// ??? efxLunaOBJ_Loop_C
// ??? efxLunaOBJ_Loop_D
// ??? StartSubSpell_efxLunaRST
// ??? efxLunaRST_Loop
// ??? sub_80605A4
// ??? efxExcalibur_Loop_Main
// ??? StartSubSpell_efxExcaliburBG
// ??? sub_806079C
// ??? efxExcaliburBG_Loop_A
// ??? efxExcaliburBG_Loop_B
// ??? sub_8060898
// ??? StartSubSpell_efxExcaliburBGCOL
// ??? sub_80608FC
// ??? sub_806090C
// ??? StartSubSpell_efxExcaliburSCR
// ??? efxExcaliburSCR_Loop
// ??? StartSubSpell_efxExcaliburSCR2
// ??? efxExcaliburSCR2_Loop
// ??? StartSubSpell_efxExcaliburBG2
// ??? sub_8060B64
// ??? sub_8060B80
// ??? StartSubSpell_efxExcaliburBGCOL2
// ??? sub_8060BE4
// ??? StartSubSpell_efxExcaliburBG3
// ??? sub_8060D10
// ??? sub_8060D2C
// ??? StartSubSpell_efxExcaliburBGCOL3
// ??? sub_8060D90
// ??? StartSubSpell_efxExcaliburOBJ
// ??? sub_8060E44
// ??? sub_8060E70
// ??? efxGespenst_Loop
// ??? StartSubSpell_efxGespenstBG
// ??? efxGespenstBG_Loop
// ??? StartSubSpell_efxGespenstBG2
// ??? sub_8061274
// ??? efxGespenstBG2_Loop
// ??? StartSubSpell_efxGespenstBG4
// ??? sub_806137C
// ??? sub_8061398
// ??? StartSubSpell_efxGespenstBGCOL2
// ??? sub_8061400
// ??? StartSubSpell_efxGespenstOBJ
// ??? sub_80614B0
// ??? StartSubSpell_efxGespenstOBJ2
// ??? sub_8061558
// ??? sub_8061570
// ??? sub_806158C
// ??? sub_80615A8
// ??? sub_80615C4
// ??? efxOura_Loop_Main
// ??? StartSubSpell_efxOuraBG_A
// ??? StartSubSpell_efxOuraBG_B
// ??? StartSubSpell_efxOuraBG_C
// ??? sub_8061914
// ??? StartSubSpell_efxOuraBG2
// ??? sub_8061A50
// ??? sub_8061A6C
// ??? StartSubSpell_efxOuraBGCOL
// ??? sub_8061AD4
// ??? StartSubSpell_efxOuraBG3
// ??? sub_8061B7C
// ??? sub_8061BE0
// ??? efxLuce_Loop
// ??? StartSpellBG_LuceBG
// ??? sub_8061DE8
// ??? StartSubSpell_efxLuceBG2
// ??? sub_8061EE8
// ??? efxLuceBG2_Loop
// ??? sub_08061760
// ??? sub_080617DC
// ??? sub_8062028
// ??? StartSubSpell_efxLuceWOUT
// ??? sub_8062094
// ??? StartSubSpell_efxLuceBGCOL
// ??? efxLuceBGCOL_Loop
// ??? sub_8062350
// ??? efxEreshkigal_Loop
// ??? StartSubSpell_efxEreshkigalOBJ
// ??? efxEreshkigalOBJ_Loop
// ??? StartSubSpell_efxEreshkigalOBJChild
// ??? sub_8062640
// ??? StartSubSpell_efxEreshkigalOBJ2
// ??? sub_80626BC
// ??? sub_80626D4
// ??? StartSubSpell_efxEreshkigalBG
// ??? sub_8062748
// ??? StartSubSpell_efxSuperdruidBG3
// ??? sub_8062824
// ??? StartSubSpell_efxEreshkigalWhiteOut
// ??? efxEreshkigalWhiteOut_Loop
// ??? StartSubSpell_efxSuperdruidOBJ2
// ??? sub_8062A2C
// ??? StartSubSpell_efxEreshkigalOBJ3
// ??? sub_8062A9C
// ??? StartSpellAnimFillasMight
// ??? StartSpellAnimThorsIre
// ??? StartSpellAnimNinisGrace
// ??? StartSpellAnimSetsLitany
// ??? efxDancepara_Loop
// ??? NewEfxDamageMojiEffect
// ??? efxDamageMojiEffectMain
// ??? NewEfxDamageMojiEffectOBJ
// ??? efxDamageMojiEffectOBJMain
void NewEfxPierceCritical(struct Anim * anim);
// ??? efxCriricalEffectMain
// ??? NewEfxCriricalEffectBG
// ??? efxCriricalEffectBGMain
// ??? NewEfxCriricalEffectBGCOL
// ??? sub_8062E60
void NewEfxNormalEffect(struct Anim * anim);
// ??? efxNormalEffectMain
// ??? NewEfxNormalEffectBG
// ??? sub_8062F88
void NewEfxYushaSpinShield(struct Anim * anim, int type);
// ??? sub_8063008
// ??? NewEfxYushaSpinShieldOBJ
// ??? efxYushaSpinShieldOBJ_806CD14
// ??? efxYushaSpinShieldOBJ_806CD7C
// ??? efxYushaSpinShieldOBJ_806CDA4
// ??? efxYushaSpinShieldOBJ_806CE08
void NewEfxHurtmutEff00(struct Anim * anim);
// ??? sub_80631F4
// ??? NewEfxHurtmutEff00OBJ
// ??? sub_8063244
// ??? sub_8063290
// ??? sub_80632DC
// ??? NewEfxHurtmutEff01OBJ
// ??? sub_8063344
// ??? sub_8063390
// ??? sub_80633DC
void NewEfxMagfcast(struct Anim * anim, int);
// ??? EfxMagfcastMain
// ??? NewEfxMagfcastBG
// ??? sub_806355C
void NewEfxSunakemuri(struct Anim * anim, int);
// ??? sub_80635E4
// ??? NewEfxSunakemuriOBJ
// ??? EfxSunakemuriOBJMain
void NewEfxLokmsuna(struct Anim * anim);
// ??? sub_8063830
// ??? NewEfxLokmsunaOBJ
// ??? EfxLokmsunaIOBJMain
void NewEfxKingPika(struct Anim * anim);
// ??? EfxKingPikaMain
void NewEfxFlashFX(struct Anim * anim);
// ??? EfxFlashFXMain
// ??? NewEfxSongOBJ2
// ??? EfxSongOBJ2Main
// ??? NewEfxDanceOBJ
// ??? sub_8063B30
void NewEfxSpecalEffect(struct Anim *anim);
// ??? sub_8063C14
// ??? NewEfxSRankWeaponEffect
// ??? EfxSRankWeaponEffectMain
// ??? NewEfxSRankWeaponEffectBG
// ??? EfxSRankWeaponEffectBGMain
// ??? NewEfxSRankWeaponEffectSCR
// ??? EfxSRankWeaponEffectSCRMain
// ??? NewEfxSRankWeaponEffectSCR2
// ??? EfxSRankWeaponEffectSCR2Main
// ??? sub_8063E2C
// ??? EfxMagdhisEffectMain
// ??? NewEfxMagdhisEffectBG
// ??? EfxMagdhisEffectBGMain
void NewEfxMantBatabata(struct Anim *anim);
// ??? EfxMantBatabata_Loop1
// ??? EfxMantBatabata_Loop2
void NewEfxChillEffect(struct Anim *anim);
// ??? EfxChillEffectMain
// ??? NewEfxChillEffectBG
// ??? sub_806426C
// ??? NewEfxChillEffectBGCOL
// ??? sub_80642F4
void NewEfxChillAnime(struct Anim * anim, int);
// ??? EfxChillAnime_Loop

struct ProcEfxDrsmmoyaBG {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;

    STRUCT_PAD(0x2E, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const u16 * frame_config;
    /* 4C */ u16 * const * tsal;
    /* 50 */ u16 * const * tsar;
    /* 54 */ u16 * const * img;
    /* 58 */ u16 * img_bak;
    /* 5C */ struct Anim * anim;
};

struct ProcEfxDrsmmoyaScroll {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 step;

    STRUCT_PAD(0x30, 0x44);

    /* 44 */ int duration;
    /* 48 */ int speed;

    STRUCT_PAD(0x4C, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcEfxDrsmmoyaScrollCOL {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;

    STRUCT_PAD(0x2E, 0x44);

    /* 44 */ int duration1;
    /* 48 */ int duration2;
    /* 4C */ int duration3;

    STRUCT_PAD(0x50, 0x5C);

    /* 5C */ struct Anim * anim;

    STRUCT_PAD(0x60, 0x64);

    /* 64 */ struct ProcEfxDrsmmoyaScroll * procefx;
};

void NewEfxDrsmmoya(struct Anim * anim);
void EfxDrsmmoya_Loop(struct ProcEfx * proc);
void NewEfxDrsmmoyaBG(struct Anim * anim);
void EfxDrsmmoyaBG_Loop(struct ProcEfxDrsmmoyaBG * proc);
ProcPtr NewEfxDrsmmoyaScroll(struct Anim * anim, int type);
void EfxDrsmmoyaScroll_Loop(struct ProcEfxDrsmmoyaScroll * proc);
void NewEfxDrsmmoyaScrollCOL(struct Anim * anim, struct ProcEfxDrsmmoyaScroll * procefx, int duration1, int duration2, int duration3);
void EfxDrsmmoyaScrollCOL_Loop1(struct ProcEfxDrsmmoyaScrollCOL * proc);
void EfxDrsmmoyaScrollCOL_Delay(struct ProcEfxDrsmmoyaScrollCOL * proc);
void EfxDrsmmoyaScrollCOL_Loop3(struct ProcEfxDrsmmoyaScrollCOL * proc);
void ResetClassReelSpell(void);
void EndActiveClassReelSpell(void);
void EndActiveClassReelBgColorProc(void);
// ??? SetActiveClassReelSpell
// ??? SetActiveCRSpellBgColorProc
// ??? GetMagicEffectBufferFor
// ??? SetCRSpellBgPosition
// ??? ClearCRSpellBgTmBuf
// ??? CRSpellCreateFrontAnim
// ??? CRSpell_WriteBgMap
// ??? CRSpell_RegisterBgGfx
// ??? CRSpell_RegisterBgPal
// ??? CRSpell_RegisterObjGfx
// ??? CRSpell_RegisterObjPal
// ??? StartClassReelSpellAnim
// ??? nullsub_52
// ??? sub_8064A54
// ??? efxopFire_Loop_Main
// ??? StartCRSubSpell_efxopFireBG
// ??? sub_8064AD0
// ??? efxopFireBG_Loop
// ??? StartCRSubSpell_efxopFireOBJ
// ??? sub_8064BC0
// ??? sub_8064BE4
// ??? efxopThunder_Loop_Main
// ??? StartCRSubSpell_efxopThunderBG
// ??? efxopThunderBG_Loop
// ??? StartCRSubSpell_efxopThunderBGCOL
// ??? sub_8064D40
// ??? StartCRSubSpell_efxopThunderOBJ
// ??? sub_8064DFC
// ??? sub_8064E20
// ??? efxopLive_Loop_Main
// ??? StartCRSubSpell_efxopLiveBG
// ??? efxopLiveBG_Loop
// ??? StartCRSubSpell_efxopLiveBGCOL
// ??? sub_8064F84
// ??? StartCRSubSpell_efxopLiveALPHA
// ??? sub_8064FF4
// ??? efxopLiveALPHA_Loop_B
// ??? StartCRSubSpell_efxopLiveOBJ
// ??? efxopLiveOBJ_Loop
// ??? sub_8065120
// ??? efxopLightning_Loop_Main
// ??? StartCRSubSpell_efxopLightningBG
// ??? efxopLightningBG_Loop

/* banim_ekrdragon.h */

/* efxutils */
void sub_0806693C(u16 * tm, u16 width, u16 height, int pal, int chr);
void FillBGRect(u16 * tm, u16 width, u16 height, int pal, int chr);
void sub_080669F4(u16 * tm, u16 width, u16 height, int pal, int chr);
void EfxTmModifyPal(u16 * tm, u16 width, u16 height);
void EfxTmCpyBG(const void * ptr1, void * ptr2, u16 width, u16 height, int pal, int chr);
void EfxTmCpyBgHFlip(const u16 * tsa, u16 * tm, u16 width, u16 height, int pal, int chr);
void EfxTmCpyExt(const u16 * src, s16 src_width, u16 * dst, s16 dst_width, u16 width, u16 hight, int pal, int chr);
void EfxTmCpyExtHFlip(const u16 * src, s16 src_width, u16 * dst, s16 dst_width, u16 width, u16 hight, int pal, int chr);
void sub_08066CA0(u16 * tm, int arg1, int arg2);
void EkrModifyBarfx(u16 * tm, int arg);
bool EkrPalModifyUnused(u16 * pal_start, u16 * pal_end, u16 * dst, u16 amount, u16 start, u16 end);
void EfxPalBlackInOut(u16 * pal_buf, int line, int length, int ref);
void EfxPalWhiteInOut(u16 * pal_buf, int line, int length, int ref);
void EfxPalFlashingInOut(u16 * pal_buf, int line, int length, int r0, int g0, int b0);
void EfxPalModifyPetrifyEffect(u16 * pal_buf, int line, int length);
void EfxSplitColor(u16 * pal, u8 * dst, u32 length);
void EfxSplitColorPetrify(u16 * src, u8 * dst, u32 length);
void sub_080671AC(s8 * src1, s8 * src2, u16 * pal, u32 length, int ref);
void EfxDecodeSplitedPalette(u16 * dst, s8 * src1, s8 * src2, s16 * src3, u32 length, int ref, int unk);
void EfxChapterMapFadeOUT(int speed);
int sub_080672E8(int a);
struct ProcEkrSubAnimeEmulator * NewEkrsubAnimeEmulator(int x, int y, const AnimScr * anim_scr, int type, int oam2Base, int oamBase, ProcPtr parent);
void EkrsubAnimeEmulatorMain(struct ProcEkrSubAnimeEmulator * proc);
int GetAnimSpriteRotScaleX(u32 header);
int GetAnimSpriteRotScaleY(u32 header);
void BanimUpdateSpriteRotScale(void * src, struct AnimSpriteData * out, s16 x, s16 y, int unused);

/* efxsound */
struct ProcEfxSoundSE {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;

    STRUCT_PAD(0x2E, 0x44);

    /* 44 */ int volume;
    /* 48 */ int index;
};

enum {
    EFX_HPT_CHANGED,
    EFX_HPT_DEFEATED,
    EFX_HPT_NOT_CHANGE,
};

void EfxPlaySE(int songid, int volume);
void Loop6C_efxSoundSE(struct ProcEfxSoundSE * proc);
// ??? DoM4aSongNumStop
// ??? EfxOverrideBgm
// ??? StopBGM1
// ??? UnregisterEfxSoundSeExist
// ??? RegisterEfxSoundSeExist
// ??? CheckEfxSoundSeExist
// ??? M4aPlayWithPostionCtrl
void EfxPlaySEwithCmdCtrl(struct Anim * anim, int);
// ??? GetEfxSoundType1FromTerrain
// ??? IsAnimSoundInPositionMaybe
// ??? GetEfxSoundType2FromBaseCon
s16 GetEfxHpChangeType(struct Anim * anim);
// ??? EfxPlayHittedSFX
// ??? EfxPlayCriticalHittedSFX
// ??? EfxCheckRetaliation
// ??? EfxCheckStaffType
// ??? EkrPlayMainBGM
// ??? EkrRestoreBGM
// ??? GetBanimBossBGM
// ??? GetProperAnimSoundLocation
void PlaySFX(int, int, int, int);
// ??? PlaySfxAutomatically

/* ekrclasschg */
// ??? EkrClasschgFinished
// ??? EndEkrClasschg
// ??? NewEkrClassChg
// ??? EkrClasschgMain
// ??? EkrClasschgRegisterDone
// ??? NewEkrClasschgBG1
// ??? NewEkrClasschgBG2
// ??? EfxClasschgBgMain
// ??? NewEfxClasschgBGSE00
// ??? EfxClasschgBGSE00Main
// ??? NewEfxClasschgBGSE01
// ??? EfxClasschgBGSE01Main
// ??? NewEfxClasschgOBJ
// ??? EfxClasschgOBJMain
// ??? NewEfxClasschgFIN
// ??? EfxClasschgFinMain
// ??? NewEfxClasschgCLONE
// ??? sub_8069118
// ??? nullsub_57
// ??? NewEfxBlackInOutUnit
// ??? EfxBlackInOutUnitMain
// ??? NewEfxClasschgRST
// ??? EfxClasschgRSTMain
// ??? CheckEkrLvupDone
// ??? EndEkrLevelUp
// ??? EkrLvup_InitStatusText
// ??? EkrLvup_DrawUpdatedStatus
// ??? EkrLvup_DrawUnitName
// ??? EkrLvup_DrawPreLevelValue
// ??? NewEkrLevelup
// ??? EkrLvup_OnPrepare
// ??? EkrLvup_InitScreen
// ??? EkrLvup_InitLevelUpBox
// ??? EkrLvup_SetBgs
// ??? EkrLvup_InitPalette
// ??? EkrLvup_PutWindowOnScreen
// ??? EkrLvup_PrepareApGfx
// ??? EkrLvup_Promo_WindowScroll0
// ??? EkrLvup_Promo_DrawPromoNewClassName
// ??? EkrLvup_Promo_WindowScroll1
// ??? EkrLvup_DrawNewLevel
// ??? EkrLvup_InitCounterForMainAnim
// ??? EkrLvup_MainAnime
// ??? EkrLvup_SetHBlank
// ??? sub_806A08C
// ??? EkrLvup_PutWindowOffScreen
// ??? EkrLvup_ResetScreen
// ??? EkrLvup_OnEnd
// ??? NewEfxPartsofScroll
// ??? EfxUpdatePartsofScroll
// ??? nullsub_58
// ??? sub_806A364
// ??? NewEfxPartsofScroll2
// ??? nullsub_59
// ??? EfxPartsofScroll2Main
// ??? NewEfxleveluphb
// ??? sub_806A4E0
// ??? sub_806A4EC
// ??? EfxleveluphbMain
// ??? EkrLvupHBlank
// ??? EfxPartsofScroll2HBlank
// ??? NewEfxlvupbg
// ??? EfxlvupbgMain
// ??? NewEfxLvupBG2
// ??? EfxLvupBg2Main
// ??? NewEfxLvupOBJ2
// ??? EfxLvupOBJ2CallBack
// ??? NewEfxLvupBGCOL
// ??? Loop6C1_EfxLvupBGCOL
// ??? sub_806A844
// ??? EkrLvupApfxInit
// ??? EkrLvupApfxMain
// ??? NewEkrLvupApfx
// ??? EkrLvupApfxEndEach
// ??? PutEkrLvupStatGainLabelGfx1
// ??? PutEkrLvupStatGainLabelGfx2
// ??? BanimDrawStatupAp
// ??? EobjLvup_DrawGain1
// ??? EobjLvup_DrawGain2
// ??? EobjLvup_WaitApfxEnd
// ??? CheckEkrTriangleInvalid
// ??? nullsub_10
// ??? NewEkrTriangle
// ??? EkrTriangleMain
// ??? NewEkrTriPegasusKnight
// ??? EkrTriPegasusKnightMain
// ??? NewEkrTriPegasusKnightBG
// ??? EkrTriPegasusKnightBgMain
// ??? NewEkrTriPegasusKnightOBJ
// ??? sub_806B134
// ??? NewEkrTriArmorKnight
// ??? EkrTriArmorKnightMain
// ??? NewEkrTriArmorKnightOBJ
// ??? EkrTriArmorKnightObjMain
// ??? NewEkrTriArmorKnightOBJ2
// ??? EkrTriArmorKnightObj2Main1
// ??? sub_806B598
// ??? NewEfxTriangleQUAKE
// ??? EfxTriangleQUAKEMain
// ??? PutBanimBgIMG
// ??? PutBanimBgTSA
// ??? PutBanimBgPAL
// ??? PutBanimBG
// ??? CheckEkrPopupDone
// ??? EndEkrPopup
// ??? EfxPlaySound5AVol100
// ??? EfxPlaySound5CVol100
// ??? MakeBattlePopupTileMapFromTSA
// ??? DrawBattlePopup
// ??? NewEkrPopup
// ??? EkrPopup_Delay
// ??? EkrPopup_DrawWRankUp
// ??? ekrPopup_WaitWRankUp
// ??? ekrPopup_DrawWRankUp2
// ??? ekrPopup_WaitWRankUp2
// ??? ekrPopup_DrawWpnBroke
// ??? ekrPopup_WaitWpnBroke
// ??? ekrPopup_DrawWpnBroke2
// ??? sub_806BEA0
// ??? ekrPopup_MarkEnd
// ??? nullsub_60
// ??? ekrPopup2_DrawWRankUp
// ??? sub_806BF3C
// ??? CheckBanimHensei
// ??? BeginAnimsOnBattle_Hensei
// ??? ExecEkrHenseiEnd

// ??? gUnk_08C09CE4
// ??? gUnk_08C09CE8
// ??? gUnk_08C09D08
// ??? gUnk_08C09D30
// ??? gUnk_08C09D48
// ??? gUnk_08C09D60
// ??? gUnk_08C09D90
// ??? gUnk_08C09DA8
// ??? gUnk_08C09DD8
// ??? gUnk_08C09E14
// ??? gUnk_08C09E50
// ??? gUnk_08C09E68
// ??? gUnk_08C09E80
// ??? gUnk_08C09E98
// ??? gUnk_08C09EB0
// ??? gUnk_08C09EC8
// ??? gUnk_08C09EE0
extern const struct ProcCmd ProcScr_ekrDispUP[];
extern struct ProcCmd ProcScr_efxHPBar[];
// ??? gUnk_08C09F38
// ??? gUnk_08C09F70
// ??? gUnk_08C09F98
// ??? gUnk_08C09FC0
// ??? gUnk_08C09FE8
// ??? gUnk_08C0A000
// ??? gUnk_08C0A030
// ??? gUnk_08C0A068
// ??? gUnk_08C0A088
// ??? gUnk_08C0A0A0
// ??? gUnk_08C0A0B8
extern struct ProcCmd ProcScr_EfxQuakePure[];
// ??? Pal_Portrait_09F
// ??? gUnk_08C0A150
// ??? gUnk_08C0A168
extern struct ProcCmd ProcScr_EfxHitQuake[];
extern struct ProcCmd ProcScr_efxFlashBG[];
extern struct ProcCmd ProcScr_efxWhiteOUT[];
extern struct ProcCmd ProcScr_efxWhiteIN[];
// ??? gUnk_08C0A218
// ??? gUnk_08C0A238
extern struct ProcCmd ProcScr_efxStatusUnit[];
extern struct ProcCmd ProcScr_EfxWeaponIcon[];
// ??? gUnk_08C0A2B0
// ??? gUnk_08C0A2E0
// ??? gUnk_08C0A320
// ??? gUnk_08C0A330
// ??? gUnk_08C0A350
// ??? gUnk_08C0A398
// ??? gUnk_08C0A3E8
// ??? gUnk_08C0A400
// ??? gUnk_08C0A420
// ??? gUnk_08C0A440
// ??? gUnk_08C0A460
// ??? gUnk_08C0A480
// ??? gUnk_08C0A4A0
// ??? gUnk_08C0A4C0
// ??? gUnk_08C0A4E0
// ??? gUnk_08C0A500
// ??? gUnk_08C0A520
// ??? gUnk_08C0A540
// ??? ProcScr_EkrUnitKakudai
// ??? gUnk_08C0A588
// ??? gUnk_08C0A5A0
// ??? gUnk_08C0A5C0
extern CONST_DATA AnimScr AnimScr_DefaultAnim[];
// ??? TsaConfs_BanimTmA
extern struct ProcCmd ProcScr_EkrChienCHR[];
// ??? ProcScr_EfxAnimeDrvProc
// ??? gUnk_08C0A640
// ??? gUnk_08C0A658
// ??? gUnk_08C0A688
// ??? gUnk_08C0A6B0
// ??? gUnk_08C0A6C8
// ??? gUnk_08C0BD7C
// ??? gUnk_08C0BE44
// ??? gUnk_08C0BED0
// ??? gUnk_08C0BF50
// ??? gUnk_08C0BFD0
// ??? gUnk_08C0CD3C
// ??? gUnk_08C0CDB0
// ??? gUnk_08C0D608
// ??? gUnk_08C0D638
// ??? gUnk_08C0D668
// ??? gUnk_08C0D684
// ??? gUnk_08C0D6C0
// ??? gEkrSpellAnimLut
// ??? gUnk_08C10828
extern const struct ProcCmd ProcScr_efxRestRST[];
extern const struct ProcCmd ProcScr_efxTwobaiRST[];
extern const struct ProcCmd ProcScr_DummvRST[];
extern const struct ProcCmd ProcScr_EfxRestWIN[];
// ??? gUnk_08C108A0
extern const struct ProcCmd ProcScr_efxALPHA[];
// ??? gUnk_08C108D8
// ??? gUnk_08C108F0
// ??? gUnk_08C10908
// ??? gUnk_08C10920
// ??? gUnk_08C10938
// ??? gUnk_08C10958
// ??? gUnk_08C10970
// ??? gUnk_08C10990
// ??? gUnk_08C109A8
// ??? gUnk_08C109C0
// ??? gUnk_08C109D8
// ??? gUnk_08C109F0
// ??? gUnk_08C10A08
// ??? gUnk_08C10A20
// ??? gUnk_08C10A8C
// ??? gUnk_08C10AF8
// ??? gUnk_08C10B10
// ??? gUnk_08C10B28
// ??? gUnk_08C10B40
// ??? gUnk_08C10B58
// ??? gUnk_08C10B70
// ??? gUnk_08C10B88
// ??? gUnk_08C10BA0
// ??? gUnk_08C10BC0
// ??? gUnk_08C10BD8
// ??? gUnk_08C10BF0
// ??? gUnk_08C10C08
// ??? gUnk_08C10C20
// ??? gUnk_08C10C38
// ??? gUnk_08C10C58
// ??? gUnk_08C10C70
// ??? gUnk_08C10C90
// ??? gUnk_08C10CA8
// ??? gUnk_08C10CC0
// ??? gUnk_08C10CF0
// ??? gUnk_08C10D10
// ??? gUnk_08C10D28
// ??? gUnk_08C10D40
// ??? gUnk_08C10D58
// ??? gUnk_08C10D60
// ??? gUnk_08C10D68
// ??? gUnk_08C10D88
// ??? gUnk_08C10DA0
// ??? gUnk_08C10DB8
// ??? gUnk_08C10DD0
// ??? gUnk_08C10E00
// ??? gUnk_08C10E30
// ??? gUnk_08C10E48
// ??? gUnk_08C10E60
// ??? gUnk_08C10EB4
// ??? gUnk_08C10F08
// ??? gUnk_08C10F20
// ??? gUnk_08C10F40
// ??? gUnk_08C10F58
// ??? gUnk_08C10F70
// ??? gUnk_08C10F88
// ??? gUnk_08C10FA0
// ??? gUnk_08C10FB8
// ??? gUnk_08C10FD0
// ??? gUnk_08C10FFC
// ??? gUnk_08C11028
// ??? gUnk_08C11040
// ??? gUnk_08C11058
// ??? gUnk_08C11070
// ??? gUnk_08C11088
// ??? gUnk_08C110A0
// ??? gUnk_08C110CC
// ??? gUnk_08C110F8
// ??? gUnk_08C11120
// ??? gUnk_08C11160
// ??? gUnk_08C11180
// ??? gUnk_08C11198
// ??? gUnk_08C111B0
// ??? gUnk_08C11254
// ??? gUnk_08C112F8
// ??? gUnk_08C11340
// ??? gUnk_08C11370
// ??? gUnk_08C11388
// ??? gUnk_08C113B8
// ??? gUnk_08C113D0
// ??? gUnk_08C1149C
// ??? gUnk_08C11568
// ??? gUnk_08C11580
// ??? gUnk_08C11598
// ??? gUnk_08C115B0
// ??? gUnk_08C11634
// ??? gUnk_08C116B8
// ??? gUnk_08C1173C
// ??? gUnk_08C11754
// ??? gUnk_08C1176C
// ??? gUnk_08C118A4
// ??? gUnk_08C119DC
// ??? gUnk_08C11B14
// ??? gUnk_08C11B34
// ??? gUnk_08C11B6C
// ??? gUnk_08C11B8C
// ??? gUnk_08C11BA4
// ??? gUnk_08C11BBC
// ??? gUnk_08C11BEC
// ??? gUnk_08C11C0C
// ??? gUnk_08C11C24
// ??? gUnk_08C11C38
// ??? gUnk_08C11C4C
// ??? gUnk_08C11C64
// ??? gUnk_08C11C7C
// ??? gUnk_08C11C94
// ??? gUnk_08C11CA0
// ??? gUnk_08C11CAC
// ??? gUnk_08C11CC4
// ??? gUnk_08C11CDC
// ??? gUnk_08C11CF4
// ??? gUnk_08C11D0C
// ??? gUnk_08C11D24
// ??? gUnk_08C11D74
// ??? gUnk_08C11DC4
// ??? gUnk_08C11DD0
// ??? gUnk_08C11DDC
// ??? gUnk_08C11E30
// ??? gUnk_08C11E84
// ??? gUnk_08C11E9C
// ??? gUnk_08C11EB4
// ??? gUnk_08C11ECC
// ??? gUnk_08C11EE0
// ??? gUnk_08C11EF4
// ??? gUnk_08C11F0C
// ??? gUnk_08C11F2C
// ??? gUnk_08C11F44
// ??? gUnk_08C11F5C
// ??? gUnk_08C11F74
// ??? gUnk_08C11F8C
// ??? gUnk_08C11FA4
// ??? gUnk_08C11FBC
// ??? gUnk_08C11FD4
// ??? gUnk_08C12040
// ??? gUnk_08C120AC
// ??? gUnk_08C120F4
// ??? gUnk_08C1210C
// ??? gUnk_08C12124
// ??? gUnk_08C12144
// ??? gUnk_08C1215C
// ??? gUnk_08C1217C
// ??? gUnk_08C121A4
// ??? gUnk_08C121BC
// ??? gUnk_08C121D4
// ??? gUnk_08C122A0
// ??? gUnk_08C1236C
// ??? gUnk_08C12384
// ??? gUnk_08C1239C
// ??? gUnk_08C123BC
// ??? gUnk_08C123D4
// ??? gUnk_08C123EC
// ??? gUnk_08C12404
// ??? gUnk_08C1241C
// ??? gUnk_08C12434
// ??? gUnk_08C12454
// ??? gUnk_08C12474
// ??? gUnk_08C1248C
// ??? gUnk_08C124AC
// ??? gUnk_08C124CC
// ??? gUnk_08C124E4
// ??? gUnk_08C124FC
// ??? gUnk_08C1250C
// ??? gUnk_08C1252C
// ??? gUnk_08C12544
// ??? gUnk_08C12548
// ??? gUnk_08C12568
// ??? gUnk_08C12580
// ??? gUnk_08C12598
// ??? gUnk_08C125CC
// ??? gUnk_08C12600
// ??? gUnk_08C12620
// ??? gUnk_08C12638
// ??? gUnk_08C12650
// ??? gUnk_08C12698
// ??? gUnk_08C126B8
// ??? gUnk_08C126D0
// ??? gUnk_08C126E8
// ??? gUnk_08C12728
// ??? gUnk_08C12748
// ??? gUnk_08C12768
// ??? gUnk_08C127B0
// ??? gUnk_08C127C8
// ??? gUnk_08C127E0
// ??? gUnk_08C12814
// ??? gUnk_08C12848
// ??? gUnk_08C12868
// ??? gUnk_08C12880
// ??? gUnk_08C12898
// ??? gUnk_08C128B8
// ??? gUnk_08C12970
// ??? gUnk_08C12988
// ??? gUnk_08C129A0
// ??? gUnk_08C129B4
// ??? gUnk_08C129D4
// ??? gUnk_08C129F4
// ??? gUnk_08C12A0C
// ??? gUnk_08C12A24
// ??? gUnk_08C12A28
// ??? gUnk_08C12A2C
// ??? gUnk_08C12A30
// ??? gUnk_08C12A48
// ??? gUnk_08C12A6C
// ??? gUnk_08C12A8C
// ??? gUnk_08C12AA4
// ??? gUnk_08C12AB4
// ??? gUnk_08C12ACC
// ??? gUnk_08C12AE4
// ??? gUnk_08C12AFC
// ??? gUnk_08C12B00
// ??? gUnk_08C12B18
// ??? gUnk_08C12B30
// ??? gUnk_08C12BF0
// ??? gUnk_08C12C10
// ??? gUnk_08C12C38
// ??? gUnk_08C12C50
// ??? gUnk_08C12C80
// ??? gUnk_08C12CB0
// ??? gUnk_08C12CE0
// ??? gUnk_08C12CF8
// ??? gUnk_08C12D10
// ??? gUnk_08C12D40
// ??? gUnk_08C12D68
// ??? gUnk_08C12D80
// ??? gUnk_08C12D98
// ??? gUnk_08C12E98
// ??? gUnk_08C12EB8
// ??? gUnk_08C12ED8
// ??? gUnk_08C12EF8
// ??? gUnk_08C12F18
// ??? gUnk_08C12F30
// ??? gUnk_08C12F48
// ??? gUnk_08C12F60
// ??? gUnk_08C12F90
// ??? gUnk_08C12FB0
// ??? gUnk_08C12FD0
// ??? gUnk_08C12FF0
// ??? gUnk_08C13008
// ??? gUnk_08C13050
// ??? gUnk_08C13068
// ??? gUnk_08C13080
// ??? gUnk_08C130F0
// ??? gUnk_08C13110
// ??? gUnk_08C13130
// ??? gUnk_08C13148
// ??? gUnk_08C13178
// ??? gUnk_08C131A8
// ??? gUnk_08C131C0
// ??? gUnk_08C131D8
// ??? gUnk_08C13208
// ??? gUnk_08C13228
// ??? gUnk_08C13240
// ??? gUnk_08C13258
// ??? gUnk_08C13270
// ??? gUnk_08C13288
// ??? gUnk_08C132A8
// ??? gUnk_08C13378
// ??? gUnk_08C13390
// ??? gUnk_08C133B0
// ??? gUnk_08C133E0
// ??? gUnk_08C133F8
// ??? gUnk_08C13420
// ??? gUnk_08C13448
// ??? gUnk_08C13460
// ??? gUnk_08C13488
// ??? gUnk_08C134B0
// ??? gUnk_08C134C8
// ??? gUnk_08C134E8
// ??? gUnk_08C13508
// ??? gUnk_08C13520
// ??? gUnk_08C13538
// ??? gUnk_08C13550
// ??? gUnk_08C13568
// ??? gUnk_08C13580
// ??? gUnk_08C135A0
// ??? gUnk_08C135B8
// ??? gUnk_08C135D0
// ??? gUnk_08C135F8
// ??? gUnk_08C13610
// ??? gUnk_08C13640
// ??? gUnk_08C13658
// ??? gUnk_08C13690
// ??? gUnk_08C136C8
// ??? gUnk_08C136E0
// ??? gUnk_08C136F8
// ??? gUnk_08C13710
// ??? gUnk_08C13750
// ??? gUnk_08C13768
// ??? gUnk_08C13780
// ??? gUnk_08C13798
// ??? gUnk_08C137B0
// ??? gUnk_08C137C8
// ??? gUnk_08C137E0
// ??? gUnk_08C137F8
// ??? gUnk_08C13810
// ??? gUnk_08C13828
// ??? gUnk_08C13840
// ??? gUnk_08C13858
// ??? gUnk_08C13870
// ??? gUnk_08C13888
// ??? gUnk_08C13978
// ??? gUnk_08C13990
// ??? gUnk_08C139A8
// ??? gUnk_08C139B8
// ??? gUnk_08C139D8
// ??? gUnk_08C139F0
// ??? gUnk_08C13A08
// ??? gUnk_08C13A14
// ??? gUnk_08C13A34
extern struct ProcCmd ProcScr_EfxDrsmmoya[];
extern struct ProcCmd ProcScr_EfxDrsmmoyaBG[];
extern u16 * TsaSet_EfxDrsmmoyaBgLeft[];
extern u16 * TsaSet_EfxDrsmmoyaBgRight[];
extern struct ProcCmd ProcScr_EfxDrsmmoyaScroll[];
extern struct ProcCmd ProcScr_EfxDrsmmoyaScrollCOL[];
// ??? gUnk_08C13B24
// ??? gUnk_08C13B44
// ??? gUnk_08C13B6C
// ??? gUnk_08C13B84
// ??? gUnk_08C13BB4
// ??? gUnk_08C13BCC
// ??? gUnk_08C13BF4
// ??? gUnk_08C13C0C
// ??? gUnk_08C13C14
// ??? gUnk_08C13C34
// ??? gUnk_08C13C4C
// ??? gUnk_08C13C74
// ??? gUnk_08C13C8C
// ??? gUnk_08C13C90
// ??? gUnk_08C13CB0
// ??? gUnk_08C13CD0
// ??? gUnk_08C13CE8
// ??? gUnk_08C13D10
// ??? gUnk_08C13D28
// ??? gUnk_08C13DAC
// ??? gUnk_08C13E30
// ??? gUnk_08C1419C
// ??? gUnk_08C141F8
// ??? gUnk_08C14218
// ??? gUnk_08C14534
// ??? gUnk_08C14590
// ??? gUnk_08C145B0
// ??? gUnk_08C14650
// ??? gUnk_08C14660
// ??? gUnk_08C146DC
// ??? gUnk_08C146EC
// ??? gUnk_08C148D0
// ??? gUnk_08C14B24
// ??? gUnk_08C14D84
// ??? gUnk_08C14FE4
// ??? gUnk_08C150E8
// ??? gUnk_08C15184
// ??? gUnk_08C1597C
// ??? gUnk_08C159AC
// ??? gUnk_08C16604
// ??? gUnk_08C17264
// ??? gUnk_08C1757C
// ??? gUnk_08C175C4
// ??? gUnk_08C178E8
// ??? gUnk_08C17930
// ??? gUnk_08C17BD0
// ??? gUnk_08C17BE0
// ??? gUnk_08C17E2C
// ??? gUnk_08C17E3C
// ??? gUnk_08C189F4
// ??? gUnk_08C195F4
// ??? gUnk_08C1A224
// ??? gUnk_08C1AE54
// ??? gUnk_08C1BA90
// ??? gUnk_08C1CC3C
// ??? gUnk_08C1CD40
// ??? gUnk_08C1CD68
// ??? gUnk_08C1DEDC
// ??? gUnk_08C1DFE0
// ??? gUnk_08C1E008
// ??? gUnk_08C1F1AC
// ??? gUnk_08C1F2B0
// ??? gUnk_08C1F2D8
// ??? gUnk_08C2047C
// ??? gUnk_08C20580
// ??? gUnk_08C205A8
// ??? gUnk_08C2066C
// ??? gUnk_08C20710
// ??? gUnk_08C207B4
// ??? gUnk_08C20858
// ??? gUnk_08C208FC
// ??? gUnk_08C209A0
// ??? gUnk_08C20B34
// ??? gUnk_08C20CC8
// ??? gUnk_08C20E74
// ??? gUnk_08C21020
// ??? gUnk_08C211CC
// ??? Img_Portrait_082_Jerme_Mouth
// ??? gUnk_08C214B0
// ??? gUnk_08C215E8
// ??? gUnk_08C2184C
// ??? gUnk_08C21AB4
// ??? gUnk_08C21BD8
// ??? gUnk_08C21CFC
// ??? gUnk_08C22750
// ??? gUnk_08C2327C
// ??? gUnk_08C23694
// ??? gUnk_08C236C0
// ??? gUnk_08C23A1C
// ??? gUnk_08C23A48
// ??? gUnk_08C24818
// ??? gUnk_08C25638
// ??? gUnk_08C265CC
// ??? gUnk_08C28508
// ??? gUnk_08C28574
// ??? gUnk_08C285D4
// ??? gUnk_08C285DC
// ??? gUnk_08C28848
// ??? gUnk_08C28880
// ??? gUnk_08C289CC
// ??? gUnk_08C28DC4
// ??? gUnk_08C28DF8
// ??? gUnk_08C28E80
// ??? gUnk_08C29458
// ??? gUnk_08C29618
// ??? gUnk_08C29920
// ??? gUnk_08C29C1C
// ??? gUnk_08C2A8B4
// ??? gUnk_08C2A8E0
// ??? gUnk_08C2A90C
// ??? gUnk_08C2ACB0
// ??? gUnk_08C2D9FC
// ??? gUnk_08C2DA8C
// ??? gUnk_08C2EFA8
// ??? gUnk_08C2F01C
// ??? gUnk_08C305A8
// ??? gUnk_08C3061C
// ??? gUnk_08C33390
// ??? gUnk_08C3365C
// ??? gUnk_08C36340
// ??? gUnk_08C3B3AC
// ??? gUnk_08C3B52C
// ??? gUnk_08C3BAE0
// ??? gUnk_08C3BAF4
// ??? gUnk_08C3BB08
// ??? gUnk_08C3BB1C
// ??? gUnk_08C3BB30
// ??? gUnk_08C3BEA4
// ??? gUnk_08C3BEB0
// ??? gUnk_08C3BEBC
// ??? gUnk_08C3BEC8
// ??? gUnk_08C3BED4
// ??? gUnk_08C3FF94
// ??? gUnk_08C400E4
// ??? gUnk_08C40B04
// ??? gUnk_08C40B0C
// ??? gUnk_08C40B14
// ??? gUnk_08C40B1C
// ??? gUnk_08C40B40
// ??? gUnk_08C40B8C
// ??? gUnk_08C40BA8
// ??? gUnk_08C417A4
// ??? gUnk_08C417AC
// ??? gUnk_08C417B4
// ??? gUnk_08C417BC
// ??? gUnk_08C417C4
// ??? gUnk_08C417CC
// ??? gUnk_08C4181C
// ??? gUnk_08C41828
// ??? gUnk_08C41AF8
// ??? gUnk_08C41D18
// ??? gUnk_08C41D50
// ??? gUnk_08C41F78
// ??? gUnk_08C42AA4
// ??? gUnk_08C43190
// ??? gUnk_08C435EC
// ??? gUnk_08C43640
// ??? gUnk_08C4364C
// ??? gUnk_08C44720
// ??? gUnk_08C447B8
// ??? gUnk_08C44990
// ??? gUnk_08C44B94
// ??? gUnk_08C44F48
// ??? gUnk_08C452FC
// ??? gUnk_08C46040
// ??? gUnk_08C46060
// ??? gUnk_08C463C4
// ??? gUnk_08C463DC
// ??? gUnk_08C48338
// ??? gUnk_08C48524
// ??? gUnk_08C48648
// ??? gUnk_08C4A288
// ??? gUnk_08C4A29C
// ??? gUnk_08C4A2B4
// ??? gUnk_08C4A2CC
// ??? gUnk_08C4A674
// ??? gUnk_08C4A690
// ??? gUnk_08C4A6AC
// ??? gUnk_08C4A6C8
// ??? gUnk_08C4A6E4
// ??? gUnk_08C4A704
// ??? gUnk_08C4A71C
// ??? gUnk_08C4A778
// ??? gUnk_08C4A7D4
// ??? gUnk_08C4A830
// ??? gUnk_08C4A848
// ??? gUnk_08C4A860
// ??? gUnk_08C4A880
// ??? gUnk_08C4A898
// ??? gUnk_08C4A8B8
// ??? gUnk_08C4A8D0
// ??? gUnk_08C4A8E8
// ??? gUnk_08C4A908
extern const struct ProcCmd ProcScr_EfxPartsofScroll[];
// ??? gUnk_08C4A9D8
// ??? gUnk_08C4A9F8
// ??? gUnk_08C4AA38
// ??? gUnk_08C4AA60
// ??? gUnk_08C4AA78
// ??? gUnk_08C4AAA4
// ??? gUnk_08C4AAD0
// ??? gUnk_08C4AAE8
// ??? gUnk_08C4AB00
// ??? gUnk_08C4AB20
// ??? gUnk_08C4AB40
// ??? gUnk_08C4AB58
// ??? gUnk_08C4AB80
// ??? gUnk_08C4AB98
// ??? gUnk_08C4ABB0
// ??? gUnk_08C4ABC8
// ??? gUnk_08C4ABE0
// ??? gUnk_08C4ABF8
// ??? gUnk_08C4AC10
// ??? gUnk_08C4AC28
// ??? gUnk_08C4AC48
// ??? gUnk_08C4B110
// ??? gUnk_08C4B444
// ??? gUnk_08C4B4DC
// ??? gUnk_08C4B56C
// ??? gUnk_08C4B5FC
// ??? gUnk_08C4B688
// ??? gUnk_08C4B778
// ??? gUnk_08C4B8F0
// ??? gUnk_08C4BA44
// ??? gUnk_08C4BD0C
// ??? gUnk_08C4BD70
// ??? gUnk_08C4C058
// ??? gUnk_08C4C060
// ??? gUnk_08C4C0C8
// ??? gUnk_08C4C100
// ??? gUnk_08C4C124
// ??? gUnk_08C4C130
// ??? gUnk_08C4C158
// ??? gUnk_08C51538
// ??? gUnk_08C52B94
// ??? gUnk_08C52C98
// ??? gUnk_08C53805
// ??? gUnk_08C53846
// ??? gUnk_08C53AD0
// ??? gUnk_08C53B11
// ??? gUnk_08C53B52
// ??? gUnk_08C53B93
// ??? gUnk_08C53BD4
// ??? gUnk_08C53C15
// ??? gUnk_08C53C56
// ??? gUnk_08C53C97
// ??? gUnk_08C53CD8
// ??? gUnk_08C53D19
// ??? gUnk_08C53D5A
// ??? gUnk_08C53D9B
// ??? gUnk_08C53DDC
// ??? gUnk_08C53E1D
// ??? gUnk_08C53E5E
// ??? gUnk_08C53E9F
// ??? gUnk_08C53EE0
// ??? gUnk_08C53F21
// ??? gUnk_08C53F62
// ??? gUnk_08C53FA3
// ??? gUnk_08C53FE4
// ??? gUnk_08C54025
// ??? gUnk_08C54066
// ??? gUnk_08C540A7
// ??? gUnk_08C540E8
// ??? gUnk_08C54129
// ??? gUnk_08C5416A
// ??? gUnk_08C541AB
// ??? gUnk_08C541EC
// ??? gUnk_08C5422D
// ??? gUnk_08C5426E
// ??? gUnk_08C542AF

extern const u8 BanimDefaultModeConfig[ANIM_ROUND_MAX * 4];
extern const u8 BattleTypeToAnimModeEndOfDodge[5];
extern const u8 BanimTypesPosLeft[5];
extern const u8 BanimTypesPosRight[5];

// spell animation entry points (gEkrSpellAnimLut, banim-efxmagic-*.c)
void StartSpellAnimArrow(struct Anim * anim);
void StartSpellAnimAura(struct Anim * anim);
void StartSpellAnimBallista(struct Anim * anim);
void StartSpellAnimBarrier(struct Anim * anim);
void StartSpellAnimBerserk(struct Anim * anim);
void StartSpellAnimBolganone(struct Anim * anim);
void StartSpellAnimBolting(struct Anim * anim);
void StartSpellAnimDance(struct Anim * anim);
void StartSpellAnimDarkBreath(struct Anim * anim);
void StartSpellAnimDivine(struct Anim * anim);
void StartSpellAnimDummy(struct Anim * anim);
void StartSpellAnimEclipse(struct Anim * anim);
void StartSpellAnimElfire(struct Anim * anim);
void StartSpellAnimEreshkigal(struct Anim * anim);
void StartSpellAnimExcalibur(struct Anim * anim);
void StartSpellAnimFenrir(struct Anim * anim);
void StartSpellAnimFillasMight(struct Anim * anim);
void StartSpellAnimFimbulvetr(struct Anim * anim);
void StartSpellAnimFire(struct Anim * anim);
void StartSpellAnimFireBreath(struct Anim * anim);
void StartSpellAnimFlux(struct Anim * anim);
void StartSpellAnimFortify(struct Anim * anim);
void StartSpellAnimGespenst(struct Anim * anim);
void StartSpellAnimHammerne(struct Anim * anim);
void StartSpellAnimHandAxe(struct Anim * anim);
void StartSpellAnimHeal(struct Anim * anim);
void StartSpellAnimHurtmut(struct Anim * anim);
void StartSpellAnimIceBreath(struct Anim * anim);
void StartSpellAnimLatona(struct Anim * anim);
void StartSpellAnimLightning(struct Anim * anim);
void StartSpellAnimLuce(struct Anim * anim);
void StartSpellAnimLuna(struct Anim * anim);
void StartSpellAnimMend(struct Anim * anim);
void StartSpellAnimNinisGrace(struct Anim * anim);
void StartSpellAnimNosferatu(struct Anim * anim);
void StartSpellAnimPhysic(struct Anim * anim);
void StartSpellAnimPurge(struct Anim * anim);
void StartSpellAnimRecover(struct Anim * anim);
void StartSpellAnimRestore(struct Anim * anim);
void StartSpellAnimSetsLitany(struct Anim * anim);
void StartSpellAnimShine(struct Anim * anim);
void StartSpellAnimSilence(struct Anim * anim);
void StartSpellAnimSleep(struct Anim * anim);
void StartSpellAnimSong(struct Anim * anim);
