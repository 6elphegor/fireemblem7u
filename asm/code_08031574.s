	.include "macro.inc"

	.syntax unified

	thumb_func_start GetChapterInfo
GetChapterInfo: @ 0x08031574
	movs r1, #0x98
	muls r0, r1, r0
	ldr r1, _08031580 @ =0x08C9A200
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08031580: .4byte 0x08C9A200
