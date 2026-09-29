/*
 * Decompress every LZ77 blob of the ROM with platform/bios.c and compare it
 * with the file the build makes from graphics/ (data/graphics.txt: every
 * `@ LZ77` label datasplit knows about).  The expected bytes come from
 * tools/gfx.py's extraction and gbagfx (4bpp images: build/graphics/NAME.4bpp,
 * which the build compresses back to the ROM's bytes), so run `make` first.
 *
 *   test_lz77 [ROOT]      ROOT: the repository (default .)
 *
 * Reads baserom.gba at run time; nothing ROM-derived is stored.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "bios.h"
#include "test.h"

static u8 *readFile(const char *path, long *size)
{
    FILE *f = fopen(path, "rb");
    u8 *buf;
    if (!f)
        return NULL;
    fseek(f, 0, SEEK_END);
    *size = ftell(f);
    fseek(f, 0, SEEK_SET);
    buf = malloc(*size ? *size : 1);
    if (fread(buf, 1, *size, f) != (size_t)*size) {
        fclose(f);
        free(buf);
        return NULL;
    }
    fclose(f);
    return buf;
}

int main(int argc, char **argv)
{
    const char *root = argc > 1 ? argv[1] : ".";
    char path[1024], line[1024];
    long romSize, n = 0, missing = 0, vramDiff = 0, bytes = 0;
    u8 *rom, *out = malloc(0x80000), *vout = malloc(0x80000);
    FILE *manifest;

    snprintf(path, sizeof path, "%s/baserom.gba", root);
    rom = readFile(path, &romSize);
    if (!rom) {
        fprintf(stderr, "test_lz77: can't read %s\n", path);
        return 2;
    }
    snprintf(path, sizeof path, "%s/data/graphics.txt", root);
    manifest = fopen(path, "r");
    if (!manifest) {
        fprintf(stderr, "test_lz77: can't read %s\n", path);
        return 2;
    }
    while (fgets(line, sizeof line, manifest)) {
        unsigned addr, size;
        char format[64], name[512], rest[512] = "";
        long expSize;
        u8 *exp;
        u32 got;
        if (line[0] == '#' || sscanf(line, "%x %x %63s %511s %511[^\n]", &addr, &size, format, name, rest) < 4)
            continue;
        if (!strncmp(rest, "raw", 3))
            continue; /* stored uncompressed */
        if (!strcmp(format, "4bpp"))
            snprintf(path, sizeof path, "%s/build/graphics/%s.4bpp", root, name);
        else if (!strcmp(format, "palette"))
            snprintf(path, sizeof path, "%s/graphics/%s.gbapal", root, name);
        else
            snprintf(path, sizeof path, "%s/graphics/%s.bin", root, name);
        exp = readFile(path, &expSize);
        if (!exp) {
            missing++;
            continue;
        }
        n++;
        {
            const u8 *src = rom + (addr - 0x08000000);
            CHECK(src[0] == 0x10, "%s: not an LZ77 stream", name);
            CHECK_EQ(BiosUnCompSize(src), expSize, "%s: size", name);
            if ((long)BiosUnCompSize(src) > 0x70000) {
                free(exp);
                continue;
            }
            memset(out, 0xEE, 0x80000);
            memset(vout, 0xEE, 0x80000);
            got = LZ77UnComp(src, out, 0);
            LZ77UnCompVram(src, vout);
            CHECK(got == (u32)expSize && !memcmp(out, exp, expSize), "%s: LZ77UnCompWram differs", name);
            CHECK(out[expSize] == 0xEE, "%s: wrote past the end", name);
            /* odd sizes leave the last byte unwritten in VRAM */
            if (memcmp(vout, exp, expSize & ~1))
                vramDiff++;
            bytes += expSize;
        }
        free(exp);
    }
    fclose(manifest);
    printf("test_lz77: %ld LZ77 blobs (%ld bytes) decompressed and compared", n, bytes);
    if (missing)
        printf(", %ld expected files missing (run make)", missing);
    printf("; LZ77UnCompVram differs from Wram on %ld\n", vramDiff);
    CHECK(n > 3000 && missing == 0, "expected all ~3,660 blobs (run make first)");
    return test_report("test_lz77");
}
