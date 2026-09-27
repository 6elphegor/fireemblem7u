	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800AE04
sub_0800AE04: @ 0x0800AE04
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800AE14 @ =0x08B90D40
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0800AE14: .4byte 0x08B90D40
