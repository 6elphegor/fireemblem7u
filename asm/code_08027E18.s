	.include "macro.inc"

	.syntax unified

	thumb_func_start AttackStaffMapSelect_SwitchIn
AttackStaffMapSelect_SwitchIn: @ 0x08027E18
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r0, _08027E54 @ =0x03004690
	ldr r5, [r0]
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetOffensiveStaffAccuracy
	adds r1, r0, #0
	adds r0, r6, #0
	bl RefreshUnitStaffOffenseInfoWindow
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08027E54: .4byte 0x03004690
