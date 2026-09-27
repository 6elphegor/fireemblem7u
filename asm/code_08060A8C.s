	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060A8C
sub_08060A8C: @ 0x08060A8C
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08060AA4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_08060AA4: .4byte 0x0201774C
