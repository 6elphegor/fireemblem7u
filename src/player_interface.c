#include "gbafe.h"

int GetWindowQuadrant(int x, int y)
{
    if (x < 0)
    {
        if (y < 0)
            return 0;
        else
            return 1;
    }
    else if (y < 0)
        return 2;
    else
        return 3;
}

int GetCursorQuadrant(void)
{
    int cursorX;
    int camX;
    int cursorY;
    int camY;

    int x;
    int y;

    cursorX = (gBmSt.cursor.x * 16);
    camX = (gBmSt.camera.x - 8);

    x = cursorX - camX;

    cursorY = (gBmSt.cursor.y * 16);
    camY = (gBmSt.camera.y - 8);

    y = cursorY - camY;

    if ((x < 105) && (y < (DISPLAY_HEIGHT / 2) + 1))
        return 0;

    if ((x >= 105) && (y < (DISPLAY_HEIGHT / 2) + 1))
        return 1;

    if ((x < 105) && (y >= (DISPLAY_HEIGHT / 2) + 1))
        return 2;

    if ((x >= 105) && (y >= (DISPLAY_HEIGHT / 2) + 1))
        return 3;
}

void PutMapUiHpBarLeft(u16 * buffer, s16 hp, int tileBase)
{
    if (hp > 5)
        hp = 5;

    *buffer = hp + tileBase;
}

void PutMapUiHpBarMid(u16 * buffer, s16 hp, int tileBase)
{
    int i;

    int hpEighth = hp >> 3;
    int eighthTileIdx = hp & 7;

    for (i = 0; i < 4; i++)
    {
        int fullTileIdx = tileBase + 14;
        int emptyTileIdx = tileBase + 6;

        if (i < hpEighth)
            *buffer = fullTileIdx;
        else if (i == hpEighth)
            *buffer = emptyTileIdx + eighthTileIdx;
        else
            *buffer = emptyTileIdx;

        buffer++;
    }
}

void PutMapUiHpBarRight(u16 * buffer, s16 hp, int tileBase)
{
    int base;

    if (hp >= 5)
        hp = 5;

    if (hp < 0)
        hp = 0;

    base = tileBase + 15;

    *buffer = hp + base;
}

void PutMapUiHpBar(u16 * buffer, struct Unit * unit, int tileBase)
{
    s16 hpCurrent = 42 * GetUnitCurrentHp(unit);
    s16 hpPercent = Div(hpCurrent, GetUnitMaxHp(unit));

    PutMapUiHpBarLeft(buffer, hpPercent, tileBase);
    PutMapUiHpBarMid(buffer + 1, hpPercent - 5, tileBase);
    PutMapUiHpBarRight(buffer + 5, hpPercent - 37, tileBase);
}

ASM_FUNC("asm/nonmatching/code_08084858.s");

ASM_FUNC("asm/nonmatching/code_080849D0.s");

ASM_FUNC("asm/nonmatching/code_08084B34.s");

ASM_FUNC("asm/nonmatching/code_08084C5C.s");

ASM_FUNC("asm/nonmatching/code_08084D90.s");

ASM_FUNC("asm/nonmatching/code_08084DE4.s");

ASM_FUNC("asm/nonmatching/code_08084E28.s");

ASM_FUNC("asm/nonmatching/code_08084E70.s");

ASM_FUNC("asm/nonmatching/code_08084E90.s");

ASM_FUNC("asm/nonmatching/code_08084EB4.s");

ASM_FUNC("asm/nonmatching/code_08084EDC.s");

ASM_FUNC("asm/nonmatching/code_08084FB4.s");

ASM_FUNC("asm/nonmatching/code_08085110.s");

ASM_FUNC("asm/nonmatching/code_08085250.s");

ASM_FUNC("asm/nonmatching/code_08085290.s");

ASM_FUNC("asm/nonmatching/code_080853F8.s");

ASM_FUNC("asm/nonmatching/code_08085478.s");

ASM_FUNC("asm/nonmatching/code_08085644.s");

ASM_FUNC("asm/nonmatching/code_0808566C.s");

ASM_FUNC("asm/nonmatching/code_08085710.s");

ASM_FUNC("asm/nonmatching/code_080857B4.s");

ASM_FUNC("asm/nonmatching/code_080857DC.s");

ASM_FUNC("asm/nonmatching/code_08085888.s");

ASM_FUNC("asm/nonmatching/code_08085968.s");

ASM_FUNC("asm/nonmatching/code_080859B4.s");

ASM_FUNC("asm/nonmatching/code_080859E0.s");

ASM_FUNC("asm/nonmatching/code_08085ADC.s");

ASM_FUNC("asm/nonmatching/code_08085C68.s");

ASM_FUNC("asm/nonmatching/code_08085C7C.s");

ASM_FUNC("asm/nonmatching/code_08085CDC.s");

ASM_FUNC("asm/nonmatching/code_08085CFC.s");

ASM_FUNC("asm/nonmatching/code_08085D48.s");

ASM_FUNC("asm/nonmatching/code_08085DCC.s");

ASM_FUNC("asm/nonmatching/code_08085F70.s");

ASM_FUNC("asm/nonmatching/code_08086008.s");

ASM_FUNC("asm/nonmatching/code_080861C8.s");

ASM_FUNC("asm/nonmatching/code_08086210.s");

ASM_FUNC("asm/nonmatching/code_0808626C.s");

ASM_FUNC("asm/nonmatching/code_08086270.s");

ASM_FUNC("asm/nonmatching/code_08086274.s");

ASM_FUNC("asm/nonmatching/code_08086278.s");

ASM_FUNC("asm/nonmatching/code_0808630C.s");

ASM_FUNC("asm/nonmatching/code_08086368.s");

ASM_FUNC("asm/nonmatching/code_08086398.s");

ASM_FUNC("asm/nonmatching/code_08086420.s");

ASM_FUNC("asm/nonmatching/code_080864AC.s");

ASM_FUNC("asm/nonmatching/code_080864E8.s");

ASM_FUNC("asm/nonmatching/code_0808652C.s");

ASM_FUNC("asm/nonmatching/code_080865D4.s");

