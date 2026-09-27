	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08028194
sub_08028194: @ 0x08028194
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _080281C0
_080281A4:
	lsls r1, r4, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x8a
	bne _080281BA
	movs r0, #1
	b _080281C2
_080281BA:
	adds r4, #1
	cmp r4, r5
	blt _080281A4
_080281C0:
	movs r0, #0
_080281C2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
