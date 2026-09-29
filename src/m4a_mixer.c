// The loops of the m4a mixer (SoundMainRAM, src/m4a_1.c) in plain C: they
// start the part of the DirectSound buffer SoundMain mixes into (cleared, or
// the reverb of an earlier part) and add one channel's samples to it.
//
// The NONMATCHING GBA build compiles this file as ARM code (agbcc_arm -O1,
// see the Makefile) and runs it from IWRAM, copied to SoundMainRAM_Buffer
// by m4aSoundInit, like the original mixer (asm/m4a_1.s): as Thumb code
// from ROM the mixer takes several times the original's time, which the
// game notices (the VBlank handler runs it, and a busy frame of the main
// loop then overruns into the next one: frames drop where the original
// drops none).  The copy works because the code only branches within itself
// (relative) and fits in the buffer: M4aMixFixed must come first and
// M4aMixEnd last, 0x400 bytes at most apart (tools/nonmatching_check.py
// checks it; they use 0x3FC).  They are also as fast as the original's
// (measured in mGBA), which takes writing them for agbcc_arm: few enough
// variables for its 13 registers, the small factor of a multiplication in
// the operand ARM's multiplier terminates early on (a sample or a sample
// difference, not a volume or a position), and rare cases out of the way.
// The matching build assembles asm/m4a_1.s instead, so this file is empty
// there.
//
// Like the original, the loops work on four output samples at a time, in
// one 32-bit word per side: the word is rotated right by 8 bits per sample,
// which brings the next byte to the top, and the sample times the volume is
// added to that byte (bits 8-15 of the product, wrapping).  After 4 samples
// the bytes are in place again.
#include "gba/m4a_internal.h"

#if NONMATCHING

// A channel that ends in the middle of a word, after the sample of its
// lane (lanesLeft more lanes in the word): the word's bytes back in place,
// the rest of the word unchanged, and the channel stopped (FALSE).
#define STOP_IN_WORD(buf, right, left, lanesLeft)        \
    do                                                   \
    {                                                    \
        while (--(lanesLeft) >= 0)                       \
        {                                                \
            (right) = M4A_ROR(right, 8);                 \
            (left) = M4A_ROR(left, 8);                   \
        }                                                \
        M4A_STORE_WORD(buf, right);                      \
        M4A_STORE_WORD((buf) + PCM_DMA_BUF_SIZE, left);  \
        return FALSE;                                    \
    }                                                    \
    while (0)

// The length of the channel's loop: 0 if it doesn't loop.
#define LOOP_LENGTH(chan) \
    (((chan)->status & SOUND_CHANNEL_SF_LOOP) ? (chan)->wav->size - (chan)->wav->loopStart : 0)

// At the sample's own rate (TONEDATA_TYPE_FIX), n samples (a multiple of 4)
// into buf.  A sample that loops starts over at its loop; one that doesn't
// stops the channel when it ends (FALSE: ct and cp are then as they were).
bool32 M4aMixFixed(struct SoundChannel *chan, s8 *buf, s32 n)
{
    s8 *cp = chan->cp;
    u32 ct = chan->ct;
    u32 rightVol = chan->er << 16;
    u32 leftVol = chan->el << 16;
    u32 right = M4A_LOAD_WORD(buf);
    u32 left = M4A_LOAD_WORD(buf + PCM_DMA_BUF_SIZE);

    for (;;)
    {
        s32 sample = *cp++;

        M4A_MIX(right, sample, rightVol);
        M4A_MIX(left, sample, leftVol);
        if (--ct == 0)
        {
            struct WaveData *wav = chan->wav;

            ct = LOOP_LENGTH(chan);
            if (ct == 0)
            {
                // The channel stops: the rest of the word stays, its bytes
                // back in place.
                while ((--n & 3) != 0)
                {
                    right = M4A_ROR(right, 8);
                    left = M4A_ROR(left, 8);
                }
                M4A_STORE_WORD(buf, right);
                M4A_STORE_WORD(buf + PCM_DMA_BUF_SIZE, left);
                return FALSE;
            }
            cp = wav->data + wav->loopStart;
        }
        // The word is full after every 4th sample.
        if ((--n & 3) == 0)
        {
            M4A_STORE_WORD(buf, right);
            M4A_STORE_WORD(buf + PCM_DMA_BUF_SIZE, left);
            buf += 4;
            if (n == 0)
                break;
            right = M4A_LOAD_WORD(buf);
            left = M4A_LOAD_WORD(buf + PCM_DMA_BUF_SIZE);
        }
    }

    chan->ct = ct;
    chan->cp = cp;
    return TRUE;
}

// Resampled, n samples (a multiple of 4) into buf: fw is the position
// between cp[0] and cp[1] (23 bits), interpolated linearly, and advances by
// step per output sample.  Returns like M4aMixFixed (and keeps fw too).
//
// This loop is most of the time the game spends on sound, and the game
// notices that time (see the top), so it is written for agbcc_arm: the 4
// samples of a word are 4 copies of RESAMPLE_ONE (no counter: agbcc_arm
// leaves the loop 13 registers, and each one is taken); what the loop
// doesn't need stays on the stack (the volatile locals); the rare case, a
// sample's end, is out of the way at the bottom (agbcc lays code out in
// source order).  `next` is cp + 1, which saves a load when the position
// advances by one sample.
#define RESAMPLE_ONE(lane)                                              \
    do                                                                  \
    {                                                                   \
        s32 sample = cur + ((s32)(delta * fw) >> 23);                   \
        u32 advance;                                                    \
                                                                        \
        M4A_MIX(right, sample, rightVol);                               \
        M4A_MIX(left, sample, leftVol);                                 \
        fw += step;                                                     \
        advance = fw >> 23;                                             \
        if (advance != 0)                                               \
        {                                                               \
            /* Only bits 23-29: bits 30 and 31 stay (a step that large  \
               never happens). */                                       \
            fw &= ~0x3F800000;                                          \
            ct -= advance;                                              \
            if (ct <= 0)                                                \
            {                                                           \
                lanesLeft = 3 - (lane);                                 \
                goto past_end;                                          \
            }                                                           \
            /* The next sample is cur + delta already. */               \
            if (--advance == 0)                                         \
                cur += delta;                                           \
            else                                                        \
                cur = *(next += advance);                               \
            delta = *++next - cur;                                      \
        }                                                               \
    }                                                                   \
    while (0)

bool32 M4aMixResample(struct SoundChannel *chan_, s8 *buf, s32 n, u32 step)
{
    struct SoundChannel *volatile chan = chan_;
    s8 *volatile end = buf + n;
    volatile s32 lanesLeft;
    s8 *next = chan_->cp + 1;
    u32 fw = chan_->fw;
    s32 ct = chan_->ct;
    u32 rightVol = chan_->er << 16;
    u32 leftVol = chan_->el << 16;
    s32 cur = next[-1];
    s32 delta = next[0] - cur;
    u32 right;
    u32 left;
    u32 loopLen;

    for (;;)
    {
        right = M4A_LOAD_WORD(buf);
        left = M4A_LOAD_WORD(buf + PCM_DMA_BUF_SIZE);
        RESAMPLE_ONE(0);
    lane1:
        RESAMPLE_ONE(1);
    lane2:
        RESAMPLE_ONE(2);
    lane3:
        RESAMPLE_ONE(3);
    word_done:
        M4A_STORE_WORD(buf, right);
        M4A_STORE_WORD(buf + PCM_DMA_BUF_SIZE, left);
        buf += 4;
        if (buf == end)
            break;
    }

    chan_ = chan;
    chan_->fw = fw;
    chan_->ct = ct;
    chan_->cp = next - 1;
    return TRUE;

past_end:
    // Past the end, as many positions as ct is below 0: the loop is wound
    // back as often as needed, and cp is as far before the end as ct says
    // (the loop ends where the sample does).
    chan_ = chan;
    loopLen = LOOP_LENGTH(chan_);
    if (loopLen != 0)
    {
        struct WaveData *wav = chan_->wav;

        do
            ct += loopLen;
        while (ct <= 0);
        next = wav->data + wav->size - ct;
        delta = next[1] - next[0];
        cur = *next++;
        // Back to the next lane.
        if (lanesLeft == 3)
            goto lane1;
        if (lanesLeft == 2)
            goto lane2;
        if (lanesLeft == 1)
            goto lane3;
        goto word_done;
    }
    {
        s32 lanes = lanesLeft;

        STOP_IN_WORD(buf, right, left, lanes);
    }
}

// Without reverb: clears `words` words of both halves of the buffer.
void M4aMixClear(s8 *buf, s32 words)
{
    do
    {
        M4A_STORE_WORD(buf, 0);
        M4A_STORE_WORD(buf + PCM_DMA_BUF_SIZE, 0);
        buf += 4;
    }
    while (--words != 0);
}

// With reverb: each new sample starts as the average of the two channels'
// samples at src (an earlier part of the buffer) times the reverb level, n
// samples (at least 1).
void M4aMixReverb(s8 *dst, s8 *src, s32 n, u32 reverb)
{
    do
    {
        s32 sum = dst[PCM_DMA_BUF_SIZE] + dst[0] + src[PCM_DMA_BUF_SIZE] + src[0];

        sum = (sum * (s32)reverb) >> 9;
        if (sum & 0x80)
            sum++;
        dst[PCM_DMA_BUF_SIZE] = sum;
        dst[0] = sum;
        src++;
        dst++;
    }
    while (--n != 0);
}

// The end of the code copied to IWRAM.
void M4aMixEnd(void)
{
}

#endif // NONMATCHING
