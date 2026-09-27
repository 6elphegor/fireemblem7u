	.include "macro.inc"

	.syntax unified

	thumb_func_start AiBallistaRideExit
AiBallistaRideExit: @ 0x0803A8C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _0803A920 @ =0x0000FFFF
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	movs r1, #0
	mov r8, r1
	movs r2, #0xff
	mov sl, r2
	ldr r4, _0803A924 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803A928
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetRiddenBallistaAt
	cmp r0, #0
	beq _0803A900
	b _0803AA28
_0803A900:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r2, r8
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0xa
	movs r3, #0
	bl AiSetDecision
	b _0803AA28
	.align 2, 0
_0803A920: .4byte 0x0000FFFF
_0803A924: .4byte 0x03004690
_0803A928:
	adds r0, r2, #0
	bl InitAiMoveMapForUnit
	ldr r0, _0803A9FC @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803A9B0
_0803A93A:
	ldr r0, _0803A9FC @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sb, r0
	cmp r4, #0
	blt _0803A9AA
	ldr r7, _0803AA00 @ =0x0202E3E4
	lsls r6, r5, #2
_0803A94E:
	ldr r0, [r7]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803A9A4
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetRiddenBallistaAt
	cmp r0, #0
	beq _0803A9A4
	mov r1, r8
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0803AA04 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803A9A4
	ldr r0, [r7]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, sl
	bhi _0803A9A4
	ldrb r0, [r0]
	mov sl, r0
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
_0803A9A4:
	subs r4, #1
	cmp r4, #0
	bge _0803A94E
_0803A9AA:
	mov r5, sb
	cmp r5, #0
	bge _0803A93A
_0803A9B0:
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0803A9CE
	ldr r0, [sp, #0x10]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
_0803A9CE:
	ldr r1, _0803AA08 @ =0x0203A97C
	ldrb r2, [r1, #0xa]
	cmp r2, #1
	bne _0803AA0C
	ldrb r0, [r1, #2]
	cmp r0, r4
	bne _0803AA28
	ldrb r1, [r1, #3]
	ldr r2, [sp, #0x10]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _0803AA28
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AiUpdateDecision
	b _0803AA28
	.align 2, 0
_0803A9FC: .4byte 0x0202E3D8
_0803AA00: .4byte 0x0202E3E4
_0803AA04: .4byte 0x0202E3DC
_0803AA08: .4byte 0x0203A97C
_0803AA0C:
	mov r0, r8
	cmp r0, #0
	beq _0803AA20
	ldr r0, _0803AA1C @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #7
	b _0803AA26
	.align 2, 0
_0803AA1C: .4byte 0x0203A8EC
_0803AA20:
	ldr r0, _0803AA3C @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #6
_0803AA26:
	strb r1, [r0]
_0803AA28:
	movs r0, #1
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803AA3C: .4byte 0x0203A8EC
