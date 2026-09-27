	.include "macro.inc"

	.syntax unified

	thumb_func_start AiTryDanceOrStealAfterMove
AiTryDanceOrStealAfterMove: @ 0x08039D74
	push {r4, lr}
	ldr r4, _08039D9C @ =0x0203A97C
	ldrb r0, [r4]
	cmp r0, #2
	beq _08039D96
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiTryDoDanceAdjacent
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08039D96
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiTryDoStealAdjacent
_08039D96:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039D9C: .4byte 0x0203A97C
