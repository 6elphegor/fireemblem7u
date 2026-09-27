	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801C168
sub_0801C168: @ 0x0801C168
	push {lr}
	ldr r0, _0801C178 @ =0x08B9335C
	movs r1, #3
	bl Proc_Start
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0801C178: .4byte 0x08B9335C
