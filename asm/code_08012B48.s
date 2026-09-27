	.include "macro.inc"

	.syntax unified

	thumb_func_start SetNextGameAction
SetNextGameAction: @ 0x08012B48
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameControl
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
