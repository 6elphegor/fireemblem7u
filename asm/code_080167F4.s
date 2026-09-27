	.include "macro.inc"

	.syntax unified

	thumb_func_start EquipUnitItemSlot
EquipUnitItemSlot: @ 0x080167F4
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r4, r1, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r5, [r0]
	adds r2, r1, #0
	cmp r2, #0
	beq _08016818
	adds r0, r4, #0
	adds r0, #0x1c
	adds r1, r0, r3
_0801680C:
	ldrh r0, [r1]
	strh r0, [r1, #2]
	subs r1, #2
	subs r2, #1
	cmp r2, #0
	bne _0801680C
_08016818:
	strh r5, [r3, #0x1e]
	pop {r4, r5}
	pop {r0}
	bx r0
