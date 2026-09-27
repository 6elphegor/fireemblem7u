	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitCommandUseFlags
GetUnitCommandUseFlags: @ 0x08031404
	push {r4, lr}
	bl GetGameTime
	bl CanUnitUseVisit
	adds r4, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #9
	bl CanUnitUseSeize
	lsls r0, r0, #0x18
	asrs r0, r0, #8
	orrs r4, r0
	bl CanUnitUseAttack
	lsls r0, r0, #0x18
	asrs r0, r0, #0x17
	orrs r4, r0
	bl CanActiveUnitUseRescue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	orrs r4, r0
	bl CanActiveUnitUseTrade
	lsls r0, r0, #0x18
	asrs r0, r0, #1
	orrs r4, r0
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
