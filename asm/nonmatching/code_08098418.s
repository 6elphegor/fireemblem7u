	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098418
sub_08098418: @ 0x08098418
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _08098440
	ldr r0, _0809843C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08098508
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x36]
	b _0809854A
	.align 2, 0
_0809843C: .4byte 0x08B857F8
_08098440:
	ldr r0, _08098474 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098478
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809854A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r5, #0x36]
	b _0809854A
	.align 2, 0
_08098474: .4byte 0x08B857F8
_08098478:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080984D8
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r4, _080984BC @ =0x020117E4
	adds r2, r5, #0
	adds r2, #0x33
	ldrb r2, [r2]
	lsls r3, r2, #1
	adds r2, r5, #0
	adds r2, #0x38
	adds r2, r2, r3
	ldrh r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r2, [r2, #2]
	bl CheckValidLinkArenaItemSupply
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080984C4
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080984C0 @ =0x000003AE
	adds r0, r1, #0
	adds r3, r5, #0
	bl StartPrepErrorHelpbox
	b _0809854A
	.align 2, 0
_080984BC: .4byte 0x020117E4
_080984C0: .4byte 0x000003AE
_080984C4:
	movs r0, #0
	bl DisableUiCursorHand
	adds r0, r5, #0
	bl Proc_Break
	adds r0, r5, #0
	bl sub_0809835C
	b _0809854A
_080984D8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08098508
	movs r0, #0
	bl DisableUiCursorHand
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _08098500 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809854A
	ldr r0, _08098504 @ =0x0000038B
	bl m4aSongNumStart
	b _0809854A
	.align 2, 0
_08098500: .4byte 0x0202BBF8
_08098504: .4byte 0x0000038B
_08098508:
	adds r0, r5, #0
	bl sub_08098274
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809854A
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _0809854A
	ldr r0, [r5, #0x2c]
	ldrb r3, [r4]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809854A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_0809854A:
	pop {r4, r5}
	pop {r0}
	bx r0
