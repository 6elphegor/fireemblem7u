	.include "macro.inc"

	.syntax unified

	thumb_func_start KillUnitOnArenaDeathMaybe
KillUnitOnArenaDeathMaybe: @ 0x0802F838
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0802F856
	adds r0, r4, #0
	bl UnitKill
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	movs r2, #6
	bl PidStatsRecordDefeatInfo
_0802F856:
	pop {r4}
	pop {r0}
	bx r0
