	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseDoorKeyItem
CanUnitUseDoorKeyItem: @ 0x08027390
	push {lr}
	movs r1, #0x1e
	bl MakeTargetListForDoorAndBridges
	bl CountTargets
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
