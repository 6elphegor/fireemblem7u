	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattleWaitBattleQuote
EkrBattleWaitBattleQuote: @ 0x0804B52C
	push {r4, lr}
	adds r4, r0, #0
	bl IsEventRunning
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804B566
	bl EfxPrepareScreenFx
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #0
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	bl DisableEkrGauge
	bl UnAsyncEkrDispUP
	bl EkrGauge_0804CC28
	ldr r0, _0804B56C @ =EkrBattleWaitWindowAppear
	str r0, [r4, #0xc]
_0804B566:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B56C: .4byte EkrBattleWaitWindowAppear
