	.include "macro.inc"

	.syntax unified

	thumb_func_start AiFindPillageLocation
AiFindPillageLocation: @ 0x080369F4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	ldr r5, _08036A74 @ =0x03004690
	ldr r0, [r5]
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _08036A78 @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	ldr r2, [r5]
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r3, #0xb
	ldrsb r3, [r2, r3]
	movs r2, #0x7c
	bl BeginMapFlood
	adds r0, r4, #0
	bl AiGetChestUnlockItemSlot
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r6, _08036A7C @ =0x08B97098
	cmp r0, #1
	bne _08036A34
	ldr r6, _08036A80 @ =0x08B9709C
_08036A34:
	adds r0, r6, #0
	movs r1, #1
	adds r2, r7, #0
	bl AiFindClosestTerrainPosition
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08036A84
	ldr r0, [r5]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodRange_Unitless
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl AiFindClosestTerrainPosition
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08036A84
	movs r0, #0
	b _08036A86
	.align 2, 0
_08036A74: .4byte 0x03004690
_08036A78: .4byte 0x0202E3E8
_08036A7C: .4byte 0x08B97098
_08036A80: .4byte 0x08B9709C
_08036A84:
	movs r0, #1
_08036A86:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
