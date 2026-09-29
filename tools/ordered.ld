/* Partial link (ld -r) of generated data objects into one object with a
   single .rodata, whose input sections are named .rodata.ord.KEY and go in
   the order of KEY.  Used for build/msg_data.o (assembly + C) and
   build/sound/sound.o (see the Makefile).  Empty code sections that the
   compiler leaves in the C objects are dropped. */
SECTIONS
{
    .rodata : { *(SORT_BY_NAME(.rodata.ord.*)) }
    /DISCARD/ : { *(.text) *(.data) *(.bss) }
}
