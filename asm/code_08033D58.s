	.include "macro.inc"

	.syntax unified

	thumb_func_start PutBattleForecastMultipliers
PutBattleForecastMultipliers: @ 0x08033D58
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x2c]
	lsls r1, r1, #2
	movs r0, #0xff
	ldr r2, _08033DE8 @ =0x080C5A48
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	asrs r6, r0, #0xa
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r5, r0, #0xb
	subs r1, r6, #3
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r6, r1, r0
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r7, #0
	adds r4, #0x50
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	ble _08033DBE
	adds r1, r6, #0
	adds r1, #0x48
	adds r2, r5, #0
	adds r2, #0x28
	ldr r3, _08033DEC @ =0x08B905B8
	ldr r4, _08033DF0 @ =0x000022E6
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
_08033DBE:
	adds r4, r7, #0
	adds r4, #0x51
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	ble _08033DE0
	adds r1, r6, #0
	adds r1, #0x18
	adds r2, r5, #0
	adds r2, #0x28
	ldr r3, _08033DEC @ =0x08B905B8
	ldr r4, _08033DF0 @ =0x000022E6
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
_08033DE0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033DE8: .4byte 0x080C5A48
_08033DEC: .4byte 0x08B905B8
_08033DF0: .4byte 0x000022E6
