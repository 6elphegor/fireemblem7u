	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08093FA0
sub_08093FA0: @ 0x08093FA0
	push {r4, lr}
	adds r4, r0, #0
	bl MakePrepUnitList
	bl GetLatestUnitIndexInPrepListByUId
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
