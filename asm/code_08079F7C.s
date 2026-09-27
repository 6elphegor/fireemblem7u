	.include "macro.inc"

	.syntax unified

	thumb_func_start AreAnyEnemyUnitDead
AreAnyEnemyUnitDead: @ 0x08079F7C
	push {r4, lr}
	movs r4, #0x81
_08079F80:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08079FA0
	ldr r0, [r1]
	cmp r0, #0
	beq _08079FA0
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08079FA0
	movs r0, #1
	b _08079FA8
_08079FA0:
	adds r4, #1
	cmp r4, #0xbf
	ble _08079F80
	movs r0, #0
_08079FA8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
