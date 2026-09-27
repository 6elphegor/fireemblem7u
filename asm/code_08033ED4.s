	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleForecast_OnNewBattle
BattleForecast_OnNewBattle: @ 0x08033ED4
	push {r4, lr}
	adds r4, r0, #0
	bl DrawBattleForecastContents
	bl GetBattleForecastPanelSide
	adds r1, r4, #0
	adds r1, #0x35
	movs r2, #0
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x36
	strb r2, [r0]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08033EFE
	adds r0, r4, #0
	adds r0, #0x30
	strb r2, [r0]
	b _08033F06
_08033EFE:
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0x14
	strb r0, [r1]
_08033F06:
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	bl InitBattleForecastFramePalettes
	pop {r4}
	pop {r0}
	bx r0
