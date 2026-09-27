	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079BFC
sub_08079BFC: @ 0x08079BFC
	push {lr}
	movs r0, #0xfe
	bl SoftReset
	pop {r0}
	bx r0
