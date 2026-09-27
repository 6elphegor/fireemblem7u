	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802FF80
sub_0802FF80: @ 0x0802FF80
	push {r4, r5, r6, r7, lr}
	ldr r7, _08030004 @ =0x08B96444
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0x29
	ldr r5, _08030008 @ =0x0202BBB8
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r3, #0x14
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0802FFAA
	adds r0, r2, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0802FFAA
	b _0803012C
_0802FFAA:
	ldrh r0, [r5, #0x14]
	ldrh r1, [r5, #0x16]
	bl SetLastCoords
	ldr r0, _0803000C @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r3, #0x16
	ldrsh r0, [r5, r3]
	ldr r1, _08030010 @ =0x030041E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _0802FFDE
	b _0803012C
_0802FFDE:
	movs r0, #0x14
	ldrsb r0, [r5, r0]
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	bl GetPointAlongPath
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq _08030014
	lsls r0, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r0, r0, r3
	asrs r0, r0, #0x18
	bl CutOffPathLength
	b _0803012C
	.align 2, 0
_08030004: .4byte 0x08B96444
_08030008: .4byte 0x0202BBB8
_0803000C: .4byte 0x0202E3E4
_08030010: .4byte 0x030041E0
_08030014:
	ldr r4, [r7]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, #0x55
	adds r4, r4, r0
	bl GetWorkingMoveCosts
	movs r1, #0x16
	ldrsh r6, [r5, r1]
	ldr r1, _08030084 @ =0x0202E3E0
	ldr r2, [r1]
	lsls r1, r6, #2
	adds r1, r1, r2
	movs r2, #0x14
	ldrsh r3, [r5, r2]
	ldr r1, [r1]
	adds r1, r1, r3
	ldrb r1, [r1]
	adds r0, r1, r0
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	blt _080300A8
	ldr r4, [r7]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r0, r3
	cmp r2, #0
	bge _0803006A
	subs r2, r3, r0
_0803006A:
	adds r0, r4, #0
	adds r0, #0x41
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r0, r1, r6
	cmp r0, #0
	blt _08030088
	adds r0, r2, r0
	cmp r0, #1
	beq _08030090
	b _080300A8
	.align 2, 0
_08030084: .4byte 0x0202E3E0
_08030088:
	subs r0, r6, r1
	adds r0, r2, r0
	cmp r0, #1
	bne _080300A8
_08030090:
	ldr r1, _080300A4 @ =0x0202BBB8
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AddPointToPathArrowProc
	b _0803012C
	.align 2, 0
_080300A4: .4byte 0x0202BBB8
_080300A8:
	ldr r0, _08030100 @ =0x08B96444
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x55
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080300CA
	movs r0, #1
	bl CutOffPathLength
_080300CA:
	ldr r0, _08030104 @ =0x0202E3F4
	ldr r0, [r0]
	bl SetWorkingBmMap
	bl GenerateMovementMapForActiveUnit
	ldr r2, _08030108 @ =0x0202BBB8
	movs r3, #0x16
	ldrsh r4, [r2, r3]
	ldr r0, _0803010C @ =0x030041E0
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	movs r1, #0x14
	ldrsh r3, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r3
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08030110
	bl ResetPathArrow
	b _0803012C
	.align 2, 0
_08030100: .4byte 0x08B96444
_08030104: .4byte 0x0202E3F4
_08030108: .4byte 0x0202BBB8
_0803010C: .4byte 0x030041E0
_08030110:
	ldr r2, _08030134 @ =0x02033E00
	adds r0, r3, #0
	adds r1, r4, #0
	bl BuildBestMoveScript
	bl GetPathFromMovementScript
	bl sub_0802FE78
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803012C
	bl ResetPathArrow
_0803012C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030134: .4byte 0x02033E00
