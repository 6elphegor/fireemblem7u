	.include "macro.inc"

	.syntax unified

	thumb_func_start Text_GetCursor
Text_GetCursor: @ 0x08005570
	ldrb r0, [r0, #2]
	bx lr
