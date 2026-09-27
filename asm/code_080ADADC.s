	.include "macro.inc"

	.syntax unified

	thumb_func_start BonusClaim_OnEnd
BonusClaim_OnEnd: @ 0x080ADADC
	push {r4, lr}
	adds r4, r0, #0
	bl EndGreenText
	adds r0, r4, #0
	bl EndAllProcChildren
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
