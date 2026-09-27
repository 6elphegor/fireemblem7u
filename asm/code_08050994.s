	.include "macro.inc"

	.syntax unified

	thumb_func_start SetupBanim
SetupBanim: @ 0x08050994
	push {lr}
	bl PrepareBattleGraphicsMaybe
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
