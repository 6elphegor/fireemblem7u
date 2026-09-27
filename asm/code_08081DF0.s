	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetHelpBoxInitSize
ResetHelpBoxInitSize: @ 0x08081DF0
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0x20
	strh r1, [r2]
	adds r0, #0x42
	movs r1, #0x10
	strh r1, [r0]
	bx lr
