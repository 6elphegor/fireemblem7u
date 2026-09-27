	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08078DFC
sub_08078DFC: @ 0x08078DFC
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl StartAvailableTileEvent
	pop {r0}
	bx r0
	.align 2, 0
