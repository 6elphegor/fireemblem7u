#pragma once

#include "global.h"
#include "mu.h"
#include "unit.h"
#include "battle.h"

#define SCREEN_TILE_X(xPos) ((xPos) - (gBmSt.camera.x >> 4))
#define SCREEN_TILE_Y(yPos) ((yPos) - (gBmSt.camera.y >> 4))

#define SCREEN_TILE_IX(xPos) ((xPos) * 16 - (gBmSt.camera.x))
#define SCREEN_TILE_IY(yPos) ((yPos) * 16 - (gBmSt.camera.y))

struct MapAnimActor {
    /* 00 */ struct Unit * unit;
    /* 04 */ struct BattleUnit * bu;
    /* 08 */ struct MuProc * mu;
    /* 0C */ u8 hp_max;
    /* 0D */ u8 hp_cur;
    /* 0E */ u16 hp_displayed_q4;
    /* 10 */ u8 hp_info_x;
    /* 11 */ u8 hp_info_y;

    STRUCT_PAD(0x12, 0x14);
};

struct ManimSt {
    /* 00 */ struct MapAnimActor actor[4];
    /* 50 */ struct BattleHit * hit_it;
    /* 54 */ struct ProcScr const * special_proc_scr;
    /* 58 */ u8 attacker_actor;
    /* 59 */ u8 defender_actor;
    /* 5A */ u16 hit_attributes;
    /* 5C */ u8 hit_info;
    /* 5D */ s8 hit_damage;
    /* 5E */ u8 main_actor_count;
    /* 5F */ u8 hp_bar_busy;
    /* 60 */ u8 unk_60;
    /* 61 */ u8 unk_61;
    /* 62 */ u8 manim_kind;
};

extern struct ManimSt EWRAM_DATA gManimSt;

struct ManimExpBarProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 exp_from;
    /* 66 */ s16 exp_to;
    /* 68 */ s16 actor;
    /* 6A */ s16 timer;
};

struct ManimInfoWindowProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2A);
    /* 2A */ s16 clock;
    /* 2C */ u16 unk_2C;
    /* 2E */ u8 x;
    /* 2F */ u8 y;
    /* 30 */ ProcPtr parent;
};

struct ManimDebugProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 actor;
    /* 66 */ s16 field;
};

struct ManimDebugInfoEntry {
    /* 00 */ s16 data[10];
    /* 14 */ struct Text text[10];
};

struct ManimDebugInfo {
    /* 00 */ STRUCT_PAD(0x00, 0x08);
    /* 08 */ struct ManimDebugInfoEntry infos[2];
};

struct ManimDebugFieldInfo {
    /* 00 */ u8 width;
    /* 01 */ s8 up, down, left, right;
    /* 05 */ u8 min, max;
    /* 07 */ STRUCT_PAD(0x07, 0x08);
};

struct ManimShineProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ STRUCT_PAD(0x34, 0x44);
    /* 44 */ s16 timer;
    /* 46 */ STRUCT_PAD(0x46, 0x54);
    /* 54 */ int size;
    /* 58 */ int fade_duration;
    /* 5C */ STRUCT_PAD(0x5C, 0x64);
    /* 64 */ s16 timer2;
};

struct ManimAnimatorProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unit;
    /* 30 */ STRUCT_PAD(0x30, 0x40);
    /* 40 */ u16 ca;
    /* 42 */ u16 cb;
    /* 44 */ STRUCT_PAD(0x44, 0x50);
    /* 50 */ void const * img;
    /* 54 */ void const * pal;
    /* 58 */ u16 song;
};

struct ManimBgScrollProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);
    /* 58 */ int bg;
    /* 5C */ STRUCT_PAD(0x5C, 0x64);
    /* 64 */ u16 x;
    /* 66 */ u16 x_inc;
    /* 68 */ u16 y;
    /* 6A */ u16 y_inc;
};

struct ManimEffectProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unit;
    /* 30 */ int x;
    /* 34 */ int y;
    /* 38 */ STRUCT_PAD(0x38, 0x40);
    /* 40 */ u16 frame;
    /* 42 */ u16 timer;
    /* 44 */ u16 unk_44;
    /* 46 */ u16 unk_46;
    /* 48 */ s16 unk_48;
    /* 4A */ s16 frame_idx;
    /* 4C */ s16 unk_4C;
    /* 4E */ STRUCT_PAD(0x4E, 0x50);
    /* 50 */ void const * img;
    /* 54 */ void const * pal;
    /* 58 */ u16 unk_58;
    /* 5A */ STRUCT_PAD(0x5A, 0x64);
    /* 64 */ s16 unk_64;
};

void Manim_StoleItemPopup(ProcPtr proc);
void Manim_WeaponBrokePopup(ProcPtr proc);
bool ManimShouldBuDisplayWeaponBroke(struct BattleUnit * bu);
void Manim_WeaponLevelGainedPopup(ProcPtr proc);
bool ManimShouldBuDisplayWeaponLevelGained(struct BattleUnit * bu);
void Manim_PrepareBattleTalk(ProcPtr proc);
void Manim_Finish(ProcPtr proc);
void Manim_AdvanceBattleRound(void);
void Manim_PrepareNextBattleRound(ProcPtr proc);
void Manim_DisplayRoundAnim(ProcPtr proc);
void Manim_ShowPoisonEffectIfAny(ProcPtr proc);
void Manim_MoveCameraOntoSubject(ProcPtr proc);
void Manim_MoveCameraOntoTarget(ProcPtr proc);
void Manim_DisplayDeathQuote(ProcPtr proc);
void Manim_DisplayDeathFade(ProcPtr proc);
void Manim_DisplayExpBar(ProcPtr proc);
void Manim_InitInfoBox(ProcPtr proc);
void Manim_CallBattleQuoteEvents(ProcPtr proc);
void SetBattleMuPaletteByIndex(int actor);
void SetBattleMuPalette(ProcPtr proc);
void Manim_PlayStealSe(void);
void InitManimActor(int actor, struct BattleUnit * bu, struct Unit * unit);
void SetManimActorFacing(int actor, int target, int facing);
void InitManimActorFacings(void);
void SortManimActorLayers(void);
void BeginMapAnimForPoisonDmg(void);
void BeginMapAnimForCritAtk(void);
void BeginMapAnimForSteal(void);
void BeginMapAnimForDance(void);
void StartBattleManim(void);
void InitManimHits(struct BattleUnit * actor, struct BattleUnit * target, struct BattleHit * hit);
void InitManimActors(struct BattleUnit * actor, struct BattleUnit * target, struct BattleHit * hit);
int GetFacingFromTo(int x_from, int y_from, int x_to, int y_to);
void UnpackManimWindowDigits(int chr);
void PutManimWindowNumber(u16 * tm, int num, int tileref, int len, u16 blankref);
void UnpackManimWindowGraphics(u8 const * img);
void PutManimWindowBarTile(u16 * tm, int * pval, int pal, int max, int base);
void PutManimWindowBar(u16 * tm, int max, int cur, int pal_id, u16 const * info);
void EndManimInfoWindow(void);
void StartManimInfoWindow(int x, int y, ProcPtr parent);
void ManimWindow_Clear(ProcPtr proc);
void ManimInfoWindow_Init(struct ManimInfoWindowProc * proc);
void ManimInfoWindow_UpdateHp(struct ManimInfoWindowProc * proc);
void PutManimInfoWindowHp(struct ManimInfoWindowProc * proc, int actor);
u16 const * GetManimInfoWindowPal(struct Unit * unit);
void PutManimInfoWindow(struct ManimInfoWindowProc * proc, int actor, int x_offset);
void ManimInfoWindow_InitShake(struct ManimInfoWindowProc * proc);
void ManimInfoWindow_Shake(struct ManimInfoWindowProc * proc);
void PutManimExpBar(int x, int y, int exp);
void ManimExpBar_Init(struct ManimExpBarProc * proc);
void ManimExpBar_PlaySe(struct ManimExpBarProc * proc);
void ManimExpBar_Increment(struct ManimExpBarProc * proc);
void ManimExpBar_InitShake(struct ManimExpBarProc * proc);
void ManimExpBar_Shake(struct ManimExpBarProc * proc);
void ManimExpBar_LevelUpIfPossible(struct ManimExpBarProc * proc);
// sub_8070AF8
void ManimDebug_PutField(int num, int index, int color);
void ManimDebug_Init(struct ManimDebugProc * proc);
void ManimDebug_InitScreen(struct ManimDebugProc * proc);
void ManimDebug_Loop(struct ManimDebugProc * proc);
void ManimDebug_SetupBattleUnit(struct BattleUnit * bu, int actor);
bool ManimDebug_SetupBattle(void);
void ManimDebug_StartBattleAnim(ProcPtr proc);
void StartManimMissAnim(struct Unit * unit);
void StartManimNoDamageAnim(struct Unit * unit);
void StartManimWallBreakAnim(struct Unit * unit, int arg);
void ManimWallBreakAnim_Init(struct ManimEffectProc * proc);
void StartManimPoisonAnim(struct Unit * unit);
void ManimPoisonAnim_Init(struct ManimEffectProc * proc);
// sub_8071ECC
void ManimLatonaFx_Init(struct ManimEffectProc * proc);
void ManimLatonaFx_Main(struct ManimEffectProc * proc);
// sub_80721A4
void ManimLatonaBlink_Init(struct ManimEffectProc * proc);
void ManimLatonaBlink_Main(struct ManimEffectProc * proc);
void StartManimLatonaShine(int x, int y, int size, int duration, int fade_duration, ProcPtr parent);
// sub_8072374
// sub_8072398
void ManimLatonaShine_Start(struct ManimShineProc * proc);
void ManimLatonaShine_FadeIn(struct ManimShineProc * proc);
void ManimLatonaShine_Wait(struct ManimShineProc * proc);
void ManimLatonaShine_FadeOut(struct ManimShineProc * proc);
void StartManimAntitoxinFx(struct Unit * unit, u8 const * img, u16 const * pal);
void ManimAntitoxinFx_Init(struct ManimEffectProc * proc);
void ManimAntitoxinFx_Main(struct ManimEffectProc * proc);
// sub_8072884
void ManimStatusHealSe_Play(struct ManimEffectProc * proc);
void StartManimEffectAnimator(struct Unit * unit, void const * img, void const * pal, u16 song);
void ManimEffectAnimator_Init(struct ManimAnimatorProc * proc);
void ManimEffectAnimator_FadeIn(struct ManimAnimatorProc * proc);
void ManimEffectAnimator_FadeOut(struct ManimAnimatorProc * proc);
void ManimSpellAnim_End(ProcPtr proc);
void ManimSpellAnim_EndWithHBlank(ProcPtr proc);
void StartManimWarpFlashy(struct Unit * unit, int arg_1, int arg_2);
void ManimWarpFlashy_Init(struct ManimEffectProc * proc);
void ManimWarpFlashy_Main(struct ManimEffectProc * proc);
void StartManimTorchFx(struct Unit * unit);
void ManimTorchFx_Init(struct ManimEffectProc * proc);
void ManimTorchFx_Expand(struct ManimEffectProc * proc);
void ManimTorchFx_Fade(struct ManimEffectProc * proc);
// sub_80733F8
// sub_807340C
void ManimBerserkFx_Init(struct ManimEffectProc * proc);
// sub_80734FC
void ManimRepairFx_PlaySe(struct ManimEffectProc * proc);
void ManimRepairFx_Init(struct ManimEffectProc * proc);
// sub_8073648
// ManimRepairFx_Blink
void ManimRepairFx_FadeOut(struct ManimEffectProc * proc);
// sub_807384C
void ManimRestoreFx_Init(struct ManimEffectProc * proc);
// sub_80738E0
// sub_8073984
void ManimSleepFx_Init(struct ManimEffectProc * proc);
void ManimSleepFx_Anim1(struct ManimEffectProc * proc);
void ManimSleepFx_Anim2(struct ManimEffectProc * proc);
void StartManimWaveFx(struct Unit * unit);
void ManimWaveFx_Init(struct ManimEffectProc * proc);
void ManimWaveFx_Expand(struct ManimEffectProc * proc);
void ManimWaveFx_Shrink(struct ManimEffectProc * proc);
// sub_8073D3C
void ManimSilenceFx_Init(struct ManimEffectProc * proc);
void ManimSilenceFx_Start(struct ManimEffectProc * proc);
void ManimSilenceFx_Main(struct ManimEffectProc * proc);
// sub_8074064
void ManimBarrierFx_Init(struct ManimEffectProc * proc);
void ManimBarrierFx_Main(struct ManimEffectProc * proc);
void StartManimUnlockFx(int x, int y);
void ManimUnlockFx_HideUnitAndOpenDoor(void);
void ManimUnlockFx_UnhideUnit(void);
void ManimUnlockFx_Init(struct ManimEffectProc * proc);
void ManimUnlockFx_Open(struct ManimEffectProc * proc);
void ManimUnlockFx_Close(struct ManimEffectProc * proc);
void SetDefaultManimScreenConf(void);
void StartManimBgScroll(int bg, int x_inc, int y_inc, ProcPtr parent);
// sub_807475C
void ManimBgScroll_Main(struct ManimBgScrollProc * proc);
// sub_08074008
// sub_0807416C
// sub_080741F4
// sub_0807436C
// sub_8074C5C
// sub_08074474
// sub_8074D38
// sub_08074554
// sub_08074744
// StartManimLevelUp
// sub_080748D0
// sub_080749F4
// sub_08074A28
// sub_08074BF8
// sub_08074C10
// sub_08074CA0
// sub_08074D14
// sub_8075584
// sub_08074F00
// sub_08074F20
// sub_8075864
// sub_080750A8
// sub_8075898
// sub_80758AC
// sub_08075114
// sub_8075938
// sub_080751A0
// sub_080751E0
// sub_80759C8
// sub_08075218
// LoadSparkGfx
// sub_080752F4
// sub_0807534C
// sub_080753AC
// sub_08075448
// sub_08075528
// sub_080755E0
// sub_0807560C
// sub_08075638
// sub_8075E34
// sub_8075E68
// sub_080756CC
// sub_08075798
// sub_080757DC
// sub_08075820
// sub_807604C
// sub_080758B0
// sub_08075994
// sub_8076248
// sub_80762CC
// sub_08075B80
// sub_08075BD0
// sub_08075C20
// sub_08075C90
// sub_08076050
// sub_08076124
// sub_8076920
// sub_8076950
// sub_8076980
// sub_80769B0
// sub_80769E0
// sub_8076A1C
// sub_8076A58
// sub_8076A94
// sub_08076300
// sub_8076B0C
// sub_8076B48
// sub_080763B4
// sub_08076470
// sub_8076C80
// sub_080764E0
// sub_8076CD8
// sub_8076D08
// sub_8076D38
// sub_8076D68
// sub_080765C8
// sub_8076DCC
// sub_8076E00
// sub_08076664
// sub_080766D8
// sub_8076F34
// sub_08076798
// sub_8076FFC
// sub_8077014
void StartManimDebug(void);
void StartManimLatonaFx(struct Unit * unit);
void ManimLatonaFx_ClearBg2(ProcPtr proc);
void ManimLatonaShine_End(ProcPtr proc);
void ManimLatonaShine_Init(ProcPtr proc);
void StartManimStatusHealSe(struct Unit * unit);
void ManimTorchFx_ResetHBlank(struct ManimEffectProc * proc);
void StartManimBerserkFx(struct Unit * unit);
void StartManimRepairFx(struct Unit * unit);
void ManimRepairFx_Main(struct ManimEffectProc * proc);
void StartManimRestoreFx(struct Unit * unit);
void ManimRestoreFx_Main(struct ManimEffectProc * proc);
void StartManimSleepFx(struct Unit * unit);
void StartManimSilenceFx(struct Unit * unit);
void StartManimBarrierFx(struct Unit * unit);
void EndManimBgScroll(void);
