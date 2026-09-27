	.include "macro.inc"

	.syntax unified

	thumb_func_start Text_GetColor
Text_GetColor: @ 0x08005584
	ldrb r0, [r0, #3]
	bx lr
