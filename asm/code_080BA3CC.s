	.include "macro.inc"

	.syntax unified

	thumb_func_start HBlank_TitleScreen
HBlank_TitleScreen: @ 0x080BA3CC
	ldr r0, _080BA3EC @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x9f
	bls _080BA3DC
	movs r2, #0
_080BA3DC:
	ldr r0, _080BA3F0 @ =0x04000012
	movs r1, #1
	ands r1, r2
	lsrs r2, r2, #1
	adds r1, r1, r2
	rsbs r1, r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_080BA3EC: .4byte 0x04000006
_080BA3F0: .4byte 0x04000012
