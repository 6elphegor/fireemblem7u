#include "gbafe.h"

// General battle map system stuff (FE8U: bmio.c)

struct WeatherParticle {
    /* 00 */ short xPosition;
    /* 02 */ short yPosition;

    /* 04 */ short xSpeed;
    /* 06 */ short ySpeed;

    /* 08 */ u8 gfxIndex;
    /* 09 */ u8 typeId;
};

union WeatherEffectData {
    struct WeatherParticle particles[0x40];
    u32 gfxData[0xC0];
};

union GradientEffectData {
    u16 lines[320];
    u16 fireGradient[8][0x40];
};

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

struct BmVSyncProc {
    PROC_HEADER;

    /* 2C */ const struct TileGfxAnim * tileGfxAnimStart;
    /* 30 */ const struct TileGfxAnim * tileGfxAnimCurrent;

    /* 34 */ short tileGfxAnimClock;
    /* 36 */ short tilePalAnimClock;

    /* 38 */ const struct TilePalAnim * tilePalAnimStart;
    /* 3C */ const struct TilePalAnim * tilePalAnimCurrent;
};

struct MapMainProc {
    PROC_HEADER;

    /* 29 */ u8 pad_29[0x54 - 0x29];
    /* 54 */ struct Proc * gameCtrl;
};

void BmVSync_TsImgAnim(struct BmVSyncProc * proc);
void BmVSync_TsPalAnim(struct BmVSyncProc * proc);
void BmVSync_AnimInit(struct BmVSyncProc * proc);
void BmVSync_End(struct BmVSyncProc * proc);
void BmVSync_Repeat(struct BmVSyncProc * proc);
void WfxVSync(void);
void WfxUpdate(void);
void WeatherInit(void);
void WfxBlueHSync(void);
void FlamesWeatherHBlank(void);
void ResetBmSt(void);
void InitMoreBMapGraphics(void);
struct MapMainProc * StartMapMain(struct Proc * gameCtrl);
void ResumeMapMainDuringPhase(struct MapMainProc * mapMain);
void ResumeMapMainDuringAction(struct MapMainProc * mapMain);
void ResumeMapMainDuringBerserk(struct MapMainProc * mapMain);
void ResumeMapMainDuringArena(struct MapMainProc * mapMain);
void ResumeMapMainDuringPhaseChange(struct MapMainProc * mapMain);

void SyncUnitSpriteSheet(void);
void UpdateBmMapDisplay(void);
void UnpackChapterMapPalette(void);
void InitTraps(void);
void InitChapterMap(int chapterId);
void InitMapObstacles(void);
void LoadChapterTraps(void);
struct Proc * StartMu(struct Unit * unit);
void MU_SetDefaultFacing_Auto(void);
void ArenaResume(struct Unit * unit);
void BattleGenerateArena(struct Unit * unit);
void BeginBattleAnimations(void);
void sub_080B26A4(void);
void WriteCompletedPlaythroughSaveData(void);
char * strcpy(char * dst, const char * src);

extern const void * gChapterDataAssetTable[];
extern struct ProcCmd ProcScr_BmMain[];

extern const u8 Img_SandstormParticles[];
extern const u8 Img_SnowstormParticles[];
extern const u8 Img_FlamesParticles[];
extern const u16 Pal_FlamesParticles[];
extern const u8 Img_CloudsWeather[];
extern const u16 Pal_CloudsWeather[];

EWRAM_OVERLAY(0) union WeatherEffectData sWeatherEffect = {};
EWRAM_OVERLAY(0) union GradientEffectData sGradientEffect = {};

struct ProcCmd CONST_DATA ProcScr_BmVSync[] = {
    PROC_MARK(1),
    PROC_SET_END_CB(BmVSync_End),

    PROC_SLEEP(0),

PROC_LABEL(0),
    PROC_CALL(BmVSync_TsImgAnim),
    PROC_CALL(BmVSync_TsPalAnim),

    PROC_CALL(SyncUnitSpriteSheet),
    PROC_CALL(WfxVSync),

    PROC_REPEAT(BmVSync_Repeat),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_MapTask[] = {
    PROC_19,
    PROC_END_DUPLICATES,
    PROC_MARK(1),

    PROC_SLEEP(0),

PROC_LABEL(0),
    PROC_CALL(PutUnitSpritesOam),
    PROC_CALL(WfxUpdate),
    PROC_CALL(UpdateBmMapDisplay),

    PROC_SLEEP(0),
    PROC_GOTO(0),
};

u16 CONST_DATA sObj_RainParticle1[] = {
    1, 0x0000, 0x0000, 0x102A,
};

u16 CONST_DATA sObj_RainParticle2[] = {
    1, 0x8000, 0x0000, 0x100A,
};

u16 * CONST_DATA sRainParticleObjLookup[3] = {
    sObj_RainParticle1, sObj_RainParticle2, sObj_RainParticle2,
};

u16 CONST_DATA sObj_BackgroundClouds[] = {
    18,

    0x4000, 0xC000, 0,
    0x4000, 0xC030, 6,
    0x4000, 0xC070, 0,
    0x4000, 0xC0A0, 6,
    0x8000, 0x80E0, 0,
    0x0020, 0x8000, 10,
    0x4020, 0xC020, 0,
    0x4020, 0xC050, 6,
    0x4020, 0xC090, 0,
    0x4020, 0xC0C0, 6,
    0x4040, 0xC000, 0,
    0x4040, 0xC0B0, 0,
    0x4060, 0xC000, 4,
    0x4060, 0xC0B0, 4,
    0x4080, 0xC000, 0,
    0x4080, 0xC0B0, 0,
    0x40A0, 0xC000, 0,
    0x40A0, 0xC0B0, 0,
};

struct ProcCmd CONST_DATA ProcScr_DelayedBMapDispResume[] = {
    PROC_SLEEP(0),

    PROC_CALL(UnlockBmDisplay),
    PROC_END,
};

/**
 * Each 3 array entries represent one config template
 * First two values are initial speed, third is type id
 */
static const u16 sInitialParticleConfigTemplates[] = {
    0xB0,  0xC0,  0,
    0xB0,  0xD0,  0,
    0xB0,  0xE0,  0,
    0xB0,  0xF0,  0,
    0xB0,  0x100, 0,
    0xB0,  0x110, 0,

    0xF0,  0x140, 1,
    0xF0,  0x150, 1,
    0xF0,  0x160, 1,
    0xF0,  0x170, 1,
    0xF0,  0x180, 1,
    0xF0,  0x190, 1,
    0xF0,  0x1A0, 1,

    0x100, 0x200, 2,
    0xF0,  0x220, 2,
    0xE0,  0x240, 2,
};

void BmVSync_TsImgAnim(struct BmVSyncProc * proc)
{
    if (!proc->tileGfxAnimStart)
        return;

    if (proc->tileGfxAnimClock)
    {
        proc->tileGfxAnimClock--;
        return;
    }

    proc->tileGfxAnimClock = proc->tileGfxAnimCurrent->time;

    CpuFastCopy(
        proc->tileGfxAnimCurrent->data,
        (void *) (VRAM + 0x140 * 0x20 * 4),
        proc->tileGfxAnimCurrent->size);

    if ((++proc->tileGfxAnimCurrent)->time == 0)
        proc->tileGfxAnimCurrent = proc->tileGfxAnimStart;
}

void BmVSync_TsPalAnim(struct BmVSyncProc * proc)
{
    if (!proc->tilePalAnimStart)
        return;

    if (proc->tilePalAnimClock)
    {
        proc->tilePalAnimClock--;
        return;
    }

    proc->tilePalAnimClock = proc->tilePalAnimCurrent->time;

    CpuCopy16(
        proc->tilePalAnimCurrent->data,
        proc->tilePalAnimCurrent->colorStart + (0x10 * 6) + gPal,
        proc->tilePalAnimCurrent->colorCount * 2);

    EnablePalSync();

    if ((++proc->tilePalAnimCurrent)->time == 0)
        proc->tilePalAnimCurrent = proc->tilePalAnimStart;
}

void BmVSync_AnimInit(struct BmVSyncProc * proc)
{
    proc->tileGfxAnimClock = 0;
    proc->tilePalAnimClock = 0;

    proc->tileGfxAnimStart = proc->tileGfxAnimCurrent =
        gChapterDataAssetTable[GetChapterInfo(gPlaySt.chapterIndex)->asset_img_anims];

    proc->tilePalAnimStart = proc->tilePalAnimCurrent =
        gChapterDataAssetTable[GetChapterInfo(gPlaySt.chapterIndex)->asset_pal_anims];
}

void BmVSync_End(struct BmVSyncProc * proc)
{
    SetOnHBlankB(NULL);
}

void BmVSync_Repeat(struct BmVSyncProc * proc)
{
    Proc_Goto(proc, 0);
}

void StartBmVSync(void)
{
    BmVSync_AnimInit(Proc_Start(ProcScr_BmVSync, PROC_TREE_VSYNC));

    WeatherInit();
    gBmSt.lock_display = 0;
}

void BMapVSync_End(void)
{
    Proc_EndEach(ProcScr_BmVSync);
}

void LockBmDisplay(void)
{
    if (++gBmSt.lock_display > 1)
        return;

    SetOnHBlankB(NULL);
    gPal[0] = 0;
    EnablePalSync();
    Proc_BlockEachMarked(1);
}

void UnlockBmDisplay(void)
{
    struct Proc * proc;

    if (!gBmSt.lock_display)
        return;

    if (--gBmSt.lock_display)
        return;

    Proc_UnblockEachMarked(1);

    proc = Proc_Find(ProcScr_BmVSync);

    if (proc)
    {
        Proc_End(proc);
        StartBmVSync();
    }
}

void AllocWeatherParticles(int weatherId)
{
    switch (weatherId)
    {
    case WEATHER_SNOW:
    case WEATHER_SNOWSTORM:
    case WEATHER_RAIN:
    case WEATHER_SANDSTORM:
        InitOam(0x20);
        break;

    case WEATHER_FLAMES:
        InitOam(0x10);
        break;

    default:
        InitOam(0);
        break;
    }
}

void WeatherInit_None(void)
{
    AllocWeatherParticles(gPlaySt.chapterWeatherId);
    SetOnHBlankB(NULL);
}

void WeatherInit_Snow(void)
{
    int i;

    int gfxTileIndices[] = { 0x29, 0x09, 0x08 };

    AllocWeatherParticles(gPlaySt.chapterWeatherId);

    for (i = 0; i < 0x40; ++i)
    {
        unsigned templateIndex = (i & 0xF) * 3;

        sWeatherEffect.particles[i].xPosition = RandNextB();
        sWeatherEffect.particles[i].yPosition = RandNextB();

        sWeatherEffect.particles[i].xSpeed = sInitialParticleConfigTemplates[templateIndex + 0] * 2;
        sWeatherEffect.particles[i].ySpeed = sInitialParticleConfigTemplates[templateIndex + 1] * 2;
        sWeatherEffect.particles[i].typeId = sInitialParticleConfigTemplates[templateIndex + 2];

        sWeatherEffect.particles[i].gfxIndex = gfxTileIndices[sInitialParticleConfigTemplates[templateIndex + 2]];
    }
}

void WfxSnow_VSync(void)
{
    if (GetOamSplice())
    {
        struct { short x, y; } origins[3];
        int i;

        struct WeatherParticle * it = sWeatherEffect.particles + ((GetGameTime() % 2) * 0x20);

        origins[0].x = (gBmSt.camera.x * 12) / 16;
        origins[0].y = gBmSt.camera.y;

        origins[1].x = gBmSt.camera.x;
        origins[1].y = gBmSt.camera.y;

        origins[2].x = (gBmSt.camera.x * 20) / 16;
        origins[2].y = gBmSt.camera.y;

        for (i = 0; i < 0x20; ++i)
        {
            it->xPosition += it->xSpeed;
            it->yPosition += it->ySpeed;

            PutOamLoRam(
                ((it->xPosition >> 8) - origins[it->typeId].x) & 0xFF,
                ((it->yPosition >> 8) - origins[it->typeId].y) & 0xFF,
                Sprite_8x8,
                (1 << 12) + it->gfxIndex);

            ++it;
        }
    }
}

void WeatherInit_Rain(void)
{
    int i;

    AllocWeatherParticles(gPlaySt.chapterWeatherId);

    for (i = 0; i < 0x40; ++i)
    {
        unsigned templateIndex = (i & 0xF) * 3;

        sWeatherEffect.particles[i].xPosition = RandNextB();
        sWeatherEffect.particles[i].yPosition = RandNextB();

        sWeatherEffect.particles[i].xSpeed   = sInitialParticleConfigTemplates[templateIndex + 0] * 6;
        sWeatherEffect.particles[i].ySpeed   = sInitialParticleConfigTemplates[templateIndex + 1] * 16;
        sWeatherEffect.particles[i].gfxIndex = sInitialParticleConfigTemplates[templateIndex + 2];
    }
}

void WfxRain_VSync(void)
{
    if (GetOamSplice())
    {
        int i;

        struct WeatherParticle * it = sWeatherEffect.particles + ((GetGameTime() % 2) * 0x20);

        for (i = 0; i < 0x20; ++i)
        {
            it->xPosition += it->xSpeed;
            it->yPosition += it->ySpeed;

            PutOamLoRam(
                ((it->xPosition >> 8) - gBmSt.camera.x) & 0xFF,
                ((it->yPosition >> 8) - gBmSt.camera.y) & 0xFF,
                sRainParticleObjLookup[it->gfxIndex],
                0);

            ++it;
        }
    }
}

void WeatherInit_Sandstorm(void)
{
    int i;

    AllocWeatherParticles(gPlaySt.chapterWeatherId);

    Decompress(Img_SandstormParticles, gBuf);
    Copy2dChr(gBuf, (void *) (OBJ_VRAM0 + 0x1C * 0x20), 4, 4);

    for (i = 0; i < 0x40; ++i)
    {
        sWeatherEffect.particles[i].xPosition = RandNextB();
        sWeatherEffect.particles[i].yPosition = (RandNextB() % 160 + 240) & 0xFF;

        sWeatherEffect.particles[i].xSpeed = (RandNextB() & 0x7) - 32;
        sWeatherEffect.particles[i].ySpeed = 0;
    }
}

void WfxSandStorm_VSync(void)
{
    if (GetOamSplice())
    {
        int i;

        struct WeatherParticle * it = sWeatherEffect.particles + ((GetGameTime() % 2) * 0x20);

        for (i = 0; i < 0x20; ++i)
        {
            it->xPosition += it->xSpeed;

            PutOamLoRam(
                ((it->xPosition & 0xFF) - 0x10) & 0x1FF,
                it->yPosition,
                Sprite_32x32,
                (1 << 12) + 0x1C);

            ++it;
        }
    }
}

void WeatherInit_Snowstorm(void)
{
    int i;

    u8 typeLookup[] = { 0, 0, 0, 0, 0, 0, 1, 1 };

    AllocWeatherParticles(gPlaySt.chapterWeatherId);

    Decompress(Img_SnowstormParticles, gBuf);
    Copy2dChr(gBuf, (void *) (OBJ_VRAM0 + 0x18 * 0x20), 8, 4);

    for (i = 0; i < 0x40; ++i)
    {
        unsigned type = typeLookup[i & 7];

        sWeatherEffect.particles[i].xPosition = RandNextB();
        sWeatherEffect.particles[i].yPosition = RandNextB();

        sWeatherEffect.particles[i].ySpeed    = (RandNextB() & 0x3FF) - 0x100;
        sWeatherEffect.particles[i].gfxIndex  = type;

        switch (type)
        {
        case 0:
            sWeatherEffect.particles[i].xSpeed = 0x700 + (RandNextB() & 0x1FF);
            break;

        case 1:
            sWeatherEffect.particles[i].xSpeed = 0xA00 + (RandNextB() & 0x1FF);
            break;
        }
    }
}

void WfxSnowStorm_VSync(void)
{
    if (GetOamSplice())
    {
        int i;

        struct WeatherParticle * it = sWeatherEffect.particles + ((GetGameTime() % 2) * 0x20);

        for (i = 0; i < 0x20; ++i)
        {
            it->xPosition += it->xSpeed;
            it->yPosition += it->ySpeed;

            PutOamLoRam(
                ((it->xPosition >> 8) - gBmSt.camera.x) & 0xFF,
                ((it->yPosition >> 8) - gBmSt.camera.y) & 0xFF,
                Sprite_32x32,
                (1 << 12) + 0x18 + (it->gfxIndex * 4));

            ++it;
        }
    }
}

void WfxBlueHSync(void)
{
    u16 nextLine = (REG_VCOUNT + 1);

    if (nextLine > 160)
        nextLine = 0;

    nextLine += gBmSt.camera.y / 2;

    if (nextLine >= 320)
        ((u16 *) (PLTT))[0] = 0;
    else
        ((u16 *) (PLTT))[0] = nextLine[sGradientEffect.lines];
}

void WeatherInit_Blue(void)
{
    u16 * palIt = sGradientEffect.lines;
    int i = 0;

    void (* handler)(void) = WfxBlueHSync;

    for (; i < 320; ++i)
        *palIt++ = RGB(0, 0, (31 - i / 10));

    SetOnHBlankB(handler);
}

void nullsub_9(void)
{
}

void FlamesWeatherHBlank(void)
{
    const u16 * src;
    u16 * dst;

    u16 nextLine = (REG_VCOUNT + 1);

    if (nextLine < 96)
        return;

    if (nextLine >= 160)
        return;

    nextLine -= 96;

    src  = sGradientEffect.fireGradient[0];
    src += nextLine * 8;

    dst = ((u16 *) (PLTT)) + 0x70 + (nextLine % 8) * 8;

    CpuFastCopy(src, dst, 8);
}

void ApplyFlamesWeatherGradient(void)
{
    int k, j, i;

    for (i = 0; i < 4; ++i)
    {
        for (j = 0; j < 0x10; ++j)
        {
            const int color = gPal[PAL_COLOR_OFFSET(i + 7, j)];

            int r = RED_VALUE(color);
            int g = GREEN_VALUE(color);
            int b = BLUE_VALUE(color);

            for (k = 0; k < 8; ++k)
            {
                r = r + 2;

                if (r > 31)
                    r = 31;

                sGradientEffect.fireGradient[k][0x10 * i + j] =
                    (b << 10) + (g << 5) + r;
            }
        }
    }
}

void FlamesWeatherInitGradient(void)
{
    int i, j, k;

    UnpackChapterMapPalette();

    for (i = 0; i < 4; ++i)
    {
        for (j = 0; j < 0x10; ++j)
        {
            const int color = gPal[PAL_COLOR_OFFSET(i + 7, j)];

            int r = RED_VALUE(color);
            int g = GREEN_VALUE(color);
            int b = BLUE_VALUE(color);

            for (k = 0; k < 8; ++k)
            {
                r = r + 2;

                if (r > 31)
                    r = 31;

                sGradientEffect.fireGradient[k][0x10 * i + j] =
                    (b << 10) + (g << 5) + r;
            }
        }
    }

    SetOnHBlankB(FlamesWeatherHBlank);
}

void FlamesWeatherInitParticles(void)
{
    int i;

    AllocWeatherParticles(gPlaySt.chapterWeatherId);
    Decompress(Img_FlamesParticles, (void *) (OBJ_VRAM0 + 0x18 * 0x20));
    ApplyPalette(Pal_FlamesParticles, 0x1A);

    for (i = 0; i < 0x10; ++i)
    {
        sWeatherEffect.particles[i].xPosition = RandNextB();
        sWeatherEffect.particles[i].yPosition = RandNextB();

        sWeatherEffect.particles[i].xSpeed = -sInitialParticleConfigTemplates[i * 3 + 0];
        sWeatherEffect.particles[i].ySpeed = -sInitialParticleConfigTemplates[i * 3 + 1];
    }
}

void WeatherInit_Flames(void)
{
    FlamesWeatherInitGradient();
    FlamesWeatherInitParticles();
}

void WfxFlamesUpdateGradient(void)
{
    int i, j;

    CpuFastCopy(PAL_BG(7), ((u16 *) (PLTT)) + BGPAL_OFFSET(7), 0x20 * 4);

    for (i = 12; i < 16; ++i)
    {
        const int color = gPal[PAL_COLOR_OFFSET(7 + 2, i)];

        int r = RED_VALUE(color);
        int g = GREEN_VALUE(color);
        int b = BLUE_VALUE(color);

        for (j = 0; j < 8; ++j)
        {
            r = r + 2;

            if (r > 31)
                r = 31;

            sGradientEffect.fireGradient[j][0x10 * 2 + i] =
                (b << 10) + (g << 5) + r;
        }
    }
}

void WfxFlamesUpdateParticles(void)
{
    struct WeatherParticle * it = sWeatherEffect.particles;

    if (GetOamSplice())
    {
        int i;

        for (i = 0; i < 0x10; ++i, ++it)
        {
            int yDisplay;
            int objTile;

            it->xPosition += it->xSpeed;
            it->yPosition += it->ySpeed;

            yDisplay = ((it->yPosition >> 8) - gBmSt.camera.y) & 0xFF;

            if (yDisplay < 0x40)
                continue;

            if (yDisplay > 0xA0)
                continue;

            objTile = 31 - ((yDisplay - 0x40) / 8);

            if (objTile < 24)
                objTile = 24;

            PutOamLoRam(
                ((it->xPosition >> 8) - gBmSt.camera.x) & 0xFF,
                yDisplay,
                Sprite_8x8,
                (10 << 12) + objTile);
        }
    }
}

void WfxFlames_VSync(void)
{
    WfxFlamesUpdateGradient();
    WfxFlamesUpdateParticles();
}

void WfxCloudsOffsetGraphicsEffect(u32 * lines)
{
    u32 lineBuf[8];
    int iy, ix;

    for (iy = 0; iy < 8; ++iy)
        lineBuf[iy] = lines[iy + 0x68];

    for (ix = (14 - 1); ix >= 0; --ix)
    {
        for (iy = 0; iy < 8; ++iy)
        {
            lines[(8 * (ix - 1)) + iy + 8] =
                (lines[(8 * (ix - 1)) + iy + 8] << 4) | (lines[(8 * (ix - 1)) + iy] >> 28);
        }
    }

    for (iy = 0; iy < 8; ++iy)
    {
        lines[iy] &= ~0xF;
        lines[iy] = (lines[iy]) | (lineBuf[iy] >> 28);
    }
}

void WeatherInit_Clouds(void)
{
    AllocWeatherParticles(WEATHER_FINE);
    Decompress(Img_CloudsWeather, sWeatherEffect.gfxData);
    ApplyPalette(Pal_CloudsWeather, 0x10 + 10);
}

void WfxClouds_VSync(void)
{
    u32 * gfx = sWeatherEffect.gfxData;

    switch (GetGameTime() % 8)
    {
    case 0:
        WfxCloudsOffsetGraphicsEffect(gfx + 0 * (14 * 8));
        break;

    case 2:
        WfxCloudsOffsetGraphicsEffect(gfx + 1 * (14 * 8));
        break;

    case 4:
        WfxCloudsOffsetGraphicsEffect(gfx + 2 * (14 * 8));
        break;

    case 6:
        WfxCloudsOffsetGraphicsEffect(gfx + 3 * (14 * 8));
        break;

    case 7:
        Copy2dChr(gfx, (void *) (OBJ_VRAM0 + (0x20 * 18)), 14, 4);
        break;
    }
}

void WfxClouds_Update(void)
{
    int y = gBmSt.camera.y;

    PutSprite(14, 0, -(y / 5), sObj_BackgroundClouds, 0xAC12);
}

void WeatherInit(void)
{
    switch (gPlaySt.chapterWeatherId)
    {
    case WEATHER_FINE:
        WeatherInit_None();
        break;

    case WEATHER_SNOW:
        WeatherInit_Snow();
        break;

    case WEATHER_SANDSTORM:
        WeatherInit_Sandstorm();
        break;

    case WEATHER_SNOWSTORM:
        WeatherInit_Snowstorm();
        break;

    case WEATHER_RAIN:
        WeatherInit_Rain();
        break;

    case WEATHER_NIGHT:
        WeatherInit_Blue();
        break;

    case WEATHER_FLAMES:
        WeatherInit_Flames();
        break;

    case WEATHER_CLOUDS:
        WeatherInit_Clouds();
        break;
    }
}

void WfxVSync(void)
{
    switch (gPlaySt.chapterWeatherId)
    {
    case WEATHER_SNOW:
        WfxSnow_VSync();
        break;

    case WEATHER_SANDSTORM:
        WfxSandStorm_VSync();
        break;

    case WEATHER_SNOWSTORM:
        WfxSnowStorm_VSync();
        break;

    case WEATHER_RAIN:
        WfxRain_VSync();
        break;

    case WEATHER_NIGHT:
        nullsub_9();
        break;

    case WEATHER_FLAMES:
        WfxFlames_VSync();
        break;

    case WEATHER_CLOUDS:
        WfxClouds_VSync();
        break;
    }
}

void WfxUpdate(void)
{
    if (gPlaySt.chapterWeatherId == WEATHER_CLOUDS)
        WfxClouds_Update();
}

void DisableTilesetPalAnim(void)
{
    struct BmVSyncProc * proc = Proc_Find(ProcScr_BmVSync);

    if (proc)
        proc->tilePalAnimStart = NULL;
}

void EnableTilesetPalAnim(void)
{
    struct BmVSyncProc * proc = Proc_Find(ProcScr_BmVSync);

    if (proc)
        proc->tilePalAnimStart = proc->tilePalAnimCurrent =
            gChapterDataAssetTable[GetChapterInfo(gPlaySt.chapterIndex)->asset_pal_anims];
}

void SetWeather(int weatherId)
{
    gPlaySt.chapterWeatherId = weatherId;

    AllocWeatherParticles(weatherId);
    WeatherInit();
}

int GetTextPrintDelay(void)
{
    u8 speedLookup[4] = { 9, 5, 2, 0 };
    return speedLookup[gPlaySt.cfgTextSpeed];
}

int IsFirstPlaythrough(void)
{
    u8 tmp = IsGamePlayedThrough();
    if (!tmp)
        return TRUE;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
        return FALSE;

    return gPlaySt.unk41_5;
}

void InitPlayConfig(int isDifficult)
{
    CpuFill16(0, &gPlaySt, sizeof(gPlaySt));

    gPlaySt.chapterIndex = 0;

    if (isDifficult)
        gPlaySt.chapterStateBits |= PLAY_FLAG_HARD;

    gPlaySt.cfgAnimationType = 0;
    gPlaySt.cfgDisableTerrainDisplay = 0;
    gPlaySt.cfgUnitDisplayType = 0;
    gPlaySt.cfgAutoCursor = 0;
    gPlaySt.cfgTextSpeed = 1;
    gPlaySt.cfgGameSpeed = 0;
    gPlaySt.cfgDisableBgm = 0;
    gPlaySt.cfgDisableSoundEffects = 0;
    gPlaySt.config_window_theme = 0;
    gPlaySt.cfgDisableAutoEndTurns = 0;
    gPlaySt.cfgNoSubtitleHelp = 0;
    gPlaySt.cfgBattleForecastType = 0;
    gPlaySt.debugControlRed = 0;
    gPlaySt.debugControlGreen = 0;
    gPlaySt.cfgUnitColor = 0;
    gPlaySt.unk41_5 = 0;
}

void ResetBmSt(void)
{
    int lock = gBmSt.lock;

    CpuFill16(0, &gBmSt, sizeof(gBmSt));
    gBmSt.lock = lock;
}

void StartBattleMap(struct Proc * gameCtrl)
{
    InitBgs(NULL);

    SetMainFunc(OnMain);
    SetOnVBlank(OnVBlank);

    ResetBmSt();
    ApplySystemGraphics();
    ApplyUnitSpritePalettes();
    ResetChapterFlags();
    ResetUnitSprites();
    InitTraps();

    gPlaySt.faction = FACTION_GREEN;
    gPlaySt.chapterTurnNumber = 0;

    gPlaySt.chapterVisionRange = GetChapterInfo(gPlaySt.chapterIndex)->fog;
    gPlaySt.chapterWeatherId = GetChapterInfo(gPlaySt.chapterIndex)->weather;

    InitBmBgLayers();
    InitChapterMap(gPlaySt.chapterIndex);
    InitMapObstacles();

    gPlaySt.time_chapter_started = GetGameTime();
    gPlaySt.chapterTotalSupportGain = 0;

    RefreshEntityMaps();
    RefreshUnitSprites();
    LoadChapterTraps();

    StartMapMain(gameCtrl);

    gPal[0] = 0;
    EnablePalSync();

    SetBlendTargetA(TRUE, TRUE, TRUE, TRUE, TRUE);
    SetBlendBackdropA(TRUE);

    SetBlendConfig(3, 0, 0, 0x10);
}

void RestartBattleMap(void)
{
    InitBgs(NULL);

    SetMainFunc(OnMain);
    SetOnVBlank(OnVBlank);

    ApplySystemGraphics();
    ApplyUnitSpritePalettes();
    ResetUnitSprites();

    InitTraps();

    gPlaySt.chapterWeatherId = GetChapterInfo(gPlaySt.chapterIndex)->weather;

    InitBmBgLayers();

    InitChapterMap(gPlaySt.chapterIndex);

    InitMapObstacles();
    LoadChapterTraps();
    BMapVSync_End();
    StartBmVSync();

    Proc_Start(ProcScr_MapTask, PROC_TREE_4);

    gPal[0] = 0;
    EnablePalSync();

    SetDispEnable(1, 1, 1, 0, 0);
}

void ResumeChapterFromSuspend(struct Proc * gameCtrl)
{
    struct MapMainProc * mapMain;

    InitBgs(NULL);

    SetMainFunc(OnMain);
    SetOnVBlank(OnVBlank);

    ResetBmSt();

    SetMapCursorPosition(gPlaySt.xCursor, gPlaySt.yCursor);

    ApplySystemGraphics();
    ApplyUnitSpritePalettes();
    ResetUnitSprites();

    InitChapterMap(gPlaySt.chapterIndex);

    gBmSt.just_resumed = TRUE;

    mapMain = StartMapMain(gameCtrl);

    gBmSt.camera.x = GetCameraCenteredX(16 * gBmSt.cursor.x);
    gBmSt.camera.y = GetCameraCenteredY(16 * gBmSt.cursor.y);

    switch (gActionSt.suspend_point)
    {
    case 1:
        ResumeMapMainDuringAction(mapMain);
        break;

    case 0:
    case 2:
        ResumeMapMainDuringPhase(mapMain);
        break;

    case 3:
        ResumeMapMainDuringBerserk(mapMain);
        break;

    case 4:
        ResumeMapMainDuringArena(mapMain);
        break;

    case 9:
        ResumeMapMainDuringPhaseChange(mapMain);
        break;
    }

    SetBlendTargetA(TRUE, TRUE, TRUE, TRUE, TRUE);
    SetBlendBackdropA(TRUE);

    SetBlendConfig(3, 0, 0, 0x10);
}

void RefreshBMapDisplay_FromBattle(void)
{
    SetMainFunc(OnMain);
    SetOnVBlank(OnVBlank);

    ApplySystemGraphics();
    ApplyUnitSpritePalettes();

    ClearUi();

    SetWinEnable(0, 0, 0);

    SetBlendNone();

    SetBlankChr(0);
    TmFill(gBg2Tm, 0);

    EnableBgSync(BG2_SYNC_BIT);
}

void BMapDispResume_FromBattleDelayed(void)
{
    ApplySystemObjectsGraphics();

    StartMu(&gBattleActor.unit);
    MU_SetDefaultFacing_Auto();

    Proc_Start(ProcScr_DelayedBMapDispResume, PROC_TREE_3);
}

void InitMoreBMapGraphics(void)
{
    UnpackChapterMapGraphics(gPlaySt.chapterIndex);
    AllocWeatherParticles(gPlaySt.chapterWeatherId);
    RenderMap();
    RefreshUnitSprites();
    ApplyUnitSpritePalettes();
    ForceSyncUnitSpriteSheet();
    InitSystemTextFont();
}

void RefreshBMapGraphics(void)
{
    InitBgs(NULL);

    ApplySystemGraphics();
    InitMoreBMapGraphics();
}

struct MapMainProc * StartMapMain(struct Proc * gameCtrl)
{
    struct MapMainProc * mapMain = Proc_Start(ProcScr_BmMain, PROC_TREE_2);

    mapMain->gameCtrl = gameCtrl;
    gameCtrl->proc_lockCnt++;

    StartBmVSync();
    Proc_Start(ProcScr_MapTask, PROC_TREE_4);

    return mapMain;
}

void EndMapMain(void)
{
    struct MapMainProc * mapMain;

    Proc_EndEachMarked(1);

    mapMain = Proc_Find(ProcScr_BmMain);
    mapMain->gameCtrl->proc_lockCnt--;

    Proc_End(mapMain);
}

void CleanupUnitsBeforeChapter(void)
{
    int i, j;

    for (i = 0x41; i < 0xC0; ++i)
    {
        struct Unit * unit = GetUnit(i);

        if (unit && unit->pCharacterData)
            ClearUnit(unit);
    }

    if (gPlaySt.chapterIndex != 0x2F)
    {
        for (j = 1; j < 0x40; ++j)
        {
            struct Unit * unit = GetUnit(j);

            if (unit && unit->pCharacterData)
            {
                SetUnitHp(unit, GetUnitMaxHp(unit));
                SetUnitStatus(unit, 0);

                unit->torchDuration = 0;
                unit->barrierDuration = 0;

                unit->state &= 0x0631E004;

                if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
                    unit->state &= ~US_DEAD;

                unit->state |= US_HIDDEN | US_NOT_DEPLOYED;

                unit->rescue = 0;
                unit->supportBits = 0;
            }
        }
    }
    else
    {
        for (j = 1; j < 0x40; ++j)
        {
            struct Unit * unit = GetUnit(j);

            if (unit && unit->pCharacterData)
            {
                unit->xPos = -1;
                unit->yPos = 1;

                SetUnitHp(unit, GetUnitMaxHp(unit));
                SetUnitStatus(unit, 0);

                unit->torchDuration = 0;
                unit->barrierDuration = 0;

                unit->state &= 0x0631E00C;

                if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
                    unit->state &= ~US_DEAD;

                unit->state |= US_HIDDEN;

                unit->rescue = 0;
                unit->supportBits = 0;
            }
        }
    }

    gPlaySt.chapterStateBits &= ~PLAY_FLAG_PREPSCREEN;
}

void ResumeMapMainDuringPhase(struct MapMainProc * mapMain)
{
    RefreshEntityMaps();
    RefreshUnitSprites();

    SetDispEnable(0, 0, 0, 0, 0);

    Proc_Goto(mapMain, 2);
}

void ResumeMapMainDuringAction(struct MapMainProc * mapMain)
{
    RefreshEntityMaps();
    RefreshUnitSprites();

    SetDispEnable(0, 0, 0, 0, 0);

    Proc_Goto(mapMain, 4);

    gActiveUnit = GetUnit(gActionSt.instigator);
    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0;

    HideUnitSprite(GetUnit(gActionSt.instigator));

    StartMu(gActiveUnit);
    MU_SetDefaultFacing_Auto();
}

void ResumeMapMainDuringBerserk(struct MapMainProc * mapMain)
{
    RefreshEntityMaps();
    RefreshUnitSprites();

    SetDispEnable(0, 0, 0, 0, 0);

    Proc_Goto(mapMain, 5);
}

void ResumeMapMainDuringArena(struct MapMainProc * mapMain)
{
    gActiveUnit = GetUnit(gActionSt.instigator);

    ArenaResume(gActiveUnit);

    BattleGenerateArena(gActiveUnit);
    BeginBattleAnimations();

    SetDispEnable(0, 0, 0, 0, 0);

    RefreshEntityMaps();

    gBmMapUnit[gActionSt.y_move][gActionSt.x_move] = 0;

    RefreshUnitSprites();

    Proc_Goto(mapMain, 8);

    sub_080B26A4();
}

void ResumeMapMainDuringPhaseChange(struct MapMainProc * mapMain)
{
    RefreshEntityMaps();
    RefreshUnitSprites();

    SetDispEnable(0, 0, 0, 0, 0);

    Proc_Goto(mapMain, 6);
}

void GameCtrl_DeclareCompletedChapter(void)
{
    RegisterChapterStats(&gPlaySt);

    ComputeChapterRankings();
    SaveEndgameRankings();

    gPlaySt.chapterStateBits |= PLAY_FLAG_COMPLETE;
}

void GameCtrl_SavePlayThroughData(void)
{
    SetNextGameAction(2);
    WriteCompletedPlaythroughSaveData();
}

char * GetTacticianName(void)
{
    return gPlaySt.playerName;
}

void SetTacticianName(const char * newName)
{
    strcpy(gPlaySt.playerName, newName);
}
