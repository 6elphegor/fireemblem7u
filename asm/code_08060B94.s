	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060B94
sub_08060B94: @ 0x08060B94
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08060BAC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_08060BAC: .4byte 0x0201774C
