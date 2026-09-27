	.include "macro.inc"

	.syntax unified

	thumb_func_start GetChapterStats
GetChapterStats: @ 0x0809FB24
	lsls r0, r0, #2
	ldr r1, _0809FB2C @ =0x0203EC00
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0809FB2C: .4byte 0x0203EC00
