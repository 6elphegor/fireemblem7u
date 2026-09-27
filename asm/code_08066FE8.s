	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxPalFlashingInOut
EfxPalFlashingInOut: @ 0x08066FE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	adds r6, r1, #0
	mov r8, r2
	adds r0, r3, #0
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	lsls r0, r0, #5
	movs r1, #0x10
	bl Div
	mov sl, r0
	lsls r4, r4, #5
	adds r0, r4, #0
	movs r1, #0x10
	bl Div
	mov sb, r0
	lsls r5, r5, #5
	adds r0, r5, #0
	movs r1, #0x10
	bl Div
	mov ip, r0
	mov r1, r8
	adds r0, r6, r1
	cmp r6, r0
	bge _0806708E
	str r0, [sp, #4]
	movs r0, #0x1f
	mov r8, r0
	movs r7, #0x1f
_08067032:
	lsls r0, r6, #5
	adds r6, #1
	str r6, [sp, #8]
	ldr r1, [sp]
	adds r4, r1, r0
	movs r5, #0xf
_0806703E:
	ldrh r1, [r4]
	adds r2, r7, #0
	ands r2, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x15
	mov r6, r8
	ands r3, r6
	lsrs r1, r1, #0x1a
	ands r1, r6
	subs r0, r7, r2
	mov r6, sl
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #5
	adds r2, r2, r0
	subs r0, r7, r3
	mov r6, sb
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #5
	adds r3, r3, r0
	subs r0, r7, r1
	mov r6, ip
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #5
	adds r1, r1, r0
	lsls r3, r3, #5
	orrs r2, r3
	lsls r1, r1, #0xa
	orrs r2, r1
	strh r2, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _0806703E
	ldr r6, [sp, #8]
	ldr r0, [sp, #4]
	cmp r6, r0
	blt _08067032
_0806708E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
