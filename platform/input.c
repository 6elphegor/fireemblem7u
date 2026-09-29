/*
 * Input for headless (and scripted) runs: the emutest formats.
 *
 * Either an input script (tests/inputs/NAME.txt; the language is described in
 * tools/emutest.py and compiled here the same way: wait, hold, press,
 * shot, repeat/end, sram), or the plan tools/emutest.py compiles a script
 * into ("frames N", "keys FRAME MASK", "shot FRAME NAME", "sram FILE").
 * Either way the result is a list of key changes and shots by frame number,
 * the frame numbers of tools/emutest.c.
 */
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "platform.h"

struct KeyEvent { long frame; u16 mask; };
struct Shot { long frame; char *name; };

struct HostScript {
    struct KeyEvent *ev;
    int nev, cev;
    struct Shot *shots;
    int nshots, cshots;
    long frames;
    char *sram;
    int sramIsDesc;
    /* lookups go forward; remember where */
    int evPos, shotPos;
};

struct Line { int n; int argc; char *argv[8]; };

static void add_event(struct HostScript *s, long frame, u16 mask)
{
    if (s->nev && s->ev[s->nev - 1].frame == frame) {
        s->ev[s->nev - 1].mask = mask;
        return;
    }
    if (s->nev == s->cev) {
        s->cev = s->cev ? 2 * s->cev : 64;
        s->ev = realloc(s->ev, s->cev * sizeof *s->ev);
    }
    s->ev[s->nev].frame = frame;
    s->ev[s->nev].mask = mask;
    s->nev++;
}

static int shot_used(struct HostScript *s, const char *name)
{
    int i;
    for (i = 0; i < s->nshots; i++)
        if (strcmp(s->shots[i].name, name) == 0)
            return 1;
    return 0;
}

static void add_shot(struct HostScript *s, long frame, const char *name)
{
    if (s->nshots == s->cshots) {
        s->cshots = s->cshots ? 2 * s->cshots : 16;
        s->shots = realloc(s->shots, s->cshots * sizeof *s->shots);
    }
    s->shots[s->nshots].frame = frame;
    s->shots[s->nshots].name = strdup(name);
    s->nshots++;
}

static int keymask(const char *spec, u16 *out)
{
    static const char *const names[] = { "a", "b", "select", "start", "right", "left", "up", "down", "r", "l" };
    char buf[128], *tok, *save = NULL;
    u16 m = 0;

    snprintf(buf, sizeof buf, "%s", spec);
    for (tok = strtok_r(buf, "+", &save); tok; tok = strtok_r(NULL, "+", &save)) {
        int i, found = 0;
        char *c;
        for (c = tok; *c; c++)
            *c = (char)tolower((unsigned char)*c);
        for (i = 0; i < 10; i++)
            if (strcmp(tok, names[i]) == 0) {
                m |= (u16)(1 << i);
                found = 1;
            }
        if (!found)
            return -1;
    }
    *out = m;
    return 0;
}

struct Compiler {
    struct HostScript *s;
    const char *path;
    long frame;
    int error;
};

static void err(struct Compiler *c, int n, const char *msg)
{
    if (!c->error)
        fprintf(stderr, "%s:%d: %s\n", c->path, n, msg);
    c->error = 1;
}

static void run_block(struct Compiler *c, struct Line *l, int count)
{
    int i = 0;

    while (i < count && !c->error) {
        const char *cmd = l[i].argv[0];
        int argc = l[i].argc;
        char **argv = l[i].argv;
        u16 m;

        if (strcmp(cmd, "repeat") == 0) {
            int depth = 1, j = i + 1, k, times;
            while (depth) {
                if (j >= count) {
                    err(c, l[i].n, "repeat without end");
                    return;
                }
                if (strcmp(l[j].argv[0], "repeat") == 0)
                    depth++;
                else if (strcmp(l[j].argv[0], "end") == 0)
                    depth--;
                j++;
            }
            times = argc > 1 ? atoi(argv[1]) : 0;
            for (k = 0; k < times; k++)
                run_block(c, l + i + 1, j - 1 - (i + 1));
            i = j;
            continue;
        }
        if (strcmp(cmd, "wait") == 0 && argc > 1) {
            add_event(c->s, c->frame, 0);
            c->frame += atol(argv[1]);
        } else if (strcmp(cmd, "hold") == 0 && argc > 2 && keymask(argv[1], &m) == 0) {
            add_event(c->s, c->frame, m);
            c->frame += atol(argv[2]);
            add_event(c->s, c->frame, 0);
        } else if (strcmp(cmd, "press") == 0 && argc > 1 && keymask(argv[1], &m) == 0) {
            long times = argc > 2 ? atol(argv[2]) : 1;
            long gap = argc > 3 ? atol(argv[3]) : 14;
            long k;
            for (k = 0; k < times; k++) {
                add_event(c->s, c->frame, m);
                c->frame += 2;
                add_event(c->s, c->frame, 0);
                c->frame += gap;
            }
        } else if (strcmp(cmd, "sram") == 0 && argc > 1) {
            if (c->frame || c->s->nev || c->s->nshots || c->s->sram)
                err(c, l[i].n, "sram must come first");
            c->s->sram = strdup(argv[1]);
            c->s->sramIsDesc = 1;
        } else if (strcmp(cmd, "shot") == 0 && argc > 1) {
            /* the frame just run; repeated names get _2, _3... */
            char name[256];
            int k = 1;
            snprintf(name, sizeof name, "%s", argv[1]);
            while (shot_used(c->s, name))
                snprintf(name, sizeof name, "%s_%d", argv[1], ++k);
            add_shot(c->s, c->frame > 0 ? c->frame - 1 : 0, name);
        } else {
            err(c, l[i].n, "unknown command or bad arguments");
        }
        i++;
    }
}

static char *read_file(const char *path)
{
    FILE *f = fopen(path, "rb");
    char *buf;
    long n;

    if (!f)
        return NULL;
    fseek(f, 0, SEEK_END);
    n = ftell(f);
    fseek(f, 0, SEEK_SET);
    buf = malloc(n + 1);
    if (fread(buf, 1, n, f) != (size_t)n) {
        fclose(f);
        free(buf);
        return NULL;
    }
    buf[n] = 0;
    fclose(f);
    return buf;
}

struct HostScript *HostScriptLoad(const char *path)
{
    char *text = read_file(path), *p, *save = NULL;
    struct HostScript *s;
    struct Line *lines = NULL;
    int nlines = 0, n = 0, isPlan = -1;

    if (!text) {
        fprintf(stderr, "platform: can't read %s\n", path);
        return NULL;
    }
    s = calloc(1, sizeof *s);

    /* split into lines of words, comments removed */
    for (p = text; p; p = save) {
        char *hash, *w, *ws = NULL, *nl = strchr(p, '\n');
        struct Line l;
        save = nl ? nl + 1 : NULL;
        if (nl)
            *nl = 0;
        hash = strchr(p, '#');
        n++;
        if (hash)
            *hash = 0;
        l.n = n;
        l.argc = 0;
        for (w = strtok_r(p, " \t\r", &ws); w && l.argc < 8; w = strtok_r(NULL, " \t\r", &ws))
            l.argv[l.argc++] = w;
        if (!l.argc)
            continue;
        if (isPlan < 0)
            isPlan = strcmp(l.argv[0], "frames") == 0;
        lines = realloc(lines, (nlines + 1) * sizeof *lines);
        lines[nlines++] = l;
    }

    if (isPlan == 1) {
        int i;
        for (i = 0; i < nlines; i++) {
            struct Line *l = &lines[i];
            if (strcmp(l->argv[0], "frames") == 0 && l->argc > 1)
                s->frames = atol(l->argv[1]);
            else if (strcmp(l->argv[0], "keys") == 0 && l->argc > 2)
                add_event(s, atol(l->argv[1]), (u16)strtoul(l->argv[2], NULL, 16));
            else if (strcmp(l->argv[0], "shot") == 0 && l->argc > 2)
                add_shot(s, atol(l->argv[1]), l->argv[2]);
            else if (strcmp(l->argv[0], "sram") == 0 && l->argc > 1)
                s->sram = strdup(l->argv[1]);
        }
    } else {
        struct Compiler c = { s, path, 0, 0 };
        run_block(&c, lines, nlines);
        s->frames = c.frame;
        if (c.error) {
            free(lines);
            free(text);
            return NULL;
        }
    }
    free(lines);
    free(text);
    return s;
}

u16 HostScriptKeys(struct HostScript *s, long frame)
{
    u16 keys = 0;
    int i;

    if (s->evPos > 0 && s->ev[s->evPos - 1].frame > frame)
        s->evPos = 0; /* went back (a soft reset doesn't; just in case) */
    for (i = s->evPos; i < s->nev && s->ev[i].frame <= frame; i++)
        ;
    s->evPos = i;
    if (i > 0)
        keys = s->ev[i - 1].mask;
    return keys;
}

const char *HostScriptShot(struct HostScript *s, long frame, int *index)
{
    int i;
    for (i = s->shotPos; i < s->nshots; i++) {
        if (s->shots[i].frame == frame) {
            s->shotPos = i + 1;
            if (index)
                *index = i;
            return s->shots[i].name;
        }
        if (s->shots[i].frame > frame)
            break;
    }
    return NULL;
}

long HostScriptFrames(const struct HostScript *s)
{
    return s->frames;
}

const char *HostScriptSram(const struct HostScript *s)
{
    return s->sram;
}

int HostScriptSramIsDesc(const struct HostScript *s)
{
    return s->sramIsDesc;
}
