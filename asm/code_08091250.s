	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08091250
sub_08091250: @ 0x08091250
	push {r4, r5, lr}
	bl ClearSupplyItems
	movs r4, #0
	movs r5, #0x87
_0809125A:
	subs r0, r5, r4
	bl AddItemToConvoy
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x63
	bls _0809125A
	pop {r4, r5}
	pop {r0}
	bx r0
