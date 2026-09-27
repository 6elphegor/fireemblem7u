	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsSubFavval100
PidStatsSubFavval100: @ 0x080A0110
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080A0120 @ =0xFFFFFF00
	bl PidStatsAddFavval
	pop {r0}
	bx r0
	.align 2, 0
_080A0120: .4byte 0xFFFFFF00
