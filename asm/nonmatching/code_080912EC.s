	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080912EC
sub_080912EC: @ 0x080912EC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r4, #0
	cmp r4, r6
	bge _0809131C
_080912FC:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl CanUnitUseItemPrepScreen
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091316
	movs r0, #1
	b _0809131E
_08091316:
	adds r4, #1
	cmp r4, r6
	blt _080912FC
_0809131C:
	movs r0, #0
_0809131E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
