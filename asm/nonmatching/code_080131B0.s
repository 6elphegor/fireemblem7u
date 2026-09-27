	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080131B0
sub_080131B0: @ 0x080131B0
	adds r3, r2, #0
	str r3, [r0]
	ldr r2, _080131C4 @ =0x0000FFE0
	ands r1, r2
	asrs r1, r1, #5
	ands r2, r3
	asrs r3, r2, #5
	subs r1, r3, r1
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_080131C4: .4byte 0x0000FFE0
