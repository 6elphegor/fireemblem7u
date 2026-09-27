	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBattleOnBattleEnd
ekrBattleOnBattleEnd: @ 0x0804B954
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	ldr r1, _0804B964 @ =ekrBattle_8050600
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0804B964: .4byte ekrBattle_8050600
