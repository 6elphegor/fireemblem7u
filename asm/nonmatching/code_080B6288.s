	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6288
sub_080B6288: @ 0x080B6288
	ldr r1, _080B6294 @ =0x02000000
	movs r2, #6
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	bx lr
	.align 2, 0
_080B6294: .4byte 0x02000000
