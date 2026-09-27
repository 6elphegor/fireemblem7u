	.include "macro.inc"

	.syntax unified

	thumb_func_start LAButtonSprites_Loop
LAButtonSprites_Loop: @ 0x08047AD4
	push {lr}
	ldr r2, [r0, #0x2c]
	ldr r1, [r0, #0x30]
	adds r0, r2, #0
	bl PutLinkArenaButtonSpriteAt
	pop {r0}
	bx r0
