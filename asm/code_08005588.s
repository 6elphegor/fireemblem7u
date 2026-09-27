	.include "macro.inc"

	.syntax unified

	thumb_func_start Text_SetParams
Text_SetParams: @ 0x08005588
	strb r1, [r0, #2]
	strb r2, [r0, #3]
	bx lr
	.align 2, 0
