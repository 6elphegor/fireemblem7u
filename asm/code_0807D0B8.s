	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D0B8
sub_0807D0B8: @ 0x0807D0B8
	push {r4, lr}
	movs r0, #0x10
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x3e
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x10
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x6b
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x75
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x16
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x75
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x6b
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x76
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x16
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x76
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x6b
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x77
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x1c
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	movs r0, #0x77
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x6b
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	pop {r4}
	pop {r0}
	bx r0
