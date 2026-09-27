	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawBattleForecastContentsExtended
DrawBattleForecastContentsExtended: @ 0x08033888
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0803390C @ =0x0200373C
	ldr r1, _08033910 @ =0x08195D70
	movs r2, #0x90
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r7, _08033914 @ =0x0200323C
	adds r0, r7, #0
	movs r1, #0xa
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	adds r0, #0x46
	adds r4, r5, #0
	adds r4, #0x38
	ldr r2, _08033918 @ =0x0203A3F0
	adds r1, r4, #0
	bl PutBattleForecastUnitName
	ldr r1, _0803391C @ =0x000003C2
	adds r0, r7, r1
	ldr r6, _08033920 @ =0x0203A470
	adds r1, r4, #0
	adds r2, r6, #0
	bl PutBattleForecastUnitName
	ldr r2, _08033924 @ =0x00000442
	adds r0, r7, r2
	adds r5, #0x48
	adds r1, r6, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r1, r5, #0
	bl PutBattleForecastItemName
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _080338F0
	adds r0, r6, #0
	adds r0, #0x5a
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #0xa
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
_080338F0:
	adds r2, r6, #0
	adds r2, #0x72
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x63
	ble _08033928
	adds r0, r7, #0
	adds r0, #0xc4
	movs r1, #2
	movs r2, #0xff
	bl PutNumberTwoChr
	b _08033938
	.align 2, 0
_0803390C: .4byte 0x0200373C
_08033910: .4byte 0x08195D70
_08033914: .4byte 0x0200323C
_08033918: .4byte 0x0203A3F0
_0803391C: .4byte 0x000003C2
_08033920: .4byte 0x0203A470
_08033924: .4byte 0x00000442
_08033928:
	adds r0, r7, #0
	adds r0, #0xc4
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #2
	bl PutNumberTwoChr
_08033938:
	ldr r5, _080339B8 @ =0x02003380
	ldr r4, _080339BC @ =0x0203A470
	adds r0, r4, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, r5, #0
	movs r1, #2
	bl PutNumberTwoChr
	adds r0, r5, #0
	adds r0, #0x80
	adds r1, r4, #0
	adds r1, #0x5c
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x5e
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	ldr r0, _080339C0 @ =0x0203A3F0
	adds r1, r0, #0
	adds r1, #0x72
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x63
	ble _080339C4
	adds r0, r5, #0
	subs r0, #0x74
	movs r1, #2
	movs r2, #0xff
	bl PutNumberTwoChr
	b _080339D2
	.align 2, 0
_080339B8: .4byte 0x02003380
_080339BC: .4byte 0x0203A470
_080339C0: .4byte 0x0203A3F0
_080339C4:
	adds r0, r5, #0
	subs r0, #0x74
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberTwoChr
_080339D2:
	ldr r5, _08033ABC @ =0x0200338C
	ldr r6, _08033AC0 @ =0x0203A3F0
	adds r0, r6, #0
	adds r0, #0x5a
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r5, #0
	movs r1, #2
	bl PutNumberTwoChr
	adds r0, r5, #0
	adds r0, #0x80
	adds r1, r6, #0
	adds r1, #0x5c
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x5e
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	adds r0, r5, #0
	subs r0, #0x88
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	ldr r4, _08033AC4 @ =0x02002FF4
	adds r1, r5, #0
	subs r1, #0xa
	adds r0, r4, #0
	bl PutText
	adds r0, r4, #0
	adds r0, #8
	adds r1, r5, #0
	adds r1, #0x76
	bl PutText
	adds r0, r4, #0
	subs r0, #0x10
	adds r1, r5, #0
	adds r1, #0xf6
	bl PutText
	adds r0, r4, #0
	subs r0, #8
	movs r2, #0xbb
	lsls r2, r2, #1
	adds r1, r5, r2
	bl PutText
	adds r0, r4, #0
	adds r0, #0x10
	movs r3, #0xfb
	lsls r3, r3, #1
	adds r1, r5, r3
	bl PutText
	ldr r0, _08033AC8 @ =0x0000027E
	adds r4, r5, r0
	ldr r0, _08033ACC @ =0x0203A470
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	ldr r1, _08033AD0 @ =0xFFFFFEF2
	adds r4, r5, r1
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r0, r4, #0
	bl PutIcon
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033ABC: .4byte 0x0200338C
_08033AC0: .4byte 0x0203A3F0
_08033AC4: .4byte 0x02002FF4
_08033AC8: .4byte 0x0000027E
_08033ACC: .4byte 0x0203A470
_08033AD0: .4byte 0xFFFFFEF2
