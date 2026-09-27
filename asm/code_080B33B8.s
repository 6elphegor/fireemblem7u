	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B33B8
sub_080B33B8: @ 0x080B33B8
	ldr r0, _080B33C0 @ =0x02000000
	movs r1, #4
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_080B33C0: .4byte 0x02000000
