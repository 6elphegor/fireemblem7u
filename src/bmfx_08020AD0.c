#include "gbafe.h"

struct VectorBmfx {
    u8 x, y;
    u16 unk;
};
GBA_SIZE_CHECK(struct VectorBmfx, 0x4);

extern u8 CONST_DATA Img_Unk_0819B558[];
extern u16 CONST_DATA Pal_Unk_0819C56C[];
extern u8 CONST_DATA Tsa_Unk_0819C58C[];

extern struct VectorBmfx const Vectors_Unk_081C3C30[14];

void * memcpy(void * dst, const void * src, unsigned long n);

void sub_08020AD0(struct ProcBmFx * proc);
void sub_08020B84(struct ProcBmFx * proc);
void sub_08020BFC(struct ProcBmFx * proc);

CONST_DATA struct ProcCmd ProcScr_Unk_08B93C7C[] = {
    PROC_SLEEP(70),
    PROC_CALL(sub_08020AD0),
    PROC_REPEAT(sub_08020B84),
    PROC_CALL(sub_08020BFC),
    PROC_END,
};

void sub_08020AD0(struct ProcBmFx * proc)
{
    int i;

    Decompress(Img_Unk_0819B558, (void *) BG_VRAM + CHR_SIZE * 0x100);
    ApplyPalette(Pal_Unk_0819C56C, 2);
    Decompress(Tsa_Unk_0819C58C, gUiTmScratchA);

    for (i = 0; i < 0x360; i++)
        gUiTmScratchA[i] += TILEREF(0x100, 2);

    TmFill(gBg0Tm, TILEREF(0x100, 0));
    EnableBgSync(BG0_SYNC_BIT);

    SetBlendConfig(1, 0x10, 0x10, 0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);

    proc->timer = 0;
}

void sub_08020B84(struct ProcBmFx * proc)
{
    struct VectorBmfx buf[14];
    int x, y;

    memcpy(buf, Vectors_Unk_081C3C30, 0x38);
    proc->timer++;

    x = buf[proc->timer / 3].x;
    y = buf[proc->timer / 3].y;

    if (0xFF == x)
    {
        Proc_Break(proc);
        return;
    }

    if (0 == x && 0x10 == y)
        RefreshUnitSprites();

    TmCopyRect(gUiTmScratchA + TM_OFFSET(x, y), gBg0Tm, 6, 8);
    EnableBgSync(BG0_SYNC_BIT);
}

void sub_08020BFC(struct ProcBmFx * proc)
{
    TmFill(gBg0Tm, 0);
    EnableBgSync(BG0_SYNC_BIT);
}

void sub_08020C14(ProcPtr parent, int x, int y)
{
    Proc_Start(ProcScr_Unk_08B93C7C, PROC_TREE_3);

    x = x * 0x10 - gBmSt.camera.x - 0x10;
    y = y * 0x10 - gBmSt.camera.y - 0x28;

    SetBgOffset(0, -x, -y);
}
