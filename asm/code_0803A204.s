	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803A204
sub_0803A204: @ 0x0803A204
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, _0803A2A0 @ =0x03004690
	ldr r0, [r5]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r2, [r0, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	ldrb r2, [r4, #4]
	muls r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x14
	str r1, [sp, #4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r2, [r5]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0xfe
	lsls r0, r0, #5
	ldrh r1, [r1]
	ands r0, r1
	lsrs r0, r0, #8
	ldr r1, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	mov r8, r1
	ldrb r0, [r0, #1]
	mov sb, r0
	movs r6, #0x10
	ldrsb r6, [r2, r6]
	movs r7, #0x11
	ldrsb r7, [r2, r7]
	strb r1, [r2, #0x10]
	ldr r0, [r5]
	mov r2, sb
	strb r2, [r0, #0x11]
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _0803A2A8
	mov r0, sl
	cmp r0, #0
	beq _0803A2A8
	ldr r0, [r5]
	ldr r1, [sp, #4]
	mov r2, sl
	bl AiFloodMovementAndRange
	ldr r0, _0803A2A4 @ =0x0202E3E8
	ldr r1, [r0]
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803A2E2
_0803A294:
	ldr r0, [r5]
	strb r6, [r0, #0x10]
	ldr r0, [r5]
	strb r7, [r0, #0x11]
	b _0803A3A8
	.align 2, 0
_0803A2A0: .4byte 0x03004690
_0803A2A4: .4byte 0x0202E3E8
_0803A2A8:
	ldr r5, _0803A358 @ =0x03004690
	ldr r0, [r5]
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r4, _0803A35C @ =0x0202E3E8
	ldr r0, [r4]
	bl SetWorkingBmMap
	ldr r1, [r5]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [sp, #4]
	movs r3, #0
	bl BeginMapFlood
	ldr r1, [r4]
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803A294
_0803A2E2:
	ldr r4, _0803A358 @ =0x03004690
	ldr r0, [r4]
	strb r6, [r0, #0x10]
	ldr r0, [r4]
	strb r7, [r0, #0x11]
	ldr r0, [r4]
	bl RevertMapChange
	ldr r0, [r4]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803A306
	movs r0, #1
	rsbs r0, r0, #0
	bl GenerateMagicSealMap
_0803A306:
	ldr r1, _0803A360 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803A39A
_0803A312:
	ldr r1, _0803A360 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r0, r5, #1
	mov ip, r0
	cmp r3, #0
	blt _0803A394
	ldr r7, _0803A364 @ =0x0202E3E4
	ldr r6, _0803A35C @ =0x0202E3E8
	movs r2, #1
	rsbs r2, r2, #0
	adds r1, r2, #0
_0803A32C:
	mov r0, sl
	cmp r0, #0
	beq _0803A368
	ldr r0, [r7]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r4, r0, r3
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x77
	bgt _0803A38C
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803A38E
	b _0803A38C
	.align 2, 0
_0803A358: .4byte 0x03004690
_0803A35C: .4byte 0x0202E3E8
_0803A360: .4byte 0x0202E3D8
_0803A364: .4byte 0x0202E3E4
_0803A368:
	ldr r0, [r7]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r4, r0, r3
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x77
	bgt _0803A38C
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	ble _0803A38E
_0803A38C:
	strb r1, [r4]
_0803A38E:
	subs r3, #1
	cmp r3, #0
	bge _0803A32C
_0803A394:
	mov r5, ip
	cmp r5, #0
	bge _0803A312
_0803A39A:
	ldr r0, _0803A3CC @ =AiIsUnitEnemy
	bl sub_080387B0
	ldr r0, _0803A3D0 @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	cmp r0, #1
	beq _0803A3B8
_0803A3A8:
	mov r0, r8
	mov r1, sb
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
_0803A3B8:
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A3CC: .4byte AiIsUnitEnemy
_0803A3D0: .4byte 0x0203A97C
