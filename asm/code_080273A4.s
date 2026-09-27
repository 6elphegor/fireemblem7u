	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitOpenBridge
CanUnitOpenBridge: @ 0x080273A4
	push {lr}
	movs r1, #0x14
	bl MakeTargetListForDoorAndBridges
	bl CountTargets
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
