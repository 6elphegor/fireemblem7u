	.include "macro.inc"

	.syntax unified

	thumb_func_start EventCall_NinianReturnToHuman
EventCall_NinianReturnToHuman: @ 0x0807D908
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D93E
	movs r0, #0xda
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl NinianStartTransformToHunman
	adds r0, r4, #0
	bl ClearUnit
	bl RefreshUnitSprites
	bl RefreshEntityMaps
_0807D93E:
	pop {r4, r5}
	pop {r0}
	bx r0
