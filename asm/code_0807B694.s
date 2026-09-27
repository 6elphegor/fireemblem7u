	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B694
sub_0807B694: @ 0x0807B694
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0807B6B2
	adds r0, r5, #0
	bl sub_0807B60C
	movs r0, #0xc8
	movs r1, #0x40
	bl sub_0807B2F8
_0807B6B2:
	ldrh r2, [r4]
	adds r0, r2, #1
	strh r0, [r4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x13
	ldr r0, _0807B6F8 @ =0x03002870
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
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	cmp r2, #0x10
	bne _0807B6F2
	adds r0, r5, #0
	bl Proc_Break
_0807B6F2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B6F8: .4byte 0x03002870
