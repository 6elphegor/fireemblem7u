	.include "macro.inc"

	.syntax unified

	thumb_func_start SetScriptedBattle
SetScriptedBattle: @ 0x0802A830
	ldr r1, _0802A838 @ =0x0203A85C
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0802A838: .4byte 0x0203A85C
