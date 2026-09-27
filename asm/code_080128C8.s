	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080128C8
sub_080128C8: @ 0x080128C8
	push {lr}
	movs r1, #3
	bl Proc_Goto
	pop {r0}
	bx r0
