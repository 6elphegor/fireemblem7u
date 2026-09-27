#include "gbafe.h"

// not yet declared in headers
int GetUnitSpritePalette(struct Unit * unit);
void SetStandingMuFacing(int slot, void * vram);
int GetClassSMSId(int jid);
void PlaySeSpacial(int song, int x);
void sub_080255E0(int slot, void * vram);
void sub_08026308(u16 layer, int x, int y, u16 oam2, int jid, int slot);
void TryRemoveUnitFromBallista(struct Unit * unit);
void CallDelayedArg(void (* func)(int arg), int arg, int delay);
void SetManimActorFacing(int actor, int target, int facing);
u8 GetSpellAssocFacing(int weapon);

extern struct MuConfig sMuConfig[MU_MAX_COUNT];
extern struct ProcCmd ProcScr_Mu[];
extern struct ProcCmd ProcScr_MuStepSe[];
extern struct ProcCmd ProcScr_MuFogBump[];
extern u8 const Img_MuFogBump[];
extern u16 const SpriteAnim_MuFogBump[];
extern s16 const sMoveOffsetLut[];
extern u16 const MuSoundScr_Foot[];
extern u16 const MuSoundScr_FootHeavy[];
extern u16 const MuSoundScr_Mounted[];
extern u16 const MuSoundScr_Wyvern[];
extern u16 const MuSoundScr_Pegasus[];
extern u16 const MuSoundScr_46[];
extern void (* const sMuStateFuncs[])(struct MuProc * proc);
extern u16 const sMuChrOffLut_Default[];
extern u16 const sMuChrOffLut[];
extern u8 const sMuWalkSpeedLut[];
extern u8 const sMuImgBufOffLut[];
extern u8 gMUGfxBuffer[];
extern struct MuInfo const gMuInfoTable[];
extern struct ProcCmd ProcScr_MuDeathFade[];
extern struct ProcCmd ProcScr_MuBlink[];
extern u8 const sPixelEffectOrderLut[];
extern u32 sKeptPixelsWordMask;
extern u32 sClearedPixelWordMask;
extern struct ProcCmd ProcScr_MuPixelEffect[];
extern struct ProcCmd ProcScr_MuRestorePalInfo[];
extern struct ProcCmd ProcScr_MuCritFlash[];
extern struct ProcCmd ProcScr_MuHitFlash[];
extern u16 const * const gMuFlashPalLut[];
#define MU_PAL_OBJ(pal) (gPal + ((((pal) + 0x10) * 0x20) >> 1))
void MU_Init(void)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
        sMuConfig[i].slot = 0;
}
struct MuProc * StartMuExt(struct Unit * unit, unsigned jid, unsigned pal)
{
    struct MuProc * proc;
    proc = StartMuInternal(unit->xPos, unit->yPos, jid, -1, pal);
    proc->unit = unit;
    proc->cam_b = TRUE;
    return proc;
}
struct MuProc * StartMu(struct Unit * unit)
{
    struct MuProc * proc;
    unsigned jid = UNIT_CLASS_ID(unit);
    if (unit->state & US_IN_BALLISTA)
    {
        switch (GetTrap(unit->ballistaIndex)->extra)
        {
        case 0x34:
            jid = 0x5B;
            break;
        case 0x35:
            jid = 0x5C;
            break;
        case 0x36:
            jid = 0x5D;
            break;
        }
    }
    proc = StartMuInternal(unit->xPos, unit->yPos, jid, -1, GetUnitSpritePalette(unit));
    proc->unit = unit;
    proc->cam_b = TRUE;
    return proc;
}
void UpdateMu(struct MuProc * proc)
{
    Mu_OnLoop(proc);
}
void EnableMuCamera(struct MuProc * proc)
{
    proc->cam_b = TRUE;
}
void DisableMuCamera(struct MuProc * proc)
{
    proc->cam_b = FALSE;
}
struct MuProc * StartUiMu(struct Unit * unit, int x, int y)
{
    struct MuProc * proc = StartMu(unit);
    if (!proc)
        return NULL;
    proc->x_q4 = x << MU_SUBPIXEL_PRECISION;
    proc->y_q4 = y << MU_SUBPIXEL_PRECISION;
    proc->state = MU_STATE_DISPLAY_UI;
    return proc;
}
void StartUiStandingMu(struct MuProc * proc)
{
    StartUiSMS(GetClassSMSId(proc->jid), proc->slot);
}
struct MuProc * StartMuInternal(u16 x, u16 y, u16 jid, int objTileId, unsigned palId)
{
    struct MuProc * proc;
    struct SpriteAnim * anim;
    struct MuConfig * config;
    u16 delay = 0;
    u8 slot = 0;
    if (objTileId == -1)
    {
        objTileId = 0x380;
        config = GetDefaultMuConfig(objTileId, &slot);
    }
    else
        config = GetNewMuConfig(objTileId, &slot);
    if (!config)
        return NULL;
    if (Proc_Find(ProcScr_Mu))
        delay = 0xFE;
    proc = Proc_Start(ProcScr_Mu, PROC_TREE_5);
    if (!proc)
        return NULL;
    proc->unit = NULL;
    proc->state = MU_STATE_INACTIVE;
    proc->x_q4 = (x * 16) << MU_SUBPIXEL_PRECISION;
    proc->y_q4 = (y * 16) << MU_SUBPIXEL_PRECISION;
    proc->x_offset_q4 = 0;
    proc->y_offset_q4 = 0;
    proc->facing = MU_FACING_UNK11;
    proc->move_clock_q4 = 0;
    proc->step_sound_clock = delay;
    proc->jid = jid;
    proc->hidden_b = FALSE;
    proc->vram = OBJ_VRAM0 + (objTileId << 5);
    proc->slot = slot;
    proc->layer = OAM2_LAYER(2);
    proc->move_config = 0;
    proc->fast_walk_b = FALSE;
    config->pal = palId;
    anim = StartSpriteAnim(GetMuAnimForJid(jid), 10);
    SetSpriteAnimId(anim, MU_FACING_SELECTED);
    Decompress(GetMuImg(proc), GetMuImgBufById(config->slot));
    anim->img = GetMuImgBufById(config->slot);
    anim->oam2 = config->chr + OAM2_PAL(config->pal) + proc->layer;
    proc->sprite_anim = anim;
    proc->config = config;
    proc->config->mu = proc;
    return proc;
}
void SetMuFacing(struct MuProc * proc, int facing)
{
    proc->facing = facing;
    if (facing == MU_FACING_STANDING)
        SetStandingMuFacing(proc->slot, proc->vram);
    else
        SetSpriteAnimId(proc->sprite_anim, proc->facing);
}
void SetMuDefaultFacing(struct MuProc * proc)
{
    if (GetClassData(proc->jid)->attributes & CA_MOUNTEDAID)
        SetMuFacing(proc, 1);
    else
        SetMuFacing(proc, 2);
}
void MU_SetDefaultFacing_Auto(void)
{
    struct MuProc * proc = Proc_Find(ProcScr_Mu);
    if (!proc)
        return;
    SetMuDefaultFacing(proc);
}
void SetAutoMuMoveScript(u8 const * commands)
{
    struct MuProc * proc = Proc_Find(ProcScr_Mu);
    if (!proc)
        return;
    SetMuMoveScript(proc, commands);
}
bool MuExists(void)
{
    return Proc_Find(ProcScr_Mu) ? TRUE : FALSE;
}
bool MuExistsActive(void)
{
    struct MuProc * mu;
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        if (sMuConfig[i].slot != 0)
        {
            mu = sMuConfig[i].mu;
            switch (mu->state)
            {
            case MU_STATE_INACTIVE:
                break;
            default:
                return TRUE;
            }
        }
    }
    if (i >= MU_MAX_COUNT)
        return FALSE;
    return TRUE;
}
bool IsMuActive(struct MuProc * mu)
{
    if (!mu->config->slot)
        return FALSE;
    switch (mu->state)
    {
    case MU_STATE_INACTIVE:
        return FALSE;
    default:
        return TRUE;
    }
    return FALSE;
}
void SetMuMoveScript(struct MuProc * mu, u8 const * commands)
{
    int i;
    for (i = 0; i < 0x40; ++i)
        mu->config->movescr[i] = commands[i];
    mu->config->pc = 0;
    mu->state = MU_STATE_MOVEMENT;
    PlayMuStepSe(mu);
}
struct MuProc * StartMuScripted(u16 x, u16 y, u16 jid, int pal, u8 const * commands)
{
    struct MuProc * proc = StartMuInternal(x, y, jid, -1, pal);
    if (!proc)
        return NULL;
    SetMuMoveScript(proc, commands);
    return proc;
}
void MuStepSe_Init(struct MuStepSoundProc * proc)
{
    proc->song1 = 0;
    proc->x1 = 0;
    proc->song2 = 0;
    proc->x2 = 0;
}
void MuStepSe_PlaySeA(struct MuStepSoundProc * proc)
{
    PlaySeSpacial(proc->song1, proc->x1);
}
void MuStepSe_PlaySeB(struct MuStepSoundProc * proc)
{
    if (proc->song2)
        PlaySeSpacial(proc->song2, proc->x2);
}
void StartPlayMuStepSe(int song, int alt_offset, int x)
{
    struct MuStepSoundProc * proc;
    proc = Proc_Find(ProcScr_MuStepSe);
    if (!proc)
        proc = Proc_Start(ProcScr_MuStepSe, PROC_TREE_3);
    if (!proc->song1)
    {
        proc->song1 = song;
        proc->x1 = x;
    }
    else if (!proc->unk60)
    {
        proc->song2 = song + alt_offset;
        proc->x2 = x;
    }
}
void PlayMuStepSe(struct MuProc * proc)
{
    UpdateMuStepSounds(proc);
}
void EndMuMovement(struct MuProc * proc)
{
}
void RunMuMoveScript(struct MuProc * proc)
{
    while (TRUE)
    {
        short command;
        void const * anim;
        command = proc->config->movescr[proc->config->pc++];
        switch (command)
        {
        case MOVE_CMD_SLEEP:
            proc->move_clock_q4 = proc->config->movescr[proc->config->pc++];
            proc->state = MU_STATE_SLEEPING;
            return;
        case MOVE_CMD_BUMP:
            EndMuMovement(proc);
            proc->state = MU_STATE_BUMPING;
            StartMuFogBump(
                (proc->x_q4 >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.x,
                (proc->y_q4 >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.y);
            return;
        case MOVE_CMD_HALT:
            HaltMu(proc);
            return;
        case MOVE_CMD_END:
            EndMuMovement(proc);
            EndMu(proc);
            return;
        case MOVE_CMD_MOVE_LEFT:
        case MOVE_CMD_MOVE_RIGHT:
        case MOVE_CMD_MOVE_DOWN:
        case MOVE_CMD_MOVE_UP:
            if (command != proc->facing)
            {
                anim = GetMuAnimForJid(proc->jid);
                SetMuFacing(proc, command);
                proc->state = MU_STATE_MOVEMENT;
            }
            return;
        case MOVE_CMD_FACE_LEFT:
        case MOVE_CMD_FACE_RIGHT:
        case MOVE_CMD_FACE_DOWN:
        case MOVE_CMD_FACE_UP:
            command = command - MOVE_CMD_FACE_BASE;
            if (command != proc->facing)
            {
                anim = GetMuAnimForJid(proc->jid);
                SetMuFacing(proc, command);
            }
            continue;
        case MOVE_CMD_SET_SPEED:
            proc->move_config = proc->config->movescr[proc->config->pc++];
            continue;
        case MOVE_CMD_CAMERA_ON:
            EnableMuCamera(proc);
            continue;
        case MOVE_CMD_CAMERA_OFF:
            DisableMuCamera(proc);
            continue;
        default:
            break;
        }
    }
}
void StartMuFogBump(int x, int y)
{
    struct MuFogBumpProc * proc;
    struct SpriteAnim * anim;
    Decompress(Img_MuFogBump, OBJ_VRAM0 + 0x180 * 0x20);
    anim = StartSpriteAnim(SpriteAnim_MuFogBump, 2);
    anim->oam2 = OAM2_CHR(0x180) + OAM2_PAL(1);
    SetSpriteAnimId(anim, 0);
    proc = Proc_Start(ProcScr_MuFogBump, PROC_TREE_3);
    proc->sprite_anim = anim;
    proc->x = x + 8;
    proc->y = y - 4;
}
void MuFogBump_Init(struct MuFogBumpProc * proc)
{
    PlaySoundEffect(0x397);
    proc->timer = 0;
    SetObjAffineAuto(0, 0, 0x200, 0x200);
}
void MuFogBump_ScaleLoop(struct MuFogBumpProc * proc)
{
    int scale;
    if (proc->timer++ >= 8)
        Proc_Break(proc);
    scale = Interpolate(5, 0x200, 0x100, proc->timer, 8);
    SetObjAffineAuto(0, 0, scale, scale);
    DisplaySpriteAnim(proc->sprite_anim, proc->x - 8, (proc->y - 8) | OAM0_AFFINE_ENABLE | OAM0_DOUBLESIZE);
}
void MuFogBump_EndLoop(struct MuFogBumpProc * proc)
{
    if (proc->timer++ >= 40)
        Proc_Break(proc);
    DisplaySpriteAnim(proc->sprite_anim, proc->x, proc->y | OAM0_AFFINE_ENABLE);
}
bool MU_IsFogBumpFxActive(void)
{
    return Proc_Find(ProcScr_MuFogBump) ? TRUE : FALSE;
}
void Mu_OnStateBump(struct MuProc * proc)
{
    if (!MU_IsFogBumpFxActive())
        proc->state = MU_STATE_SLEEPING;
}
void Mu_OnStateUnk4(struct MuProc * proc)
{
    proc->state = MU_STATE_MOVEMENT;
}
void Mu_OnStateSleeping(struct MuProc * proc)
{
    if (proc->move_clock_q4 == 0)
        proc->state = MU_STATE_MOVEMENT;
    else
        proc->move_clock_q4--;
}
void Mu_OnStateNone(struct MuProc * proc)
{
}
void Mu_OnStateDoNothing(struct MuProc * proc)
{
}
void Mu_OnStateMovement(struct MuProc * proc)
{
    unsigned speed = GetMuQ4MovementSpeed(proc);
    proc->move_clock_q4 += speed;
    proc->x_q4 += speed * sMoveOffsetLut[proc->facing * 2 + 0];
    proc->y_q4 += speed * sMoveOffsetLut[proc->facing * 2 + 1];
    if ((proc->move_clock_q4 >> 4) >= 16)
    {
        proc->move_clock_q4 -= 0x100;
        proc->x_q4 -= proc->move_clock_q4 * sMoveOffsetLut[proc->facing * 2 + 0];
        proc->y_q4 -= proc->move_clock_q4 * sMoveOffsetLut[proc->facing * 2 + 1];
        proc->move_clock_q4 = 0;
        proc->x_q4 &= ~0xF;
        proc->y_q4 &= ~0xF;
    }
    if (proc->cam_b)
    {
        gBmSt.camera.x = GetCameraAdjustedX(proc->x_q4 >> MU_SUBPIXEL_PRECISION);
        gBmSt.camera.y = GetCameraAdjustedY(proc->y_q4 >> MU_SUBPIXEL_PRECISION);
    }
    if (!(proc->move_config & 0x80))
        UpdateMuStepSounds(proc);
}
void UpdateMuStepSounds(struct MuProc * proc)
{
    struct ClassData const * jinfo;
    u16 const * scr;
    int pc;
    struct Vec2 position;
    jinfo = GetClassData(proc->jid);
    if (jinfo->attributes & CA_MOUNTEDAID)
    {
        switch (proc->jid)
        {
        case 0x32:
        case 0x33:
            scr = MuSoundScr_Pegasus;
            break;
        case 0x34:
        case 0x35:
        case 0x36:
        case 0x37:
            scr = MuSoundScr_Wyvern;
            break;
        default:
            scr = MuSoundScr_Mounted;
            break;
        }
    }
    else
    {
        switch (proc->jid)
        {
        case 0x14:
        case 0x15:
        case 0x16:
        case 0x17:
        case 0x55:
        case 0x5B:
        case 0x5C:
        case 0x5D:
            scr = MuSoundScr_FootHeavy;
            break;
        case 0x46:
            scr = MuSoundScr_46;
            break;
        default:
            scr = MuSoundScr_Foot;
            break;
        }
    }
    pc = DivRem(proc->step_sound_clock++, scr[0]);
    GetMuDisplayPosition(proc, &position);
    if (scr[2 + pc])
        StartPlayMuStepSe(scr[2 + pc], scr[1], position.x);
}
void Mu_OnLoop(struct MuProc * proc)
{
    if (proc->state)
    {
        if (proc->move_clock_q4 == 0)
            if (proc->state == MU_STATE_SLEEPING || proc->state == MU_STATE_MOVEMENT)
                RunMuMoveScript(proc);
        sMuStateFuncs[proc->state](proc);
    }
    if (proc->facing == MU_FACING_STANDING)
        PutMuSMS(proc);
    else
        PutMu(proc);
}
void MU_OnEnd(struct MuProc * proc)
{
    proc->config->slot = 0;
    EndSpriteAnim(proc->sprite_anim);
}
void EndAllMus(void)
{
    Proc_EndEach(ProcScr_Mu);
}
void EndMu(struct MuProc * proc)
{
    EndMuExt(proc);
}
void EndMuExt(struct MuProc * proc)
{
    Proc_End(proc);
}
void HaltMu(struct MuProc * proc)
{
    EndMuMovement(proc);
    proc->state = MU_STATE_INACTIVE;
}
void LockMus(void)
{
    Proc_BlockEachMarked(4);
}
void ReleaseMus(void)
{
    Proc_UnblockEachMarked(4);
}
void ApplyMoveScriptToCoordinates(int * x, int * y, u8 const * movescr)
{
    while (TRUE)
    {
        switch (*movescr++)
        {
        case MOVE_CMD_END:
        case MOVE_CMD_HALT:
            return;
        case MOVE_CMD_MOVE_LEFT:
            (*x)--;
            break;
        case MOVE_CMD_MOVE_RIGHT:
            (*x)++;
            break;
        case MOVE_CMD_MOVE_UP:
            (*y)--;
            break;
        case MOVE_CMD_MOVE_DOWN:
            (*y)++;
            break;
        case MOVE_CMD_SLEEP:
            movescr++;
            break;
        default:
            break;
        }
    }
}
bool CanStartMu(void)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
        if (sMuConfig[i].slot == 0)
            return TRUE;
    return FALSE;
}
void ResetMuAnims(void)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        if (sMuConfig[i].slot != 0)
        {
            ResetSpriteAnimClock(sMuConfig[i].mu->sprite_anim);
        }
    }
}
struct MuConfig * GetDefaultMuConfig(int objTileId, u8 * outIndex)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        if (sMuConfig[i].slot == 0)
        {
            sMuConfig[i].slot = i + 1;
            sMuConfig[i].chr = objTileId + sMuChrOffLut_Default[i];
            *outIndex = i;
            return sMuConfig + i;
        }
    }
    return NULL;
}
struct MuConfig * GetNewMuConfig(int objTileId, u8 * outIndex)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        if (sMuConfig[i].slot == 0)
        {
            sMuConfig[i].slot = i + 1;
            sMuConfig[i].chr = objTileId + sMuChrOffLut[i];
            *outIndex = i;
            return sMuConfig + i;
        }
    }
    return NULL;
}
s8 GetMuDisplayPosition(struct MuProc * proc, struct Vec2 * out)
{
    switch (proc->state)
    {
    case MU_STATE_DISPLAY_UI:
        out->x = (proc->x_q4 + proc->x_offset_q4) >> MU_SUBPIXEL_PRECISION;
        out->y = (proc->y_q4 + proc->y_offset_q4) >> MU_SUBPIXEL_PRECISION;
        return TRUE;
    default:
    {
        short x = ((proc->x_q4 + proc->x_offset_q4) >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.x + 8;
        short y = ((proc->y_q4 + proc->y_offset_q4) >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.y + 8;
        out->x = x;
        out->y = y + 8;
        if (x < -0x10 || x > 0x100 || y < -0x10 || y > 0xB0)
            return FALSE;
        return TRUE;
    }
    }
}
void PutMuSMS(struct MuProc * proc)
{
    if (!proc->hidden_b)
    {
        struct Vec2 pos;
        if (!GetMuDisplayPosition(proc, &pos))
            return;
        pos.x = OAM1_X(pos.x);
        pos.y = OAM0_Y(pos.y);
        if (proc->state == MU_STATE_DEATHFADE)
            pos.y |= OAM0_BLEND;
        sub_080255E0(proc->slot, proc->vram);
        sub_08026308(
            proc->sprite_anim->layer,
            pos.x - 8,
            pos.y - 16,
            (((u32) (proc->vram - OBJ_VRAM0) & 0x1FFFF) >> 5) + OAM2_PAL(proc->config->pal) + proc->layer,
            proc->jid,
            proc->slot);
    }
}
void PutMu(struct MuProc * proc)
{
    if (!proc->hidden_b)
    {
        struct Vec2 pos;
        if (!GetMuDisplayPosition(proc, &pos))
            return;
        pos.x = OAM1_X(pos.x);
        pos.y = OAM0_Y(pos.y);
        switch (proc->state)
        {
        case MU_STATE_DISPLAY_UI:
            break;
        default:
            if (!proc->unit)
                break;
            if (UNIT_FACTION(proc->unit) != FACTION_RED)
                break;
            if (gPlaySt.chapterVisionRange != 0)
                if (gBmMapFog[(((proc->y_q4 + proc->y_offset_q4) >> MU_SUBPIXEL_PRECISION) + 8) >> 4][(((proc->x_q4 + proc->x_offset_q4) >> MU_SUBPIXEL_PRECISION) + 8) >> 4] == 0)
                        return;
        }
        if (proc->state == MU_STATE_DEATHFADE)
            pos.y |= OAM0_BLEND;
        DisplaySpriteAnim(proc->sprite_anim, pos.x, pos.y);
    }
}
u16 GetMuQ4MovementSpeed(struct MuProc * proc)
{
    int config = proc->move_config;
    if (config & 0x80)
        config += 0x80;
    if (proc->fast_walk_b)
        return 0x100;
    if (config == 0x40)
        return sMuWalkSpeedLut[GetClassData(proc->jid)->slowWalking] << 4;
    if (config != 0)
    {
        int speed = config;
        if (speed & 0x40)
            speed ^= 0x40;
        else if (!gPlaySt.cfgGameSpeed)
        {
            if (gpKeySt->held & A_BUTTON)
                speed = config << 2;
        }
        else
            speed = config << 2;
        if (speed > 0x80)
            speed = 0x80;
        return speed;
    }
    if (!IsFirstPlaythrough() && (gpKeySt->held & A_BUTTON))
        return 0x80;
    if (!gPlaySt.cfgGameSpeed)
        return sMuWalkSpeedLut[GetClassData(proc->jid)->slowWalking] << 4;
    else
        return 0x40;
}
void SetMuConfig(struct MuProc * proc, u16 config)
{
    if (config > 0x100)
        proc->move_config = 0x100;
    else
        proc->move_config = config;
}
void * GetMuImgBufById(int slot)
{
    return gMUGfxBuffer + (sMuImgBufOffLut[slot] * MU_GFX_MAX_SIZE);
}
void const * GetMuImg(struct MuProc * proc)
{
    return gMuInfoTable[proc->jid - 1].img;
}
u16 const * GetMuAnimForJid(u16 jid)
{
    return gMuInfoTable[jid - 1].anim;
}
void StartMuDeathFade(struct MuProc * mu)
{
    struct MuEffectProc * proc;
    mu->state = MU_STATE_DEATHFADE;
    proc = Proc_Start(ProcScr_MuDeathFade, mu);
    proc->mu = mu;
    proc->time_left = 0x20;
    SetBlendConfig(0, proc->time_left >> 1, 0x10, 0);
    FreezeSpriteAnim(mu->sprite_anim);
    StartMuHitFlash(mu, MU_FLASH_WHITE);
    mu->sprite_anim->layer = 13;
    PlaySoundEffect(0xD6);
    if (mu->unit->state & US_IN_BALLISTA)
    {
        TryRemoveUnitFromBallista(mu->unit);
        HideUnitSprite(mu->unit);
    }
}
void MuDeathFade_OnLoop(struct MuEffectProc * proc)
{
    SetBlendConfig(0, (proc->time_left--) >> 1, 0x10, 0);
    if (proc->time_left == 0)
    {
        EndMu(proc->mu);
        Proc_Break(proc);
    }
}
void MuBlink_OnLoop(struct MuEffectProc * proc)
{
    struct MuProc * mu = proc->proc_parent;
    mu->hidden_b = (proc->time_left & 7) < 4;
    proc->time_left--;
    if (proc->time_left < 0)
    {
        Proc_Break(proc);
        mu->hidden_b = TRUE;
    }
}
void StartBlinkMu(struct MuProc * mu)
{
    struct MuEffectProc * proc;
    mu->state = MU_STATE_DEATHFADE;
    proc = Proc_Start(ProcScr_MuBlink, mu);
    proc->mu = mu;
    proc->time_left = 0x40;
    FreezeSpriteAnim(mu->sprite_anim);
    PlaySoundEffect(0xD6);
}
void MU_SetupPixelEffect(u32 * data, int frame)
{
    int i, j;
    int pixel = sPixelEffectOrderLut[frame] % 8;
    int wordId = sPixelEffectOrderLut[frame] / 8;
    sKeptPixelsWordMask = 0xFFFFFFFF;
    sClearedPixelWordMask = 0xF << (pixel * 4);
    sKeptPixelsWordMask &= ~sClearedPixelWordMask;
    for (i = 0; i < 4; ++i)
    {
        for (j = 0; j < 4; ++j)
        {
            u32 word = data[wordId];
            word &= sKeptPixelsWordMask;
            data[wordId] = word;
            data += 8;
        }
        data += 0xE0;
    }
}
void MuPixelEffect_OnLoop(struct MuEffectProc * proc)
{
    void * buf = GetMuImgBufById(((struct MuProc *) proc->proc_parent)->slot);
    MU_SetupPixelEffect(buf, proc->frame);
    proc->frame++;
    RegisterDataMove(gMUGfxBuffer, OBJ_VRAM0 + 0x380 * 0x20, 0x80 * 0x20);
    proc->time_left--;
    if (proc->time_left == 0)
    {
        EndMu(proc->mu);
        Proc_Break(proc);
    }
}
void MU_StartPixelEffect(struct MuProc * mu)
{
    struct MuEffectProc * proc;
    mu->state = MU_STATE_DEATHFADE;
    proc = Proc_Start(ProcScr_MuPixelEffect, mu);
    proc->mu = mu;
    proc->time_left = 0x40;
    proc->frame = 0;
    FreezeSpriteAnim(mu->sprite_anim);
    PlaySoundEffect(0xD6);
}
void HideMu(struct MuProc * proc)
{
    proc->hidden_b = TRUE;
}
void ShowMu(struct MuProc * proc)
{
    proc->hidden_b = FALSE;
}
void SetMuScreenPosition(struct MuProc * proc, int x, int y)
{
    proc->x_q4 = x << MU_SUBPIXEL_PRECISION;
    proc->y_q4 = y << MU_SUBPIXEL_PRECISION;
}
void SetMuScreenOffset(struct MuProc * proc, int x_off, int y_off)
{
    proc->x_offset_q4 = x_off << MU_SUBPIXEL_PRECISION;
    proc->y_offset_q4 = y_off << MU_SUBPIXEL_PRECISION;
}
void StartMuFadeIntoFlash(struct MuProc * proc, int flash)
{
    proc->sprite_anim->oam2 = proc->config->chr + OAM2_PAL(5) + proc->layer;
    ApplyPalette(MU_PAL_OBJ(proc->config->pal), 0x10 + 5);
    StartPalFade(gMuFlashPalLut[flash], 0x15, 8, proc);
}
void StartMuFadeFromFlash(struct MuProc * mu)
{
    struct MuEffectProc * proc;
    StartPalFade(MU_PAL_OBJ(mu->config->pal), 0x15, 8, mu);
    proc = Proc_Start(ProcScr_MuRestorePalInfo, PROC_TREE_3);
    proc->mu = mu;
}
void MuRestorePalInfo_Apply(struct MuEffectProc * proc)
{
    struct MuProc * mu = proc->mu;
    mu->sprite_anim->oam2 = mu->config->chr + OAM2_PAL(mu->config->pal) + mu->layer;
}
void StartMuActionAnim(struct MuProc * proc)
{
    SetSpriteAnimId(proc->sprite_anim, MU_FACING_SELECTED);
    ResetSpriteAnimClock(proc->sprite_anim);
    CallDelayedArg(MuActionAnimFinishFunc, (int) proc->sprite_anim, 30);
}
void MuActionAnimFinishFunc(int arg)
{
    FreezeSpriteAnim((struct SpriteAnim *) arg);
}
void StartMuDelayedFaceDefender(struct MuProc * proc)
{
    ResetSpriteAnimClock(proc->sprite_anim);
    CallDelayedArg(MuDelayedFaceDefenderFunc, (int) proc->sprite_anim, 30);
}
void MuDelayedFaceDefenderFunc(int arg)
{
    SetManimActorFacing(
        gManimSt.attacker_actor,
        1 - gManimSt.attacker_actor,
        GetSpellAssocFacing(gManimSt.actor[0].bu->weaponBefore));
    FreezeSpriteAnim((struct SpriteAnim *) arg);
}
void StartMuSpeedUpAnim(struct MuProc * proc)
{
    proc->sprite_anim->clock = 0;
    proc->sprite_anim->clock_interval_q8 = 0x40;
    CallDelayedArg(MuSlowDownAnimFreezeFunc, (int) proc->sprite_anim, 20);
}
void MuSlowDownAnimFreezeFunc(int arg)
{
    FreezeSpriteAnim((struct SpriteAnim *) arg);
}
void StartMuCritFlash(struct MuProc * mu, int flash)
{
    struct MuFlashEffectProc * proc;
    ApplyPalette(gMuFlashPalLut[flash], 0x10 + 5);
    proc = Proc_Start(ProcScr_MuCritFlash, mu);
    proc->mu = mu;
}
void MuCritFlash_Init(struct MuFlashEffectProc * proc)
{
    proc->timer = 0;
}
void MuCritFlash_SetFadedPalette(struct MuFlashEffectProc * proc)
{
    proc->mu->sprite_anim->oam2 = proc->mu->config->chr + OAM2_PAL(5) + proc->mu->layer;
}
void MuCritFlash_SetRegularPalette(struct MuFlashEffectProc * proc)
{
    proc->mu->sprite_anim->oam2 = proc->mu->config->chr + OAM2_PAL(proc->mu->config->pal) + proc->mu->layer;
}
void MuCritFlash_StartFadeBack_maybe(struct MuFlashEffectProc * proc)
{
    StartPalFade(MU_PAL_OBJ(proc->mu->config->pal), 0x10 + 5, 20, proc);
}
void MuCritFlash_SpriteShakeLoop(struct MuFlashEffectProc * proc)
{
    proc->timer++;
    SetMuScreenOffset(proc->mu, (proc->timer & 1) ? 2 : -2, 0);
    if (proc->timer >= 12)
    {
        SetMuScreenOffset(proc->mu, 0, 0);
        Proc_Break(proc);
    }
}
void MuCritFlash_RestorePalette(struct MuFlashEffectProc * proc)
{
    proc->mu->sprite_anim->oam2 = proc->mu->config->chr + OAM2_PAL(proc->mu->config->pal) + proc->mu->layer;
}
void StartMuHitFlash(struct MuProc * mu, int flash)
{
    struct MuFlashEffectProc * proc;
    ApplyPalette(gMuFlashPalLut[flash], 0x10 + 5);
    mu->sprite_anim->oam2 = mu->config->chr + OAM2_PAL(5) + mu->layer;
    StartPalFade(MU_PAL_OBJ(mu->config->pal), 0x15, 20, mu);
    proc = Proc_Start(ProcScr_MuHitFlash, mu);
    proc->mu = mu;
}
void MuFlashFadeFrom_RestorePal(struct MuFlashEffectProc * proc)
{
    proc->mu->sprite_anim->oam2 = proc->mu->config->chr + OAM2_PAL(proc->mu->config->pal) + proc->mu->layer;
}
void SetMuMaxWalkSpeed(void)
{
    Proc_ForEach(ProcScr_Mu, MuMaxWalkSpeedFunc);
}
void MuMaxWalkSpeedFunc(ProcPtr proc)
{
    ((struct MuProc *) proc)->fast_walk_b = TRUE;
}
void SetMuSpecialSprite(struct MuProc * proc, int jid, u16 const * pal)
{
    FreezeSpriteAnim(proc->sprite_anim);
    proc->jid = jid;
    SetSpriteAnimInfo(proc->sprite_anim, GetMuAnimForJid(proc->jid));
    Decompress(GetMuImg(proc), GetMuImgBufById(proc->config->slot));
    ApplyPalette(pal, 0x10 + proc->config->pal);
}
void SetMuPal(struct MuProc * proc, unsigned pal)
{
    proc->config->pal = pal;
    proc->sprite_anim->oam2 = proc->config->chr + OAM2_PAL(pal) + proc->layer;
}
struct MuProc * GetMu(int slot)
{
    if (!sMuConfig[slot].slot)
        return NULL;
    return sMuConfig[slot].mu;
}
struct MuProc * GetUnitMu(struct Unit * unit)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        struct MuProc * proc = GetMu(i);
        if (proc->unit == unit)
            return proc;
    }
    return NULL;
}