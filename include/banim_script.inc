@ Battle animation scripts (banim/NAME.s, extracted by tools/banim.py).
@
@ A script is a list of u32 commands, one "mode" after another (the modes
@ are the enum banim_mode_index animations, include/gbafe/banim.h), each
@ ending with banim_end_mode.  The game stores it LZ77-compressed; the
@ build assembles banim/NAME.s to build/banim/NAME.script.o and
@ tools/banim.py link resolves its sprite sheet pointers against the
@ linked ROM, compresses it and places the result (plus the mode offset
@ table) at the script's layout address.  See CONTRIBUTING.md.
@
@ Each file assembles on its own, so the labels below need no prefix.

@ Start the script.  NAME is its ROM label (the compressed data; this
@ object is not linked into the ROM, tools/banim.py takes the name from it).
.macro banim_script name
	.section .banim.script, "a"
	.balign 4
	.global \name
\name:
banim_start:
.endm

@ Start of mode N (1-12): its offset goes into the mode table.
.macro banim_mode n
banim_mode_\n:
.endm

@ 0x86 frame: show sprite sheet SHEET (a 4bpp LZ77 image, by label) with the
@ OAM frame data at byte offset OAM in the animation's OAM data, for
@ DURATION ticks.  NUM is the frame number the engine reports.
.macro banim_frame duration, num, sheet, oam
	.4byte 0x86000000 | ((\num) << 16) | (\duration), \sheet, \oam
.endm

@ 0x85 command ID (attack start, hit, sound, effect...; see
@ BattleAIS_ExecCommands).
.macro banim_cmd id
	.4byte 0x85000000 | (\id)
.endm

@ End of a mode.
.macro banim_end_mode
	.4byte 0x80000000
.endm

@ The mode table (struct BattleAnim .modes): the byte offset of modes 1..N
@ in the decompressed script (0 for a missing one), N the last mode present,
@ then N zero words.  NAME is its ROM label; it is placed right after the
@ compressed script.
.macro banim_modes name
	.section .banim.modes, "a"
	.balign 4
	.global \name
\name:
	.set banim_nmodes, 0
	.irp n, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
	.ifdef banim_mode_\n
	.set banim_nmodes, \n
	.endif
	.endr
	.irp n, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
	.if \n <= banim_nmodes
	.ifdef banim_mode_\n
	.4byte banim_mode_\n - banim_start
	.else
	.4byte 0
	.endif
	.endif
	.endr
	.fill banim_nmodes, 4, 0
.endm
