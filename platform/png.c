/*
 * PNG output of a frame (0x00BBGGRR pixels) as 8-bit RGB, filter 0 rows,
 * like tools/emutest.c's shots, so the two can be compared by pixels.
 */
#include <stdio.h>
#include <stdlib.h>
#include <zlib.h>

#include "platform.h"

static void put32(FILE *f, uint32_t v)
{
    fputc(v >> 24, f);
    fputc((v >> 16) & 0xFF, f);
    fputc((v >> 8) & 0xFF, f);
    fputc(v & 0xFF, f);
}

static void chunk(FILE *f, const char *type, const unsigned char *data, uint32_t len)
{
    uLong crc = crc32(0, (const Bytef *)type, 4);
    put32(f, len);
    fwrite(type, 1, 4, f);
    if (len) {
        fwrite(data, 1, len, f);
        crc = crc32(crc, data, len);
    }
    put32(f, (uint32_t)crc);
}

int HostWritePng(const char *path, const uint32_t *fb, int w, int h)
{
    static const unsigned char sig[8] = { 0x89, 'P', 'N', 'G', '\r', '\n', 0x1A, '\n' };
    size_t rawLen = (size_t)(w * 3 + 1) * h;
    unsigned char *raw = malloc(rawLen), ihdr[13];
    uLongf zLen = compressBound(rawLen);
    unsigned char *z = malloc(zLen);
    FILE *f;
    int x, y, ok;

    if (!raw || !z) {
        free(raw);
        free(z);
        return -1;
    }
    for (y = 0; y < h; y++) {
        unsigned char *r = raw + (size_t)y * (w * 3 + 1);
        *r++ = 0;
        for (x = 0; x < w; x++) {
            uint32_t p = fb[y * w + x];
            *r++ = p & 0xFF;
            *r++ = (p >> 8) & 0xFF;
            *r++ = (p >> 16) & 0xFF;
        }
    }
    ok = compress2(z, &zLen, raw, rawLen, 6) == Z_OK;
    free(raw);
    if (!ok || !(f = fopen(path, "wb"))) {
        free(z);
        return -1;
    }
    ihdr[0] = w >> 24; ihdr[1] = w >> 16; ihdr[2] = w >> 8; ihdr[3] = w;
    ihdr[4] = h >> 24; ihdr[5] = h >> 16; ihdr[6] = h >> 8; ihdr[7] = h;
    ihdr[8] = 8;  /* bit depth */
    ihdr[9] = 2;  /* RGB */
    ihdr[10] = ihdr[11] = ihdr[12] = 0;
    fwrite(sig, 1, 8, f);
    chunk(f, "IHDR", ihdr, 13);
    chunk(f, "IDAT", z, (uint32_t)zLen);
    chunk(f, "IEND", NULL, 0);
    free(z);
    return fclose(f) == 0 ? 0 : -1;
}
