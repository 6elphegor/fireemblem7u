	.include "macro.inc"

	.syntax unified

	thumb_func_start Text_SetColor
Text_SetColor: @ 0x08005580
	strb r1, [r0, #3]
	bx lr
