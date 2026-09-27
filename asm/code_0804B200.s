	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattleDeamon_OnEnd
EkrBattleDeamon_OnEnd: @ 0x0804B200
	push {lr}
	ldr r1, _0804B210 @ =0x0203E000
	movs r0, #0
	str r0, [r1]
	bl UnlockGame
	pop {r0}
	bx r0
	.align 2, 0
_0804B210: .4byte 0x0203E000
