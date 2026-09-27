	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013B60
sub_08013B60: @ 0x08013B60
	push {lr}
	ldr r0, _08013B6C @ =0x08B92914
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08013B6C: .4byte 0x08B92914
