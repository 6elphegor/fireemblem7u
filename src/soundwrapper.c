#include "gbafe.h"

struct SoundSt {
    /* 00 */ u8 filler0[2];
    /* 02 */ u16 unk2;
    /* 04 */ u16 songId;
    /* 06 */ s8 is_song_playing;
    /* 07 */ s8 unk7;
    /* 08 */ s8 maxChannels;
};

extern struct SoundSt gSoundSt;

extern struct Proc * sMusicProc1;
extern struct Proc * sMusicProc2;

struct MusicProc {
    PROC_HEADER;
    /* 29 */ u8 pad29;
    /* 2A */ s16 filler2A[16];
    /* 4A */ s16 songId;
    /* 4C */ s16 delayCounter;
    /* 4E */ s16 unk4E;
    /* 50 */ s16 filler50[2];
    /* 54 */ struct MusicPlayerInfo * player;
    /* 58 */ s32 unk58;
    /* 5C */ s32 unk5C;
    /* 60 */ s16 filler60[2];
    /* 64 */ s16 vc_init_volume;
    /* 66 */ s16 vc_end_volume;
    /* 68 */ s16 vc_clock;
    /* 6A */ s16 vc_time_end;
};

extern struct MusicPlayerInfo gMPlayInfo_BGM1;
extern struct MusicPlayerInfo gMPlayInfo_BGM2;
extern struct MusicPlayerInfo gMPlayInfo_SE1;
extern struct MusicPlayerInfo gMPlayInfo_SE2;
extern struct MusicPlayerInfo gMPlayInfo_SE3;
extern struct MusicPlayerInfo gMPlayInfo_SE4;
extern struct MusicPlayerInfo gMPlayInfo_SE5;
extern struct MusicPlayerInfo gMPlayInfo_SE6;
extern struct MusicPlayerInfo gMPlayInfo_SE7;

void m4aMPlayFadeOut(struct MusicPlayerInfo * mplayInfo, u16 speed);
void m4aMPlayFadeOutPause(struct MusicPlayerInfo * mplayInfo, u16 speed);
void m4aMPlayFadeInContinue(struct MusicPlayerInfo * mplayInfo, u16 speed);
void m4aMPlayImmInit(struct MusicPlayerInfo * mplayInfo);
void MPlayStop_rev01(struct MusicPlayerInfo * mplayInfo);
void MPlayStart_rev01(struct MusicPlayerInfo * mplayInfo, struct SongHeader * songHeader);
void SoundMode_rev01(u32 mode);

int GetCurrentBgmSong(void);
s8 IsBgmPlaying(void);
void SetBgmVolume(int volume);
void FadeBgmOut(int speed);
void PlaySongDelayed(int songId, int delay, struct MusicPlayerInfo * player);
void PlaySongCore(int songId, struct MusicPlayerInfo * player);
void Sound_SetDefaultMaxNumChannels(void);
void Sound_SetMaxNumChannels(int maxchn);
void Sound_UpdateMaxChannelsForSong(int songId);
void StartBgmVolumeChange(int volume, int b, int c, ProcPtr parent);
void DeleteAll6CWaitMusicRelated(void);

void DelaySong_OnLoop(struct MusicProc * proc);
void MusicChange_StartBgm(struct MusicProc * proc);
void MusicChange_StartVolumeChange(struct MusicProc * proc);
void MusicFi_OnLoop(struct MusicProc * proc);
void MusicVc_OnLoop(struct MusicProc * proc);

CONST_DATA struct ProcCmd ProcScr_MusicFadeIn[] = {
    PROC_END_DUPLICATES,
    PROC_REPEAT(MusicFi_OnLoop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_MusicVolumeChange[] = {
    PROC_YIELD,
    PROC_REPEAT(MusicVc_OnLoop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_08B85854[] = {
    PROC_REPEAT(DelaySong_OnLoop),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_MusicChange[] = {
    PROC_SLEEP(1),
    PROC_CALL(MusicChange_StartVolumeChange),
    PROC_SLEEP(1),
    PROC_CALL(MusicChange_StartBgm),
    PROC_SLEEP(8),
    PROC_LABEL(0),
    PROC_YIELD,
    PROC_END,
};

int GetCurrentBgmSong(void)
{
    return gSoundSt.songId;
}

s8 IsBgmPlaying(void)
{
    return gSoundSt.is_song_playing;
}

void Sound_SetBGMVolume(int volume)
{
    MPlayVolumeControl(&gMPlayInfo_SE1, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_SE2, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_SE3, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_SE4, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_SE5, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_SE6, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_SE7, 0xFFFF, volume);
}

void SetBgmVolume(int volume)
{
    MPlayVolumeControl(&gMPlayInfo_BGM1, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_BGM2, 0xFFFF, volume);
}

void FadeBgmOut(int speed)
{
    if (speed < 0)
        speed = 6;
    if (sMusicProc1 != NULL)
    {
        Proc_Break(sMusicProc1);
        sMusicProc1 = NULL;
    }
    if (sMusicProc2 != NULL)
    {
        Proc_Break(sMusicProc2);
        sMusicProc2 = NULL;
    }
    m4aMPlayFadeOut(&gMPlayInfo_BGM1, speed);
    m4aMPlayFadeOut(&gMPlayInfo_BGM2, speed);
    gSoundSt.is_song_playing = FALSE;
}

void FadeBgmOut_2(int speed)
{
    if (speed < 0)
        speed = 6;
    if (sMusicProc1 != NULL)
    {
        Proc_Break(sMusicProc1);
        sMusicProc1 = NULL;
    }
    if (sMusicProc2 != NULL)
    {
        Proc_Break(sMusicProc2);
        sMusicProc2 = NULL;
    }
    m4aMPlayFadeOut(&gMPlayInfo_BGM1, speed);
    m4aMPlayFadeOutPause(&gMPlayInfo_BGM2, speed);
    gSoundSt.is_song_playing = FALSE;
    gSoundSt.unk7 = 1;
}

void Sound_FadeOutSE(int speed)
{
    if (speed == 0)
        speed = 6;
    m4aMPlayFadeOut(&gMPlayInfo_SE1, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE2, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE3, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE4, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE5, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE6, speed);
    m4aMPlayFadeOut(&gMPlayInfo_SE7, speed);
}

void StartBgmCore(int songId, struct MusicPlayer * player)
{
    gSoundSt.is_song_playing = TRUE;
    gSoundSt.unk7 = 0;
    gSoundSt.songId = songId;
    PlaySongCore(songId, (struct MusicPlayerInfo *) player);
    m4aMPlayImmInit(&gMPlayInfo_BGM1);
    m4aMPlayImmInit(&gMPlayInfo_BGM2);
}

void StartOrChangeBgm(int songId, int speed, struct MusicPlayer * player)
{
    if (gSoundSt.is_song_playing && GetCurrentBgmSong() == songId)
        return;
    if (gPlaySt.cfgDisableBgm)
        return;

    DeleteAll6CWaitMusicRelated();
    if (gSoundSt.is_song_playing)
    {
        FadeBgmOut(speed);
        PlaySongDelayed(songId, speed * 16, (struct MusicPlayerInfo *) player);
    }
    else
    {
        StartBgmCore(songId, player);
    }
}

void StartBgm(int songId, struct MusicPlayer * player)
{
    StartOrChangeBgm(songId, 3, player);
}

void StartBgmExt(int songId, int speed, struct MusicPlayer * player)
{
    StartOrChangeBgm(songId, speed, player);
}

void MusicFi_OnLoop(struct MusicProc * proc)
{
    int volume = Interpolate(0, 0, 0x100, proc->delayCounter, proc->unk4E);

    MPlayVolumeControl(&gMPlayInfo_BGM1, 0xFFFF, volume);
    MPlayVolumeControl(&gMPlayInfo_BGM2, 0xFFFF, volume);
    proc->delayCounter++;
    if (proc->delayCounter >= proc->unk4E)
    {
        Proc_Break(proc);
        sMusicProc1 = NULL;
    }
}

void StartBgmFadeIn(int songId, int duration, struct MusicPlayerInfo * player)
{
    struct MusicProc * proc;

    if (gPlaySt.cfgDisableBgm)
        return;

    gSoundSt.is_song_playing = TRUE;
    gSoundSt.unk7 = 0;
    gSoundSt.songId = songId;
    proc = Proc_Start(ProcScr_MusicFadeIn, PROC_TREE_3);
    MPlayStop_rev01(&gMPlayInfo_BGM1);
    MPlayStop_rev01(&gMPlayInfo_BGM2);
    PlaySongCore(songId, player);
    m4aMPlayImmInit(&gMPlayInfo_BGM1);
    m4aMPlayImmInit(&gMPlayInfo_BGM2);
    MPlayVolumeControl(&gMPlayInfo_BGM1, 0xFFFF, 0);
    MPlayVolumeControl(&gMPlayInfo_BGM2, 0xFFFF, 0);
    proc->delayCounter = 0;
    proc->unk4E = duration * 16;
    sMusicProc1 = (struct Proc *) proc;
}

void OverrideBgm(int songId)
{
    if (gPlaySt.cfgDisableBgm)
        return;

    gSoundSt.unk2 = gSoundSt.songId;
    if (gSoundSt.unk7 == 0)
        m4aMPlayFadeOutPause(&gMPlayInfo_BGM2, 3);
    gSoundSt.is_song_playing = FALSE;
    gSoundSt.unk7 = 0;
    if (songId != 0)
        PlaySongDelayed(songId, 32, &gMPlayInfo_BGM1);
}

void sub_08003AF8(void)
{
    if (gPlaySt.cfgDisableBgm)
        return;

    if (gSoundSt.unk2 == 0)
        return;

    m4aMPlayFadeOut(&gMPlayInfo_BGM1, 3);
    m4aMPlayFadeInContinue(&gMPlayInfo_BGM2, 6);
    gSoundSt.is_song_playing = TRUE;
    gSoundSt.unk7 = 0;
    gSoundSt.songId = gSoundSt.unk2;
    gSoundSt.unk2 = 0;
}

void RestoreBgm(u16 speed)
{
    if (gPlaySt.cfgDisableBgm)
        return;

    if (gSoundSt.unk2 == 0)
        return;

    m4aMPlayFadeOut(&gMPlayInfo_BGM1, 3);
    m4aMPlayFadeInContinue(&gMPlayInfo_BGM2, speed);
    gSoundSt.is_song_playing = TRUE;
    gSoundSt.unk7 = 0;
    gSoundSt.songId = gSoundSt.unk2;
    gSoundSt.unk2 = 0;
}

void MakeBgmOverridePersist(void)
{
    if (gPlaySt.cfgDisableBgm)
        return;

    gSoundSt.songId = gSoundSt.unk2;
    gSoundSt.unk2 = 0;
}

void StartBgmVolumeChange(int volume, int b, int c, ProcPtr parent)
{
    struct MusicProc * proc;

    if (parent)
        proc = Proc_StartBlocking(ProcScr_MusicVolumeChange, parent);
    else
        proc = Proc_Start(ProcScr_MusicVolumeChange, PROC_TREE_3);

    proc->vc_init_volume = volume;
    proc->vc_end_volume = b;
    proc->vc_clock = 0;
    proc->vc_time_end = c;

    if (volume == 0)
        volume = 1;

    SetBgmVolume(volume);
    sMusicProc2 = (struct Proc *) proc;
}

void MusicVc_OnLoop(struct MusicProc * proc)
{
    int volume = Interpolate(4, proc->vc_init_volume, proc->vc_end_volume, proc->vc_clock++, proc->vc_time_end);

    SetBgmVolume(volume);

    if (proc->vc_clock >= proc->vc_time_end)
    {
        if (proc->vc_end_volume == 0)
        {
            m4aSongNumStop(GetCurrentBgmSong());
            gSoundSt.is_song_playing = FALSE;
            gSoundSt.is_song_playing = FALSE;
            gSoundSt.unk2 = 0;
            gSoundSt.songId = 0;
        }
        else
        {
            gSoundSt.is_song_playing = TRUE;
        }

        Proc_Break(proc);
        sMusicProc2 = NULL;
    }
}

void DelaySong_OnLoop(struct MusicProc * proc)
{
    proc->delayCounter--;

    if (proc->delayCounter >= 0)
        return;

    gSoundSt.is_song_playing = TRUE;
    gSoundSt.songId = proc->songId;
    PlaySongCore(proc->songId, proc->player);
    Proc_End(proc);
}

void PlaySongDelayed(int songId, int delay, struct MusicPlayerInfo * player)
{
    struct MusicProc * proc;

    if (gPlaySt.cfgDisableBgm)
        return;

    proc = Proc_Start(ProcScr_08B85854, PROC_TREE_3);
    proc->delayCounter = delay;
    proc->songId = songId;
    proc->player = player;
}

void PlaySongCore(int songId, struct MusicPlayerInfo * player)
{
    if (songId < 128)
    {
        Sound_UpdateMaxChannelsForSong(songId);
        UnlockSoundRoomSong(0, songId);
    }

    if (player != NULL)
        MPlayStart_rev01(player, gSongTable[songId].header);
    else
        m4aSongNumStart(songId);
}

void Sound_SetDefaultMaxNumChannels(void)
{
    Sound_SetMaxNumChannels(7);
    gSoundSt.maxChannels = -1;
}

void Sound_SetMaxNumChannels(int maxchn)
{
    gSoundSt.maxChannels = maxchn;
    SoundMode_rev01(maxchn << SOUND_MODE_MAXCHN_SHIFT);
}

void Sound_UpdateMaxChannelsForSong(int songId)
{
    switch (songId)
    {
    case 0x29:
    case 0x2A:
    case 0x5A:
    case 0x5C:
    case 0x5F:
    case 0x74:
        if (gSoundSt.maxChannels != 8)
            Sound_SetMaxNumChannels(8);
        break;

    default:
        if (gSoundSt.maxChannels != -1)
            Sound_SetDefaultMaxNumChannels();
        break;
    }
}

int IsMusicProc2Running(void)
{
    if (Proc_Find(ProcScr_MusicVolumeChange) != NULL)
        return TRUE;

    return FALSE;
}

void MusicChange_StartVolumeChange(struct MusicProc * proc)
{
    if (IsBgmPlaying() != 0 && proc->vc_init_volume != 0)
    {
        if (proc->unk5C == -1)
            StartBgmVolumeChange(proc->vc_init_volume, proc->vc_end_volume, proc->unk58, proc);
        else
            StartBgmVolumeChange(proc->vc_init_volume, 0, proc->unk58, proc);
    }
}

void MusicChange_StartBgm(struct MusicProc * proc)
{
    if (proc->unk5C > 0)
    {
        StartBgm(proc->unk5C, NULL);
        SetBgmVolume(proc->vc_end_volume);
    }
    else
    {
        Proc_Goto(proc, 0);
    }
}

void CallSomeSoundMaybe(int songId, int vc_init_volume, int vc_end_volume, int duration, ProcPtr parent)
{
    struct MusicProc * proc;

    if (IsBgmPlaying() != 0 && songId == gSoundSt.songId && vc_init_volume == vc_end_volume)
        return;

    if (parent != NULL)
        proc = Proc_StartBlocking(ProcScr_MusicChange, parent);
    else
        proc = Proc_Start(ProcScr_MusicChange, PROC_TREE_3);

    proc->unk58 = duration;

    if (IsBgmPlaying() != 0 && songId == gSoundSt.songId)
        proc->unk5C = -1;
    else
        proc->unk5C = songId;

    proc->vc_init_volume = vc_init_volume;
    proc->vc_end_volume = vc_end_volume;
}

bool MusicProc4Exists(void)
{
    if (Proc_Find(ProcScr_MusicChange) != NULL)
        return TRUE;

    return FALSE;
}

void sub_080041E4(int songId)
{
    if (songId != gSoundSt.songId)
    {
        if (IsBgmPlaying() != 0)
            SetBgmVolume(0);

        StartBgmCore(songId, NULL);
    }
}

void DeleteAll6CWaitMusicRelated(void)
{
    Proc_EndEach(ProcScr_08B85854);
}

void sub_08004234(void)
{
    DeleteAll6CWaitMusicRelated();
    m4aMPlayFadeOut(&gMPlayInfo_BGM1, 1);
    m4aMPlayFadeOut(&gMPlayInfo_BGM2, 1);
    gSoundSt.unk2 = 0;
    gSoundSt.songId = 0;
}
