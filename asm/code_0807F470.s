	.include "macro.inc"

	.syntax unified

	thumb_func_start NilsEpilogueOutro_Init
NilsEpilogueOutro_Init: @ 0x0807F470
	push {r4, lr}
	sub sp, #4
	ldr r4, _0807F4FC @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r4, #0xc]
	ands r0, r1
	strb r0, [r4, #0xc]
	adds r0, r2, #0
	ldrb r1, [r4, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0x10]
	movs r0, #3
	ldrb r1, [r4, #0x14]
	orrs r0, r1
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r4, #0x18]
	ldr r0, _0807F500 @ =0x02022C60
	movs r1, #0x80
	lsls r1, r1, #4
	movs r2, #0x2c
	str r2, [sp]
	movs r2, #0
	movs r3, #6
	bl PutCgBackground
	movs r0, #1
	bl EnableBgSync
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _0807F504 @ =0x0000FFE0
	ldrh r2, [r4, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _0807F508 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F4FC: .4byte 0x03002870
_0807F500: .4byte 0x02022C60
_0807F504: .4byte 0x0000FFE0
_0807F508: .4byte 0x0000E0FF
