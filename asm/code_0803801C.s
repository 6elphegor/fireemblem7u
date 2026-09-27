	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_16_RandomMovement
AiScriptCmd_16_RandomMovement: @ 0x0803801C
	push {r4, lr}
	adds r4, r0, #0
	bl AiRandomMove
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
