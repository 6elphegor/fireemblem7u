	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030EE8
sub_08030EE8: @ 0x08030EE8
	push {lr}
	ldr r0, _08030EF8 @ =0x08CE5CA0
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08030EF8: .4byte 0x08CE5CA0
