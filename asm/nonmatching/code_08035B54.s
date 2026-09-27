	.include "macro.inc"

	.syntax unified

	thumb_func_start AiFindTargetInReachNeglectWallByFunc
AiFindTargetInReachNeglectWallByFunc: @ 0x08035B54
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
	ldr r0, _08035B94 @ =0x03004690
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRangeNeglectWall
	ldr r2, _08035B98 @ =0x0000FFFF
	str r2, [sp, #0xc]
	ldr r0, _08035B9C @ =0x0202E3D8
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08035C2A
	.align 2, 0
_08035B94: .4byte 0x03004690
_08035B98: .4byte 0x0000FFFF
_08035B9C: .4byte 0x0202E3D8
_08035BA0:
	ldr r0, _08035C3C @ =0x0202E3D8
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	lsls r1, r1, #0x10
	mov r8, r1
	cmp r4, #0
	blt _08035C26
	mov sl, r8
	ldr r0, _08035C40 @ =0x0202E3E8
	mov sb, r0
	asrs r7, r1, #0xe
_08035BBC:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	asrs r5, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08035C18
	ldr r0, _08035C44 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r2, r0, r5
	ldrb r1, [r2]
	cmp r1, #0
	beq _08035C18
	ldr r0, _08035C48 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	beq _08035C18
	adds r0, r1, #0
	bl GetUnit
	ldr r2, [sp]
	bl _call_via_r2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08035C18
	mov r1, sb
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r2, [r0]
	ldr r1, [sp, #8]
	cmp r2, r1
	bhi _08035C18
	ldrb r0, [r0]
	str r0, [sp, #8]
	lsrs r4, r4, #0x10
	str r4, [sp, #0xc]
	mov r2, sl
	lsrs r2, r2, #0x10
	str r2, [sp, #0x10]
_08035C18:
	lsls r0, r6, #0x10
	ldr r1, _08035C4C @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	cmp r4, #0
	bge _08035BBC
_08035C26:
	ldr r0, _08035C4C @ =0xFFFF0000
	add r0, r8
_08035C2A:
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08035BA0
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _08035C50
	movs r0, #0
	b _08035C60
	.align 2, 0
_08035C3C: .4byte 0x0202E3D8
_08035C40: .4byte 0x0202E3E8
_08035C44: .4byte 0x0202E3DC
_08035C48: .4byte 0x0202BD48
_08035C4C: .4byte 0xFFFF0000
_08035C50:
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp, #4]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
_08035C60:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
