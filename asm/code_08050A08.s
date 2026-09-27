	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattleEndRountine
EkrBattleEndRountine: @ 0x08050A08
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _08050A18
	bl ExecBattleAnimArenaExit
	b _08050A30
_08050A18:
	bl CheckBanimHensei
	cmp r0, #1
	bne _08050A26
	bl ExecEkrHenseiEnd
	b _08050A30
_08050A26:
	bl NewEkrbattleending
	ldr r0, _08050A34 @ =MainUpdate_8055C68
	bl SetMainFunc
_08050A30:
	pop {r0}
	bx r0
	.align 2, 0
_08050A34: .4byte MainUpdate_8055C68
