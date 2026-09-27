	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D29C
sub_0807D29C: @ 0x0807D29C
	push {lr}
	movs r0, #1
	bl GetUnitFromCharId
	movs r1, #6
	movs r2, #2
	bl SetUnitStatusExt
	pop {r0}
	bx r0
