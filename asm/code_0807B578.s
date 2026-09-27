	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B578
sub_0807B578: @ 0x0807B578
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r3, _0807B5FC @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _0807B600 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _0807B604 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0807B608 @ =0x08B923EC
	bl Proc_Find
	bl Proc_End
	movs r0, #0x70
	movs r1, #0x20
	bl PutDragonGateFlame
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #0x10
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_080139D8
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B5FC: .4byte 0x03002870
_0807B600: .4byte 0x0000FFE0
_0807B604: .4byte 0x0000E0FF
_0807B608: .4byte 0x08B923EC
