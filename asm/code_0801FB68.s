	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_0801FFD0
ChapterIntro_0801FFD0: @ 0x0801FB68
	ldr r1, _0801FB74 @ =0x0202BBB8
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r1, #0xe]
	bx lr
	.align 2, 0
_0801FB74: .4byte 0x0202BBB8
