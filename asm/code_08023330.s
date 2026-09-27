	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08023330
sub_08023330: @ 0x08023330
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
	bl RefreshUnitGiveInfoWindows
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
