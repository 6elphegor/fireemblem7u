	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080412D4
sub_080412D4: @ 0x080412D4
	push {lr}
	movs r0, #0
	bl sub_0803D500
	pop {r0}
	bx r0
