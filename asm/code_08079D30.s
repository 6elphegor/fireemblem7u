	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079D30
sub_08079D30: @ 0x08079D30
	push {lr}
	movs r0, #0x28
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
