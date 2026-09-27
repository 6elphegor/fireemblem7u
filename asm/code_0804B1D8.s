	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804B1D8
sub_0804B1D8: @ 0x0804B1D8
	push {lr}
	ldr r0, _0804B1E8 @ =0x0203E004
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0804B1E8: .4byte 0x0203E004
