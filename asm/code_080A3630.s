	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A3630
sub_080A3630: @ 0x080A3630
	push {lr}
	ldr r0, _080A36A4 @ =0x08CE3C0C
	bl InitBgs
	bl ResetText
	ldr r2, _080A36A8 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x3f
	ldrb r1, [r2, #0x15]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #0x15]
	movs r0, #3
	ldrb r3, [r2, #0xc]
	orrs r0, r3
	strb r0, [r2, #0xc]
	adds r1, #0x1d
	adds r0, r1, #0
	ldrb r3, [r2, #0x10]
	ands r0, r3
	strb r0, [r2, #0x10]
	adds r0, r1, #0
	ldrb r3, [r2, #0x14]
	ands r0, r3
	movs r3, #2
	orrs r0, r3
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	orrs r1, r3
	strb r1, [r2, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_080A36A4: .4byte 0x08CE3C0C
_080A36A8: .4byte 0x03002870
