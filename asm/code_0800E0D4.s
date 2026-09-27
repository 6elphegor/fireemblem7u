	.include "macro.inc"

	.syntax unified

	thumb_func_start EventRemoveDisplayedWait
EventRemoveDisplayedWait: @ 0x0800E0D4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x55
	ldrb r0, [r0]
	bl GetUnitFromCharId
	adds r4, r0, #0
	bl EndAllMus
	adds r0, r4, #0
	bl ClearUnit
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #0
	str r0, [r5, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
