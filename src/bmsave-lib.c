#include "gbafe.h"

void WriteChapterFlags(void * sram_dest)
{
    WriteAndVerifySramFast(sub_08079930(), sram_dest, sub_08079938());
}

void WritePermanentFlags(void * sram_dest)
{
    WriteAndVerifySramFast(GetPermanentFlagBits(), sram_dest, sub_0807992C());
}

void ReadChapterFlags(void const * sram_src)
{
    ReadSramFast(sram_src, sub_08079930(), sub_08079938());
}

void ReadPermanentFlags(void const * sram_src)
{
    ReadSramFast(sram_src, GetPermanentFlagBits(), sub_0807992C());
}

void WriteSupplyItems(void * sram_dest)
{
    WriteAndVerifySramFast(GetConvoyItemArray(), sram_dest, 0xC8);
}

void ReadSupplyItems(void const * sram_src)
{
    ReadSramFast(sram_src, GetConvoyItemArray(), 0xC8);
}

s32 sub_0809E9FC(void)
{
    struct GlobalSaveInfo info;
    int cnt;
    s32 ret = 0;

    if (ReadGlobalSaveInfo(&info))
    {
        cnt = GetGlobalCompletionCntByInfo(&info);
        ret = CheckLinkedToFE6() ? 2 : 0;

        if (info.completed)
        {
            if (info.Eirk_mode_easy || info.Eirk_mode_norm)
                ret = 0xF;

            if (info.Eirk_mode_hard)
                ret |= 0x10;

            if (cnt > 4)
                ret |= 0x10;
        }
    }

    return ret;
}

int sub_0809EA58(void)
{
    struct GlobalSaveInfo info;
    int ret;

    if (!ReadGlobalSaveInfo(&info))
        ret = FALSE;
    else
        ret = info.Eirk_mode_hard;

    return ret;
}

bool sub_0809EA7C(void)
{
    return TRUE;
}
