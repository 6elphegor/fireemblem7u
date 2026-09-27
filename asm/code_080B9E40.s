	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B9E40
sub_080B9E40: @ 0x080B9E40
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B9E54 @ =0x08CEEBA8
	bl Proc_Start
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9E54: .4byte 0x08CEEBA8
