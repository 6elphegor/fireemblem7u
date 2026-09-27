	.include "macro.inc"

	.syntax unified

	thumb_func_start GiveItem_DoGiveItem
GiveItem_DoGiveItem: @ 0x0800EFB0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x58]
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl HandleGiveUnitItem
	pop {r4, r5}
	pop {r0}
	bx r0
