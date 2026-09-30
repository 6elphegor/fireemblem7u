/*
 * The SDL2 front end: a window showing the frame, the keyboard and game
 * controllers as the GBA's keys, and an audio device fed by HostAudioSubmit.
 *
 * Key bindings (DEFAULT_KEYS below) come from a keys file: --keys FILE, or
 * $XDG_CONFIG_HOME/fe7u/keys.txt (~/.config/fe7u/keys.txt), which the
 * first windowed run writes with the defaults.  One line per action,
 * `Action = binding, binding...`: SDL key names ("Z", "Return", "Left",
 * "Space", "F11"...) with optional modifiers ("Cmd+Q", "Ctrl+Shift+R"), or
 * a controller's "pad:BUTTON" / "pad:AXIS+" / "pad:AXIS-" (SDL game
 * controller names: a, b, x, y, back, start, dpup, leftshoulder, leftx,
 * righttrigger...).  A line replaces that action's defaults; an action with
 * no line keeps them.
 *
 * Headless runs initialize nothing of SDL (no window, no audio device).
 */
#define _POSIX_C_SOURCE 200809L
#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <sys/stat.h>
#include <time.h>

#include <SDL.h>

#include "platform.h"

static SDL_Window *sWindow;
static SDL_Renderer *sRenderer;
static SDL_Texture *sTexture;
static SDL_AudioDeviceID sAudio;
static int sAudioRate;
static int sHeadless = 1;

/* --- key bindings ------------------------------------------------------- */

enum {
    ACT_A, ACT_B, ACT_SELECT, ACT_START, ACT_RIGHT, ACT_LEFT, ACT_UP, ACT_DOWN,
    ACT_R, ACT_L,               /* the GBA's keys, in KEYINPUT bit order */
    ACT_FAST, ACT_FULLSCREEN, ACT_QUIT,
    ACT_COUNT
};

static const char *const sActionNames[ACT_COUNT] = {
    "A", "B", "Select", "Start", "Right", "Left", "Up", "Down", "R", "L",
    "FastForward", "Fullscreen", "Quit",
};

static const char DEFAULT_KEYS[] =
    "# Fire Emblem (native build): key bindings.  Action = binding, ...\n"
    "# Bindings: SDL key names (Z, Return, Left, Space, F11...), optionally with\n"
    "# modifiers (Cmd+Q, Ctrl+Shift+R), or controller buttons and axes\n"
    "# (pad:a, pad:dpup, pad:leftshoulder, pad:leftx-, pad:righttrigger+...).\n"
    "# Delete this file to get the defaults back.\n"
    "\n"
    "A           = Z, pad:a\n"
    "B           = X, pad:b\n"
    "L           = A, pad:leftshoulder\n"
    "R           = S, pad:rightshoulder\n"
    "Start       = Return, pad:start\n"
    "Select      = Backspace, pad:back\n"
    "Up          = Up, pad:dpup, pad:lefty-\n"
    "Down        = Down, pad:dpdown, pad:lefty+\n"
    "Left        = Left, pad:dpleft, pad:leftx-\n"
    "Right       = Right, pad:dpright, pad:leftx+\n"
    "\n"
    "# held\n"
    "FastForward = Tab, pad:righttrigger+\n"
    "# pressed\n"
    "Fullscreen  = F11, Alt+Return\n"
    "Quit        = Cmd+Q, Ctrl+Q\n";

enum { BIND_KEY, BIND_PADBUTTON, BIND_PADAXIS };

struct Binding {
    int kind;
    int code;   /* SDL_Scancode, SDL_GameControllerButton or SDL_GameControllerAxis */
    int mods;   /* BIND_KEY: KMOD_CTRL, KMOD_SHIFT, KMOD_ALT, KMOD_GUI bits needed */
    int sign;   /* BIND_PADAXIS: +1 or -1 */
};

#define MAX_BINDINGS 8
static struct Binding sBind[ACT_COUNT][MAX_BINDINGS];
static int sBindCount[ACT_COUNT];

#define MAX_PADS 4
static SDL_GameController *sPads[MAX_PADS];
#define AXIS_THRESHOLD 16000

static char *trim(char *p)
{
    char *e;
    while (isspace((unsigned char)*p))
        p++;
    e = p + strlen(p);
    while (e > p && isspace((unsigned char)e[-1]))
        *--e = 0;
    return p;
}

/* One binding ("Cmd+Q", "Left", "pad:a", "pad:leftx-"); 0 if unknown. */
static int parse_binding(const char *text, struct Binding *b)
{
    char buf[64];
    char *p;

    snprintf(buf, sizeof buf, "%s", text);
    p = buf;
    memset(b, 0, sizeof *b);
    if (strncmp(p, "pad:", 4) == 0) {
        char *name = p + 4;
        size_t n = strlen(name);
        if (n > 1 && (name[n - 1] == '+' || name[n - 1] == '-')) {
            b->sign = name[n - 1] == '+' ? 1 : -1;
            name[n - 1] = 0;
            b->kind = BIND_PADAXIS;
            b->code = SDL_GameControllerGetAxisFromString(name);
            return b->code != SDL_CONTROLLER_AXIS_INVALID;
        }
        b->kind = BIND_PADBUTTON;
        b->code = SDL_GameControllerGetButtonFromString(name);
        return b->code != SDL_CONTROLLER_BUTTON_INVALID;
    }
    /* modifiers: a prefix ending in '+', unless the '+' is the key itself */
    for (;;) {
        static const struct { const char *name; int mod; } mods[] = {
            { "cmd+", KMOD_GUI }, { "command+", KMOD_GUI }, { "gui+", KMOD_GUI },
            { "super+", KMOD_GUI }, { "ctrl+", KMOD_CTRL }, { "control+", KMOD_CTRL },
            { "shift+", KMOD_SHIFT }, { "alt+", KMOD_ALT }, { "option+", KMOD_ALT },
        };
        size_t i;
        int found = 0;
        for (i = 0; i < sizeof mods / sizeof mods[0]; i++) {
            size_t n = strlen(mods[i].name);
            if (strncasecmp(p, mods[i].name, n) == 0 && p[n]) {
                b->mods |= mods[i].mod;
                p += n;
                found = 1;
                break;
            }
        }
        if (!found)
            break;
    }
    b->kind = BIND_KEY;
    b->code = SDL_GetScancodeFromName(p);
    return b->code != SDL_SCANCODE_UNKNOWN;
}

/* Apply a keys file's text; `from` names it in messages. */
static void parse_keys(const char *text, const char *from)
{
    char *copy = strdup(text), *line, *next;
    int n = 0;

    for (line = copy; line; line = next) {
        char *eq, *name, *list, *tok, *save;
        int act;

        next = strchr(line, '\n');
        if (next)
            *next++ = 0;
        n++;
        if (strchr(line, '#'))
            *strchr(line, '#') = 0;
        line = trim(line);
        if (!*line)
            continue;
        eq = strchr(line, '=');
        if (!eq) {
            fprintf(stderr, "platform: %s:%d: expected Action = bindings\n", from, n);
            continue;
        }
        *eq = 0;
        name = trim(line);
        list = eq + 1;
        for (act = 0; act < ACT_COUNT; act++)
            if (strcasecmp(name, sActionNames[act]) == 0)
                break;
        if (act == ACT_COUNT) {
            fprintf(stderr, "platform: %s:%d: unknown action '%s'\n", from, n, name);
            continue;
        }
        {
            struct Binding got[MAX_BINDINGS];
            int count = 0, bad = 0;
            for (tok = strtok_r(list, ",", &save); tok; tok = strtok_r(NULL, ",", &save)) {
                struct Binding b;
                tok = trim(tok);
                if (!*tok)
                    continue;
                if (!parse_binding(tok, &b)) {
                    fprintf(stderr, "platform: %s:%d: unknown key or button '%s'\n", from, n, tok);
                    bad++;
                    continue;
                }
                if (count < MAX_BINDINGS)
                    got[count++] = b;
            }
            /* nothing usable on the line: keep what the action had (an empty
             * line, `Quit =`, unbinds it) */
            if (count == 0 && bad) {
                fprintf(stderr, "platform: %s:%d: keeping %s's previous bindings\n", from, n, sActionNames[act]);
                continue;
            }
            memcpy(sBind[act], got, count * sizeof got[0]);
            sBindCount[act] = count;
        }
    }
    free(copy);
}

static char *read_file(const char *path)
{
    FILE *f = fopen(path, "rb");
    char *buf;
    long size;

    if (!f)
        return NULL;
    fseek(f, 0, SEEK_END);
    size = ftell(f);
    fseek(f, 0, SEEK_SET);
    buf = malloc(size + 1);
    if (buf && fread(buf, 1, size, f) != (size_t)size) {
        free(buf);
        buf = NULL;
    }
    if (buf)
        buf[size] = 0;
    fclose(f);
    return buf;
}

/* ~/.config/fe7u/keys.txt (or under $XDG_CONFIG_HOME), creating the folder */
static int default_keys_path(char *out, size_t size)
{
    const char *xdg = getenv("XDG_CONFIG_HOME"), *home = getenv("HOME");
    char dir[1024];

    if (xdg && *xdg)
        snprintf(dir, sizeof dir, "%s", xdg);
    else if (home && *home)
        snprintf(dir, sizeof dir, "%s/.config", home);
    else
        return 0;
    mkdir(dir, 0755);
    snprintf(out, size, "%s/fe7u", dir);
    if (mkdir(out, 0755) != 0 && errno != EEXIST)
        return 0;
    snprintf(out, size, "%s/fe7u/keys.txt", dir);
    return 1;
}

static void load_keys(void)
{
    char path[1100];
    const char *file = gHostOptions.keys;
    char *text;

    parse_keys(DEFAULT_KEYS, "defaults");
    if (!file) {
        if (!default_keys_path(path, sizeof path))
            return;
        file = path;
    }
    text = read_file(file);
    if (text) {
        parse_keys(text, file);
        free(text);
        fprintf(stderr, "platform: key bindings from %s\n", file);
    } else if (gHostOptions.keys) {
        fprintf(stderr, "platform: can't read %s; default key bindings\n", file);
    } else {
        FILE *f = fopen(file, "w");
        if (f) {
            fputs(DEFAULT_KEYS, f);
            fclose(f);
            fprintf(stderr, "platform: key bindings: defaults written to %s (edit it to rebind)\n", file);
        }
    }
}

static int mods_match(int want, int have)
{
    static const int groups[] = { KMOD_CTRL, KMOD_SHIFT, KMOD_ALT, KMOD_GUI };
    size_t i;
    for (i = 0; i < sizeof groups / sizeof groups[0]; i++)
        if ((want & groups[i]) && !(have & groups[i]))
            return 0;
    return 1;
}

/* Is the action held now (keyboard state, controllers)? */
static int action_held(int act, const Uint8 *k, int mods)
{
    int i, p;
    for (i = 0; i < sBindCount[act]; i++) {
        const struct Binding *b = &sBind[act][i];
        switch (b->kind) {
        case BIND_KEY:
            if (k[b->code] && mods_match(b->mods, mods))
                return 1;
            break;
        case BIND_PADBUTTON:
            for (p = 0; p < MAX_PADS; p++)
                if (sPads[p] && SDL_GameControllerGetButton(sPads[p], b->code))
                    return 1;
            break;
        case BIND_PADAXIS:
            for (p = 0; p < MAX_PADS; p++)
                if (sPads[p] && SDL_GameControllerGetAxis(sPads[p], b->code) * b->sign > AXIS_THRESHOLD)
                    return 1;
            break;
        }
    }
    return 0;
}

/* Does this event press the action (a key or button going down)? */
static int action_pressed(int act, const SDL_Event *e)
{
    int i;
    for (i = 0; i < sBindCount[act]; i++) {
        const struct Binding *b = &sBind[act][i];
        if (b->kind == BIND_KEY && e->type == SDL_KEYDOWN && !e->key.repeat
            && e->key.keysym.scancode == (SDL_Scancode)b->code && mods_match(b->mods, e->key.keysym.mod))
            return 1;
        if (b->kind == BIND_PADBUTTON && e->type == SDL_CONTROLLERBUTTONDOWN && e->cbutton.button == b->code)
            return 1;
    }
    return 0;
}

static void open_pad(int index)
{
    int p;
    if (!SDL_IsGameController(index))
        return;
    for (p = 0; p < MAX_PADS; p++) {
        if (!sPads[p]) {
            sPads[p] = SDL_GameControllerOpen(index);
            if (sPads[p])
                fprintf(stderr, "platform: controller: %s\n", SDL_GameControllerName(sPads[p]));
            return;
        }
    }
}

static void close_pad(SDL_JoystickID id)
{
    int p;
    for (p = 0; p < MAX_PADS; p++) {
        if (sPads[p] && SDL_JoystickInstanceID(SDL_GameControllerGetJoystick(sPads[p])) == id) {
            SDL_GameControllerClose(sPads[p]);
            sPads[p] = NULL;
        }
    }
}

int FrontendInit(int headless, int scale)
{
    sHeadless = headless;
    if (headless)
        return 0;

    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO | SDL_INIT_EVENTS | SDL_INIT_GAMECONTROLLER) != 0) {
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
    load_keys();
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
    int mods, act;

    *keys = 0;
    *fast = 0;
    if (sHeadless)
        return 1;
    while (SDL_PollEvent(&e)) {
        if (e.type == SDL_QUIT)
            return 0;
        if (e.type == SDL_CONTROLLERDEVICEADDED)
            open_pad(e.cdevice.which);
        if (e.type == SDL_CONTROLLERDEVICEREMOVED)
            close_pad(e.cdevice.which);
        if (action_pressed(ACT_QUIT, &e))
            return 0;
        if (action_pressed(ACT_FULLSCREEN, &e)) {
            int full = SDL_GetWindowFlags(sWindow) & SDL_WINDOW_FULLSCREEN_DESKTOP;
            SDL_SetWindowFullscreen(sWindow, full ? 0 : SDL_WINDOW_FULLSCREEN_DESKTOP);
        }
    }
    k = SDL_GetKeyboardState(NULL);
    mods = SDL_GetModState();
    for (act = ACT_A; act <= ACT_L; act++)
        if (action_held(act, k, mods))
            m |= 1 << act;
    /* the hardware can't press opposite directions at once */
    if ((m & 0x30) == 0x30) m &= ~0x30;
    if ((m & 0xC0) == 0xC0) m &= ~0xC0;
    *keys = m;
    *fast = action_held(ACT_FAST, k, mods);
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
    {
        int p;
        for (p = 0; p < MAX_PADS; p++)
            if (sPads[p])
                SDL_GameControllerClose(sPads[p]);
        memset(sPads, 0, sizeof sPads);
    }
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
