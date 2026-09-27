	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BCE20
sub_080BCE20: @ 0x080BCE20
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BCE30 @ =0x08CEF394
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BCE30: .4byte 0x08CEF394
