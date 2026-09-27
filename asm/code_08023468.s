	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08023468
sub_08023468: @ 0x08023468
	push {lr}
	bl sub_08031DFC
	pop {r0}
	bx r0
	.align 2, 0
