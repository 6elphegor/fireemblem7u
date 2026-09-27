	.include "macro.inc"

	.syntax unified

	thumb_func_start KillUnitOnCombatDeath
KillUnitOnCombatDeath: @ 0x0802F808
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0802F830
	ldr r0, [r4]
	ldrb r1, [r0, #4]
	cmp r1, #0x86
	beq _0802F830
	ldrb r0, [r0, #4]
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	movs r2, #2
	bl PidStatsRecordDefeatInfo
	adds r0, r4, #0
	bl UnitKill
_0802F830:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
