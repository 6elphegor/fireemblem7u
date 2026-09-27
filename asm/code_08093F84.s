	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08093F84
sub_08093F84: @ 0x08093F84
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x11
	bl SetStatScreenExcludedUnitFlags
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartStatScreen
	pop {r4}
	pop {r0}
	bx r0
