	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateObstacleFromBattle
UpdateObstacleFromBattle: @ 0x0802A314
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl GetTrapAt
	adds r5, r0, #0
	cmp r5, #0
	bne _0802A33A
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	subs r1, #1
	bl GetTrapAt
	adds r5, r0, #0
_0802A33A:
	ldrb r0, [r4, #0x13]
	strb r0, [r5, #3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802A39C
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	bl GetMapChangeIdAt
	adds r6, r0, #0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _0802A3A4 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x33
	bne _0802A37A
	ldr r0, _0802A3A8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802A37A
	ldr r0, _0802A3AC @ =0x000002D7
	bl m4aSongNumStart
_0802A37A:
	bl RenderMapForFade
	adds r0, r6, #0
	bl ApplyMapChange
	movs r0, #0
	strb r0, [r5, #2]
	adds r0, r6, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl RenderMap
	movs r0, #0
	bl StartMapFade
_0802A39C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A3A4: .4byte 0x0202E3E0
_0802A3A8: .4byte 0x0202BBF8
_0802A3AC: .4byte 0x000002D7
