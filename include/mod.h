#pragma once

// Mods built into this tree (modern build only: their data is appended after
// the original ROM by mod/layout.txt).  0 builds the unmodified game.

// The flower character (mod/claude; character design by thebes (Theia Vogel))
#define MOD_CLAUDE 1

#if MOD_CLAUDE
#define CHARACTER_FLOWER 0xFE  // after CHARACTER_SNAG
#define CLASS_FLOWER 0x5B      // the unused class slot CLASS_5B
#define FID_FLOWER 0xE5        // after the last portrait
#define SMS_FLOWER 0x4F        // CLASS_5B's standing sprite slot
#define BANIM_FLOWER 0xA3      // banim_data entry, 1-based
#define ITEM_PETAL 0x9F        // after ITEM_PLAY
#define SPELLANIM_PETAL 0x40   // gEkrSpellAnimLut entry
#endif
