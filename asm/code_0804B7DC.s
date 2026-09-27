	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBattle_80503EC
ekrBattle_80503EC: @ 0x0804B7DC
	ldr r2, _0804B7E8 @ =0x02000024
	movs r1, #0
	str r1, [r2]
	ldr r1, _0804B7EC @ =ekrBattle_StartPromotion
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0804B7E8: .4byte 0x02000024
_0804B7EC: .4byte ekrBattle_StartPromotion
