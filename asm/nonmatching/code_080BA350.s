	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BA350
sub_080BA350: @ 0x080BA350
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BA360 @ =0x08CEEEC0
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080BA360: .4byte 0x08CEEEC0
