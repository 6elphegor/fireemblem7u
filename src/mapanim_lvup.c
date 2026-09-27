#include "gbafe.h"

extern u16 const Pal_ManimLevelUpStatGainCycling[];
extern u8 const Img_ManimLevelUpText[];
extern u16 const SpriteAnim_ManimLevelUpText[];
extern struct ProcCmd CONST_DATA ProcScr_ManimLevelUp[];

void StartManimLevelUp(int actor, ProcPtr parent)
{
    struct ManimLevelUpProc * proc;

    proc = Proc_StartBlocking(ProcScr_ManimLevelUp, parent);
    proc->actor = actor;
}

void InitManimLevelUpWindow(void)
{
    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0, 240, 48);
    SetWin0Layers(0, 0, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);
}

void ClearManimLevelUpWindow(void)
{
    SetWinEnable(0, 0, 0);
}

void ManimLevelUp_InitMainScreen(struct ManimLevelUpProc * proc)
{
    int i;

    ResetTextFont();
    TmFill(gBg0Tm, 0);
    PutManimLevelUpFrame(proc->actor, 1, 1);

    for (i = 0; i < 9; i++)
        PutManimLevelUpStat(proc->actor, 1, 1, i, FALSE);

    EnableBgSync(BG0_SYNC_BIT);

    proc->next_stat_num = 0;
    proc->clock = 0;
    proc->y_scroll_offset = -144;

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg3_ct.priority = 2;

    SetBlendNone();
    SetWinEnable(0, 0, 0);

    SetBgOffset(0, 0, proc->y_scroll_offset);
    SetBgOffset(1, 0, proc->y_scroll_offset);

    StartFace(0, gManimSt.actor[proc->actor].unit->pCharacterData->portraitId,
        184, 32 - proc->y_scroll_offset, 0x1042);

    gFaces[0]->y_disp = 32 - proc->y_scroll_offset;

    StartManimLevelUpStatGainLabels(0x200, 3, 1, proc);
}

void ManimLevelUpLabelColor_Init(struct ManimLevelUpLabelColorProc * proc)
{
    proc->clock = 0;
}

void ManimLevelUpLabelColor_Loop(struct ManimLevelUpLabelColorProc * proc)
{
    int color_offset;
    u16 const * colors = Pal_ManimLevelUpStatGainCycling;

    proc->clock++;

    if ((proc->clock & 3) != 0)
        return;

    color_offset = (proc->clock >> 2) & 0xF;

    ApplyPaletteExt(colors + color_offset + 0x00, (0x10 + proc->pal + 0) * 0x20 + 0x12, 0x20 - 0x12);
    ApplyPaletteExt(colors + color_offset + 0x20, (0x10 + proc->pal + 1) * 0x20 + 0x12, 0x20 - 0x12);
}

void ManimLevelUp_ScrollIn(struct ManimLevelUpProc * proc)
{
    proc->y_scroll_offset += 8;

    SetBgOffset(0, 0, proc->y_scroll_offset);
    SetBgOffset(1, 0, proc->y_scroll_offset);

    gFaces[0]->y_disp = 32 - proc->y_scroll_offset;

    if (proc->y_scroll_offset >= -48)
        Proc_Break(proc);
}

void ManimLevelUp_ScrollOut(struct ManimLevelUpProc * proc)
{
    proc->y_scroll_offset -= 8;

    SetBgOffset(0, 0, proc->y_scroll_offset);
    SetBgOffset(1, 0, proc->y_scroll_offset);

    gFaces[0]->y_disp = 32 - proc->y_scroll_offset;

    if (proc->y_scroll_offset <= -144)
        Proc_Break(proc);
}

void ManimLevelUp_PutStatGainLabels(struct ManimLevelUpProc * proc)
{
    int stat_num;

    if (proc->clock != 0)
    {
        proc->clock--;
        return;
    }

    for (stat_num = proc->next_stat_num; stat_num < 9; stat_num++)
    {
        if (GetManimLevelUpStatGain(proc->actor, stat_num) != 0)
            break;
    }

    if (stat_num >= 9)
    {
        Proc_Break(proc);
        return;
    }

    PutManimLevelUpStat(proc->actor, 1, 1, stat_num, TRUE);
    EnableBgSync(BG0_SYNC_BIT);

    StartManimLevelUpStatGainLabelAnim(
        gManimLevelUpLabelInfoList[stat_num].x * 8 + 62,
        gManimLevelUpLabelInfoList[stat_num].y * 8 + 23 - proc->y_scroll_offset,
        stat_num, GetManimLevelUpStatGain(proc->actor, stat_num));

    if (proc->next_stat_num == 0)
    {
        PlaySoundEffect(0x2CD);
    }
    else
    {
        PlaySoundEffect(0x396);
    }

    proc->next_stat_num = stat_num + 1;
    proc->clock = 20;
}

void ManimLevelUp_DimBgm(struct ManimLevelUpProc * proc)
{
    StartBgmVolumeChange(0x100, 0x80, 0x10, proc);
}

void ManimLevelUp_StartLevelUpText(struct ManimLevelUpProc * proc)
{
    int x, y;

    Decompress(Img_ManimLevelUpText, OBJ_VRAM0 + 0x1C0 * 0x20);
    ApplyPalettes(Pal_ManimLevelUpStatGain, 0x10 + 3, 3);

    x = (SCREEN_TILE_X(gManimSt.actor[proc->actor].unit->xPos) << 1) * 8 + 16;
    y = (SCREEN_TILE_Y(gManimSt.actor[proc->actor].unit->yPos) << 1) * 8 - 8;

    if ((SCREEN_TILE_Y(gManimSt.actor[proc->actor].unit->yPos) << 1) < 4)
        y = y + 32;

    if ((SCREEN_TILE_X(gManimSt.actor[proc->actor].unit->xPos) << 1) < 4)
        x = 48;

    if ((SCREEN_TILE_X(gManimSt.actor[proc->actor].unit->xPos) << 1) > 25)
        x = 208;

    StartSpriteAnimProc(SpriteAnim_ManimLevelUpText, x, y, TILEREF(0x1C0, 3), 0, 2);
    PlaySoundEffect(0x37B);
}

void ManimLevelUp_EndLevelUpText(struct ManimLevelUpProc * proc)
{
    EndEachSpriteAnimProc();
}

void ManimLevelUp_RestoreBgm(struct ManimLevelUpProc * proc)
{
    StartBgmVolumeChange(0x80, 0x100, 0x10, proc);
}

void ManimLevelUp_Clear(struct ManimLevelUpProc * proc)
{
    ClearTalk();
}
