	.include "macro.inc"

	.syntax unified

	thumb_func_start ShopDrawDefaultSellItemLine
ShopDrawDefaultSellItemLine: @ 0x080B1B80
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	movs r0, #0
	str r0, [r7, #4]
_080B1B96:
	ldr r0, [r7, #4]
	cmp r0, #4
	ble _080B1B9E
	b _080B1BC8
_080B1B9E:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B1BC4 @ =0x0203EE58
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B1B96
	.align 2, 0
_080B1BC4: .4byte 0x0203EE58
_080B1BC8:
	movs r0, #0
	str r0, [r7, #4]
_080B1BCC:
	ldr r0, [r7, #4]
	cmp r0, #4
	ble _080B1BD4
	b _080B1C34
_080B1BD4:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r1, r0, r1
	ldrh r0, [r1]
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _080B1BFA
	b _080B1C34
_080B1BFA:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B1C2C @ =0x0203EE58
	adds r0, r0, r1
	ldr r1, [r7, #8]
	ldr r3, [r7]
	ldr r2, [r3, #0x2c]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	movs r4, #0x1f
	ands r3, r4
	lsls r4, r3, #5
	adds r3, r4, #0
	lsls r4, r3, #1
	ldr r5, _080B1C30 @ =0x02023C6E
	adds r3, r4, r5
	bl DrawShopItemLine
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B1BCC
	.align 2, 0
_080B1C2C: .4byte 0x0203EE58
_080B1C30: .4byte 0x02023C6E
_080B1C34:
	movs r0, #4
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
