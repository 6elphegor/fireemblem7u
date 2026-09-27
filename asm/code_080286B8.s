	.include "macro.inc"

	.syntax unified

	thumb_func_start InitBattleUnitWithoutBonuses
InitBattleUnitWithoutBonuses: @ 0x080286B8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl InitBattleUnit
	ldrb r0, [r4, #0x12]
	strb r0, [r5, #0x12]
	ldrb r0, [r4, #0x14]
	strb r0, [r5, #0x14]
	ldrb r0, [r4, #0x15]
	strb r0, [r5, #0x15]
	ldrb r0, [r4, #0x16]
	strb r0, [r5, #0x16]
	ldrb r0, [r4, #0x17]
	strb r0, [r5, #0x17]
	ldrb r0, [r4, #0x19]
	strb r0, [r5, #0x19]
	ldrb r0, [r4, #0x18]
	strb r0, [r5, #0x18]
	ldr r1, [r4, #4]
	ldr r0, [r4]
	ldrb r1, [r1, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r1, r0
	strb r0, [r5, #0x1a]
	pop {r4, r5}
	pop {r0}
	bx r0
