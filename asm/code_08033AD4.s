	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawBattleForecastContents
DrawBattleForecastContents: @ 0x08033AD4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	str r1, [r4, #0x2c]
	adds r0, #0x34
	strb r1, [r0]
	subs r0, #2
	ldrb r0, [r0]
	cmp r0, #1
	beq _08033AEE
	cmp r0, #2
	beq _08033AFC
	b _08033B08
_08033AEE:
	adds r0, r4, #0
	bl InitBattleForecastBattleStats
	adds r0, r4, #0
	bl DrawBattleForecastContentsStandard
	b _08033B08
_08033AFC:
	adds r0, r4, #0
	bl InitBattleForecastBattleStats
	adds r0, r4, #0
	bl DrawBattleForecastContentsExtended
_08033B08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
