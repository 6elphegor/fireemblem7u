	.include "macro.inc"

	.syntax unified

	thumb_func_start InitMapChangeGraphicsIfFog
InitMapChangeGraphicsIfFog: @ 0x08030EB4
	push {lr}
	ldr r0, _08030EC8 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08030EC2
	bl RenderMapForFade
_08030EC2:
	pop {r0}
	bx r0
	.align 2, 0
_08030EC8: .4byte 0x0202BBF8
