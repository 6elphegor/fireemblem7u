	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805125C
sub_0805125C: @ 0x0805125C
	push {r4, lr}
	adds r4, r0, #0
	bl EndEkrBattleDeamon
	bl RefreshBMapDisplay_FromBattle
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
