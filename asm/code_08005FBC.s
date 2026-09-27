	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08005FBC
sub_08005FBC: @ 0x08005FBC
	push {lr}
	ldr r0, _08005FC8 @ =0x08B86140
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08005FC8: .4byte 0x08B86140
