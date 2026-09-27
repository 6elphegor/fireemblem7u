	.include "macro.inc"

	.syntax unified

	thumb_func_start GetGameWinPerc
GetGameWinPerc: @ 0x080B67D0
	push {r4, lr}
	bl PidStatsGetTotalBattleAmt
	adds r4, r0, #0
	bl PidStatsGetTotalWinAmt
	movs r1, #0x64
	muls r0, r1, r0
	adds r1, r4, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
