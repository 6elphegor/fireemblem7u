	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806D6D8
sub_0806D6D8: @ 0x0806D6D8
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806D768 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806D768 @ =0x03002870
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	subs r3, r2, #1
	adds r4, r3, #0
	strh r4, [r1]
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	asrs r2, r1, #1
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x44
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806D768 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806D768 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0806D760
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl EndMu
	ldr r0, [r7]
	bl Proc_Break
_0806D760:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D768: .4byte 0x03002870
