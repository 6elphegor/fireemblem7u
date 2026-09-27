	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitAttackCommandAvailability
GetUnitAttackCommandAvailability: @ 0x0802357C
	push {r4, r5, r6, lr}
	ldr r0, _08023598 @ =0x03004690
	ldr r1, [r0]
	ldr r2, [r1, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080235EC
	movs r0, #0x80
	lsls r0, r0, #4
	ands r2, r0
	cmp r2, #0
	beq _080235A0
	b _080235EC
	.align 2, 0
_08023598: .4byte 0x03004690
_0802359C:
	movs r0, #1
	b _080235EE
_080235A0:
	movs r6, #0
	ldrh r4, [r1, #0x1e]
	cmp r4, #0
	beq _080235EC
_080235A8:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080235D6
	ldr r5, _080235F4 @ =0x03004690
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeaponNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080235D6
	ldr r0, [r5]
	adds r1, r4, #0
	bl ListAttackTargetsForWeapon
	bl CountTargets
	cmp r0, #0
	bne _0802359C
_080235D6:
	adds r6, #1
	cmp r6, #4
	bgt _080235EC
	ldr r0, _080235F4 @ =0x03004690
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080235A8
_080235EC:
	movs r0, #3
_080235EE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080235F4: .4byte 0x03004690
