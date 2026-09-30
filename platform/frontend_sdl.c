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
 * The window has a menu bar above the picture (drawn here, so it is the
 * same everywhere SDL runs): Controls lists every action with its
 * bindings; choose one and press a key or a controller button to rebind it
 * (Esc cancels; a key replaces the action's keys, a controller input its
 * controller bindings); the file is saved at once.  Esc opens and closes
 * the menu.  Text: font8x8 (platform/font8x8.h, public domain).
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
#include "font8x8.h"

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

static char sKeysPath[1100];

static void load_keys(void)
{
    char *path = sKeysPath;
    const char *file = gHostOptions.keys;
    char *text;

    parse_keys(DEFAULT_KEYS, "defaults");
    if (!file) {
        if (!default_keys_path(path, sizeof sKeysPath))
            return;
        file = path;
    } else {
        snprintf(sKeysPath, sizeof sKeysPath, "%s", file);
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


/* --- the menu bar -------------------------------------------------------- */

#define BAR_H 24        /* window pixels */
#define TEXT_SCALE 2    /* font8x8 glyphs at 16x16 */
#define ROW_H 22
#define NAME_COL (12 * 8 * TEXT_SCALE)   /* action names: the longest is 11 */

static SDL_Texture *sFont;      /* 128 glyphs of 8x8, white on transparent */

enum { MENU_CLOSED, MENU_OPEN, MENU_CAPTURE };
static int sMenu = MENU_CLOSED;
static int sHover = -1;         /* row under the mouse */
static int sCaptureAct = -1;
static int sInputHold;          /* frames of no game input after a rebind */

/* rows of the drop-down: every action, then these */
enum { ROW_RESET = ACT_COUNT, ROW_OPENFILE, ROW_COUNT };

static const SDL_Color COL_BAR = { 0x24, 0x1E, 0x2A, 0xFF };
static const SDL_Color COL_MENU = { 0x2E, 0x27, 0x36, 0xF4 };
static const SDL_Color COL_TEXT = { 0xF4, 0xEC, 0xE0, 0xFF };
static const SDL_Color COL_DIM = { 0xA8, 0x9C, 0xB0, 0xFF };
static const SDL_Color COL_ACCENT = { 0xD9, 0x77, 0x57, 0xFF };

static void make_font(void)
{
    Uint32 *px = calloc(128 * 8 * 8, 4);
    int c, x, y;

    for (c = 0; c < 128; c++)
        for (y = 0; y < 8; y++)
            for (x = 0; x < 8; x++)
                if (font8x8_basic[c][y] & (1 << x))
                    px[y * 128 * 8 + c * 8 + x] = 0xFFFFFFFFu;
    sFont = SDL_CreateTexture(sRenderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STATIC, 128 * 8, 8);
    if (sFont) {
        SDL_UpdateTexture(sFont, NULL, px, 128 * 8 * 4);
        SDL_SetTextureBlendMode(sFont, SDL_BLENDMODE_BLEND);
    }
    free(px);
}

static int text_width(const char *t)
{
    return (int)strlen(t) * 8 * TEXT_SCALE;
}

/* Draw at most maxw pixels of text (an ellipsis-free cut). */
static void draw_text(int x, int y, const char *t, SDL_Color c, int maxw)
{
    SDL_Rect src = { 0, 0, 8, 8 }, dst = { x, y, 8 * TEXT_SCALE, 8 * TEXT_SCALE };

    if (!sFont)
        return;
    SDL_SetTextureColorMod(sFont, c.r, c.g, c.b);
    SDL_SetTextureAlphaMod(sFont, c.a);
    for (; *t; t++) {
        if (maxw >= 0 && dst.x + dst.w > x + maxw)
            break;
        src.x = ((unsigned char)*t & 0x7F) * 8;
        SDL_RenderCopy(sRenderer, sFont, &src, &dst);
        dst.x += dst.w;
    }
}

static void fill(int x, int y, int w, int h, SDL_Color c)
{
    SDL_Rect r = { x, y, w, h };
    SDL_SetRenderDrawBlendMode(sRenderer, SDL_BLENDMODE_BLEND);
    SDL_SetRenderDrawColor(sRenderer, c.r, c.g, c.b, c.a);
    SDL_RenderFillRect(sRenderer, &r);
}

/* A binding as the keys file writes it (file) or as the menu shows it. */
static void binding_text(const struct Binding *b, char *out, size_t size, int file)
{
    static const struct { const char *sdl, *shown; } pads[] = {
        { "a", "Pad A" }, { "b", "Pad B" }, { "x", "Pad X" }, { "y", "Pad Y" },
        { "back", "Pad Back" }, { "start", "Pad Start" }, { "guide", "Pad Home" },
        { "leftshoulder", "Pad LB" }, { "rightshoulder", "Pad RB" },
        { "leftstick", "Pad L3" }, { "rightstick", "Pad R3" },
        { "dpup", "Pad Up" }, { "dpdown", "Pad Down" }, { "dpleft", "Pad Left" }, { "dpright", "Pad Right" },
    };
    const char *name;
    size_t i;

    switch (b->kind) {
    case BIND_KEY:
        snprintf(out, size, "%s%s%s%s%s",
                 b->mods & KMOD_GUI ? "Cmd+" : "", b->mods & KMOD_CTRL ? "Ctrl+" : "",
                 b->mods & KMOD_ALT ? "Alt+" : "", b->mods & KMOD_SHIFT ? "Shift+" : "",
                 SDL_GetScancodeName((SDL_Scancode)b->code));
        return;
    case BIND_PADBUTTON:
        name = SDL_GameControllerGetStringForButton((SDL_GameControllerButton)b->code);
        if (file) {
            snprintf(out, size, "pad:%s", name ? name : "?");
            return;
        }
        for (i = 0; i < sizeof pads / sizeof pads[0]; i++)
            if (name && strcmp(name, pads[i].sdl) == 0) {
                snprintf(out, size, "%s", pads[i].shown);
                return;
            }
        snprintf(out, size, "Pad %s", name ? name : "?");
        return;
    case BIND_PADAXIS:
        name = SDL_GameControllerGetStringForAxis((SDL_GameControllerAxis)b->code);
        if (file)
            snprintf(out, size, "pad:%s%c", name ? name : "?", b->sign > 0 ? '+' : '-');
        else if (b->code == SDL_CONTROLLER_AXIS_LEFTX)
            snprintf(out, size, "Stick %s", b->sign > 0 ? "Right" : "Left");
        else if (b->code == SDL_CONTROLLER_AXIS_LEFTY)
            snprintf(out, size, "Stick %s", b->sign > 0 ? "Down" : "Up");
        else if (b->code == SDL_CONTROLLER_AXIS_TRIGGERLEFT)
            snprintf(out, size, "Pad LT");
        else if (b->code == SDL_CONTROLLER_AXIS_TRIGGERRIGHT)
            snprintf(out, size, "Pad RT");
        else
            snprintf(out, size, "Pad %s%c", name ? name : "?", b->sign > 0 ? '+' : '-');
        return;
    }
    out[0] = 0;
}

static void action_text(int act, char *out, size_t size, int file)
{
    int i;
    size_t n = 0;

    out[0] = 0;
    for (i = 0; i < sBindCount[act] && n + 2 < size; i++) {
        char one[64];
        binding_text(&sBind[act][i], one, sizeof one, file);
        n += snprintf(out + n, size - n, "%s%s", i ? ", " : "", one);
    }
    if (!file && sBindCount[act] == 0)
        snprintf(out, size, "(none)");
}

static void save_keys(void)
{
    FILE *f;
    int act;
    const char *end;

    if (!sKeysPath[0])
        return;
    f = fopen(sKeysPath, "w");
    if (!f) {
        fprintf(stderr, "platform: can't write %s\n", sKeysPath);
        return;
    }
    /* the defaults' comment header, then the actions */
    end = strstr(DEFAULT_KEYS, "\n\n");
    fwrite(DEFAULT_KEYS, 1, end ? (size_t)(end - DEFAULT_KEYS) + 2 : 0, f);
    for (act = 0; act < ACT_COUNT; act++) {
        char text[512];
        action_text(act, text, sizeof text, 1);
        fprintf(f, "%-11s = %s\n", sActionNames[act], text);
    }
    fclose(f);
}

/* Set a new binding: a key replaces the action's keys, a controller input
 * its controller bindings. */
static void rebind(int act, const struct Binding *nb)
{
    struct Binding keep[MAX_BINDINGS];
    int i, n = 0, pad = nb->kind != BIND_KEY;

    for (i = 0; i < sBindCount[act]; i++)
        if ((sBind[act][i].kind != BIND_KEY) != pad && n < MAX_BINDINGS - 1)
            keep[n++] = sBind[act][i];
    keep[n++] = *nb;
    memcpy(sBind[act], keep, n * sizeof keep[0]);
    sBindCount[act] = n;
    save_keys();
}

static void reset_keys(void)
{
    memset(sBindCount, 0, sizeof sBindCount);
    parse_keys(DEFAULT_KEYS, "defaults");
    save_keys();
}

/* the drop-down's rows: x, y of row r */
static int menu_width(void)
{
    int w, h;
    SDL_GetRendererOutputSize(sRenderer, &w, &h);
    return w - 8;
}

static SDL_Rect menu_row(int r)
{
    SDL_Rect rect = { 4, BAR_H + 4 + r * ROW_H + (r >= ROW_RESET ? 8 : 0), menu_width(), ROW_H };
    return rect;
}

static SDL_Rect controls_label(void)
{
    SDL_Rect r = { 4, 0, text_width("Controls") + 20, BAR_H };
    return r;
}

static int row_at(int x, int y)
{
    int r;
    for (r = 0; r < ROW_COUNT; r++) {
        SDL_Rect rr = menu_row(r);
        if (x >= rr.x && x < rr.x + rr.w && y >= rr.y && y < rr.y + rr.h)
            return r;
    }
    return -1;
}

static void draw_menu(void)
{
    SDL_Rect cl = controls_label();
    int w, h, r;

    SDL_GetRendererOutputSize(sRenderer, &w, &h);
    fill(0, 0, w, BAR_H, COL_BAR);
    if (sMenu != MENU_CLOSED)
        fill(cl.x, cl.y, cl.w, cl.h, COL_MENU);
    draw_text(cl.x + 10, (BAR_H - 16) / 2, "Controls", sMenu != MENU_CLOSED ? COL_ACCENT : COL_TEXT, -1);
    {
        const char *hint = sMenu == MENU_CLOSED ? "Esc: controls"
                         : sMenu == MENU_CAPTURE ? "Esc: cancel" : "click to rebind";
        draw_text(w - text_width(hint) - 10, (BAR_H - 16) / 2, hint, COL_DIM, -1);
    }
    if (sMenu == MENU_CLOSED)
        return;

    {
        SDL_Rect last = menu_row(ROW_COUNT - 1);
        fill(0, BAR_H, menu_width() + 8, last.y + last.h + 4 - BAR_H, COL_MENU);
        fill(4, menu_row(ROW_RESET).y - 5, menu_width(), 1, COL_DIM);
    }
    for (r = 0; r < ROW_COUNT; r++) {
        SDL_Rect rr = menu_row(r);
        int ty = rr.y + (ROW_H - 16) / 2;
        int hot = r == sHover || (sMenu == MENU_CAPTURE && r == sCaptureAct);

        if (hot)
            fill(rr.x, rr.y, rr.w, rr.h, sMenu == MENU_CAPTURE ? COL_ACCENT : COL_BAR);
        if (r < ACT_COUNT) {
            char text[256];
            SDL_Color name = hot && sMenu == MENU_CAPTURE ? COL_BAR : COL_TEXT;
            if (sMenu == MENU_CAPTURE && r == sCaptureAct)
                snprintf(text, sizeof text, "press a key or button");
            else
                action_text(r, text, sizeof text, 0);
            draw_text(rr.x + 8, ty, sActionNames[r], name, -1);
            draw_text(rr.x + 8 + NAME_COL, ty, text, hot && sMenu == MENU_CAPTURE ? COL_BAR : COL_DIM,
                      rr.w - 16 - NAME_COL);
        } else if (r == ROW_RESET) {
            draw_text(rr.x + 8, ty, "Reset to defaults", COL_TEXT, -1);
        } else {
            draw_text(rr.x + 8, ty, "Open keys file", COL_TEXT, -1);
        }
    }
}

static void open_keys_file(void)
{
    char url[1200];
    if (!sKeysPath[0])
        return;
    save_keys();
    snprintf(url, sizeof url, "file://%s", sKeysPath);
#if SDL_VERSION_ATLEAST(2, 0, 14)
    if (SDL_OpenURL(url) != 0)
        fprintf(stderr, "platform: can't open %s: %s\n", sKeysPath, SDL_GetError());
#else
    fprintf(stderr, "platform: key bindings are in %s\n", sKeysPath);
#endif
}

static int is_modifier(SDL_Scancode sc)
{
    return sc == SDL_SCANCODE_LCTRL || sc == SDL_SCANCODE_RCTRL || sc == SDL_SCANCODE_LSHIFT
        || sc == SDL_SCANCODE_RSHIFT || sc == SDL_SCANCODE_LALT || sc == SDL_SCANCODE_RALT
        || sc == SDL_SCANCODE_LGUI || sc == SDL_SCANCODE_RGUI;
}

/* The menu's share of an event; 1 if it took it. */
static int menu_event(const SDL_Event *e)
{
    struct Binding b;

    if (sMenu == MENU_CAPTURE) {
        memset(&b, 0, sizeof b);
        if (e->type == SDL_KEYDOWN && !e->key.repeat) {
            SDL_Scancode sc = e->key.keysym.scancode;
            if (sc == SDL_SCANCODE_ESCAPE) {
                sMenu = MENU_OPEN;
                return 1;
            }
            if (is_modifier(sc))
                return 1;
            b.kind = BIND_KEY;
            b.code = sc;
            b.mods = e->key.keysym.mod & (KMOD_CTRL | KMOD_SHIFT | KMOD_ALT | KMOD_GUI);
        } else if (e->type == SDL_CONTROLLERBUTTONDOWN) {
            b.kind = BIND_PADBUTTON;
            b.code = e->cbutton.button;
        } else if (e->type == SDL_CONTROLLERAXISMOTION && abs(e->caxis.value) > 24000) {
            b.kind = BIND_PADAXIS;
            b.code = e->caxis.axis;
            b.sign = e->caxis.value > 0 ? 1 : -1;
        } else if (e->type == SDL_MOUSEBUTTONDOWN) {
            sMenu = MENU_OPEN;
            return 1;
        } else {
            return e->type == SDL_KEYUP || e->type == SDL_CONTROLLERBUTTONUP;
        }
        rebind(sCaptureAct, &b);
        sMenu = MENU_OPEN;
        sInputHold = 20;
        return 1;
    }

    switch (e->type) {
    case SDL_KEYDOWN:
        if (e->key.keysym.scancode == SDL_SCANCODE_ESCAPE && !e->key.repeat) {
            sMenu = sMenu == MENU_CLOSED ? MENU_OPEN : MENU_CLOSED;
            sHover = -1;
            sInputHold = 10;
            return 1;
        }
        return sMenu != MENU_CLOSED;
    case SDL_MOUSEMOTION:
        sHover = sMenu == MENU_OPEN ? row_at(e->motion.x, e->motion.y) : -1;
        return sMenu != MENU_CLOSED;
    case SDL_MOUSEBUTTONDOWN: {
        SDL_Rect cl = controls_label();
        int x = e->button.x, y = e->button.y, r;
        if (y < BAR_H && x >= cl.x && x < cl.x + cl.w) {
            sMenu = sMenu == MENU_CLOSED ? MENU_OPEN : MENU_CLOSED;
            return 1;
        }
        if (sMenu == MENU_CLOSED)
            return 0;
        r = row_at(x, y);
        if (r < 0) {
            sMenu = MENU_CLOSED;
        } else if (r < ACT_COUNT) {
            sMenu = MENU_CAPTURE;
            sCaptureAct = r;
        } else if (r == ROW_RESET) {
            reset_keys();
        } else if (r == ROW_OPENFILE) {
            open_keys_file();
        }
        return 1;
    }
    }
    return 0;
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
                               PPU_WIDTH * scale, PPU_HEIGHT * scale + BAR_H, SDL_WINDOW_RESIZABLE);
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
    load_keys();
    make_font();
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
        if (menu_event(&e))
            continue;
        if (action_pressed(ACT_QUIT, &e))
            return 0;
        if (action_pressed(ACT_FULLSCREEN, &e)) {
            int full = SDL_GetWindowFlags(sWindow) & SDL_WINDOW_FULLSCREEN_DESKTOP;
            SDL_SetWindowFullscreen(sWindow, full ? 0 : SDL_WINDOW_FULLSCREEN_DESKTOP);
        }
    }
    /* no game input while the menu is open or just after a rebind */
    if (sMenu != MENU_CLOSED || sInputHold > 0) {
        if (sInputHold > 0)
            sInputHold--;
        return 1;
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
    SDL_SetRenderDrawColor(sRenderer, 0, 0, 0, 0xFF);
    SDL_RenderClear(sRenderer);
    {
        /* the picture below the menu bar, as large as fits at 3:2 */
        int w, h;
        SDL_Rect dst;
        SDL_GetRendererOutputSize(sRenderer, &w, &h);
        h -= BAR_H;
        if (w * PPU_HEIGHT > h * PPU_WIDTH) {
            dst.h = h;
            dst.w = h * PPU_WIDTH / PPU_HEIGHT;
        } else {
            dst.w = w;
            dst.h = w * PPU_HEIGHT / PPU_WIDTH;
        }
        dst.x = (w - dst.w) / 2;
        dst.y = BAR_H + (h - dst.h) / 2;
        SDL_RenderCopy(sRenderer, sTexture, NULL, &dst);
    }
    draw_menu();
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
    if (sFont)
        SDL_DestroyTexture(sFont);
    sFont = NULL;
    sMenu = MENU_CLOSED;
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
