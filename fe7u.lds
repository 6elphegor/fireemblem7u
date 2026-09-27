OUTPUT_ARCH(arm)
ENTRY(_entry)

SECTIONS
{
    . = 0x08000000;

    .text :
    {
        build/asm/crt0.o(.text);
        build/asm/code_08000A50.o(.text);
        build/asm/code_080046A0.o(.text);
        build/asm/code_080046A8.o(.text);
        build/asm/code_08008094.o(.text);
        build/asm/code_0800F9B0.o(.text);
        build/asm/code_08016428.o(.text);
        build/asm/code_08020098.o(.text);
        build/asm/code_08027EC8.o(.text);
        build/asm/code_08030F54.o(.text);
        build/asm/code_0803BF60.o(.text);
        build/asm/code_08047DA4.o(.text);
        build/asm/code_08053214.o(.text);
        build/asm/code_0805E13C.o(.text);
        build/asm/code_080669F4.o(.text);
        build/asm/code_08073354.o(.text);
        build/asm/code_0807ACDC.o(.text);
        build/asm/code_08082C8C.o(.text);
        build/asm/code_08091AD8.o(.text);
        build/asm/code_0809F388.o(.text);
        build/asm/code_080AA308.o(.text);
        build/asm/code_080B5934.o(.text);
        build/asm/m4a.o(.text);
        build/asm/libagb.o(.text);
        build/asm/libgcc.o(.text);
        build/asm/libc.o(.text);
        build/asm/veneers.o(.text);
    } = 0

    .rodata :
    {
        build/data/data.o(.rodata);
    } = 0

    /DISCARD/ :
    {
        *(*);
    }
}
