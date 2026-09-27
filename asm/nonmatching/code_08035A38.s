	.include "macro.inc"

	.syntax unified

	thumb_func_start AiFindTargetInReachByFunc
AiFindTargetInReachByFunc: @ 0x08035A38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #0xff
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0x10]
	ldr r0, _08035A78 @ =0x03004690
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
	ldr r2, _08035A7C @ =0x0000FFFF
	str r2, [sp, #0xc]
	ldr r0, _08035A80 @ =0x0202E3D8
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08035B0E
	.align 2, 0
_08035A78: .4byte 0x03004690
_08035A7C: .4byte 0x0000FFFF
_08035A80: .4byte 0x0202E3D8
_08035A84:
	ldr r0, _08035B20 @ =0x0202E3D8
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	lsls r1, r1, #0x10
	mov r8, r1
	cmp r4, #0
	blt _08035B0A
	mov sl, r8
	ldr r0, _08035B24 @ =0x0202E3E8
	mov sb, r0
	asrs r7, r1, #0xe
_08035AA0:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	asrs r5, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08035AFC
	ldr r0, _08035B28 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r2, r0, r5
	ldrb r1, [r2]
	cmp r1, #0
	beq _08035AFC
	ldr r0, _08035B2C @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	beq _08035AFC
	adds r0, r1, #0
	bl GetUnit
	ldr r2, [sp]
	bl _call_via_r2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08035AFC
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r2, [r0]
	ldr r1, [sp, #8]
	cmp r2, r1
	bhi _08035AFC
	ldrb r0, [r0]
	str r0, [sp, #8]
	lsrs r4, r4, #0x10
	str r4, [sp, #0xc]
	mov r2, sl
	lsrs r2, r2, #0x10
	str r2, [sp, #0x10]
_08035AFC:
	lsls r0, r6, #0x10
	ldr r1, _08035B30 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	cmp r4, #0
	bge _08035AA0
_08035B0A:
	ldr r0, _08035B30 @ =0xFFFF0000
	add r0, r8
_08035B0E:
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08035A84
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _08035B34
	movs r0, #0
	b _08035B44
	.align 2, 0
_08035B20: .4byte 0x0202E3D8
_08035B24: .4byte 0x0202E3E8
_08035B28: .4byte 0x0202E3DC
_08035B2C: .4byte 0x0202BD48
_08035B30: .4byte 0xFFFF0000
_08035B34:
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp, #4]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
_08035B44:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
