	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047DA4
sub_08047DA4: @ 0x08047DA4
	push {lr}
	ldr r0, _08047DB0 @ =0x08B9A3A8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08047DB0: .4byte 0x08B9A3A8
