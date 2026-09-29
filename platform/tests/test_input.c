/* The input script compiler (platform/input.c) on platform/tests/demo_input.txt,
 * against what tools/emutest.py makes of it. */
#include <stdlib.h>
#include <string.h>

#include "platform.h"
#include "tests/test.h"

int main(void)
{
    struct HostScript *s = HostScriptLoad("platform/tests/demo_input.txt");
    int idx;
    long f;

    CHECK(s != NULL, "load");
    if (!s)
        return 1;
    /* wait 10; press A x2 (2 down, 5 up); hold Up+B 3; shot; 2 x (press Start, shot); wait 3 */
    /* (tools/emutest.py's compile_script gives the same) */
    CHECK_EQ(HostScriptFrames(s), 10 + 14 + 3 + 32 + 3, "frames");
    for (f = 0; f < 10; f++)
        CHECK_EQ(HostScriptKeys(s, f), 0, "frame %ld", f);
    CHECK_EQ(HostScriptKeys(s, 10), 0x001, "A");
    CHECK_EQ(HostScriptKeys(s, 11), 0x001, "A");
    CHECK_EQ(HostScriptKeys(s, 12), 0, "gap");
    CHECK_EQ(HostScriptKeys(s, 16), 0, "gap");
    CHECK_EQ(HostScriptKeys(s, 17), 0x001, "A 2");
    CHECK_EQ(HostScriptKeys(s, 19), 0, "gap 2");
    CHECK_EQ(HostScriptKeys(s, 24), 0x042, "Up+B");
    CHECK_EQ(HostScriptKeys(s, 26), 0x042, "Up+B");
    CHECK_EQ(HostScriptKeys(s, 27), 0x008, "Start");
    CHECK_EQ(HostScriptKeys(s, 28), 0x008, "Start");
    CHECK_EQ(HostScriptKeys(s, 29), 0, "released");
    CHECK_EQ(HostScriptKeys(s, 43), 0x008, "Start 2");
    CHECK_EQ(HostScriptKeys(s, 45), 0, "after");
    CHECK_EQ(HostScriptKeys(s, 61), 0, "end");

    CHECK(HostScriptShot(s, 25, &idx) == NULL, "no shot at 25");
    {
        const char *n = HostScriptShot(s, 26, &idx);
        CHECK(n && strcmp(n, "s") == 0, "shot s at 26");
        n = HostScriptShot(s, 42, &idx);
        CHECK(n && strcmp(n, "t") == 0, "shot t at 42");
        n = HostScriptShot(s, 58, &idx);
        CHECK(n && strcmp(n, "t_2") == 0, "shot t_2 at 58");
    }
    CHECK(HostScriptSram(s) == NULL, "no sram");
    return test_report("test_input");
}
