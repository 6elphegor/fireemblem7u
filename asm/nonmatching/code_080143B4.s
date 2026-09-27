	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080143B4
sub_080143B4: @ 0x080143B4
	push {lr}
	movs r2, #0
	bl sub_08002338
	bl sub_080143C4
	pop {r0}
	bx r0
