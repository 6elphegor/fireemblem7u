	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080431A0
sub_080431A0: @ 0x080431A0
	push {lr}
	movs r0, #0xff
	bl SoftReset
	pop {r0}
	bx r0
