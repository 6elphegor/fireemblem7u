	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079DAC
sub_08079DAC: @ 0x08079DAC
	push {lr}
	movs r0, #0x25
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
