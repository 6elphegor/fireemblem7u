	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawBattleForecastContentsStandard
DrawBattleForecastContentsStandard: @ 0x08033668
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _080336E4 @ =0x0200373C
	ldr r1, _080336E8 @ =0x08195C2C
	movs r2, #0x90
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r4, _080336EC @ =0x0200323C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0xf
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r4, #0
	adds r0, #0x46
	adds r5, r6, #0
	adds r5, #0x38
	ldr r2, _080336F0 @ =0x0203A3F0
	adds r1, r5, #0
	bl PutBattleForecastUnitName
	ldr r1, _080336F4 @ =0x000002C2
	adds r0, r4, r1
	ldr r7, _080336F8 @ =0x0203A470
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutBattleForecastUnitName
	ldr r3, _080336FC @ =0x00000342
	adds r4, r4, r3
	adds r6, #0x48
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutBattleForecastItemName
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _08033700
	adds r0, r7, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08033700
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	adds r2, r7, #0
	b _0803371A
	.align 2, 0
_080336E4: .4byte 0x0200373C
_080336E8: .4byte 0x08195C2C
_080336EC: .4byte 0x0200323C
_080336F0: .4byte 0x0203A3F0
_080336F4: .4byte 0x000002C2
_080336F8: .4byte 0x0203A470
_080336FC: .4byte 0x00000342
_08033700:
	ldr r2, _08033730 @ =0x0203A470
	adds r0, r2, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _08033734 @ =0x0203A3F0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r1, r0
	cmp r4, #0
	bge _0803371A
	movs r4, #0
_0803371A:
	adds r2, #0x72
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x63
	ble _0803373C
	ldr r0, _08033738 @ =0x02003300
	movs r1, #2
	movs r2, #0xff
	bl PutNumberTwoChr
	b _0803374A
	.align 2, 0
_08033730: .4byte 0x0203A470
_08033734: .4byte 0x0203A3F0
_08033738: .4byte 0x02003300
_0803373C:
	ldr r0, _080337B4 @ =0x02003300
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #2
	bl PutNumberTwoChr
_0803374A:
	ldr r5, _080337B8 @ =0x02003380
	adds r0, r5, #0
	movs r1, #2
	adds r2, r4, #0
	bl PutNumberTwoChr
	adds r0, r5, #0
	adds r0, #0x80
	ldr r4, _080337BC @ =0x0203A470
	adds r1, r4, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	ldr r2, _080337C0 @ =0x0203A3F0
	adds r0, r2, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r0, r4, #0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r1, r0
	cmp r4, #0
	bge _08033798
	movs r4, #0
_08033798:
	adds r1, r2, #0
	adds r1, #0x72
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x63
	ble _080337C4
	adds r0, r5, #0
	subs r0, #0x74
	movs r1, #2
	movs r2, #0xff
	bl PutNumberTwoChr
	b _080337D2
	.align 2, 0
_080337B4: .4byte 0x02003300
_080337B8: .4byte 0x02003380
_080337BC: .4byte 0x0203A470
_080337C0: .4byte 0x0203A3F0
_080337C4:
	adds r0, r5, #0
	subs r0, #0x74
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberTwoChr
_080337D2:
	ldr r5, _08033874 @ =0x0200338C
	adds r0, r5, #0
	movs r1, #2
	adds r2, r4, #0
	bl PutNumberTwoChr
	adds r0, r5, #0
	adds r0, #0x80
	ldr r6, _08033878 @ =0x0203A3F0
	adds r1, r6, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x6a
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
	ldr r4, _0803387C @ =0x02002FDC
	adds r1, r5, #0
	subs r1, #0xa
	adds r0, r4, #0
	bl PutText
	adds r0, r4, #0
	adds r0, #8
	adds r1, r5, #0
	adds r1, #0x76
	bl PutText
	adds r4, #0x10
	adds r1, r5, #0
	adds r1, #0xf6
	adds r0, r4, #0
	bl PutText
	movs r0, #0xbf
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r0, _08033880 @ =0x0203A470
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	ldr r1, _08033884 @ =0xFFFFFEF2
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
_08033874: .4byte 0x0200338C
_08033878: .4byte 0x0203A3F0
_0803387C: .4byte 0x02002FDC
_08033880: .4byte 0x0203A470
_08033884: .4byte 0xFFFFFEF2
