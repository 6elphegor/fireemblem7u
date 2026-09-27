#include "gbafe.h"

struct SoundRoomProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2A */ u16 bgYOffset;
    /* 2C */ u16 currentSongTime;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ s8 isSongPlaying;
    /* 31 */ u8 shuffleIndex;
    /* 32 */ s8 currentSongIdx;
    /* 33 */ u8 playableSongs;
    /* 34 */ u8 completionPercent;
    /* 35 */ u8 curIndex;
    /* 36 */ u8 totalSongs;
    /* 37 */ s8 unk_37;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 bgIndex;
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ s8 unk_3c;
    /* 3D */ s8 unk_3d;
    /* 3E */ s8 unk_3e;
    /* 3F */ u8 unk_3f;
    /* 40 */ u32 flags[4];
    /* 50 */ u32 bgFlags[4];
};

struct SoundRoomEnt
{
    /* 00 */ int bgmId;
    /* 04 */ int songLength; // in frames
    /* 08 */ s8 (* displayCondFunc)(ProcPtr proc);
    /* 0C */ int nameTextId;
};

struct VolumeGraphBufferProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
};

struct SoundRoomSpriteDrawProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
};

struct Unknown_08A212DC
{
    u8 x;
    u8 y;
} __attribute__((packed));

struct SoundRoomText
{
    /* 00 */ struct Font font;
    /* 18 */ struct Text text[6];
    /* 48 */ u16 unk_48;
};

extern struct SoundRoomText gSoundRoomText;
extern u8 gSoundRoomVolumeGraphBuffer[][0x31];

extern struct SoundRoomEnt CONST_DATA gSoundRoomTable[];
extern int CONST_DATA gSoundRoomBgTable[];

extern u16 * CONST_DATA gUnknown_08A212D4;
extern void * CONST_DATA gUnknown_08A212D8;
extern struct Unknown_08A212DC * CONST_DATA gUnknown_08A212DC;
extern s8 * CONST_DATA gSoundRoomShuffleBuffer;
extern struct SoundInfo * CONST_DATA gpSoundInfo;

extern struct ProcCmd CONST_DATA gProcScr_SoundRoomSongChange[];
extern struct ProcCmd CONST_DATA gProcScr_VolumeGraphBuffer[];
extern struct ProcCmd CONST_DATA ProcScr_SoundRoomUi[];
extern struct ProcCmd CONST_DATA gProcScr_SoundRoomDrawSprites[];

extern u8 CONST_DATA Img_SoundRoomVolumeGraph[];
extern u16 CONST_DATA Pal_SoundRoomVolumeGraph[];
extern u8 CONST_DATA Img_SoundRoomUiElements[];
extern u16 CONST_DATA Pal_SoundRoomUiElements[];
extern u8 CONST_DATA gUnknown_08A2C908[];
extern u16 CONST_DATA gUnknown_08A01EE4[];
extern u16 CONST_DATA gUnknown_08A01F04[];
extern u8 CONST_DATA gUnknown_08A2C4C8[];
extern u8 CONST_DATA gUnknown_08A2C5A8[];

int CountTotalSoundRoomSongs(void);
int CountSecretSoundRoomSongs(void);
bool IsSoundRoomSongPlayable(struct SoundRoomProc * proc, int flag);
int CountDisplayedSoundRoomSongs(struct SoundRoomProc * proc);
void PlayNextShuffledSong(struct SoundRoomProc * proc);
bool StartSoundRoomSong(struct SoundRoomProc * proc, int index, int flagsMaybe);
void StopSoundRoomSong(struct SoundRoomProc * proc);
void TryDrawSoundRoomSongTitle(struct SoundRoomProc * proc);
void DrawSoundRoomSongTitle(int index);
void InitSoundRoomVolumeGraph(void);
void UpdateVolumeGraphBuffer(int bufferIndex, int value);
void sub_080AB440(struct SoundRoomProc * proc);
int sub_080AB4EC(struct SoundRoomProc * proc);
int sub_080AB548(struct SoundRoomProc * proc);
void sub_080AB5AC(struct SoundRoomProc * proc);
void sub_080AB5DC(struct SoundRoomProc * proc);
void sub_080AB654(struct SoundRoomProc * proc);
void sub_080AB75C(u16 * tm, struct SoundRoomProc * proc);
void TickCurrentSongTime(struct SoundRoomProc * proc);
void sub_080AC2C0(void);
ProcPtr DrawSoundRoomSprites(ProcPtr parent);
void sub_080AC87C(int bg, ProcPtr parent);

bool IsSoundRoomCompleted(struct SoundRoomProc * proc)
{
    if (proc->completionPercent == 100)
        return TRUE;

    return FALSE;
}

bool sub_080AAD78(void)
{
    return FALSE;
}

int CountTotalSoundRoomSongs(void)
{
    int i = 0;

    do
    {
        if (gSoundRoomTable[i].bgmId < 0)
            break;

        i++;
    } while (1);

    return i;
}

int CountSecretSoundRoomSongs(void)
{
    int i = 0;
    int count = 0;

    do
    {
        if (gSoundRoomTable[i].bgmId < 0)
            return count;

        if (gSoundRoomTable[i].displayCondFunc != NULL)
            count++;

        i++;
    } while (1);
}

bool IsSoundRoomSongPlayable(struct SoundRoomProc * proc, int flag)
{
    if ((*(proc->flags + (flag >> 5)) >> (flag & 0x1f)) & 1)
        return TRUE;

    return FALSE;
}

int CountDisplayedSoundRoomSongs(struct SoundRoomProc * proc)
{
    int i = 0;

    int result = 0;

    do
    {
        if (gSoundRoomTable[i].bgmId < 0)
            return result;

        if (gSoundRoomTable[i].displayCondFunc != NULL)
        {
            if ((*(proc->flags + (i >> 5)) >> (i & 0x1f)) & 1)
                result = i + 1;
        }
        else
        {
            result = i + 1;
        }

        i++;

    } while (1);
}

void InitSoundRoomSongData(struct SoundRoomProc * proc)
{
    u32 flags[9];

    proc->totalSongs = CountTotalSoundRoomSongs();
    CpuFill16(0, proc->flags, 0x10);

    proc->playableSongs = 0;

    if (LoadAndVerifySoundRoomData(flags))
    {
        int i;
        for (i = 0; gSoundRoomTable[i].bgmId > -1; i++)
        {
            if (gSoundRoomTable[i].displayCondFunc != NULL)
                continue;

            if ((flags[gSoundRoomTable[i].bgmId >> 5] >> (gSoundRoomTable[i].bgmId & 0x1f)) & 1)
            {
                *(proc->flags + (i >> 5)) |= 1 << (i & 0x1f);
                proc->playableSongs++;
            }
        }

        proc->completionPercent = (proc->playableSongs * 100) / (proc->totalSongs - CountSecretSoundRoomSongs());

        for (i = 0; gSoundRoomTable[i].bgmId > -1; i++)
        {
            if (gSoundRoomTable[i].displayCondFunc == NULL)
                continue;

            if (!((flags[gSoundRoomTable[i].bgmId >> 5] >> (gSoundRoomTable[i].bgmId & 0x1f)) & 1))
            {
                if (!gSoundRoomTable[i].displayCondFunc(proc))
                    continue;
            }

            *(proc->flags + (i >> 5)) |= 1 << (i & 0x1f);
            proc->playableSongs++;
            proc->unk_2e = 1;
        }
    }

    proc->totalSongs = CountDisplayedSoundRoomSongs(proc);
}

void sub_080AAF9C(void)
{
}

void SoundRoomSongChange_FadeOutPrevious(struct Proc * proc)
{
    struct SoundRoomProc * parent = proc->proc_parent;
    CallSomeSoundMaybe(0, 0x100, 0, 0x78, proc);
    parent->unk_3f = 1;
}

void SoundRoomSongChange_StartNext(struct Proc * proc)
{
    struct SoundRoomProc * parent = proc->proc_parent;
    StartSoundRoomSong(parent, gSoundRoomShuffleBuffer[parent->shuffleIndex], 0);
    DrawSoundRoomSongTitle(parent->currentSongIdx);
    sub_080AC87C(sub_080AB4EC(proc->proc_parent), proc->proc_parent);
    parent->unk_3f = 0;
}

void PlayNextShuffledSong(struct SoundRoomProc * proc)
{
    Proc_Start(gProcScr_SoundRoomSongChange, proc);

    proc->shuffleIndex++;

    if ((gSoundRoomShuffleBuffer[proc->shuffleIndex] == -1) || (proc->shuffleIndex == 0x80))
        proc->shuffleIndex = 0;
}

void InitSoundRoomShuffleBuffer(struct SoundRoomProc * proc)
{
    int seed1;
    int seed2;
    int it;
    int i;
    int numAvailableSongs;

    for (i = 0; i < 0x80; i++)
        gSoundRoomShuffleBuffer[i] = -1;

    seed1 = GetGameTime() & 0x7f;
    it = seed1;
    i = 0;

    do
    {
        if ((*(proc->flags - -(it >> 5)) >> (it & 0x1f)) & 1)
        {
            gSoundRoomShuffleBuffer[i] = it;
            i++;
        }

        it = ((it + 1) % 0x80);
    } while (it != seed1);

    numAvailableSongs = i;

    seed2 = GetGameTime() + 0x7b;
    for (i = 0; i < 0x100; i++)
    {
        int idx1;
        int idx2;

        seed2 = ((seed2 * 0xd) + 1) % 0x8000;
        idx1 = (seed2 >> 8) % numAvailableSongs;

        seed2 = ((seed2 * 0xd) + 1) % 0x8000;
        idx2 = (seed2 >> 8) % numAvailableSongs;

        if (idx1 != idx2)
        {
            gSoundRoomShuffleBuffer[idx1] = gSoundRoomShuffleBuffer[idx1] + gSoundRoomShuffleBuffer[idx2];
            gSoundRoomShuffleBuffer[idx2] = gSoundRoomShuffleBuffer[idx1] - gSoundRoomShuffleBuffer[idx2];
            gSoundRoomShuffleBuffer[idx1] = gSoundRoomShuffleBuffer[idx1] - gSoundRoomShuffleBuffer[idx2];
        }
    }

    proc->shuffleIndex = 0;

    if ((*(proc->flags + (proc->curIndex >> 5)) >> (proc->curIndex & 0x1f)) & 1)
    {
        for (; gSoundRoomShuffleBuffer[proc->shuffleIndex] != proc->curIndex; proc->shuffleIndex++)
        {
            if (proc->shuffleIndex == 0x80)
            {
                proc->shuffleIndex = 0;
                goto _080AF0C4;
            }
        }
    }
_080AF0C4:
    proc->isSongPlaying = 1;
    PlayNextShuffledSong(proc);
}

bool SoundRoom_StartNextSong_Positive(struct SoundRoomProc * proc)
{
    u8 idx;

    for (idx = (proc->currentSongIdx + 1) & 0x7f;; idx = (idx + 1), idx &= 0x7f)
    {
        if (!(((*(proc->flags + (idx >> 5))) >> (idx & 0x1f)) & 1))
            continue;

        if (StartSoundRoomSong(proc, idx, 0x20))
        {
            DrawSoundRoomSongTitle(proc->currentSongIdx);
            return TRUE;
        }

        return FALSE;
    }
}

bool SoundRoom_StartNextSong_Negative(struct SoundRoomProc * proc)
{
    u8 idx;

    for (idx = (proc->currentSongIdx - 1) & 0x7f;; idx = (idx - 1), idx &= 0x7f)
    {
        if (!(((*(proc->flags + (idx >> 5))) >> (idx & 0x1f)) & 1))
            continue;

        if (StartSoundRoomSong(proc, idx, 0x20))
        {
            DrawSoundRoomSongTitle(proc->currentSongIdx);
            return TRUE;
        }

        return FALSE;
    }
}

void UpdateVolumeGraphBuffer(int bufferIndex, int value)
{
    int i;

    for (i = 0; i < 0x30; i++)
        gSoundRoomVolumeGraphBuffer[bufferIndex][i] = gSoundRoomVolumeGraphBuffer[bufferIndex][i + 1];

    gSoundRoomVolumeGraphBuffer[bufferIndex][0x30] = value;
}

void InitSoundRoomVolumeGraph(void)
{
    int i;

    for (i = 0; i < 0x31; i++)
    {
        gSoundRoomVolumeGraphBuffer[0][i] = 0;
        gSoundRoomVolumeGraphBuffer[1][i] = 0;
    }

    Decompress(Img_SoundRoomVolumeGraph, (void *)0x06010800);
    ApplyPalettes(Pal_SoundRoomVolumeGraph, 0x1D, 3);
}

void VolumeGraphBuffer_Init(struct VolumeGraphBufferProc * proc)
{
    proc->unk_2c = 0;
}

void VolumeGraphBuffer_Null(void)
{
}

void VolumeGraphBuffer_Loop(struct VolumeGraphBufferProc * proc)
{
    int i;

    u8 r7 = 0;
    u8 r5 = 0;
    u8 r8 = -1;
    u8 ip = -1;

    for (i = 0; i < 0xe0; i++)
    {
        gUnknown_08A212DC[i].x = (u8)(gpSoundInfo->pcmBuffer[PCM_DMA_BUF_SIZE + proc->unk_2c] - 0x80) >> 1;
        gUnknown_08A212DC[i].y = 0xf0 - ((u8)((gpSoundInfo->pcmBuffer[proc->unk_2c]) - 0x80) >> 1);

        r5 = r5 > gUnknown_08A212DC[i].x ? r5 : gUnknown_08A212DC[i].x;
        ip = ip < gUnknown_08A212DC[i].x ? ip : gUnknown_08A212DC[i].x;

        r7 = r7 > gUnknown_08A212DC[i].y ? r7 : gUnknown_08A212DC[i].y;
        r8 = r8 < gUnknown_08A212DC[i].y ? r8 : gUnknown_08A212DC[i].y;

        proc->unk_2c++;
        if (proc->unk_2c >= PCM_DMA_BUF_SIZE)
            proc->unk_2c -= PCM_DMA_BUF_SIZE;
    }

    r5 = (r5 - ip) < 0x3f ? r5 - ip : 0x3f;
    r7 = (r7 - r8) < 0x3f ? r7 - r8 : 0x3f;

    UpdateVolumeGraphBuffer(0, (r5 * 3) / 4);
    UpdateVolumeGraphBuffer(1, (r7 * 3) / 4);
}

bool sub_080AB420(struct SoundRoomProc * proc, int flag)
{
    if ((*(proc->bgFlags + (flag >> 5)) >> (flag & 0x1f)) & 1)
        return TRUE;

    return FALSE;
}

void sub_080AB440(struct SoundRoomProc * proc)
{
    u32 buf[5];
    int i, j;

    CpuFill16(0, proc->bgFlags, 0x10);

    if (LoadAndVerfyLinkArenaStruct2(buf))
    {
        for (i = 0; i < 0x80; i++)
        {
            int bit = (*(buf + (i >> 5)) >> (i & 0x1f)) & 1;

            if (i <= 10)
                bit = 1;

            if (!bit)
                continue;

            for (j = 0; gSoundRoomBgTable[j] >= 0; j++)
            {
                if (gSoundRoomBgTable[j] == i)
                {
                    *(proc->bgFlags + (j >> 5)) |= 1 << (j & 0x1f);
                    break;
                }
            }
        }
    }

    proc->bgIndex = 0xFF;
}

int sub_080AB4EC(struct SoundRoomProc * proc)
{
    int i;

    for (i = (proc->bgIndex + 1) % 0x80;; i++, i %= 0x80)
    {
        if (!((*(proc->bgFlags + (i >> 5)) >> (i & 0x1f)) & 1))
            continue;

        if (proc->bgIndex != i)
        {
            proc->bgIndex = i;
            return gSoundRoomBgTable[i];
        }
    }
}

int sub_080AB548(struct SoundRoomProc * proc)
{
    int i;

    for (i = (GetGameTime() * 0xD + 1) & 0x7F;; i = (i * 0xD + 1) % 0x80)
    {
        if (!((*(proc->bgFlags + (i >> 5)) >> (i & 0x1f)) & 1))
            continue;

        if (proc->bgIndex != i)
        {
            proc->bgIndex = i;
            return gSoundRoomBgTable[i];
        }
    }
}

void sub_080AB5AC(struct SoundRoomProc * proc)
{
    int config = proc->bgYOffset != 0;

    if (proc->bgYOffset / 16 + 5 <= (proc->totalSongs - 1) / 4)
        config |= 2;

    SetUiSpinningArrowConfig(config);
}

void sub_080AB5DC(struct SoundRoomProc * proc)
{
    int x = (proc->curIndex & 3) * 32 + 96;
    int y = (proc->curIndex >> 2) * 16;

    int r2 = (proc->bgYOffset - 64);
    y = y - r2;
    ShowSysHandCursor(x, y, 2, 0x800);
}

s8 sub_080AB604(struct SoundRoomProc * proc)
{
    int adjusted = ((proc->curIndex / 4) * 16 - proc->bgYOffset) / 16;

    if (proc->bgYOffset != 0 && adjusted <= 0)
        return -1;

    if ((proc->bgYOffset / 16) + 5 > (proc->totalSongs - 1) / 4)
        return 0;
    else if (adjusted < 4)
        return 0;
    else
        return +1;
}

void sub_080AB654(struct SoundRoomProc * proc)
{
    int i;
    int color;

    int var = ((proc->bgYOffset >> 4) - 1) * 4;
    TmFill(gBg2Tm, 0);

    for (i = var; i < (var + 28); i++)
    {
        color = 1;

        if (i < 0)
            continue;

        if (i >= proc->totalSongs)
            break;

        if (IsSoundRoomSongPlayable(proc, i))
        {
            color = 0;
        }
        else
        {
            if ((gSoundRoomTable[i].displayCondFunc) != 0)
            {
                PutTwoSpecialChar(
                    gBg2Tm + TM_OFFSET(12 + (i % 4) * 4, (((i / 4) * 2 + 8) & 0x1f)),
                    1, 0x14, 0x14);

                continue;
            }
        }

        if (i >= 99)
            PutNumber(gBg2Tm + TM_OFFSET(13 + (i % 4) * 4, (((i / 4) * 2 + 8) & 0x1f)), color, i + 1);
        else
            sub_080063CC(gBg2Tm + TM_OFFSET(13 + (i % 4) * 4, (((i / 4) * 2 + 8) & 0x1f)), color, i + 1);
    }

    EnableBgSync(BG2_SYNC_BIT);
}

void sub_080AB75C(u16 * tm, struct SoundRoomProc * proc)
{
    PutNumber(tm + 3, (proc->completionPercent == 100) ? 4 : 2, proc->completionPercent);
    PutText(&gSoundRoomText.text[5], tm + 4);
}

void TickCurrentSongTime(struct SoundRoomProc * proc)
{
    if (proc->currentSongTime != 0)
        proc->currentSongTime++;
}

ASM_FUNC("asm/nonmatching/code_080AB79C.s");

ASM_FUNC("asm/nonmatching/code_080ABAB4.s");

ASM_FUNC("asm/nonmatching/code_080ABB00.s");

ASM_FUNC("asm/nonmatching/code_080ABB38.s");

ASM_FUNC("asm/nonmatching/code_080ABB60.s");

ASM_FUNC("asm/nonmatching/code_080ABD4C.s");

ASM_FUNC("asm/nonmatching/code_080ABD7C.s");

ASM_FUNC("asm/nonmatching/code_080ABD90.s");

ASM_FUNC("asm/nonmatching/code_080ABEF4.s");

ASM_FUNC("asm/nonmatching/code_080ABFC8.s");

ASM_FUNC("asm/nonmatching/code_080AC000.s");

ASM_FUNC("asm/nonmatching/code_080AC070.s");

ASM_FUNC("asm/nonmatching/code_080AC084.s");

ASM_FUNC("asm/nonmatching/code_080AC0D0.s");

ASM_FUNC("asm/nonmatching/code_080AC0E4.s");

ASM_FUNC("asm/nonmatching/code_080AC174.s");

ASM_FUNC("asm/nonmatching/code_080AC21C.s");

ASM_FUNC("asm/nonmatching/code_080AC2AC.s");

ASM_FUNC("asm/nonmatching/code_080AC2C0.s");

ASM_FUNC("asm/nonmatching/code_080AC384.s");

ASM_FUNC("asm/nonmatching/code_080AC3F8.s");

ASM_FUNC("asm/nonmatching/code_080AC4C4.s");

ASM_FUNC("asm/nonmatching/code_080AC54C.s");

ASM_FUNC("asm/nonmatching/code_080AC588.s");

ASM_FUNC("asm/nonmatching/code_080AC664.s");

ASM_FUNC("asm/nonmatching/code_080AC66C.s");

ASM_FUNC("asm/nonmatching/code_080AC78C.s");
