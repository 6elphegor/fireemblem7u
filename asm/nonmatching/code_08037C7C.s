	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_0C_MoveTowardsSetPoint
AiScriptCmd_0C_MoveTowardsSetPoint: @ 0x08037C7C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _08037CC0 @ =0x030013B8
	ldr r2, [r4]
	ldrb r0, [r2, #1]
	ldrb r1, [r2, #3]
	ldrb r3, [r2, #2]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r0, _08037CC4 @ =0x0203A97C
	ldrb r1, [r0, #0xa]
	cmp r1, #1
	bne _08037CB6
	ldr r2, [r4]
	ldrb r3, [r0, #2]
	ldrb r1, [r2, #1]
	cmp r3, r1
	bne _08037CB6
	ldrb r0, [r0, #3]
	ldrb r2, [r2, #3]
	cmp r0, r2
	bne _08037CB6
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_08037CB6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037CC0: .4byte 0x030013B8
_08037CC4: .4byte 0x0203A97C
