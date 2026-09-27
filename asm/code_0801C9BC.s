	.include "macro.inc"

	.syntax unified

	thumb_func_start PlayerPhase_BackToMove
PlayerPhase_BackToMove: @ 0x0801C9BC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0801CA04 @ =0x03004690
	ldr r1, [r4]
	ldr r2, _0801CA08 @ =0x0202BD4C
	ldrh r0, [r2]
	strb r0, [r1, #0x10]
	ldr r1, [r4]
	ldrh r0, [r2, #2]
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	bl UnitSyncMovement
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	ldr r4, [r4]
	ldr r0, [r4, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801CA0C
	adds r0, r4, #0
	bl UnitBeginAction
	b _0801CA12
	.align 2, 0
_0801CA04: .4byte 0x03004690
_0801CA08: .4byte 0x0202BD4C
_0801CA0C:
	adds r0, r4, #0
	bl UnitBeginCantoAction
_0801CA12:
	ldr r4, _0801CA34 @ =0x03004690
	ldr r0, [r4]
	bl HideUnitSprite
	bl EndAllMus
	ldr r0, [r4]
	bl StartMu
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801CA34: .4byte 0x03004690
