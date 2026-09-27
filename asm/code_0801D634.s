	.include "macro.inc"

	.syntax unified

	thumb_func_start IsMapFadeActive
IsMapFadeActive: @ 0x0801D634
	push {lr}
	ldr r0, _0801D648 @ =0x08B9362C
	bl Proc_Find
	cmp r0, #0
	beq _0801D642
	movs r0, #1
_0801D642:
	pop {r1}
	bx r1
	.align 2, 0
_0801D648: .4byte 0x08B9362C
