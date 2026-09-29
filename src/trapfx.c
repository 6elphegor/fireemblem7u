#include "gbafe.h"
#include "gbafe/bmmap.h"

struct TrapfxProc {
    PROC_HEADER;

    /* 2C */ int x, y;
    /* 34 */ u8 _pad_34[0x4A - 0x34];
    /* 4A */ s16 direction;
};
PROC_SIZE_CHECK(struct TrapfxProc);

struct UnkTrapfxProc {
    PROC_HEADER;

    /* 2C */ int x, y;
    /* 34 */ u8 _pad_34[0x58 - 0x34];
    /* 58 */ int direction;
    /* 5C */ int timer;
};
PROC_SIZE_CHECK(struct UnkTrapfxProc);

struct ShowMapChangeProc {
    PROC_HEADER;

    /* 2C */ int mcId;
    /* 30 */ int altSong;
    /* 34 */ int sndx;
};
PROC_SIZE_CHECK(struct ShowMapChangeProc);

void StartMapFade(bool locksGame);

extern u8 CONST_DATA Img_GasTrapVertical[];
extern u16 CONST_DATA SpriteAnim_GasTrapVertical[];
extern u8 CONST_DATA Img_GasTrapHorizontal[];
extern u16 CONST_DATA SpriteAnim_GasTrapHorizontal[];
extern u16 CONST_DATA Pal_GasTrap[];
extern u8 Img_DragonFlameSmallFire[];
extern u16 Pal_DragonFlameSmallFire[];
extern u16 CONST_DATA SpriteAnim_FireTrap[];
extern u16 CONST_DATA Pal_FireTrap2[];
extern u16 CONST_DATA Obj_WallBreakAnim[];
extern u8 CONST_DATA Img_WallBreakAnim[];
extern u16 CONST_DATA Pal_WallBreakAnim[];
extern u8 CONST_DATA Img_ArrowTrap[];
extern u16 CONST_DATA Pal_ArrowTrap[];
extern u16 CONST_DATA SpriteAnim_ArrowTrap[];
extern u8 CONST_DATA Img_PikeTrap[];
extern u16 CONST_DATA Pal_PikeTrap[];
extern u16 CONST_DATA SpriteAnim_PikeTrap[];

#define OBJCHR_TRAPFX 0x240
#define OBJPAL_TRAPFX 2
#define TRAPFX_OAM2 (OBJCHR_TRAPFX | (OBJPAL_TRAPFX << 12) | (1 << 10))

void ArrowTrapSpriteAnim_Init(struct TrapfxProc * proc);
void FireTrapSpriteAnim_Init(struct TrapfxProc * proc);
void GasTrapSpriteAnim_Init(struct TrapfxProc * proc);
void IsMapFadeActive(ProcPtr proc);
void PikeTrapSpriteAnim_Init(struct TrapfxProc * proc);
void ProcShowMapChange_MoveCamera(struct ShowMapChangeProc * proc);
void ProcShowMapChange_UpdateGame(struct ShowMapChangeProc * proc);
void ProcUnkTrapAnimFunc(struct UnkTrapfxProc * proc);

CONST_DATA struct ProcCmd ProcScr_GasTrapAnim[] = {
    PROC_YIELD,
    PROC_CALL(GasTrapSpriteAnim_Init),
    PROC_WHILE(SpriteAnimProcExists),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_FireTrapAnim[] = {
    PROC_YIELD,
    PROC_CALL(FireTrapSpriteAnim_Init),
    PROC_WHILE(SpriteAnimProcExists),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_UnkTrapAnim[] = {
    PROC_YIELD,
    PROC_LABEL(0),
    PROC_CALL(ProcUnkTrapAnimFunc),
    PROC_SLEEP(8),
    PROC_GOTO(0),
    PROC_LABEL(100),
    PROC_WHILE(SpriteAnimProcExists),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_ArrowTrapAnim[] = {
    PROC_YIELD,
    PROC_CALL(ArrowTrapSpriteAnim_Init),
    PROC_WHILE(SpriteAnimProcExists),
    PROC_SLEEP(15),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_ShowMapChangeAnim[] = {
    PROC_YIELD,
    PROC_CALL(ProcShowMapChange_MoveCamera),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(ProcShowMapChange_UpdateGame),
    PROC_WHILE(IsMapFadeActive),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_PikeTrapAnim[] = {
    PROC_YIELD,
    PROC_CALL(PikeTrapSpriteAnim_Init),
    PROC_WHILE(SpriteAnimProcExists),
    PROC_END,
};

void GasTrapSpriteAnim_Init(struct TrapfxProc * proc)
{
    int x, y, oam2;

    const u8 * img = NULL;
    const u16 * anim = NULL;
    int animNum = 0;

    switch (proc->direction)
    {

    case FACING_UP:
        img = Img_GasTrapVertical;
        anim = SpriteAnim_GasTrapVertical;
        break;

    case FACING_DOWN:
        img = Img_GasTrapVertical;
        anim = SpriteAnim_GasTrapVertical;
        animNum = 1;
        break;

    case FACING_LEFT:
        img = Img_GasTrapHorizontal;
        anim = SpriteAnim_GasTrapHorizontal;
        animNum = 1;
        break;

    case FACING_RIGHT:
        img = Img_GasTrapHorizontal;
        anim = SpriteAnim_GasTrapHorizontal;
        break;

    }

    Decompress(img, (void *) ((VRAM + 0x10000) + OBJCHR_TRAPFX * 0x20));
    ApplyPalette(Pal_GasTrap, 0x10 + OBJPAL_TRAPFX);

    x = proc->x * 16 + 8 - gBmSt.camera.x;
    y = proc->y * 16 + 8 - gBmSt.camera.y;
    oam2 = TRAPFX_OAM2;

    StartSpriteAnimProc(anim, x, y, oam2, animNum, 0);
    PlaySeSpacial(0xBA, x + 8);
}

void StartGasTrapAnim(ProcPtr parent, int x, int y, int facing)
{
    struct TrapfxProc * proc = Proc_StartBlocking(ProcScr_GasTrapAnim, parent);

    proc->x = x;
    proc->y = y;
    proc->direction = facing;
}

void FireTrapSpriteAnim_Init(struct TrapfxProc * proc)
{
    int x, y, oam2;

    Decompress(Img_DragonFlameSmallFire, (void *) ((VRAM + 0x10000) + OBJCHR_TRAPFX * 0x20));

    x = proc->x * 16 + 8 - gBmSt.camera.x;
    y = proc->y * 16 + 8 - gBmSt.camera.y;
    oam2 = TRAPFX_OAM2;

    StartSpriteAnimProc(SpriteAnim_FireTrap, x, y, oam2, 0, 0);
    PlaySeSpacial(0xBF, x + 8);
}

void StartFireTrapAnim1(ProcPtr parent, int x, int y)
{
    struct TrapfxProc * proc;

    ApplyPalette(Pal_DragonFlameSmallFire, 0x10 + OBJPAL_TRAPFX);
    proc = Proc_StartBlocking(ProcScr_FireTrapAnim, parent);

    proc->x = x;
    proc->y = y;
}

void StartFireTrapAnim2(ProcPtr parent, int x, int y)
{
    struct TrapfxProc * proc;

    ApplyPalette(Pal_FireTrap2, 0x10 + OBJPAL_TRAPFX);
    proc = Proc_StartBlocking(ProcScr_FireTrapAnim, parent);

    proc->x = x;
    proc->y = y;
}

void ProcUnkTrapAnimFunc(struct UnkTrapfxProc * proc)
{
    int x = (proc->x * 16 + 8 - gBmSt.camera.x) & 0x1FF;
    int y = (proc->y * 16 + 8 - gBmSt.camera.y) & 0x0FF;
    int tileBase = 0x2640;

    StartSpriteAnimProc(Obj_WallBreakAnim, x, y, tileBase, 0, 0);

    if (--proc->timer <= 0)
        Proc_Goto(proc, 0x64);

    switch (proc->direction)
    {
    case FACING_UP:
        proc->y--;
        break;

    case FACING_DOWN:
        proc->y++;
        break;

    case FACING_LEFT:
        proc->x--;
        break;

    case FACING_RIGHT:
        proc->x++;
        break;

    default:
        break;
    }
}

void StartUnkTrapAnim(ProcPtr parent, int x, int y, int direction, int time)
{
    struct UnkTrapfxProc * proc;

    Decompress(Img_WallBreakAnim, (void *) ((VRAM + 0x10000) + OBJCHR_TRAPFX * 0x20));
    ApplyPalette(Pal_WallBreakAnim, 0x10 + OBJPAL_TRAPFX);

    proc = Proc_StartBlocking(ProcScr_UnkTrapAnim, parent);
    proc->direction = direction;
    proc->timer = time;
    proc->x = x;
    proc->y = y;
}

void ArrowTrapSpriteAnim_Init(struct TrapfxProc * proc)
{
    int x, oam2;

    Decompress(Img_ArrowTrap, (void *) ((VRAM + 0x10000) + OBJCHR_TRAPFX * 0x20));
    ApplyPalette(Pal_ArrowTrap, 0x10 + OBJPAL_TRAPFX);

    x = proc->x * 16 + 8 - gBmSt.camera.x;
    oam2 = TRAPFX_OAM2;

    StartSpriteAnimProc(SpriteAnim_ArrowTrap, x, DISPLAY_HEIGHT / 2, oam2, 0, 0);
    PlaySeSpacial(0xBC, x + 8);

    EnsureCameraOntoPosition(proc, proc->x, 31);
}

void StartArrowTrapAnim(ProcPtr parent, int x)
{
    struct UnkTrapfxProc * proc = Proc_StartBlocking(ProcScr_ArrowTrapAnim, parent);
    proc->x = x;
}

void ProcShowMapChange_MoveCamera(struct ShowMapChangeProc * proc)
{
    const struct MapChange * info = GetMapChange(proc->mcId);

    int x = info->xOrigin + info->xSize / 2;
    int y = info->yOrigin + info->ySize / 2;

    EnsureCameraOntoPosition(proc, x, y);

    proc->sndx = x;
}

void ProcShowMapChange_UpdateGame(struct ShowMapChangeProc * proc)
{
    int song;

    RenderMapForFade();

    RefreshAutoWaterShadows();
    RenderMap();

    StartMapFade(FALSE);

    if (proc->altSong)
        song = 0xBE;
    else
        song = 0xBD;

    PlaySeSpacial(song, proc->sndx - gBmSt.camera.x);
}

void StartShowMapChangeAnim(ProcPtr parent, int unused, int trapid)
{
    struct ShowMapChangeProc * proc;
    struct Trap * trap;

    proc = Proc_StartBlocking(ProcScr_ShowMapChangeAnim, parent);

    trap = GetTrap(trapid);
    trap->extra ^= 1;

    if (trap->extra != 0)
        proc->mcId = trap->yPos;
    else
        proc->mcId = trap->xPos;

    proc->altSong = trap->extra;
}

void PikeTrapSpriteAnim_Init(struct TrapfxProc * proc)
{
    int x, y, oam2;

    Decompress(Img_PikeTrap, (void *) ((VRAM + 0x10000) + OBJCHR_TRAPFX * 0x20));
    ApplyPalette(Pal_PikeTrap, 0x10 + OBJPAL_TRAPFX);

    x = proc->x * 16 + 8 - gBmSt.camera.x;
    y = proc->y * 16 + 8 - gBmSt.camera.y;
    oam2 = TRAPFX_OAM2;

    StartSpriteAnimProc(SpriteAnim_PikeTrap, x, y, oam2, proc->direction, 0);
    PlaySeSpacial(0xBB, x + 8);
}

void StartPikeTrapAnim(ProcPtr parent, int x, int y, int facing)
{
    struct TrapfxProc * proc = Proc_StartBlocking(ProcScr_PikeTrapAnim, parent);

    proc->x = x;
    proc->y = y;

    switch (facing)
    {
    case FACING_RIGHT:
        proc->direction = FACING_LEFT;
        break;

    case FACING_LEFT:
        proc->direction = FACING_RIGHT;
        break;

    case FACING_UP:
        proc->direction = FACING_DOWN;
        break;

    default:
        break;
    }
}
