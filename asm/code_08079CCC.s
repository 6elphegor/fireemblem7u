	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079CCC
sub_08079CCC: @ 0x08079CCC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetUnitFromCharId
	bl sub_08079C64
	pop {r0}
	bx r0
	.align 2, 0
