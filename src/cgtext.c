#include "gbafe.h"
#include "gbafe/cgtext.h"

void SetCgTextFlags(int flags)
{
    gCgTextSt.flags = flags;
}

void SetCgTextFlag(int flag)
{
    gCgTextSt.flags |= flag & 0x3FFFFF;
}

void ClearCgTextFlag(int flag)
{
    SetCgTextFlags(GetCgTextFlags() & (flag ^ 0x3FFFFF));
}

u32 GetCgTextFlags(void)
{
    return gCgTextSt.flags;
}

void SetCgTextBlendControl(u16 target1, u16 target2)
{
    target2 |= 0x20;
    gCgTextSt.bldCnt = target1 + BLDCNT_EFFECT_BLEND + (target2 << 8);
}

u16 GetCgTextBlendControl(void)
{
    return gCgTextSt.bldCnt;
}

void SetCgTextBlendAlpha(u16 target1, u16 target2)
{
    gCgTextSt.bldAlpha = target1 + (target2 << 8);
}

u16 GetCgTextBlendAlpha(void)
{
    return gCgTextSt.bldAlpha;
}

void CgText_OnHBlank(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
        vcount = 0;

    if (vcount == gCgTextSt.unk_48_00 * 8 - 32)
    {
        REG_BLDCNT = GetCgTextBlendControl();
        REG_BLDALPHA = GetCgTextBlendAlpha();
    }

    if ((vcount == 0) || (vcount == (gCgTextSt.unk_48_05 * 8 + 4)))
    {
        REG_BLDCNT = *((u16 *)&gDispIo.blend_ct);
        REG_BLDALPHA = gDispIo.blend_coef_a + gDispIo.blend_coef_b * 0x100;
    }
}
ASM_FUNC("asm/nonmatching/code_080875A8.s");
ASM_FUNC("asm/nonmatching/code_08087690.s");
ASM_FUNC("asm/nonmatching/code_08087A38.s");
ASM_FUNC("asm/nonmatching/code_08087A40.s");
ASM_FUNC("asm/nonmatching/code_08087A7C.s");
ASM_FUNC("asm/nonmatching/code_08087ADC.s");
ASM_FUNC("asm/nonmatching/code_08087B20.s");
ASM_FUNC("asm/nonmatching/code_08087B58.s");
ASM_FUNC("asm/nonmatching/code_08087B98.s");
ASM_FUNC("asm/nonmatching/code_08087BC0.s");
ASM_FUNC("asm/nonmatching/code_08087BFC.s");
ASM_FUNC("asm/nonmatching/code_08087D44.s");
ASM_FUNC("asm/nonmatching/code_08087D58.s");
ASM_FUNC("asm/nonmatching/code_08087D74.s");
ASM_FUNC("asm/nonmatching/code_08087D90.s");
ASM_FUNC("asm/nonmatching/code_08087DE0.s");
ASM_FUNC("asm/nonmatching/code_08087E2C.s");
ASM_FUNC("asm/nonmatching/code_08087EAC.s");
ASM_FUNC("asm/nonmatching/code_08087EFC.s");
ASM_FUNC("asm/nonmatching/code_08088074.s");
ASM_FUNC("asm/nonmatching/code_08088098.s");
ASM_FUNC("asm/nonmatching/code_08088380.s");
ASM_FUNC("asm/nonmatching/code_08088938.s");
ASM_FUNC("asm/nonmatching/code_080889A4.s");
ASM_FUNC("asm/nonmatching/code_080889AC.s");
ASM_FUNC("asm/nonmatching/code_08088A30.s");
ASM_FUNC("asm/nonmatching/code_08088A58.s");
ASM_FUNC("asm/nonmatching/code_08088A7C.s");
ASM_FUNC("asm/nonmatching/code_08088A90.s");
ASM_FUNC("asm/nonmatching/code_08088AA8.s");
ASM_FUNC("asm/nonmatching/code_08088B88.s");
