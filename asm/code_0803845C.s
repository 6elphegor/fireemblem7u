	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_1A_MoveTowardsTerrain
AiScriptCmd_1A_MoveTowardsTerrain: @ 0x0803845C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _080384AC @ =0x03004690
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
	ldr r6, _080384B0 @ =0x030013B8
	ldr r0, [r6]
	ldr r0, [r0, #8]
	add r5, sp, #4
	movs r1, #0
	adds r2, r5, #0
	bl AiFindClosestTerrainPosition
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _080384B4
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
	b _080384C2
	.align 2, 0
_080384AC: .4byte 0x03004690
_080384B0: .4byte 0x030013B8
_080384B4:
	ldr r0, _080384D0 @ =0x0203A8EC
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _080384D4 @ =0x030013B0
	strb r2, [r0]
_080384C2:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080384D0: .4byte 0x0203A8EC
_080384D4: .4byte 0x030013B0
