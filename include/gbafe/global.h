#pragma once

#include <stdlib.h>
#include <stddef.h>

#include "../gba/gba.h"

#define FE7 1
#define FE8 2
#define PROJECT FE7

#include "types.h"
#include "unk-types.h"
#include "unk-functions.h"
#include "unk-data.h"

// NONMATCHING (`make NONMATCHING=1` passes -DNONMATCHING=1): build the plain,
// portable C instead of the code that reproduces the original bytes (fake
// matches, register pins, asm barriers, inline ARM asm).  Always test it with
// `#if NONMATCHING` (plain C) ... `#else` (matching) ... `#endif`; it is
// undefined, hence 0, in the matching build.  See CONTRIBUTING, "Portable
// (NONMATCHING) build".

#define SECTION(name) __attribute__((section(name)))

#define NAKEDFUNC __attribute__((naked))
#define CONST_DATA        SECTION(".data")
#define EWRAM_OVERLAY(id) SECTION("ewram_overlay_" # id)

#define ARRAY_COUNT(array) (sizeof(array) / sizeof((array)[0]))

#define RED_VALUE(color) ((color) & 0x1F)
#define GREEN_VALUE(color) (((color) >> 5) & 0x1F)
#define BLUE_VALUE(color) (((color) >> 10) & 0x1F)

#define ABS(aValue) ((aValue) >= 0 ? (aValue) : -(aValue))
#define dsb() asm("":::"memory")

#define RECT_DISTANCE(aXA, aYA, aXB, aYB) (ABS((aXA) - (aXB)) + ABS((aYA) - (aYB)))

// For translate-able strings.
#define JTEXT(orig) (orig)
#define TEXT(orig, english) (orig)

#define LIMIT_AREA(num, min, max)   \
    if (num > max)                  \
        num = max;                  \
    if (num < min)                  \
        num = min;

#define LIMIT_AREA_(num, min, max)  \
    if (num < min)                  \
        num = min;                  \
    else if (num > max)             \
        num = max;

#if !MODERN
#  define STRUCT_PAD(from, to) unsigned char _pad_ ## from[(to) - (from)]
#else
#  define STRUCT_PAD(from, to)
#endif

#define ALIGN_PAD STRUCT_PAD

// Emit a not-yet-decompiled function from its asm file (kept under
// asm/nonmatching/, which is not assembled on its own).
#define ASM_FUNC(path) asm("\t.pushsection .text\n\t.include \"" path "\"\n\t.syntax divided\n\t.popsection\n")
