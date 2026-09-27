	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806FE34
sub_0806FE34: @ 0x0806FE34
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806FF14 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FF14 @ =0x03002870
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x2f
	ldrb r1, [r2]
	adds r2, r1, #2
	adds r3, r2, #0
	lsls r1, r3, #3
	ldr r2, [r7]
	ldrh r3, [r2, #0x2a]
	adds r2, r3, #0
	adds r3, r1, #0
	subs r1, r3, r2
	adds r2, r0, #0
	adds r0, #0x31
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806FF14 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806FF14 @ =0x03002870
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x2f
	ldrb r1, [r2]
	adds r2, r1, #2
	adds r3, r2, #0
	lsls r1, r3, #3
	ldr r2, [r7]
	ldrh r3, [r2, #0x2a]
	adds r2, r3, #0
	adds r3, r1, #0
	adds r1, r2, r3
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x2a]
	adds r1, r2, #2
	ldrh r2, [r0, #0x2a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x2a]
	ldr r0, [r7]
	movs r2, #0x2a
	ldrsh r1, [r0, r2]
	cmp r1, #0x10
	ble _0806FF0C
	ldr r0, _0806FF14 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _0806FF14 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _0806FF14 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, [r7]
	bl Proc_Break
_0806FF0C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FF14: .4byte 0x03002870
