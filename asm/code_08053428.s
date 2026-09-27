	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBattleScriptted
SetBattleScriptted: @ 0x08053428
	ldr r1, _08053430 @ =0x0203E0EC
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08053430: .4byte 0x0203E0EC
