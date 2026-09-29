// The m4a sound engine of asm/m4a_1.s in plain C, for the NONMATCHING build
// and a host port: the mixer (SoundMain, SoundMainRAM), the track
// interpreter (MPlayMain, ply_note and the ply_* commands kept in assembly)
// and their helpers.  The matching build assembles asm/m4a_1.s instead, so
// this file is empty there.  Each function does what the assembly does,
// including its odd corners (they are noted where they matter), and uses
// struct fields only: nothing assumes 32-bit pointers.
#include "gba/m4a_internal.h"

#if NONMATCHING

extern void * const gMPlayJumpTableTemplate[];

// agbcc has no _Static_assert.
#define M4A_ASSERT(name, cond) typedef char m4a_assert_##name[(cond) ? 1 : -1]
#define M4A_SAME_FIELD(name, a, b) \
    M4A_ASSERT(name, offsetof(struct SoundChannel, a) == offsetof(struct CgbChannel, b))

// A track's channels are one chain of DirectSound and CGB channels, and the
// engine walks it through struct SoundChannel.  These fields are common to
// both kinds (at the same offsets on the GBA and with 64-bit pointers).
M4A_SAME_FIELD(status, status, sf);
M4A_SAME_FIELD(type, type, ty);
M4A_SAME_FIELD(rightVolume, rightVolume, rightVolume);
M4A_SAME_FIELD(leftVolume, leftVolume, leftVolume);
M4A_SAME_FIELD(attack, attack, at);
M4A_SAME_FIELD(release, release, re);
M4A_SAME_FIELD(ky, ky, ky);
M4A_SAME_FIELD(echoVolume, echoVolume, echoVolume);
M4A_SAME_FIELD(echoLength, echoLength, echoLength);
M4A_SAME_FIELD(gt, gt, gt);
M4A_SAME_FIELD(mk, mk, mk);
M4A_SAME_FIELD(ve, ve, ve);
M4A_SAME_FIELD(pr, pr, pr);
M4A_SAME_FIELD(rp, rp, rp);
M4A_SAME_FIELD(track, track, tp);
M4A_SAME_FIELD(pp, pp, pp);
M4A_SAME_FIELD(np, np, np);

#if PLATFORM_GBA
// The sizes the assembly and m4a.inc have.
M4A_ASSERT(track_size, sizeof(struct MusicPlayerTrack) == 0x50);
M4A_ASSERT(track_head, offsetof(struct MusicPlayerTrack, cmdPtr) == 0x40);
M4A_ASSERT(info_size, sizeof(struct MusicPlayerInfo) == 0x40);
M4A_ASSERT(chan_size, sizeof(struct SoundChannel) == 0x40);
M4A_ASSERT(cgb_size, sizeof(struct CgbChannel) == 0x40);
M4A_ASSERT(tone_size, sizeof(struct ToneData) == 12);
M4A_ASSERT(pcm_buffer, offsetof(struct SoundInfo, pcmBuffer) == 0x350);
#endif

typedef void (*MPlayCmdFunc)(struct MusicPlayerInfo *, struct MusicPlayerTrack *);

// chk_adr_r2: the engine refuses to read from the BIOS ROM.  A read from
// below 0x02000000 gives 0, unless it is from the jump table template and
// below 0x4000 (the template in the BIOS).  A host has no BIOS in its
// address space.
#if PLATFORM_GBA
static inline bool32 AddrReadable(const void *p)
{
    uintptr_t addr = (uintptr_t)p;

    if (addr >> 25)
        return TRUE;
    if (addr < (uintptr_t)gMPlayJumpTableTemplate)
        return FALSE;
    return (addr >> 14) == 0;
}
#else
#define AddrReadable(p) TRUE
#endif

// ld_r3_tp_adr_i: the next command byte, through chk_adr_r2.
static u32 ReadCmdByte(struct MusicPlayerTrack *track)
{
    u8 *p = track->cmdPtr;
    u32 byte = *p;

    track->cmdPtr = p + 1;
    if (!AddrReadable(p))
        byte = 0;
    return byte;
}

// The one place that reads an address stored in the command stream.  Byte 0
// goes through chk_adr_r2 like in ply_goto (the other reads never did; the
// check only matters for a stream in the BIOS area, which doesn't exist).
u8 *M4aReadAddr(const u8 *p)
{
    u32 addr = (p[3] << 24) | (p[2] << 16) | (p[1] << 8);

    if (AddrReadable(p))
        addr |= p[0];
#if PLATFORM_GBA
    return (u8 *)addr;
#else
    return M4aHostRomAddr(addr);
#endif
}

u32 umul3232H32(u32 multiplier, u32 multiplicand)
{
    return ((u64)multiplier * multiplicand) >> 32;
}

// ---- mixer ----

void SoundMain(void)
{
    struct SoundInfo *soundInfo = SOUND_INFO_PTR;
    u32 lineLimit;
    u32 dmaCounter;
    s8 *pcmBuffer;

    if (soundInfo->ident != ID_NUMBER)
        return;

    soundInfo->ident++;

    // Stop mixing channels when VCOUNT reaches maxLines lines from now (0:
    // no limit; FE7 has none).
    lineLimit = soundInfo->maxLines;
    if (lineLimit != 0)
    {
        u32 vcount = *(vu8 *)REG_ADDR_VCOUNT;

        if (vcount < 160)
            vcount += 228;
        lineLimit += vcount;
    }

    if (soundInfo->func != NULL)
        soundInfo->func(soundInfo->intp);

    soundInfo->CgbSound();

    // The part of the buffer the DMA plays after the current one.
    pcmBuffer = soundInfo->pcmBuffer;
    dmaCounter = soundInfo->pcmDmaCounter;
    if (dmaCounter > 1)
        pcmBuffer += soundInfo->pcmSamplesPerVBlank * (s32)(soundInfo->pcmDmaPeriod - (dmaCounter - 1));

    SoundMainRAM(soundInfo, pcmBuffer, dmaCounter, lineLimit);
}

#if PLATFORM_GBA
// The loops run from IWRAM, where m4aSoundInit copied them (the code of
// src/m4a_mixer.c, from M4aMixFixed on, as ARM code).
extern char SoundMainRAM_Buffer[0x400];
#define MIXER(func) \
    (*(__typeof__(&func))(SoundMainRAM_Buffer + ((uintptr_t)func - (uintptr_t)M4aMixFixed)))
#else
#define MIXER(func) func
#endif

// The right channel's samples are pcmBuffer[i] (DirectSound A), the left
// channel's pcmBuffer[PCM_DMA_BUF_SIZE + i] (B).
void SoundMainRAM(struct SoundInfo *soundInfo, s8 *pcmBuffer, u32 dmaCounter, u32 lineLimit)
{
    s32 samplesPerFrame = soundInfo->pcmSamplesPerVBlank;
    u32 reverb = soundInfo->reverb;
    u32 divFreq;
    struct SoundChannel *chan;
    s32 chansLeft;

    if (reverb != 0)
    {
        // Each new sample starts as the average of the two channels' samples
        // one frame back (the part of the buffer after this one, or its
        // start when this is the last part), times the reverb level.
        s8 *src = dmaCounter == 2 ? soundInfo->pcmBuffer : pcmBuffer + samplesPerFrame;

        MIXER(M4aMixReverb)(pcmBuffer, src, samplesPerFrame, reverb);
    }
    else
    {
        // Clears 1 and 2 words for bits 2 and 3 of the count, then 4 words
        // per 16 samples, at least 4 (every table count is a multiple of 4,
        // at least 96).
        MIXER(M4aMixClear)(pcmBuffer, ((samplesPerFrame >> 2) & 3)
            + ((samplesPerFrame >> 4) != 0 ? (samplesPerFrame >> 4) * 4 : 4));
    }

    divFreq = soundInfo->divFreq;
    chansLeft = soundInfo->maxChans;
    chan = soundInfo->chans;

    do
    {
        struct WaveData *wav = chan->wav;
        u32 status;
        u32 env;
        u32 vol;

        if (lineLimit != 0)
        {
            u32 vcount = *(vu8 *)REG_ADDR_VCOUNT;

            if (vcount < 160)
                vcount += 228;
            if (vcount >= lineLimit)
                break;
        }

        status = chan->status;
        if (!(status & SOUND_CHANNEL_SF_ON))
            goto next;

        // Envelope
        if (status & SOUND_CHANNEL_SF_START)
        {
            if (status & SOUND_CHANNEL_SF_STOP)
                goto stop;

            status = 3;
            chan->status = status;
            chan->cp = wav->data;
            chan->ct = wav->size;
            env = 0;
            chan->ev = 0;
            chan->fw = 0;
            if ((wav->status >> 8) & 0xC0)
            {
                status |= SOUND_CHANNEL_SF_LOOP;
                chan->status = status;
            }
            goto attack;
        }

        env = chan->ev;

        if (status & SOUND_CHANNEL_SF_ECHO)
        {
            u32 length = chan->echoLength;

            chan->echoLength = length - 1;
            if (length > 1)
                goto envelope_done;
            goto stop;
        }

        if (status & SOUND_CHANNEL_SF_STOP)
        {
            env = (env * chan->release) >> 8;
            if (env > chan->echoVolume)
                goto envelope_done;
        echo:
            env = chan->echoVolume;
            if (env == 0)
                goto stop;
            status |= SOUND_CHANNEL_SF_ECHO;
            chan->status = status;
            goto envelope_done;
        }

        if ((status & SOUND_CHANNEL_SF_ENV) == 2)
        {
            env = (env * chan->decay) >> 8;
            if (env > chan->sustain)
                goto envelope_done;
            env = chan->sustain;
            if (env == 0)
                goto echo;
            status--;
            chan->status = status;
            goto envelope_done;
        }

        if ((status & SOUND_CHANNEL_SF_ENV) != 3)
            goto envelope_done;

    attack:
        env += chan->attack;
        if (env >= 0xFF)
        {
            env = 0xFF;
            status--;
            chan->status = status;
        }

    envelope_done:
        chan->ev = env;
        vol = ((soundInfo->masterVolume + 1) * env) >> 4;
        chan->er = (chan->rightVolume * vol) >> 8;
        chan->el = (chan->leftVolume * vol) >> 8;

        // Mixing.  A channel that doesn't loop stops at the end of its
        // sample.
        if (chan->type & TONEDATA_TYPE_FIX)
        {
            if (!MIXER(M4aMixFixed)(chan, pcmBuffer, samplesPerFrame))
                goto stop;
        }
        else
        {
            if (!MIXER(M4aMixResample)(chan, pcmBuffer, samplesPerFrame, divFreq * chan->freq))
                goto stop;
        }
        goto next;

    stop:
        chan->status = 0;
    next:
        chan++;
    }
    while (--chansLeft > 0);

    soundInfo->ident = ID_NUMBER;
}

// The jump table's Clear64byte: clears a track up to cmdPtr (0x40 bytes on
// the GBA; MPlayOpen clears its MusicPlayerInfo itself in this build).
void SoundMainBTM(void *x)
{
    u8 *p = x;
    u32 i;

    for (i = 0; i < offsetof(struct MusicPlayerTrack, cmdPtr); i++)
        p[i] = 0;
}

// The jump table's ClearChain: takes a channel out of its track's chain.
void RealClearChain(void *x)
{
    struct SoundChannel *chan = x;
    struct MusicPlayerTrack *track = chan->track;
    struct SoundChannel *next, *prev;

    if (track == NULL)
        return;

    next = chan->np;
    prev = chan->pp;

    if (prev != NULL)
        prev->np = next;
    else
        track->chan = next;

    if (next != NULL)
        next->pp = prev;

    chan->track = NULL;
}

void MPlayJumpTableCopy(void **mplayJumpTable)
{
    s32 i;

    for (i = 0; i < 36; i++)
    {
        void *func = gMPlayJumpTableTemplate[i];

        if (!AddrReadable(&gMPlayJumpTableTemplate[i]))
            func = NULL;
        mplayJumpTable[i] = func;
    }
}

void m4aSoundVSync(void)
{
    struct SoundInfo *soundInfo = SOUND_INFO_PTR;
    s32 counter;

    if ((u32)(soundInfo->ident - ID_NUMBER) > 1)
        return;

    counter = soundInfo->pcmDmaCounter - 1;
    soundInfo->pcmDmaCounter = counter;
    if (counter > 0)
        return;

    soundInfo->pcmDmaCounter = soundInfo->pcmDmaPeriod;

    if (REG_DMA1CNT & (DMA_REPEAT << 16))
        REG_DMA1CNT = ((DMA_ENABLE | DMA_START_NOW | DMA_32BIT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 4;

    if (REG_DMA2CNT & (DMA_REPEAT << 16))
        REG_DMA2CNT = ((DMA_ENABLE | DMA_START_NOW | DMA_32BIT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 4;

    REG_DMA1CNT_H = DMA_32BIT;
    REG_DMA2CNT_H = DMA_32BIT;
    REG_DMA1CNT_H = DMA_ENABLE | DMA_START_SPECIAL | DMA_32BIT | DMA_REPEAT;
    REG_DMA2CNT_H = DMA_ENABLE | DMA_START_SPECIAL | DMA_32BIT | DMA_REPEAT;
}

// ---- track commands ----

static void ClearModMAsm(struct MusicPlayerTrack *track)
{
    track->modM = 0;
    track->lfoSpeedC = 0;
    if (track->modT == 0)
        track->flags |= MPT_FLG_PITCHG;
    else
        track->flags |= MPT_FLG_VOLCHG;
}

void ply_fine(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    struct SoundChannel *chan = track->chan;

    while (chan != NULL)
    {
        if (chan->status & SOUND_CHANNEL_SF_ON)
            chan->status |= SOUND_CHANNEL_SF_STOP;
        RealClearChain(chan);
        chan = chan->np;
    }

    track->flags = 0;
}

void ply_goto(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->cmdPtr = M4aReadAddr(track->cmdPtr);
}

void ply_patt(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    if (track->patternLevel < 3)
    {
        track->patternStack[track->patternLevel] = track->cmdPtr + 4;
        track->patternLevel++;
        ply_goto(mplayInfo, track);
    }
    else
    {
        ply_fine(mplayInfo, track);
    }
}

void ply_pend(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    if (track->patternLevel != 0)
    {
        track->patternLevel--;
        track->cmdPtr = track->patternStack[track->patternLevel];
    }
}

void ply_rept(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    u8 *p = track->cmdPtr;
    u32 repN;

    if (*p == 0)
    {
        // repeat forever
        track->cmdPtr = p + 1;
        ply_goto(mplayInfo, track);
        return;
    }

    // Compared before it is truncated to 8 bits.
    repN = track->repN + 1;
    track->repN = repN;

    if (repN < ReadCmdByte(track))
    {
        ply_goto(mplayInfo, track);
    }
    else
    {
        track->repN = 0;
        track->cmdPtr = p + 5;
    }
}

void ply_prio(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->priority = ReadCmdByte(track);
}

void ply_tempo(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    u32 tempo = ReadCmdByte(track) * 2;

    mplayInfo->tempoD = tempo;
    mplayInfo->tempoI = (tempo * mplayInfo->tempoU) >> 8;
}

void ply_keysh(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->keyShift = ReadCmdByte(track);
    track->flags |= MPT_FLG_PITCHG;
}

void ply_voice(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    u32 n = *track->cmdPtr;
    struct ToneData *tone;

    track->cmdPtr++;
    tone = &mplayInfo->tone[n];

    if (AddrReadable(tone))
    {
        track->tone = *tone;
    }
    else
    {
        track->tone.type = 0;
        track->tone.key = 0;
        track->tone.length = 0;
        track->tone.pan_sweep = 0;
        track->tone.wav = NULL;
        track->tone.u.keySplitTable = NULL;
    }
}

void ply_vol(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->vol = ReadCmdByte(track);
    track->flags |= MPT_FLG_VOLCHG;
}

void ply_pan(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->pan = ReadCmdByte(track) - C_V;
    track->flags |= MPT_FLG_VOLCHG;
}

void ply_bend(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->bend = ReadCmdByte(track) - C_V;
    track->flags |= MPT_FLG_PITCHG;
}

void ply_bendr(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->bendRange = ReadCmdByte(track);
    track->flags |= MPT_FLG_PITCHG;
}

void ply_lfodl(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->lfoDelay = ReadCmdByte(track);
}

void ply_modt(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    u32 modT = ReadCmdByte(track);

    if (track->modT != modT)
    {
        track->modT = modT;
        track->flags |= MPT_FLG_VOLCHG | MPT_FLG_PITCHG;
    }
}

void ply_tune(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->tune = ReadCmdByte(track) - C_V;
    track->flags |= MPT_FLG_PITCHG;
}

// Writes a sound register (offset from SOUND1CNT_L).
void ply_port(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    u32 reg = *track->cmdPtr;

    track->cmdPtr++;
    ((vu8 *)REG_ADDR_SOUND1CNT_L)[reg] = ReadCmdByte(track);
}

// FE7's ply_lfos and ply_mod read their byte without chk_adr_r2.
void ply_lfos(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    u32 speed = *track->cmdPtr;

    track->cmdPtr++;
    track->lfoSpeed = speed;
    if (speed == 0)
        ClearModMAsm(track);
}

void ply_mod(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    u32 depth = *track->cmdPtr;

    track->cmdPtr++;
    track->mod = depth;
    if (depth == 0)
        ClearModMAsm(track);
}

void ply_endtie(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    u32 key = *track->cmdPtr;
    struct SoundChannel *chan;

    if (key < 0x80)
    {
        track->key = key;
        track->cmdPtr++;
    }
    else
    {
        key = track->key;
    }

    for (chan = track->chan; chan != NULL; chan = chan->np)
    {
        u32 status = chan->status;

        if ((status & (SOUND_CHANNEL_SF_START | SOUND_CHANNEL_SF_ENV)) && !(status & SOUND_CHANNEL_SF_STOP) && chan->mk == key)
        {
            chan->status = status | SOUND_CHANNEL_SF_STOP;
            return;
        }
    }
}

// ---- track interpreter ----

// ChnVolSetAsm: a channel's volumes from its velocity, its drum pan and
// the track's volumes.
static void ChnVolSet(struct SoundChannel *chan, struct MusicPlayerTrack *track)
{
    u32 velocity = chan->ve;
    s32 pan = (s8)chan->rp;
    u32 vol;

    vol = ((0x80 + pan) * velocity * track->volMR) >> 14;
    if (vol > 0xFF)
        vol = 0xFF;
    chan->rightVolume = vol;

    vol = ((0x7F - pan) * velocity * track->volML) >> 14;
    if (vol > 0xFF)
        vol = 0xFF;
    chan->leftVolume = vol;
}

void TrackStop(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    struct SoundChannel *chan;

    if (!(track->flags & MPT_FLG_EXIST))
        return;

    for (chan = track->chan; chan != NULL; chan = chan->np)
    {
        if (chan->status != 0)
        {
            u32 cgbType = chan->type & TONEDATA_TYPE_CGB;

            if (cgbType != 0)
                SOUND_INFO_PTR->CgbOscOff(cgbType);
            chan->status = 0;
        }
        chan->track = NULL;
    }

    track->chan = NULL;
}

void MPlayMain(struct MusicPlayerInfo *mplayInfo)
{
    struct SoundInfo *soundInfo;
    struct MusicPlayerTrack *track;
    u32 tempoCount;
    s32 i;

    if (mplayInfo->ident != ID_NUMBER)
        return;

    mplayInfo->ident++;

    // the next player in the chain first
    if (mplayInfo->func != NULL)
        mplayInfo->func(mplayInfo->intp);

    if ((s32)mplayInfo->status < 0)
        goto done;

    soundInfo = SOUND_INFO_PTR;

    FadeOutBody(mplayInfo);

    if ((s32)mplayInfo->status < 0)
        goto done;

    // One tick per 150 of tempo.  The sum is compared before it is stored
    // in 16 bits.
    tempoCount = mplayInfo->tempoC + mplayInfo->tempoI;

    for (;;)
    {
        u32 bit;
        u32 active;

        mplayInfo->tempoC = tempoCount;
        if (tempoCount < 150)
            break;

        i = mplayInfo->trackCount;
        track = mplayInfo->tracks;
        bit = 1;
        active = 0;

        do
        {
            struct SoundChannel *chan;

            if (!(track->flags & MPT_FLG_EXIST))
                goto next_track;

            active |= bit;

            // gate times
            for (chan = track->chan; chan != NULL; chan = chan->np)
            {
                if (chan->status & SOUND_CHANNEL_SF_ON)
                {
                    if (chan->gt != 0 && --chan->gt == 0)
                        chan->status |= SOUND_CHANNEL_SF_STOP;
                }
                else
                {
                    ClearChain(chan);
                }
            }

            if (track->flags & MPT_FLG_START)
            {
                Clear64byte(track);
                track->flags = MPT_FLG_EXIST;
                track->bendRange = 2;
                track->volX = 64;
                track->lfoSpeed = 22;
                track->tone.type = 1;
            }

            // commands up to the next wait
            while (track->wait == 0)
            {
                u8 *p = track->cmdPtr;
                u32 cmd = *p;

                if (cmd < 0x80)
                {
                    cmd = track->runningStatus;
                }
                else
                {
                    track->cmdPtr = p + 1;
                    if (cmd >= 0xBD)
                        track->runningStatus = cmd;
                }

                if (cmd >= 0xCF)
                {
                    soundInfo->plynote(cmd - 0xCF, mplayInfo, track);
                }
                else if (cmd > 0xB0)
                {
                    mplayInfo->cmd = cmd - 0xB1;
                    ((MPlayCmdFunc)soundInfo->MPlayJumpTable[cmd - 0xB1])(mplayInfo, track);
                    if (track->flags == 0)
                        goto next_track;
                }
                else
                {
                    track->wait = gClockTable[cmd - 0x80];
                }
            }

            track->wait--;

            // LFO
            if (track->lfoSpeed != 0 && track->mod != 0)
            {
                if (track->lfoDelayC != 0)
                {
                    track->lfoDelayC--;
                }
                else
                {
                    u32 speedC = track->lfoSpeedC + track->lfoSpeed;
                    s32 mod;

                    track->lfoSpeedC = speedC;
                    // a triangle wave; the falling half uses the 9-bit sum
                    if ((s8)(speedC - 0x40) < 0)
                        mod = (s8)speedC;
                    else
                        mod = 0x80 - speedC;
                    mod = (s32)(track->mod * mod) >> 6;

                    if ((u8)(track->modM ^ mod) != 0)
                    {
                        track->modM = mod;
                        if (track->modT == 0)
                            track->flags |= MPT_FLG_PITCHG;
                        else
                            track->flags |= MPT_FLG_VOLCHG;
                    }
                }
            }

        next_track:
            track++;
            bit <<= 1;
        }
        while (--i > 0);

        mplayInfo->clock++;

        if (active == 0)
        {
            mplayInfo->status = MUSICPLAYER_STATUS_PAUSE;
            goto done;
        }

        mplayInfo->status = active;
        tempoCount = mplayInfo->tempoC - 150;
    }

    // volume and pitch of the channels of changed tracks
    i = mplayInfo->trackCount;
    track = mplayInfo->tracks;

    do
    {
        struct SoundChannel *chan;

        if (!(track->flags & MPT_FLG_EXIST) || !(track->flags & (MPT_FLG_VOLCHG | MPT_FLG_PITCHG)))
            continue;

        TrkVolPitSet(mplayInfo, track);

        for (chan = track->chan; chan != NULL; chan = chan->np)
        {
            u32 cgbType;

            if (!(chan->status & SOUND_CHANNEL_SF_ON))
            {
                ClearChain(chan);
                continue;
            }

            cgbType = chan->type & TONEDATA_TYPE_CGB;

            if (track->flags & MPT_FLG_VOLCHG)
            {
                ChnVolSet(chan, track);
                if (cgbType != 0)
                    ((struct CgbChannel *)chan)->mo |= 1;
            }

            if (track->flags & MPT_FLG_PITCHG)
            {
                s32 key = chan->ky + (s8)track->keyM;

                if (key < 0)
                    key = 0;

                if (cgbType != 0)
                {
                    struct CgbChannel *cgbChan = (struct CgbChannel *)chan;

                    cgbChan->fr = soundInfo->MidiKeyToCgbFreq(cgbType, key, track->pitM);
                    cgbChan->mo |= 2;
                }
                else
                {
                    chan->freq = MidiKeyToFreq(chan->wav, key, track->pitM);
                }
            }
        }

        track->flags &= 0xF0;
    }
    while (track++, --i > 0);

done:
    mplayInfo->ident = ID_NUMBER;
}

void ply_note(u32 note_cmd, struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    struct SoundInfo *soundInfo = SOUND_INFO_PTR;
    struct ToneData *tone;
    struct SoundChannel *chan;
    u8 *p;
    u32 key;
    u32 priority;
    u32 cgbType;
    s32 rhythmPan;

    track->gateTime = gClockTable[note_cmd];

    // optional key, velocity and extra gate time
    p = track->cmdPtr;
    if (*p < 0x80)
    {
        track->key = *p;
        p++;
        if (*p < 0x80)
        {
            track->velocity = *p;
            p++;
            if (*p < 0x80)
            {
                track->gateTime += *p;
                p++;
            }
        }
        track->cmdPtr = p;
    }

    rhythmPan = 0;
    tone = &track->tone;
    key = track->key;

    if (tone->type & (TONEDATA_TYPE_RHY | TONEDATA_TYPE_SPL))
    {
        u32 index = key;

        if (tone->type & TONEDATA_TYPE_SPL)
            index = tone->u.keySplitTable[key];

        tone = &((struct ToneData *)tone->wav)[index];

        if (tone->type & (TONEDATA_TYPE_RHY | TONEDATA_TYPE_SPL))
            return;

        if (track->tone.type & TONEDATA_TYPE_RHY)
        {
            if (tone->pan_sweep & 0x80)
                rhythmPan = ((s32)tone->pan_sweep - TONEDATA_P_S_PAN) << 1;
            key = tone->key;
        }
    }

    priority = mplayInfo->priority + track->priority;
    if (priority > 0xFF)
        priority = 0xFF;

    cgbType = tone->type & TONEDATA_TYPE_CGB;

    if (cgbType != 0)
    {
        // CGB channels: the one of the type, if it isn't playing something
        // of higher priority.
        if (soundInfo->cgbChans == NULL)
            return;

        chan = (struct SoundChannel *)&soundInfo->cgbChans[cgbType - 1];

        if ((chan->status & SOUND_CHANNEL_SF_ON) && !(chan->status & SOUND_CHANNEL_SF_STOP))
        {
            if (chan->pr > priority)
                return;
            if (chan->pr == priority && (uintptr_t)chan->track < (uintptr_t)track)
                return;
        }
    }
    else
    {
        // DirectSound: a free channel, or else the released channel (or if
        // none, any channel) of lowest priority, of the highest track.
        u32 bestPriority = priority;
        struct MusicPlayerTrack *bestTrack = track;
        bool32 foundReleased = FALSE;
        struct SoundChannel *best = NULL;
        s32 n = soundInfo->maxChans;

        chan = soundInfo->chans;

        do
        {
            if (!(chan->status & SOUND_CHANNEL_SF_ON))
                goto found;

            if (chan->status & SOUND_CHANNEL_SF_STOP)
            {
                if (!foundReleased)
                {
                    foundReleased = TRUE;
                    bestPriority = chan->pr;
                    bestTrack = chan->track;
                    best = chan;
                    goto next_chan;
                }
            }
            else if (foundReleased)
            {
                goto next_chan;
            }

            if (chan->pr < bestPriority)
            {
                bestPriority = chan->pr;
                bestTrack = chan->track;
                best = chan;
            }
            else if (chan->pr == bestPriority)
            {
                if ((uintptr_t)chan->track > (uintptr_t)bestTrack)
                {
                    bestTrack = chan->track;
                    best = chan;
                }
                else if (chan->track == bestTrack)
                {
                    best = chan;
                }
            }

        next_chan:
            chan++;
        }
        while (--n > 0);

        chan = best;
        if (chan == NULL)
            return;
    }

found:
    ClearChain(chan);

    // first in the track's chain
    chan->pp = NULL;
    chan->np = track->chan;
    if (track->chan != NULL)
        ((struct SoundChannel *)track->chan)->pp = chan;
    track->chan = chan;
    chan->track = track;

    track->lfoDelayC = track->lfoDelay;
    if (track->lfoDelay != 0)
        ClearModMAsm(track);

    TrkVolPitSet(mplayInfo, track);

    chan->gt = track->gateTime;
    chan->mk = track->key;
    chan->ve = track->velocity;
    chan->pr = priority;
    chan->ky = key;
    chan->rp = rhythmPan;
    chan->type = tone->type;
    chan->attack = tone->u.adsr.attack;
    chan->decay = tone->u.adsr.decay;
    chan->sustain = tone->u.adsr.sustain;
    chan->release = tone->u.adsr.release;
    chan->echoVolume = track->echoVolume;
    chan->echoLength = track->echoLength;

    if (cgbType != 0)
        ((struct CgbChannel *)chan)->wp = (u32 *)tone->wav;
    else
        chan->wav = tone->wav;

    ChnVolSet(chan, track);

    {
        s32 noteKey = chan->ky + (s8)track->keyM;

        if (noteKey < 0)
            noteKey = 0;

        if (cgbType != 0)
        {
            struct CgbChannel *cgbChan = (struct CgbChannel *)chan;
            u32 sweep = tone->pan_sweep;

            cgbChan->le = tone->length;
            if ((sweep & 0x80) || !(sweep & 0x70))
                sweep = 8;
            cgbChan->sw = sweep;
            cgbChan->fr = soundInfo->MidiKeyToCgbFreq(cgbType, noteKey, track->pitM);
        }
        else
        {
            chan->freq = MidiKeyToFreq(chan->wav, noteKey, track->pitM);
        }
    }

    chan->status = SOUND_CHANNEL_SF_START;
    track->flags &= 0xF0;
}

#endif // NONMATCHING
