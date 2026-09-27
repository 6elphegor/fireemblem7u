	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MapChangeWithAutoWaterShadows
EvtCmd_MapChangeWithAutoWaterShadows: @ 0x0800DA88
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #2]
	adds r4, r1, #0
	ldr r0, _0800DAA4 @ =0x0000FFFF
	cmp r4, r0
	bne _0800DAA8
	adds r0, r2, #0
	adds r0, #0x4f
	ldrb r4, [r0]
	movs r5, #0
	b _0800DAB8
	.align 2, 0
_0800DAA4: .4byte 0x0000FFFF
_0800DAA8:
	ldr r0, _0800DAF0 @ =0x00007FFF
	ands r4, r0
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
_0800DAB8:
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800DB2C
	bl RenderMapForFade
	adds r0, r4, #0
	bl ApplyMapChange
	cmp r5, #0
	beq _0800DAF8
	subs r0, r4, #1
	bl RemoveMapChangeTrap
	ldr r0, _0800DAF4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800DB0A
	movs r0, #0xbd
	bl m4aSongNumStart
	b _0800DB0A
	.align 2, 0
_0800DAF0: .4byte 0x00007FFF
_0800DAF4: .4byte 0x0202BBF8
_0800DAF8:
	ldr r0, _0800DB28 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800DB0A
	movs r0, #0xbe
	bl m4aSongNumStart
_0800DB0A:
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
	bl RefreshAutoWaterShadows
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	b _0800DB4E
	.align 2, 0
_0800DB28: .4byte 0x0202BBF8
_0800DB2C:
	adds r0, r4, #0
	bl ApplyMapChange
	cmp r5, #0
	beq _0800DB3C
	subs r0, r4, #1
	bl RemoveMapChangeTrap
_0800DB3C:
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
	bl RefreshAutoWaterShadows
_0800DB4E:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
