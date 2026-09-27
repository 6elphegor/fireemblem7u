	.include "macro.inc"

	.syntax unified

	thumb_func_start MenuButtonDisp_UpdateCursorPos
MenuButtonDisp_UpdateCursorPos: @ 0x080864AC
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetCursorQuadrant
	adds r1, r4, #0
	adds r1, #0x50
	movs r5, #0
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [r4, #0x58]
	adds r0, r4, #0
	bl UpdateMenuButtonPos
	str r5, [r4, #0x58]
	ldr r1, _080864E4 @ =0x0202BBB8
	ldrh r0, [r1, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	adds r4, #0x4f
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080864E4: .4byte 0x0202BBB8
