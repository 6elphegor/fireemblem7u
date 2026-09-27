	.include "macro.inc"

	.syntax unified

	thumb_func_start ExecBattleAnimArenaExit
ExecBattleAnimArenaExit: @ 0x08055594
	push {lr}
	bl AnimClearAll
	bl NewEkrTogiEndPROC
	ldr r0, _080555A8 @ =MainUpdate_8055C68
	bl SetMainFunc
	pop {r0}
	bx r0
	.align 2, 0
_080555A8: .4byte MainUpdate_8055C68
