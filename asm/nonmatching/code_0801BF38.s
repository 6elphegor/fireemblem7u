	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801BF38
sub_0801BF38: @ 0x0801BF38
	push {lr}
	bl sub_08012B88
	ldr r0, _0801BF50 @ =0x08B924BC
	bl Proc_Find
	movs r1, #0xf
	bl Proc_Goto
	pop {r1}
	bx r1
	.align 2, 0
_0801BF50: .4byte 0x08B924BC
