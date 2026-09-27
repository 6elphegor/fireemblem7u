	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DBB8
sub_0803DBB8: @ 0x0803DBB8
	push {lr}
	ldr r0, _0803DBC4 @ =0x08B98BC4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0803DBC4: .4byte 0x08B98BC4
