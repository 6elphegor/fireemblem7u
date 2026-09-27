	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsSubFavval08
PidStatsSubFavval08: @ 0x080A00FC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #8
	rsbs r1, r1, #0
	bl PidStatsAddFavval
	pop {r0}
	bx r0
	.align 2, 0
