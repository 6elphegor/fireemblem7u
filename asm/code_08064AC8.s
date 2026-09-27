	.include "macro.inc"

	.syntax unified

	thumb_func_start AddEkrDragonStatusType
AddEkrDragonStatusType: @ 0x08064AC8
	push {r4, lr}
	lsls r4, r1, #0x10
	lsrs r4, r4, #0x10
	bl GetEkrDragonStatus
	ldrh r1, [r0]
	orrs r4, r1
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
