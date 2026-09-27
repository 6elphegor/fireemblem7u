	.include "macro.inc"

	.syntax unified

	thumb_func_start GetEkrDragonStatusType
GetEkrDragonStatusType: @ 0x08064AB0
	push {lr}
	bl GetEkrDragonStatusType_
	pop {r1}
	bx r1
	.align 2, 0
