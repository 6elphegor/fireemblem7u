/* Minimal check macros for the platform tests. */
#ifndef PLATFORM_TEST_H
#define PLATFORM_TEST_H

#include <stdio.h>

static int test_checks, test_failures;

#define CHECK(cond, ...)                                           \
    do {                                                           \
        test_checks++;                                             \
        if (!(cond)) {                                             \
            test_failures++;                                       \
            fprintf(stderr, "%s:%d: FAIL: ", __FILE__, __LINE__); \
            fprintf(stderr, __VA_ARGS__);                          \
            fprintf(stderr, "\n");                                 \
        }                                                          \
    } while (0)

#define CHECK_EQ(got, want, ...)                                           \
    do {                                                                   \
        long long g_ = (long long)(got), w_ = (long long)(want);           \
        test_checks++;                                                     \
        if (g_ != w_) {                                                    \
            test_failures++;                                               \
            fprintf(stderr, "%s:%d: FAIL: ", __FILE__, __LINE__);         \
            fprintf(stderr, __VA_ARGS__);                                  \
            fprintf(stderr, ": got %lld (%#llx), want %lld (%#llx)\n", g_, \
                    (unsigned long long)g_, w_, (unsigned long long)w_);   \
        }                                                                  \
    } while (0)

static int test_report(const char *name)
{
    printf("%s: %d checks, %d failed\n", name, test_checks, test_failures);
    return test_failures != 0;
}

#endif
