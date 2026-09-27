	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A95B4
sub_080A95B4: @ 0x080A95B4
	ldr r2, _080A95D4 @ =0x03002870
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
_080A95D4: .4byte 0x03002870
