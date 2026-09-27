	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809A6C0
sub_0809A6C0: @ 0x0809A6C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	adds r0, #1
	str r0, [r7, #0x2c]
	movs r5, #0xa
	subs r5, r5, r0
	lsls r0, r5, #3
	muls r0, r5, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #8
	subs r4, r4, r0
	lsls r0, r5, #4
	muls r0, r5, r0
	movs r1, #0x64
	bl __divsi3
	movs r2, #0x10
	subs r2, r2, r0
	lsls r4, r4, #3
	subs r4, #0x40
	adds r0, r7, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	muls r1, r0, r1
	mov sb, r1
	adds r0, r7, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r4, #0
	muls r3, r0, r3
	mov r8, r3
	ldr r6, _0809A814 @ =0x03002870
	movs r0, #0x3c
	adds r0, r0, r6
	mov sl, r0
	movs r0, #0x3f
	mov r1, sl
	ldrb r1, [r1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	mov r3, sl
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	movs r1, #0
	ldr r3, _0809A818 @ =0x030028B4
	strb r0, [r3]
	ldr r0, _0809A81C @ =0x030028B5
	strb r2, [r0]
	ldr r2, _0809A820 @ =0x030028B6
	strb r1, [r2]
	mov r3, sb
	lsls r5, r3, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r4, r0, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	mov r2, r8
	adds r2, #4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r5, #0
	bl SetBgOffset
	mov r1, sb
	rsbs r0, r1, #0
	adds r1, r7, #0
	adds r1, #0x52
	movs r4, #0
	strh r0, [r1]
	mov r2, r8
	rsbs r1, r2, #0
	adds r2, r7, #0
	adds r2, #0x54
	strh r1, [r2]
	bl sub_0809A504
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A7A6
	movs r1, #0xd8
	mov r3, sb
	subs r1, r1, r3
	movs r2, #0x58
	mov r0, r8
	subs r2, r2, r0
	movs r0, #0
	bl SetFacePosition
_0809A7A6:
	ldr r0, [r7, #0x2c]
	cmp r0, #0xa
	bne _0809A806
	adds r0, r7, #0
	bl Proc_Break
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r6, #0xc]
	movs r2, #3
	ldrb r0, [r6, #0x10]
	orrs r0, r2
	strb r0, [r6, #0x10]
	ldrb r3, [r6, #0x14]
	ands r1, r3
	movs r0, #2
	orrs r1, r0
	strb r1, [r6, #0x14]
	ldrb r0, [r6, #0x18]
	orrs r2, r0
	strb r2, [r6, #0x18]
	movs r0, #0x3f
	mov r1, sl
	ldrb r1, [r1]
	ands r0, r1
	mov r2, sl
	strb r0, [r2]
	ldr r3, _0809A818 @ =0x030028B4
	strb r4, [r3]
	ldr r0, _0809A81C @ =0x030028B5
	strb r4, [r0]
	ldr r1, _0809A820 @ =0x030028B6
	strb r4, [r1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r6, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
_0809A806:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A814: .4byte 0x03002870
_0809A818: .4byte 0x030028B4
_0809A81C: .4byte 0x030028B5
_0809A820: .4byte 0x030028B6
