	.include "macro.inc"

	.syntax unified

	thumb_func_start GetEkrDragonStatusAttr
GetEkrDragonStatusAttr: @ 0x08064A8C
	push {lr}
	bl GetEkrDragonStatus
	ldrh r0, [r0, #2]
	pop {r1}
	bx r1
