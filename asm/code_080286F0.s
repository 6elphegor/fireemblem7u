	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBattleUnitTerrainBonuses
SetBattleUnitTerrainBonuses: @ 0x080286F0
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x55
	strb r1, [r3]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x44]
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x57
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x48]
	ldrb r1, [r3]
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x56
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x4c]
	ldrb r3, [r3]
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x58
	strb r1, [r0]
	bx lr
