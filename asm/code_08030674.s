	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030674
sub_08030674: @ 0x08030674
	push {lr}
	adds r1, r0, #0
	ldr r0, _08030684 @ =0x08B96448
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08030684: .4byte 0x08B96448
