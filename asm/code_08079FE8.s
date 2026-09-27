	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079FE8
sub_08079FE8: @ 0x08079FE8
	push {lr}
	bl AreAnyEnemyUnitDead
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079FF8
	movs r1, #1
_08079FF8:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
