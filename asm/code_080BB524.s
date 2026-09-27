	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BB524
sub_080BB524: @ 0x080BB524
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
