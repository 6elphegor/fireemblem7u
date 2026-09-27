#include "gbafe.h"

struct PasswordSeedSt {
    /* 00 */ int unk_00;
    /* 04 */ int unk_04;
    /* 08 */ int unk_08;
    /* 0C */ int unk_0c;
};

extern int gPasswordBitsPerChar;
extern int gPasswordCharMask;
extern int gPasswordCharCount;
extern int gPasswordUnk_02014408;
extern u8 gPasswordUnk_0201440C[];
extern int gPasswordSeed;
extern u8 gPasswordBuf[];
extern u16 gPasswordData[];

u16 sub_0809D82C(void);
u16 sub_0809D9A4(u8 const * buf, int n);
void sub_0809D9E4(void);
void sub_0809DAB8(void);
void sub_0809D844(void);
int sub_0809D800(int n);
void sub_0809D880(u8 * buf, int * bitpos, int value, int nbits);
int sub_0809D914(u8 * buf, int * bitpos, int nbits);

struct PasswordInfo {
    /* 00 */ u8 unk_00;
    /* 01 */ u8 unk_01;
    /* 02 */ u8 unk_02;
    /* 03 */ u8 unk_03;
    /* 04 */ u8 unk_04;
    /* 05 */ u8 unk_05;
    /* 06 */ u8 unk_06;
    /* 07 */ u8 unk_07;
    /* 08 */ u8 unk_08;
    /* 09 */ u8 unk_09;
    /* 0A */ u8 unk_0a;
    /* 0B */ u8 unk_0b;
    /* 0C */ u16 unk_0c;
    /* 0E */ u8 unk_0e;
    /* 0F */ u8 unk_0f;
    /* 10 */ int unk_10;
};

extern struct PasswordInfo gPasswordInfo;

struct PasswordProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ ProcPtr bg;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
};

extern struct ProcCmd CONST_DATA ProcScr_08CC5AF0[];
extern u8 gUnk_0203E790;

void sub_0809D778(struct PasswordSeedSt * st, u8 const * src)
{
    int v = src[0];

    st->unk_08 = v;
    st->unk_04 = (src[2] << 8) | src[1];
    st->unk_0c = v;
}
void sub_0809D790(struct PasswordSeedSt * st, u8 * dst)
{
    dst[0] = st->unk_08;
    dst[1] = st->unk_04;
    dst[2] = st->unk_04 >> 16;
}
int sub_0809D7A0(struct PasswordSeedSt * st)
{
    return st->unk_0c = (st->unk_0c * 13 + 1) & 0xFF;
}
void sub_0809D7B4(int bits, int unk)
{
    gPasswordBitsPerChar = bits;
    gPasswordCharMask = (1 << bits) - 1;
    gPasswordCharCount = 30 / bits;

    if (30 % bits > 0)
        gPasswordCharCount = gPasswordCharCount + 1;

    gPasswordUnk_02014408 = unk;
}
int sub_0809D800(int n)
{
    int r = n / gPasswordBitsPerChar;

    if (n % gPasswordBitsPerChar > 0)
        r++;

    return r;
}
u16 sub_0809D82C(void)
{
    gPasswordSeed = (u16) (gPasswordSeed * 13 + 1);
    return gPasswordSeed;
}
void sub_0809D844(void)
{
    int i;

    for (i = 0; i < gPasswordCharCount; i++)
    {
        u8 tmp = gPasswordBuf[i + gPasswordCharCount + i * 2];
        gPasswordBuf[i + gPasswordCharCount + i * 2] = gPasswordBuf[i];
        gPasswordBuf[i] = tmp;
    }
}
void sub_0809D880(u8 * buf, int * bitpos, int value, int nbits)
{
    int i;

    value += sub_0809D82C();
    value &= (1 << nbits) - 1;

    for (i = 0; i < nbits; i++)
    {
        buf[*bitpos / gPasswordBitsPerChar] |= (((1 << i) & value) >> i) << ((*bitpos % gPasswordBitsPerChar) % 8);
        (*bitpos)++;
    }
}
int sub_0809D914(u8 * buf, int * bitpos, int nbits)
{
    int value = 0;
    int i;

    for (i = 0; i < nbits; i++)
    {
        value |= ((buf[*bitpos / gPasswordBitsPerChar] & (1 << ((*bitpos % gPasswordBitsPerChar) % 8))) >>
                  ((*bitpos % gPasswordBitsPerChar) % 8)) << i;
        (*bitpos)++;
    }

    return (value - sub_0809D82C()) & ((1 << nbits) - 1);
}
u16 sub_0809D9A4(u8 const * buf, int n)
{
    u16 sum = 0;
    int i;

    for (i = 0; i < n; i++)
        sum += buf[i] * buf[i] * (i + 1);

    return (sum + (sum >> 8) + (sum >> 16)) & 0x3FF;
}
#if NONMATCHING
// loop invariant hoisting: &gPasswordBitsPerChar is hoisted here, the original keeps gPasswordData in r8 instead
void sub_0809D9E4(void)
{
    int i = 0;
    int j;
    int bit;
    u8 * p;
    u16 * data = gPasswordData;
    u16 seed = sub_0809D9A4(gPasswordBuf + gPasswordCharCount, data[3]);

    p = gPasswordBuf;

    do
    {
        if (i % 3 == 0)
            bit = (data[0] & (1 << (i / 3))) >> (i / 3);
        else if (i % 3 == 1)
            bit = (data[1] & (1 << (i / 3))) >> (i / 3);
        else
            bit = (data[2] & (1 << (i / 3))) >> (i / 3);

        *p |= bit << (i % gPasswordBitsPerChar);

        i++;

        if (i % gPasswordBitsPerChar == 0)
            p++;
    } while (i != 30);

    for (j = 0; j < gPasswordCharCount; j++)
        gPasswordBuf[j] = (gPasswordBuf[j] + seed) & gPasswordCharMask;

    sub_0809D844();
}
#else
ASM_FUNC("asm/nonmatching/code_0809D9E4.s");
#endif
#if NONMATCHING
// the original keeps a zero "idx" variable in sl (not constant-folded) and uses it for the first loop test and p
void sub_0809DAB8(void)
{
    int idx = 0;
    int i = 0;
    int j;
    u8 * p;
    u16 seed;

    sub_0809D844();

    seed = sub_0809D9A4(gPasswordBuf + gPasswordCharCount, gPasswordData[3]);

    for (j = idx; j < gPasswordCharCount; j++)
        gPasswordBuf[j] = (gPasswordBuf[j] - seed) & gPasswordCharMask;

    gPasswordData[0] = 0;
    gPasswordData[1] = 0;
    gPasswordData[2] = 0;

    p = gPasswordBuf + idx;

    do
    {
        if (i % 3 == 0)
            gPasswordData[0] |= ((*p >> (i % gPasswordBitsPerChar)) & 1) << (i / 3);
        else if (i % 3 == 1)
            gPasswordData[1] |= ((*p >> (i % gPasswordBitsPerChar)) & 1) << (i / 3);
        else
            gPasswordData[2] |= ((*p >> (i % gPasswordBitsPerChar)) & 1) << (i / 3);

        i++;

        if (i % gPasswordBitsPerChar == 0)
            p++;
    } while (i != 30);
}
#else
ASM_FUNC("asm/nonmatching/code_0809DAB8.s");
#endif
void ModifyPassword(void (* func)(int * bitpos, u8 * buf))
{
    int bitpos = 0;
    int i;

    for (i = 0; i < 0xA0; i++)
        gPasswordBuf[i] = 0;

    func(&bitpos, gPasswordBuf + gPasswordCharCount);

    gPasswordData[3] = sub_0809D800(bitpos);
    gPasswordData[1] = sub_0809D9A4(gPasswordBuf + gPasswordCharCount, gPasswordData[3]);
    gPasswordData[0] = (gPasswordData[1] + (GetGameTime() >> 3)) % 0x400;
    gPasswordSeed = gPasswordData[0];
    gPasswordData[1] = (gPasswordData[1] + sub_0809D82C()) & 0x3FF;

    for (i = 0; i < gPasswordData[3]; i++)
        gPasswordBuf[i + gPasswordCharCount] = (gPasswordBuf[i + gPasswordCharCount] + sub_0809D82C()) & gPasswordCharMask;

    gPasswordData[2] = (sub_0809D9A4(gPasswordBuf + gPasswordCharCount, gPasswordData[3]) + sub_0809D82C()) & 0x3FF;

    sub_0809D9E4();
}
bool sub_0809DCA8(void (* func)(int * bitpos, u8 * buf))
{
    u16 rng[2];
    int bitpos = 0;
    int i;
    u16 chk;
    u16 x;

    sub_0809DAB8();

    gPasswordSeed = gPasswordData[0];

    chk = sub_0809D9A4(gPasswordBuf + gPasswordCharCount, gPasswordData[3]);
    rng[0] = sub_0809D82C();

    for (i = 0; i < gPasswordData[3]; i++)
        gPasswordBuf[i + gPasswordCharCount] = (gPasswordBuf[i + gPasswordCharCount] - sub_0809D82C()) & gPasswordCharMask;

    rng[1] = sub_0809D82C();

    func(&bitpos, gPasswordBuf + gPasswordCharCount);

    x = (sub_0809D9A4(gPasswordBuf + gPasswordCharCount, gPasswordData[3]) + rng[0]) & 0x3FF;
    chk = (chk + rng[1]) & 0x3FF;

    if (gPasswordData[1] != x || gPasswordData[2] != chk)
        return FALSE;

    return TRUE;
}
u16 sub_0809DD7C(u16 const * ch, s8 const * table)
{
    int i = 0;

    while (*table != 0)
    {
        if (*(u16 const *) table == *ch)
            return i;

        table += 2;
        i++;
    }

    return 0xFFFF;
}
void sub_0809DDAC(s8 const * str, s8 const * table)
{
    int i;

    for (i = 0; str[i * 2] != 0; i++)
        gPasswordBuf[i] = sub_0809DD7C((u16 const *)(str + i * 2), table);
}
void InitPassword(int * bitpos, u8 * buf)
{
    gPasswordSeed = gPasswordUnk_02014408;

    sub_0809D880(buf, bitpos, gPasswordInfo.unk_00, 2);
    sub_0809D880(buf, bitpos, gPasswordInfo.unk_01, 1);
    sub_0809D880(buf, bitpos, gPasswordInfo.unk_02, 1);
    sub_0809D880(buf, bitpos, gPasswordInfo.unk_0a, 8);
    sub_0809D880(buf, bitpos, GetGameTime(), 5);
    sub_0809D880(buf, bitpos, gPasswordInfo.unk_03, 3);
    sub_0809D880(buf, bitpos, gPasswordInfo.unk_04, 3);
    sub_0809D880(buf, bitpos, gPasswordInfo.unk_05, 3);
    sub_0809D880(buf, bitpos, gPasswordInfo.unk_06, 3);
    sub_0809D880(buf, bitpos, gPasswordInfo.unk_07, 3);
    sub_0809D880(buf, bitpos, gPasswordInfo.unk_09, 8);
    sub_0809D880(buf, bitpos, gPasswordInfo.unk_08, 6);
    sub_0809D880(buf, bitpos, gPasswordInfo.unk_0c, 10);
    sub_0809D880(buf, bitpos, gPasswordInfo.unk_0e, 6);
    sub_0809D880(buf, bitpos, gPasswordInfo.unk_0f, 6);
    sub_0809D880(buf, bitpos, gPasswordInfo.unk_0b, 8);
    sub_0809D880(buf, bitpos, gPasswordInfo.unk_10, 24);
}
void sub_0809DED8(int * bitpos, u8 * buf)
{
    gPasswordSeed = gPasswordUnk_02014408;

    gPasswordInfo.unk_00 = sub_0809D914(buf, bitpos, 2);
    gPasswordInfo.unk_01 = sub_0809D914(buf, bitpos, 1);
    gPasswordInfo.unk_02 = sub_0809D914(buf, bitpos, 1);
    gPasswordInfo.unk_0a = sub_0809D914(buf, bitpos, 8);
    sub_0809D914(buf, bitpos, 5);
    gPasswordInfo.unk_03 = sub_0809D914(buf, bitpos, 3);
    gPasswordInfo.unk_04 = sub_0809D914(buf, bitpos, 3);
    gPasswordInfo.unk_05 = sub_0809D914(buf, bitpos, 3);
    gPasswordInfo.unk_06 = sub_0809D914(buf, bitpos, 3);
    gPasswordInfo.unk_07 = sub_0809D914(buf, bitpos, 3);
    gPasswordInfo.unk_09 = sub_0809D914(buf, bitpos, 8);
    gPasswordInfo.unk_08 = sub_0809D914(buf, bitpos, 6);
    gPasswordInfo.unk_0c = sub_0809D914(buf, bitpos, 10);
    gPasswordInfo.unk_0e = sub_0809D914(buf, bitpos, 6);
    gPasswordInfo.unk_0f = sub_0809D914(buf, bitpos, 6);
    gPasswordInfo.unk_0b = sub_0809D914(buf, bitpos, 8);
    gPasswordInfo.unk_10 = sub_0809D914(buf, bitpos, 24);
}
int sub_0809DFC4(int chapter_mode, int difficulty)
{
    struct GameRankSaveData buf;
    int r;

    CpuFill16(0, &gPasswordInfo, sizeof(gPasswordInfo));

    if ((u8)LoadRankData(&buf, chapter_mode, difficulty))
    {
        gPasswordInfo.unk_00 = chapter_mode;
        gPasswordInfo.unk_02 = difficulty;
        gPasswordInfo.unk_03 = buf.tactics_rank;
        gPasswordInfo.unk_04 = buf.survival_rank;
        gPasswordInfo.unk_05 = buf.funds_rank;
        gPasswordInfo.unk_06 = buf.exp_rank;
        gPasswordInfo.unk_07 = buf.exp_rank;
        gPasswordInfo.unk_09 = buf.unk00_17;
        gPasswordInfo.unk_08 = buf.unk08_15;
        gPasswordInfo.unk_01 = buf.unk00_16;
        gPasswordInfo.unk_0c = buf.hours;
        gPasswordInfo.unk_0e = buf.minutes;
        gPasswordInfo.unk_0f = buf.seconds;
        gPasswordInfo.unk_10 = buf.gold;
        gPasswordInfo.unk_0a = buf.luckydog;
        gPasswordInfo.unk_0b = buf.cuteguy;
        r = 1;
    }
    else
        r = 0;
    return r;
}
void PrintPassword(struct Text * texts, u8 const * charTable)
{
    int line;
    int i;
    int x;
    u8 str[2];

    str[1] = 0;

    EnableBgSync(BG2_SYNC_BIT);

    for (line = 0; line < 3; line++)
    {
        ClearText(&texts[line]);
        x = 2;
        InitTalkTextFont();

        for (i = 0; i < 14; i++)
        {
            if (line * 14 + i == gPasswordData[3] + gPasswordCharCount)
                return;

            str[0] = charTable[gPasswordBuf[line * 14 + i]];

            PutDrawText(&texts[line], gBg2Tm + TM_OFFSET(4, 7 + line * 3), 1, x, 0, (char const *) str);

            x += 0xB;

            if ((i + 1) % 5 == 0)
                x += 0xB;
        }
    }
}
void sub_0809E15C(int y)
{
    PutNumberOrBlank(gBg2Tm + TM_OFFSET(2, y), 2, gPasswordInfo.unk_00);
    PutNumberOrBlank(gBg2Tm + TM_OFFSET(5, y), 2, gPasswordInfo.unk_02);
    PutNumberOrBlank(gBg2Tm + TM_OFFSET(12, y), 2, gPasswordInfo.unk_0b);
    PutNumberOrBlank(gBg2Tm + TM_OFFSET(17, y), 2, gPasswordInfo.unk_0a);

    PutNumberOrBlank(gBg2Tm + TM_OFFSET(2, y + 2), 2, gPasswordInfo.unk_03);
    PutNumberOrBlank(gBg2Tm + TM_OFFSET(5, y + 2), 2, gPasswordInfo.unk_04);
    PutNumberOrBlank(gBg2Tm + TM_OFFSET(8, y + 2), 2, gPasswordInfo.unk_05);
    PutNumberOrBlank(gBg2Tm + TM_OFFSET(11, y + 2), 2, gPasswordInfo.unk_06);
    PutNumberOrBlank(gBg2Tm + TM_OFFSET(14, y + 2), 2, gPasswordInfo.unk_07);
    PutNumberOrBlank(gBg2Tm + TM_OFFSET(17, y + 2), 2, gPasswordInfo.unk_09);
    PutNumberOrBlank(gBg2Tm + TM_OFFSET(20, y + 2), 2, gPasswordInfo.unk_08);

    PutNumber(gBg2Tm + TM_OFFSET(8, y + 4), 2, gPasswordInfo.unk_10);
    PutNumber(gBg2Tm + TM_OFFSET(12, y + 4), 2, gPasswordInfo.unk_0c);
    PutNumber(gBg2Tm + TM_OFFSET(15, y + 4), 2, gPasswordInfo.unk_0e);
    PutNumber(gBg2Tm + TM_OFFSET(18, y + 4), 2, gPasswordInfo.unk_0f);
}
ASM_FUNC("asm/nonmatching/code_0809E25C.s");
void sub_0809E3A4(void)
{
}
void sub_0809E3A8(struct PasswordProc * proc)
{
    Proc_End(proc->bg);
    SetDispEnable(0, 0, 0, 0, 0);
}
ProcPtr sub_0809E3D8(int a, int b, ProcPtr parent)
{
    struct PasswordProc * proc = Proc_StartBlocking(ProcScr_08CC5AF0, parent);
    proc->unk_30 = a;
    proc->unk_34 = b;
    return proc;
}
void sub_0809E3F4(void)
{
    register u8 * p asm("r0") = &gUnk_0203E790;
    *p = 0;
}
void sub_0809E400(void)
{
}
