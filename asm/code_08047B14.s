	.include "macro.inc"

	.syntax unified

	thumb_func_start EndLinkArenaButtonSpriteDraw
EndLinkArenaButtonSpriteDraw: @ 0x08047B14
	push {r4, lr}
	ldr r4, _08047B30 @ =0x08B9A380
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08047B28
	adds r0, r4, #0
	bl Proc_EndEach
_08047B28:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047B30: .4byte 0x08B9A380
