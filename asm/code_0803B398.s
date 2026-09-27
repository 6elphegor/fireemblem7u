	.include "macro.inc"

	.syntax unified

	thumb_func_start GetAiSilenceEffectivenessScore
GetAiSilenceEffectivenessScore: @ 0x0803B398
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0803B3B4 @ =0x03004690
	ldr r0, [r0]
	adds r1, r5, #0
	bl GetOffensiveStaffAccuracy
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _0803B3B8
	movs r0, #0
	b _0803B3E4
	.align 2, 0
_0803B3B4: .4byte 0x03004690
_0803B3B8:
	adds r0, r5, #0
	bl GetUnitPower
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0803B3E2
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0803B3E2
	lsls r0, r4, #0x19
	lsrs r4, r0, #0x18
_0803B3E2:
	adds r0, r4, #0
_0803B3E4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
