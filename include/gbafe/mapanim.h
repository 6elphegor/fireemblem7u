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
// sub_08070324
// sub_08070784
// sub_08070980
// sub_08070B60
// sub_08071088
// sub_08071174
// sub_080713EC
// sub_08071424
// sub_080714A0
// sub_0807151C
// sub_080715B0
// sub_0807160C
// sub_0807167C
// sub_8071ECC
// sub_08071750
// sub_08071888
// sub_80721A4
// sub_080719DC
// sub_08071A60
// sub_08071B34
// sub_8072374
// sub_8072398
// sub_08071BD0
// sub_08071C70
// sub_08071D28
// sub_08071D70
// sub_08071E4C
// sub_08071ECC
// sub_08071FD0
// sub_8072884
// sub_08072104
// sub_08072124
// sub_08072180
// sub_080722C0
// sub_08072424
// sub_08072588
// sub_08072620
// sub_080726C0
// sub_0807272C
// sub_08072784
// sub_08072898
// sub_080728F0
// sub_08072A18
// sub_08072B10
// sub_80733F8
// sub_807340C
// sub_08072C90
// sub_80734FC
// sub_08072D7C
// sub_08072D98
// sub_8073648
// sub_08072F00
// sub_08072FC0
// sub_807384C
// sub_080730C8
// sub_80738E0
// sub_8073984
// sub_08073200
// sub_0807326C
// sub_080732AC
// sub_080732E8
// sub_08073354
// sub_08073438
// sub_080734C4
// sub_8073D3C
// sub_080735B8
// sub_080736EC
// sub_080737D8
// sub_8074064
// sub_080738E0
// sub_080739B0
// sub_08073A54
// sub_08073ABC
// sub_08073AF0
// sub_08073B14
// sub_08073C50
// sub_08073D0C
// sub_08073D80
// sub_08073EF4
// sub_807475C
// sub_08073F88
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
// sub_080752C8
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
