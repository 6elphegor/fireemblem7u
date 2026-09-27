	.include "macro.inc"

	.syntax unified

	thumb_func_start RegisterTrapDeathBWL
RegisterTrapDeathBWL: @ 0x080342C8
	push {r4, lr}
	ldr r4, [r0, #0x54]
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0xa
	bgt _080342DE
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl PidStatsRecordLoseData
_080342DE:
	pop {r4}
	pop {r0}
	bx r0
