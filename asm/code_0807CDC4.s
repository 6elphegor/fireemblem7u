	.include "macro.inc"

	.syntax unified

	thumb_func_start WorldFlushReload
WorldFlushReload: @ 0x0807CDC4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl ApplyMapChange
	movs r0, #1
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
	bl RenderMap
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
