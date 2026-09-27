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

// MU_Init
// StartMuExt
// StartMu
// sub_806C398
// EnableMuCamera
// DisableMuCamera
struct MuProc * StartUiMu(struct Unit * unit, int x, int y);
// StartUiStandingMu
// StartMuInternal
// SetMuFacing
// SetMuDefaultFacing
// MU_SetDefaultFacing_Auto
// SetAutoMuMoveScript
// MuExists
// MuExistsActive
// IsMuActive
// SetMuMoveScript
// StartMuScripted
// MuStepSe_Init
// MuStepSe_PlaySeA
// MuStepSe_PlaySeB
// StartPlayMuStepSe
// PlayMuStepSe
// EndMuMovement
// RunMuMoveScript
// StartMuFogBump
// MuFogBump_Init
// MuFogBump_ScaleLoop
// MuFogBump_EndLoop
// MU_IsFogBumpFxActive
// Mu_OnStateBump
// Mu_OnStateUnk4
// Mu_OnStateSleeping
// sub_806D06C
// sub_806D07C
// Mu_OnStateMovement
// UpdateMuStepSounds
// Mu_OnLoop
// MU_OnEnd
void EndAllMus(void);
// EndMu
// EndMuExt
// HaltMu
void LockMus(void);
void ReleaseMus(void);
void ApplyMoveScriptToCoordinates(int * x, int * y, u8 const * move_script);
bool CanStartMu(void);
// ResetMuAnims
// GetDefaultMuConfig
// GetNewMuConfig
// GetMuDisplayPosition
// PutMuSMS
// PutMu
// GetMuQ4MovementSpeed
// sub_0806D4CC
// GetMuImgBufById
// GetMuImg
// GetMuAnimForJid
// StartMuDeathFade
// sub_0806D6D8
// sub_0806D76C
// sub_0806D804
// sub_0806D890
// sub_0806D968
// sub_0806DA18
// sub_0806DAB4
// ShowMu
void SetMuScreenPosition(struct MuProc * mu, int x, int y);
// sub_0806DB48
// sub_0806DB94
// sub_0806DC14
// sub_0806DC64
// sub_0806DCB4
// sub_0806DD08
// sub_0806DD30
// sub_0806DD78
// sub_0806DDD4
// sub_0806DE1C
