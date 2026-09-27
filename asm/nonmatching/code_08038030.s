	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_17_DoEscape
AiScriptCmd_17_DoEscape: @ 0x08038030
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08038050 @ =0x03004690
	ldr r1, [r0]
	movs r0, #8
	ldrb r2, [r1, #0xa]
	orrs r0, r2
	strb r0, [r1, #0xa]
	bl AiTryMoveTowardsEscape
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038050: .4byte 0x03004690
