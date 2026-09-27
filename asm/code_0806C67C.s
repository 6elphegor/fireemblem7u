	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806C67C
sub_0806C67C: @ 0x0806C67C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #7
	ble _0806C6A0
	ldr r0, [r7]
	bl Proc_Break
_0806C6A0:
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r3, [r7]
	adds r0, r3, #0
	adds r4, r3, #0
	adds r4, #0x64
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #5
	bl Interpolate
	str r0, [r7, #4]
	ldr r1, _0806C75C @ =0x080C5A48
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	ldr r0, _0806C75C @ =0x080C5A48
	movs r2, #0
	ldrsh r1, [r0, r2]
	rsbs r0, r1, #0
	lsls r1, r0, #4
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	ldr r0, _0806C75C @ =0x080C5A48
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #4
	ldr r1, [r7, #4]
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
	ldr r1, _0806C75C @ =0x080C5A48
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl SetObjAffine
	ldr r1, [r7]
	ldr r0, [r1, #0x50]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	adds r1, r2, #0
	subs r1, #8
	ldr r2, [r7]
	ldr r3, [r2, #0x30]
	adds r2, r3, #0
	subs r2, #8
	movs r3, #0xc0
	lsls r3, r3, #2
	orrs r2, r3
	bl DisplaySpriteAnim
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C75C: .4byte 0x080C5A48
