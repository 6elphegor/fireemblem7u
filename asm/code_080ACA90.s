	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ACA90
sub_080ACA90: @ 0x080ACA90
	push {lr}
	adds r1, r0, #0
	ldr r0, _080ACAA0 @ =0x08CE574C
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080ACAA0: .4byte 0x08CE574C
