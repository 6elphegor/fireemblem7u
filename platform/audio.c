/*
 * The GBA's sound output (docs/port-platform.md, "Audio"): what the DMA
 * sound FIFOs and the four CGB (PSG) channels would play, once per frame,
 * mixed to 16-bit stereo at 32768 Hz (mGBA's rate) and handed to
 * HostAudioSubmit.
 *
 * DirectSound.  The game's m4a mixer (SoundMain, in the VBlank handler)
 * writes 8-bit samples into gSoundInfo.pcmBuffer: DirectSound A (right) in
 * the first PCM_DMA_BUF_SIZE bytes, B (left) in the second, as
 * pcmDmaPeriod parts of pcmSamplesPerVBlank samples.  On the GBA, DMA 1
 * and 2 feed them to the FIFOs at timer 0's rate, and m4aSoundVSync
 * restarts the DMA at the buffer's start every pcmDmaPeriod frames.  So
 * during the frame after the VSync that left pcmDmaCounter at c, the DMA
 * plays part P - c (and SoundMain mixes the next one).  Here, at the start
 * of VBlank, before the VBlank handler runs, the part the frame just played
 * is P - c: it is read, held sample by sample like the FIFO (each 8-bit
 * sample for 32768 / 13379 output samples), and mixed.  Nothing is
 * emulated of timer 0 or the FIFO DMA itself; SOUND_INFO_PTR
 * (gHostSoundInfoPtr) says where the buffer is.
 *
 * CGB channels.  m4a's CgbSound writes the NRxx registers and wave RAM
 * once per frame (in SoundMain).  The platform keeps the registers as
 * plain memory (gHostIo), so a write can't be seen when it happens; at
 * VBlank the registers are read, and a restart bit (bit 7 of NRx4) that is
 * set starts the channel and is cleared (on the GBA the bit is write-only).
 * The channels then run for the frame: the two square channels (duty,
 * envelope, length, channel 1's sweep), the wave channel (32 or 64 4-bit
 * samples, both banks, volume), the noise channel (7/15-bit LFSR), the
 * 512 Hz frame sequencer, NR50/NR51 volumes and panning and SOUNDCNT_H's
 * PSG ratio.  Register writes thus take effect at frame boundaries instead
 * of the cycle they happen at; that is also where m4a makes them.
 *
 * Mixing is mGBA's (0.10, src/gba/audio.c GBAAudioSample, src/gb/audio.c
 * GBAudioSamplePSG): the PSG levels (0-15) summed, times 8, times (NR50
 * volume + 1), shifted right by 4 - SOUNDCNT_H's ratio; DirectSound
 * samples times 4 (2 at 50%); plus SOUNDBIAS's level, clamped to 10 bits,
 * minus it; times 48 (mGBA's master volume 0x100 * 3 >> 4).  Then a
 * gentle low-pass and a DC blocker, standing in for mGBA's band-limited
 * resampling (which also removes the DC level).
 */
#include <stddef.h>
#include <stdio.h>
#include <string.h>

#include "platform.h"
#include "gba/m4a_internal.h"

#define OUT_RATE 32768
/* output samples per frame: 32768 * 280896 / 2^24 = 548.6 */
#define CYCLES_PER_FRAME 280896
#define CPU_HZ 16777216

/* ---- the registers ---- */

static u8 io8(u32 off) { return gHostIo[off]; }
static u16 io16(u32 off) { return (u16)(gHostIo[off] | gHostIo[off + 1] << 8); }

/* ---- CGB channels ---- */

struct Envelope {
    int vol, dir, period, timer;
};

struct Square {
    int on;
    int duty, pos;
    u32 phase;          /* 16.16 fraction of a duty step */
    int length, lengthOn;
    struct Envelope env;
    /* channel 1's sweep */
    int sweepTimer, sweepOn, shadow;
};

struct Wave {
    int on;
    int pos;
    u32 phase;
    int length, lengthOn;
};

struct Noise {
    int on;
    u32 lfsr;
    u64 phase;          /* LFSR clocks, 32.32 */
    int length, lengthOn;
    struct Envelope env;
};

static struct {
    struct Square sq[2];
    struct Wave wave;
    struct Noise noise;
    int seqStep;
    u64 seqPhase;       /* 512 Hz frame sequencer, 32.32 fraction of a step */
    u32 outFrac;        /* output samples per frame, remainder */
    u8 waveRam[2][16];  /* the two banks */
    int dsLast[2];      /* last FIFO samples (A, B), held */
    float lp[2], hpIn[2], hpOut[2]; /* the output filters' state */
} sPsg;

static int sChannels = 0x3F; /* bits 0-3 the CGB channels, 4-5 DirectSound A and B */

static const u8 sDuty[4][8] = {
    { 0, 0, 0, 0, 0, 0, 0, 1 },
    { 1, 0, 0, 0, 0, 0, 0, 1 },
    { 1, 0, 0, 0, 0, 1, 1, 1 },
    { 0, 1, 1, 1, 1, 1, 1, 0 },
};

static void env_start(struct Envelope *e, u8 nrx2)
{
    e->vol = nrx2 >> 4;
    e->dir = (nrx2 >> 3) & 1;
    e->period = nrx2 & 7;
    e->timer = e->period ? e->period : 8;
}

static void env_step(struct Envelope *e)
{
    if (!e->period)
        return;
    if (--e->timer > 0)
        return;
    e->timer = e->period;
    if (e->dir && e->vol < 15)
        e->vol++;
    else if (!e->dir && e->vol > 0)
        e->vol--;
}

/* NRx1..NRx4 of the square channels: NR11-NR14 at 0x62-0x65, NR21-NR24
 * at 0x68, 0x69, 0x6C, 0x6D */
static const u32 sNr1[2] = { 0x62, 0x68 }, sNr2[2] = { 0x63, 0x69 },
                 sNr3[2] = { 0x64, 0x6C }, sNr4[2] = { 0x65, 0x6D };

static int square_freq(int ch)
{
    return (io8(sNr3[ch]) | (io8(sNr4[ch]) & 7) << 8) & 0x7FF;
}

static void set_square_freq(int ch, int f)
{
    gHostIo[sNr3[ch]] = (u8)f;
    gHostIo[sNr4[ch]] = (u8)((gHostIo[sNr4[ch]] & ~7) | ((f >> 8) & 7));
}

static int sweep_next(struct Square *s)
{
    u8 nr10 = io8(0x60);
    int delta = s->shadow >> (nr10 & 7);
    return (nr10 & 8) ? s->shadow - delta : s->shadow + delta;
}

static void trigger_square(int ch)
{
    struct Square *s = &sPsg.sq[ch];
    u8 nrx1 = io8(sNr1[ch]), nrx2 = io8(sNr2[ch]), nrx4 = io8(sNr4[ch]);

    s->on = (nrx2 & 0xF8) != 0; /* the DAC is off with volume 0, decreasing */
    if (s->length == 0)
        s->length = 64 - (nrx1 & 63);
    s->lengthOn = (nrx4 >> 6) & 1;
    env_start(&s->env, nrx2);
    if (ch == 0) {
        u8 nr10 = io8(0x60);
        int time = (nr10 >> 4) & 7;
        s->shadow = square_freq(0);
        s->sweepTimer = time ? time : 8;
        s->sweepOn = time || (nr10 & 7);
        if ((nr10 & 7) && sweep_next(s) > 0x7FF)
            s->on = 0;
    }
}

static void trigger_wave(void)
{
    struct Wave *w = &sPsg.wave;
    if (w->length == 0)
        w->length = 256 - io8(0x72);
    w->lengthOn = (io8(0x75) >> 6) & 1;
    w->on = (io8(0x70) & 0x80) != 0;
    w->pos = 0;
    w->phase = 0;
}

static void trigger_noise(void)
{
    struct Noise *n = &sPsg.noise;
    u8 nr42 = io8(0x79);
    if (n->length == 0)
        n->length = 64 - (io8(0x78) & 63);
    n->lengthOn = (io8(0x7D) >> 6) & 1;
    env_start(&n->env, nr42);
    n->on = (nr42 & 0xF8) != 0;
    n->lfsr = 0x7FFF;
    n->phase = 0;
}

/* The frame sequencer's step: length at 256 Hz (even steps), sweep at
 * 128 Hz (steps 2 and 6), envelopes at 64 Hz (step 7). */
static void sequencer_step(void)
{
    int step = sPsg.seqStep;
    int i;

    sPsg.seqStep = (step + 1) & 7;
    if (!(step & 1)) {
        for (i = 0; i < 2; i++) {
            struct Square *s = &sPsg.sq[i];
            if (s->lengthOn && s->length > 0 && --s->length == 0)
                s->on = 0;
        }
        if (sPsg.wave.lengthOn && sPsg.wave.length > 0 && --sPsg.wave.length == 0)
            sPsg.wave.on = 0;
        if (sPsg.noise.lengthOn && sPsg.noise.length > 0 && --sPsg.noise.length == 0)
            sPsg.noise.on = 0;
    }
    if (step == 2 || step == 6) {
        struct Square *s = &sPsg.sq[0];
        u8 nr10 = io8(0x60);
        int time = (nr10 >> 4) & 7;
        if (s->sweepOn && --s->sweepTimer <= 0) {
            s->sweepTimer = time ? time : 8;
            if (time) {
                int f = sweep_next(s);
                if (f > 0x7FF)
                    s->on = 0;
                else if (nr10 & 7) {
                    s->shadow = f;
                    set_square_freq(0, f);
                    if (sweep_next(s) > 0x7FF)
                        s->on = 0;
                }
            }
        }
    }
    if (step == 7) {
        env_step(&sPsg.sq[0].env);
        env_step(&sPsg.sq[1].env);
        env_step(&sPsg.noise.env);
    }
}

/* The registers CgbSound left: restarts, wave RAM, DAC switches. */
static void psg_read_registers(void)
{
    static const u32 nrx4[4] = { 0x65, 0x6D, 0x75, 0x7D };
    u8 nr30 = io8(0x70);
    int i;

    /* wave RAM: the CPU sees the bank that isn't played */
    memcpy(sPsg.waveRam[!((nr30 >> 6) & 1)], gHostIo + 0x90, 16);

    for (i = 0; i < 4; i++) {
        u8 v = gHostIo[nrx4[i]];
        if (!(v & 0x80))
            continue;
        gHostIo[nrx4[i]] = v & 0x7F;
        switch (i) {
        case 0: case 1: trigger_square(i); break;
        case 2: trigger_wave(); break;
        case 3: trigger_noise(); break;
        }
    }
    /* length enable can change without a restart */
    sPsg.sq[0].lengthOn = (io8(0x65) >> 6) & 1;
    sPsg.sq[1].lengthOn = (io8(0x6D) >> 6) & 1;
    sPsg.wave.lengthOn = (io8(0x75) >> 6) & 1;
    sPsg.noise.lengthOn = (io8(0x7D) >> 6) & 1;
    /* DACs */
    if (!(io8(0x63) & 0xF8))
        sPsg.sq[0].on = 0;
    if (!(io8(0x69) & 0xF8))
        sPsg.sq[1].on = 0;
    if (!(nr30 & 0x80))
        sPsg.wave.on = 0;
    if (!(io8(0x79) & 0xF8))
        sPsg.noise.on = 0;
}

static int wave_sample(struct Wave *w, u8 nr30)
{
    int bank = (nr30 >> 6) & 1;
    int pos = w->pos;
    u8 b;
    if (nr30 & 0x20) { /* 64 samples: both banks, the played one first */
        bank ^= pos >> 5;
        pos &= 31;
    }
    b = sPsg.waveRam[bank][pos >> 1];
    return (pos & 1) ? (b & 0xF) : (b >> 4);
}

/* One output sample of the four channels: *left, *right = sum of the
 * enabled channels' 4-bit levels times 8 times (NR50 volume + 1), as
 * mGBA's GBAudioSamplePSG. */
static void psg_sample(int *left, int *right)
{
    u8 nr50 = io8(0x80), nr51 = io8(0x81), nr30 = io8(0x70), nr32 = io8(0x73), nr43 = io8(0x7C);
    int out[4] = { 0, 0, 0, 0 };
    int i, l = 0, r = 0;

    for (i = 0; i < 2; i++) {
        struct Square *s = &sPsg.sq[i];
        int f = square_freq(i);
        /* 8 duty steps per period; steps per second 1048576 / (2048 - f) */
        u64 step = ((u64)1048576 << 16) / (u64)(2048 - f) / OUT_RATE;
        s->duty = io8(sNr1[i]) >> 6;
        if (s->on)
            out[i] = sDuty[s->duty][s->pos] * s->env.vol;
        s->phase += (u32)step;
        s->pos = (s->pos + (s->phase >> 16)) & 7;
        s->phase &= 0xFFFF;
    }
    {
        struct Wave *w = &sPsg.wave;
        int f = (io8(0x74) | (io8(0x75) & 7) << 8) & 0x7FF;
        u64 step = ((u64)2097152 << 16) / (u64)(2048 - f) / OUT_RATE;
        int len = (nr30 & 0x20) ? 64 : 32;
        if (w->on) {
            int v = wave_sample(w, nr30);
            if (nr32 & 0x80)
                out[2] = v * 3 / 4;
            else switch ((nr32 >> 5) & 3) {
                case 0: out[2] = 0; break;
                case 1: out[2] = v; break;
                case 2: out[2] = v >> 1; break;
                default: out[2] = v >> 2; break;
            }
        }
        w->phase += (u32)step;
        w->pos = (int)((w->pos + (w->phase >> 16)) % len);
        w->phase &= 0xFFFF;
    }
    {
        struct Noise *n = &sPsg.noise;
        int shift = nr43 >> 4, div = nr43 & 7;
        /* LFSR clocks per second: 524288 / div / 2^(shift + 1), div 0 = 0.5 */
        u64 rate = div ? ((u64)524288 << 32) / (u64)div : ((u64)1048576 << 32);
        u64 clocks;
        if (n->on)
            out[3] = (~n->lfsr & 1) * n->env.vol;
        if (shift < 14) {
            n->phase += (rate >> (shift + 1)) / OUT_RATE;
            clocks = n->phase >> 32;
            n->phase &= 0xFFFFFFFFULL;
            while (clocks--) {
                u32 bit = (n->lfsr ^ (n->lfsr >> 1)) & 1;
                n->lfsr = (n->lfsr >> 1) | (bit << 14);
                if (nr43 & 8)
                    n->lfsr = (n->lfsr & ~0x40u) | (bit << 6);
            }
        }
    }

    for (i = 0; i < 4; i++) {
        if (!(sChannels & (1 << i)))
            continue;
        if (nr51 & (1 << i))
            r += out[i];
        if (nr51 & (0x10 << i))
            l += out[i];
    }
    *right = r * 8 * ((nr50 & 7) + 1);
    *left = l * 8 * (((nr50 >> 4) & 7) + 1);

    /* the frame sequencer, 512 Hz */
    sPsg.seqPhase += ((u64)512 << 32) / OUT_RATE;
    while (sPsg.seqPhase >> 32) {
        sPsg.seqPhase -= (u64)1 << 32;
        sequencer_step();
    }
}

/* ---- DirectSound ---- */

/* The part of the DMA buffer played during the frame that ends now, or NULL
 * (not mixing, no buffer). */
static const s8 *ds_part(int *n)
{
    struct SoundInfo *si = gHostSoundInfoPtr;
    u32 counter, period;
    s32 samples;

    if (!si || (u32)(si->ident - ID_NUMBER) > 1)
        return NULL;
    counter = si->pcmDmaCounter;
    period = si->pcmDmaPeriod;
    samples = si->pcmSamplesPerVBlank;
    if (samples <= 0 || samples > 1024 || counter < 1 || counter > period
        || (s32)period * samples > PCM_DMA_BUF_SIZE)
        return NULL;
    *n = samples;
    return si->pcmBuffer + (period - counter) * samples;
}

/* ---- the frame ---- */

static FILE *sMix, *sPsg2;

void HostAudioSetChannels(int mask)
{
    sChannels = mask;
}

void HostAudioSetMixDump(const char *path)
{
    char psg[1024];
    if (!path)
        return;
    if (!(sMix = fopen(path, "wb")))
        fprintf(stderr, "platform: can't write %s\n", path);
    snprintf(psg, sizeof psg, "%s.psg", path);
    if (!(sPsg2 = fopen(psg, "wb")))
        fprintf(stderr, "platform: can't write %s\n", psg);
}

void HostAudioCloseMixDump(void)
{
    if (sMix)
        fclose(sMix);
    if (sPsg2)
        fclose(sPsg2);
    sMix = sPsg2 = NULL;
}

void HostAudioReset(void)
{
    memset(&sPsg, 0, sizeof sPsg);
}

static int clamp_bias(int v, int bias)
{
    v += bias;
    if (v < 0)
        v = 0;
    if (v > 0x3FF)
        v = 0x3FF;
    return v - bias;
}

void HostAudioFrame(void)
{
    static s16 out[2 * 1024];
    u16 cntH = io16(0x82), cntX = io16(0x84);
    int bias = io16(0x88) & 0x3FE;
    int psgShift = 4 - (cntH & 3);
    const s8 *ds;
    int dsN = 0, n, k;
    u64 total;

    if (!gHostSoundInfoPtr && !(cntX & 0x80))
        return; /* no sound engine (the platform demo) */

    total = (u64)sPsg.outFrac + (u64)OUT_RATE * CYCLES_PER_FRAME;
    n = (int)(total / CPU_HZ);
    sPsg.outFrac = (u32)(total % CPU_HZ);

    ds = ds_part(&dsN);
    if (!(cntX & 0x80) || !(io16(0xC6) & 0x8000))
        ds = NULL; /* master off, or the sound DMA stopped (FIFO A) */
    if (cntX & 0x80)
        psg_read_registers();
    if (psgShift < 0)
        psgShift = 0; /* ratio 3 (prohibited) */

    for (k = 0; k < n; k++) {
        int l = 0, r = 0;
        if (cntX & 0x80) {
            psg_sample(&l, &r);
            l >>= psgShift;
            r >>= psgShift;
            if (ds) {
                int i = k * dsN / n;
                sPsg.dsLast[0] = ds[i];
                sPsg.dsLast[1] = ds[PCM_DMA_BUF_SIZE + i];
            } else {
                sPsg.dsLast[0] = sPsg.dsLast[1] = 0;
            }
            {
                int a = (sChannels & 0x10) ? (sPsg.dsLast[0] * 4) >> !(cntH & 4) : 0;
                int b = (sChannels & 0x20) ? (sPsg.dsLast[1] * 4) >> !(cntH & 8) : 0;
                if (cntH & 0x0100) r += a;
                if (cntH & 0x0200) l += a;
                if (cntH & 0x1000) r += b;
                if (cntH & 0x2000) l += b;
            }
            l = clamp_bias(l, bias);
            r = clamp_bias(r, bias);
        }
        /* mGBA's output level (* masterVolume 0x100 * 3 >> 4), then the
         * output stage: a low-pass (~6 kHz) for the steps of the held
         * samples and a DC blocker (~16 Hz), roughly what mGBA's band-limited
         * resampler (blip_buf) does */
        {
            float v[2];
            int c;
            v[0] = (float)(l * 48);
            v[1] = (float)(r * 48);
            for (c = 0; c < 2; c++) {
                float y;
                sPsg.lp[c] += 0.68f * (v[c] - sPsg.lp[c]);
                y = sPsg.lp[c] - sPsg.hpIn[c] + 0.9969f * sPsg.hpOut[c];
                sPsg.hpIn[c] = sPsg.lp[c];
                sPsg.hpOut[c] = y;
                if (y > 32767.0f)
                    y = 32767.0f;
                if (y < -32768.0f)
                    y = -32768.0f;
                out[2 * k + c] = (s16)y;
            }
        }
    }
    HostAudioSetRate(OUT_RATE);
    HostAudioSubmit(out, n);
}

/* After the VBlank handler: the part SoundMain just mixed, as
 * tools/emutest.c's -P writes it (8-bit right, left per sample; nothing
 * for a frame the engine doesn't mix). */
void HostAudioFrameEnd(void)
{
    struct SoundInfo *si = gHostSoundInfoPtr;
    u32 counter, period, part;
    s32 samples, i;

    if (sMix) {
        /* the CGB registers, as emutest's .psg (bytes it can read back) */
        static const u64 used = 0xFFFF033F333F333FULL;
        u8 regs[0x40];
        for (i = 0; i < 0x40; i++)
            regs[i] = (used >> i & 1) ? gHostIo[0x60 + i] : 0;
        if (sPsg2)
            fwrite(regs, 1, sizeof regs, sPsg2);
    }
    if (!sMix || !si || si->ident != ID_NUMBER)
        return;
    counter = si->pcmDmaCounter;
    period = si->pcmDmaPeriod;
    samples = si->pcmSamplesPerVBlank;
    part = counter > 1 ? period - (counter - 1) : 0;
    if (samples <= 0 || samples > 1024 || part >= period || (part + 1) * samples > PCM_DMA_BUF_SIZE)
        return;
    for (i = 0; i < samples; i++) {
        fputc((u8)si->pcmBuffer[part * samples + i], sMix);
        fputc((u8)si->pcmBuffer[PCM_DMA_BUF_SIZE + part * samples + i], sMix);
    }
}
