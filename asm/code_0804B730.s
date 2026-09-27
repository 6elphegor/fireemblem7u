	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBattleWaitTriangleIdle
ekrBattleWaitTriangleIdle: @ 0x0804B730
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrTriangleInvalid
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804B74C
	bl nullsub_10
	movs r0, #0x1e
	strh r0, [r4, #0x2c]
	ldr r0, _0804B754 @ =ekrBattleTriggerNewRoundStart
	str r0, [r4, #0xc]
_0804B74C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B754: .4byte ekrBattleTriggerNewRoundStart
