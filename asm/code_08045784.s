	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045784
sub_08045784: @ 0x08045784
	push {lr}
	bl StartLinkArenaPointsBox
	pop {r0}
	bx r0
	.align 2, 0
