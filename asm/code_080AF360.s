	.include "macro.inc"

	.syntax unified

	thumb_func_start OpAnimBldAlphaInit
OpAnimBldAlphaInit: @ 0x080AF360
	movs r1, #0
	strh r1, [r0, #0x2a]
	bx lr
	.align 2, 0
