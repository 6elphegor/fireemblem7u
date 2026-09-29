/*
 * The host program's entry point for the game: everything is in
 * HostMain (platform/host.c), which calls the game's AgbMain.
 */
#include "platform.h"

int main(int argc, char **argv)
{
    return HostMain(argc, argv);
}
