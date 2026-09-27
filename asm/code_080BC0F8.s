	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC0F8
sub_080BC0F8: @ 0x080BC0F8
	push {lr}
	movs r0, #2
	bl EnableBgSync
	pop {r0}
	bx r0
