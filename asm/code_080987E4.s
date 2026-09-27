	.include "macro.inc"

	.syntax unified

	thumb_func_start WmSell_DrawItemGoldValue
WmSell_DrawItemGoldValue: @ 0x080987E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _0809883C @ =0x02022F48
	adds r0, r6, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	cmp r4, #0
	beq _08098856
	adds r0, r4, #0
	bl GetItemSellPrice
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08098816
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08098840
_08098816:
	adds r0, r6, #0
	adds r0, #0xa
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0xe
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	b _0809884C
	.align 2, 0
_0809883C: .4byte 0x02022F48
_08098840:
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #2
	adds r2, r5, #0
	bl PutNumber
_0809884C:
	ldr r0, _08098864 @ =0x02022F56
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
_08098856:
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098864: .4byte 0x02022F56
