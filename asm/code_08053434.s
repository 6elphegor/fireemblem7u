	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBattleUnscriptted
SetBattleUnscriptted: @ 0x08053434
	ldr r1, _0805343C @ =0x0203E0EC
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_0805343C: .4byte 0x0203E0EC
