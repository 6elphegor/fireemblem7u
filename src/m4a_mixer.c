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
// checks it).  The loops are written for agbcc_arm's register allocator
// (few variables live at once) and its multiplications (the small factor
// first).  The matching build assembles asm/m4a_1.s instead, so this file is
// empty there.
//
// Like the original, the loops work on four output samples at a time, in
// one 32-bit word per side: the word is rotated right by 8 bits per sample,
// which brings the next byte to the top, and the sample times the volume is
// added to that byte (bits 8-15 of the product, wrapping).  After 4 samples
// the bytes are in place again.
#include "gba/m4a_internal.h"

#if NONMATCHING

// A channel that ends in the middle of a word, after `lanes` more samples
// would have filled it: its bytes back in place, the rest of the word
// unchanged, and the channel stopped (FALSE).
#define STOP_IN_WORD(buf, right, left, lanes)            \
    do                                                   \
    {                                                    \
        while (--(lanes) > 0)                            \
        {                                                \
            (right) = M4A_ROR(right, 8);                 \
            (left) = M4A_ROR(left, 8);                   \
        }                                                \
        M4A_STORE_WORD(buf, right);                      \
        M4A_STORE_WORD((buf) + PCM_DMA_BUF_SIZE, left);  \
        return FALSE;                                    \
    }                                                    \
    while (0)

// At the sample's own rate (TONEDATA_TYPE_FIX), n samples (a multiple of
// 4).  A sample that loops starts over at its loop; one that doesn't stops
// the channel when it ends (FALSE; st is then as it was).
bool32 M4aMixFixed(struct M4aMixState *st, s32 n)
{
    s8 *buf = st->buf;
    s8 *cp = st->cp;
    u32 ct = st->ct;
    u32 rightVol = st->rightVol;
    u32 leftVol = st->leftVol;

    do
    {
        u32 right = M4A_LOAD_WORD(buf);
        u32 left = M4A_LOAD_WORD(buf + PCM_DMA_BUF_SIZE);
        s32 lanes = 4;

        do
        {
            s32 sample = *cp++;

            M4A_MIX(right, rightVol, sample);
            M4A_MIX(left, leftVol, sample);
            if (--ct == 0)
            {
                if (st->loopLen == 0)
                    STOP_IN_WORD(buf, right, left, lanes);
                cp = st->loopStart;
                ct = st->loopLen;
            }
        }
        while (--lanes > 0);

        M4A_STORE_WORD(buf, right);
        M4A_STORE_WORD(buf + PCM_DMA_BUF_SIZE, left);
        buf += 4;
    }
    while ((n -= 4) > 0);

    st->buf = buf;
    st->ct = ct;
    st->cp = cp;
    return TRUE;
}

// Resampled, n samples (a multiple of 4): fw is the position between cp[0]
// and cp[1] (23 bits), interpolated linearly, and advances by step per
// output sample.  Returns like M4aMixFixed (and keeps fw too).
bool32 M4aMixResample(struct M4aMixState *st, s32 n)
{
    s8 *buf = st->buf;
    s8 *cp = st->cp;
    u32 fw = st->fw;
    u32 rightVol = st->rightVol;
    u32 leftVol = st->leftVol;
    s32 cur = cp[0];
    s32 delta = cp[1] - cur;

    do
    {
        u32 right = M4A_LOAD_WORD(buf);
        u32 left = M4A_LOAD_WORD(buf + PCM_DMA_BUF_SIZE);
        s32 lanes = 4;

        do
        {
            s32 sample = cur + ((s32)(fw * delta) >> 23);
            u32 advance;

            M4A_MIX(right, rightVol, sample);
            M4A_MIX(left, leftVol, sample);
            fw += st->step;
            advance = fw >> 23;
            if (advance != 0)
            {
                u32 ct = st->ct - advance;

                // Only bits 23-29: bits 30 and 31 stay (a step that large
                // never happens).
                fw &= ~0x3F800000;
                if ((s32)ct <= 0)
                {
                    // Past the end, as many positions as ct is below 0: the
                    // loop is wound back as often as needed, and cp is as
                    // far before its end as ct says.
                    if (st->loopLen == 0)
                        STOP_IN_WORD(buf, right, left, lanes);
                    do
                        ct += st->loopLen;
                    while ((s32)ct <= 0);
                    cp = st->loopStart + st->loopLen - ct;
                }
                else
                {
                    cp += advance;
                }
                st->ct = ct;
                cur = cp[0];
                delta = cp[1] - cur;
            }
        }
        while (--lanes > 0);

        M4A_STORE_WORD(buf, right);
        M4A_STORE_WORD(buf + PCM_DMA_BUF_SIZE, left);
        buf += 4;
    }
    while ((n -= 4) > 0);

    st->buf = buf;
    st->fw = fw;
    st->cp = cp;
    return TRUE;
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
    while (--words > 0);
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
    while (--n > 0);
}

// The end of the code copied to IWRAM.
void M4aMixEnd(void)
{
}

#endif // NONMATCHING
