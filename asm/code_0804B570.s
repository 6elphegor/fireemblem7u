	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattleWaitWindowAppear
EkrBattleWaitWindowAppear: @ 0x0804B570
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804B588
	ldr r0, _0804B590 @ =EkrBattlePreDragonIntro
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x2c]
_0804B588:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B590: .4byte EkrBattlePreDragonIntro
