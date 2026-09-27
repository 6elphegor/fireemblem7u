	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CF10
sub_0807CF10: @ 0x0807CF10
	push {lr}
	movs r0, #0x18
	bl GetUnitFromCharId
	movs r1, #0x6b
	bl GetUnitItemSlot
	adds r1, r0, #0
	mvns r1, r1
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1
