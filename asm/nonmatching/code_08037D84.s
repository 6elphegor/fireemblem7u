	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_0E_DoNothing
AiScriptCmd_0E_DoNothing: @ 0x08037D84
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr
