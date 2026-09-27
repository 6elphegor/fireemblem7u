	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitLoadItemsFromDefinition
UnitLoadItemsFromDefinition: @ 0x080178F4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl UnitClearInventory
	adds r1, r4, #0
	adds r1, #8
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _08017928
	adds r4, r1, #0
	adds r6, r4, #0
_0801790C:
	ldrb r0, [r4]
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitAddItem
	adds r4, #1
	adds r0, r6, #3
	cmp r4, r0
	bgt _08017928
	ldrb r0, [r4]
	cmp r0, #0
	bne _0801790C
_08017928:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
