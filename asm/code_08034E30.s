	.include "macro.inc"

	.syntax unified

	thumb_func_start AiClearDecision
AiClearDecision: @ 0x08034E30
	ldr r1, _08034E4C @ =0x0203A97C
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	strb r0, [r1, #4]
	strb r0, [r1, #5]
	strb r0, [r1, #6]
	strb r0, [r1, #7]
	strb r0, [r1, #8]
	strb r0, [r1, #9]
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_08034E4C: .4byte 0x0203A97C
