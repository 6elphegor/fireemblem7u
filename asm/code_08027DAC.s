	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08027DAC
sub_08027DAC: @ 0x08027DAC
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl RefreshUnitResChangeInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
