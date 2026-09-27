	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B43EC
sub_080B43EC: @ 0x080B43EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, [r0, #0x40]
	mov sb, r0
	movs r0, #0xff
	mov r8, r0
	movs r1, #0x10
	mov ip, r1
	mov r6, sb
	adds r6, #0x2e
	mov r7, sb
	adds r7, #0x2c
	movs r0, #0
	str r0, [sp]
	movs r1, #3
	mov sl, r1
_080B4414:
	mov r0, sb
	adds r0, #0x30
	ldr r1, [sp]
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080B44EA
	adds r5, r0, #0
	movs r0, #0
	ldrsh r4, [r7, r0]
	adds r3, r6, #0
	ldrh r2, [r6]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r2
	cmp r0, #0
	beq _080B4486
	mov r1, r8
	ands r1, r2
	cmp r1, #0xf
	bhi _080B4486
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080B445C
	mov r0, ip
	subs r1, r0, r1
	lsls r0, r1, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B4456
	adds r0, #0xff
_080B4456:
	asrs r0, r0, #8
	adds r0, r4, r0
	strh r0, [r5, #0x34]
_080B445C:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B4480
	mov r0, r8
	ands r0, r1
	mov r1, ip
	subs r0, r1, r0
	lsls r1, r0, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B447A
	adds r0, #0xff
_080B447A:
	asrs r0, r0, #8
	subs r0, r4, r0
	strh r0, [r5, #0x34]
_080B4480:
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_080B4486:
	ldrh r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r2
	cmp r0, #0
	beq _080B44EA
	mov r1, r8
	ands r1, r2
	cmp r1, #0xf
	bhi _080B44EA
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080B44BC
	adds r2, r4, #0
	subs r2, #0x20
	mov r0, ip
	subs r1, r0, r1
	lsls r0, r1, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B44B6
	adds r0, #0xff
_080B44B6:
	asrs r0, r0, #8
	adds r0, r2, r0
	strh r0, [r5, #0x34]
_080B44BC:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B44E4
	adds r2, r4, #0
	adds r2, #0x20
	mov r0, r8
	ands r0, r1
	mov r1, ip
	subs r0, r1, r0
	lsls r1, r0, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B44DE
	adds r0, #0xff
_080B44DE:
	asrs r0, r0, #8
	subs r0, r2, r0
	strh r0, [r5, #0x34]
_080B44E4:
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_080B44EA:
	adds r6, #0xc
	adds r7, #0xc
	ldr r0, [sp]
	adds r0, #0xc
	str r0, [sp]
	movs r1, #1
	rsbs r1, r1, #0
	add sl, r1
	mov r0, sl
	cmp r0, #0
	bge _080B4414
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
