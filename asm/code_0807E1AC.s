	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807E1AC
sub_0807E1AC: @ 0x0807E1AC
	push {lr}
	movs r0, #0x27
	bl GetUnitFromCharId
	movs r1, #0
	bl StartStatusHealEffect
	pop {r0}
	bx r0
	.align 2, 0
