	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803A0C0
sub_0803A0C0: @ 0x0803A0C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r4, _0803A158 @ =0x03004690
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r2, [r0, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	mov r2, r8
	ldrb r2, [r2]
	muls r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x14
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r3, r8
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _0803A164
	cmp r2, #0
	beq _0803A164
	ldr r0, [r4]
	adds r1, r5, #0
	bl AiFloodMovementAndRange
	ldr r0, _0803A15C @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803A1DA
_0803A10E:
	ldr r0, _0803A15C @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0803A14E
_0803A11C:
	ldr r0, _0803A160 @ =0x0202E3E8
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803A148
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803A090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803A148
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0803A148:
	subs r4, #1
	cmp r4, #0
	bge _0803A11C
_0803A14E:
	adds r5, r6, #0
	cmp r5, #0
	bge _0803A10E
	b _0803A1DA
	.align 2, 0
_0803A158: .4byte 0x03004690
_0803A15C: .4byte 0x0202E3D8
_0803A160: .4byte 0x0202E3E8
_0803A164:
	ldr r4, _0803A1F4 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _0803A1F8 @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r5, #0
	movs r3, #0
	bl BeginMapFlood
	ldr r0, _0803A1FC @ =0x0202E3D8
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803A1DA
_0803A198:
	ldr r0, _0803A1FC @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0803A1D4
_0803A1A6:
	ldr r0, _0803A1F8 @ =0x0202E3E8
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803A1CE
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803A090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803A1CE
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0803A1CE:
	subs r4, #1
	cmp r4, #0
	bge _0803A1A6
_0803A1D4:
	adds r5, r6, #0
	cmp r5, #0
	bge _0803A198
_0803A1DA:
	ldr r0, _0803A200 @ =0x0203A8EC
	adds r0, #0x86
	mov r2, r8
	ldrb r2, [r2, #2]
	adds r0, r2, r0
	strb r7, [r0]
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A1F4: .4byte 0x03004690
_0803A1F8: .4byte 0x0202E3E8
_0803A1FC: .4byte 0x0202E3D8
_0803A200: .4byte 0x0203A8EC
