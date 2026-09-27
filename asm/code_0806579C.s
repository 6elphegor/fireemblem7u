	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806579C
sub_0806579C: @ 0x0806579C
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
