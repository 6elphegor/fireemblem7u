	.include "macro.inc"

	.syntax unified

	thumb_func_start SetVisionWithFade
SetVisionWithFade: @ 0x0801DB58
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _0801DB6E
	ldr r0, _0801DB90 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r4, [r0, #0xc]
_0801DB6E:
	bl RenderMapForFade
	ldr r0, _0801DB90 @ =0x0202BBF8
	strb r4, [r0, #0xd]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801DB90: .4byte 0x0202BBF8
