	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098E18
sub_08098E18: @ 0x08098E18
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemSellPrice
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl AddGold
	ldr r0, [r4, #0x2c]
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	bl UnitRemoveInvalidItems
	ldr r0, _08098E84 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098E5E
	movs r0, #0xb9
	bl m4aSongNumStart
_08098E5E:
	bl sub_08098868
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _08098E90
	ldr r0, _08098E88 @ =0x02022EA4
	ldr r1, _08098E8C @ =0x02012B78
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl DrawPrepScreenItems
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08098EA2
	.align 2, 0
_08098E84: .4byte 0x0202BBF8
_08098E88: .4byte 0x02022EA4
_08098E8C: .4byte 0x02012B78
_08098E90:
	ldrb r1, [r5]
	cmp r0, r1
	bne _08098E9A
	subs r0, #1
	strb r0, [r5]
_08098E9A:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08098EA2:
	pop {r4, r5}
	pop {r0}
	bx r0
