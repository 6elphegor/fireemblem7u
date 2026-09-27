#include "gbafe.h"
#include "gbafe/scanline.h"

// FE7 world map (no FE8 counterpart)

struct WmSt {
    /* 00 */ u8 mode;
    /* 01 */ u8 unk_01;
    /* 02 */ s8 unk_02;
    /* 04 */ s16 x;
    /* 06 */ s16 y;
    /* 08 */ s16 tx;
    /* 0A */ s16 ty;
};

struct WmCanvas {
    /* 000 */ u16 tiles[32][32];
    /* 800 */ u16 nextTile;
    /* 802 */ s16 offX;
    /* 804 */ s16 offY;
};

extern u8 gWmHBlankFlags;
extern u8 gWmHBlankLine;

struct WmFadeProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int timer;
    /* 30 */ int mode;
    /* 34 */ int x;
    /* 38 */ int y;
};

extern struct ProcCmd CONST_DATA ProcScr_WmFade[];

struct WmSpriteAnimsProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 fade;
    /* 2A */ u8 blend;
    /* 2B */ u8 count;
    /* 2C */ u8 timer;
    /* 2E */ u16 chr;
    /* 30 */ struct {
        ProcPtr anim;
        u8 id;
        u16 chr;
    } slots[4];
};

struct WmSpriteAnimEnt {
    /* 00 */ void const * img;
    /* 04 */ u16 const * ap;
    /* 08 */ int animId;
    /* 0C */ u16 size;
    /* 0E */ s16 x;
    /* 10 */ s16 y;
};

extern struct ProcCmd CONST_DATA ProcScr_WmSpriteAnims[];
extern struct WmSpriteAnimEnt const gWmSpriteAnimTable[];

void EndAllWmSpriteAnims(void);

struct WmTextBoxProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 kind;
    /* 2A */ u8 active;
};

struct WmMarkerProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 kind;
    /* 2A */ s16 x;
    /* 2C */ s16 y;
};

struct WmMuMoveProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 facing;
    /* 2A */ u8 count;
    /* 2B */ u8 jid;
    /* 2C */ u8 pal;
    /* 2D */ STRUCT_PAD(0x2D, 0x2E);
    /* 2E */ s16 xs[7];
    /* 3C */ s16 ys[7];
    /* 4A */ s16 curX;
    /* 4C */ s16 curY;
    /* 50 */ u32 pos;
    /* 54 */ u32 flags;
    /* 58 */ struct MuProc * mu;
    /* 5C */ int dist;
    /* 60 */ u8 delay;
    /* 61 */ u8 lastIdx;
    /* 62 */ u8 first;
};

struct WmSlotEnt {
    /* 00 */ s16 x;
    /* 02 */ s16 y;
    /* 04 */ struct ProcSpriteAnim * anim;
    /* 08 */ u8 state;
    /* 09 */ u8 pal;
};

struct WmSlotsProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct WmSlotEnt ent[5];
};

struct WmUnitManagerProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ ProcPtr parent;
    /* 30 */ u16 unk_30;
    /* 34 */ struct WmSlotsProc * slots[4];
    /* 44 */ u8 unk_44;
    /* 45 */ u8 unk_45;
    /* 46 */ u8 unk_46;
    /* 47 */ u8 unk_47;
    /* 48 */ u8 unk_48;
};

extern struct ProcCmd CONST_DATA ProcScr_WmMu[];
extern struct ProcCmd CONST_DATA ProcScr_WmUnitManager[];

struct WorldMapProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ u32 flags;
    /* 30 */ s16 x;
    /* 32 */ s16 y;
    /* 34 */ s16 speed;
    /* 36 */ STRUCT_PAD(0x36, 0x40);
    /* 40 */ u16 unk_40;
    /* 42 */ STRUCT_PAD(0x42, 0x48);
    /* 48 */ u16 unk_48;
    /* 4A */ u8 mode;
    /* 4B */ STRUCT_PAD(0x4B, 0x4C);
    /* 4C */ s16 camX;
    /* 4E */ s16 camY;
    /* 50 */ s16 targetX;
    /* 52 */ s16 targetY;
    /* 54 */ u8 unk_54;
};

struct WmFaceConfig {
    struct FaceVramEnt ent[4];
};

extern struct ProcCmd CONST_DATA ProcScr_WorldMap[];
extern struct WmFaceConfig const gWmFaceConfig;

void InitSpriteTalk(int chr, int lines, int palid);
ProcPtr StartTalkMsg(int x, int y, int id);
void SetTalkPrintDelay(int delay);
void StartWmFade(int mode, int x, int y, ProcPtr parent);

struct WmCmdProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int delay;
    /* 30 */ u8 cmd;
    /* 34 */ int args[5];
};

extern struct ProcCmd CONST_DATA ProcScr_BmFadeIN[];
extern struct ProcCmd CONST_DATA ProcScr_WmCmd[];
extern struct ProcCmd CONST_DATA ProcScr_WmPalFadeOut[];
extern struct ProcCmd CONST_DATA ProcScr_WmPalFadeIn[];
extern u16 Pal_WmMapSprite[];

struct WmSpotlightProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int timer;
    /* 30 */ int x;
    /* 34 */ int y;
};

struct CGDataEnt {
    /* 00 */ u8 isSplit;
    /* 04 */ void const * img;
    /* 08 */ u8 const * tsa;
    /* 0C */ u16 const * pal;
};

struct CGDataEnt const * GetCG(int idx);

extern struct ProcCmd CONST_DATA ProcScr_WmSpotlight[];
extern struct ProcCmd CONST_DATA ProcScr_WorldFlush[];
extern u16 const * CONST_DATA gWmMapTsaTable[][4];
extern u8 const * CONST_DATA gWmMapImgTable[][4];
extern u16 const Pal_Wm_084221D4[];
extern u16 const Pal_Wm_08424CD8[];
extern u16 const Pal_Wm_084225A8[];
extern u8 const Img_Wm_08421C78[];
extern u16 Pal_WmMap[];
extern u16 Pal_WmMapA[];
extern u8 Img_WmMapA[];
extern u8 Tsa_WmMapA[];
extern u16 Pal_WmMapB[];
extern u8 Img_WmMapB[];
extern u8 Tsa_WmMapB[];

struct WmPalFadeProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int timer;
    /* 30 */ int pal;
    /* 34 */ u16 colors[15];
};
extern EventScr const * CONST_DATA gWmEventScripts[];

void sub_08077680(int y);
void sub_0807764C(int x, int y, int r);
void sub_08077860(void);
void sub_08004234(void);
void StartWmSpriteAnim(u32 slot, int id);
void EndWmSpriteAnim(u32 slot);
void StartWmMuMove(int idx, int x, int y, u32 flags);
void sub_080B4D4C(int slot, int fid, u16 flags);
void sub_080B4E88(int slot, u16 flags);
void StartWmPalFadeOut(int a);
void StartWmPalFadeIn(int a);

void EndWmIcon(int idx);
void EndWmIcon2(int idx);

extern u16 CONST_DATA Sprite_WmIcon[];
extern struct ProcCmd CONST_DATA ProcScr_WmSlots[];
extern struct ProcCmd CONST_DATA ProcScr_WmTextBox[];
extern struct ProcCmd CONST_DATA ProcScr_WmMarker[];
extern u16 CONST_DATA Sprite_WmTextBoxA[];
extern u16 CONST_DATA Sprite_WmTextBoxB[];
extern u16 CONST_DATA Sprite_WmMarker[];

void WmMakeGradient(u16 * dstPal, int b, u16 colorA, u16 colorB);
void PutWmSpriteClipped(u8 layer, int x, int y, u16 const * sprite, u16 yOff, u16 xOff, u16 oam2);

extern struct WmSt gWmSt;
extern struct WmCanvas gWmCanvas;

bool IsPointInQuad(int x, int y, int x1, int y1, int x2, int y2, int x3, int y3);
void WmDrawMap(int mode, int x, int y);
void WmRedrawMapAt(int mode, int x, int y);
void WmDrawMapRegion(int x1, int y1, int x2, int y2);
void WmPutMapTile(int x, int y);
void WmCanvas_PutPixel(int x, int y, u8 color);
void WmUpdateCamera(int x, int y);

s8 WmGetUnk02(void)
{
    return gWmSt.unk_02;
}

void WmSetUnk02(s8 value)
{
    gWmSt.unk_02 = value;
}

void WmCanvas_Init(void)
{
    CpuFastFill(-1, gWmCanvas.tiles, sizeof(gWmCanvas.tiles));
    CpuFastFill(0, (void *) (VRAM + 0x1000), 0x5000);

    TmFill(gBg2Tm, 0);

    gWmCanvas.nextTile = 0;
    gWmCanvas.offX = 0;
    gWmCanvas.offY = 0;

    SetBgOffset(2, 0, 0);
    EnableBgSync(BG2_SYNC_BIT);
}

void WmCanvas_Scroll(int dx, int dy)
{
    gWmCanvas.offX += dx;
    gWmCanvas.offY += dy;

    SetBgOffset(2, gWmCanvas.offX, gWmCanvas.offY);
}

void WmCanvas_PutPixel(int x, int y, u8 color)
{
    int tx, ty;
    u16 * tile;
    u32 * p;

    x += gWmCanvas.offX;
    y += gWmCanvas.offY;

    tx = x >> 3;
    ty = y >> 3;

    if ((unsigned) tx > 0x1F || (unsigned) ty > 0x1F)
        return;

    tile = (u16 *) ((u8 *) &gWmCanvas + (tx * 2 + ty * 0x40));

    if (*tile == 0xFFFF)
    {
        *tile = gWmCanvas.nextTile;
        gBg2Tm[ty * 0x20 + tx] = *tile + 0xA080;
        gWmCanvas.nextTile++;
        EnableBgSync(BG2_SYNC_BIT);
    }

    p = (u32 *) (VRAM + 0x1000 + *tile * 0x20);
    p[y & 7] |= (color & 0xF) << ((x & 7) * 4);
}

void WmCanvas_FillQuad(int x0, int y0, int x1, int y1, int x2, int y2, int x3, int y3, u8 color)
{
    int x, y;
    int xmin, xmax, ymin, ymax;

    ymin = y0;
    if (ymin > y1) ymin = y1;
    if (ymin > y2) ymin = y2;
    if (ymin > y3) ymin = y3;

    ymax = y0;
    if (ymax < y1) ymax = y1;
    if (ymax < y2) ymax = y2;
    if (ymax < y3) ymax = y3;

    xmin = x0;
    if (xmin > x1) xmin = x1;
    if (xmin > x2) xmin = x2;
    if (xmin > x3) xmin = x3;

    xmax = x0;
    if (xmax < x1) xmax = x1;
    if (xmax < x2) xmax = x2;
    if (xmax < x3) xmax = x3;

    for (y = ymin; y <= ymax; y++)
    {
        for (x = xmin; x <= xmax; x++)
        {
            if (IsPointInQuad(x, y, x0, y0, x1, y1, x2, y2))
                WmCanvas_PutPixel(x, y, color);
            else if (IsPointInQuad(x, y, x0, y0, x2, y2, x3, y3))
                WmCanvas_PutPixel(x, y, color);
        }
    }
}

void WmSetCamera(u8 mode, int x, int y)
{
    gWmSt.mode = mode;

    if (mode == 1)
    {
        gWmSt.tx = x;
        gWmSt.ty = y;

        if (gWmSt.tx < 0)
            gWmSt.tx = 0;

        if (gWmSt.tx > 0x310)
            gWmSt.tx = 0x310;

        if (gWmSt.ty < 0)
            gWmSt.ty = 0;

        if (gWmSt.ty > 0x210)
            gWmSt.ty = 0x210;

        gWmSt.x = gWmSt.tx;
        gWmSt.y = gWmSt.ty;
    }
    else
    {
        gWmSt.x = 0;
        gWmSt.tx = 0;
        gWmSt.y = 0;
        gWmSt.ty = 0;
    }

    WmDrawMap(gWmSt.mode, gWmSt.x, gWmSt.y);
}

void WmRedrawMap(void)
{
    WmRedrawMapAt(gWmSt.mode, gWmSt.x / 8, gWmSt.y / 8);
}

void WmMoveCamera(int dx, int dy)
{
    if (gWmSt.mode == 1)
    {
        gWmSt.tx += dx;
        gWmSt.ty += dy;

        if (gWmSt.tx < 0)
            gWmSt.tx = 0;

        if (gWmSt.tx > 0x310)
            gWmSt.tx = 0x310;

        if (gWmSt.ty < 0)
            gWmSt.ty = 0;

        if (gWmSt.ty > 0x210)
            gWmSt.ty = 0x210;

        WmCanvas_Scroll(gWmSt.tx - gWmSt.x, gWmSt.ty - gWmSt.y);
    }
}

ASM_FUNC("asm/nonmatching/code_080B3338.s");

int WmGetCameraX(void)
{
    return gWmSt.x;
}

int WmGetCameraY(void)
{
    return gWmSt.y;
}

void sub_080B33D0(int x, int y, int w, int h, u16 oam2)
{
    int i;

    if (w <= 7 || h <= 7)
        return;

    for (i = x + 8; i < x + w - 40; i += 32)
    {
        PutSpriteExt(2, i & 0x1FF, y & 0xFF, Sprite_32x8, oam2 + 0x806);
        PutSpriteExt(2, (i & 0x1FF) + 0x2000, (y + h - 8) & 0xFF, Sprite_32x8, oam2 + 0x806);
    }

    for (; i < x + w - 24; i += 16)
    {
        PutSpriteExt(2, i & 0x1FF, y & 0xFF, Sprite_16x8, oam2 + 0x806);
        PutSpriteExt(2, (i & 0x1FF) + 0x2000, (y + h - 8) & 0xFF, Sprite_16x8, oam2 + 0x806);
    }

    for (; i < x + w - 8; i += 8)
    {
        PutSpriteExt(2, i & 0x1FF, y & 0xFF, Sprite_8x8, oam2 + 0x806);
        PutSpriteExt(2, (i & 0x1FF) + 0x2000, (y + h - 8) & 0xFF, Sprite_8x8, oam2 + 0x806);
    }

    for (i = y + 8; i < y + h - 40; i += 32)
    {
        PutSpriteExt(2, x & 0x1FF, i & 0xFF, Sprite_8x32, oam2 + 0x804);
        PutSpriteExt(2, ((x + w - 8) & 0x1FF) + 0x1000, i & 0xFF, Sprite_8x32, oam2 + 0x804);
    }

    for (; i < y + h - 24; i += 16)
    {
        PutSpriteExt(2, x & 0x1FF, i & 0xFF, Sprite_8x16, oam2 + 0x804);
        PutSpriteExt(2, ((x + w - 8) & 0x1FF) + 0x1000, i & 0xFF, Sprite_8x16, oam2 + 0x804);
    }

    for (; i < y + h - 8; i += 8)
    {
        PutSpriteExt(2, x & 0x1FF, i & 0xFF, Sprite_8x8, oam2 + 0x804);
        PutSpriteExt(2, ((x + w - 8) & 0x1FF) + 0x1000, i & 0xFF, Sprite_8x8, oam2 + 0x804);
    }

    PutSpriteExt(2, x & 0x1FF, y & 0xFF, Sprite_8x8, oam2 + 0x805);
    PutSpriteExt(2, ((x + w - 8) & 0x1FF) + 0x1000, y & 0xFF, Sprite_8x8, oam2 + 0x805);
    PutSpriteExt(2, (x & 0x1FF) + 0x2000, (y + h - 8) & 0xFF, Sprite_8x8, oam2 + 0x805);
    PutSpriteExt(2, ((x + w - 8) & 0x1FF) + 0x3000, (y + h - 8) & 0xFF, Sprite_8x8, oam2 + 0x805);
}
void WmFade_Init(struct WmFadeProc * proc)
{
    WmRedrawMap();

    SetBlendAlpha(0x10, 0);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    proc->timer = 0;
}

void WmFade_SetCamera(struct WmFadeProc * proc)
{
    if (proc->timer == 0)
        WmSetCamera(proc->mode, proc->x, proc->y);

    Proc_Break(proc);
}

void WmFade_Loop(struct WmFadeProc * proc)
{
    int t = ++proc->timer >> 2;

    SetBlendAlpha(0x10 - t, t);

    if (t == 0x10)
    {
        Proc_Break(proc);

        TmFill(GetBgTilemap(2), 0);
        EnableBgSync(BG2_SYNC_BIT);

        SetBlendConfig(0, t, 0, 0);
    }
}

void StartWmFade(int mode, int x, int y, ProcPtr parent)
{
    struct WmFadeProc * proc = Proc_StartBlocking(ProcScr_WmFade, parent);

    proc->x = x;
    proc->y = y;
    proc->mode = mode;
}

void WmHBlankHandler(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > 0xA0)
        vcount = 0;

    if ((vcount & 1) != 0)
        return;

    if (gWmHBlankFlags & 2)
    {
        if (vcount == 0)
            gManimActiveScanlineBuf = gManimScanlineBufs[0];

        REG_WIN0H = gManimActiveScanlineBuf[vcount];
    }

    if (gWmHBlankFlags & 1)
    {
        if (vcount >= gWmHBlankLine && vcount < gWmHBlankLine + 0x28)
        {
            u16 color = (gPal + 0x140)[vcount - gWmHBlankLine];

            *(u16 *) (PLTT + 0x268) = color;
            *(u16 *) (PLTT + 0x248) = color;
        }
    }
}

void WmMakeGradient(u16 * dstPal, int b, u16 colorA, u16 colorB)
{
    int i;

    for (i = 0; i < b; i++)
    {
        int color = (b - i);

        dstPal[i] = (((color * (colorA & 0x1F) + i * (colorB & 0x1F)) / b) & 0x1F) +
            (((color * (colorA & 0x3E0) + i * (colorB & 0x3E0)) / b) & 0x3E0) +
            (((color * (colorA & 0x7C00) + i * (colorB & 0x7C00)) / b) & 0x7C00);
    }
}

void WmSpriteAnims_Init(struct WmSpriteAnimsProc * proc)
{
    int i;

    proc->count = 0;
    proc->timer = 0;
    proc->blend = 0;
    proc->fade = 0;
    proc->chr = 0;

    for (i = 0; i < 4; i++)
        proc->slots[i].anim = NULL;
}

void WmSpriteAnims_Loop(struct WmSpriteAnimsProc * proc)
{
    if (proc->count == 0)
        return;

    if (proc->fade != 0)
    {
        if (proc->blend == 0)
            EndAllWmSpriteAnims();
        else
            proc->blend--;
    }
    else
    {
        u32 t;
        int b;

        if ((++proc->timer >> 3) == 0x10)
            proc->timer = 0;

        t = proc->timer >> 3;

        if ((t & 0xF) > 7)
            b = 10 - (t & 7);
        else
            b = (t & 7) + 2;

        proc->blend = b * 4;
    }

    SetBlendConfig(0, proc->blend >> 2, 0x10, 0);
}

void StartWmSpriteAnim(u32 slot, int id)
{
    int x, y;
    struct WmSpriteAnimsProc * proc = Proc_Find(ProcScr_WmSpriteAnims);

    if (slot > 3 || proc == NULL)
        return;

    if (proc->slots[slot].anim != NULL)
        return;

    Decompress(gWmSpriteAnimTable[id].img, (void *) (0x06010000 | proc->chr));

    x = gWmSpriteAnimTable[id].x - gWmSt.x;
    y = gWmSpriteAnimTable[id].y - gWmSt.y + 0x400;

    proc->slots[slot].anim = StartSpriteAnimProc(gWmSpriteAnimTable[id].ap, x, y,
        (proc->chr >> 5) + 0x9C00, gWmSpriteAnimTable[id].animId, 13);

    proc->slots[slot].chr = proc->chr;
    proc->slots[slot].id = id;
    proc->chr += gWmSpriteAnimTable[id].size;

    if (proc->count == 0)
    {
        SetBlendConfig(0, 0, 0x10, 0);
    }

    proc->count++;

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
}

void EndWmSpriteAnim(u32 slot)
{
    struct WmSpriteAnimsProc * proc = Proc_Find(ProcScr_WmSpriteAnims);

    if (slot > 3 || proc == NULL)
        return;

    if (proc->slots[slot].anim == NULL)
        return;

    EndSpriteAnimProc(proc->slots[slot].anim);
    proc->slots[slot].anim = NULL;

    if (--proc->count == 0)
    {
        proc->chr = 0;
        proc->timer = 0;
    }
    else if (proc->chr == proc->slots[slot].chr + gWmSpriteAnimTable[proc->slots[slot].id].size)
    {
        proc->chr = proc->slots[slot].chr;
    }
}

void EndAllWmSpriteAnims(void)
{
    int i;
    struct WmSpriteAnimsProc * proc = Proc_Find(ProcScr_WmSpriteAnims);

    if (proc == NULL)
        return;

    for (i = 0; i < 4; i++)
    {
        if (proc->slots[i].anim != NULL)
        {
            EndSpriteAnimProc(proc->slots[i].anim);
            proc->slots[i].anim = NULL;
        }
    }

    proc->chr = 0;
    proc->count = 0;
    proc->timer = 0;
    proc->blend = 0;
    proc->fade = 0;
}

void WmMergeMonsters(void)
{
    struct WmSpriteAnimsProc * proc = Proc_Find(ProcScr_WmSpriteAnims);

    if (proc != NULL)
        proc->fade = 1;
}

ProcPtr StartWmSpriteAnims(ProcPtr parent)
{
    return Proc_Start(ProcScr_WmSpriteAnims, parent);
}

void SetWmSpriteAnimPosition(int slot, int x, int y)
{
    struct WmSpriteAnimsProc * proc = Proc_Find(ProcScr_WmSpriteAnims);

    if (proc != NULL)
    {
        struct ProcSpriteAnim * anim = proc->slots[slot].anim;

        if (anim != NULL)
        {
            anim->x = x - gWmSt.x;
            anim->y = y - gWmSt.y;
        }
    }
}

void WmClearTextBoxGfx(void)
{
    int i;

    for (i = 0; i < 4; i++)
        CpuFastFill(0x44444444, (u8 *) (VRAM + 0x14000) + i * 0x400, 0x360);
}

void WmTextBox_Init(struct WmTextBoxProc * proc)
{
    proc->kind = 1;
    proc->active = 0;

    WmClearTextBoxGfx();

    gWmHBlankFlags ^= 1;

    WmMakeGradient(gPal + 0x140, 0x28, 0x44C3, 0x7247);
}

void WmTextBox_Loop(struct WmTextBoxProc * proc)
{
    int y;

    if (proc->active != 0)
    {
        y = 0;

        if (proc->kind == 1)
            y = 0x70;

        PutSpriteExt(2, 0, y, Sprite_WmTextBoxA, 0x3000);
        PutSpriteExt(1, 0, y, Sprite_WmTextBoxB, 0x2000);
    }
}

void OpenWmTextBox(u8 kind)
{
    struct WmTextBoxProc * proc = Proc_Find(ProcScr_WmTextBox);

    if (proc == NULL)
        return;

    WmClearTextBoxGfx();

    if (kind == 0)
        gWmHBlankLine = 4;

    if (kind == 1)
        gWmHBlankLine = 0x74;

    gWmHBlankFlags |= 1;

    proc->kind = kind;
    proc->active = 1;
}

void CloseWmTextBox(void)
{
    struct WmTextBoxProc * proc = Proc_Find(ProcScr_WmTextBox);

    if (proc == NULL)
        return;

    gWmHBlankFlags ^= 1;
    proc->active = 0;
}

ProcPtr StartWmTextBox(ProcPtr parent)
{
    return Proc_Start(ProcScr_WmTextBox, parent);
}

void WmMarker_Loop(struct WmMarkerProc * proc)
{
    PutWmSpriteClipped(0xB, proc->x - gWmSt.x - 4, proc->y - gWmSt.y - 4, Sprite_WmMarker, 0, 0, 0x1000);
}

void StartWmMarker(int x, int y, int kind, ProcPtr parent)
{
    struct WmMarkerProc * proc = Proc_Start(ProcScr_WmMarker, parent);

    proc->x = x;
    proc->y = y;
    proc->kind = kind;
}

void PutWmSpriteClipped(u8 layer, int x, int y, u16 const * sprite, u16 yOff, u16 xOff, u16 oam2)
{
    if (x < -16 || y < -16 || x > 0xEF || y > 0x9F)
        return;

    PutSpriteExt(layer, (x & 0x1FF) + xOff, (y & 0xFF) + yOff, sprite, oam2);
}

void WmMuMove_Init(struct WmMuMoveProc * proc)
{
    proc->count = 0;
    proc->pos = 0;
    proc->delay = 0;
    proc->lastIdx = 0;
    proc->dist = 0;
    proc->first = 1;
}

void WmMuMove_SetFacing(struct WmMuMoveProc * proc, int facing)
{
    if (facing != proc->facing)
    {
        proc->facing = facing;
        SetMuFacing(proc->mu, proc->facing);
    }
}

void WmMuMove_Loop(struct WmMuMoveProc * proc)
{
    int idx = proc->pos >> 20;
    int t = (proc->pos << 12) >> 22;
    int facing;
    int x, y;

    if (proc->count != 0)
    {
    facing = proc->facing;

    if (idx < proc->count - 1)
    {
        if (proc->lastIdx != idx)
            proc->delay = ((proc->flags >> 21) & 3) * 30;

        if (proc->delay != 0)
        {
            proc->delay--;
            x = proc->curX;
            y = proc->curY;
        }
        else
        {
            int x0, x1, x2, x3;
            int y0, y1, y2, y3;
            int dx, dy;
            u16 speed;
            u32 old;
            int step;
            u8 angle;

            x0 = idx > 0 ? proc->xs[idx - 1] : proc->xs[idx];
            x1 = proc->xs[idx];
            x2 = proc->xs[idx + 1];
            x3 = idx < proc->count - 2 ? proc->xs[idx + 2] : x2;

            y0 = idx > 0 ? proc->ys[idx - 1] : proc->ys[idx];
            y1 = proc->ys[idx];
            y2 = proc->ys[idx + 1];
            y3 = idx < proc->count - 2 ? proc->ys[idx + 2] : y2;

            x = sub_080A86A0(x0, x1, x2, x3, t);
            y = sub_080A86A0(y0, y1, y2, y3, t);

            dx = sub_080A8778(x0, x1, x2, x3, t);
            dy = sub_080A8778(y0, y1, y2, y3, t);

            speed = Sqrt(dx * dx + dy * dy);

            old = proc->dist;
            proc->dist += speed;

            if ((proc->flags & 0x1000000) && ((u32) proc->dist >> 12) > (old >> 12))
                StartWmMarker(x, y, 0, proc);

            step = 0x40000 / (speed + 1);

            if (step < 0x200)
                step = 0x200;

            if (proc->flags & 0x1000)
                step <<= 1;

            if (proc->flags & 0x100000)
                step >>= 1;

            proc->pos += step;

            angle = ArcTan2(dx, dy) >> 8;

            if (proc->first)
            {
                if (angle <= 0x20 || angle >= 0xE1)
                    facing = 1;

                if (angle >= 0x21 && angle <= 0x60)
                    facing = 2;

                if (angle >= 0x61 && angle <= 0xA0)
                    facing = 0;

                if (angle >= 0xA1 && angle <= 0xE0)
                    facing = 3;

                proc->first = 0;
            }
            else
            {
                if (angle <= 0x1C || angle >= 0xE5)
                    facing = 1;

                if (angle >= 0x25 && angle <= 0x5C)
                    facing = 2;

                if (angle >= 0x65 && angle <= 0x9C)
                    facing = 0;

                if (angle >= 0xA5 && angle <= 0xDC)
                    facing = 3;
            }

            WmMuMove_SetFacing(proc, facing);

            if (proc->flags & 0x8000)
            {
                int sx = x - gWmSt.x;
                int sy = y - gWmSt.y;
                int ox = proc->curX - gWmSt.x;
                int mx = sx - 8;
                int oy = proc->curY - gWmSt.y;
                int my = sy - 12;
                int cdx = sx - ox;
                int cdy = sy - oy;

                if ((cdx < 0 && mx > 0x70) || (cdx > 0 && mx < 0x80))
                    cdx = 0;

                if ((cdy < 0 && my > 0x40) || (cdy > 0 && my < 0x50))
                    cdy = 0;

                if (cdx != 0 || cdy != 0)
                {
                    WmMoveCamera(cdx, cdy);
                    WmUpdateCamera(-1, -1);
                }
            }

            if (proc->flags & 0x2000000)
                WmSetUnk02(1);
        }
    }
    else
    {
        x = proc->xs[proc->count - 1];
        y = proc->ys[proc->count - 1];

        switch (proc->flags & 0x300)
        {
        case 0x200:
            proc->first = 1;
            WmMuMove_SetFacing(proc, 4);
            break;

        case 0x100:
            ShowMu(proc->mu);
            break;

        case 0:
            proc->first = 1;
            WmMuMove_SetFacing(proc, 0xF);
            break;
        }

        if (proc->flags & 0x2000000)
            WmSetUnk02(0);
    }

    proc->curX = x;
    proc->curY = y;

    SetMuScreenPosition(proc->mu, x - gWmSt.x - 8, y - gWmSt.y - 12);
    ShowMu(proc->mu);
    }
    else
    {
        HideMu(proc->mu);
    }

    proc->lastIdx = idx;
}
void WmMuMove_OnEnd(struct WmMuMoveProc * proc)
{
    if (proc->mu != NULL)
        EndMu(proc->mu);

    if (proc->flags & 0x2000000)
        WmSetUnk02(0);
}

ProcPtr StartWmMu(ProcPtr parent)
{
    return Proc_Start(ProcScr_WmMu, parent);
}

void WmSlots_Init(struct WmSlotsProc * proc)
{
    int i;

    for (i = 0; i < 5; i++)
    {
        proc->ent[i].anim = NULL;
        proc->ent[i].state = 0;
        proc->ent[i].y = 0;
        proc->ent[i].x = 0;
    }
}

void WmUnitManager_Init(struct WmUnitManagerProc * proc)
{
    proc->unk_30 = 0;

    proc->slots[0] = Proc_Start(ProcScr_WmSlots, proc);
    proc->slots[1] = Proc_Start(ProcScr_WmSlots, proc);
    proc->slots[2] = Proc_Start(ProcScr_WmSlots, proc);
    proc->slots[3] = Proc_Start(ProcScr_WmSlots, proc);

    proc->parent = proc->proc_parent;

    proc->unk_44 = 0;
    proc->unk_45 = 0;
    proc->unk_47 = 0;
    proc->unk_48 = 0;
}

void WorldFlushHBlank(void);
void sub_080B43EC(struct WmUnitManagerProc * proc);
void sub_080B4510(struct WmUnitManagerProc * proc);
void sub_080B467C(struct WmUnitManagerProc * proc);
void EndWmMu(int idx);
void WmDimPalette(u16 * dst, u16 * src, u8 coeff);

extern u8 const gWmUnitPalAnimSeq[];
extern u16 const Pal_WmUnitAnimA[];
extern u16 const Pal_WmUnitAnimB[];

void WmSlots_UpdatePosition(int idx, struct WmSlotsProc * proc)
{
    struct ProcSpriteAnim * anim;
    int x, y;

    if (proc->ent[idx].anim != NULL)
    {
        anim = proc->ent[idx].anim;

        x = proc->ent[idx].x - gWmSt.x;
        y = proc->ent[idx].y - gWmSt.y;

        if ((unsigned) (x + 0x1F) <= 0x12E && y > -0x20 && y <= 0xBF)
        {
            anim->x = x & 0x1FF;
            anim->y = y & 0xFF;
        }
        else
        {
            anim->x = 0x100;
            anim->y = 0;
        }
    }
}

void sub_080B43EC(struct WmUnitManagerProc * proc)
{
    int i;
    u16 * flags;
    struct WmSlotsProc * slots = proc->slots[3];

    for (i = 0; i < 4; i++)
    {
        struct FaceProc * face;

        if (slots->ent[i].anim != NULL)
        {
            int x;
            face = (struct FaceProc *) slots->ent[i].anim;
            x = slots->ent[i].x;
            flags = (u16 *) &slots->ent[i].y;

            if ((*flags & 0x800) && (*flags & 0xFF) < 0x10)
            {
                if (*flags & 0x100)
                    face->x_disp = x + (0x10 - (*flags & 0xFF)) * 0x20 * (0x10 - (*flags & 0xFF)) / 0x100;

                if (*flags & 0x200)
                    face->x_disp = x - (0x10 - (*flags & 0xFF)) * 0x20 * (0x10 - (*flags & 0xFF)) / 0x100;

                (*flags)++;
            }

            if ((*flags & 0x1000) && (*flags & 0xFF) < 0x10)
            {
                if (*flags & 0x100)
                {
                    int x2 = x - 0x20;
                    face->x_disp = x2 + (0x10 - (*flags & 0xFF)) * 0x20 * (0x10 - (*flags & 0xFF)) / 0x100;
                }

                if (*flags & 0x200)
                {
                    int x2 = x + 0x20;
                    face->x_disp = x2 - (0x10 - (*flags & 0xFF)) * 0x20 * (0x10 - (*flags & 0xFF)) / 0x100;
                }

                (*flags)++;
            }
        }
    }
}
void sub_080B4510(struct WmUnitManagerProc * proc)
{
    int i;

    SetBlendConfig(0, proc->unk_45 >> 1, 0x10 - (proc->unk_45 >> 1), 0);

    proc->unk_45 += proc->unk_44;

    if (proc->unk_45 == 0)
    {
        for (i = 0; i < 4; i++)
        {
            if (proc->slots[3]->ent[i].anim != NULL && (s8) proc->slots[3]->ent[i].state == -1)
            {
                EndFaceById(i);
                proc->slots[3]->ent[i].state = 0;
                proc->slots[3]->ent[i].anim = NULL;
            }
        }

        proc->unk_44 = 0;
    }

    if (proc->unk_45 == 0x20)
    {
        for (i = 0; i < 4; i++)
        {
            struct FaceProc * face = (struct FaceProc *) proc->slots[3]->ent[i].anim;

            if (face != NULL && proc->slots[3]->ent[i].state == 1)
            {
                SetFaceDisp(face, GetFaceDisp(face) & ~0x400);
                proc->slots[3]->ent[i].state = 0;
            }
        }

        proc->unk_44 = 0;
    }
}
void WmDimPalette(u16 * dst, u16 * src, u8 coeff)
{
    int i;

    for (i = 0; i < 0x10; i++)
    {
        *dst = ((((*src & 0x1F) * coeff) >> 5) & 0x1F) +
            ((((*src & 0x3E0) * coeff) >> 5) & 0x3E0) +
            ((((*src & 0x7C00) * coeff) >> 5) & 0x7C00);
        dst++;
        src++;
    }

    EnablePalSync();
}

void sub_080B467C(struct WmUnitManagerProc * proc)
{
    int i;

    proc->unk_48 += proc->unk_47;

    WmDimPalette(gPal + 0x1A0, gPal + 0x100 + proc->unk_46 * 0x10, proc->unk_48);

    if (proc->unk_48 == 0)
    {
        for (i = 0; i < 4; i++)
        {
            if (proc->slots[0]->ent[i].anim != NULL && (s8) proc->slots[0]->ent[i].state == -1)
                EndWmMu(i);
        }

        proc->unk_47 = 0;
    }

    if (proc->unk_48 == 0x20)
    {
        for (i = 0; i < 4; i++)
        {
            struct WmSlotEnt * ent = &proc->slots[0]->ent[i];

            if (ent->anim != NULL && ent->state == 1)
            {
                ent->state = 0;
                SetMuPal(((struct WmMuMoveProc *) ent->anim)->mu, ent->pal);
            }
        }

        proc->unk_47 = 0;
    }
}
void sub_080B4738(struct WmUnitManagerProc * proc)
{
    u8 seq[0x37];
    int i;
    int pal;

    memcpy(seq, gWmUnitPalAnimSeq, sizeof(seq));

    proc->unk_30++;

    if (seq[proc->unk_30] == 0xFF)
        proc->unk_30 = 0;

    pal = seq[proc->unk_30];
    ApplyPaletteExt(Pal_WmUnitAnimA + pal * 0x10, 0x200, 0x20);
    ApplyPaletteExt(Pal_WmUnitAnimB + pal * 0x10, 0x220, 0x20);

    for (i = 0; i < 4; i++)
        WmSlots_UpdatePosition(i, proc->slots[1]);

    for (i = 0; i < 5; i++)
        WmSlots_UpdatePosition(i, proc->slots[2]);

    sub_080B43EC(proc);

    if ((s8) proc->unk_44 != 0)
        sub_080B4510(proc);

    if ((s8) proc->unk_47 != 0)
        sub_080B467C(proc);
}
void WmUnitManager_EndAll(struct WmUnitManagerProc * proc)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        if (proc->slots[1]->ent[i].anim != NULL)
            EndWmIcon(i);
    }

    for (i = 0; i < 5; i++)
    {
        if (proc->slots[2]->ent[i].anim != NULL)
            EndWmIcon2(i);
    }
}

void WmMu_StartFlash(int idx)
{
    struct WmMuMoveProc * mu;
    struct WmUnitManagerProc * mgr = Proc_Find(ProcScr_WmUnitManager);
    struct WmSlotEnt * ent = &mgr->slots[0]->ent[idx];

    if (mgr == NULL || (mu = (struct WmMuMoveProc *) ent->anim) == NULL)
        return;

    CpuFastFill(0, gPal + 0x1A0, 0x20);
    EnablePalSync();

    SetMuPal(mu->mu, 0xA);

    ent->state = 1;
    mgr->unk_46 = ent->pal;
    mgr->unk_47 = 1;
    mgr->unk_48 = 0;
}

void WmMu_EndFlash(int idx)
{
    struct WmMuMoveProc * mu;
    struct WmUnitManagerProc * mgr = Proc_Find(ProcScr_WmUnitManager);
    struct WmSlotEnt * ent = &mgr->slots[0]->ent[idx];

    if (mgr == NULL || (mu = (struct WmMuMoveProc *) ent->anim) == NULL)
        return;

    CpuFastCopy(gPal + 0x100 + ent->pal * 0x10, gPal + 0x1A0, 0x20);
    EnablePalSync();

    SetMuPal(mu->mu, 0xA);

    ent->state |= 0xFF;
    mgr->unk_46 = ent->pal;
    mgr->unk_47 |= 0xFF;
    mgr->unk_48 = 0x20;
}

void StartWmMuMove(int idx, int x, int y, u32 config)
{
    struct WmMuMoveProc * proc;
    struct WmUnitManagerProc * mgr = Proc_Find(ProcScr_WmUnitManager);
    struct WmSlotEnt * ent = &mgr->slots[0]->ent[idx];

    switch (config & 0xF0000)
    {
    case 0x10000:
        x -= 8;
        y += 8;
        break;

    case 0x20000:
        x += 8;
        y += 8;
        break;

    case 0x30000:
        x -= 8;
        y -= 8;
        break;

    case 0x40000:
        x += 8;
        y -= 8;
        break;

    case 0x50000:
        y -= 14;
        break;

    case 0x60000:
        y += 14;
        break;

    case 0x70000:
        x -= 14;
        break;

    case 0x80000:
        x += 14;
        break;
    }

    if (ent->anim == NULL)
    {
        proc = Proc_Start(ProcScr_WmMu, mgr);
        mgr->slots[0]->ent[idx].anim = (void *) proc;

        proc->mu = StartMuInternal(0, 0, config & 0xFF, 0x280, ((config >> 13) & 3) + 0xC);
        HideMu(proc->mu);

        proc->facing = 2;
        SetMuFacing(proc->mu, 2);
        StartUiStandingMu(proc->mu);

        proc->jid = config;
        proc->pal = ((config >> 13) & 3) + 0xC;

        proc->mu->layer = 0x400;
        proc->mu->sprite_anim->oam2 = proc->mu->config->chr + OAM2_PAL(proc->mu->config->pal) + proc->mu->layer;

        proc->curX = x;
        proc->curY = y;

        ent->pal = proc->pal;
        ent->state = 0;

        WmMu_StartFlash(idx);
    }
    else
    {
        proc = (void *) mgr->slots[0]->ent[idx].anim;
    }

    proc->mu->sprite_anim->layer = ((config >> 10) & 3) + 6;
    proc->flags = config;

    proc->xs[proc->count] = x;
    proc->ys[proc->count] = y;
    proc->count++;
}
void EndWmMu(int idx)
{
    struct WmUnitManagerProc * mgr = Proc_Find(ProcScr_WmUnitManager);

    if (mgr->slots[0]->ent[idx].anim != NULL)
    {
        Proc_End(mgr->slots[0]->ent[idx].anim);
        mgr->slots[0]->ent[idx].anim = NULL;
    }
}

void WmMu_SetLayerA(int idx)
{
    struct WmUnitManagerProc * mgr = Proc_Find(ProcScr_WmUnitManager);

    if (mgr != NULL && mgr->slots[0]->ent[idx].anim != NULL)
        ((struct WmMuMoveProc *) mgr->slots[0]->ent[idx].anim)->mu->sprite_anim->oam2 |= 0x400;
}

void WmMu_SetLayerB(int idx)
{
    struct WmUnitManagerProc * mgr = Proc_Find(ProcScr_WmUnitManager);

    if (mgr != NULL && mgr->slots[0]->ent[idx].anim != NULL)
        ((struct WmMuMoveProc *) mgr->slots[0]->ent[idx].anim)->mu->sprite_anim->oam2 |= 0x400;
}

void StartWmIcon(int idx, u16 x, u16 y, u8 pal)
{
    struct WmUnitManagerProc * mgr = Proc_Find(ProcScr_WmUnitManager);

    mgr->slots[1]->ent[idx].x = x;
    mgr->slots[1]->ent[idx].y = y;

    if (mgr->slots[1]->ent[idx].anim == NULL)
    {
        int ax = (s16) x - gWmSt.x;
        int ay = (s16) y - gWmSt.y;

        mgr->slots[1]->ent[idx].anim = StartSpriteAnimProc(Sprite_WmIcon, ax, ay, ((pal & 0xF) << 12) + 0xE00, 1, 7);
    }
}

void EndWmIcon(int idx)
{
    struct WmUnitManagerProc * mgr = Proc_Find(ProcScr_WmUnitManager);

    if (mgr->slots[1]->ent[idx].anim != NULL)
        EndSpriteAnimProc(mgr->slots[1]->ent[idx].anim);

    mgr->slots[1]->ent[idx].anim = NULL;
}

void StartWmIcon2(int idx, u16 x, u16 y, u8 pal)
{
    struct WmUnitManagerProc * mgr = Proc_Find(ProcScr_WmUnitManager);

    mgr->slots[2]->ent[idx].x = x;
    mgr->slots[2]->ent[idx].y = y;

    if (mgr->slots[2]->ent[idx].anim == NULL)
    {
        int ax = (s16) x - gWmSt.x;
        int ay = (s16) y - gWmSt.y;

        mgr->slots[2]->ent[idx].anim = StartSpriteAnimProc(Sprite_WmIcon, ax, ay, ((pal & 0xF) << 12) + 0xE00, 0, 0xA);

        mgr->slots[1]->ent[idx].x = x;
        mgr->slots[1]->ent[idx].y = y;
    }
}

void EndWmIcon2(int idx)
{
    struct WmUnitManagerProc * mgr = Proc_Find(ProcScr_WmUnitManager);

    if (mgr->slots[2]->ent[idx].anim != NULL)
        EndSpriteAnimProc(mgr->slots[2]->ent[idx].anim);

    mgr->slots[2]->ent[idx].anim = NULL;
}

void sub_080B4D4C(int slot, int fid, u16 flags)
{
    struct WmUnitManagerProc * mgr = Proc_Find(ProcScr_WmUnitManager);
    struct WmSlotEnt * ent = &mgr->slots[3]->ent[slot];

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    if (ent->anim == NULL)
    {
        struct FaceProc * face;
        int disp;
        int x;

        ent->x = flags & 0xFF;
        ent->y = (flags & 0xFF00) + 0x800;

        x = ent->x;
        disp = (flags & 0x400) ? 0x443 : 0x442;

        if (flags & 0x8000)
            disp |= 0x2000;

        face = StartBmFace(slot, fid, x, 0x28, disp);
        ent->anim = (struct ProcSpriteAnim *) face;

        if ((flags & 0x6000) == 0x6000)
            face->sprite_layer = 6;
        else if (flags & 0x4000)
            face->sprite_layer = 5;
        else if (flags & 0x2000)
            face->sprite_layer = 4;
        else
            face->sprite_layer = 3;

        SetFaceBlinkControlById(slot, 5);

        ent->state = 1;
        mgr->unk_44 = 2;

        if (mgr->unk_45 == 0x20)
        {
            mgr->unk_45 = 0;
            SetBlendConfig(1, mgr->unk_45, 0x10 - mgr->unk_45, 0);
        }
    }
}
void sub_080B4E88(int slot, u16 flags)
{
    struct WmUnitManagerProc * mgr = Proc_Find(ProcScr_WmUnitManager);
    struct WmSlotEnt * ent = &mgr->slots[3]->ent[slot];

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    if (ent->anim != NULL && !(ent->y & 0x1000))
    {
        SetFaceDisp((struct FaceProc *) ent->anim, GetFaceDisp((struct FaceProc *) ent->anim) | 0x400);

        ent->y = (flags & 0xFF00) + 0x1000;
        ent->state = 0xFF;

        mgr->unk_44 = 0xFE;

        if (mgr->unk_45 == 0)
        {
            mgr->unk_45 = 0x20;
            SetBlendConfig(0, mgr->unk_45 >> 1, 0x10 - (mgr->unk_45 >> 1), 0);
        }
    }
}
ProcPtr StartWmUnitManager(ProcPtr parent)
{
    return Proc_Start(ProcScr_WmUnitManager, parent);
}

void EndWmUnitManager(void)
{
    Proc_EndEach(ProcScr_WmUnitManager);
}

void nullsub_5(void)
{
}

void nullsub_6(void)
{
}

void sub_080B4F70(void)
{
}

void sub_080B4F74(void)
{
}

void WmStartFadeCamera(int x, int y, int mode)
{
    ProcPtr proc = Proc_Find(ProcScr_WorldMap);
    StartWmFade(mode, x, y, proc);
}

void WmStartScrollCamera(int x, int y, int speed)
{
    struct WorldMapProc * proc = Proc_Find(ProcScr_WorldMap);

    if (proc != NULL)
    {
        proc->camX = WmGetCameraX();
        proc->camY = WmGetCameraY();
        proc->targetX = x;
        proc->targetY = y;
        proc->speed = speed;

        Proc_Goto(proc, 2);
    }
}

void WmStartTalk(int msg)
{
    EndTalk();
    InitSpriteTalk(0x200, 2, 2);
    StartTalkMsg(1, (gWmHBlankLine >> 3) + 1, msg);
    SetTalkPrintDelay(4);
    SetTalkFlag(0x20);
    SetTalkFlag(0x80);
    SetTalkFlag(4);
    SetTalkFlag(1);
}

void WorldMap_Init(void)
{
    struct WmFaceConfig config = gWmFaceConfig;

    InitBgs(NULL);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 3;
    gDispIo.bg3_ct.priority = 3;

    UnpackUiWindowFrameGraphics();
    ResetText();
    InitFaces();
    SetFaceConfig(config.ent);

    ResetUnitSprites();
    MU_Init();
    ApplyUnitSpritePalettes();

    gBmSt.camera.x = 0;
    gBmSt.camera.y = 0;

    SetDispEnable(0, 0, 0, 0, 0);
}

void WorldMap_InitDisplay(struct WorldMapProc * proc)
{
    proc->unk_40 = 0;
    proc->unk_48 = 0;
    proc->unk_54 = 0;

    gDispIo.disp_ct.bg0_enable = 0;
    gDispIo.disp_ct.bg1_enable = 0;
    gDispIo.disp_ct.bg2_enable = 1;
    gDispIo.disp_ct.bg3_enable = 0;
    gDispIo.disp_ct.obj_enable = 1;

    WmSetCamera(proc->mode, proc->x, proc->y);

    SetBlendNone();

    ApplyPaletteExt(Pal_Wm_084221D4, 0x260, 0x20);
    ApplyPaletteExt(Pal_Wm_08424CD8, 0x200, 0x20);
    ApplyPaletteExt(Pal_MiscUiGraphics, 0x360, 0x20);
    ApplyPaletteExt(Pal_Wm_084225A8, 0x320, 0x20);
    Decompress(Img_Wm_08421C78, (void *) (VRAM + 0x15000));

    SetWinEnable(0, 0, 0);
    SetWOutLayers(1, 1, 1, 1, 1);
    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.win1_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 1;

    SetBlankBgColor(0, 0, 0);

    SetBlendConfig(0, 0, 0, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);

    gWmHBlankFlags = 0;

    SetOnHBlankA(NULL);
    SetOnHBlankA(WmHBlankHandler);

    StartWmSpriteAnims(proc);
    StartWmTextBox(proc);
    StartWmUnitManager(proc);

    if (proc->flags & 4)
    {
        if (proc->flags & 0x40)
            NewFadeIn(1, NULL);
        else
            NewFadeIn(2, NULL);
    }

    WmSetUnk02(0);
}
void WorldMap_OnEnd(struct WorldMapProc * proc)
{
    SetOnHBlankB(NULL);
    SetOnHBlankA(NULL);

    EndTalk();
    ClearTalkText();
    ResetUnitSprites();

    SetBlendDarken(0x10);

    proc->unk_54 = 0;
}

void sub_080B52CC(void)
{
}

void WorldMap_InitOpenEffect(struct WorldMapProc * proc)
{
    if (proc->flags & 8)
    {
        InitScanlineEffect();
        SetOnHBlankB(sub_08077860);
        sub_08077680(0);

        SetBlendAlpha(0x10, 0x10);
        SetBlendTargetA(0, 0, 0, 1, 0);
        SetBlendTargetB(0, 0, 0, 0, 0);

        gDispIo.blend_ct.target1_enable_bd = 1;
        gDispIo.blend_ct.target2_enable_bd = 1;
    }
}

void WorldMap_LoopOpenEffect(struct WorldMapProc * proc)
{
    int max = 0x30;
    int t;

    if (proc->flags & 0x20)
        proc->unk_48 += 2;
    else
        proc->unk_48 += 1;

    if (proc->flags & 0x40)
        t = proc->unk_48 >> 1;
    else
        t = proc->unk_48;

    if (proc->flags & 8)
        sub_08077680(0x70 - (max - t) * 0x70 * (max - t) / (max * max));

    if (t == max)
    {
        Proc_Break(proc);

        if (proc->flags & 8)
        {
            SetOnHBlankB(NULL);

            SetBlendConfig(0, 0, 0, 0);
            SetBlendTargetA(0, 0, 0, 0, 0);
            SetBlendTargetB(0, 0, 1, 0, 0);

            gDispIo.blend_ct.target1_enable_bd = 0;
            gDispIo.blend_ct.target2_enable_bd = 0;
        }
    }
}

void WorldMap_InitScrollCamera(struct WorldMapProc * proc)
{
    proc->unk_40 = 0;
    proc->unk_54 = 1;
}

#if NONMATCHING
void WorldMap_LoopScrollCamera(struct WorldMapProc * proc)
{
    int camX = WmGetCameraX();
    int camY = WmGetCameraY();
    int x = camX;
    int y = camY;

    while ((s16) proc->unk_40 < 0x100 && x == camX && y == camY)
    {
        int t, d;

        proc->unk_40 += proc->speed;

        t = 0x100 - (s16) proc->unk_40;
        d = ABS(proc->targetX - proc->camX);
        x = d - d * t * t / 0x10000;

        t = 0x100 - (s16) proc->unk_40;
        d = ABS(proc->targetY - proc->camY);
        y = d - d * t * t / 0x10000;
    }

    if (proc->targetX > proc->camX)
        x = proc->camX + x;
    else
        x = proc->camX - x;

    if (proc->targetY > proc->camY)
        y = proc->camY + y;
    else
        y = proc->camY - y;

    WmMoveCamera(x - camX, y - camY);
    WmUpdateCamera(-1, -1);

    if (proc->unk_40 == 0x100)
    {
        Proc_Break(proc);
        proc->unk_54 = 0;
    }
}
#else
ASM_FUNC("asm/nonmatching/code_080B5430.s");
#endif
void StartWorldMap(u8 mode, int x, int y, u32 flags)
{
    struct WorldMapProc * proc = Proc_Start(ProcScr_WorldMap, PROC_TREE_3);

    proc->mode = mode;
    proc->x = x;
    proc->y = y;
    proc->flags = flags;
}

void EndWM(void)
{
    Proc_End(Proc_Find(ProcScr_BmFadeIN));
    Proc_End(Proc_Find(ProcScr_WorldMap));

    ClearTalk();
    EndEachSpriteAnimProc();
    InitBgs(NULL);
}

void WorldMap_StartBgm(u32 flags)
{
    if (flags & 0x10)
        StartBgm(GetChapterInfo(gPlaySt.chapterIndex)->song_prologue_lyn, NULL);
}

void WorldMap_StartEvent(void)
{
    if (gWmEventScripts[GetChapterInfo(gPlaySt.chapterIndex)->gmapEventId] != NULL)
        StartEvent(gWmEventScripts[GetChapterInfo(gPlaySt.chapterIndex)->gmapEventId]);
}

void WorldMap_FadeBgm(void)
{
    FadeBgmOut(4);
}

void WorldMap_EndEvent(void)
{
    sub_08004234();
    EndWmUnitManager();
    WmSetUnk02(0);
}

bool IsWorldMapActive(void)
{
    return Proc_Find(ProcScr_WorldMap) ? TRUE : FALSE;
}

void WmCmd_Loop(struct WmCmdProc * proc)
{
    if (proc->delay > 0)
    {
        proc->delay--;
        return;
    }

    switch (proc->cmd)
    {
    case 0:
        StartWmMuMove(proc->args[0], proc->args[1], proc->args[2], proc->args[4]);
        break;

    case 1:
        EndWmMu(proc->args[0]);
        break;

    case 2:
        StartWmSpriteAnim(proc->args[0], proc->args[3]);
        break;

    case 3:
        EndWmSpriteAnim(proc->args[0]);
        break;

    case 4:
        ((void (*)(int, s16, s16, u8)) StartWmIcon)(proc->args[0], proc->args[1], proc->args[2], proc->args[4]);
        break;

    case 5:
        ((void (*)(int, s16, s16, u8)) StartWmIcon2)(proc->args[0], proc->args[1], proc->args[2], proc->args[4]);
        break;

    case 6:
        sub_080B4D4C(proc->args[0], proc->args[3], proc->args[4]);
        break;

    case 7:
        sub_080B4E88(proc->args[0], proc->args[4]);
        break;

    case 8:
        WmStartScrollCamera(proc->args[1], proc->args[2], proc->args[4]);
        break;

    case 10:
        StartWmPalFadeOut(proc->args[4]);
        break;

    case 9:
        StartWmPalFadeIn(proc->args[4]);
        break;

    case 12:
        WmMu_EndFlash(proc->args[4]);
        break;

    case 11:
        WmMu_StartFlash(proc->args[4]);
        break;
    }

    Proc_Break(proc);
}

void WmMergeFace(int delay, u8 cmd, int a0, int a3, int a1, int a2, int a4)
{
    ProcPtr parent = Proc_Find(ProcScr_WorldMap);
    struct WmCmdProc * proc = Proc_Start(ProcScr_WmCmd, parent);

    proc->delay = delay;
    proc->cmd = cmd;
    proc->args[0] = a0;
    proc->args[3] = a3;
    proc->args[1] = a1;
    proc->args[2] = a2;
    proc->args[4] = a4;
}

void WmPalFade_LoopOut(struct WmPalFadeProc * proc)
{
    int i;

    u16 * palIt = &PAL_COLOR(proc->pal, 1);
    u16 * it = proc->colors;

    proc->timer++;

    for (i = 1; i < 0x10; i++)
    {
        *palIt = ((((*it & 0x1f) * (0x20 - proc->timer)) >> 5) & 0x1f) +
            ((((0x20 - proc->timer) * (*it & 0x3e0)) >> 5) & 0x3e0) +
            ((((0x20 - proc->timer) * (*it & 0x7c00)) >> 5) & 0x7c00);
        it++;
        palIt++;
    }

    EnablePalSync();

    if (proc->timer == 0x20)
        Proc_Break(proc);
}

void StartWmPalFadeOut(int color)
{
    int i;

    ProcPtr parent = Proc_Find(ProcScr_WorldMap);
    struct WmPalFadeProc * proc = Proc_Start(ProcScr_WmPalFadeOut, parent);

    proc->pal = color & 0x1f;
    proc->timer = 0;

    ApplyPalettes(Pal_WmMapSprite, 0x1C, 4);

    for (i = 1; i < 0x10; i++)
        proc->colors[i - 1] = PAL_COLOR(color & 0x1f, i);
}

void WmPalFade_LoopIn(struct WmPalFadeProc * proc)
{
    int i;

    u16 * palIt = &PAL_COLOR(proc->pal, 1);
    u16 * it = proc->colors;

    proc->timer++;

    for (i = 1; i < 0x10; i++)
    {
        *palIt = ((((*it & 0x1f) * proc->timer) >> 5) & 0x1f) + (((proc->timer * (*it & 0x3e0)) >> 5) & 0x3e0) +
            (((proc->timer * (*it & 0x7c00)) >> 5) & 0x7c00);
        it++;
        palIt++;
    }

    EnablePalSync();

    if (proc->timer == 0x20)
        Proc_Break(proc);
}

void StartWmPalFadeIn(int color)
{
    int i;

    ProcPtr parent = Proc_Find(ProcScr_WorldMap);
    struct WmPalFadeProc * proc = Proc_Start(ProcScr_WmPalFadeIn, parent);

    proc->pal = color & 0x1f;
    proc->timer = 0;

    ApplyPalettes(Pal_WmMapSprite, 0x1C, 4);

    for (i = 1; i < 0x10; i++)
        proc->colors[i - 1] = PAL_COLOR(color & 0x1f, i);
}

void WmSpotlight_Init(struct WmSpotlightProc * proc)
{
    proc->timer = 0;

    InitScanlineEffect();

    SetBlendTargetA(1, 1, 1, 1, 0);

    SetWin0Box(0, 0, 240, 160);
    SetWinEnable(1, 0, 0);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;

    SetBlendConfig(2, 0, 0, 0);

    sub_0807744C();

    gWmHBlankFlags |= 2;
}
#if NONMATCHING
void WmSpotlight_Loop(struct WmSpotlightProc * proc)
{
    int max = 60;
    int k = 0x18;
    int r, c;

    proc->timer++;
    r = k * proc->timer * proc->timer / (max * max);
    c = 0x10 - 0x10 * proc->timer * proc->timer / (max * max);

    sub_0807764C(proc->x - gWmSt.x, proc->y - (gWmSt.y + 1), r);

    SetBlendConfig(2, 0, 0, c);

    if (proc->timer >= max)
        proc->timer = 0;
}
#else
ASM_FUNC("asm/nonmatching/code_080B5A84.s");
#endif

void WmEndSpotlight(void)
{
    gWmHBlankFlags &= ~2;

    SetBlendConfig(0, 0, 0, 0);
    SetWinEnable(0, 0, 0);
}

void StartWmSpotlight(int x, int y)
{
    struct WmSpotlightProc * proc = Proc_Start(ProcScr_WmSpotlight, Proc_Find(ProcScr_WorldMap));

    proc->x = x;
    proc->y = y;
}

void EndWmSpotlightProc(void)
{
    Proc_End(Proc_Find(ProcScr_WmSpotlight));
}

inline u8 const * GetWmMapImgPtr(int x, int y)
{
    u8 const * img = gWmMapImgTable[y >> 5][x >> 5];

    return img + (((y & 0x1F) << 5) + (x & 0x1F)) * 0x20;
}

inline u16 const * GetWmMapTsaPtr(int x, int y)
{
    u16 const * tsa = gWmMapTsaTable[y >> 5][x >> 5];

    tsa += (0x1F - (y & 0x1F)) * 0x20 + 1;
    return tsa + (x & 0x1F);
}


#if NONMATCHING
// differs only by a reserved (unused) 4-byte stack slot in the original
void WmPutMapTile(int x, int y)
{
    if (x < 0 || y < 0 || x > 127 || y > 85)
        return;

    gBg3Tm[(y & 0x1F) * 0x20 + (x & 0x1F)] = *GetWmMapTsaPtr(x, y);
    CpuFastSet(GetWmMapImgPtr(x, y), (void *) (VRAM + 0x8000 + ((y & 0x1F) * 0x20 + (x & 0x1F)) * 0x20), 8);
    EnableBgSync(BG3_SYNC_BIT);
}
#else
ASM_FUNC("asm/nonmatching/code_080B5B80.s");
#endif

void WmDrawMapRegion(int x1, int y1, int x2, int y2)
{
    int ix, iy;

    if (x1 < 0 && y1 < 0)
    {
        for (iy = 0; iy <= 20; iy++)
            for (ix = 0; ix <= 30; ix++)
                WmPutMapTile(x2 + ix, y2 + iy);
    }
    else if (y2 < y1)
    {
        for (iy = y2; iy < y1; iy++)
            for (ix = 0; ix <= 30; ix++)
                WmPutMapTile(x2 + ix, iy);

        for (iy = y1; iy < y2 + 21; iy++)
            for (ix = x2; ix < x1; ix++)
                WmPutMapTile(ix, iy);

        for (iy = y1; iy < y2 + 21; iy++)
            for (ix = x1 + 31; ix < x2 + 31; ix++)
                WmPutMapTile(ix, iy);
    }
    else
    {
        for (iy = y1 + 21; iy < y2 + 21; iy++)
            for (ix = 0; ix <= 30; ix++)
                WmPutMapTile(x2 + ix, iy);

        for (iy = y2; iy < y1 + 21; iy++)
            for (ix = x2; ix < x1; ix++)
                WmPutMapTile(ix, iy);

        for (iy = y2; iy < y1 + 21; iy++)
            for (ix = x1 + 31; ix < x2 + 31; ix++)
                WmPutMapTile(ix, iy);
    }
}
void WmDrawCgMap(int idx)
{
    int i;
    struct CGDataEnt const * cg = GetCG(idx);

    ApplyPalettes(cg->pal, 0, 8);
    SetBgOffset(3, 0, 0);

    for (i = 0; i < 10; i++)
        Decompress(((u8 const * const *) cg->img)[i], (void *) (VRAM + 0x8000 + i * 0x800));

    TmApplyTsa_thm(gBg3Tm, cg->tsa, 0);
    EnableBgSync(BG3_SYNC_BIT);
}

void WmDrawMap(int mode, int x, int y)
{
    switch (mode)
    {
    case 1:
        ApplyPalettes(Pal_WmMap, 0, 4);
        SetBgOffset(3, x & 0xFF, y & 0xFF);
        WmDrawMapRegion(-1, -1, x / 8, y / 8);
        break;

    case 0:
        ApplyPalettes(Pal_WmMapA, 0, 4);
        SetBgOffset(3, 0, 0);
        Decompress(Img_WmMapA, (void *) (VRAM + 0x8000));
        TmApplyTsa_thm(gBg3Tm, Tsa_WmMapA, 0);
        EnableBgSync(BG3_SYNC_BIT);
        break;

    case 2:
        ApplyPalettes(Pal_WmMapB, 0, 4);
        SetBgOffset(3, 0, 0);
        Decompress(Img_WmMapB, (void *) (VRAM + 0x8000));
        TmApplyTsa_thm(gBg3Tm, Tsa_WmMapB, 0);
        EnableBgSync(BG3_SYNC_BIT);
        break;

    default:
        WmDrawCgMap(mode - 3);
        break;
    }
}

ASM_FUNC("asm/nonmatching/code_080B5E80.s");
s8 GetWorldMapUnk54(void)
{
    struct WorldMapProc * proc = Proc_Find(ProcScr_WorldMap);

    if (proc != NULL)
        return proc->unk_54;

    return 0;
}

void WorldFlushHBlank(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > 0xA0)
        vcount = 0;

    if ((vcount & 1) != 0)
        return;

    if (gWmHBlankFlags & 2)
    {
        if (vcount == 0)
            gManimActiveScanlineBuf = gManimScanlineBufs[0];

        REG_WIN0H = gManimActiveScanlineBuf[vcount];
    }
}

void WorldFlush_Prepare(struct WmSpotlightProc * proc)
{
    ClearTalk();

    ApplyPalettes(Pal_WmMapA, 0, 4);
    SetBgOffset(3, 0, 0);
    Decompress(Img_WmMapA, (void *) (VRAM + 0x8000));
    TmApplyTsa_thm(gBg3Tm, Tsa_WmMapA, 0);
    EnableBgSync(BG3_SYNC_BIT);

    proc->x = 0xB4;
    proc->y = 0x60;
}

ASM_FUNC("asm/nonmatching/code_080B608C.s");
void WorldFlushOut(struct WmSpotlightProc * proc)
{
    int max = 64;
    int k = 300;
    int r, c;

    proc->timer++;
    r = k * proc->timer * proc->timer / (max * max);
    c = 8 - 8 * (max - proc->timer) * (max - proc->timer) / (max * max);

    sub_0807764C(proc->x, proc->y, r);

    SetBlendConfig(2, 0, 0, c + 8);

    if (proc->timer >= max)
        Proc_Break(proc);
}

void WorldFlush_End(void)
{
    EndEachSpriteAnimProc();

    SetBlendBrighten(0x10);
    gDispIo.win_ct.wout_enable_blend = 1;

    SetWinEnable(0, 0, 0);

    SetOnHBlankA(NULL);
}

void StartWorldFlush(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_WorldFlush, parent);
}

int WmToScreenX(int x)
{
    return x - gWmSt.x;
}

int WmToScreenY(int y)
{
    return y - gWmSt.y;
}
