	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleApplyMiscAction
BattleApplyMiscAction: @ 0x0802A5D0
	push {r4, lr}
	adds r4, r0, #0
	bl BattleApplyMiscActionExpGains
	ldr r0, _0802A5E8 @ =0x08B942A0
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A5E8: .4byte 0x08B942A0
