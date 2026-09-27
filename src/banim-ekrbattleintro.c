#include "gbafe.h"

struct ProcEkrBaseKaiten {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk29;
    /* 2A */ u16 unk2A;
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ u16 unk30;
    /* 32 */ s16 x1;
    /* 34 */ s16 x2;
    /* 36 */ s16 unk36;
    /* 38 */ STRUCT_PAD(0x38, 0x3A);
    /* 3A */ s16 y1;
    /* 3C */ s16 y2;
    /* 3E */ s16 unk3E;
    /* 40 */ STRUCT_PAD(0x40, 0x44);
    /* 44 */ int type;
    /* 48 */ STRUCT_PAD(0x48, 0x5C);
    /* 5C */ struct Anim * anim;
    /* 60 */ const u16 * unk60;
};

struct ProcUnitKakudai {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ u16 unk30;
    /* 32 */ s16 x1;
    /* 34 */ s16 x2;
    /* 36 */ s16 left_pos;
    /* 38 */ s16 right_pos;
    /* 3A */ s16 y1;
    /* 3C */ s16 y2;
    /* 3E */ STRUCT_PAD(0x3E, 0x44);
    /* 44 */ int type;
    /* 48 */ STRUCT_PAD(0x48, 0x4C);
    /* 4C */ int valid_l;
    /* 50 */ int valid_r;
    /* 54 */ void * pOaml;
    /* 58 */ void * pOamr;
};

struct ProcEkrIntroWindow {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 ymax;
    /* 32 */ STRUCT_PAD(0x32, 0x44);
    /* 44 */ int type;
    /* 48 */ int ymax_name;
};

extern struct Vec2 gEkrBg0QuakeVec;
extern int gEkrWindowAppearExist;
extern int gEkrNamewinAppearExist;
extern int gProcEkrBaseAppearExist;

extern const u16 Pal_080DC85C[];

void EkrGauge_0804CC78(s16 x, s16 y);
void EkrGauge_ClrInitFlag(void);
void EkrGauge_SetInitFlag(void);
void EkrDispUP_SetPositionUnsync(u16 x, u16 y);
void UnsyncEkrDispUP(void);
void SyncEkrDispUP(void);
void EndEkrDispUP(void);
extern const u16 BanimLeftDefaultPos[];
extern u8 gBanimLeftImgSheetBuf[];
extern u8 gBanimRightImgSheetBuf[];
extern void const * gBanimForceUnitChgDebug[2];
extern u8 gEkrKakudaiSomeBufLeft[];
extern u8 gEkrKakudaiSomeBufRight[];
extern s16 gEkrBmLocation[4];
extern int gEkrInitPosReal;
u16 IsItemDisplayedInBattle(u16 item);

// view of CharacterData 0x25..0x26 as an array (unit.h declares them as _u25, _u26)
struct CharacterDataBanimView {
    u8 pad[0x25];
    u8 banim_unique[2];
};
extern struct BattleAnimDef const * CONST_DATA gUnitSpecificBanimConfigs[];

void EkrBaseAppearMain(struct ProcEkrIntroWindow * proc);
void EkrBaseKaitenMain(struct ProcEkrBaseKaiten * proc);
void EkrNamewinAppearDelay(struct ProcEkrIntroWindow * proc);
void EkrNamewinAppearMain(struct ProcEkrIntroWindow * proc);
void EkrWindowAppearMain(struct ProcEkrIntroWindow * proc);
void UnitKakudai1(struct ProcUnitKakudai * proc);
void UnitKakudai2(struct ProcUnitKakudai * proc);
void UnitKakudaiEndNop(struct ProcUnitKakudai * proc);

CONST_DATA struct ProcCmd ProcScr_EkrBaseKaiten[] = {
    PROC_19,
    PROC_REPEAT(EkrBaseKaitenMain),
    PROC_END,
};

CONST_DATA const u8 * Imgs_085B9B84[] = {
    (const u8 *) 0x081E6CD4,
    NULL,
    (const u8 *) 0x081E6CD4,
    NULL,
    (const u8 *) 0x081E67D0,
    NULL,
    (const u8 *) 0x081E6CD4,
    NULL,
};

CONST_DATA const u8 * Imgs_085B9BA4[] = {
    (const u8 *) 0x081E7160,
    (const u8 *) 0x081E75B8,
    (const u8 *) 0x081E75B8,
    (const u8 *) 0x081E75B8,
    (const u8 *) 0x081E7AEC,
    (const u8 *) 0x081E75B8,
    (const u8 *) 0x081E75B8,
    (const u8 *) 0x081E75B8,
};

CONST_DATA u32 * AnimScrs_085B9BC4[] = {
    (u32 *) 0x08B9F428,
    NULL,
    (u32 *) 0x08B9F448,
    NULL,
    (u32 *) 0x08B9E798,
    NULL,
    (u32 *) 0x08B9F46C,
    NULL,
};

CONST_DATA u32 * AnimScrs_085B9BE4[] = {
    (u32 *) 0x08B9FCFC,
    (u32 *) 0x08BA0B60,
    (u32 *) 0x08BA0B60,
    (u32 *) 0x08BA0B60,
    (u32 *) 0x08BA1364,
    (u32 *) 0x08BA0B84,
    (u32 *) 0x08BA0B84,
    (u32 *) 0x08BA0B84,
};

CONST_DATA u32 * AnimScrs_085B9C04[] = {
    (u32 *) 0x08B9FCD8,
    (u32 *) 0x08BA0B18,
    (u32 *) 0x08BA0B18,
    (u32 *) 0x08BA0B18,
    (u32 *) 0x08BA1340,
    (u32 *) 0x08BA0B3C,
    (u32 *) 0x08BA0B3C,
    (u32 *) 0x08BA0B3C,
};

CONST_DATA u32 * AnimScrs_085B9C24[] = {
    (u32 *) 0x08B9F490,
    NULL,
    (u32 *) 0x08B9F4B0,
    NULL,
    (u32 *) 0x08B9E7BC,
    NULL,
    (u32 *) 0x08B9F4D4,
    NULL,
};

CONST_DATA u32 * AnimScrs_085B9C44[] = {
    (u32 *) 0x08B9FD44,
    (u32 *) 0x08BA0BF0,
    (u32 *) 0x08BA0BF0,
    (u32 *) 0x08BA0BF0,
    (u32 *) 0x08BA13AC,
    (u32 *) 0x08BA0C14,
    (u32 *) 0x08BA0C14,
    (u32 *) 0x08BA0C14,
};

CONST_DATA u32 * AnimScrs_085B9C64[] = {
    (u32 *) 0x08B9FD20,
    (u32 *) 0x08BA0BA8,
    (u32 *) 0x08BA0BA8,
    (u32 *) 0x08BA0BA8,
    (u32 *) 0x08BA1388,
    (u32 *) 0x08BA0BCC,
    (u32 *) 0x08BA0BCC,
    (u32 *) 0x08BA0BCC,
};

CONST_DATA const u16 * gUnknown_085B9C84[] = {
    (const u16 *) 0x081D8458,
    NULL,
    (const u16 *) 0x081D8468,
    NULL,
    (const u16 *) 0x081D8448,
    NULL,
    (const u16 *) 0x081D8478,
    NULL,
};

CONST_DATA const u16 * gUnknown_085B9CA4[] = {
    (const u16 *) 0x081D8498,
    (const u16 *) 0x081D84C8,
    (const u16 *) 0x081D84C8,
    (const u16 *) 0x081D84C8,
    (const u16 *) 0x081D84F8,
    (const u16 *) 0x081D84D8,
    (const u16 *) 0x081D84D8,
    (const u16 *) 0x081D84D8,
};

CONST_DATA const u16 * gUnknown_085B9CC4[] = {
    (const u16 *) 0x081D8488,
    (const u16 *) 0x081D84A8,
    (const u16 *) 0x081D84A8,
    (const u16 *) 0x081D84A8,
    (const u16 *) 0x081D84E8,
    (const u16 *) 0x081D84B8,
    (const u16 *) 0x081D84B8,
    (const u16 *) 0x081D84B8,
};

CONST_DATA struct ProcCmd ProcScr_ekrUnitKakudai[] = {
    PROC_19,
    PROC_REPEAT(UnitKakudai1),
    PROC_REPEAT(UnitKakudai2),
    PROC_REPEAT(UnitKakudaiEndNop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_ekrWindowAppear[] = {
    PROC_19,
    PROC_REPEAT(EkrWindowAppearMain),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_ekrNamewinAppear[] = {
    PROC_19,
    PROC_REPEAT(EkrNamewinAppearDelay),
    PROC_REPEAT(EkrNamewinAppearMain),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_ekrBaseAppear[] = {
    PROC_19,
    PROC_REPEAT(EkrBaseAppearMain),
    PROC_END,
};

void NewEkrBaseKaiten(int identifier)
{
#ifdef NONMATCHING
    #define AccessArray(array, index, offset) ((array)[index])
#else
    #define AccessArray(array, index, offset) (*(typeof(&*(array)))((void *)(array) + (offset)))
#endif

    int mode;
    const u8 ** pptr;
    struct Anim * anim;
    struct ProcEkrBaseKaiten * proc;
    u32 r6;
    const u8 * src;

    SetBlendConfig(0, 10, 6, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 0);

    gDispIo.blend_ct.target2_enable_bd = 1;

    if (gEkrBmLocation[0] == gEkrBmLocation[2])
    {
        if (gEkrBmLocation[1] >= gEkrBmLocation[3])
            mode = 6;
        else
            mode = 2;
    }
    else
    {
        if (gEkrBmLocation[1] == gEkrBmLocation[3])
        {
            if (gEkrBmLocation[0] < gEkrBmLocation[2])
                mode = 0;
            else
                mode = 4;
        }
        else
        {
            if (gEkrBmLocation[0] < gEkrBmLocation[2])
            {
                if (gEkrBmLocation[1] >= gEkrBmLocation[3])
                    mode = 7;
                else
                    mode = 1;
            }
            else
            {
                if (gEkrBmLocation[1] >= gEkrBmLocation[3])
                    mode = 5;
                else
                    mode = 3;
            }
        }
    }

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_PROMOTION:
        pptr = Imgs_085B9B84;
        break;

    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
    case EKR_DISTANCE_MONOCOMBAT:
    default:
        pptr = Imgs_085B9BA4;
        break;
    }

    src = pptr[mode];
    r6 = mode * 4;
    LZ77UnCompVram(src, OBJ_VRAM0);
    CpuFastCopy(Pal_080DC85C, PAL_OBJ(4), 4);
    EnablePalSync();

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_PROMOTION:
        proc = Proc_Start(ProcScr_EkrBaseKaiten, PROC_TREE_3);
        proc->type = identifier;
        proc->unk29 = 0;
        proc->timer = 0;
        proc->terminator = 0xB;
        proc->x1 = (gEkrBmLocation[0] + gEkrBmLocation[2]) * 8 + 8;
        proc->y1 = (gEkrBmLocation[1] + gEkrBmLocation[3]) * 8 + 8;
        proc->x2 = 0x78;
        proc->y2 = 0x68;

        if (proc->type == 0)
            anim = AnimCreate(AccessArray(AnimScrs_085B9BC4, mode, r6), 0x64);
        else
            anim = AnimCreate(AccessArray(AnimScrs_085B9C24, mode, r6), 0x64);

        proc->anim = anim;
        anim->oam2Base = 0x4800;
        anim->oamBase |= 0x400;

        if (proc->type == 0)
        {
            anim->xPosition = proc->x1;
            anim->yPosition = proc->y1;
        }
        else
        {
            anim->xPosition = proc->x2;
            anim->yPosition = proc->y2;
        }
        proc->unk60 = AccessArray(gUnknown_085B9C84, mode, r6);
        proc->unk3E = 0;
        proc->unk36 = 0;
        break;

    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
        proc = Proc_Start(ProcScr_EkrBaseKaiten, PROC_TREE_3);
        proc->type = identifier;
        proc->unk29 = 0;
        proc->timer = 0;
        proc->terminator = 0xB;
        proc->x1 = gEkrBmLocation[0] * 0x10 + 8;
        proc->y1 = gEkrBmLocation[1] * 0x10 + 8;
        proc->x2 = 0x48;
        proc->y2 = 0x68;

        if (gEkrInitPosReal == 1)
            proc->x2 -= BanimLeftDefaultPos[gEkrDistanceType];

        if (proc->type == 0)
            anim = AnimCreate(AccessArray(AnimScrs_085B9BE4, mode, r6), 0x64);
        else
            anim = AnimCreate(AccessArray(AnimScrs_085B9C44, mode, r6), 0x64);

        proc->anim = anim;
        anim->oam2Base = 0x4800;
        anim->oamBase |= 0x400;

        if (proc->type == 0)
        {
            anim->xPosition = proc->x1;
            anim->yPosition = proc->y1;
        }
        else
        {
            anim->xPosition = proc->x2;
            anim->yPosition = proc->y2;
        }
        proc->unk60 = AccessArray(gUnknown_085B9CA4, mode, r6);
        proc->unk3E = 0;
        proc->unk36 = 0;

        /* Another proc ? */
        proc = Proc_Start(ProcScr_EkrBaseKaiten, PROC_TREE_3);
        proc->type = identifier;
        proc->unk29 = 1;
        proc->timer = 0;
        proc->terminator = 0xB;
        proc->x1 = gEkrBmLocation[2] * 0x10 + 8;
        proc->y1 = gEkrBmLocation[3] * 0x10 + 8;
        proc->x2 = 0xA8;
        proc->y2 = 0x68;

        if (gEkrInitPosReal == 0)
            proc->x2 = BanimLeftDefaultPos[gEkrDistanceType] + 0xA8;

        if (proc->type == 0)
            anim = AnimCreate(AccessArray(AnimScrs_085B9C04, mode, r6), 0x64);
        else
            anim = AnimCreate(AccessArray(AnimScrs_085B9C64, mode, r6), 0x64);

        proc->anim = anim;
        anim->oam2Base = 0x4800;
        anim->oamBase |= 0x400;

        if (proc->type == 0)
        {
            anim->xPosition = proc->x1;
            anim->yPosition = proc->y1;
        }
        else
        {
            anim->xPosition = proc->x2;
            anim->yPosition = proc->y2;
        }
        proc->unk60 = AccessArray(gUnknown_085B9CC4, mode, r6);
        proc->unk3E = 0;
        proc->unk36 = 0;
        break;

    case EKR_DISTANCE_MONOCOMBAT:
        proc = Proc_Start(ProcScr_EkrBaseKaiten, PROC_TREE_3);
        proc->type = identifier;
        proc->unk29 = 0;
        proc->timer = 0;
        proc->terminator = 0xB;
        proc->x1 = gEkrBmLocation[2] * 0x10 + 8;
        proc->y1 = gEkrBmLocation[3] * 0x10 + 8;
        proc->x2 = 0x78;
        proc->y2 = 0x68;

        if (proc->type == 0)
            anim = AnimCreate(AccessArray(AnimScrs_085B9C04, mode, r6), 0x64);
        else
            anim = AnimCreate(AccessArray(AnimScrs_085B9C64, mode, r6), 0x64);

        proc->anim = anim;
        anim->oam2Base = 0x4800;
        anim->oamBase |= 0x400;

        if (proc->type == 0)
        {
            anim->xPosition = proc->x1;
            anim->yPosition = proc->y1;
        }
        else
        {
            anim->xPosition = proc->x2;
            anim->yPosition = proc->y2;
        }
        proc->unk60 = AccessArray(gUnknown_085B9CC4, mode, r6);
        proc->unk3E = 0;
        proc->unk36 = 0;
        break;

    default:
        break;
    }
}


void EkrBaseKaitenMain(struct ProcEkrBaseKaiten * proc)
{
    struct Anim * anim = proc->anim;

    if (proc->timer >= proc->terminator)
    {
        AnimDelete(anim);
        Proc_Break(proc);
        return;
    }

    if (proc->type == 0)
    {
        anim->xPosition = Interpolate(0, proc->x1, proc->x2, proc->timer, proc->terminator);
        anim->yPosition = Interpolate(0, proc->y1, proc->y2, proc->timer, proc->terminator);
    }
    else
    {
        anim->xPosition = Interpolate(0, proc->x2, proc->x1, proc->timer, proc->terminator);
        anim->yPosition = Interpolate(0, proc->y2, proc->y1, proc->timer, proc->terminator);
    }

    if (proc->timer <= proc->terminator)
        proc->timer++;
}

void NewEkrUnitKakudai(int identifier)
{
    struct ProcUnitKakudai * proc = Proc_Start(ProcScr_ekrUnitKakudai, PROC_TREE_3);

    proc->type = identifier;
    proc->valid_r = 0;
    proc->valid_l = 0;

    switch (gEkrDistanceType)
    {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
    case EKR_DISTANCE_MONOCOMBAT:
        if (gBanimValid[0] == TRUE && CheckInEkrDragon() == 0)
            proc->valid_l = 1;

        if (gBanimValid[1] == TRUE)
            proc->valid_r = 1;
        return;

    case EKR_DISTANCE_PROMOTION:
        if (identifier == 0)
        {
            proc->valid_l = 0;
            proc->valid_r = 1;
        }
        else
        {
            proc->valid_l = 1;
            proc->valid_r = 0;
        }
        break;

    default:
        break;
    }
}

void UnitKakudai1(struct ProcUnitKakudai * proc)
{
    void * ptr;
    int front_mode;
    u8 mode2;

    mode2 = BattleTypeToAnimModeEndOfDodge[gEkrDistanceType];
    front_mode = BanimDefaultModeConfig[mode2 * 4];

    UpdateBanimFrame();

    if (proc->type == 0)
        if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
            EfxPalModifyPetrifyEffect(gPal, 0x17, 1);

    if (gBanimValid[0] == TRUE)
    {
        struct BanimModeData * unk = (void *) (gBanimScrLeft + gpBanimModesLeft[front_mode]);
        const void * src = unk->img;
        proc->pOaml = (void *) gBanimOaml + unk->unk2;
        LZ77UnCompWram(src, gBanimLeftImgSheetBuf);
    }

    if (gBanimValid[1] == TRUE)
    {
        struct BanimModeData * unk = (void *) (gBanimScrRight + gpBanimModesRight[front_mode]);
        const void * src = unk->img;
        proc->pOamr = (void *) gBanimOamr2 + unk->unk2;
        LZ77UnCompWram(src, gBanimRightImgSheetBuf);
    }

    if (gBanimForceUnitChgDebug[0] != NULL)
        LZ77UnCompWram(gBanimForceUnitChgDebug[0], gEkrKakudaiSomeBufLeft);

    if (gBanimForceUnitChgDebug[1] != NULL)
        LZ77UnCompWram(gBanimForceUnitChgDebug[1], gEkrKakudaiSomeBufRight);

    ptr = OBJ_VRAM1;
    RegisterDataMove(gBanimLeftImgSheetBuf, ptr, 0x4000);

    proc->timer = 0;
    proc->terminator = 0xB;

    proc->x1 = gEkrBmLocation[0] * 0x10 + 8;
    proc->y1 = gEkrBmLocation[1] * 0x10 + 8;
    proc->x2 = gEkrBmLocation[2] * 0x10 + 8;
    proc->y2 = gEkrBmLocation[3] * 0x10 + 8;
    proc->left_pos = BanimTypesPosLeft[gEkrDistanceType];
    proc->right_pos = BanimTypesPosRight[gEkrDistanceType];

    if (gEkrInitPosReal == 0)
        proc->right_pos += BanimLeftDefaultPos[gEkrDistanceType];
    else
        proc->left_pos -= BanimLeftDefaultPos[gEkrDistanceType];

    Proc_Break(proc);
}

void UnitKakudai2(struct ProcUnitKakudai * proc)
{
    u16 ret1, x, y;
    struct AnimSpriteData sprite_data[0x40];
    struct Anim _anim;
    struct Anim * anim = &_anim;

    if (proc->timer >= proc->terminator)
    {
        Proc_Break(proc);
        return;
    }

    proc->timer++;

    if (proc->type == 0)
        ret1 = Interpolate(0, 0x250, 0x100, proc->timer, proc->terminator);
    else
        ret1 = Interpolate(0, 0x100, 0x250, proc->timer, proc->terminator);

    if (proc->valid_l == 1)
    {
        BanimUpdateSpriteRotScale(proc->pOaml, sprite_data, ret1, ret1, 0);

        if (proc->type == 0)
        {
            x = Interpolate(0, proc->x1, proc->left_pos, proc->timer, proc->terminator);
            y = Interpolate(0, proc->y1, 0x58, proc->timer, proc->terminator);
        }
        else
        {
            x = Interpolate(0, proc->left_pos, proc->x1, proc->timer, proc->terminator);
            y = Interpolate(0, 0x58, proc->y1, proc->timer, proc->terminator);
        }
        anim->pSpriteData = sprite_data;
        anim->xPosition = x;
        anim->yPosition = y;
        anim->state2 = 0x400;
        anim->oam2Base = 0x7200;
        anim->oamBase = 0;
        AnimDisplay(anim);
    }

    if (proc->valid_r == 1)
    {
        BanimUpdateSpriteRotScale(proc->pOamr, sprite_data, ret1, ret1, 1);

        if (proc->type == 0)
        {
            x = Interpolate(0, proc->x2, proc->right_pos, proc->timer, proc->terminator);
            y = Interpolate(0, proc->y2, 0x58, proc->timer, proc->terminator);
        }
        else
        {
            x = Interpolate(0, proc->right_pos, proc->x2, proc->timer, proc->terminator);
            y = Interpolate(0, 0x58, proc->y2, proc->timer, proc->terminator);
        }
        anim->pSpriteData = sprite_data;
        anim->xPosition = x;
        anim->yPosition = y;
        anim->state2 = 0x400;
        anim->oam2Base = 0x9300;
        anim->oamBase = 0;
        AnimDisplay(anim);
    }
}

void UnitKakudaiEndNop(struct ProcUnitKakudai * proc)
{
    Proc_Break(proc);
}

void NewEkrWindowAppear(int identifier, int duration)
{
    int iy;

    struct ProcEkrIntroWindow * proc = Proc_Start(ProcScr_ekrWindowAppear, PROC_TREE_3);

    proc->type = identifier;
    proc->timer = 0;
    proc->terminator = duration;
    proc->ymax = 0x39;

    if (identifier == 0)
        iy = 0x39;
    else
        iy = 0x00;

    EkrGauge_0804CC78(gEkrBg0QuakeVec.x, (u16) gEkrBg0QuakeVec.y + iy);
    gEkrWindowAppearExist = TRUE;
    EkrGauge_ClrInitFlag();
}

bool CheckEkrWindowAppearUnexist(void)
{
    if (gEkrWindowAppearExist == FALSE)
        return TRUE;

    return FALSE;
}

void EkrWindowAppearMain(struct ProcEkrIntroWindow * proc)
{
    int iy;

    if (proc->timer >= proc->terminator)
    {
        gEkrWindowAppearExist = FALSE;
        EkrGauge_SetInitFlag();
        Proc_Break(proc);
        return;
    }

    proc->timer++;

    if (proc->type == 0)
        iy = Interpolate(1, proc->ymax, 0, proc->timer, proc->terminator);
    else
        iy = Interpolate(4, 0, proc->ymax, proc->timer, proc->terminator);

    EkrGauge_0804CC78(gEkrBg0QuakeVec.x, (u16) gEkrBg0QuakeVec.y + iy);
}

void NewEkrNamewinAppear(int identifier, int duration, int delay)
{
    struct ProcEkrIntroWindow * proc = Proc_Start(ProcScr_ekrNamewinAppear, PROC_TREE_3);

    proc->type = identifier;
    proc->timer = 0;
    proc->terminator = duration;
    proc->ymax = delay;
    proc->ymax_name = -49;

    if (identifier == 0)
        EkrDispUP_SetPositionUnsync(0, proc->ymax_name);
    else
        EkrDispUP_SetPositionUnsync(0, 0);

    gEkrNamewinAppearExist = TRUE;
    UnsyncEkrDispUP();
}

bool CheckEkrNamewinAppearUnexist(void)
{
    if (gEkrNamewinAppearExist == FALSE)
        return TRUE;

    return FALSE;
}

void EkrNamewinAppearDelay(struct ProcEkrIntroWindow * proc)
{
    if (proc->timer == proc->ymax)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void EkrNamewinAppearMain(struct ProcEkrIntroWindow * proc)
{
    int iy;

    if (proc->timer >= proc->terminator)
    {
        gEkrNamewinAppearExist = FALSE;
        SyncEkrDispUP();

        if (proc->type == 2)
            EndEkrDispUP();

        Proc_Break(proc);
        return;
    }

    proc->timer++;

    if (proc->type == 0)
        iy = Interpolate(1, proc->ymax_name, 0, proc->timer, proc->terminator);
    else
        iy = Interpolate(4, 0, proc->ymax_name, proc->timer, proc->terminator);

    EkrDispUP_SetPositionUnsync(0, iy);
}

void NewEkrBaseAppear(int identifier, int duration)
{
    struct ProcEkrIntroWindow * proc = Proc_Start(ProcScr_ekrBaseAppear, PROC_TREE_3);

    proc->type = identifier;
    proc->timer = 0;
    proc->terminator = duration;

    if (identifier == 0)
        SetBgOffset(2, 0, -0x58);
    else
        SetBgOffset(2, 0, 0);

    gProcEkrBaseAppearExist = TRUE;
}

bool CheckEkrBaseAppearUnexist(void)
{
    if (gProcEkrBaseAppearExist == FALSE)
        return TRUE;

    return FALSE;
}

void EkrBaseAppearMain(struct ProcEkrIntroWindow * proc)
{
    int iy;

    if (proc->timer >= proc->terminator)
    {
        gProcEkrBaseAppearExist = FALSE;
        Proc_Break(proc);
        return;
    }

    proc->timer++;

    if (proc->type == 0)
        iy = Interpolate(1, -0x50, 0, proc->timer, proc->terminator);
    else
        iy = Interpolate(4, 0, -0x50, proc->timer, proc->terminator);

    SetBgOffset(2, 0, iy);
}

extern s16 gBanimPositionIsEnemy[2];
extern u16 gBanimIdx_bak[2];
extern s16 gBanimTerrain[2];
extern s16 gBanimFloorfx[2];
extern s16 gEkrSnowWeather;
extern s16 gBanimCon[2];
extern s16 gEkrGaugeHp[2];
extern s16 gBanimMaxHP[2];
extern u8 gEkrPids[2];
extern s16 gEkrGaugeHit[2];
extern s16 gEkrGaugeDmg[2];
extern s16 gEkrGaugeCrt[2];
extern s16 gBanimExpPrevious[2];
extern s16 gBanimExpGain[2];
extern s16 gBanimWtaBonus[2];
extern s16 gBanimEffectiveness[2];
extern s16 gBanimBackgroundIndex;
extern u8 const gUnk_081DA264[];
extern u8 const gUnk_081DA6D8[];
extern u8 const gUnk_081DAB78[];

void SetBanimArenaFlag(int flag);
int GetBattleAnimArenaFlag(void);
int CheckBanimHensei(void);
u8 GetWeaponAnimActorCount(u16 item);
int GetBattleAnimType(void);
void UnsetMapStaffAnim(s16 * out, u16 pos, u16 weapon);
void sub_08064A2C(void);
void ParseBattleHitToBanimCmd(void);

static inline s16 GetBanimAllyPosition(int faction1, int faction2)
{
    int pos = EKR_POS_L;
    if (GetBanimLinkArenaFlag() != true)
    {
        if (0 == (s16)faction1)
            pos = EKR_POS_R;
        else if (2 == (s16)faction1)
            pos = EKR_POS_R;
        else if (1 == (s16)faction1 && 1 == faction2)
            pos = EKR_POS_R;
    }
    return pos;
}

bool PrepareBattleGraphicsMaybe(void)
{
    int animid1, animid2;
    struct BattleUnit * bu1;
    struct BattleUnit * bu2;
    const struct CharacterData * pinfo1;
    const struct CharacterData * pinfo2;
    struct Unit * unit_bu1;
    struct Unit * unit_bu2;
    const void * animdef1;
    const void * animdef2;
    s16 valid_l;
    s16 valid_r;
    int usrdefined_enable;

    int char_cnt = 1;

    ResetEkrDragonStatus();

    if (!(gBattleStats.config & BATTLE_CONFIG_ARENA))
        SetBanimArenaFlag(false);
    else
        SetBanimArenaFlag(true);

    if (!(gBmSt.flags & BM_FLAG_LINKARENA))
        SetBanimLinkArenaFlag(false);
    else
        SetBanimLinkArenaFlag(true);

    if (gBattleStats.config & BATTLE_CONFIG_PROMOTION)
        gEkrDistanceType = EKR_DISTANCE_PROMOTION;
    else
        gEkrDistanceType = EKR_DISTANCE_CLOSE;

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        bu1 = gpEkrBattleUnitLeft = &gBattleActor;
        bu2 = gpEkrBattleUnitRight = &gBattleTarget;

        gBanimPositionIsEnemy[EKR_POS_L] = gBanimPositionIsEnemy[EKR_POS_R] = 0;
        gBanimValid[EKR_POS_R] = gBanimValid[EKR_POS_L] = true;
    }
    else
    {
        u8 i1 = -0x40 & gBattleActor.unit.index;
        u16 faction1 = GetAllegienceId(i1);
        u8 i2 = -0x40 & gBattleTarget.unit.index;
        u16 faction2 = GetAllegienceId(i2);

        if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
            char_cnt = 2;
        else if (gBattleActor.weaponBefore == 0)
            char_cnt = 2;
        else
            char_cnt = GetWeaponAnimActorCount(GetItemIndex(gBattleActor.weaponBefore));

        gBanimValid[EKR_POS_L] = gBanimValid[EKR_POS_R] = true;

        if (EKR_POS_R == GetBanimAllyPosition(faction1, faction2))
        {
            bu1 = gpEkrBattleUnitLeft = &gBattleTarget;
            bu2 = gpEkrBattleUnitRight = &gBattleActor;

            gBanimPositionIsEnemy[EKR_POS_L] = true;
            gBanimPositionIsEnemy[EKR_POS_R] = false;

            if (char_cnt == 1)
                gBanimValid[EKR_POS_L] = false;
        }
        else
        {
            bu1 = gpEkrBattleUnitLeft = &gBattleActor;
            bu2 = gpEkrBattleUnitRight = &gBattleTarget;

            gBanimPositionIsEnemy[EKR_POS_L] = false;
            gBanimPositionIsEnemy[EKR_POS_R] = true;

            if (char_cnt == 1)
                gBanimValid[EKR_POS_R] = false;
        }
    }

    unit_bu1 = &bu1->unit;
    unit_bu2 = &bu2->unit;

    pinfo1 = unit_bu1->pCharacterData;
    pinfo2 = unit_bu2->pCharacterData;

    animdef1 = animdef2 = 0;

    valid_l = gBanimValid[EKR_POS_L];
    valid_r = gBanimValid[EKR_POS_R];

    if (valid_l)
        animdef1 = unit_bu1->pClassData->pBattleAnimDef;

    if (valid_r)
        animdef2 = unit_bu2->pClassData->pBattleAnimDef;

    if (valid_l)
    {
        gEkrBmLocation[0] = (16 * unit_bu1->xPos - gBmSt.camera.x) >> 4;
        gEkrBmLocation[1] = (16 * unit_bu1->yPos - gBmSt.camera.y) >> 4;
    }

    if (valid_r)
    {
        gEkrBmLocation[2] = (16 * unit_bu2->xPos - gBmSt.camera.x) >> 4;
        gEkrBmLocation[3] = (16 * unit_bu2->yPos - gBmSt.camera.y) >> 4;
    }

    if (gEkrDistanceType != EKR_DISTANCE_PROMOTION)
    {
        if (GetItemAttributes(gBattleActor.weaponBefore) & IA_UNCOUNTERABLE)
            gEkrDistanceType = EKR_DISTANCE_FARFAR;
        else
        {
            gEkrDistanceType = EKR_DISTANCE_MONOCOMBAT;

            if (valid_l + valid_r == 2)
            {
                s16 x_distance, y_distance;
                x_distance = gEkrBmLocation[0] - gEkrBmLocation[2] >= 0 ? gEkrBmLocation[0] - gEkrBmLocation[2] : gEkrBmLocation[2] - gEkrBmLocation[0];
                y_distance = gEkrBmLocation[1] - gEkrBmLocation[3] >= 0 ? gEkrBmLocation[1] - gEkrBmLocation[3] : gEkrBmLocation[3] - gEkrBmLocation[1];

                if (x_distance + y_distance <= 1)
                    gEkrDistanceType = EKR_DISTANCE_CLOSE;
                else if (x_distance + y_distance <= 3)
                    gEkrDistanceType = EKR_DISTANCE_FAR;
                else
                    gEkrDistanceType = EKR_DISTANCE_FARFAR;
            }
        }
    }

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        gBanimIdx[EKR_POS_L] = gBanimIdx_bak[EKR_POS_L] = GetBattleAnimationId_WithUnique(unit_bu1, animdef1, bu1->weapon, &animid1);
        gBanimIdx[EKR_POS_R] = gBanimIdx_bak[EKR_POS_R] = GetBattleAnimationId_WithUnique(unit_bu2, animdef2, bu2->weapon, &animid2);
    }
    else
    {
        if (valid_l)
            gBanimIdx[EKR_POS_L] = gBanimIdx_bak[EKR_POS_L] = GetBattleAnimationId_WithUnique(unit_bu1, animdef1, bu1->weaponBefore, &animid1);

        if (valid_r)
            gBanimIdx[EKR_POS_R] = gBanimIdx_bak[EKR_POS_R] = GetBattleAnimationId_WithUnique(unit_bu2, animdef2, bu2->weaponBefore, &animid2);
    }

    if (valid_l)
        gBanimUniquePal[EKR_POS_L] = GetBattleAnimCharacterUniquePalIndex(unit_bu1, animid1);

    if (valid_r)
        gBanimUniquePal[EKR_POS_R] = GetBattleAnimCharacterUniquePalIndex(unit_bu2, animid2);

    if (valid_l)
        gBanimTriAtkPalettes[EKR_POS_L] = FilterBattleAnimCharacterPalette(gBanimIdx[EKR_POS_L], bu1->weaponBefore);

    if (valid_r)
        gBanimTriAtkPalettes[EKR_POS_R] = FilterBattleAnimCharacterPalette(gBanimIdx[EKR_POS_R], bu2->weaponBefore);

    gBanimTerrain[EKR_POS_L] = bu1->terrainId;
    gBanimTerrain[EKR_POS_R] = bu2->terrainId;

    gBanimFloorfx[EKR_POS_R] |= (s16) 0xFFFF;
    gBanimFloorfx[EKR_POS_L] |= (s16) 0xFFFF;

    if (valid_l)
        gBanimFloorfx[EKR_POS_L] = GetBanimTerrainGround(bu1->terrainId, GetChapterInfo(gPlaySt.chapterIndex)->banim_terrain_id);

    if (valid_r)
        gBanimFloorfx[EKR_POS_R] = GetBanimTerrainGround(bu2->terrainId, GetChapterInfo(gPlaySt.chapterIndex)->banim_terrain_id);

    if (gBmSt.flags & BM_FLAG_LINKARENA)
    {
        gBanimTerrain[EKR_POS_R] = gBanimTerrain[EKR_POS_L] = 0x30;

        if (valid_l)
            gBanimFloorfx[EKR_POS_L] = GetBanimTerrainGround(gBanimTerrain[EKR_POS_L], GetChapterInfo(gPlaySt.chapterIndex)->banim_terrain_id);

        if (valid_r)
            gBanimFloorfx[EKR_POS_R] = GetBanimTerrainGround(gBanimTerrain[EKR_POS_R], GetChapterInfo(gPlaySt.chapterIndex)->banim_terrain_id);
    }

    if (CheckBanimHensei() == true)
    {
        gBanimFloorfx[EKR_POS_L] = gBanimFloorfx[EKR_POS_R] = 20;
        gBanimTerrain[EKR_POS_L] = gBanimTerrain[EKR_POS_R] = 0x30;
    }

    switch (gEkrDistanceType)
    {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
    case EKR_DISTANCE_MONOCOMBAT:
        break;

    case EKR_DISTANCE_PROMOTION:
        gBanimFloorfx[EKR_POS_L] = gBanimFloorfx[EKR_POS_R];
        break;
    }

    switch (gPlaySt.chapterWeatherId)
    {
    case 1:
    case 2:
        gEkrSnowWeather = 1;
        break;

    default:
        gEkrSnowWeather = 0;
        break;
    }

    if (valid_l)
        gBanimCon[EKR_POS_L] = unit_bu1->pClassData->baseCon;

    if (valid_r)
        gBanimCon[EKR_POS_R] = unit_bu2->pClassData->baseCon;

    if (valid_l)
    {
        gEkrGaugeHp[EKR_POS_L] = bu1->hpInitial;
        gBanimMaxHP[EKR_POS_L] = unit_bu1->maxHP;
    }

    if (valid_r)
    {
        gEkrGaugeHp[EKR_POS_R] = bu2->hpInitial;
        gBanimMaxHP[EKR_POS_R] = unit_bu2->maxHP;
    }

    ParseBattleHitToBanimCmd();

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        gEkrSpellAnimIndex[EKR_POS_R] = 1;
        gEkrSpellAnimIndex[EKR_POS_L] = 1;
    }
    else
    {
        if (valid_l)
            gEkrSpellAnimIndex[EKR_POS_L] = GetSpellAnimId(unit_bu1->pClassData->number, bu1->weaponBefore);

        if (valid_r)
            gEkrSpellAnimIndex[EKR_POS_R] = GetSpellAnimId(unit_bu2->pClassData->number, bu2->weaponBefore);

        if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
        {
            if (!IsItemDisplayedInBattle(bu2->weaponBefore))
            {
                if (unit_bu2->pClassData->number == 0x41)
                    gEkrSpellAnimIndex[EKR_POS_R] = 0xE;

                if (unit_bu2->pClassData->number == 0x40)
                    gEkrSpellAnimIndex[EKR_POS_R] = 0xF;
            }
        }
    }

    if (valid_l)
        UnsetMapStaffAnim(&gEkrSpellAnimIndex[EKR_POS_L], 0, bu1->weaponBefore);

    if (valid_r)
        UnsetMapStaffAnim(&gEkrSpellAnimIndex[EKR_POS_R], 1, bu2->weaponBefore);

    switch (gEkrDistanceType)
    {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
        if (unit_bu1->pClassData->number == 0x46)
            sub_08064A2C();

        break;

    case EKR_DISTANCE_MONOCOMBAT:
    case EKR_DISTANCE_PROMOTION:
        break;

    default:
        break;
    }

    if (valid_l)
    {
        u8 i1 = -0x40 & unit_bu1->index;
        gBanimFactionPal[EKR_POS_L] = GetAllegienceId(i1);
    }

    if (valid_r)
    {
        u8 i2 = -0x40 & unit_bu2->index;
        gBanimFactionPal[EKR_POS_R] = GetAllegienceId(i2);
    }

    gEkrPids[EKR_POS_R] = 0;
    gEkrPids[EKR_POS_L] = 0;

    if (valid_l)
        gEkrPids[EKR_POS_L] = pinfo1->number;

    if (valid_r)
        gEkrPids[EKR_POS_R] = pinfo2->number;

    if (valid_l)
        gEkrGaugeHit[EKR_POS_L] = bu1->battleEffectiveHitRate;

    if (valid_r)
        gEkrGaugeHit[EKR_POS_R] = bu2->battleEffectiveHitRate;

    if (gEkrGaugeHit[EKR_POS_L] == 0xFF)
        gEkrGaugeHit[EKR_POS_L] = -1;

    if (gEkrGaugeHit[EKR_POS_R] == 0xFF)
        gEkrGaugeHit[EKR_POS_R] = -1;

    if (valid_l)
    {
        gEkrGaugeDmg[EKR_POS_L] = bu1->battleAttack - bu2->battleDefense;
        if (gEkrGaugeDmg[EKR_POS_L] < 0)
            gEkrGaugeDmg[EKR_POS_L] = 0;

        if (bu1->battleAttack == 0xFF)
            gEkrGaugeDmg[EKR_POS_L] = -1;
    }

    if (valid_r)
    {
        gEkrGaugeDmg[EKR_POS_R] = bu2->battleAttack - bu1->battleDefense;
        if (gEkrGaugeDmg[EKR_POS_R] < 0)
            gEkrGaugeDmg[EKR_POS_R] = 0;

        if (bu2->battleAttack == 0xFF)
            gEkrGaugeDmg[EKR_POS_R] = -1;
    }

    if (valid_l)
        gEkrGaugeCrt[EKR_POS_L] = bu1->battleEffectiveCritRate;

    if (valid_r)
        gEkrGaugeCrt[EKR_POS_R] = bu2->battleEffectiveCritRate;

    if (gEkrGaugeCrt[EKR_POS_L] == 0xFF)
        gEkrGaugeCrt[EKR_POS_L] = -1;

    if (gEkrGaugeCrt[EKR_POS_R] == 0xFF)
        gEkrGaugeCrt[EKR_POS_R] = -1;

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        gEkrGaugeHit[EKR_POS_R] |= (s16) 0xFFFF;
        gEkrGaugeDmg[EKR_POS_R] |= (s16) 0xFFFF;
        gEkrGaugeCrt[EKR_POS_R] |= (s16) 0xFFFF;
    }

    if (valid_l)
        gBanimExpPrevious[EKR_POS_L] = bu1->expPrevious;

    if (valid_r)
        gBanimExpPrevious[EKR_POS_R] = bu2->expPrevious;

    if (valid_l)
        gBanimExpGain[EKR_POS_L] = bu1->expGain;

    if (valid_r)
        gBanimExpGain[EKR_POS_R] = bu2->expGain;

    gBanimWtaBonus[EKR_POS_R] = 0;
    gBanimWtaBonus[EKR_POS_L] = 0;

    if (valid_l)
        gBanimWtaBonus[EKR_POS_L] = bu1->wTriangleHitBonus;

    if (valid_r)
        gBanimWtaBonus[EKR_POS_R] = bu2->wTriangleHitBonus;

    gBanimEffectiveness[EKR_POS_R] = 0;
    gBanimEffectiveness[EKR_POS_L] = 0;

    if (valid_l)
        gBanimEffectiveness[EKR_POS_L] = IsItemEffectiveAgainst(bu1->weapon, unit_bu2);

    if (valid_r)
        gBanimEffectiveness[EKR_POS_R] = IsItemEffectiveAgainst(bu2->weapon, unit_bu1);

    gBanimForceUnitChgDebug[EKR_POS_R] = 0;
    gBanimForceUnitChgDebug[EKR_POS_L] = 0;

    if (valid_l)
    {
        switch (GetItemIndex(bu1->weaponBefore))
        {
        case 0x34:
        case 0x35:
        case 0x36:
            switch (unit_bu1->pClassData->number)
            {
            case 0: // no-op case (only affects the switch's decision tree)
                break;

            case 0x19:
                gBanimForceUnitChgDebug[EKR_POS_L] = gUnk_081DA264;
                break;

            case 0x1A:
                gBanimForceUnitChgDebug[EKR_POS_L] = gUnk_081DA6D8;
                break;

            case 0x1B:
                gBanimForceUnitChgDebug[EKR_POS_L] = gUnk_081DAB78;
                break;
            }
            break;
        }
    }

    if (valid_r)
    {
        switch (GetItemIndex(bu2->weaponBefore))
        {
        case 0x34:
        case 0x35:
        case 0x36:
            switch (unit_bu2->pClassData->number)
            {
            case 0: // no-op case (only affects the switch's decision tree)
                break;

            case 0x19:
                gBanimForceUnitChgDebug[EKR_POS_R] = gUnk_081DA264;
                break;

            case 0x1A:
                gBanimForceUnitChgDebug[EKR_POS_R] = gUnk_081DA6D8;
                break;

            case 0x1B:
                gBanimForceUnitChgDebug[EKR_POS_R] = gUnk_081DAB78;
                break;
            }
            break;
        }
    }

    if (GetBanimLinkArenaFlag() == true || gPlaySt.cfgUnitColor == 1)
        gBanimUniquePaletteDisabled[EKR_POS_L] = gBanimUniquePaletteDisabled[EKR_POS_R] = 1;
    else
        gBanimUniquePaletteDisabled[EKR_POS_L] = gBanimUniquePaletteDisabled[EKR_POS_R] = 0;

    gBanimBackgroundIndex = 0;

    if (GetBattleAnimType() == 3)
    {
        if (gBanimValid[EKR_POS_L] != false)
            gBanimBackgroundIndex = GetBanimBackgroundIndex(gBanimTerrain[EKR_POS_L], GetChapterInfo(gPlaySt.chapterIndex)->banim_terrain_id);
        else
            gBanimBackgroundIndex = GetBanimBackgroundIndex(gBanimTerrain[EKR_POS_R], GetChapterInfo(gPlaySt.chapterIndex)->banim_terrain_id);
    }

    if (CheckBanimHensei() == 1)
        gBanimBackgroundIndex = 0x3C;

    usrdefined_enable = false;

    if (GetBattleAnimType() == 0)
        usrdefined_enable = true;

    if (GetBattleAnimType() == 3)
        usrdefined_enable = true;

    if (GetBattleAnimType() == 1)
    {
        if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
            usrdefined_enable = true;

        if (GetBattleAnimArenaFlag() == true)
            usrdefined_enable = true;

        if (unit_bu1->pClassData->number == 0x46)
            usrdefined_enable = true;

        if (CheckBattleScriptted() == true)
            usrdefined_enable = true;
    }

    SetBattleUnscriptted();

    if (gEkrDistanceType != EKR_DISTANCE_PROMOTION)
    {
        if (unit_bu1->state & US_IN_BALLISTA)
            return false;

        if (unit_bu2->state & US_IN_BALLISTA)
            return false;

        if (unit_bu1->pCharacterData->number == 0x28)
            return false;

        if (unit_bu2->pCharacterData->number == 0x28)
            return false;
    }

    if (char_cnt != 1 && unit_bu1->pClassData->number == 0x46)
        return true;

    if (usrdefined_enable == false)
        return false;

    if (gBanimValid[EKR_POS_L] == true)
    {
        if (unit_bu1->statusIndex == 4)
            return false;

        if (gBanimIdx[EKR_POS_L] == -1)
            return false;

        if (gEkrSpellAnimIndex[EKR_POS_L] == -2)
            return false;

        if (gBanimFloorfx[EKR_POS_L] == -1)
            return false;

        if (gBanimTerrain[EKR_POS_L] == 0x1B)
            return false;

        if (gBanimTerrain[EKR_POS_L] == 0x33)
            return false;
    }

    if (gBanimValid[EKR_POS_R] == true)
    {
        if (unit_bu2->statusIndex == 4)
            return false;

        if (gBanimIdx[EKR_POS_R] == -1)
            return false;

        if (gEkrSpellAnimIndex[EKR_POS_R] == -2)
            return false;

        if (gBanimFloorfx[EKR_POS_R] == -1)
            return false;

        if (gBanimTerrain[EKR_POS_R] == 0x1B)
            return false;

        if (gBanimTerrain[EKR_POS_R] == 0x33)
            return false;
    }

    return true;
}

u16 GetBattleAnimationId_WithUnique(struct Unit * unit, const struct BattleAnimDef * pBattleAnimDef, u16 item, int * out)
{
    const struct BattleAnimDef * animDef;
    int i;
    int j;
#if NONMATCHING
    int ret;
#else
    register int ret asm("sl");
#endif
    int idx;
    int found;
    u16 itemType;

    ret = 0;

    if (pBattleAnimDef == NULL || (GetItemType(item) == 9 && !IsItemDisplayedInBattle(item)))
        return -1;

    if (item == 0)
        itemType = 9;
    else
        itemType = GetItemType(item);

    animDef = pBattleAnimDef;

    idx = ((struct CharacterDataBanimView const *) unit->pCharacterData)->banim_unique[(UNIT_CATTRIBUTES(unit) >> 8 & 1)];

    if (idx != 0)
        animDef = gUnitSpecificBanimConfigs[idx];

    *out = 0;
    i = 0;
    found = 0;

    while (i < 2)
    {
        const struct BattleAnimDef * it = animDef;
        do
        {
            for (j = 0; it->wtype != 0; it++, j++)
            {
                if (i == 0 && it->wtype >= 0x100)
                    continue;

                if (i == 1 && it->wtype < 0x100)
                    continue;

                if (it->wtype == GetItemIndex(item) || (it->wtype - 0x100 == itemType))
                {
                    ret = it->index;
                    *out = j;
                    found = 1;
                    break;
                }
            }
        } while (0);

        if (found == 1)
            break;

        i++;
    }

    return (ret - 1);
}
