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

extern struct ProcCmd CONST_DATA ProcScr_EkrBaseKaiten[];
extern struct ProcCmd CONST_DATA ProcScr_ekrUnitKakudai[];
extern const u8 * CONST_DATA Imgs_085B9B84[];
extern const u8 * CONST_DATA Imgs_085B9BA4[];
extern u32 * CONST_DATA AnimScrs_085B9BC4[];
extern u32 * CONST_DATA AnimScrs_085B9BE4[];
extern u32 * CONST_DATA AnimScrs_085B9C04[];
extern u32 * CONST_DATA AnimScrs_085B9C24[];
extern u32 * CONST_DATA AnimScrs_085B9C44[];
extern u32 * CONST_DATA AnimScrs_085B9C64[];
extern const u16 * CONST_DATA gUnknown_085B9C84[];
extern const u16 * CONST_DATA gUnknown_085B9CA4[];
extern const u16 * CONST_DATA gUnknown_085B9CC4[];
extern const u16 Pal_080DC85C[];
extern struct ProcCmd CONST_DATA ProcScr_ekrWindowAppear[];
extern struct ProcCmd CONST_DATA ProcScr_ekrNamewinAppear[];
extern struct ProcCmd CONST_DATA ProcScr_ekrBaseAppear[];

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

ASM_FUNC("asm/nonmatching/code_08051D50.s");

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
