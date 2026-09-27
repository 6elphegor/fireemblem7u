	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_14_DoNothing
AiScriptCmd_14_DoNothing: @ 0x0803800C
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr
