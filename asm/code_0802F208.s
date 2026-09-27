	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802F208
sub_0802F208: @ 0x0802F208
	push {lr}
	ldr r0, _0802F214 @ =0x0203A85C
	bl RandSetSt
	pop {r0}
	bx r0
	.align 2, 0
_0802F214: .4byte 0x0203A85C
