	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804176C
sub_0804176C: @ 0x0804176C
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0
