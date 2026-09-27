	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801138C
sub_0801138C: @ 0x0801138C
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r5, _08011420 @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r1, r2, #0
	ldrb r3, [r5, #0xc]
	ands r1, r3
	strb r1, [r5, #0xc]
	adds r1, r2, #0
	ldrb r3, [r5, #0x10]
	ands r1, r3
	movs r3, #1
	orrs r1, r3
	strb r1, [r5, #0x10]
	ldrb r1, [r5, #0x14]
	ands r2, r1
	strb r2, [r5, #0x14]
	movs r1, #3
	ldrb r2, [r5, #0x18]
	orrs r1, r2
	strb r1, [r5, #0x18]
	adds r3, r5, #0
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	adds r2, r5, #0
	adds r2, #0x44
	movs r4, #0
	movs r1, #0x10
	strb r1, [r2]
	adds r2, #1
	strb r1, [r2]
	adds r1, r5, #0
	adds r1, #0x46
	strb r4, [r1]
	ldr r1, _08011424 @ =0x0000FFE0
	ldrh r3, [r5, #0x3c]
	ands r1, r3
	movs r2, #4
	orrs r1, r2
	ldr r2, _08011428 @ =0x0000E0FF
	ands r1, r2
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r5, #0x3c]
	str r4, [r0, #0x30]
	ldr r5, _0801142C @ =0x08B92074
	ldr r2, [r0, #0x3c]
	adds r2, #0x54
	ldr r3, [r0, #0x40]
	str r4, [sp]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp, #4]
	movs r1, #0xf
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #2
	bl StartBmBgfx
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011420: .4byte 0x03002870
_08011424: .4byte 0x0000FFE0
_08011428: .4byte 0x0000E0FF
_0801142C: .4byte 0x08B92074
