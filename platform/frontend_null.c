/*
 * The front end without SDL (platform.mk uses it when sdl2-config isn't
 * found): headless runs only.
 */
#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <time.h>

#include "platform.h"

int FrontendInit(int headless, int scale)
{
    (void)scale;
    if (!headless) {
        fprintf(stderr, "platform: built without SDL2; only --headless runs\n");
        return -1;
    }
    return 0;
}

int FrontendPoll(u16 *keys, int *fast)
{
    *keys = 0;
    *fast = 0;
    return 1;
}

void FrontendPresent(const uint32_t *fb) { (void)fb; }
void FrontendAudioQueue(const s16 *stereo, int frames, int rate) { (void)stereo; (void)frames; (void)rate; }
void FrontendQuit(void) { }

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
