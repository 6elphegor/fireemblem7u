	.include "macro.inc"

	.syntax unified

	thumb_func_start ItemSelectMenu_TextDraw
ItemSelectMenu_TextDraw: @ 0x08022204
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r7, _0802223C @ =0x03004690
	ldr r1, [r7]
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08022240
	adds r0, r6, #0
	adds r1, r4, #0
	bl WeaponSelectMenu_Draw
	movs r0, #0
	b _08022280
	.align 2, 0
_0802223C: .4byte 0x03004690
_08022240:
	adds r0, r5, #0
	bl GetItemType
	cmp r0, #0xc
	bne _0802224E
	movs r2, #0
	b _0802225A
_0802224E:
	ldr r0, [r7]
	adds r1, r5, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0802225A:
	adds r0, r4, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r4, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08022288 @ =0x02022C60
	adds r3, r3, r1
	adds r1, r5, #0
	bl DrawItemMenuLine
	movs r0, #1
	bl EnableBgSync
_08022280:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08022288: .4byte 0x02022C60
