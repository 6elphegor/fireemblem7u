	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802F1F8
sub_0802F1F8: @ 0x0802F1F8
	push {lr}
	ldr r0, _0802F204 @ =0x0203A85C
	bl RandGetSt
	pop {r0}
	bx r0
	.align 2, 0
_0802F204: .4byte 0x0203A85C
