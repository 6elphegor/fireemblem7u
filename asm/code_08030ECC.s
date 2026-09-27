	.include "macro.inc"

	.syntax unified

	thumb_func_start DisplayMapChangeIfFog
DisplayMapChangeIfFog: @ 0x08030ECC
	push {lr}
	ldr r0, _08030EE4 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08030EE0
	bl RenderMap
	movs r0, #0
	bl StartMapFade
_08030EE0:
	pop {r0}
	bx r0
	.align 2, 0
_08030EE4: .4byte 0x0202BBF8
