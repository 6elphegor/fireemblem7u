	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrBattleDeamon
NewEkrBattleDeamon: @ 0x0804B1AC
	push {r4, lr}
	ldr r4, _0804B1CC @ =0x0203E004
	ldr r0, _0804B1D0 @ =0x08B9A99C
	movs r1, #3
	bl Proc_Start
	str r0, [r4]
	ldr r1, _0804B1D4 @ =0x0203E000
	movs r0, #1
	str r0, [r1]
	bl LockGame
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B1CC: .4byte 0x0203E004
_0804B1D0: .4byte 0x08B9A99C
_0804B1D4: .4byte 0x0203E000
