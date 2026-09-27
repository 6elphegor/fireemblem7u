	.include "macro.inc"

	.syntax unified

	thumb_func_start AiTryActionAfterMove
AiTryActionAfterMove: @ 0x08039DA0
	push {r4, lr}
	ldr r4, _08039DD4 @ =0x0203A97C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiTryDoDanceAdjacent
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08039DCC
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiTryDoStealAdjacent
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08039DCC
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_08039F60
_08039DCC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039DD4: .4byte 0x0203A97C
