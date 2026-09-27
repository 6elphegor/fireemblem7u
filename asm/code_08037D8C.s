	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_0F_MoveTowardsUnitWithClass
AiScriptCmd_0F_MoveTowardsUnitWithClass: @ 0x08037D8C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r7, _08037DCC @ =0x030013B8
	ldr r0, [r7]
	ldr r0, [r0, #4]
	add r5, sp, #4
	adds r1, r5, #0
	bl AiFindTargetInReachByClassId
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08037DBE
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r7]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
_08037DBE:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037DCC: .4byte 0x030013B8
