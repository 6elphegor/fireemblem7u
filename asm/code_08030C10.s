	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030C10
sub_08030C10: @ 0x08030C10
	push {lr}
	ldr r0, _08030C24 @ =0x08B96460
	bl Proc_Find
	movs r1, #0x33
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08030C24: .4byte 0x08B96460
