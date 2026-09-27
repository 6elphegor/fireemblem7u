	.include "macro.inc"

	.syntax unified

	thumb_func_start IsTalkLocked
IsTalkLocked: @ 0x080084C4
	push {lr}
	ldr r0, _080084D8 @ =0x08B90A04
	bl Proc_Find
	cmp r0, #0
	beq _080084D2
	movs r0, #1
_080084D2:
	pop {r1}
	bx r1
	.align 2, 0
_080084D8: .4byte 0x08B90A04
