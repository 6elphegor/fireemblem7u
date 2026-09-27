	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080926F8
sub_080926F8: @ 0x080926F8
	push {lr}
	bl sub_08091914
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
