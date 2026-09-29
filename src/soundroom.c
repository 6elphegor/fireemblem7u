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

extern const struct SoundRoomEnt gSoundRoomTable[];
extern int CONST_DATA gSoundRoomBgTable[];

extern u16 * CONST_DATA gUnknown_08A212D4;
extern u16 * CONST_DATA gUnknown_08A212D8;
extern struct Unknown_08A212DC * CONST_DATA gUnknown_08A212DC;
extern s8 * CONST_DATA gSoundRoomShuffleBuffer;
extern struct SoundInfo * CONST_DATA gpSoundInfo;

extern const struct ProcCmd gProcScr_SoundRoomSongChange[];
extern const struct ProcCmd gProcScr_VolumeGraphBuffer[];
extern const struct ProcCmd ProcScr_SoundRoomUi[];
extern const struct ProcCmd gProcScr_SoundRoomDrawSprites[];

extern u8 CONST_DATA Img_SoundRoomVolumeGraph[];
extern u16 CONST_DATA Pal_SoundRoomVolumeGraph[];
extern u8 CONST_DATA Img_SoundRoomUiElements[];
extern u16 CONST_DATA Pal_SoundRoomUiElements[];
extern u8 CONST_DATA gUnknown_08A2C908[];
extern u8 CONST_DATA gUnknown_08A2C4C8[];
extern u8 CONST_DATA gUnknown_08A2C5A8[];
extern u8 CONST_DATA gUnknown_08413D90[];
extern char CONST_DATA gUnknown_08418E40[];
extern int CONST_DATA gUnknown_08CE5388;

extern u16 CONST_DATA gSprite_SoundRoom_AButtonPlay[];
extern u16 CONST_DATA gSprite_SoundRoom_StartButtonStop[];
extern u16 CONST_DATA gSprite_SoundRoom_SelectButtonRandom[];
extern u16 CONST_DATA gSprite_RandomModeBanner[];
extern u16 CONST_DATA gSprite_MusicPlayer_SeekBar[];
extern u16 CONST_DATA gSprite_MusicPlayer_SeekBarIndicator[];
extern u16 CONST_DATA gSprite_MusicPlayer_Time[];
extern u16 CONST_DATA gSprite_MusicPlayer_Colon[];
extern u16 * CONST_DATA gSpriteArray_MusicPlayer_TimeNumbers[];

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
            PutNumber2Digit(gBg2Tm + TM_OFFSET(13 + (i % 4) * 4, (((i / 4) * 2 + 8) & 0x1f)), color, i + 1);
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

void SoundRoomUi_Init(struct SoundRoomProc * proc)
{
    InitBgs(NULL);

    ResetTextFont();
    ResetText();

    ApplySystemObjectsGraphics();
    UnpackUiWindowFrameGraphics();
    InitSystemTextFont();

    SetDispEnable(1, 1, 1, 1, 1);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg3_ct.priority = 3;

    SetWinEnable(0, 0, 0);

    SetBlankChr(0);

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);
    TmFill(gBg3Tm, 0);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    proc->curIndex = 0;
    proc->unk_37 = 0;
    proc->bgYOffset = 0;
    proc->unk_3b = 0;
    proc->unk_3c = 0;
    proc->unk_3d = 0;
    proc->unk_3e = 0;
    proc->unk_2f = 0;
    proc->isSongPlaying = 0;
    proc->currentSongIdx = -1;
    proc->unk_2e = 0;
    proc->currentSongTime = 0;
    proc->unk_3f = 0;

    InitSoundRoomSongData(proc);
    sub_080AB440(proc);
    sub_080AC2C0();
    TryDrawSoundRoomSongTitle(proc);
    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x280, 2);

    StartUiSpinningArrows(proc);
    LoadUiSpinningArrowGfx(1, 0x680, 3);
    SetUiSpinningArrowPositions(0x90, 0x38, 0x90, 0x90);

    sub_080AB5AC(proc);
    sub_080AB5DC(proc);
    sub_080AB654(proc);

    Decompress(gUnknown_08A2C908, (void *)0x06004000);
    ApplyPalette(Pal_StatScreenFaceDefault, 4);
    ApplyPalette(Pal_StatScreenFaceGeneric, 5);

    DrawUiFrame2(2, 1, 26, 6, 0);
    DrawUiFrame2(11, 7, 17, 12, 0);
    DrawUiFrame2(2, 11, 9, 8, 0);
    TmApplyTsa_thm(gBg1Tm + TM_OFFSET(2, 11), gUnknown_08A2C4C8, 0x1000);
    DrawUiFrame2(2, 7, 9, 4, 0);
    TmApplyTsa_thm(gBg1Tm + TM_OFFSET(22, 5), gUnknown_08A2C5A8, 0x1000);

    sub_080AB75C(gBg0Tm + TM_OFFSET(22, 5), proc);

    SetBgOffset(0, 0, -2);
    SetBgOffset(2, -4, 0);

    SetWinEnable(1, 0, 0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWin0Box(4, 64, 240, 144);
    SetWOutLayers(1, 1, 0, 1, 1);

    PutCgBackground(gBg3Tm, 0x8000, 8, 8, sub_080AB548(proc));

    Decompress(Img_SoundRoomUiElements, (void *)0x06012000);
    ApplyPalettes(Pal_SoundRoomUiElements, 0x14, 2);

    DrawSoundRoomSprites(proc);

    SetBlendAlpha(15, 3);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    StartGreenText(proc);

    InitSoundRoomVolumeGraph();
    StartParallelWorker(TickCurrentSongTime, proc);
    Proc_Start(gProcScr_VolumeGraphBuffer, proc);
}

bool StartSoundRoomSong(struct SoundRoomProc * proc, int index, int flagsMaybe)
{
    if (MusicProc4Exists())
        return FALSE;

    proc->currentSongIdx = index;
    proc->currentSongTime = 1;
    CallSomeSoundMaybe(gSoundRoomTable[index].bgmId, 0x100, 0x100, flagsMaybe, NULL);

    return TRUE;
}

void StopSoundRoomSong(struct SoundRoomProc * proc)
{
    if (MusicProc4Exists())
        return;

    proc->currentSongTime = 0;
    CallSomeSoundMaybe(0, 0x100, 0, 0x18, NULL);
    proc->unk_2f = 0;
    proc->isSongPlaying = 0;
}

void TryDrawSoundRoomSongTitle(struct SoundRoomProc * proc)
{
    if (IsSoundRoomSongPlayable(proc, proc->curIndex))
        DrawSoundRoomSongTitle(proc->curIndex);
    else
        DrawSoundRoomSongTitle(-1);
}

void SoundRoomUi_Loop_MainKeyHandler(struct SoundRoomProc * proc)
{
    int moveAmt = 0;

    if (proc->unk_37 == 0)
    {
        u16 keys = gpKeySt->repeated;
        proc->unk_38 = 4;

        if (gpKeySt->held & L_BUTTON)
        {
            keys = gpKeySt->held;
            proc->unk_38 = 8;
        }

        if (keys & DPAD_UP)
            moveAmt = -4;

        if (keys & DPAD_DOWN)
            moveAmt = +4;

        if (keys & DPAD_LEFT)
        {
            u32 tmp = proc->curIndex;
            if ((tmp & 3) != 0)
                moveAmt = -1;
        }

        if (keys & DPAD_RIGHT)
        {
            u32 tmp = proc->curIndex;
            if ((tmp & 3) < 3)
                moveAmt = +1;
        }

        if (moveAmt != 0)
        {
            if ((proc->curIndex + moveAmt) < 0)
                return;

            if ((proc->curIndex + moveAmt) >= proc->totalSongs)
                return;

            proc->curIndex += moveAmt;

            TryDrawSoundRoomSongTitle(proc);

            proc->unk_37 = sub_080AB604(proc);

            if (proc->unk_37 != 0)
            {
                if (proc->unk_37 == -1)
                    Proc_Goto(proc, 10);

                if (proc->unk_37 == +1)
                    Proc_Goto(proc, 11);

                sub_080AB654(proc);
            }
            else
            {
                sub_080AB5DC(proc);
            }
        }
    }

    if (proc->unk_37 != 0)
    {
        int tmp;

        proc->bgYOffset = proc->unk_37 * proc->unk_38 + proc->bgYOffset;

        SetBgOffset(2, -4, proc->bgYOffset & 0xff);

        tmp = proc->bgYOffset;
        if ((tmp & 0xf) == 0)
            proc->unk_37 = 0;

        sub_080AB5AC(proc);

        return;
    }

    if (gpKeySt->pressed & R_BUTTON)
    {
        Proc_Goto(proc, 1);
        return;
    }

    if (gpKeySt->pressed & B_BUTTON)
    {
        StopSoundRoomSong(proc);
        return;
    }

    if (gpKeySt->pressed & A_BUTTON)
    {
        if (IsSoundRoomSongPlayable(proc, proc->curIndex))
        {
            if (StartSoundRoomSong(proc, proc->curIndex, 0x20))
                sub_080AC87C(sub_080AB4EC(proc), proc);

            return;
        }

        PlaySoundEffect(0x38C);
        return;
    }

    if (gpKeySt->pressed & SELECT_BUTTON)
    {
        if (MusicProc4Exists())
            return;

        Proc_Goto(proc, 2);

        return;
    }

    if (gpKeySt->pressed & START_BUTTON)
    {
        Proc_Goto(proc, 3);
        return;
    }
}

void SoundRoomUi_RestartTitleMusic(struct SoundRoomProc * proc)
{
    if (!MusicProc4Exists())
    {
        CallSomeSoundMaybe(0x5A, 0, 0xC0, 0x18, NULL);
        Proc_Break(proc);
    }
}

void SoundRoomUi_OnEnd(struct SoundRoomProc * proc)
{
    EndAllProcChildren(proc);
    Proc_EndEach(gProcScr_VolumeGraphBuffer);
}

void sub_080ABD90(struct SoundRoomProc * proc)
{
    proc->unk_3c = -proc->unk_3b / 3;
    proc->unk_3d = (-(proc->unk_3b) * 2) / 3;

    proc->unk_3e = proc->unk_3b;

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);

    sub_080A8838(gUnknown_08A212D4, 0, 0, 1, 2, proc->unk_3c + 1, 26, 6);
    sub_080A8838(gUnknown_08A212D4, 0, 7, 1, proc->unk_3d + 2, 7, 9, 4);
    sub_080A8838(gUnknown_08A212D4, 0, 11, 1, proc->unk_3d + 2, 11, 9, 8);
    sub_080A8838(gUnknown_08A212D4, 10, 7, 1, proc->unk_3e + 11, 7, 17, 12);
    sub_080A8838(gUnknown_08A212D4, 10, 19, 1, proc->unk_3e + 22, 5, 6, 3);

    sub_080A8838(gUnknown_08A212D8, 12, 0, 2, proc->unk_3e + 12, 0, 16, 32);
    sub_080A8838(gUnknown_08A212D8, 0, 0, 0, proc->unk_3e + 22, 5, 6, 2);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}

void SoundRoomUi_80AFBBC(struct SoundRoomProc * proc)
{
    proc->unk_3b = 0;

    PutUiWindowFrame(gUnknown_08A212D4, 0, 0, 26, 6, 0, 0);
    PutUiWindowFrame(gUnknown_08A212D4, 0, 7, 9, 4, 0, 0);
    TmApplyTsa_thm(gUnknown_08A212D4 + TM_OFFSET(0, 11), gUnknown_08A2C4C8, 0x1000);
    PutUiWindowFrame(gUnknown_08A212D4, 10, 7, 17, 12, 0, 0);
    TmApplyTsa_thm(gUnknown_08A212D4 + TM_OFFSET(10, 19), gUnknown_08A2C5A8, 0x1000);

    CpuFastCopy(gBg2Tm, gUnknown_08A212D8, 0x800);

    sub_080AB75C(gUnknown_08A212D8, proc);

    TmApplyTsa_thm(gUnknown_08A212D4 + TM_OFFSET(0, 25), gUnknown_08413D90, 0x1000);

    HideSysHandCursor();
    SetUiSpinningArrowConfig(0);

    proc->unk_3a = 0;
}

void SoundRoomUi_Loop_MainUiSlideOut(struct SoundRoomProc * proc)
{
    int tmp;

    proc->unk_3a++;

    tmp = ((proc->unk_3a * 2 + proc->unk_3a) << 3) * proc->unk_3a;

    proc->unk_3b = tmp >> 6;

    sub_080ABD90(proc);

    if (proc->unk_3b == 24)
        Proc_Break(proc);
}

void SoundRoomUi_80AFC98(struct SoundRoomProc * proc)
{
    if (gpKeySt->pressed & (A_BUTTON | SELECT_BUTTON))
    {
        sub_080AC87C(sub_080AB4EC(proc), proc);
        return;
    }

    if (gpKeySt->pressed & DPAD_LEFT)
    {
        SoundRoom_StartNextSong_Positive(proc);
        return;
    }

    if (gpKeySt->pressed & DPAD_RIGHT)
    {
        SoundRoom_StartNextSong_Negative(proc);
        return;
    }

    if (gpKeySt->pressed & (B_BUTTON | R_BUTTON | L_BUTTON))
    {
        Proc_Break(proc);
        return;
    }

    if (gpKeySt->pressed & START_BUTTON)
    {
        Proc_Goto(proc, 3);
        return;
    }
}

void SoundRoomUi_80AFCE4(struct SoundRoomProc * proc)
{
    TryDrawSoundRoomSongTitle(proc);
    proc->unk_3a = 0;
}

void SoundRoomUi_Loop_MainUiSlideIn(struct SoundRoomProc * proc)
{
    int tmp;

    proc->unk_3a++;

    tmp = 8 - proc->unk_3a;
    tmp = (((tmp) * 2 + (tmp)) << 3) * tmp;

    proc->unk_3b = (tmp / 64);

    sub_080ABD90(proc);

    if (proc->unk_3b == 0)
    {
        sub_080AB5DC(proc);
        sub_080AB5AC(proc);
        Proc_Break(proc);
    }
}

void SoundRoomUi_80AFD48(struct SoundRoomProc * proc)
{
    proc->unk_3a = 0;
    proc->currentSongTime = 0;
    InitSoundRoomShuffleBuffer(proc);
}

void SoundRoomUi_Loop_ShufflePlayUiSlideIn(struct SoundRoomProc * proc)
{
    int tmp;

    proc->unk_3a++;

    tmp = 8 - proc->unk_3a;
    tmp = (((tmp) * 2 + (tmp)) << 3) * tmp;

    proc->unk_3b = 0x18 - (tmp / 0x40);

    proc->unk_3c = 0x14 - (proc->unk_3b / 3);

    TmFill(gBg1Tm, 0);

    sub_080A8838(gUnknown_08A212D4, 0, 25, 1, 2, proc->unk_3c + 1, 26, 7);

    EnableBgSync(BG1_SYNC_BIT);

    if (proc->unk_3b == 24)
    {
        proc->unk_3a = 0;
        Proc_Break(proc);
    }
}

void SoundRoomUi_Loop_ShufflePlayKeyHandler(struct SoundRoomProc * proc)
{
    if (proc->unk_3f != 0)
        return;

    if (proc->isSongPlaying != 0)
    {
        if (proc->currentSongTime >= (gSoundRoomTable[proc->currentSongIdx].songLength))
        {
            PlayNextShuffledSong(proc);
            return;
        }
    }

    if (gpKeySt->pressed & DPAD_RIGHT)
    {
        SoundRoom_StartNextSong_Positive(proc);
        return;
    }

    if (gpKeySt->pressed & DPAD_LEFT)
    {
        SoundRoom_StartNextSong_Negative(proc);
        return;
    }

    if (gpKeySt->pressed & (B_BUTTON | SELECT_BUTTON))
    {
        Proc_Break(proc);
        return;
    }

    if (gpKeySt->pressed & A_BUTTON)
    {
        sub_080AC87C(sub_080AB4EC(proc), proc);
        return;
    }

    if (gpKeySt->pressed & START_BUTTON)
        Proc_Goto(proc, 3);
}

void SoundRoomUi_Loop_ShufflePlayUiSlideOut(struct SoundRoomProc * proc)
{
    int tmp;

    proc->unk_3a++;

    tmp = 8 - proc->unk_3a;
    tmp = (((tmp) * 2 + (tmp)) << 3) * tmp;

    proc->unk_3b = (tmp / 0x40);

    proc->unk_3c = 20 - (proc->unk_3b / 3);

    TmFill(gBg1Tm, 0);

    sub_080A8838(gUnknown_08A212D4, 0, 25, 1, 2, proc->unk_3c + 1, 26, 7);

    EnableBgSync(BG1_SYNC_BIT);

    if (proc->unk_3b == 0)
    {
        proc->isSongPlaying = 0;
        Proc_Break(proc);
    }
}

ProcPtr StartSoundRoomScreen(ProcPtr parent)
{
    return Proc_StartBlocking(ProcScr_SoundRoomUi, parent);
}

void sub_080AC2C0(void)
{
    int i;

    u32 vram = 0x06014000;

    InitSpriteTextFont(&gSoundRoomText.font, (void *)vram, 5);

    ApplyPalettes(Pal_Text, 0x1A, 2);
    gPal[0x1A * 0x10] = 0;

    EnablePalSync();

    SetTextFont(&gSoundRoomText.font);
    InitSpriteText(&gSoundRoomText.text[0]);
    InitSpriteText(&gSoundRoomText.text[1]);

    for (i = 0; i < 3; i++)
        InitSpriteText(&gSoundRoomText.text[2 + i]);

    SetTextFont(NULL);

    gSoundRoomText.unk_48 = (((0x1FFFF & vram) >> 5) & 0x3FF) + 0xA000;

    SetTextFont(NULL);
    SetTextFontGlyphs(0);

    InitText(&gSoundRoomText.text[5], 2);
    ClearText(&gSoundRoomText.text[5]);
    Text_SetCursor(&gSoundRoomText.text[5], 1);
    Text_DrawString(&gSoundRoomText.text[5], gUnknown_08418E40);
}

void DrawSoundRoomSongTitle(int index)
{
    const char * str;

    if (index == -1)
        str = DecodeMsg(gUnknown_08CE5388);
    else
        str = DecodeMsg(gSoundRoomTable[index].nameTextId);

    SetTextFont(&gSoundRoomText.font);
    SetTextFontGlyphs(1);

    SpriteText_DrawBackgroundExt(&gSoundRoomText.text[0], 0);

    Text_SetCursor(&gSoundRoomText.text[0], GetStringTextCenteredPos(160, str));
    Text_SetColor(&gSoundRoomText.text[0], 0);
    Text_DrawString(&gSoundRoomText.text[0], str);

    SetTextFont(NULL);
}

void sub_080AC3F8(int y, u16 unk)
{
    int i;

    if (unk > 32)
    {
        y = OAM0_Y(y);

        SetObjAffine(
            0,
            Div(+COS_Q12(0) * 16, 256),
            Div(-SIN_Q12(0) * 16, unk),
            Div(+SIN_Q12(0) * 16, 256),
            Div(+COS_Q12(0) * 16, unk));

        for (i = 0; i < 5; i++)
            PutSpriteExt(4, 40 + i * 32, y + 256, Sprite_32x16, i * 4 + gSoundRoomText.unk_48 + 0x1000);
    }
}

void DrawSoundRoomVolumeGraphSprites(int x, int y, int c, int d)
{
    int count = 0;
    int pal = 0xd;

    if (d == 0)
        return;

    y = OAM0_Y(y);

    if (c > 7)
    {
        int x_ = x;

        for (; c > 7;)
        {
            c -= 8;

            PutSpriteExt(0, OAM1_X(x_), y, Sprite_8x8, (pal << 12) + 0x47 + 0x800);

            x_ += 8;
            count++;

            if (count > 2)
                pal = 0xe;

            if (count > 4)
                pal = 0xf;
        }
    }

    PutSpriteExt(0, OAM1_X(count * 8 + x), y, Sprite_8x8, c + (pal << 12) + 0x40 + 0x800);
}

void sub_080AC54C(struct SoundRoomSpriteDrawProc * proc)
{
    int i;

    struct SoundRoomProc * parent = proc->proc_parent;

    u8 * ptr = gSoundRoomVolumeGraphBuffer[0];
    ptr += 0x30;

    for (i = 0; i < 2; i++)
    {
        int a = ptr[i * 0x31];

        DrawSoundRoomVolumeGraphSprites(parent->unk_3d * 8 + 24, 64 + i * 8, a, a);
    }
}

void DrawMusicPlayerTime(int x, int y, int time)
{
    int seconds = time / 60;
    int minutes = seconds / 60;
    int secondsIntoMin = seconds % 60;

    PutSpriteExt(0, x, y, gSprite_MusicPlayer_Time, 0x4000);
    PutSpriteExt(0, x + 40, y, gSpriteArray_MusicPlayer_TimeNumbers[minutes], 0x4000);
    PutSpriteExt(0, x + 48, y, gSprite_MusicPlayer_Colon, 0x4000);

    if (secondsIntoMin >= 10)
        PutSpriteExt(0, x + 56, y, gSpriteArray_MusicPlayer_TimeNumbers[secondsIntoMin / 10], 0x4000);
    else
        PutSpriteExt(0, x + 56, y, gSpriteArray_MusicPlayer_TimeNumbers[0], 0x4000);

    PutSpriteExt(0, x + 64, y, gSpriteArray_MusicPlayer_TimeNumbers[secondsIntoMin % 10], 0x4000);
}

void SoundRoom_DrawSprites_Init(struct SoundRoomSpriteDrawProc * proc)
{
    proc->unk_2c = 0;
}

void SoundRoom_DrawSprites_Loop(struct SoundRoomSpriteDrawProc * proc)
{
    struct SoundRoomProc * parent = proc->proc_parent;

    sub_080AC3F8(parent->unk_3c * 8 + 24, 0x100);

    if (parent->isSongPlaying != 0)
    {
        int y = OAM0_Y(parent->unk_3c * 8 + 48);

        PutSpriteExt(0, 4, OAM0_Y((12 - parent->unk_3c) * 8 + 4) + 0x400, gSprite_RandomModeBanner, 0x5000);

        PutSpriteExt(0, 136, OAM0_Y(y + 1), gSprite_MusicPlayer_SeekBar, 0x4000);

        PutSpriteExt(
            0, parent->currentSongTime * 66 / (gSoundRoomTable[parent->currentSongIdx].songLength + 120) + 136, y,
            gSprite_MusicPlayer_SeekBarIndicator, 0x4000);

        DrawMusicPlayerTime(60, y, parent->currentSongTime);
    }

    PutSprite(0xb, OAM1_X(parent->unk_3d * 8 + 22), 88, gSprite_SoundRoom_AButtonPlay, 0x4000);
    PutSprite(0xb, OAM1_X(parent->unk_3d * 8 + 22), 104, gSprite_SoundRoom_StartButtonStop, 0x4000);
    PutSprite(0xb, OAM1_X(parent->unk_3d * 8 + 22), 120, gSprite_SoundRoom_SelectButtonRandom, 0x4000);

    sub_080AC54C(proc);
}

ProcPtr DrawSoundRoomSprites(ProcPtr parent)
{
    return Proc_Start(gProcScr_SoundRoomDrawSprites, parent);
}

struct SoundRoomBgProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 timer;
    /* 4E */ STRUCT_PAD(0x4E, 0x58);
    /* 58 */ int bg;
};

extern const struct ProcCmd ProcScr_08CE5704[];

void sub_080AC7A0(struct SoundRoomBgProc * proc)
{
    proc->timer = 0;
    ArchiveCurrentPalettes();
}
void sub_080AC7B0(struct SoundRoomBgProc * proc)
{
    int val = 0x100 - (proc->timer++ << 4);

    WriteFadedPaletteFromArchive(val, val, val, 0xFF00);

    if (val == 0)
        Proc_Break(proc);
}
void sub_080AC7E8(struct SoundRoomBgProc * proc)
{
    PutCgBackground(gBg3Tm, 0x8000, 8, 8, proc->bg);
    ArchiveCurrentPalettes();
    WriteFadedPaletteFromArchive(0, 0, 0, 0xFF00);
    EnableBgSync(BG3_SYNC_BIT);
    proc->timer = 0;
}
void sub_080AC82C(struct SoundRoomBgProc * proc)
{
    int val = proc->timer++ << 4;

    WriteFadedPaletteFromArchive(val, val, val, 0xFF00);

    if (val == 0x100)
        Proc_Break(proc);
}
bool sub_080AC860(void)
{
    if (Proc_Find(ProcScr_08CE5704) != NULL)
        return TRUE;

    return FALSE;
}
void sub_080AC87C(int bg, ProcPtr parent)
{
    struct SoundRoomBgProc * proc;

    if (!sub_080AC860())
    {
        proc = Proc_Start(ProcScr_08CE5704, parent);
        proc->bg = bg;
    }
}

SECTION(".rodata.08CE5490")
const struct ProcCmd gProcScr_SoundRoomSongChange[] = {
    PROC_CALL(SoundRoomSongChange_FadeOutPrevious),
    PROC_SLEEP(0),
    PROC_CALL(SoundRoomSongChange_StartNext),
    PROC_END,
};

SECTION(".rodata.08CE54B4")
const struct ProcCmd gProcScr_VolumeGraphBuffer[] = {
    PROC_SLEEP(0),
    PROC_CALL(VolumeGraphBuffer_Init),
    PROC_SLEEP(0),
    PROC_CALL(VolumeGraphBuffer_Null),
    PROC_REPEAT(VolumeGraphBuffer_Loop),
    PROC_END,
};

SECTION(".rodata.08CE54E4")
const struct ProcCmd ProcScr_SoundRoomUi[] = {
    PROC_SLEEP(0),
    PROC_CALL(SoundRoomUi_Init),
    PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),
    PROC_WHILE(MusicProc4Exists),
    PROC_LABEL(0),
    PROC_REPEAT(SoundRoomUi_Loop_MainKeyHandler),
    PROC_LABEL(1),
    PROC_CALL(SoundRoomUi_80AFBBC),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideOut),
    PROC_REPEAT(SoundRoomUi_80AFC98),
    PROC_CALL(SoundRoomUi_80AFCE4),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideIn),
    PROC_GOTO(0),
    PROC_LABEL(2),
    PROC_CALL(SoundRoomUi_80AFBBC),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideOut),
    PROC_CALL(SoundRoomUi_80AFD48),
    PROC_REPEAT(SoundRoomUi_Loop_ShufflePlayUiSlideIn),
    PROC_SLEEP(16),
    PROC_REPEAT(SoundRoomUi_Loop_ShufflePlayKeyHandler),
    PROC_REPEAT(SoundRoomUi_Loop_ShufflePlayUiSlideOut),
    PROC_CALL(SoundRoomUi_80AFCE4),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideIn),
    PROC_SLEEP(16),
    PROC_GOTO(0),
    PROC_LABEL(3),
    PROC_WHILE(sub_080AC860),
    PROC_REPEAT(SoundRoomUi_RestartTitleMusic),
    PROC_CALL_ARG(NewFadeOut, 4),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(SoundRoomUi_OnEnd),
    PROC_SLEEP(0),
    PROC_END,
};

SECTION(".rodata.08CE56E4")
const struct ProcCmd gProcScr_SoundRoomDrawSprites[] = {
    PROC_SLEEP(0),
    PROC_CALL(SoundRoom_DrawSprites_Init),
    PROC_REPEAT(SoundRoom_DrawSprites_Loop),
    PROC_END,
};

SECTION(".rodata.08CE5704")
const struct ProcCmd ProcScr_08CE5704[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_080AC7A0),
    PROC_REPEAT(sub_080AC7B0),
    PROC_CALL(sub_080AC7E8),
    PROC_REPEAT(sub_080AC82C),
    PROC_END,
};

SECTION(".rodata.08CE4D28")
const struct SoundRoomEnt gSoundRoomTable[] = {
    { .bgmId = 0x5C, .songLength = 0x10E0, .nameTextId = 0x12D3 },
    { .bgmId = 0x5A, .songLength = 0x2724, .nameTextId = 0x12D4 },
    { .bgmId = 0x25, .songLength = 0x9D8, .nameTextId = 0x12D5 },
    { .bgmId = 0x26, .songLength = 0x10E0, .nameTextId = 0x12D6 },
    { .bgmId = 0x27, .songLength = 0xF00, .nameTextId = 0x12D7 },
    { .bgmId = 0x30, .songLength = 0xE10, .nameTextId = 0x12D8 },
    { .bgmId = 1, .songLength = 0xE10, .nameTextId = 0x12D9 },
    { .bgmId = 2, .songLength = 0x12FC, .nameTextId = 0x12DA },
    { .bgmId = 3, .songLength = 0xEC4, .nameTextId = 0x12DB },
    { .bgmId = 0xA, .songLength = 0xE4C, .nameTextId = 0x12DC },
    { .bgmId = 0xB, .songLength = 0xF3C, .nameTextId = 0x12DD },
    { .bgmId = 4, .songLength = 0x1608, .nameTextId = 0x12DE },
    { .bgmId = 9, .songLength = 0xA8C, .nameTextId = 0x12DF },
    { .bgmId = 8, .songLength = 0xA14, .nameTextId = 0x12E0 },
    { .bgmId = 5, .songLength = 0x11D0, .nameTextId = 0x12E1 },
    { .bgmId = 6, .songLength = 0xEC4, .nameTextId = 0x12E2 },
    { .bgmId = 7, .songLength = 0xEC4, .nameTextId = 0x12E3 },
    { .bgmId = 0xC, .songLength = 0xF3C, .nameTextId = 0x12E4 },
    { .bgmId = 0xD, .songLength = 0x12C0, .nameTextId = 0x12E5 },
    { .bgmId = 0xE, .songLength = 0x11D0, .nameTextId = 0x12E6 },
    { .bgmId = 0x10, .songLength = 0x17E8, .nameTextId = 0x12E7 },
    { .bgmId = 0xF, .songLength = 0x10A4, .nameTextId = 0x12E8 },
    { .bgmId = 0x11, .songLength = 0xAC8, .nameTextId = 0x12E9 },
    { .bgmId = 0x12, .songLength = 0xD98, .nameTextId = 0x12EA },
    { .bgmId = 0x13, .songLength = 0x102C, .nameTextId = 0x12EB },
    { .bgmId = 0x1F, .songLength = 0x7F8, .nameTextId = 0x12EC },
    { .bgmId = 0x20, .songLength = 0x690, .nameTextId = 0x12ED },
    { .bgmId = 0x14, .songLength = 0x528, .nameTextId = 0x12EE },
    { .bgmId = 0x15, .songLength = 0xAC8, .nameTextId = 0x12EF },
    { .bgmId = 0x16, .songLength = 0x690, .nameTextId = 0x12F0 },
    { .bgmId = 0x17, .songLength = 0xE10, .nameTextId = 0x12F1 },
    { .bgmId = 0x18, .songLength = 0xB40, .nameTextId = 0x12F2 },
    { .bgmId = 0x1C, .songLength = 0x3C0, .nameTextId = 0x12F3 },
    { .bgmId = 0x19, .songLength = 0x2D0, .nameTextId = 0x12F4 },
    { .bgmId = 0x1A, .songLength = 0x2D0, .nameTextId = 0x12F5 },
    { .bgmId = 0x1D, .songLength = 0x438, .nameTextId = 0x12F6 },
    { .bgmId = 0x1E, .songLength = 0x3C0, .nameTextId = 0x12F7 },
    { .bgmId = 0x1B, .songLength = 0x780, .nameTextId = 0x12F8 },
    { .bgmId = 0x32, .songLength = 0x17AC, .nameTextId = 0x12F9 },
    { .bgmId = 0x33, .songLength = 0xD5C, .nameTextId = 0x12FA },
    { .bgmId = 0x22, .songLength = 0x10E0, .nameTextId = 0x12FB },
    { .bgmId = 0x4E, .songLength = 0x780, .nameTextId = 0x12FC },
    { .bgmId = 0x4F, .songLength = 0xD20, .nameTextId = 0x12FD },
    { .bgmId = 0x6B, .songLength = 0x474, .nameTextId = 0x12FE },
    { .bgmId = 0x41, .songLength = 0x9D8, .nameTextId = 0x12FF },
    { .bgmId = 0x42, .songLength = 0x6CC, .nameTextId = 0x1300 },
    { .bgmId = 0x43, .songLength = 0x780, .nameTextId = 0x1301 },
    { .bgmId = 0x44, .songLength = 0x8E8, .nameTextId = 0x1302 },
    { .bgmId = 0x4C, .songLength = 0x8E8, .nameTextId = 0x1303 },
    { .bgmId = 0x40, .songLength = 0xE4C, .nameTextId = 0x1304 },
    { .bgmId = 0x21, .songLength = 0xC30, .nameTextId = 0x1305 },
    { .bgmId = 0x51, .songLength = 0xEC4, .nameTextId = 0x1306 },
    { .bgmId = 0x34, .songLength = 0x13B0, .nameTextId = 0x1307 },
    { .bgmId = 0x37, .songLength = 0x120C, .nameTextId = 0x1308 },
    { .bgmId = 0x3C, .songLength = 0xE4C, .nameTextId = 0x1309 },
    { .bgmId = 0x5D, .songLength = 0x1068, .nameTextId = 0x130A },
    { .bgmId = 0x52, .songLength = 0x9D8, .nameTextId = 0x130B },
    { .bgmId = 0x50, .songLength = 0xD20, .nameTextId = 0x130C },
    { .bgmId = 0x4A, .songLength = 0xB04, .nameTextId = 0x130D },
    { .bgmId = 0x3B, .songLength = 0xAC8, .nameTextId = 0x130E },
    { .bgmId = 0x53, .songLength = 0xC30, .nameTextId = 0x130F },
    { .bgmId = 0x23, .songLength = 0x13B0, .nameTextId = 0x1310 },
    { .bgmId = 0x24, .songLength = 0x1284, .nameTextId = 0x1311 },
    { .bgmId = 0x35, .songLength = 0x8E8, .nameTextId = 0x1312 },
    { .bgmId = 0x36, .songLength = 0x7BC, .nameTextId = 0x1313 },
    { .bgmId = 0x38, .songLength = 0xB7C, .nameTextId = 0x1314 },
    { .bgmId = 0x39, .songLength = 0xF00, .nameTextId = 0x1315 },
    { .bgmId = 0x45, .songLength = 0x111C, .nameTextId = 0x1316 },
    { .bgmId = 0x6E, .songLength = 0x708, .nameTextId = 0x1317 },
    { .bgmId = 0x3F, .songLength = 0xEC4, .nameTextId = 0x1318 },
    { .bgmId = 0x54, .songLength = 0xDD4, .nameTextId = 0x1319 },
    { .bgmId = 0x4B, .songLength = 0xF78, .nameTextId = 0x131A },
    { .bgmId = 0x3D, .songLength = 0xB04, .nameTextId = 0x131B },
    { .bgmId = 0x56, .songLength = 0xC30, .nameTextId = 0x131C },
    { .bgmId = 0x57, .songLength = 0xD5C, .nameTextId = 0x131D },
    { .bgmId = 0x3E, .songLength = 0xCA8, .nameTextId = 0x131E },
    { .bgmId = 0x58, .songLength = 0xEC4, .nameTextId = 0x131F },
    { .bgmId = 0x3A, .songLength = 0x11D0, .nameTextId = 0x1320 },
    { .bgmId = 0x68, .songLength = 0x12FC, .nameTextId = 0x1321 },
    { .bgmId = 0x69, .songLength = 0x7BC, .nameTextId = 0x1322 },
    { .bgmId = 0x6A, .songLength = 0xB40, .nameTextId = 0x1323 },
    { .bgmId = 0x49, .songLength = 0xB7C, .nameTextId = 0x1324 },
    { .bgmId = 0x4D, .songLength = 0x438, .nameTextId = 0x1325 },
    { .bgmId = 0x46, .songLength = 0x8E8, .nameTextId = 0x1326 },
    { .bgmId = 0x5E, .songLength = 0x348, .nameTextId = 0x1327 },
    { .bgmId = 0x47, .songLength = 0x438, .nameTextId = 0x1328 },
    { .bgmId = 0x48, .songLength = 0x2D0, .nameTextId = 0x1329 },
    { .bgmId = 0x2D, .songLength = 0x12C, .nameTextId = 0x132A },
    { .bgmId = 0x2E, .songLength = 0x780, .nameTextId = 0x132B },
    { .bgmId = 0x2C, .songLength = 0x5A0, .nameTextId = 0x132C },
    { .bgmId = 0x2B, .songLength = 0x618, .nameTextId = 0x132D },
    { .bgmId = 0x73, .songLength = 0x21C0, .nameTextId = 0x132E },
    { .bgmId = 0x29, .songLength = 0xAC8, .nameTextId = 0x132F },
    { .bgmId = 0x2A, .songLength = 0x5154, .nameTextId = 0x1330 },
    {
        .bgmId = 0x70,
        .songLength = 0x1248,
        .displayCondFunc = (void *) sub_080AAD78,
        .nameTextId = 0x1331,
    },
    {
        .bgmId = 0x71,
        .songLength = 0xE4C,
        .displayCondFunc = (void *) sub_080AAD78,
        .nameTextId = 0x1332,
    },
    {
        .bgmId = 0x72,
        .songLength = 0xD20,
        .displayCondFunc = (void *) IsSoundRoomCompleted,
        .nameTextId = 0x1333,
    },
    {
        .bgmId = 0x74,
        .songLength = 0x2184,
        .displayCondFunc = (void *) sub_080AAD78,
        .nameTextId = 0x1334,
    },
    {
        .bgmId = 0x75,
        .songLength = 0xBF4,
        .displayCondFunc = (void *) sub_080AAD78,
        .nameTextId = 0x1335,
    },
    {
        .bgmId = 0x76,
        .songLength = 0xF00,
        .displayCondFunc = (void *) sub_080AAD78,
        .nameTextId = 0x1336,
    },
    { .bgmId = -1 },
};
