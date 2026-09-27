#include "gbafe.h"

// not yet declared in headers
int GetUnitSpritePalette(struct Unit * unit);
void SetStandingMuFacing(int slot, void * vram);
int GetClassSMSId(int jid);
void PlaySeSpacial(int song, int x);

struct MuProc * StartMuInternal(u16 x, u16 y, u16 jid, int objTileId, unsigned palId);
void Mu_OnLoop(struct MuProc * proc);
void SetMuFacing(struct MuProc * proc, int facing);
void SetMuDefaultFacing(struct MuProc * proc);
void SetMuMoveScript(struct MuProc * mu, u8 const * commands);
void PlayMuStepSe(struct MuProc * proc);
void UpdateMuStepSounds(struct MuProc * proc);
void EndMuMovement(struct MuProc * proc);
void StartMuFogBump(int x, int y);
void EndMu(struct MuProc * proc);
void HaltMu(struct MuProc * proc);
void EnableMuCamera(struct MuProc * proc);
void DisableMuCamera(struct MuProc * proc);
struct MuConfig * GetDefaultMuConfig(int objTileId, u8 * outIndex);
struct MuConfig * GetNewMuConfig(int objTileId, u8 * outIndex);
void * GetMuImgBufById(int slot);
void const * GetMuImg(struct MuProc * proc);
u16 const * GetMuAnimForJid(u16 jid);

extern struct MuConfig sMuConfig[MU_MAX_COUNT];
extern struct ProcCmd ProcScr_Mu[];
extern struct ProcCmd ProcScr_MuStepSe[];

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

ASM_FUNC("asm/nonmatching/code_0806C540.s");
ASM_FUNC("asm/nonmatching/code_0806C5BC.s");
ASM_FUNC("asm/nonmatching/code_0806C67C.s");
ASM_FUNC("asm/nonmatching/code_0806C760.s");
ASM_FUNC("asm/nonmatching/code_0806C7A4.s");
ASM_FUNC("asm/nonmatching/code_0806C7C8.s");
ASM_FUNC("asm/nonmatching/code_0806C7FC.s");
ASM_FUNC("asm/nonmatching/code_0806C824.s");
ASM_FUNC("asm/nonmatching/code_0806C880.s");
ASM_FUNC("asm/nonmatching/code_0806C890.s");
ASM_FUNC("asm/nonmatching/code_0806C8A0.s");
ASM_FUNC("asm/nonmatching/code_0806CAF8.s");
ASM_FUNC("asm/nonmatching/code_0806CC0C.s");
ASM_FUNC("asm/nonmatching/code_0806CC90.s");
ASM_FUNC("asm/nonmatching/code_0806CCB8.s");
ASM_FUNC("asm/nonmatching/code_0806CCD0.s");
ASM_FUNC("asm/nonmatching/code_0806CCE8.s");
ASM_FUNC("asm/nonmatching/code_0806CD00.s");
ASM_FUNC("asm/nonmatching/code_0806CD30.s");
ASM_FUNC("asm/nonmatching/code_0806CD40.s");
ASM_FUNC("asm/nonmatching/code_0806CD50.s");
ASM_FUNC("asm/nonmatching/code_0806CE00.s");
ASM_FUNC("asm/nonmatching/code_0806CE40.s");
ASM_FUNC("asm/nonmatching/code_0806CEB4.s");
ASM_FUNC("asm/nonmatching/code_0806CF58.s");
ASM_FUNC("asm/nonmatching/code_0806CFFC.s");
ASM_FUNC("asm/nonmatching/code_0806D148.s");
ASM_FUNC("asm/nonmatching/code_0806D250.s");
ASM_FUNC("asm/nonmatching/code_0806D380.s");
ASM_FUNC("asm/nonmatching/code_0806D4CC.s");
ASM_FUNC("asm/nonmatching/code_0806D524.s");
ASM_FUNC("asm/nonmatching/code_0806D554.s");
ASM_FUNC("asm/nonmatching/code_0806D580.s");
ASM_FUNC("asm/nonmatching/code_0806D5AC.s");
ASM_FUNC("asm/nonmatching/code_0806D6D8.s");
ASM_FUNC("asm/nonmatching/code_0806D76C.s");
ASM_FUNC("asm/nonmatching/code_0806D804.s");
ASM_FUNC("asm/nonmatching/code_0806D890.s");
ASM_FUNC("asm/nonmatching/code_0806D968.s");
ASM_FUNC("asm/nonmatching/code_0806DA18.s");
ASM_FUNC("asm/nonmatching/code_0806DAB4.s");
ASM_FUNC("asm/nonmatching/code_0806DADC.s");
ASM_FUNC("asm/nonmatching/code_0806DAFC.s");
ASM_FUNC("asm/nonmatching/code_0806DB48.s");
ASM_FUNC("asm/nonmatching/code_0806DB94.s");
ASM_FUNC("asm/nonmatching/code_0806DC14.s");
ASM_FUNC("asm/nonmatching/code_0806DC64.s");
ASM_FUNC("asm/nonmatching/code_0806DCB4.s");
ASM_FUNC("asm/nonmatching/code_0806DD08.s");
ASM_FUNC("asm/nonmatching/code_0806DD30.s");
ASM_FUNC("asm/nonmatching/code_0806DD78.s");
ASM_FUNC("asm/nonmatching/code_0806DDD4.s");
ASM_FUNC("asm/nonmatching/code_0806DE1C.s");
ASM_FUNC("asm/nonmatching/code_0806DE44.s");
ASM_FUNC("asm/nonmatching/code_0806DE8C.s");
ASM_FUNC("asm/nonmatching/code_0806DEAC.s");
ASM_FUNC("asm/nonmatching/code_0806DEF0.s");
ASM_FUNC("asm/nonmatching/code_0806DF44.s");
ASM_FUNC("asm/nonmatching/code_0806DF80.s");
ASM_FUNC("asm/nonmatching/code_0806E000.s");
ASM_FUNC("asm/nonmatching/code_0806E054.s");
ASM_FUNC("asm/nonmatching/code_0806E0F0.s");
ASM_FUNC("asm/nonmatching/code_0806E144.s");
ASM_FUNC("asm/nonmatching/code_0806E160.s");
ASM_FUNC("asm/nonmatching/code_0806E188.s");
ASM_FUNC("asm/nonmatching/code_0806E220.s");
ASM_FUNC("asm/nonmatching/code_0806E278.s");
ASM_FUNC("asm/nonmatching/code_0806E2B8.s");
