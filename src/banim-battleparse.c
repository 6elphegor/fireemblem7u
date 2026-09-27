#include "gbafe.h"

struct SpellAssocEnt {
    /* 00 */ u16 item;
    /* 02 */ u16 unk02;
    /* 04 */ s16 efx;
    /* 06 */ u8 unk06[0x10 - 0x06];
};

extern struct SpellAssocEnt CONST_DATA gSpellAssocData[];

extern s16 gEkrInitialHitSide;

extern CONST_DATA s8 BanimTerrainGroundDefault[];
extern CONST_DATA s8 BanimTerrainGround_Tileset01[];
extern CONST_DATA s8 BanimTerrainGround_Tileset02[];
extern CONST_DATA s8 BanimTerrainGround_Tileset03[];
extern CONST_DATA s8 BanimTerrainGround_Tileset04[];
extern CONST_DATA s8 BanimTerrainGround_Tileset05[];
extern CONST_DATA s8 BanimTerrainGround_Tileset06[];
extern CONST_DATA s8 BanimTerrainGround_Tileset07[];
extern CONST_DATA s8 BanimTerrainGround_Tileset08[];
extern CONST_DATA s8 BanimTerrainGround_Tileset09[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0A[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0B[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0C[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0D[];
extern CONST_DATA s8 BanimTerrainGround_Tileset0E[];

extern CONST_DATA s8 gBanimBGLutDefault[];
extern CONST_DATA s8 gBanimBGLut01[];
extern CONST_DATA s8 gBanimBGLut02[];
extern CONST_DATA s8 gBanimBGLut03[];
extern CONST_DATA s8 gBanimBGLut04[];
extern CONST_DATA s8 gBanimBGLut05[];
extern CONST_DATA s8 gBanimBGLut06[];
extern CONST_DATA s8 gBanimBGLut07[];
extern CONST_DATA s8 gBanimBGLut08[];
extern CONST_DATA s8 gBanimBGLut09[];
extern CONST_DATA s8 gBanimBGLut0A[];
extern CONST_DATA s8 gBanimBGLut0B[];
extern CONST_DATA s8 gBanimBGLut0C[];
extern CONST_DATA s8 gBanimBGLut0D[];
extern CONST_DATA s8 gBanimBGLut0E[];

static inline s8 _GetBanimTerrainGround(u16 terrain, u16 tileset)
{
    switch (tileset)
    {
    case 0x01:
        return BanimTerrainGround_Tileset01[terrain];

    case 0x02:
        return BanimTerrainGround_Tileset02[terrain];

    case 0x03:
        return BanimTerrainGround_Tileset03[terrain];

    case 0x04:
        return BanimTerrainGround_Tileset04[terrain];

    case 0x05:
        return BanimTerrainGround_Tileset05[terrain];

    case 0x06:
        return BanimTerrainGround_Tileset06[terrain];

    case 0x07:
        return BanimTerrainGround_Tileset07[terrain];

    case 0x08:
        return BanimTerrainGround_Tileset08[terrain];

    case 0x09:
        return BanimTerrainGround_Tileset09[terrain];

    case 0x0A:
        return BanimTerrainGround_Tileset0A[terrain];

    case 0x0B:
        return BanimTerrainGround_Tileset0B[terrain];

    case 0x0C:
        return BanimTerrainGround_Tileset0C[terrain];

    case 0x0D:
        return BanimTerrainGround_Tileset0D[terrain];

    case 0x0E:
        return BanimTerrainGround_Tileset0E[terrain];

    case 0:
    default:
        return BanimTerrainGroundDefault[terrain];
    }
}

int GetBanimTerrainGround(u16 terrain, u16 tileset)
{
    int ret = _GetBanimTerrainGround(terrain, tileset);
    return ret - 1;
}

int GetBanimBackgroundIndex(u16 terrain, u16 tileset)
{
    switch (tileset)
    {
    case 0x01:
        return gBanimBGLut01[terrain];

    case 0x02:
        return gBanimBGLut02[terrain];

    case 0x03:
        return gBanimBGLut03[terrain];

    case 0x04:
        return gBanimBGLut04[terrain];

    case 0x05:
        return gBanimBGLut05[terrain];

    case 0x06:
        return gBanimBGLut06[terrain];

    case 0x07:
        return gBanimBGLut07[terrain];

    case 0x08:
        return gBanimBGLut08[terrain];

    case 0x09:
        return gBanimBGLut09[terrain];

    case 0x0A:
        return gBanimBGLut0A[terrain];

    case 0x0B:
        return gBanimBGLut0B[terrain];

    case 0x0C:
        return gBanimBGLut0C[terrain];

    case 0x0D:
        return gBanimBGLut0D[terrain];

    case 0x0E:
        return gBanimBGLut0E[terrain];

    case 0:
    default:
        return gBanimBGLutDefault[terrain];
    }
}

s16 GetSpellAnimId(u16 jid, u16 weapon)
{
    u16 ret;
    u16 item = GetItemIndex(weapon);
    const struct SpellAssocEnt * it;

    for (it = gSpellAssocData; it->item != 0xFFFF; it++)
    {
        if (it->item == item)
            break;
    }

    ret = it->efx;

    if (it->efx == 3)
    {
        switch (jid)
        {
        case 0x28:
        case 0x29:
            ret = 4;
            break;

        case 0x38:
            ret = 5;
            break;

        case 0x07:
            ret = 0xC;
            break;

        case 0x2A:
            ret = 0x6;
            break;

        case 0x2B:
            ret = 0xD;
            break;

        case 0x32:
            ret = 0x7;
            break;

        case 0x33:
            ret = 0x8;
            break;

        case 0x34:
        case 0x35:
            ret = 0x9;
            break;

        case 0x36:
        case 0x37:
            ret = 0xA;
            break;

        case 0x16:
        case 0x17:
            ret = 0xB;
            break;

        default:
            break;
        }
    }

    return ret;
}

void UnsetMapStaffAnim(s16 * out, u16 pos, u16 weapon)
{
    u16 item = GetItemIndex(weapon);

    if (*out == -1)
        *out = 0;

    if (gEkrInitialHitSide == pos)
        return;

    switch (item)
    {
    case ITEM_STAFF_WARP:
    case ITEM_STAFF_RESCUE:
    case ITEM_STAFF_TORCH:
    case ITEM_STAFF_UNLOCK:
        *out = 0;
    }
}

ASM_FUNC("asm/nonmatching/code_08052C9C.s");
