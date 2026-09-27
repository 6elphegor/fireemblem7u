#include "gbafe.h"

extern u8 const Img_ManimMiss[];
extern u16 const SpriteAnim_ManimMiss[];
extern u8 const Img_ManimNoDamage[];
extern u16 const SpriteAnim_ManimNoDamage[];
extern u8 const Img_WallBreakAnim[];
extern u16 const Pal_WallBreakAnim[];
extern u16 const Obj_WallBreakAnim[];
extern u8 const Img_ManimPoison[];
extern u16 const Pal_ManimPoison[];
extern u16 const SpriteAnim_ManimPoison[];
extern struct ProcCmd CONST_DATA ProcScr_ManimWallBreak[];
extern struct ProcCmd CONST_DATA ProcScr_ManimPoison[];
extern struct ProcCmd CONST_DATA ProcScr_ManimPoison2[];

void StartManimMissAnim(struct Unit * unit)
{
    Decompress(Img_ManimMiss, OBJ_VRAM0 + 0x3000);

    StartSpriteAnimProc(
        SpriteAnim_ManimMiss,
        (SCREEN_TILE_X(unit->xPos) << 1) * 8 + 8,
        (SCREEN_TILE_Y(unit->yPos) << 1) * 8 + 16,
        TILEREF(0x180, 0), 0, 2);
}

void StartManimNoDamageAnim(struct Unit * unit)
{
    Decompress(Img_ManimNoDamage, OBJ_VRAM0 + 0x3000);

    StartSpriteAnimProc(
        SpriteAnim_ManimNoDamage,
        (SCREEN_TILE_X(unit->xPos) << 1) * 8 + 8,
        (SCREEN_TILE_Y(unit->yPos) << 1) * 8 + 16,
        TILEREF(0x180, 0), 0, 2);
}

void StartManimWallBreakAnim(struct Unit * unit, int arg)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimWallBreak, PROC_TREE_3);

    proc->unit = unit;

    proc->x = (SCREEN_TILE_X(unit->xPos) << 1) * 8 + 8;
    proc->y = (SCREEN_TILE_Y(unit->yPos) << 1) * 8 - 8;

    proc->unk_48 = arg ^ 1;
}

void ManimWallBreakAnim_Init(struct ManimEffectProc * proc)
{
    Decompress(Img_WallBreakAnim, OBJ_VRAM0 + 0x3000);
    ApplyPalette(Pal_WallBreakAnim, 0x10 + 3);

    StartSpriteAnimProc(
        Obj_WallBreakAnim,
        proc->x, proc->y + 16,
        TILEREF(0x180, 3), proc->unk_48, 2);
}

void StartManimPoisonAnim(struct Unit * unit)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimPoison, PROC_TREE_3);

    proc->unit = unit;

    proc->x = ((SCREEN_TILE_X(unit->xPos) << 1) + 1) * 8;
    proc->y = ((SCREEN_TILE_Y(unit->yPos) << 1) + 1) * 8;
}

void ManimPoisonAnim_Init(struct ManimEffectProc * proc)
{
    PlaySeSpacial(0xB7, proc->x);

    Decompress(Img_ManimPoison, OBJ_VRAM0 + 0x3800);
    ApplyPalette(Pal_ManimPoison, 0x10 + 4);

    StartSpriteAnimProc(
        SpriteAnim_ManimPoison,
        proc->x - 8, proc->y + 8,
        TILEREF(0x1C0, 4), 0, 2);
}

void StartManimPoisonAnim2(struct Unit * unit)
{
    struct ManimEffectProc * proc = Proc_Start(ProcScr_ManimPoison2, PROC_TREE_3);

    proc->unit = unit;

    proc->x = ((SCREEN_TILE_X(unit->xPos) << 1) + 1) * 8;
    proc->y = ((SCREEN_TILE_Y(unit->yPos) << 1) + 1) * 8;
}
