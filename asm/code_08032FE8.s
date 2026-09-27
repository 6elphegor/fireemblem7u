	.include "macro.inc"

	.syntax unified

	thumb_func_start PoisonDamageDisplay_Display
PoisonDamageDisplay_Display: @ 0x08032FE8
	push {r4, r5, lr}
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r4, r0, #0
	bl HideUnitSprite
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	bl BeginUnitPoisonDamageAnim
	pop {r4, r5}
	pop {r0}
	bx r0
