	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010B24
sub_08010B24: @ 0x08010B24
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r7, _08010BD8 @ =0x03002870
	movs r6, #1
	ldrb r0, [r7, #1]
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r7, #1]
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _08010BDC @ =0x0000FFE0
	ldrh r3, [r7, #0x3c]
	ands r0, r3
	movs r1, #4
	orrs r0, r1
	ldr r1, _08010BE0 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r7, #0
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r7, #0xc]
	ands r0, r3
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	orrs r0, r6
	strb r0, [r7, #0x10]
	ldrb r3, [r7, #0x14]
	ands r1, r3
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #6
	str r0, [r5, #0x44]
	str r4, [r5, #0x30]
	ldr r0, _08010BE4 @ =0x08B90D88
	bl Proc_Find
	str r0, [r5, #0x40]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010BD8: .4byte 0x03002870
_08010BDC: .4byte 0x0000FFE0
_08010BE0: .4byte 0x0000E0FF
_08010BE4: .4byte 0x08B90D88
