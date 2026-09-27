	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsGetTotalBattleAmt
PidStatsGetTotalBattleAmt: @ 0x080A0124
	push {r4, lr}
	movs r3, #0
	ldr r2, _080A0144 @ =0x0203E7A0
	movs r1, #0x45
_080A012C:
	ldrh r4, [r2, #0xc]
	lsls r0, r4, #0x12
	lsrs r0, r0, #0x14
	adds r3, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A012C
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A0144: .4byte 0x0203E7A0
