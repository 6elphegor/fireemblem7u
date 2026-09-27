	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseHealItem
CanUnitUseHealItem: @ 0x080272E4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetUnitCurrentHp
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitMaxHp
	cmp r5, r0
	beq _080272FC
	movs r0, #1
	b _080272FE
_080272FC:
	movs r0, #0
_080272FE:
	pop {r4, r5}
	pop {r1}
	bx r1
