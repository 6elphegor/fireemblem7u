	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CFBC
sub_0807CFBC: @ 0x0807CFBC
	push {lr}
	movs r0, #0x17
	bl SetFlag
	pop {r0}
	bx r0
