	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_06_DoNothing
AiScriptCmd_06_DoNothing: @ 0x08037B70
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr
