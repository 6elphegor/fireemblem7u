	.include "macro.inc"

	.syntax unified

	thumb_func_start ManimShouldBuDisplayWeaponBroke
ManimShouldBuDisplayWeaponBroke: @ 0x0806E398
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
	bne _0806E3BE
	ldr r0, [r7]
	bl DidBattleUnitBreakWeapon
	lsls r2, r0, #0x18
	asrs r1, r2, #0x18
	adds r0, r1, #0
	b _0806E3C2
_0806E3BE:
	movs r0, #0
	b _0806E3C2
_0806E3C2:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
