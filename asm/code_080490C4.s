	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080490C4
sub_080490C4: @ 0x080490C4
	push {lr}
	ldr r0, _080490D0 @ =0x08B9A5E0
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_080490D0: .4byte 0x08B9A5E0
