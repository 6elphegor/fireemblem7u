	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_ReRenderMap
EvtCmd_ReRenderMap: @ 0x0800DBE8
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0800DC00
	bl RefreshAutoWaterShadows
_0800DC00:
	bl RenderMap
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
