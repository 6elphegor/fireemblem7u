	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4B7C
sub_080A4B7C: @ 0x080A4B7C
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	ldr r2, _080A4BD4 @ =0x03002870
	movs r0, #0x20
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r3, r2, #0
	adds r3, #0x34
	movs r0, #1
	ldrb r1, [r3]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3]
	adds r2, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
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
	strb r0, [r2]
	bx lr
	.align 2, 0
_080A4BD4: .4byte 0x03002870
