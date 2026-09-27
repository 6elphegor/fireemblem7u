	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08069B84
sub_08069B84: @ 0x08069B84
	push {lr}
	bl EfxUpdatePartsofScroll
	pop {r0}
	bx r0
	.align 2, 0
