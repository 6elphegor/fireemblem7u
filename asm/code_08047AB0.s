	.include "macro.inc"

	.syntax unified

	thumb_func_start PutLinkArenaButtonSpriteAt
PutLinkArenaButtonSpriteAt: @ 0x08047AB0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, _08047AD0 @ =0x081D5508
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047AD0: .4byte 0x081D5508
