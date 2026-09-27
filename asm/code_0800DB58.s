	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MapChangeInstant
EvtCmd_MapChangeInstant: @ 0x0800DB58
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldrh r4, [r0, #2]
	ldr r0, _0800DB8C @ =0x0000FFFF
	cmp r4, r0
	bne _0800DB6C
	adds r0, r1, #0
	adds r0, #0x4f
	ldrb r4, [r0]
_0800DB6C:
	adds r0, r4, #0
	bl ApplyMapChange
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
	bl RenderMap
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800DB8C: .4byte 0x0000FFFF
