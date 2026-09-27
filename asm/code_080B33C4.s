	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B33C4
sub_080B33C4: @ 0x080B33C4
	ldr r0, _080B33CC @ =0x02000000
	movs r1, #6
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_080B33CC: .4byte 0x02000000
