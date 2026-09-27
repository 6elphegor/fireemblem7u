	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803E358
sub_0803E358: @ 0x0803E358
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	ldr r2, _0803E3CC @ =0x08B98C9C
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r7, [r1]
	cmp r0, #1
	bne _0803E3DC
	ldr r1, _0803E3D0 @ =0x0203D90C
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge _0803E3C2
	mov sb, r1
	movs r0, #5
	mov r8, r0
	mov r5, sb
	adds r5, #0x64
	movs r7, #0
_0803E38C:
	ldr r4, _0803E3D4 @ =0x0203DC4C
	adds r4, r7, r4
	ldr r0, _0803E3D8 @ =0x081D5230
	adds r1, r4, #0
	bl SioStrCpy
	adds r0, r5, #0
	bl ClearText
	movs r0, #0xa
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #1
	mov r2, r8
	adds r3, r4, #0
	bl PutDrawTextCentered
	movs r1, #3
	add r8, r1
	adds r5, #8
	adds r7, #0x13
	adds r6, #1
	mov r1, sb
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	blt _0803E38C
_0803E3C2:
	ldr r0, _0803E3D0 @ =0x0203D90C
	ldrb r0, [r0, #5]
	adds r0, #2
	b _0803E444
	.align 2, 0
_0803E3CC: .4byte 0x08B98C9C
_0803E3D0: .4byte 0x0203D90C
_0803E3D4: .4byte 0x0203DC4C
_0803E3D8: .4byte 0x081D5230
_0803E3DC:
	lsls r0, r6, #4
	adds r1, r0, r7
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _0803E3EA
	adds r0, r6, #0
	b _0803E444
_0803E3EA:
	mov r0, r8
	adds r0, #0x4d
	adds r4, r0, r6
	movs r0, #1
	strb r0, [r4]
	movs r5, #0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0803E40A
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E40A
	strb r5, [r4]
	movs r5, #1
_0803E40A:
	lsls r4, r6, #3
	ldr r0, _0803E440 @ =0x0203D970
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	lsls r0, r6, #4
	adds r0, r0, r7
	ldr r0, [r0, #8]
	bl DecodeMsg
	adds r3, r0, #0
	lsls r2, r6, #1
	adds r2, #5
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0
	bl PutDrawTextCentered
	adds r6, #1
	b _0803E3DC
	.align 2, 0
_0803E440: .4byte 0x0203D970
_0803E444:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
