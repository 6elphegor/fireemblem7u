	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080149A8
sub_080149A8: @ 0x080149A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	ldr r0, [sp, #0x34]
	mov r8, r0
	ldr r4, [sp, #0x40]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #8]
	ldr r1, [sp, #0x3c]
	ldrb r2, [r1]
	adds r2, #1
	mov sb, r2
	adds r1, #2
	str r1, [sp, #0xc]
	mov r0, sb
	mov r1, r8
	bl Div
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl Div
	adds r1, r5, #0
	muls r1, r0, r1
	subs r4, r4, r1
	mov r1, r8
	muls r1, r4, r1
	lsls r1, r1, #1
	ldr r6, [sp, #0xc]
	adds r1, r6, r1
	ldr r7, [sp, #0x38]
	muls r0, r7, r0
	lsls r0, r0, #6
	adds r1, r1, r0
	str r1, [sp, #0xc]
	movs r5, #0
	cmp r5, r7
	bge _08014A58
	mov r0, sl
	lsls r0, r0, #1
	mov ip, r0
_08014A0A:
	movs r4, #0
	adds r1, r5, #1
	str r1, [sp, #0x10]
	cmp r4, r8
	bge _08014A50
	ldr r2, [sp, #0x38]
	subs r0, r2, r5
	subs r0, #1
	mov r6, sb
	muls r6, r0, r6
	adds r0, r6, #0
	lsls r0, r0, #1
	ldr r7, [sp, #0xc]
	adds r3, r7, r0
	ldr r2, [sp]
	add r2, ip
_08014A2A:
	mov r1, sl
	adds r0, r1, r4
	cmp r0, #0x1f
	bhi _08014A46
	ldr r6, [sp, #4]
	adds r0, r6, r5
	cmp r0, #0x1f
	bhi _08014A46
	lsls r0, r0, #6
	adds r0, r0, r2
	ldrh r7, [r3]
	ldr r6, [sp, #8]
	adds r1, r7, r6
	strh r1, [r0]
_08014A46:
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, r8
	blt _08014A2A
_08014A50:
	ldr r5, [sp, #0x10]
	ldr r7, [sp, #0x38]
	cmp r5, r7
	blt _08014A0A
_08014A58:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
