	.include "macro.inc"

	.syntax unified

	thumb_func_start IsTalkActive
IsTalkActive: @ 0x08009FA0
	push {lr}
	ldr r0, _08009FB4 @ =0x08B909D4
	bl Proc_Find
	cmp r0, #0
	beq _08009FAE
	movs r0, #1
_08009FAE:
	pop {r1}
	bx r1
	.align 2, 0
_08009FB4: .4byte 0x08B909D4
