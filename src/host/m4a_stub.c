// Host build only (tools/hostgame.py; not part of the GBA builds, which
// take src/*.c): the m4a entry points the game calls, as no-ops, until the
// sound engine's C port (src/m4a.c without asm/m4a_1.s) links on the host.
// The host link leaves out src/m4a.c and src/m4a_tables.c meanwhile: they
// need the asm half of the engine (SoundMain, MPlayMain, ply_*) and the
// absolute gNumMusicPlayers / gMaxLines symbols.  The players' RAM
// (gMPlayInfo_*, gSoundInfo) is in the host RAM image (tools/hostram.py) and
// stays zero, so the game sees every song as stopped.

#include "gbafe.h"
#include "gba/m4a_internal.h"

void m4aSoundInit(void) { }
void m4aSoundMain(void) { }
void m4aSoundVSync(void) { }
void m4aSongNumStart(u16 n) { }
void m4aSongNumStop(u16 n) { }
void m4aMPlayImmInit(struct MusicPlayerInfo *mplayInfo) { }
void m4aMPlayFadeOut(struct MusicPlayerInfo *mplayInfo, u16 speed) { }
void m4aMPlayFadeOutPause(struct MusicPlayerInfo *mplayInfo, u16 speed) { }
void m4aMPlayFadeInContinue(struct MusicPlayerInfo *mplayInfo, u16 speed) { }
void MPlayStart_rev01(struct MusicPlayerInfo *mplayInfo, struct SongHeader *songHeader) { }
void MPlayStop_rev01(struct MusicPlayerInfo *mplayInfo) { }
void MPlayVolumeControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, u16 volume) { }
void MPlayPanpotControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, s8 pan) { }
void SoundMode_rev01(u32 mode) { }
void SoundVSyncOff_rev01(void) { }
void SoundVSyncOn_rev01(void) { }
