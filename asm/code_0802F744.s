	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802F744
sub_0802F744: @ 0x0802F744
	push {lr}
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0
