	.include "macro.inc"

	.syntax unified

	thumb_func_start ChestCommandUsability
ChestCommandUsability: @ 0x08022CC0
	push {r4, lr}
	ldr r4, _08022CE0 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022CDC
	adds r0, r2, #0
	movs r1, #0x21
	bl GetUnitKeyItemSlotForTerrain
	cmp r0, #0
	bge _08022CE4
_08022CDC:
	movs r0, #3
	b _08022CF6
	.align 2, 0
_08022CE0: .4byte 0x03004690
_08022CE4:
	ldr r0, [r4]
	bl CanUnitUseChestKeyItem
	lsls r0, r0, #0x18
	movs r1, #3
	cmp r0, #0
	beq _08022CF4
	movs r1, #1
_08022CF4:
	adds r0, r1, #0
_08022CF6:
	pop {r4}
	pop {r1}
	bx r1
