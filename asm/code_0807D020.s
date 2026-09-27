	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D020
sub_0807D020: @ 0x0807D020
	push {r4, r5, lr}
	movs r5, #0
	movs r0, #0x85
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D042
	movs r0, #0x84
	bl CheckFlag
	lsls r0, r0, #0x18
	movs r5, #0x74
	cmp r0, #0
	beq _0807D050
	movs r5, #0x73
	b _0807D054
_0807D042:
	movs r0, #0x84
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D050
	movs r5, #0x75
_0807D050:
	cmp r5, #0
	beq _0807D06C
_0807D054:
	movs r0, #0x2d
	bl GetUnitFromCharId
	adds r4, r0, #0
	adds r0, r5, #0
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	b _0807D08C
_0807D06C:
	bl sub_080A0430
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807D08C
	movs r0, #0x2d
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x74
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
_0807D08C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
