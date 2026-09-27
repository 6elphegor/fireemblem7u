	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013450
sub_08013450: @ 0x08013450
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r0, #0
	str r6, [sp]
	cmp r6, #0x50
	ble _08013468
	movs r0, #0x50
	str r0, [sp]
_08013468:
	adds r2, r6, #0
	movs r1, #0
	mov sb, r1
	cmp r2, #0
	blt _08013560
	movs r3, #0
	str r3, [sp, #4]
	ldr r4, [sp]
	lsls r0, r4, #2
	ldr r7, _08013574 @ =0x02020140
	adds r0, r0, r7
	mov sl, r0
	str r0, [sp, #8]
	rsbs r1, r2, #0
	str r1, [sp, #0xc]
	lsls r0, r2, #2
	ldr r3, [sp, #8]
	subs r3, r3, r0
	str r3, [sp, #0x10]
	ldr r4, [sp, #8]
	adds r0, r0, r4
	str r0, [sp, #0x14]
_08013494:
	ldr r0, [sp]
	add r0, sb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	cmp r0, #0x9f
	bhi _080134A6
	mov r7, sl
	strh r2, [r7, #2]
_080134A6:
	ldr r0, [sp]
	mov r1, sb
	subs r0, r0, r1
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x9f
	bhi _080134BA
	ldr r3, [sp, #8]
	strh r2, [r3, #2]
_080134BA:
	ldr r7, [sp]
	adds r7, r7, r2
	mov ip, r7
	lsls r0, r7, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bhi _080134CE
	mov r1, sb
	ldr r0, [sp, #0x14]
	strh r1, [r0, #2]
_080134CE:
	ldr r7, [sp]
	subs r5, r7, r2
	lsls r0, r5, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x9f
	bhi _080134E0
	mov r7, sb
	ldr r0, [sp, #0x10]
	strh r7, [r0, #2]
_080134E0:
	ldr r0, [sp, #0x18]
	cmp r0, #0x9f
	bhi _080134EE
	mov r7, sp
	ldrh r0, [r7, #0xc]
	mov r7, sl
	strh r0, [r7]
_080134EE:
	cmp r4, #0x9f
	bhi _08013500
	mov r4, r8
	lsls r0, r4, #2
	ldr r7, _08013574 @ =0x02020140
	adds r0, r0, r7
	mov r4, sp
	ldrh r4, [r4, #0xc]
	strh r4, [r0]
_08013500:
	cmp r3, #0x9f
	bhi _08013512
	mov r7, ip
	lsls r0, r7, #2
	ldr r3, _08013574 @ =0x02020140
	adds r0, r0, r3
	mov r4, sp
	ldrh r4, [r4, #4]
	strh r4, [r0]
_08013512:
	cmp r1, #0x9f
	bhi _08013522
	lsls r0, r5, #2
	ldr r7, _08013574 @ =0x02020140
	adds r0, r0, r7
	mov r1, sp
	ldrh r1, [r1, #4]
	strh r1, [r0]
_08013522:
	adds r1, r6, #1
	mov r3, sb
	lsls r0, r3, #1
	subs r6, r1, r0
	cmp r6, #0
	bge _08013548
	subs r1, r2, #1
	lsls r0, r1, #1
	adds r6, r6, r0
	ldr r4, [sp, #0xc]
	adds r4, #1
	str r4, [sp, #0xc]
	ldr r7, [sp, #0x10]
	adds r7, #4
	str r7, [sp, #0x10]
	ldr r0, [sp, #0x14]
	subs r0, #4
	str r0, [sp, #0x14]
	adds r2, r1, #0
_08013548:
	ldr r1, [sp, #4]
	subs r1, #1
	str r1, [sp, #4]
	movs r3, #4
	add sl, r3
	ldr r4, [sp, #8]
	subs r4, #4
	str r4, [sp, #8]
	movs r7, #1
	add sb, r7
	cmp r2, sb
	bge _08013494
_08013560:
	ldr r0, _08013574 @ =0x02020140
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08013574: .4byte 0x02020140
