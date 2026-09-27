	.include "macro.inc"

	.syntax unified

	thumb_func_start AiFindTargetInReachByCharId
AiFindTargetInReachByCharId: @ 0x0803589C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _08035938 @ =0x03004690
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
	bl MarkWorkingMapEdges
	ldr r0, _0803593C @ =0x0000FFFF
	strh r0, [r6]
	movs r5, #1
	ldr r0, _08035940 @ =0x0203A972
	mov r8, r0
_080358CE:
	adds r0, r5, #0
	bl GetUnit
	adds r3, r0, #0
	cmp r3, #0
	beq _08035924
	ldr r4, [r3]
	cmp r4, #0
	beq _08035924
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	ldr r0, _08035944 @ =0x0202E3E8
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08035924
	ldrb r0, [r4, #4]
	cmp r0, r7
	bne _08035924
	ldr r1, [r3, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08035968
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	beq _08035918
	movs r0, #3
	mov r1, r8
	strb r0, [r1]
_08035918:
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	strh r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	strh r0, [r6, #2]
_08035924:
	adds r5, #1
	cmp r5, #0xbf
	ble _080358CE
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	blt _08035948
	movs r0, #1
	b _0803597E
	.align 2, 0
_08035938: .4byte 0x03004690
_0803593C: .4byte 0x0000FFFF
_08035940: .4byte 0x0203A972
_08035944: .4byte 0x0202E3E8
_08035948:
	adds r0, r7, #0
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	ldr r1, _08035960 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _08035974
	ldr r0, _08035964 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #1
	b _0803597A
	.align 2, 0
_08035960: .4byte 0x0001000C
_08035964: .4byte 0x0203A8EC
_08035968:
	ldr r0, _08035970 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #1
	b _0803597A
	.align 2, 0
_08035970: .4byte 0x0203A8EC
_08035974:
	ldr r0, _08035988 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #4
_0803597A:
	strb r1, [r0]
	movs r0, #0
_0803597E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08035988: .4byte 0x0203A8EC
