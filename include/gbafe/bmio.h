#pragma once

// BmVSync_TsImgAnim
// BmVSync_TsPalAnim
// BmVSync_AnimInit
// BmVSync_End
// BmVSync_Repeat
void StartBmVSync(void);
void BMapVSync_End(void);
void LockBmDisplay(void);
void UnlockBmDisplay(void);
void AllocWeatherParticles(int weather);
// WeatherInit_None
// WeatherInit_Snow
// WfxSnow_VSync
// WeatherInit_Rain
// WfxRain_VSync
// WeatherInit_Sandstorm
// WfxSandStorm_VSync
// WeatherInit_Snowstorm
// WfxSnowStorm_VSync
// WfxBlueHSync
// WeatherInit_Blue
// WfxBlue_VSync
// FlamesWeatherHBlank
void ApplyFlamesWeatherGradient(void);
// FlamesWeatherInitGradient
// FlamesWeatherInitParticles
// WeatherInit_Flames
// WfxFlamesUpdateGradient
// WfxFlamesUpdateParticles
// WfxFlames_VSync
// WfxCloudsOffsetGraphicsEffect
// WeatherInit_Clouds
// WfxClouds_VSync
// WfxClouds_Update
// WeatherInit
// WfxVSync
// WfxUpdate
void DisableTilesetPalAnim(void);
void EnableTilesetPalAnim(void);
// SetWeather

extern struct ProcCmd ProcScr_MapTask[];

// terminated by time == 0 (the chapter tileset animation tables, see chapterassets.c)
struct TileGfxAnim {
    /* 00 */ u16 time;
    /* 02 */ u16 size;
    /* 04 */ const void * data;
};

struct TilePalAnim {
    /* 00 */ const void * data;
    /* 04 */ u8 time;
    /* 05 */ u8 colorCount;
    /* 06 */ u8 colorStart;
};
