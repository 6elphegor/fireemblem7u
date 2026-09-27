	.include "macro.inc"

	.syntax unified

	thumb_func_start GetEkrDragonStatusType_
GetEkrDragonStatusType_: @ 0x08064ABC
	push {lr}
	bl GetEkrDragonStatus
	ldrh r0, [r0]
	pop {r1}
	bx r1
