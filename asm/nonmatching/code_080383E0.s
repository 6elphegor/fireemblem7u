	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_19_MoveTowardsTerrain
AiScriptCmd_19_MoveTowardsTerrain: @ 0x080383E0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _08038430 @ =0x03004690
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodRange_Unitless
	ldr r6, _08038434 @ =0x030013B8
	ldr r0, [r6]
	adds r0, #3
	add r5, sp, #4
	movs r1, #0
	adds r2, r5, #0
	bl AiFindClosestTerrainPosition
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _08038438
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
	b _08038446
	.align 2, 0
_08038430: .4byte 0x03004690
_08038434: .4byte 0x030013B8
_08038438:
	ldr r0, _08038454 @ =0x0203A8EC
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _08038458 @ =0x030013B0
	strb r2, [r0]
_08038446:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038454: .4byte 0x0203A8EC
_08038458: .4byte 0x030013B0
