	.include "macro.inc"

	.syntax unified

	thumb_func_start SioMenuItem_SetPosition
SioMenuItem_SetPosition: @ 0x080481DC
	strh r1, [r0, #0x2a]
	strh r2, [r0, #0x2c]
	bx lr
	.align 2, 0
