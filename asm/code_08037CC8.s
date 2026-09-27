	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_0D_MoveTowardsCharacterUntilInRange
AiScriptCmd_0D_MoveTowardsCharacterUntilInRange: @ 0x08037CC8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _08037D38 @ =0x030013B8
	ldr r0, [r6]
	ldr r0, [r0, #4]
	add r5, sp, #4
	adds r1, r5, #0
	bl AiFindTargetInReachByCharId
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08037D6C
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r5, _08037D3C @ =0x0203A97C
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #3]
	str r4, [sp]
	bl AiIsWithinRectDistance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037D72
	ldr r0, [r6]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r4, [r1, #0xc]
	movs r0, #0x20
	ands r4, r0
	cmp r4, #0
	beq _08037D44
	ldr r0, _08037D40 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #3
	strb r1, [r0]
	b _08037D72
	.align 2, 0
_08037D38: .4byte 0x030013B8
_08037D3C: .4byte 0x0203A97C
_08037D40: .4byte 0x0203A8EC
_08037D44:
	ldrb r0, [r1, #0xb]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AiUpdateDecision
	ldr r0, _08037D64 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #2
	strb r1, [r0]
	strb r4, [r5, #0xa]
	ldr r0, _08037D68 @ =0x030013B0
	strb r4, [r0]
	b _08037D72
	.align 2, 0
_08037D64: .4byte 0x0203A8EC
_08037D68: .4byte 0x030013B0
_08037D6C:
	ldr r1, _08037D80 @ =0x030013B0
	movs r0, #0
	strb r0, [r1]
_08037D72:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037D80: .4byte 0x030013B0
