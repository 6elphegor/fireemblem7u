	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBattle_WaitPromotionIdle
ekrBattle_WaitPromotionIdle: @ 0x0804B82C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl EkrClasschgFinished
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0804B848
	bl EndEkrClasschg
	ldr r0, _0804B850 @ =0x0203E0D4
	strh r4, [r0]
	ldr r0, _0804B854 @ =EkrBattleExecEkrLvup
	str r0, [r5, #0xc]
_0804B848:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B850: .4byte 0x0203E0D4
_0804B854: .4byte EkrBattleExecEkrLvup
