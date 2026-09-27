	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrBattleStarting
NewEkrBattleStarting: @ 0x08050AAC
	push {lr}
	ldr r0, _08050ABC @ =0x08B9B004
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08050ABC: .4byte 0x08B9B004
