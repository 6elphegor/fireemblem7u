	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DBF4
sub_0807DBF4: @ 0x0807DBF4
	push {r4, lr}
	movs r0, #0x27
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x8c
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
