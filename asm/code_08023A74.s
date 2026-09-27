	.include "macro.inc"

	.syntax unified

	thumb_func_start ForEachAdjacentUnit
ForEachAdjacentUnit: @ 0x08023A74
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl BeginTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	adds r0, r6, #0
	bl ForEachUnitInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
