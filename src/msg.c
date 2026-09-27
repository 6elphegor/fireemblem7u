#include "gbafe.h"
#include "gbafe/msg.h"

struct MsgBuffer
{
    /* 0000 */ char buffer1[0x400];
    /* 0400 */ char buffer2[0x400];
    /* 0800 */ char buffer3[0x400];
    /* 0C00 */ char buffer4[0x200];
    /* 0E00 */ char buffer5[0x100];
    /* 0F00 */ char buffer6[0x100];
    /* 1000 */ char buffer7[0x100];
};

// Data (not yet in C; FE7U addresses in symbols.ld)
extern struct MsgBuffer sMsgString;
extern int sActiveMsg;
extern char const * CONST_DATA gMsgTable[];

char * GetTacticianName(void);

CONST_DATA char const * gArticleStrTable[][2] = {
    (char const *) 0x08193E1C,
    (char const *) 0x08193E18,
    (char const *) 0x08193E14,
    (char const *) 0x08193E10,
    (char const *) 0x08193E08,
    (char const *) 0x08193E00,
};

char * DecodeMsg(int id)
{
    if (id == sActiveMsg)
        return sMsgString.buffer1;

    DecodeStringRam(gMsgTable[id], sMsgString.buffer1);
    sActiveMsg = id;

    return sMsgString.buffer1;
}

char * DecodeMsgInBuffer(int id, char * buffer)
{
    DecodeStringRam(gMsgTable[id], buffer);
    return buffer;
}

char * MsgExpand(void)
{
    char * src = sMsgString.buffer2;
    char * dst = sMsgString.buffer3;

    StringCopy(src, sMsgString.buffer1);

    while (*src != 0)
    {
        if (*src < 0x20)
        {
            *dst++ = *src++;
        }
        else if (*src != 0x80)
        {
            *dst++ = *src++;
        }
        else
        {
            int slot;

            src++;

            switch (*src)
            {
            case 0x12:
                slot = 0;
                break;

            case 0x13:
                slot = 1;
                break;

            case 0x14:
                slot = 2;
                break;

            case 0x15:
                slot = 3;
                break;

            case 0x20:
                StringCopy(dst, GetTacticianName());
                goto next;

            case 0x22:
                StringCopy(dst, GetItemNameWithArticle(gActionSt.arena_begin_rand_st[0], FALSE) /* TODO: action.h: +06 is the used item */);
                goto next;

            default:
                *dst++ = 0x80;
                *dst++ = *src++;
                continue;
            }

            StringCopy(dst, DecodeMsg(GetCharacterData(gPlaySt.unk1C[slot])->nameTextId));

        next:
            while (*dst != 0)
                dst++;

            src++;
        }
    }

    *dst = 0;
    return sMsgString.buffer3;
}

char const * GetArticle(char const * str, s8 definite, s8 capital)
{
    bool cap = capital != 0;

    if (definite)
        return gArticleStrTable[2][cap];

    switch (str[0])
    {
    case 'A':
    case 'E':
    case 'I':
    case 'O':
    case 'U':
    case 'a':
    case 'e':
    case 'i':
    case 'o':
    case 'u':
        return gArticleStrTable[1][cap];

    default:
        return gArticleStrTable[0][cap];
    }
}

char * StrCopyEnd(char const * src, char * dst)
{
    while (*src != 0)
        *dst++ = *src++;

    *dst = 0;
    return dst;
}

char * MsgExpandWithArticle(u8 useArticle, u8 definite, u8 capital)
{
    char * src = sMsgString.buffer5;
    char * dst = sMsgString.buffer6;
    char * out = sMsgString.buffer7;
    char * str = dst;

    StringCopy(src, sMsgString.buffer1);

    while (*src != 0)
    {
        if (*src < 0x20)
        {
            *dst++ = *src++;
        }
        else if (*src != 0x80)
        {
            *dst++ = *src++;
        }
        else
        {
            src++;

            switch (*src)
            {
            case 0x20:
                StringCopy(dst, GetTacticianName());
                goto next;

            default:
                *dst++ = 0x80;
                *dst++ = *src++;
                continue;
            }

        next:
            while (*dst != 0)
                dst++;

            src++;
        }
    }

    *dst = 0;

    if (useArticle)
    {
        out = StrCopyEnd(GetArticle(str, definite, capital), out);
        StrCopyEnd(str, out);
        return sMsgString.buffer7;
    }

    return sMsgString.buffer6;
}
