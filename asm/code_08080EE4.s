	.include "macro.inc"

	.syntax unified

	thumb_func_start StatScreenSprites_PutMuAreaSprites
StatScreenSprites_PutMuAreaSprites: @ 0x08080EE4
	push {r4, lr}
	sub sp, #4
	ldr r4, _08080F38 @ =0x0200310C
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r0, #6
	ldrsh r2, [r4, r0]
	ldr r3, _08080F3C @ =0x08CC1E58
	movs r0, #0xb9
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xc
	bl PutSprite
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0x40
	movs r0, #6
	ldrsh r2, [r4, r0]
	adds r2, #0x83
	ldr r3, _08080F40 @ =0x08B905F8
	ldr r0, _08080F44 @ =0x00004E90
	str r0, [sp]
	movs r0, #0xb
	bl PutSprite
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0x60
	ldr r0, _08080F48 @ =0x000001FF
	ands r1, r0
	ldrb r2, [r4, #6]
	ldr r3, _08080F4C @ =0x08CC1EA2
	ldr r0, _08080F50 @ =0x0000A460
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080F38: .4byte 0x0200310C
_08080F3C: .4byte 0x08CC1E58
_08080F40: .4byte 0x08B905F8
_08080F44: .4byte 0x00004E90
_08080F48: .4byte 0x000001FF
_08080F4C: .4byte 0x08CC1EA2
_08080F50: .4byte 0x0000A460
