	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08037F0C
sub_08037F0C: @ 0x08037F0C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _08037F48 @ =0x030013B8
	ldr r0, [r6]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _08037F50
	ldr r0, _08037F4C @ =AiIsUnitEnemy
	add r5, sp, #4
	adds r1, r5, #0
	bl AiFindTargetInReachByFunc
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08037F78
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
	b _08037F78
	.align 2, 0
_08037F48: .4byte 0x030013B8
_08037F4C: .4byte AiIsUnitEnemy
_08037F50:
	ldr r0, _08037F88 @ =AiIsUnitEnemyAndNotInScrList
	add r5, sp, #4
	adds r1, r5, #0
	bl AiFindTargetInReachByFunc
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08037F78
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
_08037F78:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037F88: .4byte AiIsUnitEnemyAndNotInScrList
