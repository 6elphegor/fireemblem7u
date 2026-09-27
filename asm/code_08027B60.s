	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08027B60
sub_08027B60: @ 0x08027B60
	push {lr}
	bl StartUnitInventoryInfoWindow
	pop {r0}
	bx r0
	.align 2, 0
