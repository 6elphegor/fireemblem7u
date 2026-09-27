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
void CgText_InitBlendAmt(struct CgTextMainProc * proc)
{
    proc->blendAmt = 0;
}

void CgText_LoopFadeIn(struct CgTextMainProc * proc)
{
    u16 target1;
    u16 target2;

    proc->blendAmt++;

    target1 = proc->blendAmt;

    if (proc->blendAmt != 0x10)
        target2 = 0x10 - proc->blendAmt;
    else
        target2 = 1;

    SetCgTextBlendAlpha(target1, target2);

    if (proc->blendAmt == 0x10)
        Proc_Break(proc);
}

void CgText_InitFadeOut(struct CgTextMainProc * proc)
{
    CgText_ClearSpriteText(proc);
    SetFaceDispById(0, GetFaceDispById(0) & ~FACE_DISP_TALK_1);

    EndCgTextInterpreter();

    if (GetCgTextFlags() & CG_TEXT_FLAG_0)
        Proc_Goto(proc, 5);
    else
        proc->blendAmt = 0x10;

    if (GetCgTextFlags() & CG_TEXT_FLAG_17)
        StartFaceFadeOut(Proc_Find(ProcScr_Face));
}

void CgText_LoopFadeOut(struct CgTextMainProc * proc)
{
    u16 target1;
    u16 target2;

    proc->blendAmt--;

    target1 = proc->blendAmt;

    if (target1 != 0x10)
        target2 = 0x10 - target1;
    else
        target2 = 1;

    SetCgTextBlendAlpha(target1, target2);

    if (proc->blendAmt == 0)
    {
        ClearCgTextFlag(CG_TEXT_FLAG_16);
        Proc_Break(proc);
    }
}

void CgText_808F04C(struct CgTextMainProc * proc)
{
    if (!(gpKeySt->pressed & (B_BUTTON | START_BUTTON)))
        return;

    if (GetCgTextFlags() & CG_TEXT_FLAG_6)
        return;

    sub_0800F08C();
    EndCgTextInterpreter();

    Proc_Goto(proc, 0);
}

void CgText_808F084(struct CgTextMainProc * proc)
{
    u16 * bg = GetBgTilemap(GetCgTextBg(GetCgTextFlags()));
    TmFillRect_thm(bg + (proc->y - 1) * 32, 31, proc->boxHeight + 1, 0);
    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}

void CgText_OnEnd(struct CgTextMainProc * proc)
{
    SetFaceDispById(0, GetFaceDispById(0) & ~FACE_DISP_TALK_1);
    CgText_808F084(proc);
    SetOnHBlankB(NULL);
}

void CgText_808F0EC(struct CgTextMainProc * proc)
{
    CgText_ClearSpriteText(proc);

    proc->thIndex = 0;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    proc->textWidth = 0;
    proc->textHeight = 0;
    GetCgTextDimensions(proc->str, &proc->textWidth, &proc->textHeight);

    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

    RestartCgTextInterpreter(proc);
}

ASM_FUNC("asm/nonmatching/code_08087BFC.s");

void EndCgText(void)
{
    Proc_End(Proc_Find(gProcScr_CgTextMain));
}

bool CgTextExists(void)
{
    if (Proc_Find(gProcScr_CgTextMain))
        return TRUE;

    return FALSE;
}

void sub_808F2A0(void)
{
    struct CgTextMainProc * proc = Proc_Find(gProcScr_CgTextMain);

    if (proc != NULL)
        Proc_Goto(proc, 0);
}
void CgText_ClearSpriteText(struct CgTextMainProc * proc)
{
    int i;

    SetTextFont(proc->pFont);

    for (i = 0; i <= proc->boxHeight / 2; i++)
        SpriteText_DrawBackgroundExt(proc->pTexts[i], 0);

    SetTextFont(NULL);
}

void sub_808F30C(struct CgTextMainProc * proc)
{
    int i;

    SetTextFont(proc->pFont);

    for (i = 0; i <= proc->boxHeight / 2; i++)
        Text_SetCursor(proc->pTexts[i], 0);
}

void GetCgTextDimensions(const char * str, u8 * wOut, u8 * hOut)
{
    int charWidth;

    int w = 0;
    int h = *hOut;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    while (1)
    {
        switch (*str)
        {
        case 0x00: // [X]
        case 0x03: // [A]
        case 0x18: // [Yes]
        case 0x19: // [No]
            *wOut = w;
            *hOut = h;
            return;

        case 0x02: // [NL2]
        case 0x04: // [....]
        case 0x05: // [.....]
        case 0x06: // [......]
        case 0x07: // [.......]
        case 0x16: // [ToggleMouthMove]
        case 0x17: // [ToggleSmile]
            str++;
            continue;

        case 0x01: // [NL]
            str++;
            h += 16;
            w = 0;
            continue;

        case 0x80:
            str += 2;
            continue;

        default:
            str = GetCharTextLen(str, &charWidth);
            w += charWidth;
            continue;
        }
    }
}

void sub_808F3D8(struct CgTextMainProc * proc)
{
    if (GetCgTextFlags() & CG_TEXT_FLAG_0)
        return;

    if (GetCgTextFlags() & CG_TEXT_FLAG_1)
        proc->x = proc->x - proc->boxWidth - 1;
    else
        proc->x += 2;

    proc->y -= proc->boxHeight;
}

void GetCgTextBoxDimensions(const char * str, int * wOut, int * hOut)
{
    int charWidth;

    int w = 0;
    int h = 16;

    *wOut = 0;
    *hOut = 0;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    while (1)
    {
        switch (*str)
        {
        case 0x03: // [A]
            w += 8;

        case 0x00: // [X]
        case 0x01: // [NL]
        case 0x02: // [2NL]
        case 0x18: // [Yes]
        case 0x19: // [No]
            if (*wOut < w)
                *wOut = w;

            w = 0;
            break;
        }

        switch (*str)
        {
        case 0x01: // [NL]
        case 0x18: // [Yes]
        case 0x19: // [No]
            h += 16;
            break;

        case 0x00: // [X]
        case 0x02: // [2NL]
            if (*hOut < h)
                *hOut = h;

            h = 0;
            break;
        }

        switch (*str)
        {
        case 0x00: // [X]
            return;

        case 0x01: // [NL]
        case 0x02: // [NL2]
        case 0x03: // [A]
        case 0x04: // [....]
        case 0x05: // [.....]
        case 0x06: // [......]
        case 0x07: // [.......]
        case 0x16: // [ToggleMouthMove]
        case 0x17: // [ToggleSmile]
        case 0x18: // [Yes]
        case 0x19: // [No]
            str++;
            continue;

        case 0x80:
            str += 2;
            continue;

        default:
            str = GetCharTextLen(str, &charWidth);
            w += charWidth;
            continue;
        }
    }
}

s8 DoesStringContainTact(const char * str)
{
    while (1)
    {
        switch (*str)
        {
        case 0x00: // [X]
            return 0;

        case 0x80:
            str++;

            if (*str == 0x20) // [Tact]
                return 1;
        }

        str++;
    }
}
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
