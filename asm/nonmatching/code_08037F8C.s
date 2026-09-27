	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_13
AiScriptCmd_13: @ 0x08037F8C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _08037FC8 @ =0x030013B8
	ldr r0, [r6]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _08037FD0
	ldr r0, _08037FCC @ =AiIsUnitEnemy
	add r5, sp, #4
	adds r1, r5, #0
	bl AiFindTargetInReachNeglectWallByFunc
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08037FF8
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowardsNeglectWall
	b _08037FF8
	.align 2, 0
_08037FC8: .4byte 0x030013B8
_08037FCC: .4byte AiIsUnitEnemy
_08037FD0:
	ldr r0, _08038008 @ =AiIsUnitEnemyAndNotInScrList
	add r5, sp, #4
	adds r1, r5, #0
	bl AiFindTargetInReachNeglectWallByFunc
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08037FF8
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowardsNeglectWall
_08037FF8:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038008: .4byte AiIsUnitEnemyAndNotInScrList
