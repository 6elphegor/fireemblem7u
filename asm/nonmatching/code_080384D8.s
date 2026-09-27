	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_1B_NoOp
AiScriptCmd_1B_NoOp: @ 0x080384D8
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _080384E8 @ =0x030013B0
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080384E8: .4byte 0x030013B0
