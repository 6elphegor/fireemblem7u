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
    /* 2B */ STRUCT_PAD(0x2B, 0x2E);
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

struct WmFaceSlotsProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct {
        /* 00 */ s16 x;
        /* 02 */ s16 y;
        /* 04 */ struct ProcSpriteAnim * anim;
        /* 08 */ s8 state;
    } ent[5];
};

struct WmFaceManagerProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ ProcPtr parent;
    /* 30 */ u16 unk_30;
    /* 34 */ struct WmFaceSlotsProc * slots[4];
    /* 44 */ u8 unk_44;
    /* 45 */ u8 unk_45;
    /* 46 */ u8 unk_46;
    /* 47 */ u8 unk_47;
    /* 48 */ u8 unk_48;
};

extern struct ProcCmd CONST_DATA ProcScr_WmFaceManager[];
extern struct ProcCmd CONST_DATA ProcScr_WmFaceSlots[];
extern struct ProcCmd CONST_DATA ProcScr_WmTextBox[];
extern struct ProcCmd CONST_DATA ProcScr_WmMarker[];
extern u16 CONST_DATA Sprite_WmTextBoxA[];
extern u16 CONST_DATA Sprite_WmTextBoxB[];
extern u16 CONST_DATA Sprite_WmMarker[];

void WmMakeGradient(u16 * dstPal, int b, u16 colorA, u16 colorB);
void PutWmSpriteClipped(u8 layer, int x, int y, u16 const * sprite, u16 yOff, u16 xOff, u16 oam2);

extern struct WmSt gWmSt;
extern struct WmCanvas gWmCanvas;

bool sub_080AAD18(int x, int y, int x1, int y1, int x2, int y2, int x3, int y3);
void sub_080B5D9C(int mode, int x, int y);
void sub_080B5E80(int mode, int x, int y);
void sub_080B5BFC(int x1, int y1, int x2, int y2);
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

ASM_FUNC("asm/nonmatching/code_080B3070.s");

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
            if (sub_080AAD18(x, y, x0, y0, x1, y1, x2, y2))
                WmCanvas_PutPixel(x, y, color);
            else if (sub_080AAD18(x, y, x0, y0, x2, y2, x3, y3))
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

    sub_080B5D9C(gWmSt.mode, gWmSt.x, gWmSt.y);
}

void WmRedrawMap(void)
{
    sub_080B5E80(gWmSt.mode, gWmSt.x / 8, gWmSt.y / 8);
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

ASM_FUNC("asm/nonmatching/code_080B33D0.s");
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

ASM_FUNC("asm/nonmatching/code_080B3940.s");

ASM_FUNC("asm/nonmatching/code_080B39D8.s");

ASM_FUNC("asm/nonmatching/code_080B3AFC.s");

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

ASM_FUNC("asm/nonmatching/code_080B3EB4.s");
void WmMuMove_OnEnd(struct WmMuMoveProc * proc)
{
    if (proc->mu != NULL)
        EndMu(proc->mu);

    if (proc->flags & 0x2000000)
        WmSetUnk02(0);
}

ProcPtr StartWmFaceManager(ProcPtr parent)
{
    return Proc_Start(ProcScr_WmFaceManager, parent);
}

void WmFaceSlots_Init(struct WmFaceSlotsProc * proc)
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

void WmFaceManager_Init(struct WmFaceManagerProc * proc)
{
    proc->unk_30 = 0;

    proc->slots[0] = Proc_Start(ProcScr_WmFaceSlots, proc);
    proc->slots[1] = Proc_Start(ProcScr_WmFaceSlots, proc);
    proc->slots[2] = Proc_Start(ProcScr_WmFaceSlots, proc);
    proc->slots[3] = Proc_Start(ProcScr_WmFaceSlots, proc);

    proc->parent = proc->proc_parent;

    proc->unk_44 = 0;
    proc->unk_45 = 0;
    proc->unk_47 = 0;
    proc->unk_48 = 0;
}

void WmFaceSlots_UpdatePosition(int idx, struct WmFaceSlotsProc * proc)
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

ASM_FUNC("asm/nonmatching/code_080B43EC.s");
ASM_FUNC("asm/nonmatching/code_080B4510.s");
ASM_FUNC("asm/nonmatching/code_080B4610.s");
ASM_FUNC("asm/nonmatching/code_080B467C.s");
ASM_FUNC("asm/nonmatching/code_080B4738.s");
ASM_FUNC("asm/nonmatching/code_080B47E0.s");
ASM_FUNC("asm/nonmatching/code_080B4828.s");
ASM_FUNC("asm/nonmatching/code_080B4890.s");
ASM_FUNC("asm/nonmatching/code_080B4904.s");
ASM_FUNC("asm/nonmatching/code_080B4ADC.s");
ASM_FUNC("asm/nonmatching/code_080B4B14.s");
ASM_FUNC("asm/nonmatching/code_080B4B50.s");
ASM_FUNC("asm/nonmatching/code_080B4B8C.s");
ASM_FUNC("asm/nonmatching/code_080B4C28.s");
ASM_FUNC("asm/nonmatching/code_080B4C60.s");
ASM_FUNC("asm/nonmatching/code_080B4D14.s");
ASM_FUNC("asm/nonmatching/code_080B4D4C.s");
ASM_FUNC("asm/nonmatching/code_080B4E88.s");
ASM_FUNC("asm/nonmatching/code_080B4F44.s");
ASM_FUNC("asm/nonmatching/code_080B4F58.s");
ASM_FUNC("asm/nonmatching/code_080B4F68.s");
ASM_FUNC("asm/nonmatching/code_080B4F6C.s");
ASM_FUNC("asm/nonmatching/code_080B4F70.s");
ASM_FUNC("asm/nonmatching/code_080B4F74.s");
ASM_FUNC("asm/nonmatching/code_080B4F78.s");
ASM_FUNC("asm/nonmatching/code_080B4F9C.s");
ASM_FUNC("asm/nonmatching/code_080B4FE4.s");
ASM_FUNC("asm/nonmatching/code_080B5030.s");
ASM_FUNC("asm/nonmatching/code_080B50C4.s");
ASM_FUNC("asm/nonmatching/code_080B5280.s");
ASM_FUNC("asm/nonmatching/code_080B52CC.s");
ASM_FUNC("asm/nonmatching/code_080B52D0.s");
ASM_FUNC("asm/nonmatching/code_080B5350.s");
ASM_FUNC("asm/nonmatching/code_080B5420.s");
ASM_FUNC("asm/nonmatching/code_080B5430.s");
ASM_FUNC("asm/nonmatching/code_080B5554.s");
ASM_FUNC("asm/nonmatching/code_080B558C.s");
ASM_FUNC("asm/nonmatching/code_080B55BC.s");
ASM_FUNC("asm/nonmatching/code_080B55E4.s");
ASM_FUNC("asm/nonmatching/code_080B5624.s");
ASM_FUNC("asm/nonmatching/code_080B5630.s");
ASM_FUNC("asm/nonmatching/code_080B5644.s");
ASM_FUNC("asm/nonmatching/code_080B565C.s");
ASM_FUNC("asm/nonmatching/code_080B5760.s");
ASM_FUNC("asm/nonmatching/code_080B57AC.s");
ASM_FUNC("asm/nonmatching/code_080B5844.s");
ASM_FUNC("asm/nonmatching/code_080B58A0.s");
ASM_FUNC("asm/nonmatching/code_080B5934.s");
ASM_FUNC("asm/nonmatching/code_080B5990.s");
ASM_FUNC("asm/nonmatching/code_080B5A84.s");
ASM_FUNC("asm/nonmatching/code_080B5B00.s");
ASM_FUNC("asm/nonmatching/code_080B5B44.s");
ASM_FUNC("asm/nonmatching/code_080B5B6C.s");
ASM_FUNC("asm/nonmatching/code_080B5B80.s");
ASM_FUNC("asm/nonmatching/code_080B5BFC.s");
ASM_FUNC("asm/nonmatching/code_080B5D40.s");
ASM_FUNC("asm/nonmatching/code_080B5D9C.s");
ASM_FUNC("asm/nonmatching/code_080B5E80.s");
ASM_FUNC("asm/nonmatching/code_080B5FC0.s");
ASM_FUNC("asm/nonmatching/code_080B5FE0.s");
ASM_FUNC("asm/nonmatching/code_080B6034.s");
ASM_FUNC("asm/nonmatching/code_080B608C.s");
ASM_FUNC("asm/nonmatching/code_080B6190.s");
ASM_FUNC("asm/nonmatching/code_080B620C.s");
ASM_FUNC("asm/nonmatching/code_080B6264.s");
ASM_FUNC("asm/nonmatching/code_080B6278.s");
ASM_FUNC("asm/nonmatching/code_080B6288.s");
ASM_FUNC("asm/nonmatching/code_080B6298.s");
ASM_FUNC("asm/nonmatching/code_080B62C4.s");
