	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801264C
sub_0801264C: @ 0x0801264C
	push {lr}
	bl sub_08002C74
	bl sub_08002C8C
	pop {r0}
	bx r0
	.align 2, 0
