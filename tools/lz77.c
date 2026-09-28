/*
 * GBA BIOS LZ77 (type 0x10) compressor/decompressor.
 *
 *   lz77 -c IN OUT     compress IN (raw bytes) to OUT
 *   lz77 -d IN OUT     decompress IN (an LZ77 stream) to OUT
 *
 * The compressor reproduces the original game's compressed data byte for
 * byte.  Its matching rules are those of pret's gbagfx (tools/gbagfx/lz.c,
 * Copyright (c) 2015 YamaArashi, MIT license), which match Nintendo's
 * compressor: greedy, the longest match (3..18 bytes) at each position,
 * the nearest one among equally long matches, back-reference distances
 * 2..4096 (never 1, so the data can be decompressed straight to VRAM with
 * LZ77UnCompVram), unused flag bits zero, and the stream zero-padded to a
 * multiple of 4 bytes.  This version finds matches through hash chains
 * instead of scanning the whole window, with the same result.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MIN_DIST 2
#define MAX_DIST 0x1000
#define MIN_LEN 3
#define MAX_LEN 18
#define HASH_BITS 16

static void die(const char *msg, const char *arg)
{
    fprintf(stderr, "lz77: %s%s%s\n", msg, arg ? ": " : "", arg ? arg : "");
    exit(1);
}

static unsigned char *read_file(const char *path, long *size)
{
    FILE *f = fopen(path, "rb");
    unsigned char *buf;
    if (!f)
        die("cannot open", path);
    fseek(f, 0, SEEK_END);
    *size = ftell(f);
    fseek(f, 0, SEEK_SET);
    buf = malloc(*size + 1);
    if (!buf || fread(buf, 1, *size, f) != (size_t)*size)
        die("cannot read", path);
    fclose(f);
    return buf;
}

static void write_file(const char *path, const unsigned char *buf, long size)
{
    FILE *f = fopen(path, "wb");
    if (!f || fwrite(buf, 1, size, f) != (size_t)size || fclose(f))
        die("cannot write", path);
}

static unsigned hash3(const unsigned char *p)
{
    unsigned v = p[0] | p[1] << 8 | p[2] << 16;
    return (v * 2654435761u) >> (32 - HASH_BITS);
}

static unsigned char *compress(const unsigned char *src, long n, long *out_size)
{
    long cap = 4 + n + (n + 7) / 8 + 4;
    unsigned char *dst = malloc(cap);
    long *head = malloc(sizeof(long) << HASH_BITS);
    long *prev = malloc(sizeof(long) * (n + 1));
    long pos = 0, out = 4, inserted = 0;

    if (!dst || !head || !prev)
        die("out of memory", NULL);
    if (n <= 0 || n > 0xFFFFFF)
        die("input size out of range", NULL);
    for (long i = 0; i < (1L << HASH_BITS); i++)
        head[i] = -1;

    dst[0] = 0x10;
    dst[1] = n;
    dst[2] = n >> 8;
    dst[3] = n >> 16;

    while (pos < n) {
        long flag_at = out++;
        dst[flag_at] = 0;
        for (int bit = 0; bit < 8 && pos < n; bit++) {
            long best_len = 0, best_dist = 0;

            /* Positions that can start a match are those at most pos - MIN_DIST. */
            while (inserted <= pos - MIN_DIST) {
                if (inserted + MIN_LEN <= n) {
                    unsigned h = hash3(src + inserted);
                    prev[inserted] = head[h];
                    head[h] = inserted;
                }
                inserted++;
            }
            if (pos + MIN_LEN <= n) {
                long limit = n - pos < MAX_LEN ? n - pos : MAX_LEN;
                for (long q = head[hash3(src + pos)]; q >= 0 && pos - q <= MAX_DIST; q = prev[q]) {
                    long len = 0;
                    while (len < limit && src[q + len] == src[pos + len])
                        len++;
                    if (len > best_len) {
                        best_len = len;
                        best_dist = pos - q;
                        if (len == limit)
                            break;
                    }
                }
            }
            if (best_len >= MIN_LEN) {
                dst[flag_at] |= 0x80 >> bit;
                dst[out++] = (best_len - MIN_LEN) << 4 | (best_dist - 1) >> 8;
                dst[out++] = best_dist - 1;
                pos += best_len;
            } else {
                dst[out++] = src[pos++];
            }
        }
    }
    while (out % 4)
        dst[out++] = 0;
    free(head);
    free(prev);
    *out_size = out;
    return dst;
}

static unsigned char *decompress(const unsigned char *src, long n, long *out_size)
{
    long size, pos = 4, out = 0;
    unsigned char *dst;

    if (n < 4 || src[0] != 0x10)
        die("not an LZ77 stream", NULL);
    size = src[1] | src[2] << 8 | (long)src[3] << 16;
    dst = malloc(size + 1);
    if (!dst)
        die("out of memory", NULL);
    while (out < size) {
        int flags;
        if (pos >= n)
            die("truncated stream", NULL);
        flags = src[pos++];
        for (int bit = 0; bit < 8 && out < size; bit++) {
            if (flags & (0x80 >> bit)) {
                long len, dist;
                if (pos + 2 > n)
                    die("truncated stream", NULL);
                len = (src[pos] >> 4) + MIN_LEN;
                dist = ((src[pos] & 0xF) << 8 | src[pos + 1]) + 1;
                pos += 2;
                if (dist > out || out + len > size)
                    die("bad back reference", NULL);
                for (long i = 0; i < len; i++, out++)
                    dst[out] = dst[out - dist];
            } else {
                if (pos >= n)
                    die("truncated stream", NULL);
                dst[out++] = src[pos++];
            }
        }
    }
    *out_size = size;
    return dst;
}

int main(int argc, char **argv)
{
    long in_size, out_size;
    unsigned char *in, *out;

    if (argc != 4 || (strcmp(argv[1], "-c") && strcmp(argv[1], "-d"))) {
        fprintf(stderr, "usage: lz77 -c|-d IN OUT\n");
        return 2;
    }
    in = read_file(argv[2], &in_size);
    out = argv[1][1] == 'c' ? compress(in, in_size, &out_size)
                            : decompress(in, in_size, &out_size);
    write_file(argv[3], out, out_size);
    return 0;
}
