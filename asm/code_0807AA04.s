	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807AA04
sub_0807AA04: @ 0x0807AA04
	push {r4, lr}
	movs r0, #0x26
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x25
	bl GetUnitFromCharId
	adds r1, r0, #0
	adds r0, r4, #0
	bl SwapUnitStats
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
