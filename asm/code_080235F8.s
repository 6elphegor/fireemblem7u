	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitAttackBallistaCommandAvailability
GetUnitAttackBallistaCommandAvailability: @ 0x080235F8
	push {r4, r5, lr}
	ldr r5, _0802363C @ =0x03004690
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08023638
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	adds r4, r0, #0
	bl sub_080347E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023638
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #1
	ldrb r2, [r4, #3]
	orrs r1, r2
	bl ListAttackTargetsForWeapon
	bl CountTargets
	cmp r0, #0
	bne _08023640
_08023638:
	movs r0, #3
	b _08023650
	.align 2, 0
_0802363C: .4byte 0x03004690
_08023640:
	adds r0, r4, #0
	bl sub_0803483C
	cmp r0, #0
	beq _0802364E
	movs r0, #1
	b _08023650
_0802364E:
	movs r0, #2
_08023650:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
