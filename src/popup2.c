#include "gbafe.h"

struct Popup2Proc {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x4C - 0x29];
    /* 4C */ u16 timer;
};

extern struct ProcCmd CONST_DATA ProcScr_Popup2[];

void ProcPopup2_Init(struct Popup2Proc * proc)
{
    proc->timer = 0xF0;
}

void ProcPopup2_Loop(struct Popup2Proc * proc)
{
    int timer = --proc->timer;

    if ((timer << 0x10 < 0) || ((A_BUTTON | B_BUTTON) & gpKeySt->pressed))
        Proc_Break(proc);
}

void NewPopup2_PlanA(ProcPtr parent, int IconIndex, char * str)
{
    int len = GetStringTextLen(str);
    int x, x_tile, y_tile;

    if (IconIndex >= 0)
        len += 0x10;

    len += 0x18;

    x_tile = 0xF0 - len;
    if (x_tile < 0)
        x_tile += 0xF;

    x = x_tile >> 4;

    y_tile = len < 0 ? len + 7 : len;

    DrawUiFrame2(x_tile >> 4, 8, y_tile >> 3, 4, 0);

    if (IconIndex >= 0)
    {
        InitIcons();
        ApplyIconPalettes(4);
        PutIcon(gBg0Tm + TM_OFFSET(x + 1, 9), IconIndex, 0x4000);
        x += 2;
    }

    ResetTextFont();
    PutDrawText(NULL, gBg0Tm + TM_OFFSET(x + 1, 9), 0, 0, 0x14, str);
    Proc_StartBlocking(ProcScr_Popup2, parent);
}

void NewPopup2_PlanD(ProcPtr parent, int item, int msg0, int msg1)
{
    int len2, x_tile, y_tile, y;
    char * str;

    register int len1 asm("r1") = 0;
    register int x0 asm("r4") = 0;
    register int x1 asm("r6") = 0;

    struct Text th;

    ResetTextFont();
    InitText(&th, 0x14);

    if (0 != msg0)
    {
        Text_SetColor(&th, 0);
        Text_DrawString(&th, DecodeMsg(msg0));
        Text_Skip(&th, 2);
    }

    Text_SetColor(&th, 2);

    if (0 != msg0)
        str = GetItemNameWithArticle(item, 0);
    else
        str = GetItemNameWithArticle(item, 1);

    Text_DrawString(&th, str);

    len1 = Text_GetCursor(&th) + 7;
    if (len1 < 0)
        len1 += 7;

    x0 = len1 >> 3;

    Text_SetCursor(&th, (x0 + 2) * 8);
    Text_SetColor(&th, 0);

    if (0 != msg1)
        Text_DrawString(&th, DecodeMsg(msg1));

    len2 = Text_GetCursor(&th);
    len2 += 0x18;

    x_tile = 0xF0 - len2;
    if (x_tile < 0)
        x_tile += 0xF;
    x1 = x_tile >> 4;

    y_tile = len2 < 0 ? len2 + 7 : len2;
    y = y_tile >> 3;

    DrawUiFrame2(x1, 8, y, 4, 0);
    PutText(&th, gBg0Tm + TM_OFFSET(x1 + 1, 9));

    x0 += 1;
    PutIcon(gBg0Tm + TM_OFFSET(x1 + x0, 9), GetItemIconId(item), 0x4000);
    Proc_StartBlocking(ProcScr_Popup2, parent);
}

void NewPopup2_DropItem(ProcPtr parent, int item)
{
    NewPopup2_PlanD(parent, item, 0x75E, 0x12B2);
}

void NewPopup2_SendItem(ProcPtr parent, int item)
{
    NewPopup2_PlanD(parent, item, 0x75F, 0x760);
}
