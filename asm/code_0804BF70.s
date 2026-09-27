	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattleExecPopup
EkrBattleExecPopup: @ 0x0804BF70
	push {r4, lr}
	adds r4, r0, #0
	bl NewEkrPopup
	ldr r0, _0804BF84 @ =EkrBattleWaitPopup
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF84: .4byte EkrBattleWaitPopup
