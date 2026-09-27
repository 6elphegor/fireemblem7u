	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MapChange
EvtCmd_MapChange: @ 0x0800D9F0
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #2]
	adds r4, r1, #0
	ldr r0, _0800DA0C @ =0x0000FFFF
	cmp r4, r0
	bne _0800DA10
	adds r0, r2, #0
	adds r0, #0x4f
	ldrb r4, [r0]
	movs r5, #0
	b _0800DA20
	.align 2, 0
_0800DA0C: .4byte 0x0000FFFF
_0800DA10:
	ldr r0, _0800DA5C @ =0x00007FFF
	ands r4, r0
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
_0800DA20:
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800DA60
	bl RenderMapForFade
	adds r0, r4, #0
	bl ApplyMapChange
	cmp r5, #0
	beq _0800DA42
	subs r0, r4, #1
	bl RemoveMapChangeTrap
_0800DA42:
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	b _0800DA7E
	.align 2, 0
_0800DA5C: .4byte 0x00007FFF
_0800DA60:
	adds r0, r4, #0
	bl ApplyMapChange
	cmp r5, #0
	beq _0800DA70
	subs r0, r4, #1
	bl RemoveMapChangeTrap
_0800DA70:
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
_0800DA7E:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
