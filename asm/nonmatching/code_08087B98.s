	.include "macro.inc"

	.syntax unified

	thumb_func_start CgText_OnEnd
CgText_OnEnd: @ 0x08087B98
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0
	bl SetFaceDispById
	adds r0, r4, #0
	bl CgText_808F084
	movs r0, #0
	bl SetOnHBlankB
	pop {r4}
	pop {r0}
	bx r0
