	.include "macro.inc"

	.syntax unified

	thumb_func_start AiEndMuAndRefreshUnits
AiEndMuAndRefreshUnits: @ 0x0803523C
	push {r4, r5, lr}
	ldr r0, _08035288 @ =0x0203A85C
	ldrb r0, [r0, #0xc]
	bl GetUnit
	ldr r5, _0803528C @ =0x03004690
	str r0, [r5]
	ldr r4, _08035290 @ =0x0203A97C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl SetMapCursorPosition
	bl RenderMapForFade
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl MoveActiveUnit
	bl RefreshEntityMaps
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	bl EndAllMus
	bl RefreshEntityMaps
	ldr r0, [r5]
	bl ShowUnitSprite
	bl RefreshUnitSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08035288: .4byte 0x0203A85C
_0803528C: .4byte 0x03004690
_08035290: .4byte 0x0203A97C
