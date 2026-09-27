	.include "macro.inc"

	.syntax unified

	thumb_func_start WarpEffectExists
WarpEffectExists: @ 0x08020AB8
	push {lr}
	ldr r0, _08020ACC @ =0x08B93C54
	bl Proc_Find
	cmp r0, #0
	beq _08020AC6
	movs r0, #1
_08020AC6:
	pop {r1}
	bx r1
	.align 2, 0
_08020ACC: .4byte 0x08B93C54
