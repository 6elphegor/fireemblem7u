#include "gbafe.h"

struct VectorBmfx {
    u8 x, y;
    u16 unk;
};

extern u8 CONST_DATA Img_DanceringFx[];
extern u16 CONST_DATA Pal_DanceringFx[];
extern u8 CONST_DATA Tsa_DanceringFx[];

extern struct VectorBmfx const Vectors_DanceringFx[14];

extern struct ProcCmd CONST_DATA ProcScr_DanceringAnim[];

void * memcpy(void * dst, const void * src, unsigned long n);

void ProcDanceAnim_Init(struct ProcBmFx * proc)
{
    int i;

    Decompress(Img_DanceringFx, (void *) BG_VRAM + CHR_SIZE * 0x100);
    ApplyPalette(Pal_DanceringFx, 2);
    Decompress(Tsa_DanceringFx, gUiTmScratchA);

    for (i = 0; i < 0x240; i++)
        gUiTmScratchA[i] += TILEREF(0x100, 2);

    TmFill(gBg0Tm, TILEREF(0x100, 0));
    EnableBgSync(BG0_SYNC_BIT);

    SetBlendConfig(1, 0x10, 0x10, 0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);

    proc->timer = 0;
}

void ProcDanceAnim_Loop(struct ProcBmFx * proc)
{
    struct VectorBmfx buf[14];
    int x, y;

    memcpy(buf, Vectors_DanceringFx, 0x38);
    proc->timer++;

    x = buf[proc->timer / 2].x;
    y = buf[proc->timer / 2].y;

    if (0xFF == x)
    {
        Proc_Break(proc);
        return;
    }

    TmCopyRect(gUiTmScratchA + TM_OFFSET(x, y), gBg0Tm, 6, 6);
    EnableBgSync(BG0_SYNC_BIT);
}

void ProcDanceAnim_ResetTimer(struct ProcBmFx * proc)
{
    proc->timer = 0x10;
}

void ProcDanceAnim_Loop_Blend(struct ProcBmFx * proc)
{
    SetBlendConfig(1, proc->timer, 0x10, 0);

    proc->timer--;

    if (proc->timer < 0)
        Proc_Break(proc);
}

void StartDanceringAnim(ProcPtr parent)
{
    if (BATTLE_CONFIG_DANCERING & gBattleStats.config)
    {
        struct Unit * unit = GetUnit(gActionSt.target);
        int x = unit->xPos;
        int y = unit->yPos;

        Proc_StartBlocking(ProcScr_DanceringAnim, parent);

        x = x * 0x10 - gBmSt.camera.x - 0x10;
        y = y * 0x10 - gBmSt.camera.y - 0x10;

        SetBgOffset(0, -x, -y);
    }
}
