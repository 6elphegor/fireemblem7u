	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080223A4
sub_080223A4: @ 0x080223A4
	push {lr}
	movs r0, #0
	bl SetTextFont
	pop {r0}
	bx r0
