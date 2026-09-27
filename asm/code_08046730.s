	.include "macro.inc"

	.syntax unified

	thumb_func_start ITEMRANGEDONE_sub_804AF2C
ITEMRANGEDONE_sub_804AF2C: @ 0x08046730
	push {r4, lr}
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	cmp r0, #0
	beq _08046754
	bl GetItemMaxRange
	cmp r0, #1
	beq _08046754
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #1
	bgt _08046758
_08046754:
	movs r0, #1
	b _0804675A
_08046758:
	movs r0, #2
_0804675A:
	pop {r4}
	pop {r1}
	bx r1
