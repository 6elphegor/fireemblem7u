#pragma once

#include "global.h"
#include "m4a.h"
#include "gba/m4a_internal.h"

// GetCurrentBgmSong
// sub_080034F4
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
// sub_08003F6C
// sub_08003F8C
// sub_08003FC0
// IsMusicProc2Running
// sub_0800404C
// sub_080040B8
void CallSomeSoundMaybe(int songId, int b, int c, int d, ProcPtr parent);
bool MusicProc4Exists(void);
// sub_080041E4
// sub_0800421C
// sub_08004234

#define PlaySoundEffect(id) \
    if (!gPlaySt.cfgDisableSoundEffects) \
        m4aSongNumStart((id))
