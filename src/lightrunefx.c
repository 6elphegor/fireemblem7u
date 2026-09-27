#include "gbafe.h"

struct VectorBmfx {
    u8 x, y;
    u16 unk;
};

extern u8 CONST_DATA Img_LightRune[];
extern u16 CONST_DATA Pal_LightRune[];
extern u8 CONST_DATA Tsa_LightRune[];

extern struct VectorBmfx const Vectors_LightRune3[13];

extern struct ProcCmd CONST_DATA ProcScr_LightRuneAnim3[];

void * memcpy(void * dst, const void * src, unsigned long n);

void ProcLightRuneAnim3_Init(struct ProcBmFx * proc)
{
    int i;

    Decompress(Img_LightRune, (void *) BG_VRAM + CHR_SIZE * 0x100);
    ApplyPalette(Pal_LightRune, 2);
    Decompress(Tsa_LightRune, gUiTmScratchA);

    for (i = 0; i < 0x360; i++)
        gUiTmScratchA[i] += TILEREF(0x100, 2);

    TmFill(gBg0Tm, TILEREF(0x100, 0));
    EnableBgSync(BG0_SYNC_BIT);
    PlaySoundEffect(0x2D8);

    SetBlendConfig(1, 0x10, 0x10, 0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);

    proc->timer = 0;
}

void ProcLightRuneAnim3_Loop(struct ProcBmFx * proc)
{
    struct VectorBmfx buf[13];
    int x, y;

    memcpy(buf, Vectors_LightRune3, 0x34);
    proc->timer++;

    x = buf[proc->timer / 3].x;
    y = buf[proc->timer / 3].y;

    if (0xFF == x)
    {
        Proc_Break(proc);
        return;
    }

    if (0x18 == x && 0x09 == y)
        RefreshUnitSprites();

    TmCopyRect(gUiTmScratchA + TM_OFFSET(x, y), gBg0Tm, 8, 9);
    EnableBgSync(BG0_SYNC_BIT);
}

void ProcLightRuneAnim3_End(struct ProcBmFx * proc)
{
    SetBlendNone();
    TmFill(gBg0Tm, 0);
    EnableBgSync(BG0_SYNC_BIT);
}

void StartLightRuneAnim3(ProcPtr parent, int x, int y)
{
    Proc_StartBlocking(ProcScr_LightRuneAnim3, parent);

    x = x * 0x10 - gBmSt.camera.x - 0x18;
    y = y * 0x10 - gBmSt.camera.y - 0x28;

    SetBgOffset(0, -x, -y);
}
