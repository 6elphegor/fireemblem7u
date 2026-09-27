	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ACA3C
sub_080ACA3C: @ 0x080ACA3C
	push {lr}
	ldr r0, [r0, #0x54]
	bl Proc_End
	pop {r0}
	bx r0
