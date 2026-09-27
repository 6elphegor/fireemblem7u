#include "gbafe.h"
#include "gbafe/spellassoc.h"

/**
 * Weapon/spell animation association table (fireemblem8u: spellassoc.c)
 */

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
