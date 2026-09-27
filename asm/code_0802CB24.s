	.include "macro.inc"

	.syntax unified

	thumb_func_start ExecKeyItem
ExecKeyItem: @ 0x0802CB24
	push {r4, r5, lr}
	ldr r4, _0802CBA0 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl UnitUpdateUsedItem
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	subs r0, r5, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	bl StartAvailableDoorTileEvent
	adds r0, r5, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	bl StartAvailableDoorTileEvent
	subs r1, r4, #1
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartAvailableDoorTileEvent
	adds r1, r4, #1
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl StartAvailableDoorTileEvent
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartAvailableChestTileEvent
	ldr r0, _0802CBA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802CB92
	movs r0, #0xb1
	bl m4aSongNumStart
_0802CB92:
	ldr r0, _0802CBA8 @ =0x0203A470
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CBA0: .4byte 0x0203A85C
_0802CBA4: .4byte 0x0202BBF8
_0802CBA8: .4byte 0x0203A470
