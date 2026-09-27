	.include "macro.inc"

	.syntax unified

	thumb_func_start SpellFx_SetBG1Position
SpellFx_SetBG1Position: @ 0x08050008
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0
