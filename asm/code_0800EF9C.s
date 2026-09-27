	.include "macro.inc"

	.syntax unified

	thumb_func_start GiveItem_DoPopup
GiveItem_DoPopup: @ 0x0800EF9C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x54]
	ldr r1, [r2, #0x58]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl StartPopup_800EEB0
	pop {r0}
	bx r0
