	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4BD8
sub_080A4BD8: @ 0x080A4BD8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r4, [r0]
	adds r4, #1
	strb r4, [r0]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	cmp r0, #0
	bge _080A4BF6
	adds r0, #0xff
_080A4BF6:
	asrs r0, r0, #8
	movs r2, #0x50
	subs r2, r2, r0
	ldr r3, _080A4C30 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x50
	subs r0, r0, r2
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r2, #0x50
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _080A4C2A
	adds r0, r5, #0
	bl Proc_Break
_080A4C2A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4C30: .4byte 0x03002870
