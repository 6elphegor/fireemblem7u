	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08093ED8
sub_08093ED8: @ 0x08093ED8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	adds r0, r4, #0
	bl StartUnitListScreenPrepMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
