	.include "macro.inc"

	.syntax unified

	thumb_func_start TerrainHealDisplay_Next
TerrainHealDisplay_Next: @ 0x08032F64
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _08032F92
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0
	bl ApplyHazardHealing
	b _08032FA0
_08032F92:
	movs r2, #3
	ldrsb r2, [r4, r2]
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r5, #0
	bl ApplyHazardHealing
_08032FA0:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
