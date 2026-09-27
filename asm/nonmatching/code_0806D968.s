	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806D968
sub_0806D968: @ 0x0806D968
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x14]
	adds r0, r1, #0
	adds r1, #0x3c
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_0806D524
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl sub_0806D890
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0806DA10 @ =0x020040F0
	ldr r1, _0806DA14 @ =0x06017000
	movs r2, #0x80
	lsls r2, r2, #5
	bl RegisterDataMove
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0806DA08
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl EndMu
	ldr r0, [r7]
	bl Proc_Break
_0806DA08:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DA10: .4byte 0x020040F0
_0806DA14: .4byte 0x06017000
