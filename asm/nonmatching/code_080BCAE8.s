	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BCAE8
sub_080BCAE8: @ 0x080BCAE8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BCAF8 @ =0x08CEF2F4
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BCAF8: .4byte 0x08CEF2F4
