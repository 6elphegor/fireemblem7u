	.include "macro.inc"

	.syntax unified

	thumb_func_start PlayerPhase_FinishAction
PlayerPhase_FinishAction: @ 0x0801CC90
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0801CCC0 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801CCC8
	bl RenderMapForFade
	ldr r1, _0801CCC4 @ =0x0203A85C
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl MoveActiveUnit
	bl RefreshEntityMaps
	bl RenderMap
	movs r0, #0
	bl StartMapFade
	bl RefreshUnitSprites
	b _0801CCDA
	.align 2, 0
_0801CCC0: .4byte 0x0202BBF8
_0801CCC4: .4byte 0x0203A85C
_0801CCC8:
	ldr r1, _0801CD0C @ =0x0203A85C
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl MoveActiveUnit
	bl RefreshEntityMaps
	bl RenderMap
_0801CCDA:
	ldr r4, _0801CD10 @ =0x03004690
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
	ldr r2, _0801CD14 @ =0x0202BBF8
	ldr r1, _0801CD18 @ =0x0202BBB8
	ldrh r0, [r1, #0x14]
	strb r0, [r2, #0x12]
	ldrh r0, [r1, #0x16]
	strb r0, [r2, #0x13]
	adds r0, r5, #0
	bl TryMakeCantoUnit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801CD1C
	ldr r0, [r4]
	bl HideUnitSprite
	b _0801CD48
	.align 2, 0
_0801CD0C: .4byte 0x0203A85C
_0801CD10: .4byte 0x03004690
_0801CD14: .4byte 0x0202BBF8
_0801CD18: .4byte 0x0202BBB8
_0801CD1C:
	bl ShouldCallEndEvent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801CD44
	bl EndAllMus
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl MaybeCallEndEvent_
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _0801CD48
_0801CD44:
	bl EndAllMus
_0801CD48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
