	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080091F0
sub_080091F0: @ 0x080091F0
	push {lr}
	ldr r0, _08009204 @ =0x08B909BC
	bl Proc_EndEach
	ldr r0, _08009208 @ =0x08B90ACC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08009204: .4byte 0x08B909BC
_08009208: .4byte 0x08B90ACC
