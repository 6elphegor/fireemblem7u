// The flower character mod (mod/claude; character design by thebes (Theia
// Vogel)).  Placed after the original ROM by mod/layout.txt (make MODERN=1).

#include "gbafe.h"
#include "event_macros.h"

const char gModClaudeSignature[] CONST_DATA = "Flower mod: character design by thebes (Theia Vogel)";

// Chapter 5 (Lyn): the flower walks in from the west edge and joins
// (src/events/ch05.c, EventScr_Ch05_Beginning)
CONST_DATA struct UnitDefinition Units_Ch05_Flower[] = {
    UNIT(CHARACTER_FLOWER, CLASS_FLOWER, CHARACTER_LYN_TUTORIAL, 3, FACTION_ID_BLUE, 0, 0, 5, 2, 5,
         ITEM_ANIMA_FIRE, ITEM_VULNERARY, ITEM_NONE, ITEM_NONE, 0, 0, 0, 0),
    UNIT_END,
};
