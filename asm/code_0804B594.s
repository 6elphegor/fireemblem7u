	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattlePreDragonIntro
EkrBattlePreDragonIntro: @ 0x0804B594
	ldr r1, _0804B5A8 @ =0x0203E00C
	movs r2, #0
	ldrsh r1, [r1, r2]
	str r1, [r0, #0x44]
	movs r1, #0
	str r1, [r0, #0x48]
	ldr r1, _0804B5AC @ =EkrBattleExecDragonIntro
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0804B5A8: .4byte 0x0203E00C
_0804B5AC: .4byte EkrBattleExecDragonIntro
