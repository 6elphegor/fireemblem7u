	.include "macro.inc"

	.syntax unified

	thumb_func_start RepairSelectOnInit
RepairSelectOnInit: @ 0x08027B60
	push {lr}
	bl StartUnitInventoryInfoWindow
	pop {r0}
	bx r0
	.align 2, 0
