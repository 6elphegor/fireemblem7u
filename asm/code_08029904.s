	.include "macro.inc"

	.syntax unified

	thumb_func_start GenerateBattleUnitStatGainsComparatively
GenerateBattleUnitStatGainsComparatively: @ 0x08029904
	push {r4, lr}
	adds r3, r0, #0
	ldrb r2, [r3, #0x12]
	ldrb r4, [r1, #0x12]
	subs r0, r2, r4
	adds r2, r3, #0
	adds r2, #0x73
	strb r0, [r2]
	ldrb r0, [r3, #0x14]
	ldrb r4, [r1, #0x14]
	subs r2, r0, r4
	adds r0, r3, #0
	adds r0, #0x74
	strb r2, [r0]
	ldrb r2, [r3, #0x15]
	ldrb r4, [r1, #0x15]
	subs r0, r2, r4
	adds r2, r3, #0
	adds r2, #0x75
	strb r0, [r2]
	ldrb r2, [r3, #0x16]
	ldrb r4, [r1, #0x16]
	subs r0, r2, r4
	adds r2, r3, #0
	adds r2, #0x76
	strb r0, [r2]
	ldrb r2, [r3, #0x17]
	ldrb r4, [r1, #0x17]
	subs r0, r2, r4
	adds r2, r3, #0
	adds r2, #0x77
	strb r0, [r2]
	ldrb r0, [r3, #0x18]
	ldrb r4, [r1, #0x18]
	subs r2, r0, r4
	adds r0, r3, #0
	adds r0, #0x78
	strb r2, [r0]
	ldrb r2, [r3, #0x19]
	ldrb r4, [r1, #0x19]
	subs r0, r2, r4
	adds r2, r3, #0
	adds r2, #0x79
	strb r0, [r2]
	ldrb r0, [r3, #0x1a]
	ldrb r1, [r1, #0x1a]
	subs r1, r0, r1
	adds r0, r3, #0
	adds r0, #0x7a
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
