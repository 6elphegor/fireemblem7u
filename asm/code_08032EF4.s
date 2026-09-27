	.include "macro.inc"

	.syntax unified

	thumb_func_start TerrainHealDisplay_Display
TerrainHealDisplay_Display: @ 0x08032EF4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r4, r0, #0
	movs r0, #3
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _08032F20
	adds r0, r4, #0
	adds r1, r6, #0
	bl StartStatusHealEffect
	b _08032F30
_08032F20:
	adds r0, r4, #0
	bl HideUnitSprite
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	bl BeginUnitHealAnim
_08032F30:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
