	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitHasItem
UnitHasItem: @ 0x080176F8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl GetItemIndex
	adds r5, r0, #0
	movs r6, #0
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	beq _0801772C
	adds r4, #0x1e
_08017710:
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, r5
	bne _0801771E
	movs r0, #1
	b _0801772E
_0801771E:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	bgt _0801772C
	ldrh r0, [r4]
	cmp r0, #0
	bne _08017710
_0801772C:
	movs r0, #0
_0801772E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
