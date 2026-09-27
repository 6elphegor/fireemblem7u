	.include "macro.inc"

	.syntax unified

	thumb_func_start AddEkrDragonStatusAttr
AddEkrDragonStatusAttr: @ 0x08064A98
	push {r4, lr}
	lsls r4, r1, #0x10
	lsrs r4, r4, #0x10
	bl GetEkrDragonStatus
	ldrh r1, [r0, #2]
	orrs r4, r1
	strh r4, [r0, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
