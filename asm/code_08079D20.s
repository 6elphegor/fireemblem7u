	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079D20
sub_08079D20: @ 0x08079D20
	push {lr}
	movs r0, #9
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
