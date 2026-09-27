	.include "macro.inc"

	.syntax unified

	thumb_func_start GoToFightItemReview
GoToFightItemReview: @ 0x08021D44
	push {lr}
	movs r0, #0
	movs r1, #0
	bl UnitAttackCommandEffect
	pop {r0}
	bx r0
	.align 2, 0
