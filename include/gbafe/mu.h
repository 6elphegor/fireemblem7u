#pragma once

#include "global.h"
#include "proc.h"
#include "unit.h"
#include "sprite-anim.h"

enum
{
    MU_STATE_NONE,
    MU_STATE_INACTIVE,
    MU_STATE_MOVEMENT,
    MU_STATE_SLEEPING,
    MU_STATE_UNK4,
    MU_STATE_BUMPING,
    MU_STATE_DISPLAY_UI,
    MU_STATE_DEATHFADE,
};

enum
{
    MU_FLASH_WHITE,
    MU_FLASH_BLACK,
    MU_FLASH_RED,
    MU_FLASH_GREEN,
    MU_FLASH_BLUE,
    MU_FLASH_5,
};

enum
{
    // MU command identifiers

    MOVE_CMD_END = -1, // end

    MOVE_CMD_MOVE_BASE,

    MOVE_CMD_MOVE_LEFT  = MOVE_CMD_MOVE_BASE + FACING_LEFT,
    MOVE_CMD_MOVE_RIGHT = MOVE_CMD_MOVE_BASE + FACING_RIGHT,
    MOVE_CMD_MOVE_DOWN  = MOVE_CMD_MOVE_BASE + FACING_DOWN,
    MOVE_CMD_MOVE_UP    = MOVE_CMD_MOVE_BASE + FACING_UP,

    MOVE_CMD_HALT,

    MOVE_CMD_FACE_BASE,

    MOVE_CMD_FACE_LEFT  = MOVE_CMD_FACE_BASE + FACING_LEFT,
    MOVE_CMD_FACE_RIGHT = MOVE_CMD_FACE_BASE + FACING_RIGHT,
    MOVE_CMD_FACE_DOWN  = MOVE_CMD_FACE_BASE + FACING_DOWN,
    MOVE_CMD_FACE_UP    = MOVE_CMD_FACE_BASE + FACING_UP,

    MOVE_CMD_SLEEP,
    MOVE_CMD_BUMP,
    MOVE_CMD_UNK11,
    MOVE_CMD_SET_SPEED,

    MOVE_CMD_CAMERA_ON,
    MOVE_CMD_CAMERA_OFF,

    MOVE_SCRIPT_MAX_LENGTH = 0x40,
};

struct MuInfo
{
    u8 const * img;
    u16 const * anim;
};

enum
{
    MU_MAX_COUNT = 4,
    MU_GFX_MAX_SIZE = 0x2200,
    MU_SUBPIXEL_PRECISION = 4,
};

enum
{
    MU_FACING_SELECTED = 4,
    MU_FACING_UNK11 = 11,
    MU_FACING_STANDING = 15,
};

struct MuConfig;

// Layout verified against FE7U mu code (same as FE8U's)
struct MuProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit * unit;
    /* 30 */ struct SpriteAnim * sprite_anim;
    /* 34 */ struct MuConfig * config;
    /* 38 */ void * vram;

    /* 3C */ u8 slot;
    /* 3D */ u8 _u3D;
    /* 3E */ u8 cam_b;
    /* 3F */ u8 state;
    /* 40 */ u8 hidden_b;
    /* 41 */ u8 jid;
    /* 42 */ s8 facing;
    /* 43 */ u8 step_sound_clock;
    /* 44 */ u8 fast_walk_b;
    /* 46 */ u16 layer;
    /* 48 */ u16 move_clock_q4;
    /* 4A */ s16 move_config;
    /* 4C */ s16 x_q4, y_q4;
    /* 50 */ s16 x_offset_q4, y_offset_q4;
};

struct MuConfig
{
    /* 00 */ u8 slot;
    /* 01 */ u8 pal;
    /* 02 */ u16 chr;
    /* 04 */ u8 pc;
    /* 05 */ s8 movescr[0x40];
    /* 45 */ // 3 byte padding
    /* 48 */ struct MuProc * mu;
};

struct MuStepSoundProc
{
    /* 00 */ PROC_HEADER;
    STRUCT_PAD(0x29, 0x58);
    /* 58 */ u32 song1;
    /* 5C */ u32 song2;
    /* 60 */ u32 unk60;
    /* 64 */ s16 x1;
    /* 66 */ s16 x2;
};

struct MuFogBumpProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int x, y;
    STRUCT_PAD(0x34, 0x50);
    /* 50 */ struct SpriteAnim * sprite_anim;
    STRUCT_PAD(0x54, 0x64);
    /* 64 */ s16 timer;
};

struct MuEffectProc
{
    /* 00 */ PROC_HEADER;
    STRUCT_PAD(0x29, 0x54);
    /* 54 */ struct MuProc * mu;
    STRUCT_PAD(0x58, 0x64);
    /* 64 */ s16 time_left;
    /* 66 */ s16 frame;
};

struct MuFlashEffectProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct MuProc * mu;
    /* 30 */ u8 timer;
};

void MU_Init(void);
struct MuProc * StartMuExt(struct Unit * unit, unsigned jid, unsigned pal);
struct MuProc * StartMu(struct Unit * unit);
void UpdateMu(struct MuProc * proc);
void EnableMuCamera(struct MuProc * proc);
void DisableMuCamera(struct MuProc * proc);
struct MuProc * StartUiMu(struct Unit * unit, int x, int y);
void StartUiStandingMu(struct MuProc * proc);
struct MuProc * StartMuInternal(u16 x, u16 y, u16 jid, int objTileId, unsigned palId);
void SetMuFacing(struct MuProc * proc, int facing);
void SetMuDefaultFacing(struct MuProc * proc);
void MU_SetDefaultFacing_Auto(void);
void SetAutoMuMoveScript(u8 const * commands);
bool MuExists(void);
bool MuExistsActive(void);
bool IsMuActive(struct MuProc * mu);
void SetMuMoveScript(struct MuProc * mu, u8 const * commands);
struct MuProc * StartMuScripted(u16 x, u16 y, u16 jid, int pal, u8 const * commands);
void MuStepSe_Init(struct MuStepSoundProc * proc);
void MuStepSe_PlaySeA(struct MuStepSoundProc * proc);
void MuStepSe_PlaySeB(struct MuStepSoundProc * proc);
void StartPlayMuStepSe(int song, int alt_offset, int x);
void PlayMuStepSe(struct MuProc * proc);
void EndMuMovement(struct MuProc * proc);
void RunMuMoveScript(struct MuProc * proc);
void StartMuFogBump(int x, int y);
void MuFogBump_Init(struct MuFogBumpProc * proc);
void MuFogBump_ScaleLoop(struct MuFogBumpProc * proc);
void MuFogBump_EndLoop(struct MuFogBumpProc * proc);
bool MU_IsFogBumpFxActive(void);
void Mu_OnStateBump(struct MuProc * proc);
void Mu_OnStateUnk4(struct MuProc * proc);
void Mu_OnStateSleeping(struct MuProc * proc);
void Mu_OnStateNone(struct MuProc * proc);
void Mu_OnStateDoNothing(struct MuProc * proc);
void Mu_OnStateMovement(struct MuProc * proc);
void UpdateMuStepSounds(struct MuProc * proc);
void Mu_OnLoop(struct MuProc * proc);
void MU_OnEnd(struct MuProc * proc);
void EndAllMus(void);
void EndMu(struct MuProc * proc);
void EndMuExt(struct MuProc * proc);
void HaltMu(struct MuProc * proc);
void LockMus(void);
void ReleaseMus(void);
void ApplyMoveScriptToCoordinates(int * x, int * y, u8 const * movescr);
bool CanStartMu(void);
void ResetMuAnims(void);
struct MuConfig * GetDefaultMuConfig(int objTileId, u8 * outIndex);
struct MuConfig * GetNewMuConfig(int objTileId, u8 * outIndex);
s8 GetMuDisplayPosition(struct MuProc * proc, struct Vec2 * out);
void PutMuSMS(struct MuProc * proc);
void PutMu(struct MuProc * proc);
u16 GetMuQ4MovementSpeed(struct MuProc * proc);
void * GetMuImgBufById(int slot);
void const * GetMuImg(struct MuProc * proc);
u16 const * GetMuAnimForJid(u16 jid);
void StartMuDeathFade(struct MuProc * mu);
void MuDeathFade_OnLoop(struct MuEffectProc * proc);
void MuBlink_OnLoop(struct MuEffectProc * proc);
void StartBlinkMu(struct MuProc * mu);
void MU_SetupPixelEffect(u32 * data, int frame);
void MuPixelEffect_OnLoop(struct MuEffectProc * proc);
void MU_StartPixelEffect(struct MuProc * mu);
void HideMu(struct MuProc * proc);
void ShowMu(struct MuProc * proc);
void SetMuScreenPosition(struct MuProc * proc, int x, int y);
void SetMuScreenOffset(struct MuProc * proc, int x_off, int y_off);
void StartMuFadeIntoFlash(struct MuProc * proc, int flash);
void StartMuFadeFromFlash(struct MuProc * mu);
void MuRestorePalInfo_Apply(struct MuEffectProc * proc);
void StartMuActionAnim(struct MuProc * proc);
void MuActionAnimFinishFunc(intptr_t arg);
void StartMuDelayedFaceDefender(struct MuProc * proc);
void MuDelayedFaceDefenderFunc(intptr_t arg);
void StartMuSpeedUpAnim(struct MuProc * proc);
void MuSlowDownAnimFreezeFunc(intptr_t arg);
void StartMuCritFlash(struct MuProc * mu, int flash);
void MuCritFlash_Init(struct MuFlashEffectProc * proc);
void MuCritFlash_SetFadedPalette(struct MuFlashEffectProc * proc);
void MuCritFlash_SetRegularPalette(struct MuFlashEffectProc * proc);
void MuCritFlash_StartFadeBack_maybe(struct MuFlashEffectProc * proc);
void MuCritFlash_SpriteShakeLoop(struct MuFlashEffectProc * proc);
void MuCritFlash_RestorePalette(struct MuFlashEffectProc * proc);
void StartMuHitFlash(struct MuProc * mu, int flash);
void MuFlashFadeFrom_RestorePal(struct MuFlashEffectProc * proc);
void SetMuMaxWalkSpeed(void);
void MuMaxWalkSpeedFunc(ProcPtr proc);
void SetMuSpecialSprite(struct MuProc * proc, int jid, u16 const * pal);
void SetMuPal(struct MuProc * proc, unsigned pal);
void SetMuConfig(struct MuProc * proc, u16 config);
struct MuProc * GetMu(int slot);
struct MuProc * GetUnitMu(struct Unit * unit);
