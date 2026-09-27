	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800ADA8
sub_0800ADA8: @ 0x0800ADA8
	push {lr}
	ldr r0, _0800ADB4 @ =0x08B90CA0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0800ADB4: .4byte 0x08B90CA0
