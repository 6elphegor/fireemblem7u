	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattleWaitPopup
EkrBattleWaitPopup: @ 0x0804BF88
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrPopupDone
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804BFA0
	bl EndEkrPopup
	ldr r0, _0804BFA8 @ =EkrBattlePrepareEnding
	str r0, [r4, #0xc]
_0804BFA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BFA8: .4byte EkrBattlePrepareEnding
