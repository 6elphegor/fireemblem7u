	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08066544
sub_08066544: @ 0x08066544
	push {lr}
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
