	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08092220
sub_08092220: @ 0x08092220
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x2d
	ldrb r7, [r2]
	adds r4, r5, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _08092236
	b _08092444
_08092236:
	ldr r0, _08092268 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08092270
	strb r7, [r4]
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _0809226C @ =0x08CC4430
	ldrb r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
	b _08092564
	.align 2, 0
_08092268: .4byte 0x08B857F8
_0809226C: .4byte 0x08CC4430
_08092270:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809227A
	b _08092400
_0809227A:
	cmp r7, #5
	bls _08092280
	b _080923E4
_08092280:
	lsls r0, r7, #2
	ldr r1, _0809228C @ =_08092290
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809228C: .4byte _08092290
_08092290: @ jump table
	.4byte _080922A8 @ case 0
	.4byte _080922BC @ case 1
	.4byte _080922D0 @ case 2
	.4byte _080922F0 @ case 3
	.4byte _08092324 @ case 4
	.4byte _0809233C @ case 5
_080922A8:
	bl PrepGetUnitAmount
	cmp r0, #1
	bgt _080922B2
	b _080923E4
_080922B2:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _080923BC
_080922BC:
	bl PrepGetUnitAmount
	cmp r0, #1
	bgt _080922C6
	b _080923E4
_080922C6:
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _080923BC
_080922D0:
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	bl sub_080912EC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080922E6
	b _080923E4
_080922E6:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _080923BC
_080922F0:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080923E4
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	cmp r0, #0
	ble _080923E4
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080923E4
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
	b _080923BC
_08092324:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080923E4
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080923BC
_0809233C:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809236C
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0809236C
	subs r1, #9
	ldr r2, _08092368 @ =0x000003AE
	adds r0, r1, #0
	adds r3, r5, #0
	bl StartPrepErrorHelpbox
	b _08092564
	.align 2, 0
_08092368: .4byte 0x000003AE
_0809236C:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080923E4
	adds r6, r5, #0
	adds r6, #0x2a
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	bl PrepItemScreen_GiveAll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080923E4
	ldr r4, _080923D4 @ =0x02022EC4
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08091F04
	ldr r5, _080923D8 @ =0x02012A20
	subs r4, #0x20
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_080929D0
	movs r0, #1
	bl EnableBgSync
_080923BC:
	ldr r0, _080923DC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080923CA
	b _08092564
_080923CA:
	ldr r0, _080923E0 @ =0x0000038A
	bl m4aSongNumStart
	b _08092564
	.align 2, 0
_080923D4: .4byte 0x02022EC4
_080923D8: .4byte 0x02012A20
_080923DC: .4byte 0x0202BBF8
_080923E0: .4byte 0x0000038A
_080923E4:
	ldr r0, _080923FC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080923F2
	b _08092564
_080923F2:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08092564
	.align 2, 0
_080923FC: .4byte 0x0202BBF8
_08092400:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809245C
	adds r2, r5, #0
	adds r2, #0x2a
	ldrb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x29
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r2]
	movs r0, #0
	bl DisableUiCursorHand
	ldr r0, _0809243C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092430
	ldr r0, _08092440 @ =0x0000038B
	bl m4aSongNumStart
_08092430:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _08092564
	.align 2, 0
_0809243C: .4byte 0x0202BBF8
_08092440: .4byte 0x0000038B
_08092444:
	ldr r0, _08092480 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809245C
	bl CloseHelpBox
	movs r0, #0xff
	strb r0, [r4]
_0809245C:
	ldr r1, _08092480 @ =0x08B857F8
	ldr r3, [r1]
	movs r6, #0x20
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	adds r4, r5, #0
	adds r4, #0x2d
	cmp r0, #0
	beq _08092492
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08092484
	subs r0, r2, #1
	b _08092490
	.align 2, 0
_08092480: .4byte 0x08B857F8
_08092484:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _08092492
	adds r0, r2, #1
_08092490:
	strb r0, [r4]
_08092492:
	ldr r3, [r1]
	movs r6, #0x10
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	cmp r0, #0
	beq _080924BC
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _080924AE
	adds r0, r2, #1
	b _080924BA
_080924AE:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080924BC
	subs r0, r2, #1
_080924BA:
	strb r0, [r4]
_080924BC:
	ldr r3, [r1]
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	cmp r0, #0
	beq _080924E2
	ldrb r2, [r4]
	cmp r2, #1
	bls _080924D4
	subs r0, r2, #2
	b _080924E0
_080924D4:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _080924E2
	adds r0, r2, #4
_080924E0:
	strb r0, [r4]
_080924E2:
	ldr r1, [r1]
	movs r3, #0x80
	adds r0, r3, #0
	ldrh r2, [r1, #6]
	ands r0, r2
	cmp r0, #0
	beq _08092508
	ldrb r2, [r4]
	cmp r2, #3
	bhi _080924FA
	adds r0, r2, #2
	b _08092506
_080924FA:
	adds r0, r3, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08092508
	subs r0, r2, #4
_08092506:
	strb r0, [r4]
_08092508:
	ldrb r0, [r4]
	cmp r7, r0
	beq _08092564
	ldr r0, _0809256C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092520
	ldr r0, _08092570 @ =0x00000385
	bl m4aSongNumStart
_08092520:
	ldrb r1, [r4]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl ShowSysHandCursor
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08092564
	ldrb r1, [r4]
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _08092574 @ =0x08CC4430
	ldrb r4, [r4]
	lsls r2, r4, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
_08092564:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809256C: .4byte 0x0202BBF8
_08092570: .4byte 0x00000385
_08092574: .4byte 0x08CC4430
