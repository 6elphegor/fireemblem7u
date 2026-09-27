	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080223EC
sub_080223EC: @ 0x080223EC
	push {lr}
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	bl EndAllMenus
	movs r0, #0x31
	pop {r1}
	bx r1
	.align 2, 0
