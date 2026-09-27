	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800ADD0
sub_0800ADD0: @ 0x0800ADD0
	push {lr}
	bl EvtCmd_NoSkip
	pop {r0}
	bx r0
	.align 2, 0
