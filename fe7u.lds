OUTPUT_ARCH(arm)
ENTRY(_entry)

INCLUDE symbols.ld

SECTIONS
{
    . = 0x08000000;

    .text :
    {
        build/asm/crt0.o(.text);
        build/asm/code_08000A50.o(.text);
        build/src/random.o(.text);
        build/asm/code_08000F14.o(.text);
        build/src/proc.o(.text);
        build/src/icon.o(.text);
        build/asm/code_08004EF8.o(.text);
        build/src/anime.o(.text);
        build/asm/code_08006850.o(.text);
        build/src/sprite.o(.text);
        build/src/face.o(.text);
        build/asm/code_08007DD4.o(.text);
        build/asm/code_08008094.o(.text);
        build/src/talk-advance.o(.text);
        build/asm/code_0800A608.o(.text);
        build/asm/code_0800F9B0.o(.text);
        build/src/eventscr_niniandisp.o(.text);
        build/src/eventscr_screenflashfx.o(.text);
        build/src/eventscr_fadefx.o(.text);
        build/src/eventscr_spriteanim.o(.text);
        build/asm/code_08011CE0.o(.text);
        build/src/sprite-anim.o(.text);
        build/asm/code_0801252C.o(.text);
        build/asm/code_08016428.o(.text);
        build/asm/code_08020098.o(.text);
        build/src/bmfx-minefx.o(.text);
        build/src/bmfx-niniantransform.o(.text);
        build/asm/code_08021540.o(.text);
        build/src/faction.o(.text);
        build/src/gold.o(.text);
        build/asm/code_08023944.o(.text);
        build/asm/code_08027EC8.o(.text);
        build/asm/code_08030F54.o(.text);
        build/asm/code_0803BF60.o(.text);
        build/asm/code_08047DA4.o(.text);
        build/src/ui.o(.text);
        build/asm/code_08049B78.o(.text);
        build/asm/code_08053214.o(.text);
        build/src/banim-mainutils.o(.text);
        build/asm/code_08054024.o(.text);
        build/asm/code_0805E13C.o(.text);
        build/src/banim-efxdrsmmoya.o(.text);
        build/asm/code_08063FE0.o(.text);
        build/asm/code_080669F4.o(.text);
        build/asm/code_08073354.o(.text);
        build/src/eventcall_quakefx.o(.text);
        build/asm/code_0807AE58.o(.text);
        build/src/eventcall_zephielepilogue.o(.text);
        build/asm/code_0807BFBC.o(.text);
        build/src/eventcall_unittornout.o(.text);
        build/asm/code_0807C3A0.o(.text);
        build/src/eventcall_flamebreath_2.o(.text);
        build/src/eventcall_icecrystal.o(.text);
        build/asm/code_0807C8B4.o(.text);
        build/src/statscreen-util.o(.text);
        build/asm/code_08080AD8.o(.text);
        build/asm/code_08082C8C.o(.text);
        build/src/sioerror.o(.text);
        build/asm/code_08086668.o(.text);
        build/src/preputil_unitlist.o(.text);
        build/asm/code_0808E448.o(.text);
        build/asm/code_08091AD8.o(.text);
        build/asm/code_0809F388.o(.text);
        build/src/savedraw.o(.text);
        build/asm/code_080A4F74.o(.text);
        build/src/savedrawfx.o(.text);
        build/asm/code_080A5CF8.o(.text);
        build/src/scrolling_util.o(.text);
        build/src/cursor-hand.o(.text);
        build/asm/code_080A8B08.o(.text);
        build/asm/code_080AA308.o(.text);
        build/src/lord-select.o(.text);
        build/asm/code_080AEF00.o(.text);
        build/asm/code_080B5934.o(.text);
        build/src/opanim_scanline.o(.text);
        build/asm/code_080BB0E0.o(.text);
        build/asm/m4a.o(.text);
        build/asm/libagb.o(.text);
        build/asm/libgcc.o(.text);
        build/asm/libc.o(.text);
        build/asm/veneers.o(.text);
    } = 0

    .rodata :
    {
        INCLUDE build/layout.ld
    } = 0

    INCLUDE build/ram.ld

    /DISCARD/ :
    {
        *(*);
    }
}
