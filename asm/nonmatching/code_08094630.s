	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08094630
sub_08094630: @ 0x08094630
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, [r6, #0x3c]
	cmp r2, #0xff
	beq _0809465C
	ldr r0, _08094658 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _08094650
	b _080948C4
_08094650:
	bl CloseHelpBox
	movs r0, #0xff
	b _08094924
	.align 2, 0
_08094658: .4byte 0x08B857F8
_0809465C:
	ldr r0, _08094698 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809469C
	ldr r2, [r6, #0x34]
	asrs r3, r2, #3
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r4, #7
	ands r4, r2
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _0809468C
	b _08094926
_0809468C:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r4, #4
	b _0809491C
	.align 2, 0
_08094698: .4byte 0x08B857F8
_0809469C:
	ldr r4, [r6, #0x38]
	cmp r4, #0xff
	bne _080946A4
	b _08094804
_080946A4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080946AE
	b _080947B8
_080946AE:
	asrs r0, r4, #3
	lsls r0, r0, #2
	adds r7, r6, #0
	adds r7, #0x2c
	adds r0, r7, r0
	ldr r0, [r0]
	movs r1, #7
	mov r8, r1
	ands r4, r1
	ldr r3, [r6, #0x34]
	asrs r1, r3, #3
	lsls r1, r1, #2
	adds r1, r7, r1
	ldr r2, [r1]
	mov r1, r8
	ands r3, r1
	adds r1, r4, #0
	bl CheckValidLinkArenaItemSwap
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080946F0
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080946EC @ =0x000003AE
	adds r0, r1, #0
	adds r3, r6, #0
	bl StartPrepErrorHelpbox
	b _08094926
	.align 2, 0
_080946EC: .4byte 0x000003AE
_080946F0:
	ldr r1, [r6, #0x38]
	asrs r0, r1, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	mov r2, r8
	ands r1, r2
	ldr r3, [r6, #0x34]
	asrs r2, r3, #3
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r2, [r2]
	mov r4, r8
	ands r3, r4
	bl PrepItemTrade_ApplyItemSwap
	ldr r4, _08094754 @ =0x02022EA4
	ldr r5, _08094758 @ =0x02012A20
	ldr r2, [r6, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl DrawPrepScreenItems
	adds r4, #0x1c
	adds r5, #0x28
	ldr r2, [r6, #0x30]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl DrawPrepScreenItems
	movs r0, #1
	bl EnableBgSync
	ldr r0, [r6, #0x38]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #0
	bne _0809475C
	ldr r0, [r6, #0x38]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	b _08094770
	.align 2, 0
_08094754: .4byte 0x02022EA4
_08094758: .4byte 0x02012A20
_0809475C:
	ldr r1, [r6, #0x38]
	adds r0, r1, #0
	mov r3, r8
	ands r0, r3
	cmp r2, r0
	bgt _08094772
	movs r0, #8
	ands r1, r0
	adds r0, r1, r2
	subs r0, #1
_08094770:
	str r0, [r6, #0x38]
_08094772:
	ldr r0, _080947B0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094784
	ldr r0, _080947B4 @ =0x0000038A
	bl m4aSongNumStart
_08094784:
	movs r0, #0
	bl DisableUiCursorHand
	ldr r1, [r6, #0x38]
	str r1, [r6, #0x34]
	movs r0, #0xff
	str r0, [r6, #0x38]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	b _08094926
	.align 2, 0
_080947B0: .4byte 0x0202BBF8
_080947B4: .4byte 0x0000038A
_080947B8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080947C2
	b _080948C4
_080947C2:
	str r4, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r1, r4, #3
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x10
	movs r1, #7
	ands r4, r1
	lsls r1, r4, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, _080947FC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080947F4
	ldr r0, _08094800 @ =0x0000038B
	bl m4aSongNumStart
_080947F4:
	movs r0, #0
	bl DisableUiCursorHand
	b _08094926
	.align 2, 0
_080947FC: .4byte 0x0202BBF8
_08094800: .4byte 0x0000038B
_08094804:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08094898
	ldr r0, [r6, #0x34]
	asrs r0, r0, #3
	adds r0, #1
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r2, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r0, r2, #3
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x10
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r3, #0
	bl SetUiCursorHandConfig
	cmp r4, #4
	bgt _08094854
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	adds r0, r0, r4
	b _0809485C
_08094854:
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #0xf
	ands r0, r1
_0809485C:
	str r0, [r6, #0x34]
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, _08094890 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094926
	ldr r0, _08094894 @ =0x0000038A
	bl m4aSongNumStart
	b _08094926
	.align 2, 0
_08094890: .4byte 0x0202BBF8
_08094894: .4byte 0x0000038A
_08094898:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080948C4
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, _080948BC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094926
	ldr r0, _080948C0 @ =0x0000038B
	bl m4aSongNumStart
	b _08094926
	.align 2, 0
_080948BC: .4byte 0x0202BBF8
_080948C0: .4byte 0x0000038B
_080948C4:
	adds r0, r6, #0
	bl PrepItemTrade_DpadKeyHandler
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094926
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r5, #7
	ands r1, r5
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r6, #0x3c]
	cmp r0, #0xff
	beq _08094926
	ldr r2, [r6, #0x34]
	asrs r4, r2, #3
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r3, r5, #0
	ands r3, r2
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08094926
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r3, #4
_0809491C:
	adds r1, #0x48
	bl StartItemHelpBox
	ldr r0, [r6, #0x34]
_08094924:
	str r0, [r6, #0x3c]
_08094926:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
