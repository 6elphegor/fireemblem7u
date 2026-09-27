	.include "macro.inc"

	.syntax unified

	thumb_func_start WarpSelect_OnEnd
WarpSelect_OnEnd: @ 0x0802797C
	push {r4, lr}
	adds r4, r0, #0
	bl HideMoveRangeGraphics
	ldr r0, [r4, #0x54]
	bl EndSpriteAnim
	pop {r4}
	pop {r0}
	bx r0
