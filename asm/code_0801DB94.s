	.include "macro.inc"

	.syntax unified

	thumb_func_start SetVision
SetVision: @ 0x0801DB94
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bge _0801DBAA
	ldr r0, _0801DBC0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0xc]
_0801DBAA:
	ldr r0, _0801DBC0 @ =0x0202BBF8
	strb r1, [r0, #0xd]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl RenderMap
	pop {r0}
	bx r0
	.align 2, 0
_0801DBC0: .4byte 0x0202BBF8
