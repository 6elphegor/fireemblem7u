	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BCA84
sub_080BCA84: @ 0x080BCA84
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl sub_080BBC80
	pop {r0}
	bx r0
	.align 2, 0
