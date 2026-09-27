	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08072A18
sub_08072A18: @ 0x08072A18
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r3, [r1]
	movs r0, #0x50
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0xa0
	bl Interpolate
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	adds r0, #8
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	adds r1, r2, #0
	adds r1, #8
	ldr r2, [r7, #4]
	bl sub_080769CC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
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
	adds r1, #0x40
	ldrh r0, [r1]
	adds r1, r0, #0
	lsls r2, r1, #4
	adds r0, r2, #0
	movs r1, #0x28
	bl __divsi3
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _08072A94
	movs r0, #0x10
	str r0, [r7, #8]
_08072A94:
	ldr r0, _08072B0C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _08072B0C @ =0x03002870
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, _08072B0C @ =0x03002870
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
	ldr r0, _08072B0C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrh r0, [r1]
	cmp r0, #0x27
	bls _08072B02
	ldr r0, [r7]
	bl Proc_Break
	bl EndEachSpriteAnimProc
_08072B02:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072B0C: .4byte 0x03002870
