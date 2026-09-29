/*
 * The SDL2 front end: a window showing the frame, the keyboard as the GBA's
 * keys, and an audio device fed by HostAudioSubmit.
 *
 *   arrows       D-pad          Z / X        A / B
 *   A / S        L / R          Enter        Start
 *   Backspace    Select         Tab (held)   fast forward
 *   Esc          quit
 *
 * Headless runs initialize nothing of SDL (no window, no audio device).
 */
#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <time.h>

#include <SDL.h>

#include "platform.h"

static SDL_Window *sWindow;
static SDL_Renderer *sRenderer;
static SDL_Texture *sTexture;
static SDL_AudioDeviceID sAudio;
static int sAudioRate;
static int sHeadless = 1;

int FrontendInit(int headless, int scale)
{
    sHeadless = headless;
    if (headless)
        return 0;

    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO | SDL_INIT_EVENTS) != 0) {
        fprintf(stderr, "platform: SDL_Init: %s\n", SDL_GetError());
        return -1;
    }
    sWindow = SDL_CreateWindow("Fire Emblem", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
                               PPU_WIDTH * scale, PPU_HEIGHT * scale, SDL_WINDOW_RESIZABLE);
    if (!sWindow) {
        fprintf(stderr, "platform: SDL_CreateWindow: %s\n", SDL_GetError());
        return -1;
    }
    sRenderer = SDL_CreateRenderer(sWindow, -1, SDL_RENDERER_ACCELERATED);
    if (!sRenderer)
        sRenderer = SDL_CreateRenderer(sWindow, -1, 0);
    if (!sRenderer) {
        fprintf(stderr, "platform: SDL_CreateRenderer: %s\n", SDL_GetError());
        return -1;
    }
    SDL_RenderSetLogicalSize(sRenderer, PPU_WIDTH, PPU_HEIGHT);
    /* 0x00BBGGRR words: red in the lowest byte, ABGR8888 on little-endian */
    sTexture = SDL_CreateTexture(sRenderer, SDL_PIXELFORMAT_ABGR8888, SDL_TEXTUREACCESS_STREAMING,
                                 PPU_WIDTH, PPU_HEIGHT);
    if (!sTexture) {
        fprintf(stderr, "platform: SDL_CreateTexture: %s\n", SDL_GetError());
        return -1;
    }
    return 0;
}

static void open_audio(int rate)
{
    SDL_AudioSpec want, have;

    if (sAudio) {
        if (rate == sAudioRate)
            return;
        SDL_CloseAudioDevice(sAudio);
        sAudio = 0;
    }
    SDL_zero(want);
    want.freq = rate;
    want.format = AUDIO_S16SYS;
    want.channels = 2;
    want.samples = 512;
    sAudio = SDL_OpenAudioDevice(NULL, 0, &want, &have, 0);
    if (!sAudio) {
        fprintf(stderr, "platform: no audio: %s\n", SDL_GetError());
        sAudioRate = -1;
        return;
    }
    sAudioRate = rate;
    SDL_PauseAudioDevice(sAudio, 0);
}

void FrontendAudioQueue(const s16 *stereo, int frames, int rate)
{
    if (sHeadless || sAudioRate < 0)
        return;
    open_audio(rate);
    if (!sAudio)
        return;
    /* keep the latency bounded: drop what would queue past ~0.2 s */
    if (SDL_GetQueuedAudioSize(sAudio) > (Uint32)(rate / 5) * 4)
        return;
    SDL_QueueAudio(sAudio, stereo, (Uint32)frames * 4);
}

int FrontendPoll(u16 *keys, int *fast)
{
    SDL_Event e;
    const Uint8 *k;
    u16 m = 0;

    *keys = 0;
    *fast = 0;
    if (sHeadless)
        return 1;
    while (SDL_PollEvent(&e)) {
        if (e.type == SDL_QUIT)
            return 0;
        if (e.type == SDL_KEYDOWN && e.key.keysym.sym == SDLK_ESCAPE)
            return 0;
    }
    k = SDL_GetKeyboardState(NULL);
    if (k[SDL_SCANCODE_Z]) m |= 1 << 0;         /* A */
    if (k[SDL_SCANCODE_X]) m |= 1 << 1;         /* B */
    if (k[SDL_SCANCODE_BACKSPACE]) m |= 1 << 2; /* Select */
    if (k[SDL_SCANCODE_RETURN]) m |= 1 << 3;    /* Start */
    if (k[SDL_SCANCODE_RIGHT]) m |= 1 << 4;
    if (k[SDL_SCANCODE_LEFT]) m |= 1 << 5;
    if (k[SDL_SCANCODE_UP]) m |= 1 << 6;
    if (k[SDL_SCANCODE_DOWN]) m |= 1 << 7;
    if (k[SDL_SCANCODE_S]) m |= 1 << 8;         /* R */
    if (k[SDL_SCANCODE_A]) m |= 1 << 9;         /* L */
    /* the hardware can't press opposite directions at once */
    if ((m & 0x30) == 0x30) m &= ~0x30;
    if ((m & 0xC0) == 0xC0) m &= ~0xC0;
    *keys = m;
    *fast = k[SDL_SCANCODE_TAB] != 0;
    return 1;
}

void FrontendPresent(const uint32_t *fb)
{
    if (sHeadless || !sTexture)
        return;
    SDL_UpdateTexture(sTexture, NULL, fb, PPU_WIDTH * 4);
    SDL_RenderClear(sRenderer);
    SDL_RenderCopy(sRenderer, sTexture, NULL, NULL);
    SDL_RenderPresent(sRenderer);
}

void FrontendQuit(void)
{
    if (sHeadless)
        return;
    if (sAudio)
        SDL_CloseAudioDevice(sAudio);
    if (sTexture)
        SDL_DestroyTexture(sTexture);
    if (sRenderer)
        SDL_DestroyRenderer(sRenderer);
    if (sWindow)
        SDL_DestroyWindow(sWindow);
    sAudio = 0;
    sTexture = NULL;
    sRenderer = NULL;
    sWindow = NULL;
    SDL_Quit();
    sHeadless = 1;
}

int64_t FrontendNow(void)
{
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (int64_t)ts.tv_sec * 1000000000LL + ts.tv_nsec;
}

void FrontendSleepUntil(int64_t t)
{
    int64_t d = t - FrontendNow();
    if (d > 0) {
        struct timespec ts = { (time_t)(d / 1000000000LL), (long)(d % 1000000000LL) };
        nanosleep(&ts, NULL);
    }
}
