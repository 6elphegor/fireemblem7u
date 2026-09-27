	.include "macro.inc"

	.syntax unified

	thumb_func_start Text_SetCursor
Text_SetCursor: @ 0x08005574
	strb r1, [r0, #2]
	bx lr
