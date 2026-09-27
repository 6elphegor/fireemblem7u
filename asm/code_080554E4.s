	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080554E4
sub_080554E4: @ 0x080554E4
	ldr r1, _080554EC @ =0x0203E0F0
	str r0, [r1]
	bx lr
	.align 2, 0
_080554EC: .4byte 0x0203E0F0
