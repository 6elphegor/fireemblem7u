/*
 * ppucapture: run the game in libmgba (MPL-2.0; linked, not vendored) with an
 * emutest input plan and check platform/ppu.c against mGBA's own picture.
 *
 *   ppucapture -p PLAN -o DIR [-e N] [-D] [-d N] [-m] ROM
 *     -p PLAN  input plan (tools/emutest.py's format: frames, keys, shot, sram)
 *     -o DIR   output directory
 *     -e N     compare every Nth frame (default 1: all)
 *     -D       at every `shot` frame, write a dump (DIR/NAME.ppu, see below)
 *     -d N     write A|B|diff PNGs of the first N differing frames of each kind
 *     -m       hardware color math (default: mGBA's, so pixels compare exactly)
 *
 * Every compared frame is rendered twice:
 *   live   line by line while mGBA draws it: platform/ppu.c reads mGBA's
 *          registers, palette, VRAM and OAM at the moment mGBA draws each
 *          line, and is told about BGxX/BGxY writes (mGBA's renderer
 *          callbacks are wrapped).  This checks the renderer itself.
 *   frame  from the state when line 0 was drawn (what a single dump holds):
 *          frames that change registers, palette, VRAM or OAM between lines
 *          (HBlank DMA and interrupts, drawing during the frame) can differ;
 *          the tool records which frames do, to separate those differences.
 *
 * Output (stdout, line oriented): "diff live|frame FRAME PIXELS [perline]"
 * for differing frames, "summary ..." at the end.
 *
 * Dump file (-D): "FE7PPU1\0", then the state when line 0 was drawn (I/O
 * 0x400, palette 0x400, VRAM 0x18000, OAM 0x400), then for lines 1-159 the
 * I/O registers, palette and a byte of flags (1: BG2X/Y or BG3X/Y were
 * written before this line; 2: VRAM, 4: OAM changed since line 0), then
 * mGBA's frame (240x160 32-bit 0x00BBGGRR).  platform/tools/ppurender.c
 * renders it.  Dumps contain game data: they stay in build/.
 */
#include <mgba/core/core.h>
#include <mgba/core/config.h>
#include <mgba/core/log.h>
#include <mgba/core/blip_buf.h>
#include <mgba/gba/core.h>
#include <mgba/internal/arm/arm.h>
#include <mgba/internal/gba/gba.h>
#include <mgba-util/vfs.h>

#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <zlib.h>

#include "ppu.h"

#define W 240
#define H 160

static void quietLog(struct mLogger *l, int cat, enum mLogLevel lvl, const char *fmt, va_list ap)
{
    (void)l; (void)cat; (void)lvl; (void)fmt; (void)ap;
}
static struct mLogger quiet = { .log = quietLog };

static void die(const char *fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    fprintf(stderr, "ppucapture: ");
    vfprintf(stderr, fmt, ap);
    fprintf(stderr, "\n");
    va_end(ap);
    exit(2);
}

/* ---- PNG ---- */
static void pngChunk(FILE *f, const char *type, const uint8_t *data, uint32_t len)
{
    uint8_t hdr[8] = { len >> 24, len >> 16, len >> 8, len, type[0], type[1], type[2], type[3] };
    fwrite(hdr, 1, 8, f);
    if (len)
        fwrite(data, 1, len, f);
    uLong crc = crc32(0, hdr + 4, 4);
    if (len)
        crc = crc32(crc, data, len);
    uint8_t c[4] = { crc >> 24, crc >> 16, crc >> 8, crc };
    fwrite(c, 1, 4, f);
}

static void writePng(const char *path, const uint8_t *rgb, int w, int h)
{
    FILE *f = fopen(path, "wb");
    if (!f)
        die("can't write %s", path);
    static const uint8_t sig[8] = { 137, 80, 78, 71, 13, 10, 26, 10 };
    fwrite(sig, 1, 8, f);
    uint8_t ihdr[13] = { 0, 0, w >> 8, w, 0, 0, h >> 8, h, 8, 2, 0, 0, 0 };
    pngChunk(f, "IHDR", ihdr, 13);
    size_t rawLen = (size_t)h * (w * 3 + 1);
    uint8_t *raw = malloc(rawLen);
    for (int y = 0; y < h; y++) {
        raw[y * (w * 3 + 1)] = 0;
        memcpy(raw + y * (w * 3 + 1) + 1, rgb + y * w * 3, w * 3);
    }
    uLongf zLen = compressBound(rawLen);
    uint8_t *z = malloc(zLen);
    compress2(z, &zLen, raw, rawLen, 6);
    pngChunk(f, "IDAT", z, zLen);
    pngChunk(f, "IEND", NULL, 0);
    fclose(f);
    free(raw);
    free(z);
}

/* mGBA | platform | differing pixels (magenta) */
static void saveCompare(const char *dir, const char *name, const uint32_t *a, const uint32_t *b)
{
    int ow = W * 3 + 8;
    uint8_t *o = calloc((size_t)ow * H * 3, 1);
    for (int y = 0; y < H; y++)
        for (int x = 0; x < W; x++) {
            uint32_t ca = a[y * W + x], cb = b[y * W + x];
            uint8_t *p;
            for (int k = 0; k < 3; k++) {
                o[(y * ow + x) * 3 + k] = ca >> (8 * k);
                o[(y * ow + W + 4 + x) * 3 + k] = cb >> (8 * k);
            }
            p = o + (y * ow + 2 * W + 8 + x) * 3;
            if ((ca ^ cb) & 0xFFFFFF) {
                p[0] = 255; p[1] = 0; p[2] = 255;
            } else {
                p[0] = p[1] = p[2] = ((ca & 0xFF) + ((ca >> 8) & 0xFF) + ((ca >> 16) & 0xFF)) / 12;
            }
        }
    char path[4096];
    snprintf(path, sizeof path, "%s/%s.png", dir, name);
    writePng(path, o, ow, H);
    free(o);
}

/* ---- plan ---- */
struct keyev { uint32_t frame, mask; };
struct shot { uint32_t frame; char name[128]; };
static struct keyev *keyevs;
static size_t nkeyevs;
static struct shot *shots;
static size_t nshots;
static uint32_t nframes;
static void *sramImage;
static size_t sramSize;

static void loadPlan(const char *path)
{
    FILE *f = fopen(path, "r");
    if (!f)
        die("can't open %s", path);
    char line[512];
    size_t kcap = 256, scap = 64;
    keyevs = malloc(kcap * sizeof *keyevs);
    shots = malloc(scap * sizeof *shots);
    while (fgets(line, sizeof line, f)) {
        unsigned a, b;
        char name[128];
        if (sscanf(line, "frames %u", &a) == 1)
            nframes = a;
        else if (sscanf(line, "keys %u %x", &a, &b) == 2) {
            if (nkeyevs == kcap)
                keyevs = realloc(keyevs, (kcap *= 2) * sizeof *keyevs);
            keyevs[nkeyevs++] = (struct keyev){ a, b };
        } else if (!strncmp(line, "sram ", 5)) {
            char *p = line + 5;
            p[strcspn(p, "\r\n")] = 0;
            FILE *s = fopen(p, "rb");
            if (!s)
                die("can't open %s", p);
            fseek(s, 0, SEEK_END);
            sramSize = ftell(s);
            fseek(s, 0, SEEK_SET);
            sramImage = malloc(sramSize);
            if (fread(sramImage, 1, sramSize, s) != sramSize)
                die("can't read %s", p);
            fclose(s);
        } else if (sscanf(line, "shot %u %127s", &a, name) == 2) {
            if (nshots == scap)
                shots = realloc(shots, (scap *= 2) * sizeof *shots);
            shots[nshots].frame = a;
            strcpy(shots[nshots].name, name);
            nshots++;
        }
    }
    fclose(f);
}

/* ---- the hooked renderer ---- */
static struct mCore *core;
static struct GBA *gba;
static struct GBAVideoRenderer *renderer;
static void (*origDrawScanline)(struct GBAVideoRenderer *, int);
static uint16_t (*origWriteVideoRegister)(struct GBAVideoRenderer *, uint32_t, uint16_t);
static void (*origWriteVRAM)(struct GBAVideoRenderer *, uint32_t);
static void (*origWriteOAM)(struct GBAVideoRenderer *, uint32_t);
static void (*origWritePalette)(struct GBAVideoRenderer *, uint32_t, uint16_t);

static struct Ppu livePpu;
static uint32_t liveFb[W * H];
static int comparing;      /* render live this frame */
static int dumping;        /* keep per-line state this frame */
static int midFrame;       /* between line 0 and line 159 of this frame */
static int lineWrites;     /* this frame: registers written between lines (bits: 1 video regs, 2 BGxX/Y) */
static int memWrites;      /* this frame: 1 palette, 2 VRAM, 4 OAM written between lines */
static int linesSeen;
static uint8_t pendingFlags;
static uint16_t lineRegs[H][0x30]; /* video registers as each line was drawn (for the log) */

struct LineState {
    uint8_t io[0x400], pal[0x400], flags;
};
static struct LineState dumpLines[H];
/* the state when line 0 was drawn: what a single dump of the frame holds */
static uint8_t snapIo[0x400], snapPal[0x400], snapVram[0x18000], snapOam[0x400];
static uint8_t dumpVram[0x18000], dumpOam[0x400];

static const uint8_t *ioBytes(void) { return (const uint8_t *)gba->memory.io; }
static const uint8_t *palBytes(void) { return (const uint8_t *)gba->video.palette; }
static const uint8_t *vramBytes(void) { return (const uint8_t *)gba->video.vram; }
static const uint8_t *oamBytes(void) { return (const uint8_t *)gba->video.oam.raw; }

static void hookDrawScanline(struct GBAVideoRenderer *r, int y)
{
    if (y == 0) {
        midFrame = 1;
        lineWrites = memWrites = 0;
        linesSeen = 0;
    }
    linesSeen++;
    memcpy(lineRegs[y], ioBytes(), sizeof lineRegs[y]);
    if (comparing && y == 0) {
        memcpy(snapIo, ioBytes(), sizeof snapIo);
        memcpy(snapPal, palBytes(), sizeof snapPal);
        memcpy(snapVram, vramBytes(), sizeof snapVram);
        memcpy(snapOam, oamBytes(), sizeof snapOam);
    }
    if (dumping) {
        struct LineState *l = &dumpLines[y];
        memcpy(l->io, ioBytes(), 0x400);
        memcpy(l->pal, palBytes(), 0x400);
        l->flags = y ? pendingFlags : 0;
        if (y == 0) {
            memcpy(dumpVram, vramBytes(), sizeof dumpVram);
            memcpy(dumpOam, oamBytes(), sizeof dumpOam);
        } else {
            if (memWrites & 2)
                l->flags |= 2;
            if (memWrites & 4)
                l->flags |= 4;
        }
        pendingFlags = 0;
    }
    if (comparing)
        ppu_render_line(&livePpu, y);
    origDrawScanline(r, y);
    if (y == H - 1)
        midFrame = 0;
}

static uint16_t hookWriteVideoRegister(struct GBAVideoRenderer *r, uint32_t address, uint16_t value)
{
    ppu_io_written(&livePpu, address);
    if (midFrame) {
        lineWrites |= 1;
        if ((address >= 0x28 && address < 0x30) || (address >= 0x38 && address < 0x40)) {
            lineWrites |= 2;
            pendingFlags |= 1;
        }
    }
    return origWriteVideoRegister(r, address, value);
}

static void hookWriteVRAM(struct GBAVideoRenderer *r, uint32_t address)
{
    if (midFrame)
        memWrites |= 2;
    origWriteVRAM(r, address);
}

static void hookWriteOAM(struct GBAVideoRenderer *r, uint32_t oam)
{
    if (midFrame)
        memWrites |= 4;
    origWriteOAM(r, oam);
}

static void hookWritePalette(struct GBAVideoRenderer *r, uint32_t address, uint16_t value)
{
    if (midFrame)
        memWrites |= 1;
    origWritePalette(r, address, value);
}

static void writeDump(const char *dir, const char *name, const uint32_t *frame)
{
    char path[4096];
    snprintf(path, sizeof path, "%s/%s.ppu", dir, name);
    FILE *f = fopen(path, "wb");
    if (!f)
        die("can't write %s", path);
    fwrite("FE7PPU1", 1, 8, f);
    fwrite(dumpLines[0].io, 1, 0x400, f);
    fwrite(dumpLines[0].pal, 1, 0x400, f);
    fwrite(dumpVram, 1, sizeof dumpVram, f);
    fwrite(dumpOam, 1, sizeof dumpOam, f);
    for (int y = 1; y < H; y++) {
        fwrite(dumpLines[y].io, 1, 0x400, f);
        fwrite(dumpLines[y].pal, 1, 0x400, f);
        fwrite(&dumpLines[y].flags, 1, 1, f);
    }
    for (int i = 0; i < W * H; i++) {
        uint32_t c = frame[i] & 0xFFFFFF;
        uint8_t b[4] = { c, c >> 8, c >> 16, 0 };
        fwrite(b, 1, 4, f);
    }
    fclose(f);
}

static long countDiff(const uint32_t *a, const uint32_t *b)
{
    long n = 0;
    for (int i = 0; i < W * H; i++)
        n += ((a[i] ^ b[i]) & 0xFFFFFF) != 0;
    return n;
}

int main(int argc, char **argv)
{
    const char *plan = NULL, *out = NULL;
    long every = 1, pngs = 4;
    int dumps = 0, hardware = 0, i;
    for (i = 1; i < argc && argv[i][0] == '-'; i++) {
        switch (argv[i][1]) {
        case 'p': plan = argv[++i]; break;
        case 'o': out = argv[++i]; break;
        case 'e': every = atol(argv[++i]); break;
        case 'd': pngs = atol(argv[++i]); break;
        case 'D': dumps = 1; break;
        case 'm': hardware = 1; break;
        default: die("unknown option %s", argv[i]);
        }
    }
    if (!plan || !out || i != argc - 1)
        die("usage: ppucapture -p PLAN -o DIR [-e N] [-D] [-d N] [-m] ROM");
    if (every < 1)
        every = 1;

    mLogSetDefaultLogger(&quiet);
    loadPlan(plan);
    core = GBACoreCreate();
    if (!core || !core->init(core))
        die("can't create an mGBA core");
    mCoreInitConfig(core, NULL);
    mCoreConfigSetDefaultIntValue(&core->config, "useBios", 0);
    mCoreConfigSetDefaultIntValue(&core->config, "skipBios", 1);
    mCoreConfigSetDefaultValue(&core->config, "idleOptimization", "ignore");
    mCoreConfigSetDefaultIntValue(&core->config, "sampleRate", 32768);
    mCoreLoadForeignConfig(core, &core->config);
    static color_t fb[W * H];
    core->setVideoBuffer(core, fb, W);
    core->setAudioBufferSize(core, 4096);
    struct VFile *vf = VFileOpen(argv[i], O_RDONLY);
    if (!vf || !core->loadROM(core, vf))
        die("can't load %s", argv[i]);
    if (sramImage && !core->loadSave(core, VFileMemChunk(sramImage, sramSize)))
        die("can't load the save image");
    core->reset(core);

    gba = core->board;
    renderer = gba->video.renderer;
    origDrawScanline = renderer->drawScanline;
    origWriteVideoRegister = renderer->writeVideoRegister;
    origWriteVRAM = renderer->writeVRAM;
    origWriteOAM = renderer->writeOAM;
    origWritePalette = renderer->writePalette;
    renderer->drawScanline = hookDrawScanline;
    renderer->writeVideoRegister = hookWriteVideoRegister;
    renderer->writeVRAM = hookWriteVRAM;
    renderer->writeOAM = hookWriteOAM;
    renderer->writePalette = hookWritePalette;

    ppu_init(&livePpu, ioBytes(), palBytes(), vramBytes(), oamBytes(), liveFb);
    livePpu.colorMath = hardware ? PPU_COLOR_HARDWARE : PPU_COLOR_MGBA;
    struct Ppu framePpu;
    static uint32_t frameFb[W * H], mgbaFb[W * H];
    ppu_init(&framePpu, snapIo, snapPal, snapVram, snapOam, frameFb);
    framePpu.colorMath = livePpu.colorMath;

    size_t ki = 0, si = 0;
    uint32_t keys = 0;
    long compared = 0, liveSame = 0, frameSame = 0, livePixels = 0, framePixels = 0;
    long perLine = 0, perLineFrameSame = 0, staticFrames = 0, staticFrameSame = 0;
    long livePng = 0, framePng = 0, blank = 0;
    char name[256];

    for (uint32_t frame = 0; frame < nframes; frame++) {
        while (ki < nkeyevs && keyevs[ki].frame <= frame)
            keys = keyevs[ki++].mask;
        int isShot = si < nshots && shots[si].frame == frame;
        comparing = frame % every == 0 || isShot;
        dumping = dumps && isShot;
        core->setKeys(core, keys);
        core->runFrame(core);
        {
            blip_t *l = core->getAudioChannel(core, 0), *r = core->getAudioChannel(core, 1);
            static int16_t audio[16384];
            int n = blip_samples_avail(l);
            if (n > 8192)
                n = 8192;
            blip_read_samples(l, audio, n, 1);
            blip_read_samples(r, audio + 1, n, 1);
        }
        if (comparing && linesSeen == H) {
            for (int k = 0; k < W * H; k++)
                mgbaFb[k] = fb[k] & 0xFFFFFF;
            ppu_render_frame(&framePpu, NULL, NULL);
            long dl = countDiff(mgbaFb, liveFb), df = countDiff(mgbaFb, frameFb);
            int changes = lineWrites || memWrites;
            compared++;
            if (snapIo[0] & 0x80)
                blank++;
            liveSame += dl == 0;
            frameSame += df == 0;
            livePixels += dl;
            framePixels += df;
            if (changes) {
                perLine++;
                perLineFrameSame += df == 0;
            } else {
                staticFrames++;
                staticFrameSame += df == 0;
            }
            if (dl) {
                int k = 0;
                while (!((mgbaFb[k] ^ liveFb[k]) & 0xFFFFFF))
                    k++;
                const uint16_t *lr = lineRegs[k / W];
                printf("diff live %u %ld%s at %d,%d mgba %06X here %06X dispcnt %04X bgcnt %04X %04X %04X %04X "
                       "win %04X %04X %04X %04X in/out %04X %04X mosaic %04X bld %04X %04X %04X\n",
                       frame, dl, changes ? " perline" : "", k % W, k / W, mgbaFb[k], liveFb[k],
                       lr[0], lr[4], lr[5], lr[6], lr[7], lr[0x20], lr[0x21], lr[0x22], lr[0x23],
                       lr[0x24], lr[0x25], lr[0x26], lr[0x28], lr[0x29], lr[0x2A]);
                if (livePng < pngs) {
                    snprintf(name, sizeof name, "live_%06u", frame);
                    saveCompare(out, name, mgbaFb, liveFb);
                    livePng++;
                }
            }
            if (df) {
                printf("diff frame %u %ld%s regs=%d mem=%d\n", frame, df, changes ? " perline" : "",
                       lineWrites, memWrites);
                if (framePng < pngs && !changes) {
                    snprintf(name, sizeof name, "frame_%06u", frame);
                    saveCompare(out, name, mgbaFb, frameFb);
                    framePng++;
                }
            }
        }
        if (isShot) {
            if (dumping)
                writeDump(out, shots[si].name, mgbaFb);
            si++;
            while (si < nshots && shots[si].frame <= frame)
                si++;
        }
        fflush(stdout);
    }
    printf("summary frames %ld live_same %ld frame_same %ld live_pixels %ld frame_pixels %ld "
           "perline_frames %ld perline_frame_same %ld static_frames %ld static_frame_same %ld forced_blank %ld\n",
           compared, liveSame, frameSame, livePixels, framePixels, perLine, perLineFrameSame,
           staticFrames, staticFrameSame, blank);
    core->deinit(core);
    return 0;
}
