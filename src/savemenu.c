#include "gbafe.h"

EWRAM_OVERLAY(savemenu) u8 gUnk_Savemenu_02000000 = 0;
EWRAM_OVERLAY(savemenu) u8 gUnk_Savemenu_02000001 = 0;

CONST_DATA u16 BgConfig_SaveMenu[] = {
    0x0000, 0x6000, 0x0000, 
    0xC000, 0x6800, 0x0000, 
    0x8000, 0x7800, 0x0000, 
    0x8000, 0x7800, 0x0000,
};

void SaveMenuOnHBlank(void)
{
    int ret;
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
        vcount = 0;

    if (vcount & 1)
        return;

    if (vcount < gUnk_Savemenu_02000000)
    {
        REG_BLDCNT = 0xC1;

        if (gUnk_Savemenu_02000000 != 0)
            ret = ((gUnk_Savemenu_02000000 - vcount) * 0x10) / gUnk_Savemenu_02000000;
        else
            ret = 0;

        REG_BLDY_16 = ret;
    }
    else
    {
        REG_BLDCNT = 0x144;
        REG_BLDALPHA = 0x1000 | gUnk_Savemenu_02000001;
    }
}

void SaveMenu_HandleExtraMiscOption(struct SaveMenuProc * proc)
{
    Proc_Goto(proc, 0x12);
    StartBgmVolumeChange(0xC0, 0x00, 0x10, NULL);
}

u8 SaveMenuIndexToValidBitfile(u8 byte, int num)
{
    int i, count = 0;

    for (i = 0; i < CHAR_BIT; i++)
    {
        if (((byte >> i) & 1) != 0)
        {
            if (num == count)
                return 1 << i;

            count++;
        }
    }
    return UINT8_MAX;
}

u8 SaveMenuGetBitfileByMask(u8 byte1, u8 byte2)
{
    int i;
    int count = 0;

    for (i = 0; i < CHAR_BIT; i++)
    {
        if (((byte1 >> i) & 1) != 0)
        {
            if (((byte2 >> i) & 1) != 0)
            {
                return count;
            }
            count++;
        }
    }
    return UINT8_MAX;
}

u8 BitfileToIndex(u8 byte)
{
    int i, count = 0;

    for (i = 0; i < CHAR_BIT; i++)
    {
        if (((byte >> i) & 1) != 0)
            return i;
    }

    return UINT8_MAX;
}

void SaveMenu_StartHelpBox(struct SaveMenuProc * proc);
ASM_FUNC("asm/nonmatching/code_080A3404.s");

