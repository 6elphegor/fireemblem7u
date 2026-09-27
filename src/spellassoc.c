#include "gbafe.h"

/**
 * Weapon/spell animation association table (fireemblem8u: spellassoc.c)
 */

struct SpellAssoc {
    /* 00 */ u16 item;
    /* 02 */ u8 count;
    /* 04 */ s16 efx;
    /* 08 */ struct ProcCmd * pcmd_manim;
    /* 0C */ u8 stat;
    /* 0D */ u8 facing;
    /* 0E */ u8 flash_color;
};

extern struct SpellAssoc gSpellAssocData[];

struct SpellAssoc * GetSpellAssocStructPtr(u16 item)
{
    struct SpellAssoc * it = gSpellAssocData;
    u16 iid = GetItemIndex(item);
    u16 item_;

    item_ = it->item;

    if (item_ != 0xFFFF)
    {
        while (item_ != iid)
        {
            item_ = (++it)->item;
            if (item_ == 0xFFFF)
                break;
        }
    }

    return it;
}

u8 GetWeaponAnimActorCount(u16 item)
{
    return GetSpellAssocStructPtr(item)->count;
}

u16 GetSpellAssocEfxIndex(u16 item)
{
    return GetSpellAssocStructPtr(item)->efx;
}

struct ProcCmd * GetWeaponAnimManimSpecialScr(u16 item)
{
    return GetSpellAssocStructPtr(item)->pcmd_manim;
}

u8 GetSpellAssocReturnBool(u16 item)
{
    return GetSpellAssocStructPtr(item)->stat;
}

u8 GetSpellAssocFacing(u16 item)
{
    return GetSpellAssocStructPtr(item)->facing;
}

u8 GetSpellAssocFlashColor(u16 item)
{
    return GetSpellAssocStructPtr(item)->flash_color;
}
