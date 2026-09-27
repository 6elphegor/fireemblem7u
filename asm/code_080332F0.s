	.include "macro.inc"

	.syntax unified

	thumb_func_start TrapDamageDisplay_Next
TrapDamageDisplay_Next: @ 0x080332F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #5
	bgt _08033322
	adds r2, r0, #0
	rsbs r2, r2, #0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #1
	bl ApplyHazardHealing
	b _08033334
_08033322:
	movs r2, #3
	ldrsb r2, [r4, r2]
	rsbs r2, r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl ApplyHazardHealing
_08033334:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt _08033342
	bl RefreshUnitSprites
_08033342:
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
