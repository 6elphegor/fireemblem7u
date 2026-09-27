#pragma once

#include "global.h"

struct UnitIconWait {
    /* 00 */ u16 unk00;
    /* 02 */ u16 size;
    /* 04 */ u8 const * sheet;
};

enum {
    UNIT_ICON_SIZE_16x16,
    UNIT_ICON_SIZE_16x32,
    UNIT_ICON_SIZE_32x32,
};

extern struct UnitIconWait CONST_DATA unit_icon_wait_table[];

// ??? sub_8025114
void ApplyUnitSpritePalettes(void);
// ??? ApplyUnitSpriteSepiaPalette
void ResetUnitSprites(void);
void ResetUnitSpritesB(void);
int UseUnitSprite(u32 id);
int StartUiSMS(int smsId, int frameId);
// ??? ApplyUnitSpriteImage16x16
// ??? ApplyUnitSpriteUiImage16x16
// ??? ApplyUnitSpriteImage16x32
// ??? ApplyUnitSpriteImage32x32
void TornOutUnitSprite(struct Unit * unit, int timer);
// ??? SyncUnitSpriteSheet
void SyncUnitSpriteSheet(void);
void ForceSyncUnitSpriteSheet(void);
// ??? SyncUiSMS
// ??? SetStandingMuFacing
// ??? GetUnitDisplayedSpritePalette
// ??? GetUnitSpritePalette
void RefreshUnitSprites(void);
// ??? AddUnitSprite
void PutUnitSpritesOam(void);
// ??? PutChapterMarkedTileIconOam
void PutUnitSpriteIconsOam(void);
// ??? ResetUnitSpriteHoverCursor
// ??? sub_8026428
void UnitSpriteHoverUpdate(void);
// ??? IsUnitSpriteHoverEnabledAt
// ??? PutUnitSprite
void PutUnitSprite(int layer, int x, int y, struct Unit * unit);
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
