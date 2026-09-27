#include "gbafe.h"
#include "gbafe/bmmenu.h"

struct DebugPrintProc {
    PROC_HEADER;

    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ u8 _pad_34[0x52 - 0x34];
    /* 52 */ u16 width;
    /* 54 */ const char * text;
};

extern struct ProcCmd CONST_DATA gProc_DebugPrintWithProc[];
extern const struct MenuDef gDebugMenuDef;

void NewKeyStSetter(int keys);
void EndMenu(struct MenuProc * proc);
void DebugInitBg(int bg, int vramOffset);

int Return2or3BySecondParity(void)
{
    int retVal;
    u16 hours;
    u16 minutes;
    u16 seconds;

    FormatTime(GetGameTime(), &hours, &minutes, &seconds);

    if ((seconds & 1) == 0)
        retVal = 2;
    else
        retVal = 3;

    return retVal;
}

int Return3or2BySecondParity(void)
{
    int retVal;
    u16 hours;
    u16 minutes;
    u16 seconds;

    FormatTime(GetGameTime(), &hours, &minutes, &seconds);

    if ((seconds & 1) != 0)
        retVal = 2;
    else
        retVal = 3;

    return retVal;
}

int Get8(void)
{
    return MENU_ACT_SND6B;
}

int Get23(void)
{
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

void nullsub_38(void)
{
}

void Loop6C_WaitForSelectPress(ProcPtr proc)
{
    if (gpKeySt->pressed & SELECT_BUTTON)
        Proc_Break(proc);
}

void SetNewKeyStatusWith16(void)
{
    NewKeyStSetter(DPAD_RIGHT);
}

void DummyFunction2(void)
{
}

void DebugPrintWithProc(struct DebugPrintProc * proc)
{
    struct Text text;

    int x = proc->x;
    int y = proc->y;
    int width = proc->width;
    const char * str = proc->text;

    InitText(&text, width);
    Text_DrawString(&text, str);
    DrawUiFrame2(x, y, width + 2, 4, 0);
    PutText(&text, gBg0Tm + TM_OFFSET(x + 1, y + 1));
    EnableBgSync(3);
}

void DebugPrint(int x, int y, int width, const char * text)
{
    struct DebugPrintProc * proc = Proc_Start(gProc_DebugPrintWithProc, PROC_TREE_3);
    proc->x = x;
    proc->y = y;
    proc->text = text;
    proc->width = width;
}

int StartDebugMenu(struct MenuProc * menuProc)
{
    EndMenu(menuProc);
    ClearUi();
    StartMenu(&gDebugMenuDef);
    DebugInitBg(2, 0);
    return 1;
}

ASM_FUNC("asm/nonmatching/code_0801B338.s");

ASM_FUNC("asm/nonmatching/code_0801B3C4.s");

ASM_FUNC("asm/nonmatching/code_0801B3E8.s");

ASM_FUNC("asm/nonmatching/code_0801B470.s");

ASM_FUNC("asm/nonmatching/code_0801B528.s");

ASM_FUNC("asm/nonmatching/code_0801B580.s");

ASM_FUNC("asm/nonmatching/code_0801B598.s");

ASM_FUNC("asm/nonmatching/code_0801B61C.s");

ASM_FUNC("asm/nonmatching/code_0801B668.s");

ASM_FUNC("asm/nonmatching/code_0801B66C.s");

ASM_FUNC("asm/nonmatching/code_0801B6F8.s");

ASM_FUNC("asm/nonmatching/code_0801B7A0.s");

ASM_FUNC("asm/nonmatching/code_0801B7A4.s");

ASM_FUNC("asm/nonmatching/code_0801B814.s");

ASM_FUNC("asm/nonmatching/code_0801B8B8.s");

ASM_FUNC("asm/nonmatching/code_0801B8BC.s");

ASM_FUNC("asm/nonmatching/code_0801B8D4.s");

ASM_FUNC("asm/nonmatching/code_0801B900.s");

ASM_FUNC("asm/nonmatching/code_0801B924.s");

ASM_FUNC("asm/nonmatching/code_0801B990.s");

ASM_FUNC("asm/nonmatching/code_0801BA10.s");

ASM_FUNC("asm/nonmatching/code_0801BA54.s");

ASM_FUNC("asm/nonmatching/code_0801BB74.s");

ASM_FUNC("asm/nonmatching/code_0801BBE0.s");

ASM_FUNC("asm/nonmatching/code_0801BBF4.s");

ASM_FUNC("asm/nonmatching/code_0801BC08.s");

ASM_FUNC("asm/nonmatching/code_0801BC18.s");

ASM_FUNC("asm/nonmatching/code_0801BC1C.s");

ASM_FUNC("asm/nonmatching/code_0801BC38.s");

ASM_FUNC("asm/nonmatching/code_0801BC50.s");

ASM_FUNC("asm/nonmatching/code_0801BC80.s");

ASM_FUNC("asm/nonmatching/code_0801BCAC.s");

ASM_FUNC("asm/nonmatching/code_0801BCC4.s");

ASM_FUNC("asm/nonmatching/code_0801BCE4.s");

ASM_FUNC("asm/nonmatching/code_0801BD64.s");

ASM_FUNC("asm/nonmatching/code_0801BDBC.s");

ASM_FUNC("asm/nonmatching/code_0801BDC0.s");

ASM_FUNC("asm/nonmatching/code_0801BDCC.s");

ASM_FUNC("asm/nonmatching/code_0801BDDC.s");

ASM_FUNC("asm/nonmatching/code_0801BE84.s");

ASM_FUNC("asm/nonmatching/code_0801BF38.s");

ASM_FUNC("asm/nonmatching/code_0801BF54.s");

ASM_FUNC("asm/nonmatching/code_0801C070.s");

ASM_FUNC("asm/nonmatching/code_0801C164.s");

ASM_FUNC("asm/nonmatching/code_0801C168.s");
