	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080479D0
sub_080479D0: @ 0x080479D0
	push {lr}
	ldr r0, [r0, #0x30]
	bl sub_080477B4
	pop {r0}
	bx r0
