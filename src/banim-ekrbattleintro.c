#include "gbafe.h"

struct ProcEkrBaseKaiten {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ STRUCT_PAD(0x30, 0x32);
    /* 32 */ s16 x1;
    /* 34 */ s16 x2;
    /* 36 */ STRUCT_PAD(0x36, 0x3A);
    /* 3A */ s16 y1;
    /* 3C */ s16 y2;
    /* 3E */ STRUCT_PAD(0x3E, 0x44);
    /* 44 */ int type;
    /* 48 */ STRUCT_PAD(0x48, 0x5C);
    /* 5C */ struct Anim * anim;
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

extern struct ProcCmd CONST_DATA ProcScr_ekrUnitKakudai[];
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
u16 IsItemDisplayedInBattle(u16 item);

// view of CharacterData 0x25..0x26 as an array (unit.h declares them as _u25, _u26)
struct CharacterDataBanimView {
    u8 pad[0x25];
    u8 banim_unique[2];
};
extern struct BattleAnimDef const * CONST_DATA gUnitSpecificBanimConfigs[];

ASM_FUNC("asm/nonmatching/code_08051274.s");

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

ASM_FUNC("asm/nonmatching/code_0805175C.s");

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
