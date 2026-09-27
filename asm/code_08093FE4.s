	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemTrade_DpadKeyHandler
PrepItemTrade_DpadKeyHandler: @ 0x08093FE4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x34]
	ldr r0, _08094044 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809405E
	movs r0, #8
	ands r0, r5
	cmp r0, #0
	beq _0809405E
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _0809402E
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809402E
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _0809402E
	movs r0, #5
	cmp r2, #5
	beq _0809402C
	adds r0, r2, #1
_0809402C:
	adds r2, r0, #0
_0809402E:
	cmp r2, #0
	ble _0809405E
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _08094048
	adds r0, r1, #0
	subs r0, #8
	b _0809404A
	.align 2, 0
_08094044: .4byte 0x08B857F8
_08094048:
	subs r0, r2, #1
_0809404A:
	str r0, [r4, #0x34]
	ldr r0, _080940B8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809405E
	ldr r0, _080940BC @ =0x00000387
	bl m4aSongNumStart
_0809405E:
	ldr r0, _080940C0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080940DA
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080940DA
	ldr r0, [r4, #0x30]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _080940A4
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _080940A4
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _080940A4
	movs r0, #5
	cmp r2, #5
	beq _080940A2
	adds r0, r2, #1
_080940A2:
	adds r2, r0, #0
_080940A4:
	cmp r2, #0
	ble _080940DA
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _080940C4
	adds r0, r1, #0
	adds r0, #8
	b _080940C6
	.align 2, 0
_080940B8: .4byte 0x0202BBF8
_080940BC: .4byte 0x00000387
_080940C0: .4byte 0x08B857F8
_080940C4:
	adds r0, r2, #7
_080940C6:
	str r0, [r4, #0x34]
	ldr r0, _08094140 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080940DA
	ldr r0, _08094144 @ =0x00000387
	bl m4aSongNumStart
_080940DA:
	ldr r0, _08094148 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809417A
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _0809411C
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809411C
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _0809411C
	movs r0, #5
	cmp r3, #5
	beq _0809411A
	adds r0, r3, #1
_0809411A:
	adds r3, r0, #0
_0809411C:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	cmp r0, #0
	ble _08094150
	subs r0, r2, #1
	str r0, [r4, #0x34]
	ldr r0, _08094140 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809417A
	ldr r0, _0809414C @ =0x00000386
	bl m4aSongNumStart
	b _0809417A
	.align 2, 0
_08094140: .4byte 0x0202BBF8
_08094144: .4byte 0x00000387
_08094148: .4byte 0x08B857F8
_0809414C: .4byte 0x00000386
_08094150:
	ldr r0, _080941E0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809417A
	movs r0, #8
	ands r2, r0
	adds r0, r2, r3
	subs r0, #1
	str r0, [r4, #0x34]
	ldr r0, _080941E4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809417A
	ldr r0, _080941E8 @ =0x00000386
	bl m4aSongNumStart
_0809417A:
	ldr r0, _080941E0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08094212
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _080941BC
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _080941BC
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _080941BC
	movs r0, #5
	cmp r3, #5
	beq _080941BA
	adds r0, r3, #1
_080941BA:
	adds r3, r0, #0
_080941BC:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	subs r1, r3, #1
	cmp r0, r1
	bge _080941EC
	adds r0, r2, #1
	str r0, [r4, #0x34]
	ldr r0, _080941E4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094212
	ldr r0, _080941E8 @ =0x00000386
	bl m4aSongNumStart
	b _08094212
	.align 2, 0
_080941E0: .4byte 0x08B857F8
_080941E4: .4byte 0x0202BBF8
_080941E8: .4byte 0x00000386
_080941EC:
	ldr r0, _0809421C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08094212
	movs r0, #8
	ands r2, r0
	str r2, [r4, #0x34]
	ldr r0, _08094220 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094212
	ldr r0, _08094224 @ =0x00000386
	bl m4aSongNumStart
_08094212:
	ldr r0, [r4, #0x34]
	cmp r5, r0
	bne _08094228
	movs r0, #0
	b _0809422A
	.align 2, 0
_0809421C: .4byte 0x08B857F8
_08094220: .4byte 0x0202BBF8
_08094224: .4byte 0x00000386
_08094228:
	movs r0, #1
_0809422A:
	pop {r4, r5}
	pop {r1}
	bx r1
