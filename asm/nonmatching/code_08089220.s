	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08089220
sub_08089220: @ 0x08089220
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x3b
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x2c]
	ldrh r0, [r0, #0x3e]
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	adds r0, #0x3a
	strb r1, [r0]
	subs r0, #0xa
	strb r1, [r0]
	adds r0, r4, #0
	bl StartMenuScrollBar
	str r0, [r4, #0x34]
	movs r0, #0xe0
	movs r1, #0x40
	bl PutMenuScrollBarAt
	ldr r0, [r4, #0x2c]
	ldrh r1, [r0, #0x3e]
	ldr r0, _08089278 @ =0x0200E668
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl UpdateMenuScrollBarConfig
	movs r0, #0xe4
	lsls r0, r0, #7
	movs r1, #1
	bl InitMenuScrollBarImg
	bl ForceSyncUnitSpriteSheet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089278: .4byte 0x0200E668
