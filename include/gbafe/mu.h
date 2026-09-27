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

struct MuConfig;

struct MuProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit * unit;
    /* 30 */ struct SpriteAnim * sprite_anim;
    /* 34 */ struct MuConfig * config;

    /* 38 */ u8 cam_b;
    /* 39 */ u8 state;
    /* 3A */ u8 hidden_b;
    /* 3B */ u8 jid;
    /* 3C */ s8 facing;
    /* 3D */ u8 step_sound_clock;
    /* 3E */ u8 fast_walk_b;
    /* 3F */ // pad
    /* 40 */ u16 move_clock_q4;
    /* 42 */ s16 move_config;
    /* 44 */ s16 x_q4, y_q4;
    /* 48 */ s16 x_offset_q4, y_offset_q4;
};

struct MuConfig
{
    /* 00 */ u8 id;
    /* 01 */ u8 pal;
    /* 02 */ u16 chr;
    /* 04 */ u8 pc;
    /* 05 */ s8 movescr[0x40];
    /* 45 */ // 3 byte padding
    /* 48 */ struct MuProc * mu;
};

// MU_Init
// sub_0806BA88
// StartMu
// sub_806C398
// EnableMuCamera
// DisableMuCamera
struct MuProc * StartUiMu(struct Unit * unit, int x, int y);
// sub_0806BC88
// StartMuInternal
// SetMuFacing
// sub_0806BFA4
// MU_SetDefaultFacing_Auto
// SetAutoMuMoveScript
// sub_0806C040
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
// sub_0806C5BC
// sub_0806C67C
// sub_0806C760
// sub_0806C7A4
// sub_0806C7C8
// sub_0806C7FC
// sub_0806C824
// sub_806D06C
// sub_806D07C
// sub_0806C8A0
// UpdateMuStepSounds
// sub_0806CC0C
// sub_0806CC90
void EndAllMus(void);
// EndMu
// sub_0806CCE8
// HaltMu
void LockMus(void);
void ReleaseMus(void);
void ApplyMoveScriptToCoordinates(int * x, int * y, u8 const * move_script);
bool CanStartMu(void);
// ResetMuAnims
// sub_0806CEB4
// sub_0806CF58
// sub_0806CFFC
// sub_0806D148
// sub_0806D250
// GetMuQ4MovementSpeed
// sub_0806D4CC
// sub_0806D524
// sub_0806D554
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
