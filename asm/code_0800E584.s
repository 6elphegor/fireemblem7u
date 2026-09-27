	.include "macro.inc"

	.syntax unified

	thumb_func_start Event80_CompleteGame
Event80_CompleteGame: @ 0x0800E584
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #2
	bl SetNextGameAction
	adds r0, r4, #0
	bl EventEndBattleMap
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
