	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6278
sub_080B6278: @ 0x080B6278
	ldr r1, _080B6284 @ =0x02000000
	movs r2, #4
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	bx lr
	.align 2, 0
_080B6284: .4byte 0x02000000
