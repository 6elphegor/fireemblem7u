#include "gbafe.h"

// Chapter data accessors (FE8U: chapterdata.c)

const struct ChapterInfo * GetChapterInfo(u32 chIndex)
{
    return gChapterDataTable + chIndex;
}

const void * GetChapterMapPointer(u32 chIndex)
{
    return gChapterDataAssetTable[GetChapterInfo(chIndex)->asset_map];
}

const void * GetChapterMapChanges(u32 chIndex)
{
    return gChapterDataAssetTable[GetChapterInfo(chIndex)->asset_map_changes];
}

struct ChapterEventGroup * GetChapterEventInfo(u32 chIndex)
{
    return (struct ChapterEventGroup *) gChapterDataAssetTable[GetChapterInfo(chIndex)->mapEventDataId];
}

const char * GetChapterTitleName(u32 chIndex)
{
    return DecodeMsg((int) &GetChapterInfo(chIndex)->unk74);
}

u8 IsDifficultMode(void)
{
    u8 difficultState = gPlaySt.chapterStateBits & PLAY_FLAG_HARD;
    return difficultState ? TRUE : FALSE;
}
