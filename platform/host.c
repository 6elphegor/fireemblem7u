/*
 * The host machine: power-on, the frame loop and the command line
 * (docs/port-platform.md, "Frame").
 *
 * The game runs as on the GBA from AgbMain until it waits for VBlank
 * (VBlankIntrWait, IntrWait, Halt; platform/bios.c calls the hooks set
 * here).  The wait runs one frame of the display, HostRunFrame:
 *
 *   lines 160..227   the rest of the previous VBlank: VCOUNT, VCount match
 *                    and HBlank interrupts (no drawing)
 *   lines 0..159     VCount match interrupt, the line drawn (platform/ppu.c),
 *                    then its HBlank: HBlank DMA and the HBlank interrupt,
 *                    which set up the registers of the next line
 *   line 160         VBlank: VBlank DMA, the VBlank interrupt (the game's
 *                    OnVBlank), then the frame is presented, dumped and
 *                    logged, SRAM saved when it changed, the input for the
 *                    next frame read into KEYINPUT, and the pace kept at
 *                    59.73 Hz
 *
 * and returns to the game.  Interrupts are raised only where their flag
 * is enabled in DISPSTAT and dispatched through the game's table like
 * crt0.s's IntrMain (platform/irq.c).  The game's logic of a frame runs
 * between two of these calls, so what the GBA does while it draws (the
 * game writing VRAM mid-frame) lands wholly before or after the picture;
 * see docs/port-platform.md.
 *
 * Frame numbers match tools/emutest.c's (mGBA's runFrame): frame N's keys
 * are in KEYINPUT from the return of wait N-1 (or power-on) to the return
 * of wait N, and picture N is the one drawn in wait N.
 */
#include <setjmp.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "platform.h"

struct HostOptions gHostOptions;
uint32_t gHostFrame[PPU_WIDTH * PPU_HEIGHT];
long gHostFrameCount;

static struct Ppu sPpu;
static jmp_buf sResetJmp, sExitJmp;
static int sExitStatus;
static struct HostScript *sScript;
static FILE *sLog;
static int sFast, sQuit;
static int64_t sNextFrameTime;

/* ---- audio (include/gba/host.h) ---- */

static int sAudioRate = 13379;
static FILE *sWav;
static long sWavFrames;

void HostAudioSetRate(int rate)
{
    if (rate > 0)
        sAudioRate = rate;
}

static void wav_header(FILE *f, long frames, int rate)
{
    u8 h[44];
    u32 data = (u32)frames * 4;
    memcpy(h, "RIFF", 4);
    h[4] = (u8)(data + 36); h[5] = (u8)((data + 36) >> 8); h[6] = (u8)((data + 36) >> 16); h[7] = (u8)((data + 36) >> 24);
    memcpy(h + 8, "WAVEfmt ", 8);
    h[16] = 16; h[17] = h[18] = h[19] = 0;
    h[20] = 1; h[21] = 0;           /* PCM */
    h[22] = 2; h[23] = 0;           /* stereo */
    h[24] = (u8)rate; h[25] = (u8)(rate >> 8); h[26] = (u8)(rate >> 16); h[27] = 0;
    h[28] = (u8)(rate * 4); h[29] = (u8)((rate * 4) >> 8); h[30] = (u8)((rate * 4) >> 16); h[31] = 0;
    h[32] = 4; h[33] = 0; h[34] = 16; h[35] = 0;
    memcpy(h + 36, "data", 4);
    h[40] = (u8)data; h[41] = (u8)(data >> 8); h[42] = (u8)(data >> 16); h[43] = (u8)(data >> 24);
    fseek(f, 0, SEEK_SET);
    fwrite(h, 1, sizeof h, f);
    fseek(f, 0, SEEK_END);
}

void HostAudioSubmit(const s16 *stereo, int frames)
{
    if (frames <= 0)
        return;
    if (sWav) {
        int i;
        for (i = 0; i < frames * 2; i++) {
            u16 v = (u16)stereo[i];
            fputc(v & 0xFF, sWav);
            fputc(v >> 8, sWav);
        }
        sWavFrames += frames;
    }
    if (!gHostOptions.headless && !sFast)
        FrontendAudioQueue(stereo, frames, sAudioRate);
}

/* ---- helpers ---- */

static u16 io16(u32 off)
{
    return (u16)(gHostIo[off] | gHostIo[off + 1] << 8);
}

static void set_io16(u32 off, u16 v)
{
    gHostIo[off] = (u8)v;
    gHostIo[off + 1] = (u8)(v >> 8);
}

/* tools/emutest.c's hashVideo: FNV-1a over each pixel's 0x00BBGGRR as 4
 * little-endian bytes, so a --log line compares with emutest's frames.log
 * and its shot lines. */
uint64_t HostFrameHash(const uint32_t *fb)
{
    uint64_t h = 0xcbf29ce484222325ULL;
    int i, k;
    for (i = 0; i < PPU_WIDTH * PPU_HEIGHT; i++) {
        uint32_t p = fb[i] & 0xFFFFFF;
        for (k = 0; k < 4; k++)
            h = (h ^ ((p >> (8 * k)) & 0xFF)) * 0x100000001b3ULL;
    }
    return h;
}

/* ---- the display's timing ---- */

/* BG2X..BG3Y (0x28-0x2F, 0x38-0x3F): the PPU reloads its affine reference
 * point when one changes mid-frame.  Game code writes them without telling
 * anyone, so the loop compares them around every HBlank. */
static void save_affine(u8 *buf)
{
    memcpy(buf, gHostIo + 0x28, 8);
    memcpy(buf + 8, gHostIo + 0x38, 8);
}

static void check_affine(const u8 *buf)
{
    int i;
    for (i = 0; i < 16; i++)
        if (buf[i] != (i < 8 ? gHostIo[0x28 + i] : gHostIo[0x38 + i - 8]))
            ppu_io_written(&sPpu, (u32)(i < 8 ? 0x28 + i : 0x38 + i - 8));
}

/* The start of line y: VCOUNT and the VCount match. */
static void line_start(int y)
{
    u16 stat = io16(REG_OFFSET_DISPSTAT);

    set_io16(REG_OFFSET_VCOUNT, (u16)y);
    stat &= (u16)~DISPSTAT_HBLANK;
    if (y == 160)
        stat |= DISPSTAT_VBLANK;
    else if (y == 227 || y == 0)
        stat &= (u16)~DISPSTAT_VBLANK;
    if ((stat >> 8) == y) {
        stat |= DISPSTAT_VCOUNT;
        set_io16(REG_OFFSET_DISPSTAT, stat);
        if (stat & DISPSTAT_VCOUNT_INTR)
            HostRaiseIrq(INTR_FLAG_VCOUNT);
    } else {
        stat &= (u16)~DISPSTAT_VCOUNT;
        set_io16(REG_OFFSET_DISPSTAT, stat);
    }
}

/* The HBlank of line y (after it was drawn). */
static void hblank(int y)
{
    u8 aff[16];

    save_affine(aff);
    set_io16(REG_OFFSET_DISPSTAT, io16(REG_OFFSET_DISPSTAT) | DISPSTAT_HBLANK);
    if (y < 160)
        HostDmaRun(HOST_DMA_HBLANK);
    if (io16(REG_OFFSET_DISPSTAT) & DISPSTAT_HBLANK_INTR)
        HostRaiseIrq(INTR_FLAG_HBLANK);
    check_affine(aff);
}

static void finish(int status)
{
    sExitStatus = status;
    longjmp(sExitJmp, 1);
}

static void write_bin(const char *name, const char *what, const void *p, size_t size)
{
    char path[1024];
    FILE *f;
    snprintf(path, sizeof path, "%s/%s.%s.bin", gHostOptions.dumpDir, name, what);
    f = fopen(path, "wb");
    if (!f || fwrite(p, 1, size, f) != size)
        fprintf(stderr, "platform: can't write %s\n", path);
    if (f)
        fclose(f);
}

static void write_shot(const char *name)
{
    char path[1024];
    if (!gHostOptions.dumpDir)
        return;
    snprintf(path, sizeof path, "%s/%s.png", gHostOptions.dumpDir, name);
    if (HostWritePng(path, gHostFrame, PPU_WIDTH, PPU_HEIGHT) != 0)
        fprintf(stderr, "platform: can't write %s\n", path);
    if (gHostOptions.dumpMem) {
        /* as tools/emutest.c's dumps (record --dump), plus the registers */
        write_bin(name, "pal", gHostPltt, HOST_PLTT_SIZE);
        write_bin(name, "vram", gHostVram, HOST_VRAM_SIZE);
        write_bin(name, "oam", gHostOam, HOST_OAM_SIZE);
        write_bin(name, "io", gHostIo, HOST_IO_SIZE);
    }
}

static u16 sKeys; /* the keys of the frame running (1 = pressed) */

static void set_keys(u16 keys)
{
    sKeys = keys & 0x3FF;
    set_io16(REG_OFFSET_KEYINPUT, (u16)(~sKeys & 0x3FF));
}

/* The keys of frame n: the script's, or the front end's. */
static void read_input(long n)
{
    u16 keys = 0;
    int fast = 0;

    if (!gHostOptions.headless && !FrontendPoll(&keys, &fast))
        sQuit = 1;
    if (sScript)
        keys = HostScriptKeys(sScript, n);
    sFast = fast;
    set_keys(keys);
}

void HostRunFrame(void)
{
    long n = gHostFrameCount;
    int y;

    /* the end of the previous VBlank */
    for (y = 160; y < 228; y++) {
        line_start(y);
        hblank(y);
    }

    /* the picture */
    for (y = 0; y < 160; y++) {
        line_start(y);
        ppu_render_line(&sPpu, y);
        hblank(y);
    }

    /* VBlank */
    line_start(160);
    HostAudioFrame();
    HostDmaRun(HOST_DMA_VBLANK);
    if (io16(REG_OFFSET_DISPSTAT) & DISPSTAT_VBLANK_INTR)
        HostRaiseIrq(INTR_FLAG_VBLANK);
    HostAudioFrameEnd();

    /* frame n is done */
    if (sLog)
        fprintf(sLog, "%ld %03X %016llx\n", n, sKeys, (unsigned long long)HostFrameHash(gHostFrame));
    if (sScript) {
        int idx;
        const char *shot;
        while ((shot = HostScriptShot(sScript, n, &idx)) != NULL)
            write_shot(shot);
    }
    if (gHostOptions.dumpEvery > 0 && n >= gHostOptions.dumpStart && n % gHostOptions.dumpEvery == 0) {
        char name[64];
        snprintf(name, sizeof name, "frame%06ld", n);
        write_shot(name);
    }
    HostSramFrame();
    gHostFrameCount = n + 1;

    if (!gHostOptions.headless)
        FrontendPresent(gHostFrame);

    if (gHostOptions.frames > 0 && gHostFrameCount >= gHostOptions.frames)
        finish(0);

    read_input(gHostFrameCount);
    if (sQuit)
        finish(0);

    /* pacing: none headless or while fast-forwarding */
    if (!gHostOptions.headless) {
        int64_t now = FrontendNow();
        sNextFrameTime += HOST_FRAME_NS;
        if (sFast || now - sNextFrameTime > 100000000LL || sNextFrameTime - now > 100000000LL)
            sNextFrameTime = now; /* fell behind (or fast-forward): don't catch up */
        else
            FrontendSleepUntil(sNextFrameTime);
    }
}

/* ---- BIOS hooks ---- */

static void hook_vblank_wait(void)
{
    HostRunFrame();
}

static void hook_intr_wait(u32 discard, u32 flags)
{
    /* Every interrupt the platform raises happens inside a frame; waiting
     * for any of them is waiting for (at most) one frame. */
    (void)discard;
    (void)flags;
    HostRunFrame();
}

static void hook_halt(void)
{
    HostRunFrame();
}

static void hook_soft_reset(void)
{
    longjmp(sResetJmp, 1);
}

void HostPowerOn(void)
{
    memset(gHostIo, 0, HOST_IO_SIZE);
    HostDmaReset();
    HostAudioReset();
    set_io16(REG_OFFSET_KEYINPUT, 0x3FF);
    set_io16(REG_OFFSET_DISPCNT, DISPCNT_FORCED_BLANK);
    set_io16(REG_OFFSET_SOUNDBIAS, 0x200); /* as the BIOS leaves it at boot */

    gBiosMemory.ewram = gHostEwram;
    gBiosMemory.iwram = gHostIwram;
    gBiosMemory.pal = gHostPltt;
    gBiosMemory.vram = gHostVram;
    gBiosMemory.oam = gHostOam;
    gBiosMemory.io = gHostIo;

    gBiosHooks.vblank_intr_wait = hook_vblank_wait;
    gBiosHooks.intr_wait = hook_intr_wait;
    gBiosHooks.halt = hook_halt;
    gBiosHooks.stop = hook_halt;
    gBiosHooks.soft_reset = hook_soft_reset;

    ppu_init(&sPpu, gHostIo, gHostPltt, gHostVram, gHostOam, gHostFrame);
    sPpu.colorMath = gHostOptions.hardwareColor ? PPU_COLOR_HARDWARE : PPU_COLOR_MGBA;
    gBiosAffineMgba = !gHostOptions.hardwareColor;
}

/* ---- the command line ---- */

static void usage(const char *prog)
{
    fprintf(stderr,
            "usage: %s [options]\n"
            "  --headless          no window, no audio, no pacing\n"
            "  --frames N          stop after N frames\n"
            "  --input FILE        emutest input script (tests/inputs/*.txt) or plan\n"
            "  --dump-frames DIR   PNGs of the script's shots\n"
            "  --dump-every N      also a PNG every N frames (into the dump dir)\n"
            "  --dump-start N      ... from frame N on\n"
            "  --dump-mem          with each shot, NAME.{pal,vram,oam,io}.bin\n"
            "  --log FILE          per frame: number, keys, picture hash\n"
            "  --save FILE         SRAM file (default fe7u.sav; none headless)\n"
            "  --no-save           no SRAM file\n"
            "  --wav FILE          write the audio to a WAV file (32768 Hz)\n"
            "  --channels MASK     channels heard, hex: bits 0-3 CGB, 4-5 DirectSound A, B (3F)\n"
            "  --mix FILE          the m4a mixer's output per frame (emutest -P's .mix)\n"
            "  --scale N           window scale (default 3)\n"
            "  --hardware-color    the GBA's 5-bit color math (default: mGBA's)\n"
            "keys: arrows, Z/X = A/B, A/S = L/R, Enter = Start, Backspace = Select,\n"
            "      hold Tab = fast forward, Esc = quit\n",
            prog);
}

static int parse_args(int argc, char **argv)
{
    int i, noSave = 0;
    struct HostOptions *o = &gHostOptions;

    o->scale = 3;
    for (i = 1; i < argc; i++) {
        const char *a = argv[i];
        const char *v = i + 1 < argc ? argv[i + 1] : NULL;
#define ARG(name) (strcmp(a, name) == 0 && v && (i++, 1))
        if (strcmp(a, "--headless") == 0)
            o->headless = 1;
        else if (strcmp(a, "--hardware-color") == 0)
            o->hardwareColor = 1;
        else if (strcmp(a, "--dump-mem") == 0)
            o->dumpMem = 1;
        else if (strcmp(a, "--no-save") == 0)
            noSave = 1;
        else if (ARG("--frames"))
            o->frames = atol(v);
        else if (ARG("--input"))
            o->input = v;
        else if (ARG("--dump-frames"))
            o->dumpDir = v;
        else if (ARG("--dump-every"))
            o->dumpEvery = atol(v);
        else if (ARG("--dump-start"))
            o->dumpStart = atol(v);
        else if (ARG("--log"))
            o->log = v;
        else if (ARG("--save"))
            o->save = v;
        else if (ARG("--channels"))
            HostAudioSetChannels((int)strtol(v, NULL, 16));
        else if (ARG("--mix"))
            o->mix = v;
        else if (ARG("--wav"))
            o->wav = v;
        else if (ARG("--scale"))
            o->scale = atoi(v);
        else {
            usage(argv[0]);
            return -1;
        }
#undef ARG
    }
    if (!o->save && !o->headless && !noSave)
        o->save = "fe7u.sav";
    if (noSave)
        o->save = NULL;
    if (o->scale < 1)
        o->scale = 1;
    return 0;
}

static void cleanup(void)
{
    HostSramFlush();
    if (sLog) {
        fclose(sLog);
        sLog = NULL;
    }
    HostAudioCloseMixDump();
    if (sWav) {
        wav_header(sWav, sWavFrames, sAudioRate);
        fclose(sWav);
        sWav = NULL;
    }
    FrontendQuit();
}

int HostMain(int argc, char **argv)
{
    char sramTmp[1024];

    if (parse_args(argc, argv) != 0)
        return 2;

    if (gHostOptions.input) {
        sScript = HostScriptLoad(gHostOptions.input);
        if (!sScript)
            return 2;
        if (gHostOptions.frames == 0)
            gHostOptions.frames = HostScriptFrames(sScript);
    }

    /* SRAM: the script's image (not written back) or the save file */
    gHostOptions.sramInit = NULL;
    if (sScript && HostScriptSram(sScript)) {
        const char *s = HostScriptSram(sScript);
        if (HostScriptSramIsDesc(sScript)) {
            /* a tests/saves description: tools/mksave.py makes the image */
            char cmd[2048];
            const char *tmp = getenv("TMPDIR");
            snprintf(sramTmp, sizeof sramTmp, "%s/fe7u-host-sram-%ld.bin", tmp ? tmp : "/tmp", (long)getpid());
            snprintf(cmd, sizeof cmd, "python3 tools/mksave.py '%s' '%s'", s, sramTmp);
            if (system(cmd) != 0) {
                fprintf(stderr, "platform: %s failed\n", cmd);
                return 2;
            }
            gHostOptions.sramInit = sramTmp;
        } else {
            gHostOptions.sramInit = s;
        }
        gHostOptions.save = NULL; /* a scripted run doesn't touch the save file */
    }
    HostSramLoad(gHostOptions.save, gHostOptions.sramInit);

    if (gHostOptions.log && !(sLog = fopen(gHostOptions.log, "w"))) {
        fprintf(stderr, "platform: can't write %s\n", gHostOptions.log);
        return 2;
    }
    if (gHostOptions.wav) {
        if (!(sWav = fopen(gHostOptions.wav, "wb"))) {
            fprintf(stderr, "platform: can't write %s\n", gHostOptions.wav);
            return 2;
        }
        wav_header(sWav, 0, sAudioRate);
    }
    HostAudioSetMixDump(gHostOptions.mix);

    if (FrontendInit(gHostOptions.headless, gHostOptions.scale) != 0)
        return 1;

    if (setjmp(sExitJmp)) {
        cleanup();
        return sExitStatus;
    }

    setjmp(sResetJmp); /* SoftReset comes back here */
    HostPowerOn();
    read_input(gHostFrameCount);
    if (!gHostOptions.headless)
        sNextFrameTime = FrontendNow();
    AgbMain();

    /* AgbMain doesn't return */
    cleanup();
    return 0;
}
