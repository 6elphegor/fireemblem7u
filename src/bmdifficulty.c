#include "gbafe.h"

// FE8U: bmdifficulty.c

int GetCurrentPromotedLevelBonus(void)
{
    if (gPlaySt.chapterStateBits & PLAY_FLAG_HARD)
        return 19;

    return 9;
}

s8 CanUnitSeize(struct Unit * unit)
{
    int lord;
    int mode;

    switch (unit->pCharacterData->number)
    {
    case CHARACTER_LYN_TUTORIAL:
        lord = CHAPTER_MODE_LYN;
        break;

    case CHARACTER_ELIWOOD:
        lord = CHAPTER_MODE_ELIWOOD;
        break;

    case CHARACTER_HECTOR:
        lord = CHAPTER_MODE_HECTOR;
        break;

    default:
        lord = 0;
        break;
    }

    switch (gPlaySt.chapterModeIndex)
    {
    case CHAPTER_MODE_LYN:
        mode = CHAPTER_MODE_LYN;
        break;

    case CHAPTER_MODE_ELIWOOD:
        mode = CHAPTER_MODE_ELIWOOD;
        break;

    case CHAPTER_MODE_HECTOR:
        mode = CHAPTER_MODE_HECTOR;
        break;

    default:
        mode = 4;
        break;
    }

    return lord == mode;
}
