#include "gbafe.h"
#include "gbafe/sio_core.h"

// FE6 <-> FE7 link / GameCube link (FE7-only, no FE8U counterpart)

extern u8 gUnk_Sio_02000C00[];
extern const char gUnknown_081D546C[]; // "END"

void sub_0800530C(int a, int b, const char * str);
void SoundVSyncOn_rev01(void);
void SoundVSyncOff_rev01(void);
void LoadHelpBoxGfx(void * vram, int palId);

ASM_FUNC("asm/nonmatching/code_080431E0.s");
ASM_FUNC("asm/nonmatching/code_080433F0.s");
void sub_080434EC(ProcPtr proc)
{
    u16 magic = 0x2586;

    Proc_Start(ProcScr_SIOVSYNC, PROC_TREE_VSYNC);
    Proc_Start(ProcScr_SIOMAIN, proc);
    Proc_Start(ProcScr_SIOCON, proc);

    SioSend16(&magic, -1);
    SoundVSyncOn_rev01();
}
ASM_FUNC("asm/nonmatching/code_08043538.s");
ASM_FUNC("asm/nonmatching/code_080435D4.s");
void sub_08043604(void)
{
    sub_0800530C(8, 16, gUnknown_081D546C);
}
bool sub_08043618(void * data)
{
    switch (*(u8 *)data)
    {
    case 0:
    case 1:
    case 2:
        return TRUE;

    default:
        return FALSE;
    }
}
void sub_0804362C(ProcPtr proc)
{
    u8 senderId[4];

    if ((u16)SioReceiveData(gUnk_Sio_02000C00, senderId, sub_08043618) != 0)
    {
        switch (gUnk_Sio_02000C00[0])
        {
        case 0:
            Proc_Break(proc);
            break;

        case 1:
        case 2:
            LoadHelpBoxGfx((void *)0x06015000, 6);
            StartHelpBoxExt_Unk(0x38, 0x38, 0x1193);
            Proc_Goto(proc, 10);
            break;
        }
    }
}
bool sub_08043690(void * data)
{
    if (*(u8 *)data == 0x55)
        return TRUE;

    return FALSE;
}
ASM_FUNC("asm/nonmatching/code_080436A0.s");
ASM_FUNC("asm/nonmatching/code_08043700.s");
bool sub_08043788(void * data)
{
    if (*(u8 *)data == 0x66)
        return TRUE;

    return FALSE;
}
ASM_FUNC("asm/nonmatching/code_08043798.s");
ASM_FUNC("asm/nonmatching/code_08043828.s");
ASM_FUNC("asm/nonmatching/code_0804397C.s");
ASM_FUNC("asm/nonmatching/code_080439D0.s");
ASM_FUNC("asm/nonmatching/code_08043A14.s");
ASM_FUNC("asm/nonmatching/code_08043B1C.s");
ASM_FUNC("asm/nonmatching/code_08043C0C.s");
ASM_FUNC("asm/nonmatching/code_08043CC8.s");
ASM_FUNC("asm/nonmatching/code_08043DB8.s");
ASM_FUNC("asm/nonmatching/code_08043EA0.s");
ASM_FUNC("asm/nonmatching/code_08043EB4.s");
ASM_FUNC("asm/nonmatching/code_08043F04.s");
ASM_FUNC("asm/nonmatching/code_08043F1C.s");
ASM_FUNC("asm/nonmatching/code_08043F50.s");
ASM_FUNC("asm/nonmatching/code_0804408C.s");
ASM_FUNC("asm/nonmatching/code_080440AC.s");
ASM_FUNC("asm/nonmatching/code_080440B8.s");
