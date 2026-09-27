	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079BD4
sub_08079BD4: @ 0x08079BD4
	push {lr}
	movs r0, #0xfe
	bl SoftReset
	pop {r0}
	bx r0
