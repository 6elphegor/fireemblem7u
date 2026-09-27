	.include "macro.inc"

	.syntax unified

	thumb_func_start GetStringTextCenteredPos
GetStringTextCenteredPos: @ 0x080056A8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetStringTextLen
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
