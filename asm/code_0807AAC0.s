	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807AAC0
sub_0807AAC0: @ 0x0807AAC0
	ldr r2, _0807AAE0 @ =0x03002870
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
	bx lr
	.align 2, 0
_0807AAE0: .4byte 0x03002870
