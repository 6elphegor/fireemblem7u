	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyHazardHealing
ApplyHazardHealing: @ 0x080327FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	cmp r1, #0
	blt _08032810
	adds r0, r4, #0
	bl SetUnitStatus
_08032810:
	adds r0, r4, #0
	adds r1, r5, #0
	bl AddUnitHp
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt _08032828
	adds r0, r4, #0
	bl UnitKill
_08032828:
	adds r0, r6, #0
	adds r1, r4, #0
	bl DropRescueOnDeath
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
