	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_15_DoNothing
AiScriptCmd_15_DoNothing: @ 0x08038014
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr
