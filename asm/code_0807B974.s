	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B974
sub_0807B974: @ 0x0807B974
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	adds r2, #1
	movs r4, #0
	strh r2, [r0]
	lsls r2, r2, #0x10
	asrs r6, r2, #0x13
	ldr r0, _0807B9EC @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r6
	mov r1, ip
	adds r1, #0x44
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r4, [r0]
	asrs r2, r2, #0x10
	cmp r2, #0x50
	bne _0807B9D8
	movs r0, #0x80
	lsls r0, r0, #1
	movs r3, #0x80
	lsls r3, r3, #2
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #2
	rsbs r1, r1, #0
	str r1, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r1, #0x80
	movs r2, #0x80
	bl sub_080139D8
_0807B9D8:
	cmp r6, #0x10
	bne _0807B9E2
	adds r0, r5, #0
	bl Proc_Break
_0807B9E2:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B9EC: .4byte 0x03002870
