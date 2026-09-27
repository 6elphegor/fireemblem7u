	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B6FC
sub_0807B6FC: @ 0x0807B6FC
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _0807B768 @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _0807B76C @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #5
	bl EnableBgSync
	ldr r3, _0807B770 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0807B768: .4byte 0x02023C60
_0807B76C: .4byte 0x02022C60
_0807B770: .4byte 0x03002870
