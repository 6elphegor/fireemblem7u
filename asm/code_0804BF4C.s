	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattleWaitLvup
EkrBattleWaitLvup: @ 0x0804BF4C
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrLvupDone
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804BF64
	bl EndEkrLevelUp
	ldr r0, _0804BF6C @ =EkrBattleExecPopup
	str r0, [r4, #0xc]
_0804BF64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF6C: .4byte EkrBattleExecPopup
