	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattleWaitDragonIntro
EkrBattleWaitDragonIntro: @ 0x0804B620
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl EkrDragonIntroDone
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804B636
	ldr r0, _0804B63C @ =EkrBattleExecDragonIntro
	str r0, [r4, #0xc]
_0804B636:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B63C: .4byte EkrBattleExecDragonIntro
