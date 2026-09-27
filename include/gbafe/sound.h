#pragma once

#include "global.h"
#include "m4a.h"
#include "gba/m4a_internal.h"

// GetCurrentBgmSong
// IsBgmPlaying
// Sound_SetBGMVolume
// SetBgmVolume
// FadeBgmOut
// FadeBgmOut_2
void Sound_FadeOutSE(int speed);
void StartBgmCore(int song, struct MusicPlayer * music_player);
void StartOrChangeBgm(int song, int speed, struct MusicPlayer * music_player);
void StartBgm(int song, struct MusicPlayer * music_player);
void StartBgmExt(int song, int speed, struct MusicPlayer * music_player);
// MusicFi_OnLoop
// StartBgmFadeIn
void OverrideBgm(int song);
// sub_08003AF8
// RestoreBgm
// MakeBgmOverridePersist
// StartBgmVolumeChange
// MusicVc_OnLoop
// DelaySong_OnLoop
// PlaySongDelayed
// PlaySongCore
// Sound_SetDefaultMaxNumChannels
// Sound_SetMaxNumChannels
// Sound_UpdateMaxChannelsForSong
// IsMusicProc2Running
// MusicChange_StartVolumeChange
// MusicChange_StartBgm
void CallSomeSoundMaybe(int songId, int b, int c, int d, ProcPtr parent);
bool MusicProc4Exists(void);
// sub_080041E4
// DeleteAll6CWaitMusicRelated
// sub_08004234

#define PlaySoundEffect(id) \
    if (!gPlaySt.cfgDisableSoundEffects) \
        m4aSongNumStart((id))
