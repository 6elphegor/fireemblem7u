	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080412C8
sub_080412C8: @ 0x080412C8
	push {lr}
	movs r0, #3
	bl sub_0803D500
	pop {r0}
	bx r0
