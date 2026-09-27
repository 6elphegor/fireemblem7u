	.include "macro.inc"

	.syntax unified

	thumb_func_start StatScreenSprites_PutNumberLabel
StatScreenSprites_PutNumberLabel: @ 0x08080E70
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r4, _08080ED0 @ =0x0200310C
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0xe3
	movs r3, #6
	ldrsh r2, [r4, r3]
	adds r2, #0xc
	ldr r5, _08080ED4 @ =0x08B905B0
	ldrb r6, [r4, #1]
	ldr r3, _08080ED8 @ =0x00004EA4
	adds r0, r6, r3
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	movs r6, #4
	ldrsh r1, [r4, r6]
	adds r1, #0xdd
	movs r0, #6
	ldrsh r2, [r4, r0]
	adds r2, #0xc
	ldr r0, _08080EDC @ =0x00004E45
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	movs r3, #4
	ldrsh r1, [r4, r3]
	adds r1, #0xd6
	movs r6, #6
	ldrsh r2, [r4, r6]
	adds r2, #0xc
	ldrb r4, [r4]
	ldr r3, _08080EE0 @ =0x00004EA5
	adds r0, r4, r3
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080ED0: .4byte 0x0200310C
_08080ED4: .4byte 0x08B905B0
_08080ED8: .4byte 0x00004EA4
_08080EDC: .4byte 0x00004E45
_08080EE0: .4byte 0x00004EA5
