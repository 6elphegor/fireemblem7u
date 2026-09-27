	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080658A0
sub_080658A0: @ 0x080658A0
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
