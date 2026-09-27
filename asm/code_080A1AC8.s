	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A1AC8
sub_080A1AC8: @ 0x080A1AC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x60
	movs r0, #5
	bl GetSaveWriteAddr
	mov r8, r0
	add r0, sp, #0x50
	movs r4, #0
	strh r4, [r0]
	add r5, sp, #0x10
	ldr r2, _080A1BFC @ =0x01000012
	adds r1, r5, #0
	bl CpuSet
	mov r0, sp
	adds r0, #0x52
	strh r4, [r0]
	add r4, sp, #0x34
	ldr r2, _080A1C00 @ =0x01000005
	adds r1, r4, #0
	bl CpuSet
	movs r7, #0
	mov sb, r5
	add r0, sp, #0x54
	mov sl, r0
	mov r1, sp
	adds r1, #0x40
	str r1, [sp, #0x58]
	mov r3, sp
	adds r3, #0x44
	str r3, [sp, #0x5c]
	mov r6, r8
_080A1B12:
	movs r0, #0xc8
	muls r0, r7, r0
	adds r0, #0x14
	mov r1, r8
	adds r4, r1, r0
	movs r5, #4
_080A1B1E:
	mov r0, sb
	adds r1, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A1B1E
	add r0, sp, #0x34
	adds r1, r6, #0
	movs r2, #0xa
	bl WriteAndVerifySramFast
	adds r6, #0xc8
	adds r7, #1
	cmp r7, #9
	ble _080A1B12
	movs r0, #7
	mov r3, sl
	strh r0, [r3]
	movs r1, #0xfa
	lsls r1, r1, #3
	add r1, r8
	mov r0, sl
	movs r2, #2
	bl WriteAndVerifySramFast
	ldr r6, [sp, #0x58]
	mov sl, r6
	ldr r0, _080A1C04 @ =0x0840F438
	movs r1, #3
	mov sb, r1
	ldr r5, _080A1C08 @ =0x000007D4
	add r5, r8
	adds r3, r0, #4
	mov r8, r3
	adds r4, r0, #0
	movs r7, #9
_080A1B6C:
	ldrb r3, [r4]
	lsls r0, r3, #0x1e
	lsrs r0, r0, #0x1e
	mov r6, sb
	ands r0, r6
	movs r1, #4
	rsbs r1, r1, #0
	adds r2, r1, #0
	mov r6, sl
	ldrb r6, [r6]
	ands r2, r6
	orrs r2, r0
	lsls r0, r3, #0x1c
	lsrs r0, r0, #0x1e
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #2
	movs r6, #0xd
	rsbs r6, r6, #0
	adds r1, r6, #0
	ands r2, r1
	orrs r2, r0
	movs r1, #0x10
	ands r1, r3
	movs r3, #0x11
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r2, r0
	orrs r2, r1
	mov r6, sl
	strb r2, [r6]
	ldr r2, [r4]
	lsrs r2, r2, #5
	lsls r2, r2, #5
	ldr r0, [sp, #0x40]
	movs r1, #0x1f
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #0x40]
	mov r0, r8
	ldr r1, [sp, #0x5c]
	bl SioStrCpy
	mov r0, sl
	adds r1, r5, #0
	movs r2, #0x10
	bl WriteAndVerifySramFast
	adds r5, #0x10
	movs r0, #0x10
	add r8, r0
	adds r4, #0x10
	subs r7, #1
	cmp r7, #0
	bge _080A1B6C
	ldr r0, _080A1C0C @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x60
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1BFC: .4byte 0x01000012
_080A1C00: .4byte 0x01000005
_080A1C04: .4byte 0x0840F438
_080A1C08: .4byte 0x000007D4
_080A1C0C: .4byte 0x00020112
