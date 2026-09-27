	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemScreen_GiveAll
PrepItemScreen_GiveAll: @ 0x08092F08
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r7, r0, #0
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	cmp r4, r7
	bge _08092F3E
	cmp r6, #0x63
	bgt _08092F3E
_08092F24:
	ldrh r0, [r5, #0x1e]
	bl AddItemToConvoy
	adds r0, r5, #0
	movs r1, #0
	bl UnitRemoveItem
	adds r4, #1
	cmp r4, r7
	bge _08092F3E
	adds r0, r4, r6
	cmp r0, #0x63
	ble _08092F24
_08092F3E:
	cmp r4, #0
	bgt _08092F46
	movs r0, #0
	b _08092F48
_08092F46:
	movs r0, #1
_08092F48:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
