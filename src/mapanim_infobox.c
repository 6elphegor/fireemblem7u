#include "gbafe.h"

// ROM data referenced below, defined in data/ (see tools/datasplit.py)
extern const u8 gUnk_083F424C[];
extern const u8 gUnk_083F4278[];
extern const u8 gUnk_083F42A4[];

// not yet declared in headers
void StartManimFrameGradientScanlineEffect2(u16 y_start, u16 y_end, u16 color_a, u16 color_b);

extern u8 const Img_ManimInfoWindowDigits[];
extern u16 const Pal_ManimInfoWindowDigits[];
extern u8 const Img_ManimInfoWindowFrame[];
extern u8 const Img_ManimInfoWindowHpBar[];
extern u16 const Pal_ManimInfoWindowBlue[];
extern u16 const Pal_ManimInfoWindowRed[];
extern u16 const Pal_ManimInfoWindowGreen[];
extern u16 const Pal_ManimInfoWindowPurple[];

CONST_DATA u16 gManimInfoWindowBarInfo[] = {
    0x04, 0x2A,
    0x09, 0x2F,
    0x09, 0x39,
    0x09, 0x43,
    0x09, 0x4D,
    0x05, 0x57,
    0x00, 0x00,
};

CONST_DATA int gManimInfoWindowBarPalLut[] = {
    5, 6,
};

CONST_DATA u8 const * Tsa_ManimInfoWindowLut[][2] = {
    { (u8 const *) gUnk_083F424C, (u8 const *) gUnk_083F424C },
    { (u8 const *) gUnk_083F424C, (u8 const *) gUnk_083F424C },
    { (u8 const *) gUnk_083F4278, (u8 const *) gUnk_083F42A4 },
};

CONST_DATA struct ProcCmd ProcScr_ManimInfoWindow[] = {
    PROC_SET_END_CB(ManimWindow_Clear),
    PROC_SLEEP(1),
    PROC_CALL(ManimInfoWindow_InitShake),
    PROC_CALL(ManimInfoWindow_Init),
    PROC_REPEAT(ManimInfoWindow_Shake),
    PROC_REPEAT(ManimInfoWindow_UpdateHp),
    PROC_END,
};

void UnpackManimWindowDigits(int chr)
{
    Decompress(Img_ManimInfoWindowDigits, (u8 *)(VRAM) + GetBgChrOffset(0) + ((chr & 0x3FF) << 5));
}

void PutManimWindowNumber(u16 * tm, int num, int tileref, int len, u16 blankref)
{
    char buf[8];
    int i, j;

    for (i = sizeof(buf) - 1; i >= 0; --i)
    {
        buf[i] = '0' + num % 10;
        num = num / 10;

        if (num == 0)
        {
            for (j = i - 1; j >= 0; --j)
                buf[j] = ' ';

            break;
        }
    }

    PutDigits(tm, buf + sizeof(buf) - 1, tileref, len);

    for (i = len - 1; i > 0; --i)
    {
        if (buf[7 - i] != ' ')
            break;

        *(tm - i) = blankref;
    }
}

void UnpackManimWindowGraphics(u8 const * img)
{
    UnpackManimWindowDigits(0x20);
    Decompress(img, (u8 *)(VRAM + 0x20 * 42));
    ApplyPalette(Pal_ManimInfoWindowDigits, 5);
}

void PutManimWindowBarTile(u16 * tm, int * pval, int pal, int max, int base)
{
    int val;

    if (*pval > max)
        val = max;
    else
        val = *pval;

    *tm = TILEREF(base + val, pal);
    *pval += 1 - max;

    if (*pval < 0)
        *pval = 0;
}

void PutManimWindowBar(u16 * tm, int max, int cur, int pal_id, u16 const * info)
{
    int bar, count = 0;
    u16 const * it;

    for (it = info; it[0]; it += 2)
        count -= 1 - it[0];

    count += 1;

    if (max == cur)
        bar = count;
    else
        bar = ((count << 8) / max * cur) >> 8;

    if (bar == 0 && cur > 0)
        bar++;

    for (it = info; it[0]; ++tm, it += 2)
        PutManimWindowBarTile(tm, &bar, gManimInfoWindowBarPalLut[pal_id], it[0], it[1]);
}

void EndManimInfoWindow(void)
{
    Proc_EndEach(ProcScr_ManimInfoWindow);
}

void StartManimInfoWindow(int x, int y, ProcPtr parent)
{
    struct ManimInfoWindowProc * proc = Proc_Start(ProcScr_ManimInfoWindow, PROC_TREE_3);

    proc->x = x;
    proc->y = y;

    proc->parent = parent;
}

void ManimWindow_Clear(ProcPtr proc)
{
    SetOnHBlankA(NULL);
    ClearUi();
}

void ManimInfoWindow_Init(struct ManimInfoWindowProc * proc)
{
    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);

    Decompress(Img_ManimInfoWindowFrame, (void *)(VRAM) + GetBgChrOffset(1) + 0x20);

    UnpackManimWindowGraphics(Img_ManimInfoWindowHpBar);

    switch (gManimSt.main_actor_count)
    {
    case 1:
        PutManimInfoWindow(proc, 0, -5);
        break;

    case 2:
        {
            int first = 0;

            if (gManimSt.actor[0].unit->xPos > gManimSt.actor[1].unit->xPos)
                first = 1;
            else if (UNIT_FACTION(gManimSt.actor[0].unit) > UNIT_FACTION(gManimSt.actor[1].unit))
                first = 1;

            PutManimInfoWindow(proc, first, -10);
            PutManimInfoWindow(proc, 1 - first, 0);
        }
        break;
    }

    InitScanlineEffect();

    StartManimFrameGradientScanlineEffect2(
        gManimSt.actor[0].hp_info_y * 8,
        gManimSt.actor[0].hp_info_y * 8 + 0x20,
        gPal[BGPAL_OFFSET(1) + 1],
        gPal[BGPAL_OFFSET(2) + 1]);
}

void ManimInfoWindow_UpdateHp(struct ManimInfoWindowProc * proc)
{
    int i;
    u16 hp;
    s8 updated = FALSE;

    for (i = 0; i < gManimSt.main_actor_count; ++i)
    {
        hp = gManimSt.actor[i].hp_displayed_q4;

        if (hp > (gManimSt.actor[i].hp_cur << 4))
            hp = hp - 16;

        if (hp < (gManimSt.actor[i].hp_cur << 4))
        {
            hp = hp + 4;

            if (hp % 16 == 0)
                PlaySoundEffect(0x395);
        }

        if (hp != gManimSt.actor[i].hp_displayed_q4)
        {
            gManimSt.actor[i].hp_displayed_q4 = hp;
            PutManimInfoWindowHp(proc, i);
            updated = TRUE;
        }
    }

    if (!updated && gManimSt.hp_bar_busy)
        gManimSt.hp_bar_busy = FALSE;
}

void PutManimInfoWindowHp(struct ManimInfoWindowProc * proc, int actor)
{
    PutManimWindowNumber(
        gBg0Tm + (((gManimSt.actor[actor].hp_info_y + 2) << 5) + (gManimSt.actor[actor].hp_info_x + 2)),
        gManimSt.actor[actor].hp_displayed_q4 / 16,
        TILEREF(0x20, 5), 3, 0);

    PutManimWindowBar(
        gBg0Tm + (((gManimSt.actor[actor].hp_info_y + 2) << 5) + (gManimSt.actor[actor].hp_info_x + 3)),
        gManimSt.actor[actor].hp_max,
        gManimSt.actor[actor].hp_displayed_q4 / 16,
        0, gManimInfoWindowBarInfo);

    EnableBgSync(BG0_SYNC_BIT);
}

u16 const * GetManimInfoWindowPal(struct Unit * unit)
{
    switch (UNIT_FACTION(unit))
    {
    case FACTION_BLUE:
        return Pal_ManimInfoWindowBlue;

    case FACTION_RED:
        return Pal_ManimInfoWindowRed;

    case FACTION_GREEN:
        return Pal_ManimInfoWindowGreen;

    case FACTION_PURPLE:
        return Pal_ManimInfoWindowPurple;
    }

    return NULL;
}

void PutManimInfoWindow(struct ManimInfoWindowProc * proc, int actor, int x_offset)
{
    gManimSt.actor[actor].hp_info_x = proc->x + x_offset;
    gManimSt.actor[actor].hp_info_y = proc->y;

    ApplyPalette(GetManimInfoWindowPal(gManimSt.actor[actor].unit), actor + 1);

    Decompress(Tsa_ManimInfoWindowLut[gManimSt.main_actor_count][actor], gBuf);

    TmApplyTsa_thm(
        gBg1Tm + ((gManimSt.actor[actor].hp_info_y << 5) + gManimSt.actor[actor].hp_info_x),
        gBuf, ((actor + 1) << 12) | 1);

    EnableBgSync(BG1_SYNC_BIT);

    PutStringCentered(
        gBg0Tm + ((gManimSt.actor[actor].hp_info_y << 5) + (gManimSt.actor[actor].hp_info_x + 1)),
        0, 8, DecodeMsg(gManimSt.actor[actor].unit->pCharacterData->nameTextId));

    EnableBgSync(BG0_SYNC_BIT);

    gManimSt.actor[actor].hp_displayed_q4 = (u16)(gManimSt.actor[actor].hp_cur << 4);

    PutManimInfoWindowHp(proc, actor);
}

void ManimInfoWindow_InitShake(struct ManimInfoWindowProc * proc)
{
    proc->clock = 0;

    ManimInfoWindow_Shake(proc);

    SetWinEnable(1, 0, 0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);
}

void ManimInfoWindow_Shake(struct ManimInfoWindowProc * proc)
{
    SetWin0Box(0, (proc->y + 2) * 8 - proc->clock, 240, (proc->y + 2) * 8 + proc->clock);

    proc->clock += 2;

    if (proc->clock > 0x10)
    {
        SetWinEnable(0, 0, 0);
        Proc_Break(proc);
    }
}
