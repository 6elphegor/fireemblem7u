#include "gbafe.h"

struct VectorBmfx {
    u8 x, y;
    u16 unk;
};
GBA_SIZE_CHECK(struct VectorBmfx, 0x4);

extern u8 CONST_DATA Img_EventWarp[];
extern u16 CONST_DATA Pal_EventWarp[];
extern u8 CONST_DATA Tsa_EventWarp[];

void ProcEventWrapAnim_End(struct ProcBmFx * proc);
void ProcEventWrapAnim_Init(struct ProcBmFx * proc);
void ProcEventWrapAnim_Loop(struct ProcBmFx * proc);

CONST_DATA struct VectorBmfx Vectors_EventWarp1[17] = {
    { 0, 0, 0 },
    { 4, 0, 0 },
    { 8, 0, 0 },
    { 0xC, 0, 0 },
    { 0x10, 0, 0 },
    { 0x14, 0, 0 },
    { 0x18, 0, 0 },
    { 0x1C, 0, 0 },
    { 0, 7, 0 },
    { 4, 7, 0 },
    { 8, 7, 0 },
    { 0xC, 7, 0 },
    { 0x10, 7, 0 },
    { 0x14, 7, 0 },
    { 0x18, 7, 0 },
    { 0x1C, 7, 0 },
    { 0xFF, 0xFF, 0 },
};

CONST_DATA struct VectorBmfx Vectors_EventWarp2[17] = {
    { 0x1C, 7, 0 },
    { 0x18, 7, 0 },
    { 0x14, 7, 0 },
    { 0x10, 7, 0 },
    { 0xC, 7, 0 },
    { 8, 7, 0 },
    { 4, 7, 0 },
    { 0, 7, 0 },
    { 0x1C, 0, 0 },
    { 0x18, 0, 0 },
    { 0x14, 0, 0 },
    { 0x10, 0, 0 },
    { 0xC, 0, 0 },
    { 8, 0, 0 },
    { 4, 0, 0 },
    { 0, 0, 0 },
    { 0xFF, 0xFF, 0 },
};

CONST_DATA struct ProcCmd ProcScr_EventWrapAnim[] = {
    PROC_YIELD,
    PROC_CALL(ProcEventWrapAnim_Init),
    PROC_REPEAT(ProcEventWrapAnim_Loop),
    PROC_CALL(ProcEventWrapAnim_End),
    PROC_END,
};

void ProcEventWrapAnim_Init(struct ProcBmFx * proc)
{
    int i;

    Decompress(Img_EventWarp, (void *) BG_VRAM + CHR_SIZE * 0x100);
    ApplyPalette(Pal_EventWarp, 5);
    Decompress(Tsa_EventWarp, gUiTmScratchA);

    for (i = 0; i < 0x360; i++)
        gUiTmScratchA[i] += TILEREF(0x100, 5);

    TmFill(gBg0Tm, TILEREF(0x100, 0));
    EnableBgSync(BG0_SYNC_BIT);

    PlaySoundEffect(0xB4);

    SetBlendConfig(1, 0xA, 0xC, 0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);

    SetWinEnable(0, 0, 0);

    proc->timer = 0;
}

void ProcEventWrapAnim_Loop(struct ProcBmFx * proc)
{
    int x, y;

    struct VectorBmfx * pVec = (0 == proc->xPos)
        ? Vectors_EventWarp1
        : Vectors_EventWarp2;

    if (0 != proc->yPos && A_BUTTON & gpKeySt->held)
        proc->timer++;

    proc->timer++;

    x = pVec[proc->timer / 2].x;
    y = pVec[proc->timer / 2].y;

    if (0xFF == x)
    {
        Proc_Break(proc);
        return;
    }

    if (0x8 == proc->timer)
        RefreshUnitSprites();

    TmCopyRect(gUiTmScratchA + TM_OFFSET(x, y), gBg0Tm, 4, 7);
    EnableBgSync(BG0_SYNC_BIT);
}

void ProcEventWrapAnim_End(struct ProcBmFx * proc)
{
    PlaySoundEffect(0xB5);
    TmFill(gBg0Tm, 0);
    EnableBgSync(BG0_SYNC_BIT);
}

void StartEventWarpAnim(ProcPtr parent, int x, int y, s8 kind, s8 flag)
{
    struct ProcBmFx * proc;

    proc = Proc_Start(ProcScr_EventWrapAnim, parent);
    proc->xPos = kind;
    proc->yPos = flag;

    x = x * 0x10 - gBmSt.camera.x - 0x08;
    y = y * 0x10 - gBmSt.camera.y - 0x20;
    SetBgOffset(0, -x, -y);
}

void StartWarpEffect_08020A64(ProcPtr parent, int x, int y, s8 kind)
{
    struct ProcBmFx * proc;

    proc = Proc_Start(ProcScr_EventWrapAnim, parent);
    proc->xPos = kind;

    SetBgOffset(0, -x, -y);
    proc->yPos = 1;
}

bool WarpEffectExists(ProcPtr proc)
{
    return NULL != Proc_Find(ProcScr_EventWrapAnim);
}
