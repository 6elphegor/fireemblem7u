	.include "macro.inc"

	.syntax unified

	thumb_func_start ManimShouldBuDisplayWeaponLevelGained
ManimShouldBuDisplayWeaponLevelGained: @ 0x0806E428
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0806E452
	ldr r0, [r7]
	bl HasBattleUnitGainedWeaponLevel
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E452
	movs r0, #1
	b _0806E456
_0806E452:
	movs r0, #0
	b _0806E456
_0806E456:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
