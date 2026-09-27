#pragma once

#include "global.h"

// ??? sub_8025114
void ApplyUnitSpritePalettes(void);
// ??? sub_08024CE0
void ResetUnitSprites(void);
void ResetUnitSpritesB(void);
int UseUnitSprite(u32 id);
int StartUiSMS(int smsId, int frameId);
// ??? sub_08024EB8
// ??? ApplyUnitSpriteImage16x16
// ??? ApplyUnitSpriteImage16x32
// ??? ApplyUnitSpriteImage32x32
void TornOutUnitSprite(struct Unit * unit, int timer);
// ??? SyncUnitSpriteSheet
void ForceSyncUnitSpriteSheet(void);
// ??? sub_080255E0
// ??? SetStandingMuFacing
// ??? GetUnitDisplayedSpritePalette
// ??? GetUnitSpritePalette
void RefreshUnitSprites(void);
// ??? AddUnitSprite
void PutUnitSpritesOam(void);
// ??? PutChapterMarkedTileIconOam
void PutUnitSpriteIconsOam(void);
// ??? sub_08025F8C
// ??? sub_8026428
void UnitSpriteHoverUpdate(void);
// ??? sub_08026064
// ??? PutUnitSprite
// ??? PutUnitSpriteForClassId
void sub_08026250(int layer, int x, int y, int jid);
// ??? sub_08026308
// ??? sub_080263A0
// ??? PutBlendWindowUnitSprite
// ??? sub_80269F4
void HideUnitSprite(struct Unit * unit);
void ShowUnitSprite(struct Unit * unit);
u8 GetUnitSpriteHiddenFlag(struct Unit * unit);
// ??? sub_080265C0
