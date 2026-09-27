	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleForecastHitCountUpdate
BattleForecastHitCountUpdate: @ 0x080334E8
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, [r2]
	cmp r0, #0
	ble _08033516
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r0, [r2]
	subs r0, #1
	str r0, [r2]
	ldr r0, [r4, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08033516
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r0, [r2]
	subs r0, #1
	str r0, [r2]
_08033516:
	pop {r4}
	pop {r0}
	bx r0
