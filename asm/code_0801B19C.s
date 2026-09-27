	.include "macro.inc"

	.syntax unified

	thumb_func_start MapAddInBoundedRange
MapAddInBoundedRange: @ 0x0801B19C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r2, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl MapAddInRange
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r4, #1
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapAddInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
