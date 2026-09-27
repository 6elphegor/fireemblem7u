	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyTrapDamageReal
ApplyTrapDamageReal: @ 0x08034374
	push {r4, r5, r6, lr}
	ldr r4, [r0, #0x54]
	movs r2, #0xa
	rsbs r2, r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	adds r1, r4, #0
	bl ApplyHazardHealing
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080343B2
	ldr r5, _080343B8 @ =0x03004690
	ldr r6, [r5]
	str r4, [r5]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	movs r2, #3
	bl PidStatsRecordDefeatInfo
	bl CheckForWaitEvents
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080343B0
	bl RunWaitEvents
_080343B0:
	str r6, [r5]
_080343B2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080343B8: .4byte 0x03004690
