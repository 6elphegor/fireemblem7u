	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMinimapTerrainCellAt
GetMinimapTerrainCellAt: @ 0x080A2640
	push {lr}
	bl GetMinimapTileAt
	lsls r0, r0, #5
	ldr r1, _080A2650 @ =0x02020140
	adds r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_080A2650: .4byte 0x02020140
