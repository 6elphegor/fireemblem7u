#pragma once

#include "global.h"
#include "proc.h"

// SpellAssoc::facing
enum {
    MA_FACING_OPPONENT,
    MA_FACING_DEFAULT,
    MA_FACING_UNK,
    MA_FACING_STANDING,
};

// SpellAssoc::flash_color
enum {
    SPELL_ASSOC_MCOLOR_NORMAL,
    SPELL_ASSOC_MCOLOR_DARK,
    SPELL_ASSOC_MCOLOR_FIRE,
    SPELL_ASSOC_MCOLOR_ICE,
    SPELL_ASSOC_MCOLOR_WIND,
    SPELL_ASSOC_MCOLOR_LIGHT,
};

struct SpellAssoc {
    /* 00 */ u16 item;
    /* 02 */ u8 count;
    /* 04 */ s16 efx;
    /* 08 */ struct ProcCmd * pcmd_manim;
    /* 0C */ u8 stat;
    /* 0D */ u8 facing;
    /* 0E */ u8 flash_color;
};

#define SPELL_ASSOC_DATA(_item, _count, _efx, _pcmd, _stat, _facing, _color) \
    { .item = (_item), .count = (_count), .efx = (_efx), .pcmd_manim = (_pcmd), \
      .stat = (_stat), .facing = (_facing), .flash_color = (_color) }

extern struct SpellAssoc CONST_DATA gSpellAssocData[];

struct SpellAssoc * GetSpellAssocStructPtr(u16 item);
